import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingCustomerTableWindowData extends FloatingWindowData {
  FloatingCustomerTableWindowData()
      : super(
          windowType: FloatingWindowType.customerTable.name,
          icon: FloatingWindowType.customerTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );
}
