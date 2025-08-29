import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork_layer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artwork_history_provider.g.dart';

@riverpod
Future<List<ArtworkColor>> watchArtworkHistoryColors(
  Ref ref,
  List<ArtworkColor> colors,
) async {
  return colors;
}

@riverpod
Future<List<ArtworkLayer>> watchArtworkHistoryLayers(
  Ref ref,
  List<ArtworkLayer> layers,
) async {
  return layers;
}
