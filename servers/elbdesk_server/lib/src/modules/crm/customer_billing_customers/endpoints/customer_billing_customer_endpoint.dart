import 'dart:async';

import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/crm/customer_billing_customers/customer_billing_customers_utils.dart';
import 'package:elbdesk_server/src/modules/crm/customer_billing_customers/customer_bllling_customers_handler.dart';
import 'package:serverpod/serverpod.dart';

final customerBillingCustomerStreamController =
    StreamController<CustomerBillingCustomerDTO>.broadcast();

final customerBillingCustomerDeletionStreamController =
    StreamController<int>.broadcast();

class CustomerBillingCustomerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Stream<CustomerBillingCustomerDTO> watchByCustomer(
    Session session, {
    required int customerId,
  }) async* {
    yield* customerBillingCustomerStreamController.stream
        .where((event) => event.customerId == customerId)
        .map((event) {
      return event;
    });
  }

  Stream<int> watchDeletionsByCustomer(
    Session session,
  ) async* {
    yield* customerBillingCustomerDeletionStreamController.stream;
  }

  static CustomerBillingCustomerDTOInclude get _includeAll =>
      CustomerBillingCustomerDTO.include(
        billingCustomer: CustomerDTO.include(
          contact: ContactDTO.include(),
        ),
        customer: CustomerDTO.include(),
      );

  Future<void> markAsPrimary(
    Session session, {
    required CustomerBillingCustomerDTO customerBillingCustomer,
  }) async {
    return CustomerBillingCustomersHandler.markAsPrimary(
      session,
      customerBillingCustomer,
    );
  }

  Future<void> removeAsPrimary(
    Session session, {
    required int customerId,
  }) async {
    return CustomerBillingCustomersHandler.removeAsPrimary(
      session,
      customerId,
    );
  }

  Future<List<CustomerBillingCustomerDTO>> fetchBillingCustomers(
    Session session, {
    required int customerId,
    Sort? sort,
    Filter? filter,
  }) {
    final sortByField = CustomerBillingCustomerField.values.firstWhereOrNull(
      (e) => e.name == sort?.fieldKey,
    );

    final filterExpression =
        CustomerBillingCustomersUtils.buildExpression(filter);

    var expression =
        CustomerBillingCustomerDTOTable().customerId.equals(customerId);

    if (filterExpression != null) {
      expression = expression & filterExpression;
    }

    return CustomerBillingCustomerDTO.db.find(
      session,
      include: CustomerBillingCustomerDTO.include(
        billingCustomer: CustomerDTO.include(
          contact: ContactDTO.include(
            countryCode: CountryCodeDTO.include(),
            languageCode: LanguageCodeDTO.include(),
          ),
        ),
        customer: CustomerDTO.include(),
      ),
      where: (t) => expression,
      orderBy: CustomerBillingCustomersUtils.orderBy(sortByField),
      orderDescending: sort?.orderDescending ?? false,
    );
  }

  // Future<List<CustomerBillingCustomerDTO>>
  //     fetchBillingCustomersForExcludeFilter(
  //   Session session, {
  //   required int customerId,
  // }) {
  //   return CustomerBillingCustomerDTO.db.find(
  //     session,
  //     include: CustomerBillingCustomerDTO.include(
  //       billingCustomer: CustomerDTO.include(),
  //     ),
  //     where: (t) => t.customerId.equals(customerId),
  //   );
  // }

  Future<CustomerBillingCustomerDTO?> fetch(
    Session session,
    int customerBillingCustomerId,
  ) async {
    return CustomerBillingCustomerDTO.db
        .findById(session, customerBillingCustomerId);
  }

  Future<void> deleteBillingAddress(
    Session session, {
    required int customerBillingCustomerId,
  }) async {
    final billingAddress = await fetch(session, customerBillingCustomerId);
    if (billingAddress == null) {
      throw Exception('Billing address not found');
    }
    await CustomerBillingCustomerDTO.db.deleteRow(
      session,
      billingAddress,
    );
  }

  Future<bool> isBillingAddressAssigned(
    Session session, {
    required int customerId,
    required int billingCustomerId,
  }) async {
    final exists = await CustomerBillingCustomerDTO.db.find(
      session,
      include: _includeAll,
      where: (t) =>
          t.customerId.equals(customerId) &
          t.billingCustomerId.equals(billingCustomerId),
    );
    return exists.isNotEmpty;
  }
}
