import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/custom_entity_keys/custom_entiy_keys_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:elbdesk_server/src/modules/crm/customer/customer_utils.dart';
import 'package:elbdesk_server/src/modules/crm/customer/endpoints/customer_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_pre_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_selection_handler.dart';
import 'package:serverpod/serverpod.dart';

class CustomerHandler {
  const CustomerHandler._();

  static Future<CustomerDTO?> fetchAndLock(
    Session session, {
    required int id,
    required String sessionId,
  }) async {
    return GenericCrud.fetchAndLockEntity<CustomerDTO>(
      session,
      id: id,
      editingSessionId: sessionId,
      fetchById: fetchById,
      tableType: CustomerUtils.tableType,
      tableName: CustomerDTOTable().tableName,
      streamController: customerStreamController,
    );
  }

  static Future<CustomerDTO?> fetchById(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return CustomerDTO.db.findById(
      session,
      id,
      transaction: transaction,
      include: CustomerUtils.includeAll,
    );
  }

  static Future<CustomerDTO> update(
    Session session, {
    required CustomerDTO entity,
    required String sessionId,
    required bool release,
  }) async {
    return GenericCrud.update<CustomerDTO>(
      session,
      sessionId: sessionId,
      newEntity: entity,
      release: release,
      fetchById: fetchById,
      updateEntity: _updateRow,
      tableType: CustomerUtils.tableType,
      streamController: customerStreamController,
      logFields: CustomerUtils.getLogFields(),
    );
  }

  static Future<void> release(
    Session session, {
    required int entityId,
    required String sessionId,
  }) async {
    return GenericCrud.releaseEntity<CustomerDTO>(
      session,
      entityId: entityId,
      sessionId: sessionId,
      fetchById: fetchById,
      updateEntity: _updateRow,
      tableType: CustomerUtils.tableType,
      streamController: customerStreamController,
      deleteDraft: null,
    );
  }

  static Future<bool> delete(
    Session session, {
    required int customerId,
    required String sessionId,
  }) async {
    return GenericCrud.markEntityAsDeleted<CustomerDTO>(
      session,
      fetchWithoutRelations: _fetchByIdWithoutRelations,
      updateRow: _updateRow,
      tableType: CustomerUtils.tableType,
      streamController: customerStreamController,
      id: customerId,
      sessionId: sessionId,
    );
  }

  static Future<CustomerDTO?> _fetchByIdWithoutRelations(
    Session session,
    int id,
    Transaction transaction,
  ) async {
    return CustomerDTO.db.findById(
      session,
      id,
      transaction: transaction,
    );
  }

  static Future<CustomerDTO> _updateRow(
    Session session,
    CustomerDTO entity,
    Transaction transaction,
  ) async {
    return CustomerDTO.db.updateRow(session, entity, transaction: transaction);
  }

  static Future<CustomerDTO> create(
    Session session,
    ContactDTO contact,
  ) async {
    try {
      final customer = session.db.transaction((transaction) async {
        final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);

        final customId = await CustomEntityKeysHandler.getNextIntKey(
          session,
          TableType.customer,
          transaction,
        );

        final customer = CustomerDTO(
          vatId: '',
          invoiceEmail: '',
          invoiceDeliveryMethod: null,
          shippingMethod: null,
          isDraft: false,
          lastModifiedAt: null,
          createdAt: now,
          createdById: userId,
          editingSince: now,
          contactId: contact.id,
          customId: customId,
          customIdString: customId.toString(),
        );

        final inserted = await CustomerDTO.db.insertRow(
          session,
          customer,
          transaction: transaction,
        );
        final templatePreSelection =
            await ArtworkTemplatePreSelectionHandler.createDefaultPreSelection(
          session,
          customerId: inserted.id!,
          transaction: transaction,
          userId: userId,
          now: now,
        );

        await ArtworkTemplateSelectionHandler.createDefaultSelection(
          session,
          artworkTemplatePreSelectionId: templatePreSelection.id!,
          transaction: transaction,
          userId: userId,
          now: now,
        );

        return inserted;
      });
      return customer;
    } on ElbException {
      rethrow;
    } on DatabaseQueryException catch (e) {
      session.log('database query exception: $e');
      final message = e.message;
      if (message.contains('duplicate key value')) {
        throw e.toElbException(ElbExceptionType.validationFieldError);
      }
      throw e.toElbException(ElbExceptionType.unknown);
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: e.toString(),
      );
    }
  }
}
