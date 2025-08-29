import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'in_window_keyboard_height.g.dart';

@riverpod
class InWindowKeyboardHeight extends _$InWindowKeyboardHeight {
  @override
  double build() {
    final viewInsets = ref.watch(viewInsetsProvider).bottom;
    final safeAreaPadding = ref.watch(safeAreaPaddingProvider).bottom;

    return (viewInsets - WindowManagerConstants.mobileBottomBarHeight).clamp(
      0,
      double.infinity,
    );
  }
}

@riverpod
class RootKeyboardHeight extends _$RootKeyboardHeight {
  @override
  double build() {
    final viewInsets = ref.watch(viewInsetsProvider).bottom;
    final safeAreaPadding = ref.watch(safeAreaPaddingProvider).bottom;
    return (viewInsets).clamp(0, double.infinity);
  }
}

@riverpod
class KeyboardHeight extends _$KeyboardHeight {
  @override
  double build(bool useRootNavigator) {
    if (useRootNavigator) {
      return ref.watch(rootKeyboardHeightProvider);
    }
    return ref.watch(inWindowKeyboardHeightProvider);
  }
}
