import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingSalesOrderTableWindowData extends FloatingWindowData {
  /// ContactStackWindowData constructor
  FloatingSalesOrderTableWindowData()
      : super(
          windowType: FloatingWindowType.salesOrderTable.name,
          icon: FloatingWindowType.salesOrderTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );
}
