import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

/// Data class for the floating MOP admin window

class FloatingMopAdminWindowData extends FloatingWindowData {
  /// Creates a new instance of FloatingMopAdminWindowData
  FloatingMopAdminWindowData()
      : super(
          windowType: FloatingWindowType.mopAdmin.name,
          icon: FloatingWindowType.mopAdmin.icon,
          minSize: const Size(600, 600),
          defaultSize: const Size(800, 800),
        );
}
