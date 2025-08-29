import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
class FloatingEntityLockTableWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingEntityLockTableWindowData()
      : super(
          windowType: FloatingWindowType.adminEntityLockTable.name,
          icon: FloatingWindowType.adminEntityLockTable.icon,
          minSize: const Size(800, 400),
          defaultSize: const Size(800, 400),
        );
}
