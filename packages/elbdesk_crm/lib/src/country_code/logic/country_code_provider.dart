import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/country_code/repositories/country_code_repository.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'country_code_provider.g.dart';

@riverpod
CountryCodeRepository countryCodeRepository(
  Ref ref,
) {
  final endpoint = serverpodClient.countryCode;
  return CountryCodeRepository(endpoint: endpoint);
}

@riverpod
Future<CountryCode> fetchCountryCode(Ref ref, int id) async {
  return ref.watch(countryCodeRepositoryProvider).fetchById(id);
}

@riverpod
Future<List<CountryCode>> fetchAllCountryCodes(
  Ref ref,
  String sessionId,
) async {
  return ref.watch(countryCodeRepositoryProvider).fetchAll();
}

@riverpod
Future<List<CountryCode>> findCountryCodes(
  Ref ref,
  String sessionId,
) async {
  final (sorting, filtering) = ref
      .watch(tableSortAndFilterProvider(sessionId, TableType.countryCode.name));
  return ref
      .watch(countryCodeRepositoryProvider)
      .find(sort: sorting, filter: filtering);
}

@riverpod
Stream<CountryCode> watchCountryCode(
  Ref ref, {
  required String sessionId,
  required int countryCodeId,
}) async* {
  final streamHelper = ServerpodStreamManager<CountryCode, CountryCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.countryCode.watchEntity(
      sessionId: sessionId,
      entityId: countryCodeId,
    ),
    convertDtoToModel: CountryCode.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchCountryCode: $error');
    },
  );
}

@riverpod
Stream<CountryCode> watchAllCountryCodes(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<CountryCode, CountryCodeDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.countryCode.watchAll(),
    convertDtoToModel: CountryCode.fromDTO,
  );
}

@riverpod
class FetchAndWatchAllCountryCodes extends _$FetchAndWatchAllCountryCodes {
  @override
  Future<List<CountryCode>> build() async {
    ref.cacheFor(const Duration(minutes: 5));
    ref.listen(watchAllCountryCodesProvider, (previous, next) {
      if (next is AsyncData<CountryCode>) {
        handleEvent(next.value);
      }
    });
    final initial = await ref.watch(countryCodeRepositoryProvider).fetchAll();
    return initial;
  }

  Future<void> handleEvent(CountryCode countryCode) async {
    final current = await future;

    final index = current.indexWhere((element) => element.id == countryCode.id);
    if (index != -1) {
      final updatedList = List<CountryCode>.from(current);
      updatedList[index] = countryCode;
      state = AsyncData(updatedList);
    } else {
      state = AsyncData([...current, countryCode]);
    }
  }
}
