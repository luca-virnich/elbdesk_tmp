import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/app_card_sales_order_item_status_button.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class SoiGeneralSharedSection extends ConsumerWidget {
  const SoiGeneralSharedSection({
    required this.width,
    required this.salesOrderId,
    required this.fullSalesOrderId,
    required this.customerId,
    required this.customerName,
    required this.currentStatus,
    required this.onStatusSelected,
    required this.assignedUser,
    required this.onAssignedUserSelected,
    required this.description,
    required this.onDescriptionChanged,
    required this.readOnly,
    required this.statusList,
    required this.currentDeadline,
    required this.onDeadlineChanged,
    required this.identifier,
    super.key,
  });
  final double width;
  final int salesOrderId;
  final String fullSalesOrderId;
  final int customerId;
  final String customerName;
  final SalesOrderItemStatus currentStatus;
  final void Function(SalesOrderItemStatus) onStatusSelected;
  final LightUser? assignedUser;
  final void Function(LightUser?) onAssignedUserSelected;
  final String description;
  final void Function(String) onDescriptionChanged;
  final DateTime? currentDeadline;
  final void Function(DateTime?) onDeadlineChanged;
  final bool readOnly;
  final List<SalesOrderItemStatus> statusList;
  final ComponentIdentifier identifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;

    return CollapsibleCardSection(
      title: l10n.gen_general_information,
      identifier: identifier.name,
      trailingWidgets: [
        AppOpenInNewTextButton(
          onPressed: () {
            ref.openWindow(
              FloatingSalesOrderWindowData(
                salesOrderId: salesOrderId,
              ),
            );
          },
          label: fullSalesOrderId,
          tooltipMessage: l10n.gen_open_new_table(
            salesL10n.sales_order_singular,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: UiConstants.elementMargin,
          ),
          child: AppText('/'),
        ),
        AppOpenInNewTextButton(
          onPressed: () {
            ref.openWindow(
              FloatingCustomerWindowData(
                customerId: customerId,
              ),
            );
          },
          label: customerName,
          tooltipMessage: l10n.gen_open_new_table(
            salesL10n.customer_singular,
          ),
        ),
      ],
      child: ElbTwoColumnWrap(
        width: width,
        customL10n: salesL10n,
        readOnly: readOnly,
        validationGroupId: null,

        // Left Column
        columnLeft: [
          ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
            label: '',
            childBuilder: (labelPosition) => Consumer(
              builder: (context, ref, child) {
                return AppCardSalesOrderItemStatusButton(
                  statusList: statusList,
                  focusOrderId: 1,
                  readOnly: readOnly,
                  selectedStatus: currentStatus,
                  onSelected: onStatusSelected,
                  labelPosition: labelPosition,
                  label: salesL10n.sales_order_item_status,
                );
              },
            ),
          ),
          ElbTwoColumnItem.assignedUser(
            initialValue: assignedUser,
            field:
                SalesOrderItemFields.fromEnum(SalesOrderItemField.assignedUser),
            onChanged: onAssignedUserSelected,
          ),
        ],

        // Right Column
        columnRight: [
          ElbTwoColumnItem.text(
            field:
                SalesOrderItemFields.fromEnum(SalesOrderItemField.description),
            initialValue: description,
            readOnly: readOnly,
            onChanged: onDescriptionChanged,
          ),
          ElbTwoColumnItem.date(
            field: SalesOrderItemFields.fromEnum(SalesOrderItemField.deadline),
            initialValue: currentDeadline,
            onChanged: onDeadlineChanged,
          ),
        ],
      ),
    );
  }
}
