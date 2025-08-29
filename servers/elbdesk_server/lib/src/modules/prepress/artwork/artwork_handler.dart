import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/entity_log/entity_log_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_utils.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/endpoints/artwork_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/artwork_quarantine_handler.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

class ArtworkHandler {
  const ArtworkHandler._();

  static Future<ArtworkDTO?> fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return ArtworkDTO.db.findById(
      session,
      id,
      transaction: transaction,
      include: ArtworkUtils.includeAll,
    );
  }

  static Future<ArtworkDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<ArtworkDTO>(
      session,
      id: id,
      tableType: ArtworkUtils.tableType,
      editingSessionId: sessionId,
      fetchById: fetchById,
      tableName: ArtworkDTOTable().tableName,
      streamController: artworkStreamController,
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    await GenericCrud.releaseEntity<ArtworkDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: fetchById,
      updateEntity: _updateRow,
      tableType: ArtworkUtils.tableType,
      streamController: artworkStreamController,
      deleteDraft: null,
    );
  }

  static Future<ArtworkDTO> _updateRow(
    Session session,
    ArtworkDTO entity,
    Transaction transaction,
  ) async {
    return ArtworkDTO.db.updateRow(session, entity, transaction: transaction);
  }

  static Future<ArtworkDTO> create(
    Session session, {
    required ArtworkMasterDTO artworkMaster,
    required int productId,
    required int customerId,
    required int userId,
    required DateTime now,
    required Transaction transaction,
    required int salesOrderId,
    required int? artworkQuarantineId,
    required bool isLocked,
  }) async {
    final initialArtwork = ArtworkHandler.generateByMaster(
      artworkMaster: artworkMaster,
      productId: productId,
      customerId: customerId,
      userId: userId,
      now: now,
      salesOrderId: salesOrderId,
      artworkQuarantineId: artworkQuarantineId,
      isLocked: isLocked,
    );
    final artwork = await ArtworkDTO.db.insertRow(
      session,
      initialArtwork,
      transaction: transaction,
    );
    return artwork;
  }

  static Future<ArtworkMasterDTO> createMaster(
    Session session, {
    required ArtworkTemplateDTO artworkTemplate,
    required ArtworkPrintProcessType printProcessType,
    required ArtworkType artworkType,
    required int productMasterId,
    required int customerId,
    required int layerId,
    required int userId,
    required DateTime now,
    required ArtworkQuarantineDTO? artworkQuarantine,
    required Transaction transaction,
  }) async {
    final initialArtworkMaster = ArtworkHandler.generatekMasterByTemplate(
      template: artworkTemplate,
      printProcessType: printProcessType,
      artworkType: artworkType,
      productMasterId: productMasterId,
      artworkQuarantine: artworkQuarantine,
      customerId: customerId,
      layerId: layerId,
      userId: userId,
      now: now,
    );

    final artworkMaster = await ArtworkMasterDTO.db.insertRow(
      session,
      initialArtworkMaster,
      transaction: transaction,
    );
    return artworkMaster;
  }

  /// Unlocks an Artwork so it can be edited, typically when creating
  /// a Soi Prepare Artwork
  static Future<void> unlockArtwork(
    Session session,
    int artworkId, {
    required Transaction transaction,
  }) async {
    await session.db.unsafeQuery(
      'UPDATE ed_prepress_artwork SET "isLocked" = false WHERE id=$artworkId',
      transaction: transaction,
    );
  }

  /// Locks an Artwork so it can't be edited, typically when completing
  /// a Soi Prepare Artwork
  static Future<void> lockArtwork(
    Session session,
    int artworkId, {
    required Transaction transaction,
  }) async {
    await session.db.unsafeQuery(
      'UPDATE ed_prepress_artwork SET "isLocked" = true WHERE id=$artworkId',
      transaction: transaction,
    );
  }

  /// Checks if an Artwork is unlocked in another Sales Order
  static Future<bool> isUnlockedElsewhere(
    Session session, {
    required int artworkMasterId,
    required Transaction transaction,
    required int artworkId,
  }) async {
    final unlockedArtwork = await ArtworkDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.artworkMasterId.equals(artworkMasterId) &
          t.deletedAt.equals(null as DateTime?) &
          t.isLocked.equals(false) &
          t.id.notEquals(artworkId),
      transaction: transaction,
    );
    session.log('has unlocked artwork: $unlockedArtwork');
    // if null, we found no unlocked artwork, so we return false
    return unlockedArtwork != null;
  }

  /// Increases the Version of an Artwork, typically when we add a
  /// new Soi Prepare Artwork to an existing Artwork
  static Future<void> increaseVersion(
    Session session, {
    required int artworkId,
    required int artworkMasterId,
    required Transaction transaction,
  }) async {
    await session.db.unsafeQuery(
      'UPDATE ed_prepress_artwork SET "version" = "version" + 1 WHERE id=$artworkId',
      transaction: transaction,
    );
    await session.db.unsafeQuery(
      'UPDATE ed_prepress_artwork_master SET "version" = "version" + 1 WHERE id=$artworkMasterId',
      transaction: transaction,
    );
  }

  static ArtworkMasterDTO generatekMasterByTemplate({
    required ArtworkTemplateDTO template,
    required ArtworkPrintProcessType printProcessType,
    required ArtworkType artworkType,
    required int productMasterId,
    required int customerId,
    required int layerId,
    required int userId,
    required DateTime now,
    required ArtworkQuarantineDTO? artworkQuarantine,
  }) {
    return ArtworkMasterDTO(
      version: 1,
      artworkType: artworkType.name,
      printProcessType: printProcessType.name,
      codes: [],
      artworkQuarantineId: artworkQuarantine?.id,
      dieCutterType: artworkType.name,
      description: template.description,
      customerId: customerId,
      createdAt: now,
      createdById: userId,
      isDraft: false,
      colors: template.colors,
      layerId: layerId,
      width: artworkQuarantine?.width ?? 0,
      height: artworkQuarantine?.height ?? 0,
      cornerRadius: 0,
      trapping: template.trapping,
      layers: template.layers,
      anschnitt: template.anschnitt,
      productId: productMasterId,
      reference: '',
    );
  }

  /// Generates an Artwork by an Artwork Master
  /// typically used when creating a new artwork
  /// for a sales order
  static ArtworkDTO generateByMaster({
    required ArtworkMasterDTO artworkMaster,
    required int productId,
    required int customerId,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int? artworkQuarantineId,
    required bool isLocked,
  }) {
    return ArtworkDTO(
      version: artworkMaster.version,
      abzug: 1,
      isLocked: isLocked,
      salesOrderId: salesOrderId,
      dieCutterType: artworkMaster.dieCutterType,
      productId: productId,
      codes: artworkMaster.codes,
      artworkType: artworkMaster.artworkType,
      printProcessType: artworkMaster.printProcessType,
      description: artworkMaster.description,
      customerId: artworkMaster.customerId,
      artworkMasterId: artworkMaster.id!,
      height: artworkMaster.height,
      cornerRadius: artworkMaster.cornerRadius,
      trapping: artworkMaster.trapping,
      reference: artworkMaster.reference,
      layers: artworkMaster.layers,
      anschnitt: artworkMaster.anschnitt,
      colors: artworkMaster.colors,
      layerId: artworkMaster.layerId,
      artworkQuarantineId: artworkQuarantineId,
      width: artworkMaster.width,
      createdAt: now,
      createdById: userId,
      isDraft: false,
    );
  }

  static Future<ArtworkTemplateDTO?> validateTemplate(
    Session session, {
    required int artworkTemplateId,
    required Transaction transaction,
    bool throwException = true,
  }) async {
    final template = await ArtworkTemplateDTO.db.findById(
      session,
      artworkTemplateId,
      transaction: transaction,
    );
    if (throwException && template == null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.artworkTemplateNotFound,
      );
    }
    return template;
  }

  static Future<ArtworkQuarantineDTO?> validateQuarantine(
    Session session, {
    required int artworkQuarantineId,
    required Transaction transaction,
    bool throwException = true,
  }) async {
    final quarantine = await ArtworkQuarantineDTO.db.findFirstRow(
      session,
      where: (t) =>
          t.id.equals(artworkQuarantineId) &
          t.deletedAt.equals(null as DateTime?),
      transaction: transaction,
    );
    if (throwException && quarantine == null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.artworkQuarantineNotFound,
      );
    }

    // Check if an artwork master already exists for this quarantine
    if (quarantine != null) {
      final existingArtworkMaster = await ArtworkMasterDTO.db.findFirstRow(
        session,
        where: (t) => t.artworkQuarantineId.equals(artworkQuarantineId),
        transaction: transaction,
      );

      if (existingArtworkMaster != null) {
        session.log(
          'Error in: ArtworkHandler.validateQuarantine() '
          'artworkQuarantineId: $artworkQuarantineId',
        );
        throw ElbException(
          message: 'Artwork master already exists. '
              'This quarantine has already been processed.',
          exceptionType: ElbExceptionType.conflict,
        );
      }
    }

    return quarantine;
  }

  static Future<ArtworkQuarantineDTO> deleteQuarantine(
    Session session, {
    required ArtworkQuarantineDTO artworkQuarantine,
    required int userId,
    required DateTime now,
    required Transaction transaction,
  }) async {
    final deleted = await ArtworkQuarantineHandler.delete(
      session,
      entityId: artworkQuarantine.id!,
      transaction: transaction,
    );
    return deleted;
  }

  /// Updates an Artwork Master by an Artwork
  /// typically used when we update an Artwork, we want to also update the
  /// Master with the new data and log the changes
  static Future<void> updateMasterByArtwork(
    Session session,
    Transaction transaction, {
    required ArtworkDTO artwork,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int customSalesOrderId,
  }) async {
    // * Fetching Master
    final master = await ArtworkMasterDTO.db.findById(
      session,
      artwork.artworkMasterId,
      transaction: transaction,
    );
    if (master == null) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.artworkMasterNotFound,
      );
    }
    // * Updating Master
    final updatedMaster = ArtworkMasterDTO(
      dieCutterType: artwork.dieCutterType,
      cornerRadius: artwork.cornerRadius,
      version: artwork.version,
      artworkType: artwork.artworkType,
      printProcessType: artwork.printProcessType,
      codes: artwork.codes,
      id: master.id,
      description: artwork.description,
      reference: artwork.reference,
      customerId: artwork.customerId,
      productId: master.productId,
      width: artwork.width,
      height: artwork.height,
      trapping: artwork.trapping,
      layers: artwork.layers,
      anschnitt: artwork.anschnitt,
      colors: artwork.colors,
      createdAt: master.createdAt,
      createdById: master.createdById,
      lastModifiedAt: artwork.lastModifiedAt,
      lastModifiedById: artwork.lastModifiedById,
      layerId: artwork.layerId,
      isDraft: false,
    );
    await ArtworkMasterDTO.db.updateRow(
      session,
      updatedMaster,
      transaction: transaction,
    );
    await _logArtworkMaster(
      session,
      transaction,
      oldMaster: master,
      updatedMaster: updatedMaster,
      userId: userId,
      now: now,
      salesOrderId: salesOrderId,
      customSalesOrderId: customSalesOrderId,
    );
  }

  // * --------------------
  // *
  // * Logging Master
  // *
  // * --------------------

  static Future<void> _logArtworkMaster(
    Session session,
    Transaction transaction, {
    required ArtworkMasterDTO oldMaster,
    required ArtworkMasterDTO updatedMaster,
    required int userId,
    required DateTime now,
    required int salesOrderId,
    required int customSalesOrderId,
  }) async {
    final logs = <ArtworkLogDTO>[];

    final logFields = _artworkMasterLogFields();
    final entityId = oldMaster.id;
    for (final field in logFields) {
      final oldValue = field.getValue(oldMaster);
      final newValue = field.getValue(updatedMaster);
      if (oldValue != newValue) {
        logs.add(
          ArtworkLogDTO(
            entityId: entityId!,
            field: field.fieldName,
            oldValue: oldValue.toString(),
            newValue: newValue.toString(),
            salesOrderId: salesOrderId,
            salesOrderCustomId: customSalesOrderId,
            tableType: TableType.artworkMaster,
            updatedAt: now,
            updatedById: userId,
          ),
        );
      }
    }
    await ArtworkLogDTO.db.insert(session, logs, transaction: transaction);
  }

  static List<LogField<ArtworkMasterDTO>> _artworkMasterLogFields() {
    return ArtworkField.values
        .map((field) {
          switch (field) {
            case ArtworkField.artworkType:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.artworkType,
              );
            case ArtworkField.printProcessType:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.printProcessType,
              );
            case ArtworkField.description:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.description,
              );

            case ArtworkField.anschnitt:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.anschnitt.toString(),
              );
            case ArtworkField.trappNormal:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.trapping.trappNormal.toString(),
              );
            case ArtworkField.trappBlack:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.trapping.trappBlack.toString(),
              );
            case ArtworkField.trappBilder:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.trapping.trappBilder.toString(),
              );
            case ArtworkField.trappSonderfarben:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) =>
                    entity.trapping.trappSonderfarben.toString(),
              );
            case ArtworkField.trappRueckzug:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.trapping.trappRueckzug.toString(),
              );

            case ArtworkField.width:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.width.toString(),
              );
            case ArtworkField.height:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.height.toString(),
              );
            case ArtworkField.layers:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.layers.toString(),
              );

            case ArtworkField.colors:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.colors.toString(),
              );
            case ArtworkField.layerId:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.layerId.toString(),
              );
            case ArtworkField.codes:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.codes.toString(),
              );
            case ArtworkField.version:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.version.toString(),
              );
            case ArtworkField.reference:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.reference,
              );
            case ArtworkField.cornerRadius:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.cornerRadius.toString(),
              );
            case ArtworkField.dieCutterType:
              return LogField<ArtworkMasterDTO>(
                fieldName: field.name,
                getValue: (entity) => entity.dieCutterType,
              );
            case ArtworkField.abzug:
            case ArtworkField.customerId:
            case ArtworkField.id:
            case ArtworkField.createdAt:
            case ArtworkField.createdBy:
            case ArtworkField.lastModifiedAt:
            case ArtworkField.lastModifiedBy:
            case ArtworkField.isDraft:
            case ArtworkField.deletedAt:
            case ArtworkField.customer:
            case ArtworkField.salesOrderId:
            case ArtworkField.actions:
              return null;
          }
        })
        .whereType<LogField<ArtworkMasterDTO>>()
        .toList();
  }
}
