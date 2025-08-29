import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

/// Configuration data for the Admin Migration floating window

class FloatingAdminMigrationWindowData extends FloatingWindowData {
  /// Creates a new instance of FloatingAdminMigrationWindowData
  FloatingAdminMigrationWindowData()
      : super(
          windowType: FloatingWindowType.adminMigration.name,
          icon: FloatingWindowType.adminMigration.icon,
          minSize: const Size(650, 450),
          defaultSize: const Size(1000, 600),
        );
}
