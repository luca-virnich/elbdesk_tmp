import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingProductWindowData extends FloatingWindowData {
  FloatingProductWindowData({
    required this.productId,
    required this.salesOrderId,
    this.tableSessionId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.product.name,
          icon: FloatingWindowType.product.icon,
          minSize: const Size(1100, 600),
          defaultSize: const Size(1250, 800),
        );

  final int? productId;

  final int? salesOrderId;

  final String? tableSessionId;

  final int? initialNoteId;
  final int? initialNoteParentId;
}
