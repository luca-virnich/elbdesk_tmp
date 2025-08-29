import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingCrmEventWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingCrmEventWindowData({
    required this.eventId,
  }) : super(
          windowType: FloatingWindowType.crmEvent.name,
          icon: FloatingWindowType.crmEvent.icon,
          minSize: const Size(1100, 600),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the event
  final int? eventId;
}
