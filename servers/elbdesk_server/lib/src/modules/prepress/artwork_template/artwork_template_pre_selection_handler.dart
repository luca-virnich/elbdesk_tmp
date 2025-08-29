import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_pre_selection_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/endpoints/artwork_template_pre_selection_endpoint.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkTemplatePreSelectionHandler {
  const ArtworkTemplatePreSelectionHandler._();

  static Future<ArtworkTemplatePreSelectionDTO> create(
    Session session, {
    required ArtworkTemplatePreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final initialEntity = ArtworkTemplatePreSelectionUtils.initialPreSelection(
      userId: userId,
      sessionId: sessionId,
      entity: entity,
      release: release,
      now: now,
    );
    final inserted = await GenericCrud.create(
      session,
      ArtworkTemplatePreSelectionDTO.db.insertRow(session, initialEntity),
    );
    final refetch = await ArtworkTemplatePreSelectionDTO.db.findById(
      session,
      inserted.id!,
      include: ArtworkTemplatePreSelectionDTO.include(
        customer: CustomerDTO.include(),
      ),
    );
    artworkTemplatePreSelectionStreamController.add(refetch!);
    return refetch;
  }

  static Future<ArtworkTemplatePreSelectionDTO?> _fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkTemplatePreSelectionDTO.db.findById(
      session,
      id,
      include: ArtworkTemplatePreSelectionDTO.include(
        customer: CustomerDTO.include(),
      ),
      transaction: transaction,
    );
  }

  static Future<ArtworkTemplatePreSelectionDTO> _updateRow(
    Session session,
    ArtworkTemplatePreSelectionDTO entity,
    Transaction transaction,
  ) async {
    return ArtworkTemplatePreSelectionDTO.db
        .updateRow(session, entity, transaction: transaction);
  }

  static Future<ArtworkTemplatePreSelectionDTO> update(
    Session session, {
    required ArtworkTemplatePreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update(
      session,
      fetchById: _fetchById,
      sessionId: sessionId,
      newEntity: entity,
      updateEntity: _updateRow,
      tableType: ArtworkTemplatePreSelectionUtils.tableType,
      streamController: artworkTemplatePreSelectionStreamController,
      release: release,
      logFields: [],
    );
  }

  static Future<ArtworkTemplatePreSelectionDTO> createDefaultPreSelection(
    Session session, {
    required int customerId,
    required Transaction transaction,
    required int userId,
    required DateTime now,
  }) async {
    final defaultPreSelection = ArtworkTemplatePreSelectionDTO(
      description: 'Standard',
      customerId: customerId,
      isDraft: false,
      createdAt: now,
      createdById: userId,
    );
    return ArtworkTemplatePreSelectionDTO.db
        .insertRow(session, defaultPreSelection, transaction: transaction);
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ArtworkTemplatePreSelectionDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: _fetchById,
      updateEntity: _updateRow,
      tableType: ArtworkTemplatePreSelectionUtils.tableType,
      streamController: artworkTemplatePreSelectionStreamController,
      deleteDraft: null,
    );
  }

  static Future<ArtworkTemplatePreSelectionDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ArtworkTemplatePreSelectionDTO>(
      session,
      id: id,
      tableType: ArtworkTemplatePreSelectionUtils.tableType,
      editingSessionId: editingSessionId,
      fetchById: _fetchById,
      tableName: ArtworkTemplatePreSelectionDTOTable().tableName,
      streamController: artworkTemplatePreSelectionStreamController,
    );
  }
}
