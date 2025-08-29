import 'package:elbdesk_crm/src/company_employee/widgets/employees_by_company_view.dart';
import 'package:elbdesk_crm/src/customer/logic/customer_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class CustomerCardEmployeesPage extends ConsumerWidget {
  const CustomerCardEmployeesPage({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerContactId = ref.watch(
      customerStateProvider(customerId, sessionId).select(
        (value) => value.requireValue.contact!.meta.id,
      ),
    );

    return EmployeesByCompanyView(
      contactId: customerContactId!,
      sessionId: sessionId,
      navigatorKey: navigatorKey,
      floatingWindowId: floatingWindowId,
      componentIdentifier:
          ComponentIdentifier.companyEmployeeTableCustomerEmployeesPage,
    );
  }
}
