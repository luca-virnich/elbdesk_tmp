import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_consulting/repositories/soi_consulting_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'soi_consulting_provider.g.dart';

@riverpod
SoiConsultingRepository soiConsultingRepository(
  Ref ref,
) {
  return SoiConsultingRepository(
    endpoint: serverpodClient.soiConsulting,
  );
}

@riverpod
Future<List<SoiConsulting>> fetchSoiConsultingsBySalesOrder(
  Ref ref,
  int salesOrderId,
) async {
  return ref
      .watch(soiConsultingRepositoryProvider)
      .fetchForSalesOrder(salesOrderId);
}

@riverpod
class WatchSoiConsultingsBySalesOrder
    extends _$WatchSoiConsultingsBySalesOrder {
  @override
  Future<List<SoiConsulting>> build(
    int salesOrderId,
    String sessionId,
  ) async {
    final artworks = await ref.watch(
      fetchSoiConsultingsBySalesOrderProvider(salesOrderId).future,
    );

    ref
      ..listen(
        watchSoiConsultingUpdatesBySalesOrderProvider(salesOrderId),
        (previous, next) {
          if (next is AsyncData<SoiConsulting>) {
            handleEvent(next.value);
          }
        },
      )
      ..listen(
        watchSoiConsultingDeletionsBySalesOrderProvider(salesOrderId),
        (previous, next) {
          if (next is AsyncData<int>) {
            handleDeletion(next.value);
          }
        },
      );

    return artworks;
  }

  void handleEvent(SoiConsulting soiConsulting) {
    final currentList = state.valueOrNull ?? [];
    // check if artwork is already in list
    final isDeleted = soiConsulting.meta.deletedAt != null;

    if (isDeleted) {
      state = AsyncValue.data(
        currentList
            .where((item) => item.meta.id != soiConsulting.meta.id)
            .toList(),
      );
      return;
    }
    final existingIndex = currentList.indexWhere(
      (item) => item.meta.id == soiConsulting.meta.id,
    );

    if (existingIndex != -1) {
      // Update existing artwork
      final updatedList = [...currentList];
      updatedList[existingIndex] = soiConsulting;
      state = AsyncValue.data(updatedList);
    } else {
      state = AsyncValue.data(
        [...currentList, soiConsulting],
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
Stream<SoiConsulting> watchSoiConsultingUpdatesBySalesOrder(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper =
      ServerpodStreamManager<SoiConsulting, SoiConsultingDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.soiConsulting.watchBySalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: SoiConsulting.forSalesOrder,
    onError: (error) {
      dlog(
        'Error occurred in streamSoiConsultingUpdatesBySalesOrder: '
        '$error',
      );
    },
  );
}

@riverpod
Stream<int> watchSoiConsultingDeletionsBySalesOrder(
  Ref ref,
  int salesOrderId,
) async* {
  final streamHelper = ServerpodStreamManager<int, int>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.soiConsulting.watchDeletionsForSalesOrder(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: (dto) => dto,
    onError: (error) {
      dlog(
        'Error occurred in streamSoiConsultingDeletionsBySalesOrder: '
        '$error',
      );
    },
  );
}

@riverpod
Stream<SoiConsulting> watchSoiConsulting(
  Ref ref, {
  required String sessionId,
  required int id,
}) async* {
  final streamHelper =
      ServerpodStreamManager<SoiConsulting, SoiConsultingDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.soiConsulting.watch(
      sessionId: sessionId,
      entityId: id,
    ),
    convertDtoToModel: SoiConsulting.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchSoiConsulting: $error');
    },
  );
}
