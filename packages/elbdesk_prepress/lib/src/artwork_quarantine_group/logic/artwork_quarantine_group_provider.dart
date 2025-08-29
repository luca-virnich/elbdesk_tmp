import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_quarantine_group_provider.g.dart';

/// Artwork Quarantine Group Repository Provider
@riverpod
ArtworkQuarantineGroupRepository artworkQuarantineGroupRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.artworkQuarantineGroup;
  return ArtworkQuarantineGroupRepository(ref: ref, endpoint: endpoint);
}

/// Find Artwork Quarantine Groups Provider
@riverpod
Future<List<ArtworkQuarantineGroup>> findArtworkQuarantineGroups(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch(artworkQuarantineGroupRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artworkQuarantineGroup.name,
    ),
  );
  return repository.find(sort: sort, filter: filter);
}

/// Fetch Artwork Quarantine Group Provider
@riverpod
Future<ArtworkQuarantineGroup?> fetchArtworkQuarantineGroup(
  Ref ref,
  int artworkQuarantineGroupId,
) async {
  final repository = ref.watch(artworkQuarantineGroupRepositoryProvider);
  return repository.fetchById(artworkQuarantineGroupId);
}

/// Watch Artwork Quarantine Group Stream Provider
@riverpod
Stream<ArtworkQuarantineGroup> watchArtworkQuarantineGroup(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper = ServerpodStreamManager<ArtworkQuarantineGroup,
      ArtworkQuarantineGroupDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artworkQuarantineGroup.watchEntity(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: ArtworkQuarantineGroup.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtworkQuarantineGroup: $error');
    },
  );
}

/// Watch Artwork Quarantine Groups By Customer Provider
///
/// Handles incoming stream
@riverpod
class WatchArtworkQuarantineGroupsByCustomer
    extends _$WatchArtworkQuarantineGroupsByCustomer {
  @override
  Future<List<ArtworkQuarantineGroup>> build(int customerId) async {
    ref.listen(
      watchArtworkQuarantineGroupUpdatesByCustomerIdProvider(customerId),
      (previous, next) {
        if (next is AsyncData<ArtworkQuarantineGroup>) {
          handleEvent(next.value);
        }
      },
    );
    final initialList = await ref.watch(
      fetchArtworkQuarantineGroupsByCustomerIdProvider(
        customerId,
      ).future,
    );

    return initialList;
  }

  /// Handles updates to artwork quarantine group items in the list
  /// Removes items that are deleted
  /// Adds new items that don't exist in the list
  Future<void> handleEvent(ArtworkQuarantineGroup updatedGroup) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    // Check if item should be removed (deleted)
    final isDeleted = updatedGroup.meta.deletedAt != null;

    if (isDeleted) {
      // Remove item from list if it exists
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedGroup.meta.id)
            .toList(),
      );
      return;
    }

    // Check if item already exists in list
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedGroup.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing item in place
      final updatedList = List<ArtworkQuarantineGroup>.from(currentList);
      updatedList[existingIndex] = updatedGroup;
      state = AsyncValue.data(updatedList);
      return;
    }

    // Add new item to beginning of list
    state = AsyncValue.data(
      [
        updatedGroup,
        ...state.valueOrNull ?? [],
      ],
    );
  }
}

/// Fetch Artwork Quarantine Groups By Customer ID Provider
@riverpod
Future<List<ArtworkQuarantineGroup>> fetchArtworkQuarantineGroupsByCustomerId(
  Ref ref,
  int customerId,
) async {
  final repository = ref.watch(artworkQuarantineGroupRepositoryProvider);
  return repository.fetchByCustomerId(customerId);
}

/// Watch Artwork Quarantine Group Updates By Customer ID Stream Provider
@riverpod
Stream<ArtworkQuarantineGroup> watchArtworkQuarantineGroupUpdatesByCustomerId(
  Ref ref,
  int customerId,
) async* {
  final streamHelper = ServerpodStreamManager<ArtworkQuarantineGroup,
      ArtworkQuarantineGroupDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.artworkQuarantineGroup.watchCustomerGroups(
      customerId: customerId,
    ),
    convertDtoToModel: ArtworkQuarantineGroup.fromDTO,
    onError: (error) {
      dlog(
        'Error occurred in watchArtworkQuarantineGroupUpdatesByCustomerId: '
        '$error',
      );
    },
  );
}

/// Watch Artwork Quarantine Groups By Status Provider
///
/// Handles incoming stream of filtered groups
@riverpod
class WatchArtworkQuarantineGroupsByStatus
    extends _$WatchArtworkQuarantineGroupsByStatus {
  @override
  Future<List<ArtworkQuarantineGroup>> build(
    ArtworkQuarantineGroupStatus status,
  ) async {
    ref.listen(
      watchArtworkQuarantineGroupsByStatusStreamProvider(
        status,
      ),
      (previous, next) {
        if (next is AsyncData<ArtworkQuarantineGroup>) {
          handleEvent(next.value);
        }
      },
    );
    final initialList = await ref.watch(
      fetchArtworkQuarantineGroupsByStatusProvider(
        status,
      ).future,
    );

    return initialList;
  }

  /// Handles updates to artwork quarantine group items in the list
  /// Removes items that are deleted or no longer have the specified status
  /// Adds new items with the specified status that don't exist in the list
  Future<void> handleEvent(ArtworkQuarantineGroup updatedGroup) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    // Check if item should be removed (deleted or status changed)
    final isDeleted = updatedGroup.meta.deletedAt != null;
    final isNotTodoStatus = updatedGroup.status != status;

    if (isDeleted || isNotTodoStatus) {
      // Remove item from list if it exists
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedGroup.meta.id)
            .toList(),
      );
      return;
    }

    // Check if item already exists in list
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedGroup.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing item in place
      final updatedList = List<ArtworkQuarantineGroup>.from(currentList);
      updatedList[existingIndex] = updatedGroup;
      state = AsyncValue.data(updatedList);
      return;
    }

    // Add new item to beginning of list (only if it has todo status)
    if (updatedGroup.status == status) {
      state = AsyncValue.data(
        [
          updatedGroup,
          ...state.valueOrNull ?? [],
        ],
      );
    }
  }
}

/// Watch Artwork Quarantine Groups By Status Stream Provider
@riverpod
Stream<ArtworkQuarantineGroup> watchArtworkQuarantineGroupsByStatusStream(
  Ref ref,
  ArtworkQuarantineGroupStatus status,
) async* {
  final streamHelper = ServerpodStreamManager<ArtworkQuarantineGroup,
      ArtworkQuarantineGroupDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.artworkQuarantineGroup.watchGroupsByStatus(
      status: status,
    ),
    convertDtoToModel: ArtworkQuarantineGroup.fromDTO,
    onError: (error) {
      dlog(
        'Error occurred in watchArtworkQuarantineGroupsByStatus: $error',
      );
    },
  );
}

/// Fetch Artwork Quarantine Groups By Status Provider
@riverpod
Future<List<ArtworkQuarantineGroup>> fetchArtworkQuarantineGroupsByStatus(
  Ref ref,
  ArtworkQuarantineGroupStatus status,
) async {
  final repository = ref.watch(artworkQuarantineGroupRepositoryProvider);
  return repository.fetchByStatus(status);
}

/// Fetch artwork quarantine groups by customer ID and status
@riverpod
Future<List<ArtworkQuarantineGroup>>
    fetchArtworkQuarantineGroupsByCustomerIdAndStatus(
  Ref ref, {
  required int customerId,
  required ArtworkQuarantineGroupStatus status,
}) async {
  final repository = ref.watch(artworkQuarantineGroupRepositoryProvider);
  return repository.fetchGroupsByCustomerIdAndStatus(
    customerId: customerId,
    status: status,
  );
}

/// Watch Artwork Quarantine Groups By Customer ID And Status Provider
///
/// Watches Groups by Customer ID and Status
/// Listens to updates from the customer groups stream and filters by status
@riverpod
class WatchArtworkQuarantineGroupsByCustomerIdAndStatus
    extends _$WatchArtworkQuarantineGroupsByCustomerIdAndStatus {
  @override
  Future<List<ArtworkQuarantineGroup>> build({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    // Listen to group updates for this customer
    ref.listen(
      watchArtworkQuarantineGroupUpdatesByCustomerIdProvider(customerId),
      (previous, next) {
        if (next is AsyncData<ArtworkQuarantineGroup>) {
          handleEvent(next.value);
        }
      },
    );

    final initialList = await ref.watch(
      fetchArtworkQuarantineGroupsByCustomerIdAndStatusProvider(
        customerId: customerId,
        status: status,
      ).future,
    );

    return initialList;
  }

  /// Handles updates to artwork quarantine group items in the list
  /// Removes items that are deleted or no longer match the status criteria
  /// Adds new items with the specified status that don't exist in the list
  Future<void> handleEvent(ArtworkQuarantineGroup updatedGroup) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    // Check if item should be removed (deleted, wrong customer, or wrong status)
    final isDeleted = updatedGroup.meta.deletedAt != null;
    final isWrongCustomer = updatedGroup.customerId != customerId;
    final isWrongStatus = updatedGroup.status != status;

    if (isDeleted || isWrongCustomer || isWrongStatus) {
      // Remove item from list if it exists
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedGroup.meta.id)
            .toList(),
      );
      return;
    }

    // Check if item already exists in list
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedGroup.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing item in place
      final updatedList = List<ArtworkQuarantineGroup>.from(currentList);
      updatedList[existingIndex] = updatedGroup;
      state = AsyncValue.data(updatedList);
      return;
    }

    // Add new item to beginning of list (only if it matches our criteria)
    if (updatedGroup.customerId == customerId &&
        updatedGroup.status == status) {
      state = AsyncValue.data(
        [
          updatedGroup,
          ...state.valueOrNull ?? [],
        ],
      );
    }
  }
}
