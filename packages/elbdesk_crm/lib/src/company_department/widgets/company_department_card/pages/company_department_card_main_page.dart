part of '../company_department_card.dart';

/// CompanyDepartment Card Main Page
///
/// This is the main page of the CompanyDepartment card
///
/// It is used to display the general information
///
class _CompanyDepartmentCardMainPage extends HookConsumerWidget {
  const _CompanyDepartmentCardMainPage({
    required this.stateNotifier,
    required this.initialEntity,
    required this.readOnly,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.companyId,
    required this.entityId,
    required this.sessionId,
    required this.onOpenContactSelection,
    required this.formKey,
    required this.savedOrInitialEntity,
  });
  final CompanyDepartmentState stateNotifier;
  final int entityId;
  final CompanyDepartment initialEntity;
  final bool readOnly;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final int companyId;
  final String sessionId;
  final Future<void> Function(
    int,
    String,
    GlobalKey<NavigatorState>?,
    GlobalKey<FormState>,
    ObjectRef<CompanyDepartment?> savedOrInitialEntity,
  ) onOpenContactSelection;
  final GlobalKey<FormState> formKey;
  final ObjectRef<CompanyDepartment?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CollapsibleCardSection(
              title: crmL10n.general,
              identifier:
                  ComponentIdentifier.companyDepartmentMainPageGeneral.name,
              trailingWidgets: [
                AppOpenInNewTextButton(
                  label: initialEntity.company?.general.name ?? '',
                  tooltipMessage: l10n.gen_open_new_table(
                    crmL10n.customer_singular,
                  ),
                  onPressed: () {
                    ref.openWindow(
                      FloatingContactCompanyWindowData(
                        contactId: initialEntity.companyId,
                      ),
                    );
                  },
                ),
              ],
              child: ElbTwoColumnWrap(
                readOnly: readOnly,
                validationGroupId: null,
                customL10n: crmL10n,
                columnLeft: [
                  ElbTwoColumnWrapTextItem(
                    field: CompanyDepartmentFields.fromEnum(
                      CompanyDepartmentField.name,
                    ),
                    initialText: initialEntity.name,
                    onChanged: stateNotifier.updateName,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapTextItem(
                    initialText: initialEntity.description,
                    onChanged: stateNotifier.updateDescription,
                    field: CompanyDepartmentFields.fromEnum(
                      CompanyDepartmentField.description,
                    ),
                  ),
                ],
                width: constraints.maxWidth,
              ),
            ),
            const SizedBox(height: AppSpace.l),
            _DepartmentEmployeesView(
              departmentId: entityId,
              companyId: companyId,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
              onOpenContactSelection: onOpenContactSelection,
              formKey: formKey,
              savedOrInitialEntity: savedOrInitialEntity,
            ),
          ],
        );
      },
    );
  }
}

/// Widget to display employees belonging to a specific department
class _DepartmentEmployeesView extends HookConsumerWidget {
  const _DepartmentEmployeesView({
    required this.departmentId,
    required this.companyId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.onOpenContactSelection,
    required this.formKey,
    required this.savedOrInitialEntity,
  });

  final int departmentId;
  final int companyId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final Future<void> Function(
    int,
    String,
    GlobalKey<NavigatorState>?,
    GlobalKey<FormState>,
    ObjectRef<CompanyDepartment?> savedOrInitialEntity,
  ) onOpenContactSelection;
  final GlobalKey<FormState> formKey;
  final ObjectRef<CompanyDepartment?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return CompanyEmployeeTable.departmentView(
      departmentId: departmentId,
      componentIdentifier:
          ComponentIdentifier.companyDepartmentMainPageEmployees,
      showFilter: false,
      dataProvider: (sessionId) => watchEmployeesByCompanyAndDepartmentProvider(
        sessionId,
        companyId: companyId,
        departmentId: departmentId,
      ),
      toolbarTrailingActions: [
        // opening table to select contact
        HookBuilder(
          builder: (context) {
            final isLoading = useState<bool>(false);

            return AddEntityInCardButton(
              tooltip: l10n.gen_add_entity(crmL10n.employee),
              onPressed: isLoading.value
                  ? null
                  : () async {
                      isLoading.value = true;

                      final (:exception, :success, :data) =
                          await AsyncHandler.handleAsyncOperation(
                        context,
                        () async {
                          await onOpenContactSelection(
                            departmentId,
                            sessionId,
                            navigatorKey,
                            formKey,
                            savedOrInitialEntity,
                          );
                        },
                        errorNavigatorKey: navigatorKey,
                        successNavigatorKey: navigatorKey,
                      );
                      if (!success) {
                        if (context.mounted) {
                          isLoading.value = false;
                        }
                        return;
                      }
                      if (!context.mounted) return;

                      // check if contact is meta
                      await showElbDialog<ContactDTO?>(
                        context: context,
                        child: _SelectEmployeeForDepartment(
                          departmentId: departmentId,
                          companyId: companyId,
                          sessionId: sessionId,
                          navigatorKey: navigatorKey,
                          floatingWindowId: floatingWindowId,
                          floatingWindowFocus: floatingWindowFocus,
                        ),
                      );
                      if (!context.mounted) return;

                      isLoading.value = false;
                    },
            );
          },
        ),
      ],
      showTable: true,
      secondContent: (sessionId) => null,
    );
  }
}

class _SelectEmployeeForDepartment extends HookConsumerWidget {
  const _SelectEmployeeForDepartment({
    required this.departmentId,
    required this.companyId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
  });
  final int departmentId;
  final int companyId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);

    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: crmL10n.company_employee_select_employee,
      isLoading: isLoading.value,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: double.infinity,
        ),
        child: CompanyEmployeeTable.employeesView(
          isCollapsible: false,
          toolbarTrailingActions: const [],
          secondContent: (sessionId) => null,
          showTable: true,
          showTableViews: false,
          showFilter: true,
          dataProvider: (sessionId) => streamEmployeesByCompanyProvider(
            sessionId,
            companyId: companyId,
          ),
          componentIdentifier:
              ComponentIdentifier.companyDepartmentMainPageEmployees,
          onRowTap: (employee) async {
            if (isLoading.value) return;

            isLoading.value = true;

            await AsyncHandler.handleAsyncOperation(
              context,
              () async {
                if (employee.departments
                        ?.any((t) => t.meta.id == departmentId) ??
                    false) {
                  throw ElbException(
                    exceptionType: ElbExceptionType.unknown,
                    message:
                        crmL10n.company_employee_already_assigned_to_department,
                  );
                }

                final fetchAndLockedEmployee =
                    await ref.read(companyEmployeeRepositoryProvider).fetchById(
                          employee.id!,
                        );

                if (fetchAndLockedEmployee == null) {
                  throw ElbException(
                    exceptionType: ElbExceptionType.unknown,
                    message: l10n.validation_entity_not_found(
                      crmL10n.employee,
                    ),
                  );
                }

                if (fetchAndLockedEmployee.departments
                        ?.any((t) => t.meta.id == departmentId) ??
                    false) {
                  throw ElbException(
                    exceptionType: ElbExceptionType.unknown,
                    message:
                        crmL10n.company_employee_already_assigned_to_department,
                  );
                }

                await ref
                    .read(companyEmployeeRepositoryProvider)
                    .addEmployeeToDepartment(
                      companyEmployeeId: fetchAndLockedEmployee.id!,
                      departmentId: departmentId,
                    );
              },
              errorNavigatorKey: navigatorKey,
              successMessage: l10n.gen_saving_success,
              successNavigatorKey: navigatorKey,
            );

            if (context.mounted) isLoading.value = false;
          },
        ),
      ),
    );
  }
}
