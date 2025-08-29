import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/customer/repositories/customer_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_provider.g.dart';

@riverpod
Future<List<Customer>> findCustomers(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.customer.name,
    ),
  );
  return ref.watch(customerRepositoryProvider).find(sort: sort, filter: filter);
}

// @riverpod
// Future<List<Customer>> findCustomersForDateneingang(
//   Ref ref,
//   String sessionId,
// ) async {
//   final (sort, filter) = ref.watch(
//     tableSortAndFilterProvider(
//       sessionId,
//       TableType.customer,
//     ),
//   );
//   return ref
//       .watch(customerRepositoryProvider)
//       .findForDateneingang(sort: sort, filter: filter);
// }

@riverpod
Future<List<Customer>> fetchCustomerBillingAddressesForSalesOrder(
  Ref ref, {
  required Customer customer,
}) async {
  final billingCustomers =
      await ref.watch(customerRepositoryProvider).fetchBillingAddresses(
            customerId: customer.id!,
            sort: null,
            filter: null,
          );

  final asCustomers = billingCustomers.map((e) => e.billingCustomer!).toList();

  final withCustomer = [customer, ...asCustomers];

  return withCustomer;
}

@riverpod
Future<List<Contact>> fetchCustomerShippingAddressesForSalesOrder(
  Ref ref,
  String sessionId, {
  required Customer customer,
}) async {
  final shippingAddresses = await ref.watch(
    watchCustomerShippingContactsProvider(
      sessionId,
      customerId: customer.id!,
    ).future,
  );

  final asContacts = shippingAddresses.map((e) => e.contact).toList();
  final withCustomer = [customer.contact!, ...asContacts];
  return withCustomer;
}

@riverpod
Future<Customer> fetchCustomer(
  Ref ref, {
  required int customerId,
}) async {
  final customer = await serverpodClient.customer.fetchById(customerId);
  return Customer.fromDTO(customer!);
}

@riverpod
Future<List<SpotlightItem>> findCustomersSpotlight(
  Ref ref,
  String query,
) async {
  return ref.watch(customerRepositoryProvider).findSpotlight(query);
}

/// Customer Repository Provider
@riverpod
CustomerRepository customerRepository(Ref ref) {
  return CustomerRepository(
    ref: ref,
    endpoint: serverpodClient.customer,
    endpointShippingContacts: serverpodClient.customerShippingContacts,
    endpointBillingCustomers: serverpodClient.customerBillingCustomer,
  );
}
