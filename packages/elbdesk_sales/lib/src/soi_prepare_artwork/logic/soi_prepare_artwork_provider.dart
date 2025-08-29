import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_prepare_artwork/repositories/soi_prepare_artwork_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soi_prepare_artwork_provider.g.dart';

@riverpod
SoiPrepareArtworkRepository soiPrepareArtworkRepository(
  Ref ref,
) {
  return SoiPrepareArtworkRepository(
    endpoint: serverpodClient.soiPrepareArtwork,
  );
}

@riverpod
Future<List<SoiPrepareArtwork>> fetchSoiPrepareArtworksBySalesOrder(
  Ref ref,
  int salesOrderId,
) async {
  return ref
      .watch(soiPrepareArtworkRepositoryProvider)
      .fetchForSalesOrder(salesOrderId);
}

// @riverpod
// class WatchSoiPrepareArtworksBySalesOrder
//     extends _$WatchSoiPrepareArtworksBySalesOrder {
//   @override
//   Future<List<SoiPrepareArtwork>> build(
//     int salesOrderId,
//     String sessionId,
//   ) async {
//     final artworks = await ref.watch(
//       fetchSoiPrepareArtworksBySalesOrderProvider(salesOrderId).future,
//     );

//     ref
//       ..listen(
//         watchSoiPrepareArtworkUpdatesBySalesOrderProvider(salesOrderId),
//         (previous, next) {
//           if (next is AsyncData<SoiPrepareArtwork>) {
//             handleEvent(next.value);
//           }
//         },
//       )
//       ..listen(
//         watchSoiPrepareArtworkDeletionsBySalesOrderProvider(salesOrderId),
//         (previous, next) {
//           if (next is AsyncData<int>) {
//             handleDeletion(next.value);
//           }
//         },
//       );

//     return artworks;
//   }

//   void handleEvent(SoiPrepareArtwork salesOrderItem) {
//     final currentList = state.valueOrNull ?? [];
//     // check if artwork is already in list
//     final isDeleted = salesOrderItem.meta.deletedAt != null;

//     if (isDeleted) {
//       state = AsyncValue.data(
//         currentList
//             .where((item) => item.meta.id != salesOrderItem.meta.id)
//             .toList(),
//       );
//       return;
//     }
//     final existingIndex = currentList.indexWhere(
//       (item) => item.meta.id == salesOrderItem.meta.id,
//     );

//     if (existingIndex != -1) {
//       // Update existing artwork
//       final updatedList = [...currentList];
//       updatedList[existingIndex] = salesOrderItem;
//       state = AsyncValue.data(updatedList);
//     } else {
//       state = AsyncValue.data(
//         [...currentList, salesOrderItem],
//       );
//     }
//   }

//   void handleDeletion(int id) {
//     final currentList = state.valueOrNull ?? [];
//     state = AsyncValue.data(
//       currentList.where((item) => item.meta.id != id).toList(),
//     );
//   }
// }

// @riverpod
// Stream<SoiPrepareArtwork> watchSoiPrepareArtworkUpdatesBySalesOrder(
//   Ref ref,
//   int salesOrderId,
// ) async* {
//   final streamHelper =
//       EntityStreamManager<SoiPrepareArtwork, SoiPrepareArtworkDTO>();
//   yield* streamHelper.setupStream(
//     ref: ref,
//     startListening: () => serverpodClient.soiPrepareArtwork.watchForSalesOrder(
//       StreamController<SoiPrepareArtworkDTO>.broadcast().stream,
//       salesOrderId: salesOrderId,
//     ),
//     convertDtoToModel: SoiPrepareArtwork.forSalesOrder,
//     onError: (error) {
//       dlog(
//         'Error occurred in streamSoiPrepareArtworkUpdatesBySalesOrder: '
//         '$error',
//       );
//     },
//   );
// }

@riverpod
Stream<int> watchSoiPrepareArtworkDeletionsBySalesOrder(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.soiPrepareArtwork.watchDeletionsForSalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog(
        'Error occurred in streamSoiPrepareArtworkDeletionsBySalesOrder: '
        '$error',
      );
    },
  );
}

@riverpod
Stream<SoiPrepareArtwork> watchSoiPrepareArtwork(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<SoiPrepareArtwork, SoiPrepareArtworkDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.soiPrepareArtwork.watchEntity(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: SoiPrepareArtwork.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchSoiPrepareArtwork: $error');
    },
  );
}
