import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_order_multi_nutzenlayout.freezed.dart';
part 'sales_order_multi_nutzenlayout.g.dart';

/// SalesOrderMultiNutzenLayout
///
/// This is used to wrap data to bundle a MultiNutzenlayout (Sammelform) and
/// the associated ArtworkIds with a SalesOrder.
///
/// In a SalesOrder Products are added and then assigned to a Nutzenlayout.
/// The Nutzenlayout itself does not store the ArtworkIds, but only the
/// NutzenlayoutColumns.
///
/// The Nutzenlayout can be used in another SalesOrder with different products.
/// This is why we have to delete the ArtworkIds and store them somewher else.
@freezed
class SalesOrderMultiNutzenLayout with _$SalesOrderMultiNutzenLayout {
  const factory SalesOrderMultiNutzenLayout({
    required int salesOrderId,
    required Nutzenlayout nutzenlayout,
    required List<Artwork> artworks,
    required SalesOrder salesOrder,
    required int id,
  }) = _SalesOrderMultiNutzenLayout;

  const SalesOrderMultiNutzenLayout._();

  factory SalesOrderMultiNutzenLayout.fromJson(Map<String, dynamic> json) =>
      _$SalesOrderMultiNutzenLayoutFromJson(json);

  factory SalesOrderMultiNutzenLayout.fromDTO(
    SalesOrderMultiNutzenlayoutDTO dto,
  ) {
    return SalesOrderMultiNutzenLayout(
      salesOrderId: dto.salesOrderId,
      nutzenlayout: Nutzenlayout.fromSalesOrderMultiNuzenlayout(
        dto.nutzenlayout!,
        dto.cellArtworkAssignments,
      ),
      artworks:
          dto.artworks?.map((e) => Artwork.fromDTO(e.artwork!)).toList() ?? [],
      salesOrder: SalesOrder.fromDTO(dto.salesOrder!),
      id: dto.id!,
    );
  }
}

@freezed
class SalesOrderMultiNutzenlayoutLight with _$SalesOrderMultiNutzenlayoutLight {
  const factory SalesOrderMultiNutzenlayoutLight({
    required int salesOrderId,
    required Nutzenlayout nutzenlayout,
    required List<int> artworkIds,
    required int salesOrderMultiNutzenlayoutId,
  }) = _SalesOrderMultiNutzenlayoutLight;

  const SalesOrderMultiNutzenlayoutLight._();

  factory SalesOrderMultiNutzenlayoutLight.fromDTO(
    SalesOrderMultiNutzenlayoutLightDTO dto,
  ) {
    return SalesOrderMultiNutzenlayoutLight(
      salesOrderId: dto.salesOrderId,
      nutzenlayout: Nutzenlayout.fromSingleDTO(dto.nutzenlayout),
      artworkIds: dto.artworks,
      salesOrderMultiNutzenlayoutId: dto.salesOrderMultiNutzenlayoutId,
    );
  }
}
