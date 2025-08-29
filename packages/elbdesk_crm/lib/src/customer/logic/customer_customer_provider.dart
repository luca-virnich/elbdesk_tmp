import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/customer/repositories/customer_customer_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'customer_customer_provider.g.dart';

@riverpod
CustomerCustomerRepository customerCustomerRepository(Ref ref) {
  return CustomerCustomerRepository(
    endpoint: serverpodClient.customerCustomer,
  );
}

@riverpod
Future<List<CustomerCustomer>> fetchCustomerCustomers(
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

  return ref
      .watch(
        customerCustomerRepositoryProvider,
      )
      .fetchCustomerCustomers(
        customerId,
        sort,
        filter,
      );
}

@riverpod
class WatchCustomerCustomers extends _$WatchCustomerCustomers {
  @override
  Future<List<CustomerCustomer>> build(
    String sessionId, {
    required int customerId,
  }) async {
    final inital = await ref.watch(
      fetchCustomerCustomersProvider(
        sessionId,
        customerId: customerId,
      ).future,
    );

    ref.listen(
      watchCustomerCustomersUpdatesProvider(customerId),
      (previous, next) {
        if (next is AsyncData<CustomerCustomer>) {
          handleEvent(next.value);
        }
      },
    );

    return inital;
  }

  void handleEvent(CustomerCustomer updatedCustomerCustomer) {
    final currentList = state.valueOrNull ?? [];
    // check if artwork is already in list
    final isDeleted = updatedCustomerCustomer.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.id != updatedCustomerCustomer.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.id == updatedCustomerCustomer.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedCustomerCustomer;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, updatedCustomerCustomer],
      );
    }
  }
}

@riverpod
Stream<CustomerCustomer> watchCustomerCustomersUpdates(
  Ref ref,
  int customerId,
) async* {
  final streamHelper =
      ServerpodStreamManager<CustomerCustomer, CustomerCustomerDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.customerCustomer.watchForCustomerList(
      customerId: customerId,
    ),
    convertDtoToModel: CustomerCustomer.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamCustomerCustomersUpdates: $error');
    },
  );
}
