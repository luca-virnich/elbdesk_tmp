import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/company_department/config/floating_company_department_window_data.dart';
import 'package:elbdesk_crm/src/company_department/widgets/company_department_card/company_department_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingCompanyDepartmentCard extends HookConsumerWidget {
  const FloatingCompanyDepartmentCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingCompanyDepartmentWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return CompanyDepartmentCard(
      entityId: data.entityId,
      companyId: data.companyId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
