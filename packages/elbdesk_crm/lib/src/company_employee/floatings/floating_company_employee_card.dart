import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/company_employee/widgets/company_employee_card/company_employee_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingCompanyEmployeeCard extends HookConsumerWidget {
  /// Constructor for the FloatingCompanyEmployeeCard
  const FloatingCompanyEmployeeCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingCompanyEmployeeWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return CompanyEmployeeCard(
      floatingWindowId: data.floatingWindowId,
      companyEmployeeId: data.entityId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
