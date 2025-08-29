import 'dart:ui';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:project_core/project_core.dart';

class FloatingCompanyDepartmentWindowData extends FloatingWindowData {
  /// Creates floating window data for company_department
  FloatingCompanyDepartmentWindowData({
    required this.entityId,
    required this.companyId,
    this.initialNoteId,
    this.initialNoteParentId,
  }) : super(
          windowType: FloatingWindowType.companyDepartment.name,
          icon: FloatingWindowType.companyDepartment.icon,
          minSize: const Size(1100, 600),
          defaultSize: const Size(1250, 800),
        );

  /// The id of the company_department
  final int? entityId;

  /// The customer id
  final int companyId;

  /// Initial note id for navigation
  final int? initialNoteId;

  /// Initial note parent id for navigation
  final int? initialNoteParentId;
}
