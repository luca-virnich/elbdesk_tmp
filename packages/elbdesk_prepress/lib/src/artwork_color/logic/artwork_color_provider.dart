import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_color_provider.g.dart';

@riverpod
ArtworkColorRepository artworkColorRepository(
  Ref ref,
) {
  return ArtworkColorRepository(
    ref: ref,
    endpoint: serverpodClient.artworkColor,
  );
}

@riverpod
Future<List<ArtworkColor>> findArtworkColors(
  Ref ref,
  String sessionId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artworkColor.name,
    ),
  );
  return ref
      .watch(artworkColorRepositoryProvider)
      .find(sort: sort, filter: filter);
}

@riverpod
Future<List<ArtworkColor>> findArtworkColorsByCustomerId(
  Ref ref,
  String sessionId,
  int customerId,
) async {
  final (sort, filter) = ref.watch(
    tableSortAndFilterProvider(
      sessionId,
      TableType.artworkColor.name,
    ),
  );
  return ref.watch(artworkColorRepositoryProvider).findAllByCustomerId(
        customerId: customerId,
        sort: sort,
        filter: filter,
      );
}

/// Find Colors by Color Book id
@riverpod
Future<List<ArtworkColor>> findArtworkColorsByColorBookId(
  Ref ref,
  String sessionId,
  int? colorPaletteId,
) async {
  if (colorPaletteId == null) {
    return [];
  }

  return ref
      .watch(artworkColorRepositoryProvider)
      .fetchColorPaletteColors(colorPaletteId);
}

@riverpod
Stream<ArtworkColor> watchArtworkColor(
  Ref ref, {
  required String sessionId,
  required int colorId,
}) async* {
  final streamHelper = ServerpodStreamManager<ArtworkColor, ArtworkColorDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.artworkColor.watch(
      sessionId: sessionId,
      entityId: colorId,
    ),
    convertDtoToModel: ArtworkColor.fromDTO,
    onError: (error) {
      dlog('Error occurred in streamArtworkColor: $error');
    },
  );
}
