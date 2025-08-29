import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/prepress/product/product_master_utils.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

final prepressProductStreamController =
    StreamController<ProductMasterDTO>.broadcast();

class ProductMasterEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  static const _tableType = TableType.productMaster;

  Future<List<ProductMasterDTO>> findByCustomer(
    Session session, {
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ProductField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ProductMasterUtils.buildExpression(filter);

    final t = ProductMasterDTOTable();
    final customerExpression = t.customerId.equals(customerId);
    final whereExpression = expression != null
        ? expression & customerExpression
        : customerExpression;

    return ProductMasterDTO.db.find(
      session,
      where: (t) => whereExpression,
      orderBy: ProductMasterUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? true,
      include: ProductMasterDTO.include(
        artworks: ArtworkMasterDTO.includeList(),
      ),
    );
  }

  Future<List<ProductMasterDTO>> find(
    Session session, {
    Sort? sort,
    Filter? filter,
  }) async {
    final sortByField = ProductField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final expression = ProductMasterUtils.buildExpression(filter);

    return ProductMasterDTO.db.find(
      session,
      where: expression != null ? (t) => expression : null,
      orderBy: ProductMasterUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? true,
      include: ProductMasterDTO.include(
        artworks: ArtworkMasterDTO.includeList(),
      ),
    );
  }

  /// Fetch a single Product Master By ID
  Future<ProductMasterDTO?> fetchById(Session session, int id) async {
    return ProductMasterDTO.db.findById(
      session,
      id,
      include: ProductMasterDTO.include(),
    );
  }

  Future<int> fetchNextSerienIndex(Session session, int serienId) async {
    final products = await ProductMasterDTO.db.find(
      session,
      where: (t) =>
          t.serienId.equals(serienId) & t.deletedAt.equals(null as DateTime?),
    );
    // every product has a unique serienIndex, get the highest and add 1
    final maxSerienIndex = products.map((e) => e.serienIndex).max;
    return maxSerienIndex + 1;
  }

  Future<bool> checkIfSerienIndexIsAvailable(
    Session session,
    int serienId,
    int serienIndex,
  ) async {
    final products = await ProductMasterDTO.db.find(
      session,
      where: (t) =>
          t.serienId.equals(serienId) &
          t.deletedAt.equals(null as DateTime?) &
          t.serienIndex.equals(serienIndex),
    );
    return products.isEmpty;
  }

  // Future<ProductMasterDTO?> create(
  //   Session session, {
  //   required int serienIndex,
  //   required int customerId,
  //   required int? serienId,
  //   required String description,
  //   required ProductType productType,
  //   required ArtworkPrintProcessType printProcessType,
  //   DateTime? now,
  // }) async {
  //   var productSerienId = serienId;
  //   productSerienId ??=
  //       await CustomEntityKeysEndpoint().getNextIntKeyTransaction(_tableType);
  //   final createdAt = now ?? DateTime.now();

  //   final newMasterProductDTO = ProductMasterDTO(
  //     printProcessType: printProcessType.name,
  //     customerReference: '',
  //     description: description,
  //     productType: productType.name,
  //     keywords: '',
  //     width: 0,
  //     height: 0,
  //     serienId: productSerienId,
  //     serienIdString: productSerienId.toString(),
  //     serienIndex: serienIndex,
  //     createdAt: createdAt,
  //     isDraft: false,
  //     customerId: customerId,
  //   );

  //   return GenericCrud.create<ProductMasterDTO>(
  //     session,
  //     ProductMasterDTO.db.insertRow(session, newMasterProductDTO),
  //   );
  // }

  Future<ProductMasterDTO?> fetchByIdForNewSalesOrderProduct(
    Session session,
    int entityId,
  ) async {
    final master = await ProductMasterDTO.db.findById(
      session,
      entityId,
      include: ProductMasterDTO.include(
        artworks: ArtworkMasterDTO.includeList(),
        customer: CustomerDTO.include(),
      ),
    );
    return master;
  }

  Future<ProductMasterDTO?> fetchByIdForRelease(
    Session session,
    int entityId,
  ) async {
    return ProductMasterDTO.db.findById(session, entityId);
  }

  Future<List<EntityLockDTO>> findEntityLocks(Session session) async {
    final entities = await ProductMasterDTO.db.find(
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
