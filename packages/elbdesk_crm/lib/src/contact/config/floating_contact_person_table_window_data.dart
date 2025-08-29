import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:project_core/project_core.dart';

class FloatingContactPersonTableWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingContactPersonTableWindowData()
      : super(
          windowType: FloatingWindowType.contactPersonTable.name,
          icon: FloatingWindowType.contactPersonTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );
}
