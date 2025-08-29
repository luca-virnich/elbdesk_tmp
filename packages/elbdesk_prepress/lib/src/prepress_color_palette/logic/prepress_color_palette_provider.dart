import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'prepress_color_palette_provider.g.dart';

@riverpod
PrepressColorPaletteRepository prepressColorPaletteRepository(
  Ref ref,
) {
  return PrepressColorPaletteRepository(
    ref: ref,
    endpoint: serverpodClient.prepressColorPalette,
  );
}

@riverpod
Future<List<PrepressColorPalette>> findPrepressColorPalettes(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.prepressColorPalette.name,
    ),
  );
  return ref
      .watch(prepressColorPaletteRepositoryProvider)
      .find(sort: sort, filter: filter);
}

@riverpod
Future<List<PrepressColorPalette>> fetchGlobalAndCustomerColorBooks(
  Ref ref,
  int customerId,
  String sessionId,
) async {
  return ref
      .watch(prepressColorPaletteRepositoryProvider)
      .fetchGlobalAndCustomerColorBooks(customerId);
}

@riverpod
Stream<PrepressColorPalette> watchPrepressColorPalette(
  Ref ref, {
  required String sessionId,
  required int colorPaletteId,
}) async* {
  final streamHelper =
      ServerpodStreamManager<PrepressColorPalette, PrepressColorPaletteDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.prepressColorPalette.watch(
      sessionId: sessionId,
      entityId: colorPaletteId,
    ),
    convertDtoToModel: PrepressColorPalette.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamPrepressColorPalette: $error');
    },
  );
}

@riverpod
Stream<List<ArtworkColor>> watchColorPaletteColors(
  Ref ref, {
  required String sessionId,
  required int colorPaletteId,
}) {
  return ref
      .watch(
        watchPrepressColorPaletteProvider(
          sessionId: sessionId,
          colorPaletteId: colorPaletteId,
        ),
      )
      .when(
        data: (palette) => Stream.value(palette.colors ?? <ArtworkColor>[]),
        error: Stream.error,
        loading: () => Stream.value(<ArtworkColor>[]),
      );
}
