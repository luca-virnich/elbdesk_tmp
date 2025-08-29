import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart' hide FloatingWindowData;
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// AsyncValue extension
extension AsyncValueExtension<T> on AsyncValue<T> {
  /// FastWhen implementation of the AsyncValue when operator
  ///
  /// Loading and Error State are already handled to enable faster development,
  /// cleaner code and less boilerplate.
  Widget fastWhen({
    required Widget Function(T data) data,
    bool skipLoadingOnRefresh = false,
    bool skipLoadingOnReload = false,
    Color? loadingColor,
  }) {
    return when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      loading: () => const Center(
        child: AppLoadingIndicator(),
      ),
      error: (err, stack) {
        return AppText(err.toString());
      },
      data: data,
    );
  }

  /// EmptyWhen implementation of the AsyncValue when operator
  Widget emptyWhen({
    required Widget Function(T data) data,
    bool skipLoadingOnRefresh = false,
    bool skipLoadingOnReload = false,
  }) {
    return when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      loading: SizedBox.shrink,
      error: (err, stack) {
        return const SizedBox.shrink();
      },
      data: data,
    );
  }

  Widget componentWhen({
    required Widget Function(T data) data,
    required Widget loadingWidget,
    bool skipLoadingOnRefresh = false,
    bool skipLoadingOnReload = false,
  }) {
    return when(
      skipLoadingOnRefresh: skipLoadingOnRefresh,
      skipLoadingOnReload: skipLoadingOnReload,
      loading: () => loadingWidget,
      error: (err, stack) {
        dlog('Error: $err');
        dlog('Stack: $stack');
        return AppText(err.toString());
      },
      data: data,
    );
  }
}

/// Cached AutoDisposeRef extension
///
/// Caches the value for the specified duration
///
/// - cacheImmediatly
///
extension CacheFor<T> on Ref<T> {
  /// CacheFor

  void cacheFor(
    Duration duration,
  ) {
    Timer? timer;

    final link = keepAlive();
    onCancel(() {
      timer?.cancel();
      timer = Timer(duration, link.close);
    });
    onResume(() {
      timer?.cancel();
      timer = null;
    });

    // // We are defining a timer to control when we want to dispose the provider
    // // This will take the passed duration

    onDispose(() {
      timer?.cancel();
      timer = null;
    });
  }
}

extension WindowManagerRefExtension on Ref {
  void openWindow(FloatingWindowData data) {
    read(windowManagerProvider).openWindow(data);
  }

  void removeWindow(String id) {
    read(windowManagerProvider).removeWindow(id);
  }
}

extension WindowManagerWidgetRefExtension on WidgetRef {
  void openWindow(FloatingWindowData data) {
    read(windowManagerProvider).openWindow(data);
  }

  void removeWindow(String id) {
    read(windowManagerProvider).removeWindow(id);
  }
}
