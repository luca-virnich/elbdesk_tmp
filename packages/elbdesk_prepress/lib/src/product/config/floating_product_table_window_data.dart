import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
@immutable
class FloatingProductTableWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingProductTableWindowData({
    this.customerId,
  }) : super(
          windowType: FloatingWindowType.productTable.name,
          icon: FloatingWindowType.productTable.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );

  final int? customerId;
}
