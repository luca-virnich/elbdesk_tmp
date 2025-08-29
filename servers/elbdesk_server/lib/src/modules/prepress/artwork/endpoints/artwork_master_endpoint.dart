import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

/// Artwork Master Stream Controller
final artworkMasterStreamController =
    StreamController<ArtworkMasterDTO>.broadcast();

/// Artwork Master Endpoint
class ArtworkMasterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _tableType = TableType.artworkMaster;

  /// Include All for Artwork Master
  /// Used to fetch all relevant fields for the Artwork Master entity
  static ArtworkMasterDTOInclude get _artworkMasterIncludeAll =>
      ArtworkMasterDTO.include(
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      );

  /// Fetch a single Artwork Master By ID
  Future<ArtworkMasterDTO?> fetchById(Session session, int id) async {
    return ArtworkMasterDTO.db.findById(
      session,
      id,
      include: ArtworkMasterDTO.include(),
    );
  }

  /// Fetch a single Artwork Master by id
  Future<ArtworkMasterDTO?> fetchForCreation(
    Session session,
    int id,
  ) async {
    return ArtworkMasterEndpoint().fetchById(session, id);
  }

  Future<List<ArtworkMasterDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression =
        buildFilterExpression<ArtworkMasterDTOTable, ArtworkField>(
      table: ArtworkMasterDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          ArtworkField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );

    return ArtworkMasterDTO.db.find(
      session,
      where: expression == null
          // Filters out deleted entries
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: sortByField != null
          ? _dbFieldFromEnum(sortByField)
          : _dbFieldFromEnum(ArtworkField.description),
      orderDescending: sort?.orderDescending ?? false,
      include: _artworkMasterIncludeAll,
    );
  }

  Future<List<ArtworkMasterDTO>> findByCustomer(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ArtworkField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );
    final expression =
        buildFilterExpression<ArtworkMasterDTOTable, ArtworkField>(
      table: ArtworkMasterDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          ArtworkField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => _dbFieldFromEnum(field)(table),
    );

    return ArtworkMasterDTO.db.find(
      session,
      where: expression == null
          // Filters out deleted entries
          ? (t) => t.deletedAt.equals(null as DateTime?)
          : (t) => expression,
      orderBy: sortByField != null
          ? _dbFieldFromEnum(sortByField)
          : _dbFieldFromEnum(ArtworkField.description),
      orderDescending: sort?.orderDescending ?? false,
      include: ArtworkMasterDTO.include(),
    );
  }

  Column<dynamic> Function(ArtworkMasterDTOTable) _dbFieldFromEnum(
    ArtworkField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case ArtworkField.version:
        return (ArtworkMasterDTOTable t) => t.version;
      case ArtworkField.artworkType:
        return (ArtworkMasterDTOTable t) => t.artworkType;
      case ArtworkField.printProcessType:
        return (ArtworkMasterDTOTable t) => t.printProcessType;
      case ArtworkField.customerId:
        return (ArtworkMasterDTOTable t) => t.customerId;
      case ArtworkField.description:
        return (ArtworkMasterDTOTable t) => t.description;

      case ArtworkField.salesOrderId:
        return (ArtworkMasterDTOTable t) => t.id;
      case ArtworkField.customer:
        return (ArtworkMasterDTOTable t) => t.customerId;
      case ArtworkField.reference:
        return (ArtworkMasterDTOTable t) => t.reference;
      case ArtworkField.width:
        return (ArtworkMasterDTOTable t) => t.width;
      case ArtworkField.height:
        return (ArtworkMasterDTOTable t) => t.height;
      case ArtworkField.colors:
        return (ArtworkMasterDTOTable t) => t.colors;
      case ArtworkField.id:
        return (ArtworkMasterDTOTable t) => t.id;
      case ArtworkField.createdAt:
        return (ArtworkMasterDTOTable t) => t.createdAt;
      case ArtworkField.createdBy:
        return (ArtworkMasterDTOTable t) => t.createdById;
      case ArtworkField.layerId:
        return (ArtworkMasterDTOTable t) => t.layerId;
      case ArtworkField.lastModifiedAt:
        return (ArtworkMasterDTOTable t) => t.lastModifiedAt;
      case ArtworkField.lastModifiedBy:
        return (ArtworkMasterDTOTable t) => t.lastModifiedById;
      case ArtworkField.trappNormal:
        return (ArtworkMasterDTOTable t) => t.trapping;
      case ArtworkField.trappBlack:
        return (ArtworkMasterDTOTable t) => t.trapping;
      case ArtworkField.trappBilder:
        return (ArtworkMasterDTOTable t) => t.trapping;
      case ArtworkField.trappSonderfarben:
        return (ArtworkMasterDTOTable t) => t.trapping;
      case ArtworkField.trappRueckzug:
        return (ArtworkMasterDTOTable t) => t.trapping;

      case ArtworkField.anschnitt:
        return (ArtworkMasterDTOTable t) => t.anschnitt;
      case ArtworkField.layers:
        return (ArtworkMasterDTOTable t) => t.layers;
      case ArtworkField.deletedAt:
        return (ArtworkMasterDTOTable t) => t.deletedAt;
      case ArtworkField.isDraft:
        return (ArtworkMasterDTOTable t) => t.isDraft;

      case ArtworkField.actions:
        return (ArtworkMasterDTOTable t) => t.id;
      case ArtworkField.codes:
        return (ArtworkMasterDTOTable t) => t.codes;
      case ArtworkField.abzug:
        return (ArtworkMasterDTOTable t) => t.id;
      case ArtworkField.cornerRadius:
        return (ArtworkMasterDTOTable t) => t.cornerRadius;
      case ArtworkField.dieCutterType:
        return (ArtworkMasterDTOTable t) => t.dieCutterType;
    }
  }

  Future<List<ArtworkMasterDTO>> fetchAllArtworksFromCustomer(
    Session session,
    int customerId,
  ) async {
    return ArtworkMasterDTO.db.find(
      session,
      where: (t) => t.customerId.equals(customerId),
      include: _artworkMasterIncludeAll,
    );
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ArtworkMasterDTO.db.find(
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
