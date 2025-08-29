import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order/models/sales_order.dart';
import 'package:elbdesk_sales/src/sales_order_item/models/sales_order_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soi_consulting.freezed.dart';
part 'soi_consulting.g.dart';

@freezed
class SoiConsulting with _$SoiConsulting, HasMetaData {
  const factory SoiConsulting({
    required SalesOrder? salesOrder,
    required int salesOrderItemId,
    required SalesOrderItem? salesOrderItem,
    required DataMeta meta,
    required String text,
  }) = _SoiConsulting;

  factory SoiConsulting.fromJson(Map<String, Object?> json) =>
      _$SoiConsultingFromJson(json);

  factory SoiConsulting.fromDTO(SoiConsultingDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiConsulting(
      salesOrderItem: dto.salesOrderItem != null
          ? SalesOrderItem.fromDTO(dto.salesOrderItem!)
          : null,
      salesOrderItemId: dto.salesOrderItemId,
      salesOrder: dto.salesOrderItem!.salesOrder != null
          ? SalesOrder.fromDTO(dto.salesOrderItem!.salesOrder!)
          : null,
      text: dto.text,
      meta: dataMeta,
    );
  }

  factory SoiConsulting.forSalesOrder(SoiConsultingDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiConsulting(
      text: dto.text,
      salesOrderItemId: dto.salesOrderItemId,
      salesOrder: null,
      salesOrderItem: dto.salesOrderItem != null
          ? SalesOrderItem.fromDTO(dto.salesOrderItem!)
          : null,
      meta: dataMeta,
    );
  }

  const SoiConsulting._();

  String get soiIdReadable => '${IdPrefixes.soi}-$salesOrderItemId';

  SoiConsultingDTO toDTO() {
    return SoiConsultingDTO(
      salesOrderItemId: salesOrderItemId,
      salesOrderItem: salesOrderItem?.toDTO(),
      text: text,
      id: meta.id,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      isDraft: meta.isDraft,
    );
  }
}

class SoiConsultingAdditionalData implements AdditionalEntityData {
  const SoiConsultingAdditionalData({
    required this.customerId,
    required this.salesOrderId,
    required this.fullSalesOrderId,
  });

  factory SoiConsultingAdditionalData.fromJson(Map<String, dynamic> json) {
    return SoiConsultingAdditionalData(
      customerId: json['customerId'] as int?,
      salesOrderId: json['salesOrderId'] as int,
      fullSalesOrderId: json['fullSalesOrderId'] as String,
    );
  }

  final int? customerId;
  final int salesOrderId;
  final String fullSalesOrderId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'salesOrderId': salesOrderId,
      'fullSalesOrderId': fullSalesOrderId,
    };
  }
}
