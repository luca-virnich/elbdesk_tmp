import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/core_floating_window_types.dart';

class FloatingFlutterLogWindowData extends FloatingWindowData {
  /// Creates a new FloatingFlutterLogWindowData instance
  FloatingFlutterLogWindowData({
    required this.logId,
  }) : super(
          windowType: CoreFloatingWindowType.coreFlutterLog.name,
          icon: CoreFloatingWindowType.coreFlutterLog.icon,
          minSize: const Size(450, 450),
          defaultSize: const Size(1000, 600),
        );

  /// The ID of the log to display
  final int logId;
}
