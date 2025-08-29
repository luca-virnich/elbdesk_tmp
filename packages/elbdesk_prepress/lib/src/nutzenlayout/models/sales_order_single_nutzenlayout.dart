import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_single_nutzenlayout.freezed.dart';
part 'sales_order_single_nutzenlayout.g.dart';

@freezed
class SalesOrderSingleNutzenLayout with _$SalesOrderSingleNutzenLayout {
  const factory SalesOrderSingleNutzenLayout({
    required int salesOrderId,
    required Nutzenlayout nutzenlayout,
    required List<Artwork> artworks,
    required SalesOrder salesOrder,
    required int id,
  }) = _SalesOrderSingleNutzenLayout;

  const SalesOrderSingleNutzenLayout._();

  factory SalesOrderSingleNutzenLayout.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderSingleNutzenLayoutFromJson(json);

  factory SalesOrderSingleNutzenLayout.fromDTO(
    SalesOrderSingleNutzenlayoutDTO dto,
  ) {
    return SalesOrderSingleNutzenLayout(
      salesOrderId: dto.salesOrderId,
      nutzenlayout: Nutzenlayout.fromSingleDTO(dto.nutzenlayout!),
      artworks:
          dto.artworks?.map((e) => Artwork.fromDTO(e.artwork!)).toList() ?? [],
      salesOrder: SalesOrder.fromDTO(dto.salesOrder!),
      id: dto.id!,
    );
  }
}

@freezed
class SalesOrderSingleNutzenlayoutLight
    with _$SalesOrderSingleNutzenlayoutLight {
  const factory SalesOrderSingleNutzenlayoutLight({
    required int salesOrderId,
    required Nutzenlayout nutzenlayout,
    required List<int> artworkIds,
    required int salesOrderSingleNutzenlayoutId,
  }) = _SalesOrderSingleNutzenlayoutLight;

  const SalesOrderSingleNutzenlayoutLight._();

  factory SalesOrderSingleNutzenlayoutLight.fromDTO(
    SalesOrderSingleNutzenlayoutLightDTO dto,
  ) {
    return SalesOrderSingleNutzenlayoutLight(
      salesOrderId: dto.salesOrderId,
      nutzenlayout: Nutzenlayout.fromSingleDTO(dto.nutzenlayout),
      artworkIds: dto.artworks,
      salesOrderSingleNutzenlayoutId: dto.salesOrderSingleNutzenlayoutId,
    );
  }
}
