import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/prepress/color/artwork_color_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/color/endpoints/artwork_color_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final colorStreamController = StreamController<ArtworkColorDTO>.broadcast();

/// Artwork Color Endpoint
///
/// Used to manage the ArtworkColor Table of the database
class ArtworkColorEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<ArtworkColorDTO> watch(
    Session session, {
    required String sessionId,
    required int entityId,
  }) async* {
    session.addWillCloseListener(
      (session) {
        release(session, entityId: entityId, sessionId: sessionId);
      },
    );

    yield* colorStreamController.stream
        .where((event) => event.id == entityId)
        .map((event) => event);
  }

  Future<ArtworkColorDTO?> fetchById(
    Session session,
    int id,
  ) async {
    return ArtworkColorDTO.db.findById(
      session,
      id,
      include: ArtworkColorUtils.includeAll,
    );
  }

  Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return ArtworkColorHandler.release(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<ArtworkColorDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String editingSessionId,
  }) async {
    return ArtworkColorHandler.fetchAndLock(
      session,
      id: id,
      editingSessionId: editingSessionId,
    );
  }

  Future<ArtworkColorDTO> create(
    Session session, {
    required String sessionId,
    required int colorPaletteId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final initialEntity = ArtworkColorUtils.initialDTO(
      userId: userId,
      sessionId: sessionId,
      colorPaletteId: colorPaletteId,
      now: now,
    );

    try {
      final result = await GenericCrud.create(
        session,
        ArtworkColorDTO.db.insertRow(session, initialEntity),
      );
      return result;
    } catch (e) {
      if (e is ElbException) {
        // If this exception is thrown, it means that the sequence is probably
        // not in sync with the database because you imported colors from a
        // different csv or similar
        // We need to reset the sequence to the highest id in the table.
        await session.db.unsafeExecute(
          // ignore: lines_longer_than_80_chars
          "SELECT setval('ed_prepress_color_id_seq', (SELECT MAX(id) FROM ed_prepress_color))",
        );

        // Try again afterwards
        return GenericCrud.create(
          session,
          ArtworkColorDTO.db.insertRow(session, initialEntity),
        );
      }
      rethrow;
    }
  }

  Future<ArtworkColorDTO> createFromCsv(
    Session session, {
    required ArtworkColorDTO artworkColor,
  }) async {
    return ArtworkColorDTO.db.insertRow(session, artworkColor);
  }

  Future<void> importColors(
    Session session, {
    required List<ArtworkColorDTO> artworkColors,
    required String paletteName,
    int? customerId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final palette = await PrepressColorPaletteDTO.db.findFirstRow(
      session,
      where: (t) => t.paletteName.equals(paletteName),
    );
    var paletteId = palette?.id;

    // create new palette if it doesn't exist
    if (paletteId == null) {
      final newPalette = await PrepressColorPaletteDTO.db.insertRow(
        session,
        PrepressColorPaletteDTO(
          paletteName: paletteName,
          description: '',
          createdAt: now,
          isDraft: false,
          createdById: userId,
          customerId: customerId,
        ),
      );
      paletteId = newPalette.id;
    }

    await addColorsToPalette(
      session,
      artworkColors: artworkColors,
      paletteId: paletteId!,
    );
  }

  Future<void> addColorsToPalette(
    Session session, {
    required List<ArtworkColorDTO> artworkColors,
    required int paletteId,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

    final colors = artworkColors
        .map(
          (c) => c.copyWith(
            colorPaletteId: paletteId,
            createdAt: now,
            createdById: userId,
            isDraft: false,
          ),
        )
        .toList();

    // Check if colors already exist and handle accordingly
    for (final color in colors) {
      final existingColor = await ArtworkColorDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.colorPaletteId.equals(paletteId) &
            t.colorName.equals(color.colorName),
      );
      if (existingColor == null) {
        // Color doesn't exist, insert it
        await ArtworkColorDTO.db.insertRow(session, color);
      } else {
        // Color exists, update it
        await ArtworkColorDTO.db.updateRow(
          session,
          color.copyWith(
            id: existingColor.id,
            colorPaletteId: existingColor.colorPaletteId,
            createdAt: existingColor.createdAt,
            createdById: existingColor.createdById,
            lastModifiedAt: now,
            lastModifiedById: userId,
          ),
        );
      }
    }
  }

  Future<List<ArtworkColorDTO>> findByShortName(
    Session session, {
    required int customerId,
    required String shortName,
  }) async {
    return ArtworkColorDTO.db.find(
      session,
      include: ArtworkColorDTO.include(
        colorPalette: PrepressColorPaletteDTO.include(),
      ),
      where: (t) =>
          t.shortName.equals(shortName) &
          (t.colorPalette.customerId.equals(customerId) |
              t.colorPalette.customerId.equals(null)) &
          t.deletedAt.equals(null as DateTime?),
    );
  }

  /// Updates the short name of an ArtworkColor by its entity ID.
  ///
  /// This method ignores session IDs and other context-specific information,
  /// focusing solely on updating the short name of the ArtworkColor with the
  /// specified entity ID.
  ///
  /// [entityId] The entity ID of the ArtworkColor to update.
  /// [shortName] The new short name to assign to the ArtworkColor.
  Future<void> updateShortName(
    Session session, {
    int? entityId,
    String? shortName,
  }) async {
    final artworkColor = await ArtworkColorDTO.db.findFirstRow(
      session,
      where: (t) => t.id.equals(entityId),
    );

    if (artworkColor != null) {
      await ArtworkColorDTO.db.updateRow(
        session,
        artworkColor.copyWith(
          shortName: shortName,
        ),
      );
    }
  }

  Future<List<ArtworkColorDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkColorField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ArtworkColorUtils.buildExpression(filter);

    return ArtworkColorDTO.db.find(
      session,
      where: expression == null
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: ArtworkColorUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ArtworkColorUtils.includeAll,
    );
  }

  Future<List<ArtworkColorDTO>> findAllByCustomerId(
    Session session, {
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkColorField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ArtworkColorUtils.buildExpression(filter);

    return ArtworkColorDTO.db.find(
      session,
      where: expression == null
          ? (t) {
              return (t.colorPalette.customerId.equals(customerId) |
                      t.colorPalette.customerId.equals(null)) &
                  t.deletedAt.equals(null as DateTime?);
            }
          : (t) {
              return expression &
                  (t.colorPalette.customerId.equals(customerId) |
                      t.colorPalette.customerId.equals(null)) &
                  t.deletedAt.equals(null as DateTime?);
            },
      orderBy: ArtworkColorUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
      include: ArtworkColorUtils.includeAll,
    );
  }

  Future<List<ArtworkColorDTO>> fetchColorPaletteColors(
    Session session, {
    required int colorPaletteId,
  }) async {
    return ArtworkColorDTO.db.find(
      session,
      include: ArtworkColorDTO.include(
        colorPalette: PrepressColorPaletteDTO.include(),
      ),
      where: (t) =>
          t.colorPaletteId.equals(colorPaletteId) &
          t.isDraft.equals(false) &
          t.deletedAt.equals(null),
    );
  }

  Future<ArtworkColorDTO> update(
    Session session, {
    required ArtworkColorDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return ArtworkColorHandler.update(
      session,
      entity: entity,
      sessionId: sessionId,
      release: release,
    );
  }

  Future<bool> delete(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return ArtworkColorHandler.delete(
      session,
      entityId: entityId,
      sessionId: sessionId,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkColorDTO.db.find(
      session,
      where: (t) =>
          t.editingSession.notEquals(null as String?) &
          t.editingSession.notEquals(''),
    );

    return entities
        .map(
          (e) => EntityLockDTO(
            tableType: ArtworkColorUtils.tableType.name,
            entityId: e.id!,
            editingSessionId: e.editingSession!,
            lockedAt: e.editingSince!,
            userId: e.editingById,
          ),
        )
        .toList();
  }
}
