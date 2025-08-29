import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_employee/config/company_employee_fields.dart';
import 'package:elbdesk_crm/src/company_employee/logic/company_employee_state.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_read_only_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

part 'company_employee_data_view.dart';

/// @nodoc
class CompanyEmployeeCard extends HookConsumerWidget {
  /// The Card for the Company Employee
  const CompanyEmployeeCard({
    required this.floatingWindowId,
    required this.companyEmployeeId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int companyEmployeeId;
  final FocusNode? floatingWindowFocus;
  final int? initialNoteId;
  final int? initialNoteParentId;
  final String floatingWindowType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalValidationGroupId = useUuid();

    final formKey = useFormKey();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    Future<CompanyEmployee> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final companyEmployee = ref
          .read(companyEmployeeStateProvider(entityId, sessionId))
          .requireValue;

      final updatedCompanyEmployee =
          await ref.read(companyEmployeeRepositoryProvider).update(
                entity: companyEmployee,
                sessionId: sessionId,
                release: false,
              );
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: companyEmployee.employee.general.name,
              additionalData: CompanyEmployeeAdditionalData(
                companyName: companyEmployee.company.general.name,
                employeeName: companyEmployee.employee.general.name,
              ).toJson(),
            ),
          );
      ref
          .read(companyEmployeeStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();

      return updatedCompanyEmployee;
    }

    return EntityCard<CompanyEmployee>(
      floatingWindowType: FloatingWindowType.companyEmployee.name,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          companyEmployeeStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(companyEmployeeStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchCompanyEmployeeProvider(
        sessionId: sessionId,
        companyEmployeeId: dataId,
      ),
      tableType: TableType.companyEmployee.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              companyEmployeeStateProvider(dataId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: companyEmployeeId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(companyEmployeeStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: companyEmployeeStateProvider.call,
      createEntity: null,
      getTitle: (entity) => entity.employee.general.name,
      tableIcon: (entityId, sessionId) => AppIcons.employee,
      tablePrefix: (entityId, sessionId) => crmL10n.company_employee_singular,
      childBuilder: (
        context,
        entityId,
        sessionId,
        selectedNavIndexRef,
        navigatorKey,
        readOnly,
        meta,
        initialEntity,
        isSaving,
        savedOrInitialEntity,
        isFirstRender,
      ) {
        useEffect(
          () {
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label:
                          savedOrInitialEntity.value?.employee.general.name ??
                              '',
                      additionalData: CompanyEmployeeAdditionalData(
                        companyName: initialEntity.company.general.name,
                        employeeName: initialEntity.employee.general.name,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.companyEmployee.name,
          isFirstRun: isFirstRender.value,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          navigatorKey: navigatorKey,
          noteEntityId: entityId,
          noteTableType: TableType.companyEmployee.name,
          floatingWindowId: floatingWindowId,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<CompanyEmployee>(
            readOnly: readOnly,
            isSavingNotifier: isSaving,
            floatingWindowId: floatingWindowId,
            meta: meta,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            formKey: formKey,
            navigatorKey: navigatorKey,
            onSaveError: null,
            savedOrInitialEntity: savedOrInitialEntity,
            stateProvider: companyEmployeeStateProvider.call(
              entityId,
              sessionId,
            ),
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.contact,
                  label: crmL10n.contact_singular,
                  showErrorBadge: ref.watch(
                    validationGroupProvider(generalValidationGroupId).select(
                      (value) => value.isNotEmpty,
                    ),
                  ),
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItems.changelog(l10n),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: _CompanyEmployeeDataView(
                companyId: initialEntity.company.meta.id!,
                companyEmployeeId: companyEmployeeId,
                sessionId: sessionId,
                readOnly: readOnly,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) =>
                    CompanyEmployeeFields.fromFieldKey(log.field)
                        .readable(l10n, crmL10n),
                entityId: entityId,
                tableType: TableType.companyEmployee,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
