import 'dart:convert';

import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart'
    hide EntityAssignmentDTO;
import 'package:elbdesk_server/src/modules/core/entity_note/entity_note_additional_data_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/artwork_utils.dart';
import 'package:serverpod/serverpod.dart';

class EntityAssignmentHandler {
  const EntityAssignmentHandler();

  static Future<List<EntityAssignmentDTO>> fetchAssignments(
    Session session,
    int lightUserId,
  ) async {
    final all = <EntityAssignmentDTO>[];
    final results = await Future.wait([
      _fetchSoiPrepareArtworkAssignments(session, lightUserId),
      _fetchSalesOrderAssignments(session, lightUserId),
      _fetchSoiRequestArtworkApprovalAssignments(session, lightUserId),
    ]);

    for (final result in results) {
      all.addAll(result);
    }
    all.sort((a, b) {
      if (a.deadline == null && b.deadline == null) {
        return 0;
      }
      if (a.deadline == null) {
        return 1; // null deadlines go at the end
      }
      if (b.deadline == null) {
        return -1; // non-null deadlines come before null
      }
      return a.deadline!
          .compareTo(b.deadline!); // sort by nearest deadline first
    });
    return all;
  }

  static Future<List<EntityAssignmentDTO>> _fetchSalesOrderAssignments(
    Session session,
    int lightUserId,
  ) async {
    final assignments = <EntityAssignmentDTO>[];
    final salesOrders = await SalesOrderDTO.db.find(
      session,
      include: SalesOrderDTO.include(
        assignedUser: LightUserDTO.include(),
        customer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
      ),
      where: (t) =>
          t.assignedUser.id.equals(lightUserId) &
          t.deletedAt.equals(null as DateTime?) &
          t.status.notEquals(SalesOrderStatus.completed.name) &
          t.status.notEquals(SalesOrderStatus.canceled.name),
    );
    assignments.addAll(
      salesOrders.map(
        (e) => EntityAssignmentDTO(
          tableType: TableType.salesOrder.name,
          entityId: e.id!,
          lightUserId: e.assignedUser!.id!,
          deadline: null,
          additionalData: jsonEncode({
            SalesOrderAdditionalDataField.customerName.name:
                e.customer!.contact!.fullName,
            SalesOrderAdditionalDataField.status.name: e.status,
            SalesOrderAdditionalDataField.customId.name: e.fullSalesOrderId,
            SalesOrderAdditionalDataField.keywords.name: e.keywords,
          }),
        ),
      ),
    );
    return assignments;
  }

  static Future<List<EntityAssignmentDTO>> fetchSoiConsultingAssignments(
    Session session,
    int lightUserId,
  ) async {
    final assignments = <EntityAssignmentDTO>[];
    return assignments;
  }

  static Future<List<EntityAssignmentDTO>> _fetchSoiPrepareArtworkAssignments(
    Session session,
    int lightUserId,
  ) async {
    final assignments = <EntityAssignmentDTO>[];
    final sois = await SoiPrepareArtworkDTO.db.find(
      session,
      include: SoiPrepareArtworkDTO.include(
        salesOrderItem: SalesOrderItemDTO.include(
          assignedUser: LightUserDTO.include(),
        ),
        artwork: ArtworkDTO.include(
          product: ProductDTO.include(),
        ),
      ),
      where: (t) =>
          t.salesOrderItem.assignedUser.id.equals(lightUserId) &
          t.salesOrderItem.status
              .notEquals(SalesOrderItemStatus.completed.name) &
          t.salesOrderItem.status.notEquals(SalesOrderItemStatus.canceled.name),
    );
    assignments.addAll(
      sois.map(
        (e) => EntityAssignmentDTO(
          tableType: TableType.soiPrepareArtwork.name,
          entityId: e.id!,
          deadline: e.salesOrderItem!.deadline,
          lightUserId: e.salesOrderItem!.assignedUser!.id!,
          additionalData: jsonEncode({
            SoiPrepareArtworkAdditionalDataField.artworkCustomId.name:
                ArtworkUtils.getArtworkCustomId(
              artwork: e.artwork!,
              product: e.artwork!.product!,
            ),
            SoiPrepareArtworkAdditionalDataField.customerId.name:
                e.salesOrderItem!.customerId,
            SoiPrepareArtworkAdditionalDataField.status.name:
                e.salesOrderItem!.status,
            SoiPrepareArtworkAdditionalDataField.artworkWidth.name:
                e.artwork!.width,
            SoiPrepareArtworkAdditionalDataField.artworkHeight.name:
                e.artwork!.height,
          }),
        ),
      ),
    );
    return assignments;
  }

  static Future<List<EntityAssignmentDTO>>
      _fetchSoiRequestArtworkApprovalAssignments(
    Session session,
    int lightUserId,
  ) async {
    final assignments = <EntityAssignmentDTO>[];
    final sois = await SoiRequestArtworkApprovalDTO.db.find(
      session,
      where: (t) =>
          t.salesOrderItem.assignedUser.id.equals(lightUserId) &
          t.salesOrderItem.status
              .notEquals(SalesOrderItemStatus.completed.name) &
          t.salesOrderItem.status.notEquals(SalesOrderItemStatus.canceled.name),
      include: SoiRequestArtworkApprovalDTO.include(
        salesOrderItem: SalesOrderItemDTO.include(
          assignedUser: LightUserDTO.include(),
        ),
        artwork: ArtworkDTO.include(
          product: ProductDTO.include(),
        ),
      ),
    );
    assignments.addAll(
      sois.map(
        (e) => EntityAssignmentDTO(
          tableType: TableType.soiRequestArtworkApproval.name,
          entityId: e.id!,
          lightUserId: e.salesOrderItem!.assignedUser!.id!,
          deadline: e.salesOrderItem!.deadline,
          additionalData: jsonEncode({
            SoiRequestArtworkApprovalAdditionalDataField.status.name:
                e.salesOrderItem!.status,
            SoiRequestArtworkApprovalAdditionalDataField.artworkCustomId.name:
                ArtworkUtils.getArtworkCustomId(
              artwork: e.artwork!,
              product: e.artwork!.product!,
            ),
            SoiRequestArtworkApprovalAdditionalDataField.customerId.name:
                e.salesOrderItem!.customerId,
          }),
        ),
      ),
    );
    session.log(assignments.toString());
    return assignments;
  }
}

class EntityAssignmentData {
  EntityAssignmentData({
    required this.tableType,
    required this.entityId,
    required this.additionalData,
    required this.oldLightUserId,
    required this.newLightUserId,
    required this.deadline,
  });
  final String tableType;
  final int entityId;
  final int? oldLightUserId;
  final int? newLightUserId;
  final String additionalData;
  final DateTime? deadline;
}
