import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/multi_nutzenlayout_state.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/nutzenlayout_metrics_state.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/selected_artworks_for_multi_nutzenlayout.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_laufrichtung_button.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_matrix_list_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'pages/add_multi_nutzenlayout_designer_page.dart';
part 'pages/add_multi_nutzenlayout_select_artworks_page.dart';
part 'pages/add_multi_nutzenlayout_select_existing_nutzenlayout_page.dart';
part 'pages/add_multi_nutzenlayout_select_metrics_page.dart';

// Widget to add/create a single nutzenlayout to the sales order and attach
// artworks to it
class AddSammelformaufbauDialog extends HookConsumerWidget {
  const AddSammelformaufbauDialog({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    required this.salesOrderId,
    required this.sessionId,
    required this.customerId,
    this.artworkId,
    super.key,
  });
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;
  final int salesOrderId;
  final String sessionId;
  final int customerId;
  final int? artworkId;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    // we are mounting the state providers top level of the dialog to keep
    // them the whole dialog session alive
    ref
      ..listen(multiNutzenLayoutStateProvider(sessionId), (previous, next) {})
      ..listen(
        nutzenLayoutMetricsStateProvider(sessionId),
        (previous, next) {},
      )
      ..listen(
        selectedExistingMultiNutzenlayoutStateProvider(sessionId),
        (previous, next) {},
      );

    final pageController = usePageController();
    final presetFormKey = useFormKey();
    final isSaving = useValueNotifier<bool>(false);

    final onContinue = useCallback(
      () async {
        final currentPage = pageController.page;

        // select artworks page
        if (currentPage == 0) {
          // check if artworks are selected
          final hasSelectedArtworks = ref.read(
            selectedArtworksForSammelformaufbauProvider(sessionId),
          );
          if (hasSelectedArtworks.isEmpty) {
            // don't continue if no artworks are selected
            return;
          } else {
            await pageController.nextPage(
              duration: AnimationConstants.shortDuration,
              curve: Curves.easeInOut,
            );
          }
          return;
        }
        if (currentPage == 1) {
          // check if artworks are selected
          ref
              .read(
                selectedExistingMultiNutzenlayoutStateProvider(sessionId)
                    .notifier,
              )
              .clearSelectedNutzenlayout();
          await pageController.nextPage(
            duration: AnimationConstants.shortDuration,
            curve: Curves.easeInOut,
          );

          return;
        }

        // select previous nutzenlayout page

        // presets page
        if (currentPage == 2) {
          // validate preset form
          final isValid = presetFormKey.currentState!.validate();
          if (!isValid) {
            return;
          } else {
            // we are initializing the new nutzenlayout with the presets
            // values
            final selectedArtworks = ref.read(
              selectedArtworksForSammelformaufbauProvider(
                sessionId,
              ),
            );
            final metrics = ref.read(
              nutzenLayoutMetricsStateProvider(sessionId),
            );
            final firstArtwork = selectedArtworks.first;
            final artworkWidth = firstArtwork.artwork.width;
            final artworkHeight = firstArtwork.artwork.height;
            final laufrichtung = metrics.laufrichtung;

            // check if height matches drucklaenge
            final artworkRotatedHeight =
                laufrichtung == NutzenlayoutLaufrichtung.footForward ||
                        laufrichtung == NutzenlayoutLaufrichtung.headForward
                    ? artworkHeight
                    : artworkWidth;

            final sumArtworkHeight =
                metrics.nutzenProReihe * artworkRotatedHeight;

            if (sumArtworkHeight > metrics.drucklaenge) {
              AppNotificationOverlay.error(
                context,
                'Die Höhe der Nutzen überschreitet die Drucklänge'.hc,
              );
              return;
            }
            ref
                .read(
                  multiNutzenLayoutStateProvider(sessionId).notifier,
                )
                .initialize(
                  customerId: customerId,
                  metrics: metrics,
                  artworkWidth: artworkWidth,
                  artworkHeight: artworkHeight,
                  firstArtwork: firstArtwork.artwork,
                );

            await pageController.nextPage(
              duration: AnimationConstants.shortDuration,
              curve: Curves.easeInOut,
            );
            return;
          }
        }
        if (currentPage == 3) {
          // designer page
          // safe the nutzenlayout and pop
          final nutzenlayout =
              ref.read(multiNutzenLayoutStateProvider(sessionId));

          final selectedArtworks = ref.read(
            selectedArtworksForSammelformaufbauProvider(sessionId),
          );

          // check if every artwork from the selected artworks is in the nutzenlayout
          final artworkIds = selectedArtworks.map((e) => e.artwork.id).toSet();
          final nutzenlayoutArtworkIds = nutzenlayout.columns
              .expand((e) => e.cells.map((e) => e.artworkId))
              .toSet();
          if (artworkIds.difference(nutzenlayoutArtworkIds).isNotEmpty) {
            AppNotificationOverlay.error(
              context,
              'Alle Artworks müssen im Nutzenlayout enthalten sein'.hc,
            );
            return;
          }

          // check if every cell has a artwork id
          final cellsWithoutArtworkId = nutzenlayout.columns
              .expand((e) => e.cells.where((e) => e.artworkId == null))
              .toList();
          if (cellsWithoutArtworkId.isNotEmpty) {
            AppNotificationOverlay.error(
              context,
              'Alle Zellen müssen ein Artwork zugewiesen haben'.hc,
            );
            return;
          }

          // final artworkIds = selectedArtworks.map((e) => e.artworkId).toSet();

          isSaving.value = true;
          final dimensions = selectedArtworks
              .map(
                (e) => NutzenlayoutArtworkDimensions(
                  width: e.artwork.width,
                  height: e.artwork.height,
                ),
              )
              .toSet();

          final isExistingNutzenlayout = ref.read(
                selectedExistingMultiNutzenlayoutStateProvider(sessionId),
              ) !=
              null;

          final result = await AsyncHandler.handleAsyncOperation(
            context,
            () => ref.read(nutzenlayoutRepositoryProvider).createMulti(
                  layout: nutzenlayout,
                  artworkIds:
                      selectedArtworks.map((e) => e.artwork.id!).toSet(),
                  salesOrderId: salesOrderId,
                  dimensions: dimensions,
                  isExistingNutzenlayout: isExistingNutzenlayout,
                ),
            errorNavigatorKey: navigatorKey,
            successMessage: 'Sammelformaufbau erstellt'.hc,
            successNavigatorKey: navigatorKey,
          );
          if (result.success && context.mounted) {
            Navigator.of(context).pop();
            return;
          }
          if (context.mounted) {
            isSaving.value = false;
          }
        }
      },
      [],
    );

    return ElbDialog(
      isSelfScrollable: true,
      onSaveAndCloseShortcut: onContinue,
      maxWidth: 2400,
      title: 'Sammelformaufbau hinzufügen'.hc,
      floatingWindowId: floatingWindowId,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 400,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                _AddMultiNutzenlayoutSelectArtworksPage(
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  customerId: customerId,
                  artworkId: artworkId,
                  navigatorKey: navigatorKey,
                ),
                _AddMultiNutzenlayoutSelectExistingNutzenlayoutPage(
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  customerId: customerId,
                  navigatorKey: navigatorKey,
                  pageController: pageController,
                ),
                Form(
                  key: presetFormKey,
                  child: _AddMultiNutzenlayoutSelectMetricsPage(
                    salesOrderId: salesOrderId,
                    sessionId: sessionId,
                    customerId: customerId,
                    navigatorKey: navigatorKey,
                  ),
                ),
                _AddMultiNutzenlayoutDesignerPage(
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  customerId: customerId,
                  navigatorKey: navigatorKey,
                ),
              ],
            ),
          ),
          const AppDivider(),
          const SizedBox(height: AppSpace.m),
          _PrevAndNextButtons(
            pageController: pageController,
            sessionId: sessionId,
            salesOrderId: salesOrderId,
            customerId: customerId,
            navigatorKey: navigatorKey,
            onContinue: onContinue,
            isSaving: isSaving,
          ),
        ],
      ),
    );
  }
}

class _PrevAndNextButtons extends HookConsumerWidget {
  const _PrevAndNextButtons({
    required this.pageController,
    required this.sessionId,
    required this.salesOrderId,
    required this.customerId,
    required this.navigatorKey,
    required this.onContinue,
    required this.isSaving,
  });
  final PageController pageController;
  final String sessionId;
  final int salesOrderId;
  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final VoidCallback onContinue;
  final ValueNotifier<bool> isSaving;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final currentPage = useState<int>(pageController.page?.toInt() ?? 0);
    useValueListenable(isSaving);
    useEffect(
      () {
        pageController.addListener(() {
          currentPage.value = pageController.page?.toInt() ?? 0;
        });
        return null;
      },
      [pageController],
    );
    final hasAtLeastTwoArtworks = ref
            .watch(
              selectedArtworksForSammelformaufbauProvider(sessionId),
            )
            .length >=
        2;
    return Padding(
      padding: const EdgeInsets.only(
        right: UiConstants.defaultPadding,
      ),
      child: Row(
        mainAxisAlignment: currentPage.value > 0
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.end,
        children: [
          if (currentPage.value > 0)
            AppButton.secondary(
              onPressed: isSaving.value
                  ? null
                  : () {
                      if (currentPage.value == 3) {
                        final isExistingNutzenlayout = ref.read(
                              selectedExistingMultiNutzenlayoutStateProvider(
                                sessionId,
                              ),
                            ) !=
                            null;
                        if (isExistingNutzenlayout) {
                          pageController.animateToPage(
                            1,
                            duration: AnimationConstants.shortDuration,
                            curve: Curves.easeInOut,
                          );
                          return;
                        }
                      }

                      pageController.previousPage(
                        duration: AnimationConstants.shortDuration,
                        curve: Curves.easeInOut,
                      );
                    },
              label: l10n.gen_back,
            ),
          if (currentPage.value == 1)
            AppButton.primary(
              onPressed: isSaving.value || !hasAtLeastTwoArtworks
                  ? null
                  : () async {
                      onContinue();
                    },
              label: 'Neuer Sammelformaufbau'.hc,
            )
          else if (currentPage.value == 3)
            AppSaveAndCloseButton(
              isLoading: isSaving.value,
              onPressed: isSaving.value ? null : onContinue,
            )
          else
            AppButton.primary(
              onPressed: isSaving.value || !hasAtLeastTwoArtworks
                  ? null
                  : () async {
                      onContinue();
                    },
              label: l10n.gen_next,
            ),
        ],
      ),
    );
  }
}
