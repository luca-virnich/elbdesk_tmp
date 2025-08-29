import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_artworks_for_single_nutzenlayout.g.dart';

// * Holds the artworks that are selected for a single nutzenlayout

@riverpod
class SelectedArtworksForEinzelformaufbau
    extends _$SelectedArtworksForEinzelformaufbau {
  @override
  Set<Artwork> build(String sessionId) {
    return {};
  }

  bool addArtwork(Artwork artwork) {
    // check if the width and height are the same as the existing artworks
    if (state.any(
      (selection) => selection.size != artwork.size,
    )) {
      return false;
    }
    state = {...state, artwork};
    return true;
  }

  bool removeArtwork(int artworkId) {
    state = state.where((selection) => selection.id != artworkId).toSet();
    return true;
  }

  bool toggleArtwork(Artwork artwork) {
    if (state.contains(artwork)) {
      return removeArtwork(artwork.id!);
    } else {
      return addArtwork(artwork);
    }
  }
}
