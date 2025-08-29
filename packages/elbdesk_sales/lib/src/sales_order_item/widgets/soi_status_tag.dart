import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_sales/src/sales_order_item/extensions/sales_order_item_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum _LabelType {
  status,
  name,
}

class SoiStatusTagWrap extends StatelessWidget {
  const SoiStatusTagWrap.nameLabel({
    required this.salesOrderItems,
    super.key,
  }) : _labelType = _LabelType.name;

  const SoiStatusTagWrap.statusLabel({
    required this.salesOrderItems,
    super.key,
  }) : _labelType = _LabelType.status;

  final List<SalesOrderItem> salesOrderItems;
  final _LabelType _labelType;

  @override
  Widget build(BuildContext context) {
    if (_labelType == _LabelType.status) {
      return AppWrap(
        children: salesOrderItems.ordered
            .map(
              (e) => SoiStatusTag.nameLabel(
                salesOrderItem: e,
              ),
            )
            .toList(),
      );
    }
    return AppWrap(
      children: salesOrderItems.ordered
          .map((e) => SoiStatusTag.statusLabel(salesOrderItem: e))
          .toList(),
    );
  }
}

class SoiStatusTag extends ConsumerWidget {
  const SoiStatusTag.statusLabel({
    required this.salesOrderItem,
    super.key,
  }) : _labelType = _LabelType.status;

  const SoiStatusTag.nameLabel({
    required this.salesOrderItem,
    super.key,
  }) : _labelType = _LabelType.name;

  final SalesOrderItem salesOrderItem;
  final _LabelType _labelType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final label = switch (_labelType) {
      _LabelType.status => salesOrderItem.status.readable(l10n),
      _LabelType.name => salesOrderItem.type.readable(l10n, salesL10n),
    };
    return ElbTag(
      color: salesOrderItem.status.color,
      label: label,
      onPressed: () {
        return switch (salesOrderItem.type) {
          SalesOrderItemType.prepareArtwork => ref.openWindow(
              FloatingSoiPrepareArtworkWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: salesOrderItem.customerId,
              ),
            ),
          SalesOrderItemType.einzelformaufbau => ref.openWindow(
              FloatingSoiEinzelformaufbauWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: salesOrderItem.customerId,
              ),
            ),
          SalesOrderItemType.requestArtworkApproval => ref.openWindow(
              FloatingSoiRequestArtworkApprovalWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: salesOrderItem.customerId,
              ),
            ),
          SalesOrderItemType.consulting => ref.openWindow(
              FloatingSoiConsultingWindowData(
                entityId: salesOrderItem.soiTypePrimaryKey,
                customerId: salesOrderItem.customerId,
                salesOrderId: salesOrderItem.salesOrderId,
              ),
            ),
        };
      },
    );
  }
}
