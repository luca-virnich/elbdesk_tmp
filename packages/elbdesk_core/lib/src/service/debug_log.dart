import 'package:flutter/foundation.dart';

/// Debug log with orange color
void dlog(Object? message) {
  if (!kDebugMode) return;

  const ansiOrange = '\x1B[38;5;214m';

  const ansiReset = '\x1B[0m';

  // ignore: avoid_print
  print('$ansiOrange** $message **$ansiReset');
}
