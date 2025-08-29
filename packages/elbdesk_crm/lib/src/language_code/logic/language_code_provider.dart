import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/language_code/repositories/language_code_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'language_code_provider.g.dart';

@riverpod
Future<LanguageCode> fetchLanguageCode(Ref ref, int id) async {
  return ref.watch(languageCodeRepositoryProvider).fetchById(id);
}

@riverpod
Future<List<LanguageCode>> findLanguageCodes(
  Ref ref,
  String sessionId,
) async {
  final (sorting, filtering) = ref.watch(
    tableSortAndFilterProvider(sessionId, TableType.languageCode.name),
  );

  return ref
      .watch(languageCodeRepositoryProvider)
      .find(sort: sorting, filter: filtering);
}

@riverpod
Future<List<LanguageCode>> fetchAllLanguageCodes(
  Ref ref,
  String sessionId,
) async {
  return ref.watch(languageCodeRepositoryProvider).fetchAll();
}

@riverpod
LanguageCodeRepository languageCodeRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.languageCode;
  return LanguageCodeRepository(endpoint: endpoint);
}

@riverpod
Stream<LanguageCode> watchLanguageCode(
  Ref ref, {
  required String sessionId,
  required int languageCodeId,
}) async* {
  final streamHelper = ServerpodStreamManager<LanguageCode, LanguageCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.languageCode.watch(
      sessionId: sessionId,
      entityId: languageCodeId,
    ),
    convertDtoToModel: LanguageCode.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchLanguageCode: $error');
    },
  );
}

@riverpod
Stream<LanguageCode> watchAllLanguageCodes(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<LanguageCode, LanguageCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: serverpodClient.languageCode.watchAll,
    convertDtoToModel: LanguageCode.fromDTO,
  );
}

@riverpod
class FetchAndWatchAllLanguageCodes extends _$FetchAndWatchAllLanguageCodes {
  @override
  Future<List<LanguageCode>> build() async {
    ref.cacheFor(const Duration(minutes: 5));
    ref.listen(watchAllLanguageCodesProvider, (previous, next) {
      if (next is AsyncData<LanguageCode>) {
        handleEvent(next.value);
      }
    });
    final initial = await ref.watch(languageCodeRepositoryProvider).fetchAll();
    return initial;
  }

  Future<void> handleEvent(LanguageCode languageCode) async {
    final current = await future;

    final index =
        current.indexWhere((element) => element.id == languageCode.id);
    if (index != -1) {
      final updatedList = List<LanguageCode>.from(current);
      updatedList[index] = languageCode;
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, languageCode]);
    }
  }
}
