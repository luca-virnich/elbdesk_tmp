import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/repositories/artwork_quarantine_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_quarantine_provider.g.dart';

/// Artwork Quarantine Repository Provider
@riverpod
ArtworkQuarantineRepository artworkQuarantineRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.artworkQuarantine;
  return ArtworkQuarantineRepository(ref: ref, endpoint: endpoint);
}

/// Find Artwork Quarantines Provider
@riverpod
Future<List<ArtworkQuarantine>> findArtworkQuarantines(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch(artworkQuarantineRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artworkQuarantine.name,
    ),
  );
  return repository.find(sort: sort, filter: filter);
}

/// Watch Artwork Quarantines By Customer Provider
///
/// Watches Quarantines by Customer ID
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
@riverpod
class WatchArtworkQuarantinesByCustomer
    extends _$WatchArtworkQuarantinesByCustomer {
  @override
  Future<List<ArtworkQuarantine>> build(
    int customerId,
  ) async {
    ref
      ..listen(
        watchArtworkQuarantineUpdatesByCustomerIdProvider(customerId),
        (previous, next) {
          if (next is AsyncData<ArtworkQuarantine>) {
            handleEvent(next.value);
          }
        },
      )
      ..listen(
        watchArtworkQuarantineDeletionsProvider(customerId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletions(next.value);
          }
        },
      );

    final initialList = await ref.watch(
      fetchArtworkQuarantinesByCustomerIdProvider(customerId).future,
    );

    return initialList;
  }

  /// Handles updates to artwork quarantine items in the list
  /// Removes items that are deleted or have an artwork ID
  ///
  /// (Artwork ID is set when artwork is created - Afterwards the quarantine
  /// doesn't have to be displayed anymore)
  ///
  /// Adds new items that don't exist in the list
  Future<void> handleEvent(ArtworkQuarantine updatedArtworkQuarantine) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    // Check if item should be removed (deleted or has artwork)
    final isDeletedOrHasArtworkId =
        updatedArtworkQuarantine.meta.deletedAt != null ||
            updatedArtworkQuarantine.general.artworkId != null;

    if (isDeletedOrHasArtworkId) {
      // Remove item from list if it exists
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedArtworkQuarantine.meta.id)
            .toList(),
      );
      return;
    }

    // Update if item already exists in list
    if (currentList
        .any((item) => item.meta.id == updatedArtworkQuarantine.meta.id)) {
      // Update existing item in place
      final updatedList = List<ArtworkQuarantine>.from(currentList);
      updatedList[currentList.indexWhere(
        (item) => item.meta.id == updatedArtworkQuarantine.meta.id,
      )] = updatedArtworkQuarantine;
      state = AsyncValue.data(updatedList);
      return;
    }

    // Add new item to beginning of list
    state = AsyncValue.data(
      [
        updatedArtworkQuarantine,
        ...state.valueOrNull ?? [],
      ],
    );
  }

  /// Handles deletion events by removing deleted quarantines from the list
  void handleDeletions(int deletedId) {
    final currentList = state.valueOrNull ?? [];
    if (currentList.isEmpty) return;

    state = AsyncValue.data(
      currentList.where((item) => item.meta.id != deletedId).toList(),
    );
  }
}

/// Fetch Artwork Quarantines By Customer ID Provider
@riverpod
Future<List<ArtworkQuarantine>> fetchArtworkQuarantinesByCustomerId(
  Ref ref,
  int customerId,
) async {
  final repository = ref.watch(artworkQuarantineRepositoryProvider);
  return repository.fetchByCustomerId(customerId);
}

/// Fetch Artwork Quarantines By Group ID Provider
@riverpod
Future<List<ArtworkQuarantine>> fetchArtworkQuarantinesByGroupId(
  Ref ref,
  int groupId,
) async {
  final repository = ref.watch(artworkQuarantineRepositoryProvider);
  return repository.fetchByGroupId(groupId);
}

/// Fetch Artwork Quarantines By Group ID And Status Provider
@riverpod
Future<List<ArtworkQuarantine>> fetchArtworkQuarantinesByGroupIdAndStatus(
  Ref ref, {
  required int groupId,
  required ArtworkQuarantineGroupStatus status,
}) async {
  final repository = ref.watch(artworkQuarantineRepositoryProvider);
  return repository.fetchByGroupIdAndStatus(groupId, status);
}

/// Fetch Artwork Quarantine Provider
@riverpod
Future<ArtworkQuarantine?> fetchArtworkQuarantine(
  Ref ref,
  int artworkQuarantineId,
) async {
  final repository = ref.watch(artworkQuarantineRepositoryProvider);
  return repository.fetchById(artworkQuarantineId);
}

/// Watch Artwork Quarantine Provider
@riverpod
Stream<ArtworkQuarantine> watchArtworkQuarantine(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<ArtworkQuarantine, ArtworkQuarantineDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artworkQuarantine.watchEntity(
      sessionId: sessionId,
      entityId: id,
      releaseOnClose: true,
    ),
    convertDtoToModel: ArtworkQuarantine.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtworkQuarantine: $error');
    },
  );
}

/// Watch Artwork Quarantine Updates By Customer ID Stream Provider
/// Only listens to updates for specific customer
@riverpod
Stream<ArtworkQuarantine> watchArtworkQuarantineUpdatesByCustomerId(
  Ref ref,
  int customerId,
) async* {
  final streamHelper =
      ServerpodStreamManager<ArtworkQuarantine, ArtworkQuarantineDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.artworkQuarantine.watchCustomerQuarantines(
      customerId: customerId,
    ),
    convertDtoToModel: ArtworkQuarantine.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamArtworkQuarantinesByCustomerId: $error');
    },
  );
}

/// Watch artwork quarantines deletions Stream Provider
@riverpod
Stream<int> watchArtworkQuarantineDeletions(
  Ref ref,
  int customerId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artworkQuarantine.watchDeleted(),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog('Error occurred in streamArtworkQuarantinesByCustomerId: $error');
    },
  );
}

/// Watch All Artwork Quarantines Updates Stream Provider
@riverpod
Stream<ArtworkQuarantine> watchAllArtworkQuarantinesUpdates(
  Ref ref,
) async* {
  final streamHelper =
      ServerpodStreamManager<ArtworkQuarantine, ArtworkQuarantineDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.artworkQuarantine.watchAllQuarantines(),
    convertDtoToModel: ArtworkQuarantine.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamArtworkQuarantinesByCustomerId: $error');
    },
  );
}

/// Watch All Artwork Quarantines Provider
@riverpod
class AllArtworkQuarantinesRealTime extends _$AllArtworkQuarantinesRealTime {
  @override
  Future<List<ArtworkQuarantine>> build(String sessionId) async {
    final allQuarantines =
        await ref.watch(findArtworkQuarantinesProvider(sessionId).future);
    ref.listen(
      watchAllArtworkQuarantinesUpdatesProvider,
      (previous, next) {
        if (next is AsyncData<ArtworkQuarantine>) {
          handleEvent(next.value);
        }
      },
    );

    return allQuarantines;
  }

  void handleEvent(ArtworkQuarantine updatedArtworkQuarantine) {
    final currentList = state.valueOrNull ?? [];
    state = AsyncValue.data([...currentList, updatedArtworkQuarantine]);
  }
}

/// Fetch artwork quarantines by customer ID and group status
@riverpod
Future<List<ArtworkQuarantine>> fetchArtworkQuarantinesByCustomerIdAndStatus(
  Ref ref, {
  required int customerId,
  required ArtworkQuarantineGroupStatus status,
}) async {
  final repository = ref.watch(artworkQuarantineGroupRepositoryProvider);
  return repository.fetchQuarantinesByCustomerIdAndStatus(
    customerId: customerId,
    status: status,
  );
}

/// Watch Artwork Quarantines By Customer ID And Status Provider
///
/// Watches Quarantines by Customer ID and Status
/// Listens to updates and deletions
///
/// Deletion Stream provides IDs of deleted quarantines
@riverpod
class WatchArtworkQuarantinesByCustomerIdAndStatus
    extends _$WatchArtworkQuarantinesByCustomerIdAndStatus {
  @override
  Future<List<ArtworkQuarantine>> build({
    required int customerId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    // Listens to group updates (Needed since the group might edit several
    // quarantines at once)
    ref
      ..listen(
        watchArtworkQuarantineGroupUpdatesByCustomerIdProvider(
          customerId,
        ),
        (previous, next) {
          if (next is AsyncData<ArtworkQuarantineGroup>) {
            handleGroupEvent(next.value);
          }
        },
      )

      // Listens to all quarantines by customer
      ..listen(
        watchArtworkQuarantinesByCustomerProvider(
          customerId,
        ),
        (previous, next) {
          if (next is AsyncData<List<ArtworkQuarantine>>) {
            handleQuarantineEvent(next.value);
          }
        },
      )

      // Listens to deletions
      ..listen(
        watchArtworkQuarantineDeletionsProvider(customerId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletions(next.value);
          }
        },
      );

    final initialList = await ref.watch(
      fetchArtworkQuarantinesByCustomerIdAndStatusProvider(
        customerId: customerId,
        status: status,
      ).future,
    );

    return initialList;
  }

  /// Handles updates to artwork quarantine items in the list
  /// Removes items that are deleted or no longer match the criteria
  /// Adds new items that match the criteria and don't exist in the list
  Future<void> handleQuarantineEvent(
    List<ArtworkQuarantine> updatedQuarantines,
  ) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    for (final updatedQuarantine in updatedQuarantines) {
      // Check if item should be removed
      final isDeleted = updatedQuarantine.meta.deletedAt != null;
      final hasArtwork = updatedQuarantine.general.artworkId != null;

      if (isDeleted || hasArtwork) {
        // Skip this item - the delete stream will handle it
        return;
      }

      // Check if item already exists in list -> Update it
      else if (currentList
          .any((item) => item.meta.id == updatedQuarantine.meta.id)) {
        final updatedList = List<ArtworkQuarantine>.from(currentList);
        updatedList[currentList.indexWhere(
          (item) => item.meta.id == updatedQuarantine.meta.id,
        )] = updatedQuarantine;
        state = AsyncValue.data(updatedList);
        return;
      }
    }
  }

  /// Handles updates to artwork quarantine items in the list
  /// Removes items that are deleted or no longer match the criteria
  /// Adds new items that match the criteria and don't exist in the list
  Future<void> handleGroupEvent(
    ArtworkQuarantineGroup updatedQuarantineGroup,
  ) async {
    // Wait for initial data to be loaded
    await future;

    final currentList = state.valueOrNull ?? [];

    // Check if item should be removed
    final isDeleted = updatedQuarantineGroup.meta.deletedAt != null;

    final groupStatus = updatedQuarantineGroup.status;

    final doesNotMatchCriteria = groupStatus != status;

    if (isDeleted || doesNotMatchCriteria) {
      // Remove item from list if it exists
      state = AsyncValue.data(
        currentList
            .where((item) => item.groupId != updatedQuarantineGroup.meta.id)
            .toList(),
      );
      return;
    }

    for (final updatedQuarantine
        in updatedQuarantineGroup.artworkQuarantines ?? <ArtworkQuarantine>[]) {
      // Validate quarantine object
      final isQuarantineDeleted = updatedQuarantine.meta.deletedAt != null;
      final hasArtworkId = updatedQuarantine.general.artworkId != null;

      // Skip invalid quarantines
      if (isQuarantineDeleted || hasArtworkId) {
        continue;
      }

      // Check if item already exists in list
      final existingIndex = currentList.indexWhere(
        (item) => item.meta.id == updatedQuarantine.meta.id,
      );

      if (existingIndex != -1) {
        // Update existing item in place
        final updatedList = List<ArtworkQuarantine>.from(currentList);
        updatedList[existingIndex] = updatedQuarantine;
        state = AsyncValue.data(updatedList);
        return;
      }

      // Add new item to beginning of list
      if (groupStatus == status && updatedQuarantine.customerId == customerId) {
        state = AsyncValue.data(
          [
            updatedQuarantine,
            ...state.valueOrNull ?? [],
          ],
        );
      }
    }
  }

  /// Handles deletion events by removing deleted quarantines from the list
  void handleDeletions(int deletedId) {
    final currentList = state.valueOrNull ?? [];
    if (currentList.isEmpty) return;

    state = AsyncValue.data(
      currentList.where((item) => item.meta.id != deletedId).toList(),
    );
  }
}

/// Watch Artwork Quarantines By Group ID Provider
///
/// Watches Quarantines by Group ID
/// Listens to updates and deletions
@riverpod
class WatchArtworkQuarantinesByGroupId
    extends _$WatchArtworkQuarantinesByGroupId {
  @override
  Future<List<ArtworkQuarantine>> build(int groupId) async {
    // Listen to individual quarantine updates
    ref
      ..listen(
        watchAllArtworkQuarantinesUpdatesProvider,
        (previous, next) {
          if (next is AsyncData<ArtworkQuarantine>) {
            handleQuarantineEvent(next.value);
          }
        },
      )

      // Listen to deletions
      ..listen(
        watchArtworkQuarantineDeletionsProvider(groupId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletions(next.value);
          }
        },
      );

    final initialList = await ref.watch(
      fetchArtworkQuarantinesByGroupIdProvider(groupId).future,
    );

    return initialList;
  }

  /// Handles updates to artwork quarantine items in the list
  Future<void> handleQuarantineEvent(
    ArtworkQuarantine updatedQuarantine,
  ) async {
    await future;
    final currentList = state.valueOrNull ?? [];

    // Only process quarantines that belong to this group
    if (updatedQuarantine.groupId != groupId) return;

    // Check if item is deleted or has been converted to artwork
    final isDeleted = updatedQuarantine.meta.deletedAt != null;
    final hasArtwork = updatedQuarantine.general.artworkId != null;

    if (isDeleted || hasArtwork) {
      // Remove from list
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedQuarantine.meta.id)
            .toList(),
      );
      return;
    }

    // Update existing item or add new one
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedQuarantine.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing item
      final updatedList = List<ArtworkQuarantine>.from(currentList);
      updatedList[existingIndex] = updatedQuarantine;
      state = AsyncValue.data(updatedList);
    } else {
      // Add new item
      state = AsyncValue.data([updatedQuarantine, ...currentList]);
    }
  }

  /// Handles deletion events by removing deleted quarantines from the list
  void handleDeletions(int deletedId) {
    final currentList = state.valueOrNull ?? [];
    if (currentList.isEmpty) return;

    state = AsyncValue.data(
      currentList.where((item) => item.meta.id != deletedId).toList(),
    );
  }
}

/// Watch Artwork Quarantines By Group ID And Status Provider
///
/// Watches Quarantines by Group ID and Status
/// Listens to updates and deletions
@riverpod
class WatchArtworkQuarantinesByGroupIdAndStatus
    extends _$WatchArtworkQuarantinesByGroupIdAndStatus {
  @override
  Future<List<ArtworkQuarantine>> build({
    required int groupId,
    required ArtworkQuarantineGroupStatus status,
  }) async {
    // Listen to individual quarantine updates
    ref
      ..listen(
        watchAllArtworkQuarantinesUpdatesProvider,
        (previous, next) {
          if (next is AsyncData<ArtworkQuarantine>) {
            handleQuarantineEvent(next.value);
          }
        },
      )

      // Listen to deletions
      ..listen(
        watchArtworkQuarantineDeletionsProvider(groupId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletions(next.value);
          }
        },
      );

    final initialList = await ref.watch(
      fetchArtworkQuarantinesByGroupIdAndStatusProvider(
        groupId: groupId,
        status: status,
      ).future,
    );

    return initialList;
  }

  /// Handles updates to artwork quarantine items in the list
  Future<void> handleQuarantineEvent(
    ArtworkQuarantine updatedQuarantine,
  ) async {
    await future;
    final currentList = state.valueOrNull ?? [];

    // Only process quarantines that belong to this group and status
    if (updatedQuarantine.groupId != groupId ||
        updatedQuarantine.general.status != status) {
      return;
    }

    // Check if item is deleted or has been converted to artwork
    final isDeleted = updatedQuarantine.meta.deletedAt != null;
    final hasArtwork = updatedQuarantine.general.artworkId != null;

    if (isDeleted || hasArtwork) {
      // Remove from list
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedQuarantine.meta.id)
            .toList(),
      );
      return;
    }

    // Update existing item or add new one
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedQuarantine.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing item
      final updatedList = List<ArtworkQuarantine>.from(currentList);
      updatedList[existingIndex] = updatedQuarantine;
      state = AsyncValue.data(updatedList);
    } else {
      // Add new item
      state = AsyncValue.data([updatedQuarantine, ...currentList]);
    }
  }

  /// Handles deletion events by removing deleted quarantines from the list
  void handleDeletions(int deletedId) {
    final currentList = state.valueOrNull ?? [];
    if (currentList.isEmpty) return;

    state = AsyncValue.data(
      currentList.where((item) => item.meta.id != deletedId).toList(),
    );
  }
}
