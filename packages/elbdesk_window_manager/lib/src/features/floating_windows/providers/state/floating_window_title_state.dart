import 'package:elbdesk_window_manager/src/features/floating_windows/models/floating_window_title_data.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'floating_window_title_state.g.dart';

/// FloatingWindowTitleState
///
/// Holds the title for a floating window
///
/// This way the title can easily be changed from everywhere, even from the
/// content of the window itself
@riverpod
class FloatingWindowTitleState extends _$FloatingWindowTitleState {
  @override
  FloatingWindowTitlebarData build(String floatingWindowId) {
    return FloatingWindowTitlebarData.empty();
  }

  /// Update the title
  void updateData(FloatingWindowTitlebarData data) {
    state = data;
  }

  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateIcon(IconData icon) {
    state = state.copyWith(icon: icon);
  }

  void updateBaseTitle(String baseTitle) {
    state = state.copyWith(baseTitle: baseTitle);
  }
}
