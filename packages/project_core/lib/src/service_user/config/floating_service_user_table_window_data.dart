import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
@immutable
class FloatingServiceUserTableWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingServiceUserTableWindowData()
      : super(
          windowType: FloatingWindowType.adminServiceUsersTable.name,
          icon: FloatingWindowType.adminServiceUsersTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );
}
