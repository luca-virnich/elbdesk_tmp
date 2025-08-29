import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'drucklayout_provider.g.dart';

// Provides the Drucklayout repository
@riverpod
DrucklayoutRepository drucklayoutRepository(
  Ref ref,
) {
  return DrucklayoutRepository(
    endpoint: serverpodClient.drucklayout,
  );
}

/// Find Drucklayouts Provider
@riverpod
Future<List<Drucklayout>> findDrucklayouts(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch(drucklayoutRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.drucklayout.name,
    ),
  );
  return repository.find(sort: sort, filter: filter);
}

/// Fetch all Drucklayouts Provider
@riverpod
Future<List<Drucklayout>> fetchDrucklayouts(
  Ref ref,
) async {
  return ref.watch(drucklayoutRepositoryProvider).fetchAll();
}

/// Fetch Drucklayout by ID Provider
@riverpod
Future<Drucklayout?> fetchDrucklayout(
  Ref ref,
  int id,
) async {
  return ref.watch(drucklayoutRepositoryProvider).fetchById(id);
}

/// Watch Drucklayout by ID Provider
@riverpod
Stream<Drucklayout> watchDrucklayout(
  Ref ref, {
  required int entityId,
  required String sessionId,
}) async* {
  final streamHelper = ServerpodStreamManager<Drucklayout, DrucklayoutDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.drucklayout.watchEntity(
      sessionId: sessionId,
      entityId: entityId,
    ),
    convertDtoToModel: Drucklayout.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDrucklayout: $error');
    },
  );
}

/// Fetch Drucklayouts by Sales Order Provider
@riverpod
Future<List<Drucklayout>> fetchDrucklayoutsBySalesOrder(
  Ref ref,
  int salesOrderId,
) async {
  final repository = ref.watch(drucklayoutRepositoryProvider);
  return repository.fetchBySalesOrder(salesOrderId);
}

/// Find Drucklayouts by Customer Provider
@riverpod
Future<List<Drucklayout>> findDrucklayoutsByCustomer(
  Ref ref,
  int customerId,
  String sessionId,
) async {
  final repository = ref.watch(drucklayoutRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.drucklayout.name,
    ),
  );

  return repository.findDrucklayoutsByCustomer(
    customerId: customerId,
    sessionId: sessionId,
    sort: sort,
    filter: filter,
  );
}

/// Watch Drucklayout Updates by Sales Order ID Provider
@riverpod
Stream<Drucklayout> watchDrucklayoutsBySalesOrderStream(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper = ServerpodStreamManager<Drucklayout, DrucklayoutDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.drucklayout.watchBySalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: Drucklayout.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDrucklayoutUpdatesBySalesOrderId: $error');
    },
  );
}

/// Watch Drucklayout Updates by Customer ID Provider
@riverpod
Stream<Drucklayout> watchDrucklayoutsByCustomerStream(
  Ref ref,
  int customerId,
  String sessionId,
) async* {
  final streamHelper = ServerpodStreamManager<Drucklayout, DrucklayoutDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.drucklayout.watchByCustomer(
      customerId: customerId,
    ),
    convertDtoToModel: Drucklayout.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchDrucklayoutUpdatesByCustomerId: $error');
    },
  );
}

/// Watch Drucklayouts by Sales Order Provider
///
/// Handles incoming stream
@riverpod
class WatchDrucklayoutsBySalesOrder extends _$WatchDrucklayoutsBySalesOrder {
  @override
  Future<List<Drucklayout>> build(int salesOrderId) async {
    ref.listen(
      watchDrucklayoutsBySalesOrderStreamProvider(salesOrderId),
      (previous, next) {
        if (next is AsyncData<Drucklayout>) {
          handleEvent(next.value);
        }
      },
    );
    final initialList = await ref.watch(
      fetchDrucklayoutsBySalesOrderProvider(
        salesOrderId,
      ).future,
    );

    return initialList;
  }

  /// Handles updates to drucklayout items in the list
  /// Removes items that are deleted
  /// Adds new items that don't exist in the list
  Future<void> handleEvent(Drucklayout updatedDrucklayout) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    // Check if item should be removed (deleted)
    final isDeleted = updatedDrucklayout.meta.deletedAt != null;

    if (isDeleted) {
      // Remove item from list if it exists
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedDrucklayout.meta.id)
            .toList(),
      );
      return;
    }

    // Check if item already exists in list
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedDrucklayout.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing item in place
      final updatedList = List<Drucklayout>.from(currentList);
      updatedList[existingIndex] = updatedDrucklayout;
      state = AsyncValue.data(updatedList);
      return;
    }

    // Add new item to beginning of list
    state = AsyncValue.data(
      [
        updatedDrucklayout,
        ...state.valueOrNull ?? [],
      ],
    );
  }
}

/// Watch Drucklayouts by Customer Provider
///
/// Handles incoming stream
@riverpod
class WatchDrucklayoutsByCustomer extends _$WatchDrucklayoutsByCustomer {
  @override
  Future<List<Drucklayout>> build(int customerId, String sessionId) async {
    ref.listen(
      watchDrucklayoutsByCustomerStreamProvider(customerId, sessionId),
      (previous, next) {
        if (next is AsyncData<Drucklayout>) {
          handleEvent(next.value);
        }
      },
    );
    final initialList = await ref.watch(
      findDrucklayoutsByCustomerProvider(
        customerId,
        sessionId,
      ).future,
    );

    return initialList;
  }

  /// Handles updates to drucklayout items in the list
  /// Removes items that are deleted
  /// Adds new items that don't exist in the list
  Future<void> handleEvent(Drucklayout updatedDrucklayout) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    // Check if item should be removed (deleted)
    final isDeleted = updatedDrucklayout.meta.deletedAt != null;

    if (isDeleted) {
      // Remove item from list if it exists
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedDrucklayout.meta.id)
            .toList(),
      );
      return;
    }

    // Check if item already exists in list
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedDrucklayout.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing item in place
      final updatedList = List<Drucklayout>.from(currentList);
      updatedList[existingIndex] = updatedDrucklayout;
      state = AsyncValue.data(updatedList);
      return;
    }

    // Add new item to beginning of list
    state = AsyncValue.data(
      [
        updatedDrucklayout,
        ...state.valueOrNull ?? [],
      ],
    );
  }
}

/// Provider for fetching assigned Nutzenlayouts for a Drucklayout in a
/// Sales Order
@riverpod
Future<
    ({
      List<SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts,
      List<SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
    })> fetchAssignedNutzenlayoutsForDrucklayout(
  Ref ref, {
  required int drucklayoutId,
  required int salesOrderId,
}) async {
  return ref.read(drucklayoutRepositoryProvider).fetchAssignedNutzenlayouts(
        drucklayoutId: drucklayoutId,
        salesOrderId: salesOrderId,
      );
}

/// Provider that fetches drucklayouts associated with a specific artwork
/// in a sales order
/// This is used to display Drucklayouts related to an Artwork inside of a
/// SalesOrder
@riverpod
Future<List<Drucklayout>> fetchArtworkAssociatedDrucklayoutsBySalesOrder(
  Ref ref, {
  required int salesOrderId,
  required int artworkId,
}) async {
  final repository = ref.watch(drucklayoutRepositoryProvider);
  final drucklayouts = await repository.fetchByArtworkAndSalesOrder(
    salesOrderId: salesOrderId,
    artworkId: artworkId,
  );

  return drucklayouts;
}
