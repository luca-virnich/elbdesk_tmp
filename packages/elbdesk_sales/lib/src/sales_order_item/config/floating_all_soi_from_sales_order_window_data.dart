import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingAllSoiFromSalesOrderWindowData extends FloatingWindowData {
  /// ContactStackWindowData constructor
  FloatingAllSoiFromSalesOrderWindowData({
    required this.salesOrderId,
    required this.customerId,
    required this.fullSalesOrderId,
  }) : super(
          windowType: FloatingWindowType.allSoiFromSalesOrder.name,
          icon: FloatingWindowType.allSoiFromSalesOrder.icon,
          minSize: const Size(450, 450),
          defaultSize: const Size(550, 600),
        );

  final int salesOrderId;
  final int customerId;
  final String fullSalesOrderId;
}
