import 'dart:async';
import 'dart:convert';

import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/nutzenlayout/nutzenlayout_handler.dart';
import 'package:serverpod/serverpod.dart';

final salesOrderSingleNutzenlayoutLightStreamController =
    StreamController<SalesOrderSingleNutzenlayoutLightDTO>.broadcast();

final salesOrderMultiNutzenlayoutLightStreamController =
    StreamController<SalesOrderMultiNutzenlayoutLightDTO>.broadcast();

class NutzenLayoutEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<SalesOrderSingleNutzenlayoutLightDTO>
      watchSalesOrderSingleNutzenlayoutsLight(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* salesOrderSingleNutzenlayoutLightStreamController.stream
        .where((event) => event.salesOrderId == salesOrderId)
        .map((event) {
      return event;
    });
  }

  Stream<SalesOrderMultiNutzenlayoutLightDTO>
      watchSalesOrderMultiNutzenlayoutsLight(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* salesOrderMultiNutzenlayoutLightStreamController.stream
        .where((event) => event.salesOrderId == salesOrderId)
        .map((event) {
      return event;
    });
  }

  Future<NutzenlayoutDTO> fetchById(
    Session session, {
    required int nutzenlayoutId,
  }) async {
    final nutzenlayout =
        await NutzenlayoutDTO.db.findById(session, nutzenlayoutId);
    return nutzenlayout!;
  }

  Future<List<SalesOrderSingleNutzenlayoutDTO>> fetchSingleBySalesOrderId(
    Session session, {
    required int salesOrderId,
  }) async {
    final nutzenlayouts = await SalesOrderSingleNutzenlayoutDTO.db.find(
      session,
      where: (t) => t.salesOrderId.equals(salesOrderId),
      include: SalesOrderSingleNutzenlayoutDTO.include(
        salesOrder: SalesOrderDTO.include(),
        artworks: SalesOrderSingleNutzenlayoutArtworkJT.includeList(
          include: SalesOrderSingleNutzenlayoutArtworkJT.include(
            artwork: ArtworkDTO.include(),
          ),
        ),
        nutzenlayout: NutzenlayoutDTO.include(),
      ),
    );

    return nutzenlayouts;
  }

  Future<List<SalesOrderMultiNutzenlayoutDTO>> fetchMultiBySalesOrderId(
    Session session, {
    required int salesOrderId,
  }) async {
    final nutzenlayouts = await SalesOrderMultiNutzenlayoutDTO.db.find(
      session,
      where: (t) => t.salesOrderId.equals(salesOrderId),
      include: SalesOrderMultiNutzenlayoutDTO.include(
        salesOrder: SalesOrderDTO.include(),
        artworks: SalesOrderMultiNutzenlayoutArtworkJT.includeList(
          include: SalesOrderMultiNutzenlayoutArtworkJT.include(
            artwork: ArtworkDTO.include(),
          ),
        ),
        nutzenlayout: NutzenlayoutDTO.include(),
      ),
    );

    return nutzenlayouts;
  }

  Future<List<SalesOrderSingleNutzenlayoutLightDTO>> fetchSingleWithArtworkIds(
    Session session, {
    required int salesOrderId,
  }) async {
    final layouts =
        await fetchSingleBySalesOrderId(session, salesOrderId: salesOrderId);

    final res = layouts
        .map(
          (e) => SalesOrderSingleNutzenlayoutLightDTO(
            salesOrderId: salesOrderId,
            salesOrderSingleNutzenlayoutId: e.id!,
            nutzenlayout: e.nutzenlayout!,
            artworks: e.artworks!.map((e) => e.artworkId).toList(),
          ),
        )
        .toList();
    return res;
  }

  Future<List<SalesOrderMultiNutzenlayoutLightDTO>> fetchMultiWithArtworkIds(
    Session session, {
    required int salesOrderId,
  }) async {
    final layouts =
        await fetchMultiBySalesOrderId(session, salesOrderId: salesOrderId);

    final res = layouts
        .map(
          (e) => SalesOrderMultiNutzenlayoutLightDTO(
            salesOrderId: salesOrderId,
            salesOrderMultiNutzenlayoutId: e.id!,
            // nutzenlayout: e.nutzenlayout!,
            nutzenlayout:
                NutzenlayoutHandler.nutzenlayoutWithCellArtworkAssignments(
              e.nutzenlayout!,
              e.cellArtworkAssignments,
            ),
            artworks: e.artworks!.map((e) => e.artworkId).toList(),
          ),
        )
        .toList();
    return res;
  }

  Future<List<NutzenlayoutDTO>> fetchByCustomerWithDimensions(
    Session session, {
    required int customerId,
    required List<NutzenlayoutArtworkDimensions> dimensions,
  }) async {
    final dimsJson = jsonEncode(
      dimensions.map((d) => {'width': d.width, 'height': d.height}).toList(),
    );

    final resultRows = await session.db.unsafeQuery(
      // R-String verhindert Dart-Interpolation von $1 / $2
      r'''
  SELECT *
  FROM   ed_prepress_nutzenlayout AS t
  WHERE  t."customerId" = $1
    AND  jsonb_array_length(t."dimensions"::jsonb)
         = jsonb_array_length($2::jsonb)
    AND  NOT EXISTS (
           SELECT 1
           FROM (
                  SELECT elem, COUNT(*) AS cnt_db
                  FROM   jsonb_array_elements(t."dimensions"::jsonb) AS elem
                  GROUP  BY elem
                ) db
           FULL JOIN (
                  SELECT elem, COUNT(*) AS cnt_wanted
                  FROM   jsonb_array_elements($2::jsonb) AS elem
                  GROUP  BY elem
                ) w USING (elem)
           WHERE db.cnt_db IS DISTINCT FROM w.cnt_wanted
         );
  ''',
      parameters: QueryParameters.positional([customerId, dimsJson]),
    );

    return resultRows
        .map((row) => NutzenlayoutDTO.fromJson(row.toColumnMap()))
        .toList();
    final nutzenlayouts = await NutzenlayoutDTO.db.find(
      session,
      // where: (t) =>
      //     t.customerId.equals(customerId) &
      //     (t.cellX.equals(cellX) & t.cellY.equals(cellY)),
      orderDescending: true,
    );
    return nutzenlayouts;
  }

  Future<List<NutzenlayoutDTO>> fetchMultiByCustomerWithDimensions(
    Session session, {
    required int customerId,
    required List<NutzenlayoutArtworkDimensions> dimensions,
  }) async {
    // Convert dimensions to a list of JSON objects for SQL comparison
    final dimsJson = jsonEncode(
      dimensions.map((d) => {'width': d.width, 'height': d.height}).toList(),
    );

    final resultRows = await session.db.unsafeQuery(
      // R-String verhindert Dart-Interpolation von $1 / $2
      r'''
  SELECT *
  FROM   ed_prepress_nutzenlayout AS t
  WHERE  t."customerId" = $1
    AND  jsonb_array_length(t."dimensions"::jsonb)
         = jsonb_array_length($2::jsonb)
    AND  NOT EXISTS (
           SELECT 1
           FROM (
                  SELECT elem, COUNT(*) AS cnt_db
                  FROM   jsonb_array_elements(t."dimensions"::jsonb) AS elem
                  GROUP  BY elem
                ) db
           FULL JOIN (
                  SELECT elem, COUNT(*) AS cnt_wanted
                  FROM   jsonb_array_elements($2::jsonb) AS elem
                  GROUP  BY elem
                ) w USING (elem)
           WHERE db.cnt_db IS DISTINCT FROM w.cnt_wanted
         );
  ''',
      parameters: QueryParameters.positional([customerId, dimsJson]),
    );

    return resultRows
        .map((row) => NutzenlayoutDTO.fromJson(row.toColumnMap()))
        .toList();
  }

  Future<List<int>> getNutzelayoutsByMasterId(
    Session session, {
    required Set<int> masterIds,
  }) async {
    // get all nutzenlayouts where one of the artworks is in
    final nutzenlayouts = await SalesOrderSingleNutzenlayoutDTO.db.find(
      session,
      where: (t) =>
          t.artworks.any((e) => e.artwork.artworkMasterId.inSet(masterIds)),
      include: SalesOrderSingleNutzenlayoutDTO.include(
        nutzenlayout: NutzenlayoutDTO.include(),
      ),
    );

    if (nutzenlayouts.isEmpty) {
      return [];
    }
    return nutzenlayouts.map((e) => e.nutzenlayoutId).toList();
  }

  Future<void> createSingleNutzenlayoutWithArtworks(
    Session session, {
    required NutzenlayoutDTO dto,
    required Set<int> artworkIds,
    required int salesOrderId,
  }) async {
    final res = await NutzenlayoutHandler.createSingleNutzenlayoutWithArtworks(
      session,
      singleNutzenlayoutDTO: dto,
      artworkIds: artworkIds,
      salesOrderId: salesOrderId,
      isInitialNutzenlayout: true,
    );
    return res;
  }

  Future<void> createMultiNutzenlayoutWithArtworks(
    Session session, {
    required NutzenlayoutDTO dto,
    required Set<int> artworkIds,
    required int salesOrderId,
    required Set<NutzenlayoutArtworkDimensions> dimensions,
    required bool isExistingNutzenlayout,
  }) async {
    final res = await NutzenlayoutHandler.createMultiNutzenlayoutWithArtworks(
      session,
      multiNutzenlayoutDTO: dto,
      artworkIds: artworkIds,
      salesOrderId: salesOrderId,
      dimensions: dimensions,
      isExistingNutzenlayout: isExistingNutzenlayout,
    );
  }

  Future<void> addArtworksToNutzenlayout(
    Session session, {
    required NutzenlayoutDTO nutzenlayoutDTO,
    required Set<int> artworkIds,
    required int salesOrderId,
  }) async {
    await NutzenlayoutHandler.addArtworksToSingleNutzenlayout(
      session,
      nutzenlayoutDTO: nutzenlayoutDTO,
      artworkIds: artworkIds,
      salesOrderId: salesOrderId,
    );
  }

  Future<void> detachArtworksFromSalesOrderNutzenlayout(
    Session session, {
    required int salesOrderId,
    required int nutzenlayoutId,
    required Set<int> artworkIds,
  }) async {
    await NutzenlayoutHandler.detachArtworksFromSalesOrderSingleNutzenlayout(
      session,
      salesOrderId: salesOrderId,
      nutzenlayoutId: nutzenlayoutId,
      artworkIds: artworkIds,
    );
  }
}
