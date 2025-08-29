import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingSalesOrderItemTableWindowData extends FloatingWindowData {
  /// ContactStackWindowData constructor
  FloatingSalesOrderItemTableWindowData()
      : super(
          windowType: FloatingWindowType.salesOrderItemTable.name,
          icon: FloatingWindowType.salesOrderItemTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );
}
