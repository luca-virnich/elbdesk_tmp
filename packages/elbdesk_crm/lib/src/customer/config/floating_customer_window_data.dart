import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
@immutable
class FloatingCustomerWindowData extends FloatingWindowData {
  /// @nodoc
  FloatingCustomerWindowData({
    required this.customerId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.customer.name,
          icon: FloatingWindowType.customer.icon,
          minSize: const Size(300, 600),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the customer
  final int? customerId;

  final int? initialNoteId;

  final int? initialNoteParentId;
}
