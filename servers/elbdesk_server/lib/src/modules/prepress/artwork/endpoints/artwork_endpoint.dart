import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/product_artwork_handler.dart';
import 'package:serverpod/serverpod.dart';

/// Artwork Stream Controller
///
/// A stream controller for the general Artwork entity
final artworkStreamController = StreamController<ArtworkDTO>.broadcast();

/// Remove Artwork From Sales Order Controller
///
/// A stream controller to
final removeArtworkFromSalesOrderController = StreamController<int>.broadcast();

/// Artwork Endpoint
///
/// A endpoint for the Artwork entity
class ArtworkEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _tableType = TableType.artwork;

  // *
  // * Streams
  // *

  /// Watch a signle Artwork Entity
  Stream<ArtworkDTO> watchEntity(
    Session session, {
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) async* {
    if (releaseOnClose) {
      session.addWillCloseListener(
        (session) {
          release(session, entityId: entityId, sessionId: sessionId);
        },
      );
    }

    yield* artworkStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  /// Watch an Artwork by Sales Order ID
  Stream<ArtworkDTO> watchForSalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* artworkStreamController.stream
        .where((event) => event.salesOrderId == salesOrderId)
        .map((event) {
      return event;
    });
  }

  /// Watch Deletions For Sales Order
  ///
  /// A stream controller to watch the deletions for a sales order
  Stream<int> watchDeletionsForSalesOrder(
    Session session, {
    required int salesOrderId,
  }) async* {
    yield* removeArtworkFromSalesOrderController.stream;
  }

  ///
  /// * Fetch & Find
  ///

  /// Fetch a single Artwork By ID
  Future<ArtworkDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ArtworkDTO.db.findById(
      session,
      id,
      include: ArtworkUtils.includeAll,
    );
  }

  // Future<SoiPrepareArtworkDTO?> createSoiPrepareArtworkFromArtwork(
  //   Session session, {
  //   required int artworkId,
  //   required int salesOrderId,
  //   required int artworkMasterId,
  //   required int customerId,
  // }) async {
  //   await SoiPrepareArtworkEndpoint().createFromSalesOrderArtwork(
  //     session,
  //     artworkId: artworkId,
  //     salesOrderId: salesOrderId,
  //     artworkMasterId: artworkMasterId,
  //     customerId: customerId,
  //   );
  //   return null;
  // }

  Future<int> fetchCustomerId(Session session, int id) async {
    final artwork = await ArtworkDTO.db.findById(
      session,
      id,
      include: ArtworkDTO.include(
        customer: CustomerDTO.include(),
      ),
    );
    return artwork?.customerId ?? 0;
  }

  /// Fetch Artwork in read only mode
  Future<ArtworkDTO?> fetchReadOnly(Session session, int id) async {
    return ArtworkDTO.db.findById(
      session,
      id,
      include: ArtworkDTO.include(
        artworkMaster: ArtworkMasterDTO.include(),
        salesOrder: SalesOrderDTO.include(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        product: ProductDTO.include(),
      ),
    );
  }

  /// Fetch List of Artworks By Sales Order ID
  Future<List<ArtworkDTO>> fetchBySalesOrderId(
    Session session,
    int salesOrderId,
  ) async {
    return ArtworkDTO.db.find(
      session,
      where: (t) =>
          t.salesOrderId.equals(salesOrderId) &
          t.deletedAt.equals(null as DateTime?),
      include: ArtworkDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      ),
    );
  }

  /// Fetch History of Artwork by Master ID
  Future<List<ArtworkDTO>> fetchHistory(
    Session session,
    int artworkMasterId,
  ) async {
    return ArtworkDTO.db.find(
      session,
      where: (t) =>
          t.artworkMasterId.equals(artworkMasterId) &
          t.deletedAt.equals(null as DateTime?),
      include: ArtworkDTO.include(
        salesOrder: SalesOrderDTO.include(),
        product: ProductDTO.include(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      ),
    );
  }

  /// Fetch and Lock Artwork
  ///
  /// The update happens inside of the unsafeQuery method
  Future<ArtworkDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ArtworkHandler.fetchAndLock(
      session,
      id: id,
      sessionId: editingSessionId,
    );
  }

  /// Update Artwork
  Future<ArtworkDTO> update(
    Session session, {
    required ArtworkDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final artwork = await ProductArtworkHandler.updateArtwork(
      session,
      artwork: entity,
      sessionId: sessionId,
      release: release,
    );
    return artwork;
  }

  /// Release Artwork for editing
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await ArtworkHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<String>> fetchArtworkLayerNames(Session session) async {
    final masterArtworks = await ArtworkMasterDTO.db.find(
      session,
      where: (t) => t.deletedAt.equals(null as DateTime?),
    );

    // Extract all layer names from all artworks
    final allLayerNames = <String>{};
    for (final artwork in masterArtworks) {
      for (final layer in artwork.layers) {
        if (layer.layerName.isNotEmpty) {
          allLayerNames.add(layer.layerName);
        }
      }
    }

    // Convert the set to a list to return unique layer names
    return allLayerNames.toList();
  }

  /// Find Artwork

  /// Fetch All Artworks from a specific Customer
  Future<List<ArtworkDTO>> fetchAllArtworksFromCustomer(
    Session session,
    int customerId,
  ) async {
    return ArtworkDTO.db.find(
      session,
      where: (t) => t.customerId.equals(customerId),
      include: ArtworkUtils.includeAll,
    );
  }

  /// Find Entity Locks
  /// -> Returns a list of locked entities for the Artwork table
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: _tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
