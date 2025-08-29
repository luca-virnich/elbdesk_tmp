import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/customer_customer/endpoints/customer_customer_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class CustomerCustomerHandler {
  static Future<CustomerCustomerDTO> create(
    Session session, {
    required CustomerDTO customer,
    required ContactDTO customerCustomerContact,
  }) async {
    final (:userId, :now) = await CoreUtils.getCurrentTimeAndUser(session);
    final customerCustomer = await session.db.transaction((transaction) async {
      final isContactDeleted = await ContactDTO.db.find(
        session,
        where: (t) =>
            t.id.equals(customerCustomerContact.id) &
            t.deletedAt.notEquals(null as DateTime?),
        transaction: transaction,
      );
      if (isContactDeleted.isNotEmpty) {
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Contact has been deleted in the meantime',
        );
      }
      final entity = CustomerCustomerDTO(
        customer: customer,
        customerId: customer.id!,
        customerCustomerContact: customerCustomerContact,
        customerCustomerContactId: customerCustomerContact.id!,
        createdAt: now,
        createdById: userId,
        isDraft: false,
      );
      return CustomerCustomerDTO.db.insertRow(
        session,
        entity,
        transaction: transaction,
      );
    });
    customerCustomerStreamController.add(customerCustomer);
    return customerCustomer;
  }
}
