import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'allow_windows_outside_view_provider.g.dart';

/// Provider for allowing windows to be positioned outside the viewport

@riverpod
class AllowWindowsOutsideView extends _$AllowWindowsOutsideView {
  @override
  bool build() => false;

  void update(bool value) {
    state = value;
  }
}
