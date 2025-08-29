import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Custom CoeColor Window Data
@immutable
class FloatingPrepressColorWindowData extends FloatingWindowData {
  FloatingPrepressColorWindowData({
    required this.colorId,
    required this.colorPaletteId,
    this.tableSessionId,
  }) : super(
          windowType: FloatingWindowType.color.name,
          icon: FloatingWindowType.color.icon,
          minSize: UiConstants.defaultTableCardMinSize,
          defaultSize: UiConstants.defaultTableCardPreferredSize,
        );

  final int? colorId;

  final String? tableSessionId;
  final int colorPaletteId;
}
