import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

@immutable
class FloatingCompanyEmployeeWindowData extends FloatingWindowData {
  FloatingCompanyEmployeeWindowData({
    required this.entityId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.companyEmployee.name,
          icon: FloatingWindowType.companyEmployee.icon,
          minSize: const Size(1000, 500),
          defaultSize: const Size(1250, 800),
        );

  final int entityId;

  final int? initialNoteId;
  final int? initialNoteParentId;
}
