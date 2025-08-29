import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

/// Data class for the floating CRM admin window

class FloatingCrmAdminWindowData extends FloatingWindowData {
  /// Creates a new instance of FloatingCrmAdminWindowData
  FloatingCrmAdminWindowData()
      : super(
          windowType: FloatingWindowType.crmAdmin.name,
          icon: FloatingWindowType.crmAdmin.icon,
          minSize: const Size(600, 600),
          defaultSize: const Size(800, 800),
        );
}
