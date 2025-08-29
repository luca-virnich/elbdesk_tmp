part of 'company_employee_card.dart';

class _CompanyEmployeeDataView extends HookConsumerWidget {
  const _CompanyEmployeeDataView({
    required this.companyId,
    required this.companyEmployeeId,
    required this.sessionId,
    required this.readOnly,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });
  final int companyId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int companyEmployeeId;
  final String sessionId;
  final bool readOnly;
  final String floatingWindowId;
  final FocusNode? floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactId = ref.watch(
      companyEmployeeStateProvider(companyEmployeeId, sessionId)
          .select((value) => value.requireValue.employee.meta.id),
    );
    final l10n = context.l10n;

    final stateNotifier = ref.watch(
      companyEmployeeStateProvider(companyEmployeeId, sessionId).notifier,
    );

    final initialState = useMemoized(
      () => ref.read(
        companyEmployeeStateProvider(companyEmployeeId, sessionId).select(
          (value) => value.requireValue,
        ),
      ),
      [companyEmployeeId, sessionId],
    );

    final departmentsAsync = ref.watch(
      watchDepartmentsByEmployeeProvider(
        employeeId: companyEmployeeId,
      ),
    );
    final departmentsController = useTextEditingController();
    final crmL10n = context.crmL10n;

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          children: [
            CardSectionTitle(
              title: crmL10n.employee,
              trailingWidgets: [
                AppOpenInNewTextButton(
                  label: initialState.company.general.name,
                  tooltipMessage: l10n.gen_open_new_table(
                    crmL10n.contacts_companies,
                  ),
                  onPressed: () {
                    ref.openWindow(
                      FloatingContactCompanyWindowData(
                        contactId: initialState.company.meta.id,
                      ),
                    );
                  },
                ),
              ],
            ),
            ElbTwoColumnWrap(
              customL10n: crmL10n,
              readOnly: readOnly,
              validationGroupId: null,
              columnLeft: [
                ElbTwoColumnWrapTextItem(
                  field: CompanyEmployeeFields.fromEnum(
                    CompanyEmployeeField.position,
                  ),
                  initialText: initialState.position,
                  onChanged: stateNotifier.updatePosition,
                ),
                ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                  label: crmL10n.company_employee_department,
                  childBuilder: (labelPosition) =>
                      _DepartmentsCardFieldWithActions(
                    readOnly: readOnly,
                    departmentsAsync: departmentsAsync,
                    departmentsController: departmentsController,
                    companyId: companyId,
                    navigatorKey: navigatorKey,
                    companyEmployeeId: companyEmployeeId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    stateNotifier: stateNotifier,
                    labelPosition: labelPosition,
                  ),
                ),
              ],
              columnRight: [
                ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
                  label: crmL10n.company_employee_active,
                  childBuilder: (labelPosition) => Consumer(
                    builder: (context, ref, child) {
                      final isActive = ref.watch(
                        companyEmployeeStateProvider(
                          companyEmployeeId,
                          sessionId,
                        ).select((value) => value.requireValue.active),
                      );
                      return AppCardCheckbox(
                        readOnly: readOnly,
                        value: isActive,
                        label: crmL10n.company_employee_active,
                        onChanged: stateNotifier.updateIsActive,
                      );
                    },
                  ),
                ),
              ],
              width: constraints.maxWidth,
            ),
            const SizedBox(height: UiConstants.defaultPadding * 2),
            ContactReadOnlyView(
              contactId: contactId!,
              autoUpdate: false,
            ),
          ],
        );
      },
    );
  }
}

class _DepartmentsCardFieldWithActions extends ConsumerWidget {
  const _DepartmentsCardFieldWithActions({
    required this.readOnly,
    required this.departmentsAsync,
    required this.departmentsController,
    required this.companyId,
    required this.navigatorKey,
    required this.companyEmployeeId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.stateNotifier,
    required this.labelPosition,
  });

  final bool readOnly;
  final AsyncValue<List<CompanyDepartment>> departmentsAsync;
  final TextEditingController departmentsController;
  final int companyId;
  final GlobalKey<NavigatorState> navigatorKey;
  final int companyEmployeeId;
  final String sessionId;
  final String floatingWindowId;
  final FocusNode? floatingWindowFocus;
  final CompanyEmployeeState stateNotifier;
  final NextCardFormFieldLabelPosition labelPosition;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return Container(
      child: departmentsAsync.fastWhen(
        data: (departments) {
          departmentsController.text =
              departments.map((t) => t.name).join(', ');
          return NextCardFormField.text(
            validationGroup: null,
            readOnly: true,
            controller: departmentsController,
            labelPosition: labelPosition,
            validator: (v) => CompanyEmployeeFields.fromEnum(
              CompanyEmployeeField.department,
            ).validator(l10n, crmL10n)?.call(v),
            onChanged: null,
            label: crmL10n.company_employee_department,
            excludeFocusTraversal: true,
            outsideTrailingWidgets: [
              AppOpenInNewIconButton(
                tooltip: l10n.gen_open_entity(
                  crmL10n.contact_type_company,
                ),
                onPressed: () {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: companyId,
                    ),
                  );
                },
              ),
              AppIconButton.secondary(
                tooltip: l10n.gen_add_entity(
                  crmL10n.company_department_singular,
                ),
                iconData: AppIcons.add,
                color: context.appTheme.generalColors.onBackground,
                onPressed: () async {
                  await showElbDialog<void>(
                    context: context,
                    child: _SelectDepartmentForEmployee(
                      companyId: companyId,
                      companyEmployeeId: companyEmployeeId,
                      sessionId: sessionId,
                      navigatorKey: navigatorKey,
                      floatingWindowId: floatingWindowId,
                      floatingWindowFocus: floatingWindowFocus!,
                      stateNotifier: stateNotifier,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Dialog widget for selecting a department for an employee
class _SelectDepartmentForEmployee extends ConsumerWidget {
  const _SelectDepartmentForEmployee({
    required this.companyId,
    required this.companyEmployeeId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.stateNotifier,
  });

  final int companyId;
  final int companyEmployeeId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final CompanyEmployeeState stateNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: crmL10n.company_employee_select_department,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: double.infinity,
        ),
        child: CompanyDepartmentTable.selectDepartment(
          componentIdentifier:
              ComponentIdentifier.companyDepartmentTableEmployeeCard,
          dataProvider: (sessionId) => watchDepartmentsByCompanyProvider(
            sessionId,
            companyId: companyId,
          ),
          onRowTap: (department) async {
            final (:success, :exception, :data) =
                await AsyncHandler.handleAsyncOperation(
              context,
              () {
                final result = ref
                    .read(companyEmployeeRepositoryProvider)
                    .addEmployeeToDepartment(
                      companyEmployeeId: companyEmployeeId,
                      departmentId: department.meta.id!,
                    );

                stateNotifier.addDepartment(department);

                return result;
              },
              errorNavigatorKey: navigatorKey,
              successMessage: l10n.gen_saving_success,
              successNavigatorKey: navigatorKey,
            );

            if (success) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
    );
  }
}
