import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/customer_shipping_contact/endpoints/customer_shipping_contacts_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CustomerShippingHandler {
  static Future<void> markAsPrimary(
    Session session,
    CustomerShippingContactDTO shippingContact,
  ) async {
    final (:previousPrimary, :nextPrimary) =
        await session.db.transaction((transaction) async {
      // find all shipping contacts for the customer
      final currentPrimary = await CustomerShippingContactDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.customerId.equals(shippingContact.customerId) &
            t.isPrimary.equals(true),
        transaction: transaction,
      );

      CustomerShippingContactDTO? previousPrimary;
      if (currentPrimary != null) {
        final updatedCurrent = currentPrimary.copyWith(isPrimary: false);
        await CustomerShippingContactDTO.db.updateRow(
          session,
          updatedCurrent,
          transaction: transaction,
        );
        previousPrimary = await CustomerShippingContactDTO.db.findById(
          session,
          currentPrimary.id!,
          include: CustomerShippingContactDTO.include(
            shippingContact: ContactDTO.include(
              countryCode: CountryCodeDTO.include(),
            ),
            customer: CustomerDTO.include(),
          ),
          transaction: transaction,
        );
      }
      final thisShippingContact = shippingContact.copyWith(isPrimary: true);
      await CustomerShippingContactDTO.db.updateRow(
        session,
        thisShippingContact,
        transaction: transaction,
      );
      final nextPrimary = await CustomerShippingContactDTO.db.findById(
        session,
        shippingContact.id!,
        include: CustomerShippingContactDTO.include(
          shippingContact: ContactDTO.include(
            countryCode: CountryCodeDTO.include(),
          ),
          customer: CustomerDTO.include(),
        ),
        transaction: transaction,
      );
      return (previousPrimary: previousPrimary, nextPrimary: nextPrimary);
    });
    if (nextPrimary != null) {
      customerShippingContactStreamController.add(nextPrimary);
    }
    if (previousPrimary != null) {
      customerShippingContactStreamController.add(previousPrimary);
    }
  }

  static Future<void> removeAsPrimary(
    Session session,
    int customerId,
  ) async {
    final unPrimary = await session.db.transaction((transaction) async {
      // find all shipping contacts for the customer
      final currentPrimary = await CustomerShippingContactDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.customerId.equals(customerId) & t.isPrimary.equals(true),
        transaction: transaction,
      );

      final updated = await CustomerShippingContactDTO.db.updateRow(
        session,
        currentPrimary!.copyWith(isPrimary: false),
        transaction: transaction,
      );
      final refetched = await CustomerShippingContactDTO.db.findById(
        session,
        updated.id!,
        include: CustomerShippingContactDTO.include(
          shippingContact: ContactDTO.include(
            countryCode: CountryCodeDTO.include(),
          ),
          customer: CustomerDTO.include(),
        ),
        transaction: transaction,
      );
      return refetched;
    });
    if (unPrimary != null) {
      customerShippingContactStreamController.add(unPrimary);
    }
  }

  static Future<CustomerShippingContactDTO> addShippingAddress(
    Session session, {
    required int customerId,
    required int contactId,
  }) async {
    try {
      final customerShippingContact =
          await session.db.transaction((transaction) async {
        final customerShippingContact = CustomerShippingContactDTO(
          isPrimary: false,
          customerId: customerId,
          shippingContactId: contactId,
        );
        final inserted = await CustomerShippingContactDTO.db.insertRow(
          session,
          customerShippingContact,
          transaction: transaction,
        );
        final refetched = await CustomerShippingContactDTO.db.findById(
          session,
          inserted.id!,
          include: CustomerShippingContactDTO.include(
            shippingContact: ContactDTO.include(
              countryCode: CountryCodeDTO.include(),
            ),
            customer: CustomerDTO.include(),
          ),
          transaction: transaction,
        );
        return refetched!;
      });
      customerShippingContactStreamController.add(customerShippingContact);
      return customerShippingContact;
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

  static Future<void> delete(
    Session session,
    CustomerShippingContactDTO customerShippingContact,
  ) async {
    try {
      await CustomerShippingContactDTO.db.deleteRow(
        session,
        customerShippingContact,
      );
      customerShippingContactDeletionStreamController.add(
        customerShippingContact.id!,
      );
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: e.toString(),
      );
    }
  }

  static Future<int?> fetchPrimaryShippingAddress(
    Session session,
    int customerId,
    Transaction transaction,
  ) async {
    final shippingContact = await CustomerShippingContactDTO.db.findFirstRow(
      session,
      include: CustomerShippingContactDTO.include(
        shippingContact: ContactDTO.include(),
      ),
      where: (t) => t.customerId.equals(customerId) & t.isPrimary.equals(true),
      transaction: transaction,
    );
    return shippingContact?.shippingContact?.id;
  }
}
