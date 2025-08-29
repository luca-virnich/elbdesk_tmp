// import 'dart:async';

// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_sales/src/soi_step_and_repeat/models/soi_step_and_repeat.dart';
// import 'package:elbdesk_sales/src/soi_step_and_repeat/repositories/soi_step_and_repeat_repository.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'soi_step_and_repeat_provider.g.dart';

// @riverpod
// SoiStepAndRepeatRepository soiStepAndRepeatRepository(
//   Ref ref,
// ) {
//   return SoiStepAndRepeatRepository(
//     endpoint: serverpodClient.soiStepAndRepeat,
//   );
// }

// @riverpod
// Future<List<SoiStepAndRepeat>> fetchSoiStepAndRepeatBySalesOrder(
//   Ref ref,
//   int salesOrderId,
// ) async {
//   return ref
//       .watch(soiStepAndRepeatRepositoryProvider)
//       .fetchForSalesOrder(salesOrderId);
// }

// @riverpod
// class WatchSoiStepAndRepeatBySalesOrder
//     extends _$WatchSoiStepAndRepeatBySalesOrder {
//   @override
//   Future<List<SoiStepAndRepeat>> build(
//     int salesOrderId,
//     String sessionId,
//   ) async {
//     final artworks = await ref.watch(
//       fetchSoiStepAndRepeatBySalesOrderProvider(salesOrderId).future,
//     );

//     ref
//       ..listen(
//         watchSoiStepAndRepeatUpdatesBySalesOrderProvider(salesOrderId),
//         (previous, next) {
//           if (next is AsyncData<SoiStepAndRepeat>) {
//             handleEvent(next.value);
//           }
//         },
//       )
//       ..listen(
//         watchSoiStepAndRepeatDeletionsBySalesOrderProvider(salesOrderId),
//         (previous, next) {
//           if (next is AsyncData<int>) {
//             handleDeletion(next.value);
//           }
//         },
//       );

//     return artworks;
//   }

//   void handleEvent(SoiStepAndRepeat salesOrderItem) {
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
// Stream<SoiStepAndRepeat> watchSoiStepAndRepeatUpdatesBySalesOrder(
//   Ref ref,
//   int salesOrderId,
// ) async* {
//   final streamHelper =
//       EntityStreamManager<SoiStepAndRepeat, SoiStepAndRepeatDTO>();
//   yield* streamHelper.setupStream(
//     ref: ref,
//     startListening: () => serverpodClient.soiStepAndRepeat.watchForSalesOrder(
//       StreamController<SoiStepAndRepeatDTO>.broadcast().stream,
//       salesOrderId: salesOrderId,
//     ),
//     convertDtoToModel: SoiStepAndRepeat.forSalesOrder,
//     onError: (error) {
//       dlog(
//         'Error occurred in streamSoiPrepareArtworkUpdatesBySalesOrder: $error',
//       );
//     },
//   );
// }

// @riverpod
// Stream<int> watchSoiStepAndRepeatDeletionsBySalesOrder(
//   Ref ref,
//   int salesOrderId,
// ) async* {
//   final streamHelper = IntStreamManager();
//   yield* streamHelper.setupStream(
//     ref: ref,
//     startListening: () =>
//         serverpodClient.soiStepAndRepeat.watchDeletionsForSalesOrder(
//       StreamController<int>.broadcast().stream,
//       salesOrderId: salesOrderId,
//     ),
//     onError: (error) {
//       dlog(
//         'Error occurred in streamSoiPrepareArtworkDeletionsBySalesOrder: '
//         '$error',
//       );
//     },
//   );
// }
