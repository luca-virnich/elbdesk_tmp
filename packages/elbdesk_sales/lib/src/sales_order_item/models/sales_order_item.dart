import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_item.freezed.dart';
part 'sales_order_item.g.dart';

@freezed
class SalesOrderItem with _$SalesOrderItem {
  const factory SalesOrderItem({
    required int id,
    required SalesOrderItemType type,
    required SalesOrderItemStatus status,
    required int salesOrderId,
    required SalesOrder? salesOrder,
    required int soiTypePrimaryKey,
    required LightUser? assignedUser,
    required String description,
    required int billableTime,
    required int customerId,
    required DateTime? deadline,
  }) = _SalesOrderItem;

  const SalesOrderItem._();

  factory SalesOrderItem.fromJson(Map<String, Object?> json) =>
      _$SalesOrderItemFromJson(json);

  factory SalesOrderItem.fromDTO(SalesOrderItemDTO dto) {
    return SalesOrderItem(
      id: dto.id!,
      customerId: dto.customerId,
      description: dto.description,
      billableTime: dto.billableTime,
      salesOrderId: dto.salesOrderId,
      deadline: dto.deadline?.toLocal(),
      soiTypePrimaryKey: dto.soiTypePrimaryKey!,
      salesOrder:
          dto.salesOrder != null ? SalesOrder.fromDTO(dto.salesOrder!) : null,
      assignedUser: dto.assignedUser != null
          ? LightUser.fromDTO(dto.assignedUser!)
          : null,
      type: Parser.enumFromString(SalesOrderItemType.values, dto.type) ??
          SalesOrderItemType.prepareArtwork,
      status: Parser.enumFromString(SalesOrderItemStatus.values, dto.status) ??
          SalesOrderItemStatus.preperation,
    );
  }

  String get soiIdReadable => '${IdPrefixes.soi}-$id';

  SalesOrderItemDTO toDTO() {
    return SalesOrderItemDTO(
      customerId: customerId,
      id: id,
      assignedUserId: assignedUser?.lightUserId,
      assignedUser: assignedUser?.toDTO(),
      description: description,
      deadline: deadline,
      billableTime: billableTime,
      salesOrderId: salesOrderId,
      soiTypePrimaryKey: soiTypePrimaryKey,
      type: type.name,
      status: status.name,
    );
  }
}
