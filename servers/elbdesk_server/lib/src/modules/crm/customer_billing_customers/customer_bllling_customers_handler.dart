import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/customer_billing_customers/endpoints/customer_billing_customer_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CustomerBillingCustomersHandler {
  const CustomerBillingCustomersHandler._();

  static Future<CustomerBillingCustomerDTO> addBillingAddress(
    Session session, {
    required int customerId,
    required int customerCustomerId,
    required bool isPrimary,
  }) async {
    try {
      final customerBillingCustomer =
          await session.db.transaction((transaction) async {
        final customerBillingCustomer = CustomerBillingCustomerDTO(
          customerId: customerId,
          billingCustomerId: customerCustomerId,
          isPrimary: false,
        );
        final inserted = await CustomerBillingCustomerDTO.db.insertRow(
          session,
          customerBillingCustomer,
          transaction: transaction,
        );
        final refetched = await CustomerBillingCustomerDTO.db.findById(
          session,
          inserted.id!,
          include: CustomerBillingCustomerDTO.include(
            billingCustomer: CustomerDTO.include(
              contact: ContactDTO.include(
                countryCode: CountryCodeDTO.include(),
              ),
            ),
            customer: CustomerDTO.include(),
          ),
          transaction: transaction,
        );
        return refetched!;
      });
      customerBillingCustomerStreamController.add(customerBillingCustomer);

      return customerBillingCustomer;
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

  static Future<void> markAsPrimary(
    Session session,
    CustomerBillingCustomerDTO billingCustomer,
  ) async {
    final (:previousPrimary, :nextPrimary) =
        await session.db.transaction((transaction) async {
      // find all shipping contacts for the customer
      final currentPrimary = await CustomerBillingCustomerDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.customerId.equals(billingCustomer.customerId) &
            t.isPrimary.equals(true),
        transaction: transaction,
      );

      CustomerBillingCustomerDTO? previousPrimary;
      if (currentPrimary != null) {
        final updatedCurrent = currentPrimary.copyWith(isPrimary: false);
        await CustomerBillingCustomerDTO.db.updateRow(
          session,
          updatedCurrent,
          transaction: transaction,
        );
        previousPrimary = await CustomerBillingCustomerDTO.db.findById(
          session,
          currentPrimary.id!,
          include: CustomerBillingCustomerDTO.include(
            billingCustomer: CustomerDTO.include(
              contact: ContactDTO.include(
                countryCode: CountryCodeDTO.include(),
              ),
            ),
            customer: CustomerDTO.include(),
          ),
          transaction: transaction,
        );
      }
      final thisBillingCustomer = billingCustomer.copyWith(isPrimary: true);
      await CustomerBillingCustomerDTO.db.updateRow(
        session,
        thisBillingCustomer,
        transaction: transaction,
      );
      final nextPrimary = await CustomerBillingCustomerDTO.db.findById(
        session,
        billingCustomer.id!,
        include: CustomerBillingCustomerDTO.include(
          billingCustomer: CustomerDTO.include(
            contact: ContactDTO.include(
              countryCode: CountryCodeDTO.include(),
            ),
          ),
          customer: CustomerDTO.include(),
        ),
        transaction: transaction,
      );
      return (previousPrimary: previousPrimary, nextPrimary: nextPrimary);
    });
    if (nextPrimary != null) {
      customerBillingCustomerStreamController.add(nextPrimary);
    }
    if (previousPrimary != null) {
      customerBillingCustomerStreamController.add(previousPrimary);
    }
  }

  static Future<void> removeAsPrimary(
    Session session,
    int customerId,
  ) async {
    final unPrimary = await session.db.transaction((transaction) async {
      // find all shipping contacts for the customer
      final currentPrimary = await CustomerBillingCustomerDTO.db.findFirstRow(
        session,
        where: (t) =>
            t.customerId.equals(customerId) & t.isPrimary.equals(true),
        transaction: transaction,
      );

      final updated = await CustomerBillingCustomerDTO.db.updateRow(
        session,
        currentPrimary!.copyWith(isPrimary: false),
        transaction: transaction,
      );
      final refetched = await CustomerBillingCustomerDTO.db.findById(
        session,
        updated.id!,
        include: CustomerBillingCustomerDTO.include(
          billingCustomer: CustomerDTO.include(
            contact: ContactDTO.include(
              countryCode: CountryCodeDTO.include(),
            ),
          ),
          customer: CustomerDTO.include(),
        ),
        transaction: transaction,
      );
      return refetched;
    });
    if (unPrimary != null) {
      customerBillingCustomerStreamController.add(unPrimary);
    }
  }

  static Future<CustomerBillingCustomerDTO> addBillingCustomer(
    Session session, {
    required int customerId,
    required int billingCustomerId,
  }) async {
    try {
      final customerBillingCustomer =
          await session.db.transaction((transaction) async {
        final customerBillingCustomer = CustomerBillingCustomerDTO(
          isPrimary: false,
          customerId: customerId,
          billingCustomerId: billingCustomerId,
        );
        final inserted = await CustomerBillingCustomerDTO.db.insertRow(
          session,
          customerBillingCustomer,
          transaction: transaction,
        );
        final refetched = await CustomerBillingCustomerDTO.db.findById(
          session,
          inserted.id!,
          include: CustomerBillingCustomerDTO.include(
            billingCustomer: CustomerDTO.include(
              contact: ContactDTO.include(
                countryCode: CountryCodeDTO.include(),
              ),
            ),
            customer: CustomerDTO.include(),
          ),
          transaction: transaction,
        );
        return refetched!;
      });
      customerBillingCustomerStreamController.add(customerBillingCustomer);
      return customerBillingCustomer;
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
    CustomerBillingCustomerDTO customerBillingCustomer,
  ) async {
    try {
      await CustomerBillingCustomerDTO.db.deleteRow(
        session,
        customerBillingCustomer,
      );
      customerBillingCustomerDeletionStreamController.add(
        customerBillingCustomer.id!,
      );
    } catch (e) {
      throw ElbException(
        exceptionType: ElbExceptionType.unknown,
        message: e.toString(),
      );
    }
  }

  static Future<int?> fetchPrimaryBillingCustomer(
    Session session,
    int customerId,
    Transaction transaction,
  ) async {
    final billingCustomer = await CustomerBillingCustomerDTO.db.findFirstRow(
      session,
      include: CustomerBillingCustomerDTO.include(
        billingCustomer: CustomerDTO.include(),
      ),
      where: (t) => t.customerId.equals(customerId) & t.isPrimary.equals(true),
      transaction: transaction,
    );
    return billingCustomer?.billingCustomer?.id;
  }
}
