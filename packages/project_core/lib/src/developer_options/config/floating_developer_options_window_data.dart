import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingDeveloperOptionsWindowData extends FloatingWindowData {
  FloatingDeveloperOptionsWindowData()
      : super(
          windowType: FloatingWindowType.developerOptions.name,
          icon: FloatingWindowType.developerOptions.icon,
          minSize: const Size(1000, 600),
          defaultSize: const Size(1000, 600),
        );
}
