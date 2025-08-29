import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'pages/add_drucklayout_select_existing_page.dart';
part 'pages/add_drucklayout_select_nutzenlayout_page.dart';

/// Add Drucklayout to Sales Order Dialog
///
/// Multi-page dialog for adding Drucklayouts to a sales order
class AddDrucklayoutToSalesOrderDialog extends HookConsumerWidget {
  const AddDrucklayoutToSalesOrderDialog({
    required this.customerId,
    required this.salesOrderId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    super.key,
  });

  final int customerId;
  final int salesOrderId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    ref.listen(
      selectedExistingDrucklayoutStateProvider(sessionId),
      (previous, next) {},
    );

    final pageController = usePageController();
    final configureFormKey = useFormKey();
    final isSaving = useValueNotifier<bool>(false);

    // Clear selection states when dialog opens
    useEffect(
      () {
        // Delay the state modification until after the widget tree is built
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(
                selectedExistingDrucklayoutStateProvider(sessionId).notifier,
              )
              .clearSelectedDrucklayout();
          ref
              .read(
                selectedNutzenlayoutsForDrucklayoutStateProvider(sessionId)
                    .notifier,
              )
              .clearSelection();
        });
        return null;
      },
      [],
    );

    final onContinue = useCallback(
      () async {
        final currentPage = pageController.page;

        // Select Drucklayout page
        if (currentPage == 0) {
          final selectedDrucklayout =
              ref.read(selectedExistingDrucklayoutStateProvider(sessionId));

          if (selectedDrucklayout == null) {
            // No Drucklayout selected, don't continue
            AppNotificationOverlay.error(
              context,
              l10n.gen_please_choose_entity(
                ppL10n.drucklayout_singular,
              ),
            );
            return;
          }

          await pageController.nextPage(
            duration: AnimationConstants.shortDuration,
            curve: Curves.easeInOut,
          );
          return;
        }

        // Nutzenlayout selection page
        if (currentPage == 1) {
          final selectedDrucklayout =
              ref.read(selectedExistingDrucklayoutStateProvider(sessionId));

          if (selectedDrucklayout == null) {
            // No Drucklayout selected, go back to first page
            await pageController.previousPage(
              duration: AnimationConstants.shortDuration,
              curve: Curves.easeInOut,
            );
            return;
          }

          // Get selected Nutzenlayouts
          final selectedNutzenlayoutIds = ref.read(
            selectedNutzenlayoutsForDrucklayoutStateProvider(sessionId),
          );

          if (selectedNutzenlayoutIds.isEmpty) {
            AppNotificationOverlay.error(
              context,
              ppL10n.please_choose_min_drucklayout,
            );
            return;
          }

          isSaving.value = true;

          // Call the assignment method
          final result = await AsyncHandler.handleAsyncOperation(
            context,
            () => ref.read(drucklayoutRepositoryProvider).assignNutzenlayouts(
                  sessionId: sessionId,
                  drucklayoutId: selectedDrucklayout.id!,
                  salesOrderId: salesOrderId,
                  nutzenlayoutIds: selectedNutzenlayoutIds,
                ),
            errorNavigatorKey: navigatorKey,
            successMessage: ppL10n.nutzenlayout_added_to_drucklayout,
            successNavigatorKey: navigatorKey,
          );

          if (result.success && context.mounted) {
            // TODO(all): If this is approved and stays this way, we should
            // refactor this to use proper streams instead.

            // Invalidate the assigned Nutzenlayouts provider to refresh
            ref.invalidate(
              fetchAssignedNutzenlayoutsForDrucklayoutProvider(
                drucklayoutId: selectedDrucklayout.id!,
                salesOrderId: salesOrderId,
              ),
            );

            // Invalidate the artwork-associated drucklayouts provider to update
            // PictoTiles
            // This ensures PictoTiles show the correct drucklayout association
            // state
            if (selectedNutzenlayoutIds.isNotEmpty) {
              // Invalidate the entire provider family since we don't know which
              // specific artworks are affected by the nutzenlayout assignments
              ref.invalidate(
                fetchArtworkAssociatedDrucklayoutsBySalesOrderProvider,
              );
            }

            // Clear selection state
            ref
                .read(
                  selectedNutzenlayoutsForDrucklayoutStateProvider(sessionId)
                      .notifier,
                )
                .clearSelection();
            ref
                .read(
                  selectedExistingDrucklayoutStateProvider(sessionId).notifier,
                )
                .clearSelectedDrucklayout();

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

    // Dialog
    return ElbDialog(
      isSelfScrollable: true,
      onSaveAndCloseShortcut: onContinue,
      maxWidth: 1200,
      icon: AppIcons.drucklayout,
      title: l10n.gen_add_entity(ppL10n.drucklayout_singular),
      floatingWindowId: floatingWindowId,
      footer: _DrucklayoutDialogButtons(
        pageController: pageController,
        sessionId: sessionId,
        salesOrderId: salesOrderId,
        customerId: customerId,
        navigatorKey: navigatorKey,
        onContinue: onContinue,
        isSaving: isSaving,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 400,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                // Select Existing Drucklayout Page
                _AddDrucklayoutSelectExistingPage(
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                ),

                // Configure Drucklayout Page
                Form(
                  key: configureFormKey,
                  child: _AddDrucklayoutSelectNutzenlayoutPage(
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    sessionId: sessionId,
                    navigatorKey: navigatorKey,
                  ),
                ),
              ],
            ),
          ),

          // Buttons
        ],
      ),
    );
  }
}

/// Navigation buttons for the Drucklayout dialog
class _DrucklayoutDialogButtons extends HookConsumerWidget {
  const _DrucklayoutDialogButtons({
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
    final selectedDrucklayout =
        ref.watch(selectedExistingDrucklayoutStateProvider(sessionId));

    useEffect(
      () {
        pageController.addListener(() {
          currentPage.value = pageController.page?.toInt() ?? 0;
        });
        return null;
      },
      [pageController],
    );

    return InWindowCardDialogFooter(
      leadingActions: [
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
      ],
      trailingActions: [
        if (currentPage.value == 0)
          AppButton.primary(
            onPressed: isSaving.value || selectedDrucklayout == null
                ? null
                : () async {
                    onContinue();
                  },
            label: l10n.gen_next,
          )
        else if (currentPage.value == 1)
          Consumer(
            builder: (context, ref, child) {
              final selectedCount = ref
                  .watch(
                    selectedNutzenlayoutsForDrucklayoutStateProvider(
                      sessionId,
                    ),
                  )
                  .length;

              return AppButton.primary(
                isLoading: isSaving.value,
                onPressed: isSaving.value || selectedDrucklayout == null
                    ? null
                    : onContinue,
                label: selectedCount > 0
                    ? l10n.gen_assign_entity_count(
                        selectedCount,
                        'Nutzenlayouts'.hc,
                      )
                    : l10n.gen_assign_entity('Nutzenlayouts'.hc),
              );
            },
          ),
      ],
    );
  }
}
