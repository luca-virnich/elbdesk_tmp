import 'package:elbdesk_crm/src/company_department/widgets/departments_by_company_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class ContactCompanyCardDepartmentsPage extends ConsumerWidget {
  const ContactCompanyCardDepartmentsPage({
    required this.companyId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int companyId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DepartmentsByCompanyView(
      contactId: companyId,
      sessionId: sessionId,
      navigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      componentIdentifier:
          ComponentIdentifier.companyDepartmentTableDepartmentsPage,
    );
  }
}
