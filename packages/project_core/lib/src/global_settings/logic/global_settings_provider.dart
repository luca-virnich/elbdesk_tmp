import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/global_settings/repositories/global_settings_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'global_settings_provider.g.dart';

/// Global Settings Repository Provider
@riverpod
GlobalSettingsRepository globalSettingsRepository(
  Ref ref,
) {
  return GlobalSettingsRepository(
    ref: ref,
    endpoint: serverpodClient.globalSettings,
  );
}

/// Global Settings Stream Provider
///
@riverpod
Stream<GlobalSettings> watchGlobalSettingsInAdminCard(
  Ref ref, {
  required String sessionId,
  required int entityId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<GlobalSettings, GlobalSettingsDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.globalSettings.watchEntity(
      sessionId: sessionId,
      entityId: entityId,
      releaseOnClose: true,
    ),
    convertDtoToModel: GlobalSettings.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchGlobalSettings: $error');
    },
  );
}

@riverpod
Stream<GlobalSettings> watchGlobalSettings(Ref ref) async* {
  final streamHelper =
      ServerpodStreamManager<GlobalSettings, GlobalSettingsDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.globalSettings.watch(),
    convertDtoToModel: GlobalSettings.fromDTO,
    onError: (error) {
      dlog('Error occurred in watchGlobalSettings: $error');
    },
  );
}

/// Fetch First Global Settings Provider
///
/// There should only ever be one global settings object - This provider
/// fetches the first global settings object and throws an exception if
/// it is not found
///
/// If this exception is thrown, something went wrong.
/// The server should create a global setting on startup
/// -> Check SetupGlobalSettingsFutureCall for more information
@riverpod
Future<GlobalSettings> fetchGlobalSettings(
  Ref ref,
) async {
  final repository = ref.watch(globalSettingsRepositoryProvider);
  final globalSettings = await repository.fetchSettings();
  return globalSettings;
}

@riverpod
class FetchAndWatchGlobalSettings extends _$FetchAndWatchGlobalSettings {
  @override
  Future<GlobalSettings> build() async {
    final repository = ref.watch(globalSettingsRepositoryProvider);
    final globalSettings = await repository.fetchSettings();
    ref.listen(watchGlobalSettingsProvider, (previous, next) {
      if (next is AsyncData<GlobalSettings>) {
        final prevData = state.hasValue ? state.value!.data : null;
        final data = next.value.data;
        if (prevData != data) {
          state = AsyncData(next.value);
        }
      }
    });
    final initial = state.hasValue ? state.value! : globalSettings;

    return initial;
  }
}

@riverpod
String artworkQuarantineBaseFolder(Ref ref) {
  final globalSettings = ref.watch(fetchAndWatchGlobalSettingsProvider);
  return globalSettings.requireValue.data.artworkFolderPath;
}
