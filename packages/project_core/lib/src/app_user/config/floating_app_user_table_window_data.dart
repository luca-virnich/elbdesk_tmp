import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:project_core/project_core.dart';

class FloatingAppUserTableWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingAppUserTableWindowData()
      : super(
          windowType: FloatingWindowType.adminUsersTable.name,
          icon: FloatingWindowType.adminUsersTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );
}
