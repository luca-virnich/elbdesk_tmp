import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/utils/elb_exception_thrower.dart';
import 'package:elbdesk_server/src/modules/crm/customer_customer/customer_customer_handler.dart';
import 'package:elbdesk_server/src/modules/crm/customer_customer/customer_customer_utils.dart';
import 'package:elbdesk_shared/elbdesk_shared.dart';
import 'package:serverpod/serverpod.dart';

final customerCustomerStreamController =
    StreamController<CustomerCustomerDTO>.broadcast();

class CustomerCustomerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<CustomerCustomerDTO> create(
    Session session, {
    required CustomerDTO customer,
    required ContactDTO customerCustomerContact,
    required bool isPrimary,
  }) async {
    return CustomerCustomerHandler.create(
      session,
      customer: customer,
      customerCustomerContact: customerCustomerContact,
    );
  }

  Stream<CustomerCustomerDTO> watchForCustomerList(
    Session session, {
    required int customerId,
  }) async* {
    yield* customerCustomerStreamController.stream
        .where(
          (event) => event.customerId == customerId,
        )
        .map((event) => event);
  }

  Future<List<CustomerCustomerDTO>> fetchCustomerCustomers(
    Session session, {
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) {
    final sortByField = CustomerCustomerField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression = CustomerCustomerUtils.buildExpression(filter);

    var expression = CustomerCustomerDTOTable().customerId.equals(customerId);

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return CustomerCustomerDTO.db.find(
      session,
      include: CustomerCustomerDTO.include(
        customerCustomerContact: ContactDTO.include(
          countryCode: CountryCodeDTO.include(),
          languageCode: LanguageCodeDTO.include(),
        ),
        customer: CustomerDTO.include(),
      ),
      where: (t) => expression,
      orderBy: CustomerCustomerUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  Future<CustomerCustomerDTO?> findById(
    Session session, {
    required int customerCustomerId,
  }) async {
    return CustomerCustomerDTO.db.findById(
      session,
      customerCustomerId,
      include: CustomerCustomerDTO.include(
        customerCustomerContact: ContactDTO.include(),
        customer: CustomerDTO.include(),
      ),
    );
  }

  Future<void> deleteCustomerCustomer(
    Session session, {
    required int customerCustomerId,
  }) async {
    final customerCustomer = await findById(
      session,
      customerCustomerId: customerCustomerId,
    );
    if (customerCustomer == null) {
      throw Exception('Customer customer not found');
    }
    final userId = (await session.authenticated)!.userId;
    final now = DateTime.now();
    final deletedEntity = customerCustomer.copyWith(
      deletedAt: now,
      deletedById: userId,
    );
    final updated =
        await CustomerCustomerDTO.db.updateRow(session, deletedEntity);
    customerCustomerStreamController.add(updated);
  }

  Future<void> addCustomerCustomer(
    Session session, {
    required int customerId,
    required int customerCustomerContactId,
  }) async {
    final contact =
        await ContactDTO.db.findById(session, customerCustomerContactId);
    final customer = await CustomerDTO.db.findById(session, customerId);
    if (contact == null || customer == null) {
      throw Exception('Customer or customerCustomer not found');
    }
    final isAlreadyAdded = await CustomerCustomerDTO.db.find(
      session,
      where: (t) =>
          t.customerId.equals(customerId) &
          t.customerCustomerContactId.equals(customerCustomerContactId) &
          t.deletedAt.equals(null as DateTime?),
    );

    if (isAlreadyAdded.isNotEmpty) {
      throw await ElbExceptionThrower.validationError(
        session,
        exceptionType: ElbExceptionType.conflict,
        message: ElbValidationError.customerCustomerAlreadyAssigned,
      );
    }

    await create(
      session,
      customer: customer,
      customerCustomerContact: contact,
      isPrimary: false,
    );
  }
}
