import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingServiceUserWindowData extends FloatingWindowData {
  /// ContactStackWindowData constructor
  FloatingServiceUserWindowData({
    required this.serviceUserId,
  }) : super(
          windowType: FloatingWindowType.serviceUser.name,
          icon: FloatingWindowType.serviceUser.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );

  /// The id of the service user
  final int? serviceUserId;
}
