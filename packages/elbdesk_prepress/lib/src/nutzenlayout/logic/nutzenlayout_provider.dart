import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/logic/selected_artworks_for_single_nutzenlayout.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'nutzenlayout_provider.g.dart';

@riverpod
NutzenlayoutRepository nutzenlayoutRepository(Ref ref) {
  return NutzenlayoutRepository(
    endpoint: serverpodClient.nutzenLayout,
  );
}

@riverpod
Future<List<int>> fetchNutzelayoutsByMasterId(
  Ref ref,
  String sessionId,
) async {
  final selectedArtworks = ref.watch(
    selectedArtworksForEinzelformaufbauProvider(sessionId),
  );
  final masterIds = selectedArtworks.map((e) => e.artworkMasterId!).toSet();

  final nutzenlayouts = await ref
      .watch(nutzenlayoutRepositoryProvider)
      .fetchNutzelayoutsByMasterId(
        masterIds: masterIds,
      );
  return nutzenlayouts;
}

@riverpod
Future<List<Nutzenlayout>> fetchNutzenlayoutsByCustomerWithDimensions(
  Ref ref, {
  required int customerId,
  required double width,
  required double height,
}) async {
  final nutzenlayouts = await ref
      .watch(nutzenlayoutRepositoryProvider)
      .fetchByCustomerWithDimensions(
        customerId: customerId,
        width: width,
        height: height,
      );
  return nutzenlayouts;
}

@riverpod
Future<List<Nutzenlayout>> fetchMultiNutzenlayoutsByCustomerWithDimensions(
  Ref ref, {
  required int customerId,
  required Set<NutzenlayoutArtworkDimensions> dimensions,
}) async {
  final nutzenlayouts = await ref
      .watch(nutzenlayoutRepositoryProvider)
      .fetchMultiByCustomerWithDimensions(
        customerId: customerId,
        dimensions: dimensions.toList(),
      );
  return nutzenlayouts;
}

@riverpod
Future<List<Nutzenlayout>> fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrder(
  Ref ref, {
  required int salesOrderId,
  required int artworkId,
}) async {
  final nutzenlayouts = await ref.watch(
    fetchAndWatchSalesOrderSingleNutzenlayoutsProvider(
      salesOrderId: salesOrderId,
    ).future,
  );

  return nutzenlayouts
      .where(
        (element) => element.artworkIds.contains(artworkId),
      )
      .map((e) => e.nutzenlayout)
      .toList();
}

@riverpod
class FetchAndWatchSalesOrderSingleNutzenlayouts
    extends _$FetchAndWatchSalesOrderSingleNutzenlayouts {
  @override
  Future<List<SalesOrderSingleNutzenlayoutLight>> build({
    required int salesOrderId,
  }) async {
    ref.listen(
        watchSalesOrderSingleNutzenlayoutsLightProvider(
          salesOrderId: salesOrderId,
        ), (previous, next) {
      if (next is AsyncData<SalesOrderSingleNutzenlayoutLightDTO>) {
        handleEvent(next.value);
      }
    });

    final nutzenlayouts = await ref
        .watch(nutzenlayoutRepositoryProvider)
        .fetchSingleWithArtworkIds(salesOrderId: salesOrderId);

    return nutzenlayouts;
  }

  Future<void> handleEvent(
    SalesOrderSingleNutzenlayoutLightDTO dto,
  ) async {
    final nutzenlayout = SalesOrderSingleNutzenlayoutLight.fromDTO(dto);
    final current = await future;
    final index = current.indexWhere(
      (element) =>
          element.salesOrderSingleNutzenlayoutId ==
          nutzenlayout.salesOrderSingleNutzenlayoutId,
    );
    if (index != -1) {
      final artworkIds = nutzenlayout.artworkIds;
      final updatedList = List<SalesOrderSingleNutzenlayoutLight>.from(current);
      if (artworkIds.isEmpty) {
        updatedList.removeAt(index);
      } else {
        updatedList[index] = nutzenlayout;
      }
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, nutzenlayout]);
    }
  }
}

@riverpod
Stream<SalesOrderSingleNutzenlayoutLightDTO>
    watchSalesOrderSingleNutzenlayoutsLight(
  Ref ref, {
  required int salesOrderId,
}) {
  final streamHelper = ServerpodStreamManager<
      SalesOrderSingleNutzenlayoutLightDTO,
      SalesOrderSingleNutzenlayoutLightDTO>();
  return streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.nutzenLayout.watchSalesOrderSingleNutzenlayoutsLight(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: (dto) => dto,
  );
}

/// *
/// * Multi Nutzenlayouts
/// *

@riverpod
class FetchAndWatchSalesOrderMultiNutzenlayouts
    extends _$FetchAndWatchSalesOrderMultiNutzenlayouts {
  @override
  Future<List<SalesOrderMultiNutzenlayoutLight>> build({
    required int salesOrderId,
  }) async {
    ref.listen(
        watchSalesOrderMultiNutzenlayoutsLightProvider(
          salesOrderId: salesOrderId,
        ), (previous, next) {
      if (next is AsyncData<SalesOrderMultiNutzenlayoutLightDTO>) {
        handleEvent(next.value);
      }
    });

    final nutzenlayouts = await ref
        .watch(nutzenlayoutRepositoryProvider)
        .fetchMultiWithArtworkIds(salesOrderId: salesOrderId);

    return nutzenlayouts;
  }

  Future<void> handleEvent(
    SalesOrderMultiNutzenlayoutLightDTO dto,
  ) async {
    final nutzenlayout = SalesOrderMultiNutzenlayoutLight.fromDTO(dto);
    final current = await future;
    final index = current.indexWhere(
      (element) =>
          element.salesOrderMultiNutzenlayoutId ==
          nutzenlayout.salesOrderMultiNutzenlayoutId,
    );
    if (index != -1) {
      final artworkIds = nutzenlayout.artworkIds;
      final updatedList = List<SalesOrderMultiNutzenlayoutLight>.from(current);
      if (artworkIds.isEmpty) {
        updatedList.removeAt(index);
      } else {
        updatedList[index] = nutzenlayout;
      }
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, nutzenlayout]);
    }
  }
}

@riverpod
Stream<SalesOrderMultiNutzenlayoutLightDTO>
    watchSalesOrderMultiNutzenlayoutsLight(
  Ref ref, {
  required int salesOrderId,
}) {
  final streamHelper = ServerpodStreamManager<
      SalesOrderMultiNutzenlayoutLightDTO,
      SalesOrderMultiNutzenlayoutLightDTO>();
  return streamHelper.setupStream(
    ref: ref,
    startListening: () =>
        serverpodClient.nutzenLayout.watchSalesOrderMultiNutzenlayoutsLight(
      salesOrderId: salesOrderId,
    ),
    convertDtoToModel: (dto) => dto,
  );
}

@riverpod
Future<List<Nutzenlayout>> fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrder(
  Ref ref, {
  required int salesOrderId,
  required int artworkId,
}) async {
  final nutzenlayouts = await ref.watch(
    fetchAndWatchSalesOrderMultiNutzenlayoutsProvider(
      salesOrderId: salesOrderId,
    ).future,
  );

  return nutzenlayouts
      .where(
        (element) => element.artworkIds.contains(artworkId),
      )
      .map((e) => e.nutzenlayout)
      .toList();
}

/// *
/// * Combined
/// *

@riverpod
Future<List<Nutzenlayout>> fetchAndWatchArtworkNutzenlayoutsBySalesOrder(
  Ref ref, {
  required int salesOrderId,
  required int artworkId,
}) async {
  final single = await ref.watch(
    fetchAndWatchArtworkSingleNutzenlayoutsBySalesOrderProvider(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    ).future,
  );
  final multi = await ref.watch(
    fetchAndWatchArtworkMultiNutzenlayoutsBySalesOrderProvider(
      salesOrderId: salesOrderId,
      artworkId: artworkId,
    ).future,
  );

  return [...single, ...multi];
}
