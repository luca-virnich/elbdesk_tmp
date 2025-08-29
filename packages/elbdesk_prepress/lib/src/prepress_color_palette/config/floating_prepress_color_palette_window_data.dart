import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingPrepressColorPaletteWindowData extends FloatingWindowData {
  FloatingPrepressColorPaletteWindowData({
    required this.colorPaletteId,
    required this.customerId,
    this.tableSessionId,
  }) : super(
          windowType: FloatingWindowType.colorPalette.name,
          icon: FloatingWindowType.colorPalette.icon,
          minSize: const Size(650, 400),
          defaultSize: const Size(650, 400),
        );

  final int? colorPaletteId;
  final int? customerId;
  final String? tableSessionId;
}
