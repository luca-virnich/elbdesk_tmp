import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class AppCardSalesOrderItemStatusButton extends StatelessWidget {
  const AppCardSalesOrderItemStatusButton({
    required this.selectedStatus,
    required this.onSelected,
    required this.labelPosition,
    required this.label,
    required this.readOnly,
    required this.statusList,
    this.focusOrderId,
    super.key,
  });

  final SalesOrderItemStatus selectedStatus;
  final void Function(SalesOrderItemStatus) onSelected;
  final NextCardFormFieldLabelPosition labelPosition;
  final String label;
  final bool readOnly;
  final double? focusOrderId;
  final List<SalesOrderItemStatus> statusList;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final statusColors = context.appTheme.statusColors;
    return ElbCardSelectionDropdown(
      hasValue: true,
      focusOrderId: focusOrderId,
      isMandatory: true,
      readOnly: readOnly,
      labelPosition: labelPosition,
      label: label,
      // label: l10n.sales_order_item_status,
      items: [
        for (final s in statusList)
          ElbSelectionDropdownItem(
            label: s.readable(l10n),
            onPressed: () {
              onSelected(s);
            },
            color: s.color,
          ),
      ],
      buttonLabel: selectedStatus.readable(l10n),
      statusColor: selectedStatus.color,
    );
  }
}
