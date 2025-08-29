import 'package:collection/collection.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/nutzenlayout_metrics_state.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/selected_artworks_for_single_nutzenlayout.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_laufrichtung_button.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/widgets/nutzenlayout_matrix_list_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'pages/add_single_nutzenlayout_designer_page.dart';
part 'pages/add_single_nutzenlayout_select_artworks_page.dart';
part 'pages/add_single_nutzenlayout_select_existing_nutzenlayout_page.dart';
part 'pages/add_single_nutzenlayout_select_metrics_page.dart';

// Widget to add/create a single nutzenlayout to the sales order and attach
// artworks to it
class AddEinzelformaufbauDialog extends HookConsumerWidget {
  const AddEinzelformaufbauDialog({
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
      ..listen(singleNutzenLayoutStateProvider(sessionId), (previous, next) {})
      ..listen(
        nutzenLayoutMetricsStateProvider(sessionId),
        (previous, next) {},
      );

    final pageController = usePageController();
    final presetFormKey = useFormKey();
    final isSaving = useValueNotifier<bool>(false);

    // whether the list should only show products with artworks that have
    // no nutzenlayout
    final showOnlyWithoutSingleNutzelayoutNotifier =
        useValueNotifier<bool>(true);

    final onContinue = useCallback(
      () async {
        final currentPage = pageController.page;

        // select artworks page
        if (currentPage == 0) {
          // check if artworks are selected
          final hasSelectedArtworks = ref.read(
            selectedArtworksForEinzelformaufbauProvider(sessionId),
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

        // select previous nutzenlayout page
        if (currentPage == 1) {
          await pageController.nextPage(
            duration: AnimationConstants.shortDuration,
            curve: Curves.easeInOut,
          );
          return;
        }

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
              selectedArtworksForEinzelformaufbauProvider(
                sessionId,
              ),
            );
            final metrics = ref.read(
              nutzenLayoutMetricsStateProvider(sessionId),
            );
            final firstArtwork = selectedArtworks.first;
            final artworkWidth = firstArtwork.width;
            final artworkHeight = firstArtwork.height;
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
                  singleNutzenLayoutStateProvider(sessionId).notifier,
                )
                .initialize(
                  customerId: customerId,
                  metrics: metrics,
                  artworkWidth: artworkWidth,
                  artworkHeight: artworkHeight,
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
              ref.read(singleNutzenLayoutStateProvider(sessionId));

          final selectedArtworks = ref.read(
            selectedArtworksForEinzelformaufbauProvider(sessionId),
          );
          final artworkIds = selectedArtworks.map((e) => e.id!).toSet();

          isSaving.value = true;
          final result = await AsyncHandler.handleAsyncOperation(
            context,
            () => ref.read(nutzenlayoutRepositoryProvider).createSingle(
                  layout: nutzenlayout,
                  artworkIds: artworkIds,
                  salesOrderId: salesOrderId,
                ),
            errorNavigatorKey: navigatorKey,
            successMessage: 'Einzelformaufbau erstellt'.hc,
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
      onSaveAndCloseShortcut: onContinue,
      maxWidth: 2400,
      isSelfScrollable: true,
      title: 'Einzelformaufbau hinzufügen'.hc,
      floatingWindowId: floatingWindowId,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 600,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                _AddSingleNutzenlayoutSelectArtworksPage(
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  customerId: customerId,
                  artworkId: artworkId,
                  navigatorKey: navigatorKey,
                  showOnlyWithoutSingleNutzelayoutNotifier:
                      showOnlyWithoutSingleNutzelayoutNotifier,
                ),
                _AddSingleNutzenlayoutSelectExistingNutzenlayoutPage(
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  customerId: customerId,
                  navigatorKey: navigatorKey,
                  pageController: pageController,
                ),
                Form(
                  key: presetFormKey,
                  child: _AddSingleNutzenlayoutSelectMetricsPage(
                    salesOrderId: salesOrderId,
                    sessionId: sessionId,
                    customerId: customerId,
                    navigatorKey: navigatorKey,
                  ),
                ),
                _AddSingleNutzenlayoutDesignerPage(
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

    final hasSelectedArtworks = ref
        .watch(
          selectedArtworksForEinzelformaufbauProvider(sessionId),
        )
        .isNotEmpty;

    return Row(
      mainAxisAlignment: currentPage.value > 0
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.end,
      children: [
        if (currentPage.value > 0)
          AppButton.secondary(
            onPressed: isSaving.value
                ? null
                : () {
                    pageController.previousPage(
                      duration: AnimationConstants.shortDuration,
                      curve: Curves.easeInOut,
                    );
                  },
            label: l10n.gen_back,
          ),
        if (currentPage.value == 1)
          AppButton.primary(
            onPressed: isSaving.value || !hasSelectedArtworks
                ? null
                : () async {
                    onContinue();
                  },
            label: 'Neuer Einzelformaufbau'.hc,
          )
        else if (currentPage.value == 3)
          AppSaveAndCloseButton(
            isLoading: isSaving.value,
            onPressed: isSaving.value ? null : onContinue,
          )
        else
          AppButton.primary(
            onPressed: isSaving.value || !hasSelectedArtworks
                ? null
                : () async {
                    onContinue();
                  },
            label: l10n.gen_next,
          ),
      ],
    );
  }
}
