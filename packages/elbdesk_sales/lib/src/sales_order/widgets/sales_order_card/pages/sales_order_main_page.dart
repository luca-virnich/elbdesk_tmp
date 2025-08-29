import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_sales/src/sales_order/config/sales_order_fields.dart';
import 'package:elbdesk_sales/src/sales_order/logic/sales_order_state.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_general/sales_order_customer_and_customer_customer_view.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_general/sales_order_payment_delivery_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Sales Order General View
///
/// Displays the general information of a [SalesOrder] in a [SalesOrderCard].
class SalesOrderMainPage extends HookConsumerWidget {
  /// Sales Order General View
  ///
  /// Displays the general information of a [SalesOrder] in a [SalesOrderCard].
  const SalesOrderMainPage({
    required this.salesOrderId,
    required this.sessionId,
    required this.readOnly,
    required this.validationGroupId,
    required this.stateNotifier,
    required this.initialEntity,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.savedOrInitialEntity,
    super.key,
  });

  /// Id of the sales order
  final int salesOrderId;

  /// SessionId of the sales order card
  final String sessionId;

  /// Wether the fields are read only
  final bool readOnly;

  /// Validation group id
  final String validationGroupId;

  /// The state notifier
  final SalesOrderState stateNotifier;

  /// The initial entity
  final SalesOrder initialEntity;

  /// The navigator key
  final GlobalKey<NavigatorState> navigatorKey;

  /// The floating window focus
  final FocusNode floatingWindowFocus;

  /// The floating window id
  final String floatingWindowId;

  /// The saved state
  final ObjectRef<SalesOrder?> savedOrInitialEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final crmL10n = context.crmL10n;
    final initalUser = useMemoized(
      () {
        return ref
            .read(salesOrderStateProvider(salesOrderId, sessionId))
            .requireValue
            .assignedUser;
      },
      [salesOrderId, sessionId],
    );

    final currentStatus = ref.watch(
      salesOrderStateProvider(salesOrderId, sessionId).select(
        (state) => state.requireValue.status,
      ),
    );

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Column(
          children: [
            CollapsibleCardSection(
              title: l10n.gen_general,
              identifier:
                  ComponentIdentifier.salesOrderCardMainPageGeneral.name,
              trailingWidgets: [
                AppOpenInNewTextButton(
                  label: initialEntity.customer?.contact?.general.name ?? '',
                  tooltipMessage: l10n.gen_open_new_table(
                    crmL10n.customer_singular,
                  ),
                  onShiftPressed: () {
                    final currentState = ref
                        .read(
                          salesOrderStateProvider(
                            salesOrderId,
                            sessionId,
                          ),
                        )
                        .requireValue;

                    final hasChanges = hasEntityChanges(
                      savedOrInitialEntity.value,
                      currentState,
                    );

                    if (!hasChanges) {
                      ref.removeWindow(floatingWindowId);
                    }
                  },
                  onPressed: () {
                    ref.openWindow(
                      FloatingCustomerWindowData(
                        customerId: initialEntity.customer!.id,
                      ),
                    );
                  },
                ),
              ],
              child: ElbTwoColumnWrap(
                customL10n: salesL10n,
                columnLeft: [
                  ElbTwoColumnDropdown.selection(
                    field: SalesOrderFields.fromEnum(SalesOrderField.status),
                    value: currentStatus,
                    onChanged: stateNotifier.updateStatus,
                  ),
                  // ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                  //   label: '',
                  //   childBuilder: (labelPosition) => Consumer(
                  //     builder: (context, ref, child) {
                  //       final selectedStatus = ref.watch(
                  //         salesOrderStateProvider(salesOrderId, sessionId)
                  //             .select(
                  //           (state) => state.requireValue.status,
                  //         ),
                  //       );
                  //       final statusColors = context.appTheme.statusColors;
                  //       // Memoize dropdown items to avoid recreation

                  //       return ElbCardSelectionDropdown(
                  //         label: salesL10n.sales_order_status,
                  //         labelPosition: labelPosition,
                  //         readOnly: readOnly,
                  //         isMandatory: true,
                  //         items: statusDropdownItems.toSelectionItems(
                  //           onSelected: stateNotifier.updateStatus,
                  //        colorMapper: (status) => status.color(statusColors),
                  //         ),
                  //         hasValue: true,
                  //         buttonLabel: selectedStatus.readable(l10n),
                  //         statusColor: selectedStatus.color(statusColors),
                  //       );
                  //     },
                  //   ),
                  // ),
                  ElbTwoColumnItem.assignedUser(
                    initialValue: initalUser,
                    field:
                        SalesOrderFields.fromEnum(SalesOrderField.assignedUser),
                    onChanged: stateNotifier.updateAssignedUser,
                  ),
                  ElbTwoColumnItem.date(
                    field: SalesOrderFields.fromEnum(SalesOrderField.orderDate),
                    initialValue: initialEntity.orderDate,
                    onChanged: stateNotifier.updateOrderDate,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnItem.text(
                    field: SalesOrderFields.fromEnum(SalesOrderField.keywords),
                    initialValue: initialEntity.keywords,
                    onChanged: stateNotifier.updateKeywords,

                    // hintText:
                    // initialEntity.customer!.salesOrderHints.keywords,
                  ),
                  ElbTwoColumnItem.text(
                    field:
                        SalesOrderFields.fromEnum(SalesOrderField.description),
                    initialValue: initialEntity.description,
                    onChanged: stateNotifier.updateDescription,
                  ),
                ],
                width: width,
                readOnly: readOnly,
                validationGroupId: validationGroupId,
              ),
            ),
            const CardSectionDivider(),
            const CardSectionDivider(),
            SalesOrderCustomerAndCustomerCustomerView(
              width: width,
              initialEntity: initialEntity,
              stateNotifier: stateNotifier,
              sessionId: sessionId,
              readOnly: readOnly,
              savedOrInitialEntity: savedOrInitialEntity,
              identifier:
                  ComponentIdentifier.salesOrderCardMainPageCustomerCustomer,
            ),
            const CardSectionDivider(),
            const CardSectionDivider(),
            SalesOrderPaymentDeliveryView(
              entityId: salesOrderId,
              savedOrInitialEntity: savedOrInitialEntity,
              width: width,
              initialEntity: initialEntity,
              sessionId: sessionId,
              readOnly: readOnly,
              stateNotifier: stateNotifier,
              navigatorKey: navigatorKey,
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
              identifier:
                  ComponentIdentifier.salesOrderCardMainPagePaymentDelivery,
            ),
          ],
        );
      },
    );
  }
}
