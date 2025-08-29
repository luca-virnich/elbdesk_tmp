import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
@immutable
class FloatingContactCompanyTableWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingContactCompanyTableWindowData()
      : super(
          windowType: FloatingWindowType.contactCompanyTable.name,
          icon: FloatingWindowType.contactCompanyTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );
}
