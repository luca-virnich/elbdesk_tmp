import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerRepository implements EntityRepository<Customer> {
  /// Constructor
  CustomerRepository({
    required this.ref,
    required this.endpoint,
    required this.endpointShippingContacts,
    required this.endpointBillingCustomers,
  });

  /// Serverpod Client
  /// Necessary to interact with the serverpod backend

  final Ref ref;
  final EndpointCustomer endpoint;
  final EndpointCustomerShippingContacts endpointShippingContacts;
  final EndpointCustomerBillingCustomer endpointBillingCustomers;
  @override
  Future<Customer> createAndReturnEntity({
    required String sessionId,
    required Customer entity,
    required bool release,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Customer>> fetchAll() async {
    throw UnimplementedError('fetchAll is not implemented');
  }

  @override
  Future<Customer?> fetchById(int id) async {
    final customer = await endpoint.fetchById(id);
    return customer != null ? Customer.fromDTO(customer) : null;
  }

  @override
  Future<List<Customer>> find({Sort? sort, Filter? filter}) async {
    final customers = await endpoint.find(sort: sort, filter: filter);
    return customers.map(Customer.fromDTO).toList();
  }

  // Future<List<Customer>> findForDateneingang({
  //   Sort? sort,
  //   Filter? filter,
  // }) async {
  //   final customers =
  //       await endpoint.findForDateneingang(sort: sort, filter: filter);
  //   return customers.map(Customer.fromDTO).toList();
  // }

  /// Create Customer
  ///
  /// Used to create a new customer
  Future<int> createCustomer(Contact contact) async {
    final newCustomer = await endpoint.create(contact.toDTO());
    return newCustomer.id!;
  }

  @override
  Future<bool> delete(
    int customerId,
    String sessionId,
  ) async {
    return endpoint.delete(customerId: customerId, sessionId: sessionId);
  }

  @override
  Future<Customer> update({
    required String sessionId,
    required Customer entity,
    required bool release,
  }) async {
    final newCustomer = await endpoint.update(
      entity: entity.toDTO(),
      sessionId: sessionId,
      release: release,
    );

    return Customer.fromDTO(newCustomer!);
  }

  @override
  Future<Customer?> fetchAndLock(
    int entityId,
    String sessionId,
  ) async {
    final customer =
        await endpoint.fetchAndLock(id: entityId, sessionId: sessionId);

    return customer != null ? Customer.fromDTO(customer) : null;
  }

  @override
  Future<void> release(int entityId, String sessionId) async {
    await endpoint.release(entityId: entityId, sessionId: sessionId);
  }

  Future<void> saveAndReleaseCustomer(
    Customer customer,
    String sessionId,
  ) async {
    try {
      await endpoint.update(
        entity: customer.toDTO(),
        sessionId: sessionId,
        release: true,
      );
    } catch (e) {
      debugPrint('cant save and release customer $e');
    }
  }

  Future<void> addShippingAddress(int customerId, int contactId) async {
    await endpoint.addShippingAddress(
      customerId: customerId,
      contactId: contactId,
    );
  }

  Future<List<CustomerShippingContact>> fetchShippingAddresses(
    int customerId,
    Sort? sort,
    Filter? filter,
  ) async {
    final shippingContacts =
        await endpointShippingContacts.fetchShippingContacts(
      customerId: customerId,
      sort: sort,
      filter: filter,
    );

    return shippingContacts.map(CustomerShippingContact.fromDTO).toList();
  }

  Future<List<CustomerBillingCustomer>> fetchBillingAddresses({
    required int customerId,
    required Sort? sort,
    required Filter? filter,
  }) async {
    final addresses = await endpoint.fetchBillingAddresses(
      customerId: customerId,
      sort: sort,
      filter: filter,
    );
    return addresses.map(CustomerBillingCustomer.fromDTO).toList();
  }

  Future<void> addBillingAddress(int customerId, int customerCustomerId) async {
    await endpoint.addBillingAddress(
      customerId: customerId,
      customerCustomerId: customerCustomerId,
      isPrimary: false,
    );
  }

  Future<void> markShippingAddressAsPrimary(
    CustomerShippingContact customerShippingContact,
  ) async {
    await endpointShippingContacts.markAsPrimary(
      customerShippingContact: customerShippingContact.toDTO(),
    );
  }

  Future<void> removeShippingAddressPrimary(int customerId) async {
    await endpointShippingContacts.removeAsPrimary(
      customerId: customerId,
    );
  }

  Future<void> markBillingAddressAsPrimary(
    CustomerBillingCustomer customerBillingCustomer,
  ) async {
    await endpointBillingCustomers.markAsPrimary(
      customerBillingCustomer: customerBillingCustomer.toDTO(),
    );
  }

  Future<void> removeBillingAddressPrimary(int customerId) async {
    await endpointBillingCustomers.removeAsPrimary(
      customerId: customerId,
    );
  }

  Future<void> deleteShippingAddress(
    CustomerShippingContact customerShippingContact,
  ) async {
    await endpoint.deleteShippingAddress(
      customerShippingContact: customerShippingContact.toDTO(),
    );
  }

  Future<void> deleteBillingAddress(
    CustomerBillingCustomer customerBillingCustomer,
  ) async {
    await endpoint.deleteBillingAddress(
      customerBillingCustomer: customerBillingCustomer.toDTO(),
    );
  }

  Future<List<SpotlightItem>> findSpotlight(String query) async {
    final customers = await endpoint.findSpotlight(query: query);
    return customers;
  }
}
