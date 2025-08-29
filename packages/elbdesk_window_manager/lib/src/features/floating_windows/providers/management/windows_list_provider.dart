import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/floating_window_data.dart';
import 'open_windows_provider.dart';
import 'window_z_order_provider.dart';

part 'windows_list_provider.g.dart';

/// Provider that returns ordered list of windows for compatibility
@riverpod
List<FloatingWindowData> windowsList(Ref ref) {
  final windows = ref.watch(openWindowsProvider);
  final zOrder = ref.watch(windowZOrderProvider);

  // Return windows in z-order
  return zOrder
      .where((id) => windows.containsKey(id))
      .map((id) => windows[id]!)
      .toList();
}
