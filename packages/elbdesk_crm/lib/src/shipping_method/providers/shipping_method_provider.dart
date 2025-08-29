import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/shipping_method/repositories/shipping_method_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shipping_method_provider.g.dart';

@riverpod
Future<ShippingMethod> fetchShippingMethod(Ref ref, int id) async {
  return ref.watch(shippingMethodRepositoryProvider).fetchById(id);
}

@riverpod
Future<List<ShippingMethod>> findShippingMethods(
  Ref ref,
  String sessionId,
) async {
  final (sorting, filtering) = ref.watch(
    tableSortAndFilterProvider(sessionId, TableType.shippingMethod.name),
  );

  return ref
      .watch(shippingMethodRepositoryProvider)
      .find(sort: sorting, filter: filtering);
}

@riverpod
ShippingMethodRepository shippingMethodRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.shippingMethod;
  return ShippingMethodRepository(endpoint: endpoint);
}

@riverpod
Stream<ShippingMethod> watchShippingMethod(
  Ref ref, {
  required String sessionId,
  required int shippingMethodId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<ShippingMethod, ShippingMethodDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.shippingMethod.watch(
      sessionId: sessionId,
      entityId: shippingMethodId,
    ),
    convertDtoToModel: ShippingMethod.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchShippingMethod: $error');
    },
  );
}

@riverpod
Stream<ShippingMethod> watchAllShippingMethods(
  Ref ref,
) {
  final streamHelper =
      ServerpodStreamManager<ShippingMethod, ShippingMethodDTO>();
  return streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.shippingMethod.watchAll(),
    convertDtoToModel: ShippingMethod.fromDTO,
  );
}

@riverpod
class FetchAndWatchAllShippingMethods
    extends _$FetchAndWatchAllShippingMethods {
  @override
  Future<List<ShippingMethod>> build() async {
    ref.cacheFor(const Duration(minutes: 5));
    ref.listen(watchAllShippingMethodsProvider, (previous, next) {
      if (next is AsyncData<ShippingMethod>) {
        handleEvent(next.value);
      }
    });
    final initial =
        await ref.watch(shippingMethodRepositoryProvider).fetchAll();
    return initial;
  }

  Future<void> handleEvent(ShippingMethod shippingMethod) async {
    final current = await future;

    final index = current.indexWhere(
      (element) => element.id == shippingMethod.id,
    );
    if (index != -1) {
      final updatedList = List<ShippingMethod>.from(current);
      updatedList[index] = shippingMethod;
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, shippingMethod]);
    }
  }
}
