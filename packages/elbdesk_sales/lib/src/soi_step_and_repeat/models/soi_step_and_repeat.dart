import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/src/sales_order/models/sales_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'soi_step_and_repeat.freezed.dart';

@freezed
class SoiStepAndRepeat with _$SoiStepAndRepeat, HasMetaData {
  const factory SoiStepAndRepeat({
    required Artwork artwork,
    required SalesOrder? salesOrder,
    required String description,
    required SoiStepAndRepeatStatus status,
    required int soiId,
    required DataMeta meta,
  }) = _SoiStepAndRepeat;

  factory SoiStepAndRepeat.fromDTO(SoiStepAndRepeatDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiStepAndRepeat(
      soiId: dto.soiId,
      artwork: Artwork.fromDTO(dto.artwork!),
      salesOrder: SalesOrder.fromDTO(dto.salesOrder!),
      description: dto.description,
      status: Parser.enumFromString(
            SoiStepAndRepeatStatus.values,
            dto.status,
          ) ??
          SoiStepAndRepeatStatus.wartenAufArtworks,
      meta: dataMeta,
    );
  }

  factory SoiStepAndRepeat.forSalesOrder(SoiStepAndRepeatDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);

    return SoiStepAndRepeat(
      soiId: dto.soiId,
      artwork: Artwork.fromDTO(dto.artwork!),
      salesOrder: null,
      description: dto.description,
      status: Parser.enumFromString(
            SoiStepAndRepeatStatus.values,
            dto.status,
          ) ??
          SoiStepAndRepeatStatus.wartenAufArtworks,
      meta: dataMeta,
    );
  }

  const SoiStepAndRepeat._();

  String get soiIdReadable => '${IdPrefixes.soi}-$soiId';

  SoiStepAndRepeatDTO toDTO() {
    return SoiStepAndRepeatDTO(
      id: meta.id,
      soiId: soiId,
      artworkId: artwork.meta.id!,
      salesOrderId: salesOrder!.meta.id!,
      description: description,
      status: status.name,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      isDraft: meta.isDraft,
    );
  }
}
