import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingAdminSettingsWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingAdminSettingsWindowData()
      : super(
          windowType: FloatingWindowType.adminSettings.name,
          icon: FloatingWindowType.adminSettings.icon,
          minSize: const Size(650, 450),
          defaultSize: const Size(1000, 750),
        );
}
