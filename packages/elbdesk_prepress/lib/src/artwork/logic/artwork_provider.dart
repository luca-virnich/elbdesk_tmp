import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/repositories/artwork_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_provider.g.dart';

@riverpod
ArtworkRepository artworkRepository(Ref ref) {
  final endpoint = serverpodClient.artwork;

  final logEndpoint = serverpodClient.artworkLog;
  return ArtworkRepository(
    ref: ref,
    endpoint: endpoint,
    logEndpoint: logEndpoint,
  );
}

@riverpod
Future<List<Artwork>> findArtworks(
  Ref ref,
  String sessionId,
) async {
  final repository = ref.watch(artworkRepositoryProvider);
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artwork.name,
    ),
  );
  return repository.find(sort: sort, filter: filter);
}

@riverpod
Future<List<Artwork>> fetchArtworkHistory(
  Ref ref,
  int artworkMasterId,
  String sessionId,
) async {
  final repository = ref.watch(artworkRepositoryProvider);
  return repository.fetchHistory(artworkMasterId);
}

@riverpod
Future<Artwork?> fetchArtworkReadOnly(
  Ref ref,
  int id,
  String sessionId,
) async {
  final repository = ref.watch(artworkRepositoryProvider);
  return repository.fetchReadOnly(id);
}

@riverpod
Stream<Artwork> watchArtwork(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper = ServerpodStreamManager<Artwork, ArtworkDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artwork.watchEntity(
      sessionId: sessionId,
      entityId: id,
      releaseOnClose: true,
    ),
    convertDtoToModel: Artwork.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtwork: $error');
    },
  );
}

@riverpod
Stream<Artwork> watchArtworkReadOnly(
  Ref ref, {
  required int id,
}) async* {
  final streamHelper = ServerpodStreamManager<Artwork, ArtworkDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artwork.watchEntity(
      sessionId: '0',
      entityId: id,
      releaseOnClose: false,
    ),
    convertDtoToModel: Artwork.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchArtwork: $error');
    },
  );
}

@riverpod
Future<List<Artwork>> fetchArtworksBySalesOrder(
  Ref ref,
  int salesOrderId,
) async {
  final repository = ref.watch(artworkRepositoryProvider);
  return repository.fetchBySalesOrderId(salesOrderId);
}

@riverpod
class WatchArtworksBySalesOrder extends _$WatchArtworksBySalesOrder {
  @override
  Future<List<Artwork>> build(int salesOrderId, String sessionId) async {
    final artworks = await ref.watch(
      fetchArtworksBySalesOrderProvider(salesOrderId).future,
    );

    ref
      ..listen(
        watchArtworkUpdatesBySalesOrderProvider(salesOrderId),
        (previous, next) {
          if (next is AsyncData<Artwork>) {
            handleEvent(next.value);
          }
        },
      )
      ..listen(
        watchArtworkDeletionsBySalesOrderProvider(salesOrderId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletion(next.value);
          }
        },
      );

    return artworks;
  }

  void handleEvent(Artwork updatedArtwork) {
    final currentList = state.valueOrNull ?? [];
    // check if artwork is already in list
    final isDeleted = updatedArtwork.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != updatedArtwork.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == updatedArtwork.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = updatedArtwork;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, updatedArtwork],
      );
    }
  }

  void handleDeletion(int id) {
    final currentList = state.valueOrNull ?? [];
    state = AsyncValue.data(
      currentList.where((item) => item.meta.id != id).toList(),
    );
  }
}

@riverpod
Stream<Artwork> watchArtworkUpdatesBySalesOrder(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper = ServerpodStreamManager<Artwork, ArtworkDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artwork.watchForSalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: Artwork.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamArtworkQuarantinesByCustomerId: $error');
    },
  );
}

@riverpod
Stream<int> watchArtworkDeletionsBySalesOrder(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artwork.watchDeletionsForSalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog('Error occurred in streamArtworkQuarantinesByCustomerId: $error');
    },
  );
}

@riverpod
class WatchArtworkRealtime extends _$WatchArtworkRealtime {
  @override
  Future<Artwork?> build(int artworkId, String sessionId) async {
    final artwork = await ref.watch(
      fetchArtworkReadOnlyProvider(artworkId, sessionId).future,
    );

    ref.listen(
      watchArtworkReadOnlyProvider(id: artworkId),
      (previous, next) {
        if (next is AsyncData<Artwork>) {
          state = next;
        }
      },
    );

    return artwork;
  }
}

@riverpod
Future<List<ArtworkLogDTO>> fetchArtworkLogs(
  Ref ref,
  int artworkMasterId,
  String sessionId,
) async {
  final repository = ref.watch(artworkRepositoryProvider);
  return repository.fetchArtworkLogs(artworkMasterId, TableType.artworkMaster);
}
