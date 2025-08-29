import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/core_floating_window_types.dart';

class FloatingAdminLogWindowData extends FloatingWindowData {
  /// Creates a new FloatingAdminLogWindowData instance
  FloatingAdminLogWindowData()
      : super(
          windowType: CoreFloatingWindowType.coreAdminLog.name,
          icon: CoreFloatingWindowType.coreAdminLog.icon,
          minSize: const Size(450, 450),
          defaultSize: const Size(1000, 600),
        );
}
