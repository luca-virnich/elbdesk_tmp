// *
// * Shipping Addresses
// *

import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_shipping_address_provider.g.dart';

@riverpod
Future<List<CustomerShippingContact>> fetchCustomerShippingAddresses(
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

  return ref.watch(customerRepositoryProvider).fetchShippingAddresses(
        customerId,
        sort,
        filter,
      );
}

@riverpod
class WatchCustomerShippingContacts extends _$WatchCustomerShippingContacts {
  @override
  Future<List<CustomerShippingContact>> build(
    String sessionId, {
    required int customerId,
  }) async {
    final shippingContacts = await ref.watch(
      fetchCustomerShippingAddressesProvider(
        sessionId,
        customerId: customerId,
      ).future,
    );

    ref
      ..listen(
        watchCustomerShippingContactsUpdatesProvider(customerId),
        (previous, next) {
          if (next is AsyncData<CustomerShippingContact>) {
            handleEvent(next.value);
          }
        },
      )
      ..listen(
        watchCustomerShippingContactsDeletionsProvider,
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletion(next.value);
          }
        },
      );

    return shippingContacts;
  }

  void handleEvent(CustomerShippingContact shippingContact) {
    final currentList = state.whenData((list) => [...list]).requireValue;

    final existingIndex = currentList.indexWhere(
      (item) => item.id == shippingContact.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = shippingContact;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, shippingContact],
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
Stream<CustomerShippingContact> watchCustomerShippingContactsUpdates(
  Ref ref,
  int customerId,
) async* {
  final streamHelper = ServerpodStreamManager<CustomerShippingContact,
      CustomerShippingContactDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.customerShippingContacts.watchByCustomer(
      customerId: customerId,
    ),
    convertDtoToModel: CustomerShippingContact.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamCustomerCustomersUpdates: $error');
    },
  );
}

@riverpod
Stream<int> watchCustomerShippingContactsDeletions(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.customerShippingContacts.watchDeletionsByCustomer(),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog(
        'Error occurred in streamCustomerShippingContactsDeletions: '
        '$error',
      );
    },
  );
}
