import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sales_order_item_provider.g.dart';

@riverpod
SalesOrderItemRepository salesOrderItemRepository(Ref ref) {
  return SalesOrderItemRepository(
    endpoint: serverpodClient.salesOrderItem,
  );
}

@riverpod
Future<List<SalesOrderItem>> fetchSalesOrderItems(
  Ref ref, {
  required int salesOrderId,
  required String sessionId,
}) async {
  final repo = ref.watch(salesOrderItemRepositoryProvider);
  return repo.fetchSalesOrderItems(salesOrderId);
}

/// Fetch Sales Order Items Provider
///
/// This provider is used to fetch a list of Sales Order Items from the server.
///
/// The sessionId is needed to differentiate between different tables. One
/// table could have filters enabled and another one not. The sessionId is used
/// to be able to fetch both lists with the same provider.
///
@riverpod
Future<List<SalesOrderItem>> findSalesOrderItems(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.salesOrderItem.name,
    ),
  );

  final repo = ref.watch(salesOrderItemRepositoryProvider);

  return repo.find(sort: sort, filter: filter);
}

/// Manages a list of SalesOrderItems for a specific artwork and handles updates
@riverpod
class WatchSalesOrderItemsByArtwork extends _$WatchSalesOrderItemsByArtwork {
  @override
  Future<List<SalesOrderItem>> build(
    int artworkId,
  ) async {
    // Initial fetch - fetch all SOIs for the artwork
    final repo = ref.watch(salesOrderItemRepositoryProvider);
    final initials = await repo.findByArtworkId(artworkId);

    // Listen to SoiPrepareArtwork updates filtered by artworkId

    // ADD ALL OTHER SOIS FOR THE SALES ORDER
    ref.listen(
      watchSoiPrepareArtworkByArtworkProvider(
        artworkId: artworkId,
      ),
      (previous, next) {
        if (next is AsyncData<SoiPrepareArtwork>) {
          handleUpdate(next.value.salesOrderItem!);
        }
      },
    );
    ref.listen(
      watchSoiRequestArtworkApprovalByArtworkProvider(
        artworkId: artworkId,
      ),
      (previous, next) {
        if (next is AsyncData<SoiRequestArtworkApproval>) {
          handleUpdate(next.value.salesOrderItem!);
        }
      },
    );
    ref.listen(
      watchSoiEinzelformaufbauByArtworkProvider(
        artworkId: artworkId,
      ),
      (previous, next) {
        if (next is AsyncData<SoiEinzelformaufbau>) {
          handleUpdate(next.value.salesOrderItem!);
        }
      },
    );

    return initials;
  }

  /// Handles both updates and soft deletions of SalesOrderItems
  /// When deletedAt is set, the item will be removed from the list
  Future<void> handleUpdate(SalesOrderItem updatedItem) async {
    final currentList = state.whenData((list) => [...list]).requireValue;

    // Handle updates and additions
    final existingIndex = currentList.indexWhere(
      (item) => item.id == updatedItem.id,
    );

    if (existingIndex != -1) {
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedItem;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data([...currentList, updatedItem]);
    }
  }
}

/// Provider that watches for SoiPrepareArtwork updates for a specific artwork
@riverpod
Stream<SoiPrepareArtwork> watchSoiPrepareArtworkByArtwork(
  Ref ref, {
  required int artworkId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<SoiPrepareArtwork, SoiPrepareArtworkDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.soiPrepareArtwork.watchByArtwork(
      artworkId: artworkId,
    ),
    convertDtoToModel: SoiPrepareArtwork.fromDTO,
  );
}

@riverpod
Stream<SoiRequestArtworkApproval> watchSoiRequestArtworkApprovalByArtwork(
  Ref ref, {
  required int artworkId,
}) async* {
  final streamHelper = ServerpodStreamManager<SoiRequestArtworkApproval,
      SoiRequestArtworkApprovalDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.soiRequestArtworkApproval.watchByArtwork(
      artworkId: artworkId,
    ),
    convertDtoToModel: SoiRequestArtworkApproval.fromDTO,
  );
}

@riverpod
Stream<SoiEinzelformaufbau> watchSoiEinzelformaufbauByArtwork(
  Ref ref, {
  required int artworkId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<SoiEinzelformaufbau, SoiEinzelformaufbauDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.soiEinzelformaufbau.watchByArtwork(
      artworkId: artworkId,
    ),
    convertDtoToModel: SoiEinzelformaufbau.fromDTO,
  );
}

@riverpod
Future<List<SalesOrderItem>> watchGeneralSalesOrderItemsBySalesOrder(
  Ref ref, {
  required int salesOrderId,
  required String sessionId,
}) async {
  final all = await ref
      .watch(watchSalesOrderItemsProvider(salesOrderId, sessionId).future);

  final generealType = [
    SalesOrderItemType.consulting,
  ];

  return all.where((item) => generealType.contains(item.type)).toList();
}

@riverpod
class WatchSalesOrderItems extends _$WatchSalesOrderItems {
  @override
  Future<List<SalesOrderItem>> build(
    int salesOrderId,
    String sessionId,
  ) async {
    final initials = await ref.watch(
      fetchSalesOrderItemsProvider(
        salesOrderId: salesOrderId,
        sessionId: sessionId,
      ).future,
    );

    ref.listen(
      watchSalesOrderItemUpdatesProvider(
        sessionId: sessionId,
        salesOrderId: salesOrderId,
      ),
      (previous, next) {
        if (next is AsyncData<SalesOrderItem>) {
          handleEvent(next.value);
        }
      },
    );
    return initials;
  }

  void handleEvent(SalesOrderItem salesOrderItem) {
    final currentList = state.valueOrNull ?? [];
    // check if artwork is already in list
    // final isDeleted = salesOrderItem.deletedAt != null;

    // if (isDeleted) {
    //   state = AsyncValue.data(
    //     currentList.where((item) => item.id != salesOrderItem.id).toList(),
    //   );
    //   return;
    // }
    final existingIndex = currentList.indexWhere(
      (item) => item.id == salesOrderItem.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = salesOrderItem;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, salesOrderItem],
      );
    }
  }
}

@riverpod
Stream<SalesOrderItem> watchSalesOrderItemUpdates(
  Ref ref, {
  required String sessionId,
  required int salesOrderId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<SalesOrderItem, SalesOrderItemDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.salesOrderItem.watchForSalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: SalesOrderItem.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchSoiPrepareArtwork: $error');
    },
  );
}
