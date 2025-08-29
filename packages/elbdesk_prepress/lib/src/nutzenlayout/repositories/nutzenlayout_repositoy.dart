import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/nutzenlayout.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/sales_order_multi_nutzenlayout.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/models/sales_order_single_nutzenlayout.dart';

class NutzenlayoutRepository {
  NutzenlayoutRepository({required this.endpoint});
  final EndpointNutzenLayout endpoint;

  Future<void> createSingle({
    required Nutzenlayout layout,
    required Set<int> artworkIds,
    required int salesOrderId,
  }) async {
    final dto = layout.singleToDTO();

    // return;
    await endpoint.createSingleNutzenlayoutWithArtworks(
      dto: dto,
      artworkIds: artworkIds,
      salesOrderId: salesOrderId,
    );
  }

  Future<List<SalesOrderSingleNutzenLayout>> fetchBySalesOrderId({
    required int salesOrderId,
  }) async {
    final dto = await endpoint.fetchSingleBySalesOrderId(
      salesOrderId: salesOrderId,
    );

    return dto.map(SalesOrderSingleNutzenLayout.fromDTO).toList();
  }

  Future<List<SalesOrderSingleNutzenlayoutLight>> fetchSingleWithArtworkIds({
    required int salesOrderId,
  }) async {
    final dto =
        await endpoint.fetchSingleWithArtworkIds(salesOrderId: salesOrderId);
    return dto.map(SalesOrderSingleNutzenlayoutLight.fromDTO).toList();
  }

  Future<List<SalesOrderMultiNutzenlayoutLight>> fetchMultiWithArtworkIds({
    required int salesOrderId,
  }) async {
    final dto =
        await endpoint.fetchMultiWithArtworkIds(salesOrderId: salesOrderId);
    return dto.map(SalesOrderMultiNutzenlayoutLight.fromDTO).toList();
  }

  Future<List<Nutzenlayout>> fetchByCustomerWithDimensions({
    required int customerId,
    required double width,
    required double height,
  }) async {
    final dto = await endpoint.fetchByCustomerWithDimensions(
      customerId: customerId,
      dimensions: [
        NutzenlayoutArtworkDimensions(
          width: width,
          height: height,
        ),
      ],
    );
    return dto.map(Nutzenlayout.fromSingleDTO).toList();
  }

  Future<List<Nutzenlayout>> fetchMultiByCustomerWithDimensions({
    required int customerId,
    required List<NutzenlayoutArtworkDimensions> dimensions,
  }) async {
    final dto = await endpoint.fetchMultiByCustomerWithDimensions(
      customerId: customerId,
      dimensions: dimensions,
    );
    return dto.map(Nutzenlayout.fromSingleDTO).toList();
  }

  // Future<List<SingleNutzenlayout>> fetchByCustomerWithDimensions2({
  //   required int customerId,
  //   required double cellX,
  //   required double cellY,
  // }) async {
  //   final dto = await endpoint.fetchByCustomerWithDimensions2(
  //     customerId: customerId,
  //     cellX: cellX,
  //     cellY: cellY,
  //   );
  //   return dto.map(SingleNutzenlayout.fromDTO).toList();
  // }

  Future<List<int>> fetchNutzelayoutsByMasterId({
    required Set<int> masterIds,
  }) async {
    final dto = await endpoint.getNutzelayoutsByMasterId(masterIds: masterIds);
    return dto;
  }

  Future<void> addArtworktsToNutzenlayout({
    required Nutzenlayout layout,
    required Set<int> artworkIds,
    required int salesOrderId,
  }) async {
    await endpoint.addArtworksToNutzenlayout(
      nutzenlayoutDTO: layout.singleToDTO(),
      artworkIds: artworkIds,
      salesOrderId: salesOrderId,
    );
  }

  // Future<NutzenLayoutDTO> createMulti(
  //   NutzenLayoutDTO dto,
  //   List<int> artworkIds,
  // ) async {
  //   return endpoint.createMulti(dto, artworkIds);
  // }
  // Future<void> connectNutzenlayoutToSalesOrder({
  //   required int nutzenlayoutId,
  //   required int salesOrderId,
  //   required List<ArtworkArtworkMaster> artworks,
  // }) async {
  //   return endpoint.connectNutzenlayoutToSalesOrder(
  //     nutzenlayoutId: nutzenlayoutId,
  //     salesOrderId: salesOrderId,
  //     artworks: artworks,
  //   );
  // }

  Future<void> detachArtworksFromSalesOrderNutzenlayout({
    required int salesOrderId,
    required int nutzenlayoutId,
    required Set<int> artworkIds,
  }) async {
    await endpoint.detachArtworksFromSalesOrderNutzenlayout(
      salesOrderId: salesOrderId,
      nutzenlayoutId: nutzenlayoutId,
      artworkIds: artworkIds,
    );
  }

  Future<void> createMulti({
    required Nutzenlayout layout,
    required Set<int> artworkIds,
    required int salesOrderId,
    required Set<NutzenlayoutArtworkDimensions> dimensions,
    required bool isExistingNutzenlayout,
  }) async {
    final dto = layout.singleToDTO();

    // return;
    await endpoint.createMultiNutzenlayoutWithArtworks(
      dto: dto,
      artworkIds: artworkIds,
      salesOrderId: salesOrderId,
      dimensions: dimensions,
      isExistingNutzenlayout: isExistingNutzenlayout,
    );
  }
}
