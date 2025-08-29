import 'dart:ui';

import 'package:elbdesk_prepress/src/artwork/models/artwork.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_artworks_for_multi_nutzenlayout.freezed.dart';
part 'selected_artworks_for_multi_nutzenlayout.g.dart';

// * Holds the artworks that are selected for a single nutzenlayout

@freezed
class MultiNutzenlayoutArtworkSelection
    with _$MultiNutzenlayoutArtworkSelection {
  factory MultiNutzenlayoutArtworkSelection({
    required Artwork artwork,
  }) = _MultiNutzenlayoutArtworkSelection;
  const MultiNutzenlayoutArtworkSelection._();

  Size get size => Size(artwork.width, artwork.height);
}

@riverpod
class SelectedArtworksForSammelformaufbau
    extends _$SelectedArtworksForSammelformaufbau {
  @override
  Set<MultiNutzenlayoutArtworkSelection> build(String sessionId) {
    return {};
  }

  bool addArtwork(MultiNutzenlayoutArtworkSelection artwork) {
    state = {...state, artwork};
    return true;
  }

  bool removeArtwork(MultiNutzenlayoutArtworkSelection artworkSelection) {
    state = state
        .where(
          (selection) => selection.artwork != artworkSelection.artwork,
        )
        .toSet();
    return true;
  }

  bool toggleArtwork(MultiNutzenlayoutArtworkSelection artworkSelection) {
    if (state.contains(artworkSelection)) {
      return removeArtwork(artworkSelection);
    } else {
      return addArtwork(artworkSelection);
    }
  }
}
