import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bearer_state.g.dart';

/// Bearer State
///
/// This state is used to manage and update the bearer details
@riverpod
class BearerState extends _$BearerState {
  @override
  Future<Bearer> build(int? id, String sessionId) async {
    // On dispose, release the bearer if the state is disposed
    // This is used to make the bearer editable again, if the user closes the
    // card without saving the changes
    ref.onDispose(() {
      if (state.hasValue && !state.isLoading) {
        // Only release in backend if the id is not 0 (new bearer)
        // The new bearer was just writen to the db, so it doesnt have to be
        // released
        if (id != 0) {
          ref
              .read(bearerRepositoryProvider)
              .releaseBearer(state.requireValue.meta.id!, sessionId)
              .then((_) {});
        }
      }
      ref.invalidate(fetchBearersProvider);
    });

    // New bearer -> Initialize new bearer
    if (id == 0) {
      return Bearer.initial();
    }

    final bearer = await ref.read(fetchBearerProvider(id!, sessionId).future);
    return bearer!;
  }

  /// Refresh the bearer
  /// -> This refetches the bearer from the server
  Future<void> refresh() async {
    state = const AsyncLoading();
    if (id != null) {
      final bearer = await ref.read(fetchBearerProvider(id!, sessionId).future);
      if (bearer != null) {
        state = AsyncData(bearer);
      }
    }
  }

  /// Sets the bearer lastLocalModifiedAt to the current time
  void updateLastLocalModifiedAt() {}

  // *
  // * General
  // *

  /// Update type
  void updateType(BearerType type) {
    state = AsyncData(state.requireValue.copyWith.general(type: type));

    switch (type) {
      case BearerType.type1:
        state = AsyncData(
          state.requireValue.copyWith.general(
            type1: BearerType1.initial(),
          ),
        );
      case BearerType.type2:
        state = AsyncData(
          state.requireValue.copyWith.general(
            type2: BearerType2.initial(),
          ),
        );
      // TODO(mh): Implement
      default:
        break;
    }

    updateLastLocalModifiedAt();
  }

  /// Updates the name of the bearer
  void updateName(String name) {
    state = AsyncData(state.requireValue.copyWith.general(name: name));
    updateLastLocalModifiedAt();
  }

  /// Update description
  void updateDescription(String description) {
    state = AsyncData(
      state.requireValue.copyWith.general(description: description),
    );
    updateLastLocalModifiedAt();
  }

  /// Update longText
  void updateLongText(String longText) {
    state = AsyncData(
      state.requireValue.copyWith.general(longText: longText),
    );
    updateLastLocalModifiedAt();
  }

  /// Update margin left for type 1
  void updateMarginLeft(double marginLeft) {
    state = AsyncData(
      state.requireValue.copyWith.general.type1!(marginLeft: marginLeft),
    );
    updateLastLocalModifiedAt();
  }

  /// Update margin right for type 1
  void updateMarginRight(double marginRight) {
    state = AsyncData(
      state.requireValue.copyWith.general.type1!(marginRight: marginRight),
    );
    updateLastLocalModifiedAt();
  }

  /// Update min height for type 2
  void updateMinHeight(double minHeight) {
    state = AsyncData(
      state.requireValue.copyWith.general.type2!(minHeight: minHeight),
    );
    updateLastLocalModifiedAt();
  }

  /// Update min width for type 2
  void updateMinWidth(double minWidth) {
    state = AsyncData(
      state.requireValue.copyWith.general.type2!(minWidth: minWidth),
    );
    updateLastLocalModifiedAt();
  }
}
