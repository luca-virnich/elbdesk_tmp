import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'migration_overlay_state.g.dart';

/// State for the migration overlay
@riverpod
class MigrationOverlayState extends _$MigrationOverlayState {
  @override
  MigrationOverlayStateData build() {
    return const MigrationOverlayStateData();
  }

  /// Updates the progress and text of the overlay
  void updateState({
    double? progress,
    String? text,
  }) {
    state = state.copyWith(
      progress: progress ?? state.progress,
      text: text ?? state.text,
    );
  }

  /// Resets the state to initial values
  void reset() {
    state = const MigrationOverlayStateData();
  }
}

/// Data class for the migration overlay state
class MigrationOverlayStateData {
  /// Creates a new instance of MigrationOverlayStateData
  const MigrationOverlayStateData({
    this.progress = 0.0,
    this.text,
  });

  /// The current progress value
  final double progress;

  /// The current status text
  final String? text;

  /// Creates a copy of this state with the given fields replaced with the new values
  MigrationOverlayStateData copyWith({
    double? progress,
    String? text,
  }) {
    return MigrationOverlayStateData(
      progress: progress ?? this.progress,
      text: text ?? this.text,
    );
  }
}
