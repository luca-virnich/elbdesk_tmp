// *
// * Shipping Addresses
// *

import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_billing_address_provider.g.dart';

@riverpod
Future<List<CustomerBillingCustomer>> fetchCustomerBillingAddresses(
  Ref ref,
  String sessionId, {
  required int customerId,
}) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.customer.name,
    ),
  );
  return ref.watch(customerRepositoryProvider).fetchBillingAddresses(
        customerId: customerId,
        sort: sort,
        filter: filter,
      );
}

@riverpod
class WatchCustomerBillingContacts extends _$WatchCustomerBillingContacts {
  @override
  Future<List<CustomerBillingCustomer>> build(
    String sessionId, {
    required int customerId,
  }) async {
    final billingContacts = await ref.watch(
      fetchCustomerBillingAddressesProvider(
        sessionId,
        customerId: customerId,
      ).future,
    );

    ref
      ..listen(
        watchCustomerBillingContactsUpdatesProvider(customerId),
        (previous, next) {
          if (next is AsyncData<CustomerBillingCustomer>) {
            handleEvent(next.value);
          }
        },
      )
      ..listen(
        watchCustomerBillingContactsDeletionsProvider,
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletion(next.value);
          }
        },
      );

    return billingContacts;
  }

  void handleEvent(CustomerBillingCustomer billingCustomer) {
    final currentList = state.whenData((list) => [...list]).requireValue;

    final existingIndex = currentList.indexWhere(
      (item) => item.id == billingCustomer.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = billingCustomer;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, billingCustomer],
      );
    }
  }

  void handleDeletion(int id) {
    final currentList = state.whenData((list) => [...list]).requireValue;
    state = AsyncValue.data(
      currentList.where((item) => item.id != id).toList(),
    );
  }
}

@riverpod
Stream<CustomerBillingCustomer> watchCustomerBillingContactsUpdates(
  Ref ref,
  int customerId,
) async* {
  final streamHelper = ServerpodStreamManager<CustomerBillingCustomer,
      CustomerBillingCustomerDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.customerBillingCustomer.watchByCustomer(
      customerId: customerId,
    ),
    convertDtoToModel: CustomerBillingCustomer.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamCustomerCustomersUpdates: $error');
    },
  );
}

@riverpod
Stream<int> watchCustomerBillingContactsDeletions(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.customerBillingCustomer.watchDeletionsByCustomer(),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog(
        'Error occurred in streamCustomerShippingContactsDeletions: '
        '$error',
      );
    },
  );
}
