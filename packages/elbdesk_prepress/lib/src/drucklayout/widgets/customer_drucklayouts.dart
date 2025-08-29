import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Widget for displaying and managing customer drucklayouts
class CustomerDrucklayouts extends HookConsumerWidget {
  const CustomerDrucklayouts({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    super.key,
  });

  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPreSelectionIdNotifier = useState<int?>(null);
    final selectedSelectionIdNotifier = useState<int?>(null);

    final filterGroup = useMemoized(
      () {
        return FilterGroup(
          nextOperator: FilterOperator.and,
          filters: [
            if (selectedPreSelectionIdNotifier.value != null)
              FilterField(
                fieldKey: DrucklayoutField.drucklayoutPreSelection.name,
                value: selectedPreSelectionIdNotifier.value.toString(),
                type: FilterType.equal,
                fieldType: FilterFieldType.number,
                filterOperator: FilterOperator.and,
                uuid: const Uuid().v4(),
              ),
            if (selectedSelectionIdNotifier.value != null)
              FilterField(
                fieldKey: DrucklayoutField.drucklayoutSelection.name,
                value: selectedSelectionIdNotifier.value.toString(),
                type: FilterType.equal,
                fieldType: FilterFieldType.number,
                filterOperator: FilterOperator.and,
                uuid: const Uuid().v4(),
              ),
          ],
        );
      },
      [selectedPreSelectionIdNotifier.value, selectedSelectionIdNotifier.value],
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Selection ( Selection and Pre Selection )
            DrucklayoutPreSelectionSelection(
              width: constraints.maxWidth,
              customerId: customerId,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
              preSelectionIdNotifier: selectedPreSelectionIdNotifier,
              selectionIdNotifier: selectedSelectionIdNotifier,
            ),
            const CardSectionDivider(),
            const AppDivider(),
            const CardSectionDivider(),

            // Drucklayout Table
            Expanded(
              child: DrucklayoutTable.byCustomer(
                customerId: customerId,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                onSelect: (drucklayout) {
                  ref.openWindow(
                    FloatingDrucklayoutWindowData(
                      entityId: drucklayout.meta.id,
                      customerId: customerId,
                      preSelectionId: drucklayout.preSelectionId!,
                      selectionId: drucklayout.selectionId!,
                    ),
                  );
                },
                floatingWindowId: floatingWindowId,
                componentIdentifier:
                    ComponentIdentifier.customerDrucklayoutsTable,
                isCollapsible: false,
                tableDensity: AppTableDensity.minimal,
                toolbarTrailingActions: (sessionId) => [
                  _AddNewCustomerDrucklayoutButton(
                    customerId: customerId,
                    selectedPreSelectionId:
                        selectedPreSelectionIdNotifier.value,
                    selectedSelectionId: selectedSelectionIdNotifier.value,
                  ),
                ],
                hiddenFilterGroup: filterGroup,
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Button for adding new customer drucklayouts
class _AddNewCustomerDrucklayoutButton extends ConsumerWidget {
  const _AddNewCustomerDrucklayoutButton({
    required this.customerId,
    required this.selectedPreSelectionId,
    required this.selectedSelectionId,
  });

  final int customerId;
  final int? selectedPreSelectionId;
  final int? selectedSelectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disabled =
        selectedPreSelectionId == null || selectedSelectionId == null;
    final ppL10n = context.prepressL10n;
    final l10n = context.l10n;

    return AppButton.primary(
      iconData: AppIcons.add,
      tooltip: l10n.gen_add_entity(ppL10n.drucklayout_singular),
      onPressed: disabled
          ? null
          : () {
              ref.openWindow(
                FloatingDrucklayoutWindowData(
                  entityId: null,
                  customerId: customerId,
                  preSelectionId: selectedPreSelectionId!,
                  selectionId: selectedSelectionId!,
                ),
              );
            },
    );
  }
}
