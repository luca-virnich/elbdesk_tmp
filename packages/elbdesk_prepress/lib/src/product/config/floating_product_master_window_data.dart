import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingProductMasterWindowData extends FloatingWindowData {
  FloatingProductMasterWindowData({
    required this.productMasterId,
  }) : super(
          windowType: FloatingWindowType.productMaster.name,
          icon: FloatingWindowType.productMaster.icon,
          minSize: const Size(1100, 600),
          defaultSize: const Size(1250, 800),
        );

  final int productMasterId;
}
