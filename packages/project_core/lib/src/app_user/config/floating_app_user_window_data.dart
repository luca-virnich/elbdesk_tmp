import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingAppUserWindowData extends FloatingWindowData {
  /// ContactStackWindowData constructor
  FloatingAppUserWindowData({
    required this.appUserId,
    this.tableSessionId,
  }) : super(
          windowType: FloatingWindowType.appUser.name,
          icon: FloatingWindowType.appUser.icon,
          minSize: const Size(650, 550),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the app user
  final int? appUserId;

  /// The id of the table session
  final String? tableSessionId;
}
