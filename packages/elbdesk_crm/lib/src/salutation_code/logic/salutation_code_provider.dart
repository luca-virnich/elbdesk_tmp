import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';
import 'package:elbdesk_crm/src/salutation_code/repositories/salutation_code_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'salutation_code_provider.g.dart';

@riverpod
Future<SalutationCode> fetchSalutationCode(
  Ref ref,
  int id,
) async {
  return ref.watch(salutationCodeRepositoryProvider).fetchById(id);
}

/// Used to fetch all salutation codes when adding an entity which
/// requires a salutation code (like a contact).
@riverpod
Future<List<SalutationCode>> fetchAllSalutationCodes(
  Ref ref,
) async {
  return ref.watch(salutationCodeRepositoryProvider).fetchAll();
}

@riverpod
Future<List<SalutationCode>> findSalutationCodes(
  Ref ref,
  String sessionId,
) async {
  final sorting = ref.watch(appTableSortStateProvider(sessionId));
  final filtering = ref.watch(
    appTableFilterStateProvider(TableType.salutationCode.name, sessionId),
  );
  return ref
      .watch(salutationCodeRepositoryProvider)
      .find(sort: sorting, filter: filtering);
}

@riverpod
SalutationCodeRepository salutationCodeRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.salutationCode;
  return SalutationCodeRepository(endpoint: endpoint);
}

@riverpod
Stream<SalutationCode> watchSalutationCode(
  Ref ref, {
  required String sessionId,
  required int salutationCodeId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<SalutationCode, SalutationCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.salutationCode.watch(
      sessionId: sessionId,
      entityId: salutationCodeId,
    ),
    convertDtoToModel: SalutationCode.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchSalutationCode: $error');
    },
  );
}

@riverpod
Stream<SalutationCode> watchAllSalutationCodes(
  Ref ref,
) async* {
  final streamHelper =
      ServerpodStreamManager<SalutationCode, SalutationCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.salutationCode.watchAll(),
    convertDtoToModel: SalutationCode.fromDTO,
  );
}

@riverpod
class FetchAndWatchAllSalutationCodes
    extends _$FetchAndWatchAllSalutationCodes {
  @override
  Future<List<SalutationCode>> build() async {
    ref.cacheFor(const Duration(minutes: 5));
    ref.listen(watchAllSalutationCodesProvider, (previous, next) {
      if (next is AsyncData<SalutationCode>) {
        handleEvent(next.value);
      }
    });
    final initial =
        await ref.watch(salutationCodeRepositoryProvider).fetchAll();
    return initial;
  }

  Future<void> handleEvent(SalutationCode salutationCode) async {
    final current = await future;

    final index =
        current.indexWhere((element) => element.id == salutationCode.id);
    if (index != -1) {
      final updatedList = List<SalutationCode>.from(current);
      updatedList[index] = salutationCode;
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, salutationCode]);
    }
  }
}
