import 'dart:async';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_xml_handler.dart';
import 'package:serverpod/serverpod.dart';

final artworkQuarantineStreamController =
    StreamController<ArtworkQuarantineDTO>.broadcast();

final removeArtworkQuarantineDeletedController =
    StreamController<int>.broadcast();

class ArtworkQuarantineEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  // *
  // * Streams
  // *

  /// Watch a single Artwork Quarantine Entity
  Stream<ArtworkQuarantineDTO> watchEntity(
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

    // Yield initial entity if it exists
    final initialEntity = await fetchById(session, entityId);
    if (initialEntity != null) {
      yield initialEntity;
    }

    yield* artworkQuarantineStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  // fetchByGroupId
  Future<List<ArtworkQuarantineDTO>> fetchByGroupId(
    Session session,
    int groupId,
  ) async {
    return ArtworkQuarantineHandler.fetchByGroupId(session, groupId);
  }

  // fetchByGroupIdAndStatus
  Future<List<ArtworkQuarantineDTO>> fetchByGroupIdAndStatus(
    Session session,
    int groupId,
    ArtworkQuarantineGroupStatus status,
  ) async {
    return ArtworkQuarantineHandler.fetchByGroupIdAndStatus(
      session,
      groupId,
      status,
    );
  }

  Stream<ArtworkQuarantineDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* artworkQuarantineStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) {
      return event;
    });
  }

  Stream<int> watchDeleted(
    Session session,
  ) async* {
    yield* removeArtworkQuarantineDeletedController.stream;
  }

  Stream<ArtworkQuarantineDTO> watchCustomerQuarantines(
    Session session, {
    required int customerId,
  }) async* {
    yield* artworkQuarantineStreamController.stream
        .where((event) => event.customerId == customerId)
        .asyncMap((event) async {
      // Fetch the full entity with includes
      final fullEntity = await ArtworkQuarantineDTO.db.findById(
        session,
        event.id!,
        include: ArtworkQuarantineUtils.includeAll,
      );
      return fullEntity ?? event;
    });
  }

  Stream<ArtworkQuarantineDTO> watchAllQuarantines(
    Session session,
  ) async* {
    yield* artworkQuarantineStreamController.stream;
  }

  // *
  // * Fetch & Find
  // *

  /// Fetch a single Artwork Quarantine By ID
  Future<ArtworkQuarantineDTO?> fetchById(Session session, int id) async {
    return ArtworkQuarantineHandler.fetchById(session, id);
  }

  /// Fetch and Lock Artwork Quarantine
  ///
  /// The update happens inside of the unsafeQuery method
  Future<ArtworkQuarantineDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ArtworkQuarantineHandler.fetchAndLock(
      session,
      id: id,
      sessionId: editingSessionId,
    );
  }

  /// Update Artwork Quarantine
  Future<ArtworkQuarantineDTO> update(
    Session session, {
    required ArtworkQuarantineDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkQuarantineHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  /// Release Artwork Quarantine for editing
  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await ArtworkQuarantineHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  // *
  // * CRUD Operations
  // *

  // Future<ArtworkQuarantineDTO> create(
  //   Session session, {
  //   required String sessionId,
  //   required String description,
  //   required int customerId,
  //   required int groupId,
  // }) async {
  //   return ArtworkQuarantineHandler.create(
  //     session,
  //     sessionId: sessionId,
  //     description: description,
  //     customerId: customerId,
  //     groupId: groupId,
  //   );
  // }

  Future<ArtworkQuarantineDTO> createFromDateneingang(
    Session session, {
    required int customerId,
    required ArtworkQuarantineDTO artworkQuarantine,
  }) async {
    return ArtworkQuarantineHandler.createFromDateneingang(
      session,
      customerId: customerId,
      artworkQuarantine: artworkQuarantine,
    );
  }

  Future<List<ArtworkQuarantineDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    return ArtworkQuarantineHandler.find(
      session,
      sort: sort,
      filter: filter,
    );
  }

  Future<List<ArtworkQuarantineDTO>> fetchByCustomerId(
    Session session,
    int customerId,
  ) async {
    return ArtworkQuarantineHandler.fetchByCustomerId(session, customerId);
  }

  Future<void> deleteFromArtworkCreation(
    Session session,
    int artworkQuarantineId,
  ) async {
    await ArtworkQuarantineHandler.deleteFromArtworkCreation(
      session,
      artworkQuarantineId,
    );
  }

  Future<void> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await session.db.transaction(
      (transaction) async {
        await ArtworkQuarantineHandler.delete(
          session,
          entityId: entityId,
          transaction: transaction,
        );
      },
    );
  }

  /// Find Entity Locks
  /// -> Returns a list of locked entities for the Artwork Quarantine table
  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    return ArtworkQuarantineHandler.findEntityLocks(session);
  }

  // *
  // * XML Operations
  // *

  /// Updates artwork quarantine with XML analysis from a file path
  ///
  /// This method is used to mock the AE Webhook call with a local file
  /// from the client
  Future<void> mockAEwebhookWithQuarantineXml(
    Session session,
    String xmlContent,
  ) async {
    try {
      return ArtworkQuarantineXmlHandler.updateArtworkWithAnalysis(
        session,
        xmlContent,
      );
    } catch (e) {
      session.log(
        'Failed to read and parse XML file: $e',
        level: LogLevel.error,
      );
      rethrow;
    }
  }
}
