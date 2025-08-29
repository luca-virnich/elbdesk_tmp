import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:project_core/project_core.dart';

class FloatingAppClientWindowData extends FloatingWindowData {
  FloatingAppClientWindowData({
    required this.entityId,
  }) : super(
          windowType: FloatingWindowType.appClient.name,
          icon: FloatingWindowType.appClient.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );

  final int? entityId;
}
