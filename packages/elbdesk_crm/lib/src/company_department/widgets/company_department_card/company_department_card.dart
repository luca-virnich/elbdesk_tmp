import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_department/config/company_department_fields.dart';
import 'package:elbdesk_crm/src/company_employee/widgets/company_employee_table/company_employee_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'pages/company_department_card_main_page.dart';

/// CompanyDepartment Card
///
/// This is the card that displays the CompanyDepartment entity
///
/// Usually displayed in the corresponding FloatingWindow
class CompanyDepartmentCard extends HookConsumerWidget {
  /// CompanyDepartmentCard constructor
  const CompanyDepartmentCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.companyId,
    required this.floatingWindowFocus,
    required this.floatingWindowType,
    this.navigatorKey,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final int companyId;

  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;
  final String floatingWindowType;

  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();

    final crmL10n = context.crmL10n;

    /// On save pressed
    ///
    /// This method is triggered through the Footer of the card or the
    /// save intent (cmd + s)
    Future<CompanyDepartment> onSavePressed(
      int entityId,
      String sessionId,
      GlobalKey<NavigatorState>? navigatorKey,
    ) async {
      // Fetch current state
      final data = ref
          .read(companyDepartmentStateProvider(entityId, sessionId))
          .requireValue;

      // Update database
      final updatedCompanyDepartment =
          await ref.read(companyDepartmentRepositoryProvider).update(
                entity: data,
                release: false,
                sessionId: sessionId,
              );

      final isDraft = data.meta.isDraft;

      // Set Recent window
      isDraft
          ? ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                RecentWindow(
                  type: floatingWindowType,
                  entityId: entityId,
                  label: data.name,
                  additionalData: CompanyDepartmentAdditionalData(
                    name: data.name,
                    description: data.description,
                    companyId: data.companyId,
                  ).toJson(),
                ),
              )
          : ref.read(recentWindowsProvider.notifier).updateEntityWindow(
                RecentWindow(
                  type: floatingWindowType,
                  entityId: entityId,
                  label: data.name,
                  additionalData: CompanyDepartmentAdditionalData(
                    name: data.name,
                    description: data.description,
                    companyId: data.companyId,
                  ).toJson(),
                ),
              );

      // Update the meta data after save
      // (Necessary for proper state management)
      ref
          .read(companyDepartmentStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();

      return updatedCompanyDepartment;
    }

    /// Before we adding ppl to the Department, we have to ensure that the
    /// departments was saved once and isn't in a draft state. if its still a draft,
    /// we have to validate the form and save it first.
    Future<void> onOpenContactSelection(
      int entityId,
      String sessionId,
      GlobalKey<NavigatorState>? navigatorKey,
      GlobalKey<FormState> formKey,
      ObjectRef<CompanyDepartment?> savedOrInitialEntity,
    ) async {
      final currentState = ref
          .read(companyDepartmentStateProvider(entityId, sessionId))
          .requireValue;
      final isDraft = currentState.meta.isDraft;

      if (!isDraft) {
        return;
      }

      final isValid = formKey.currentState?.validate() ?? false;
      if (!isValid) {
        // TODO: cusotmize error msg

        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: 'Bitte legen Sie zuerst ein Namen an'.hc,
          code: 'FORM_NOT_VALID',
        );
      }
      await onSavePressed(entityId, sessionId, navigatorKey);
      final newState = ref
          .read(companyDepartmentStateProvider(entityId, sessionId))
          .requireValue;
      savedOrInitialEntity.value = newState;
    }

    return EntityCard<CompanyDepartment>(
      floatingWindowType: FloatingWindowType.companyDepartment.name,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: onSavePressed,
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          companyDepartmentStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(companyDepartmentStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchCompanyDepartmentProvider(
        sessionId: sessionId,
        entityId: dataId,
      ),
      tableType: TableType.companyDepartment.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              companyDepartmentStateProvider(dataId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: entityId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(companyDepartmentStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: companyDepartmentStateProvider.call,
      createEntity: (sessionId) => throw UnimplementedError(),
      getTitle: (entity) =>
          '${crmL10n.company_department_singular}: ${entity.name}',
      tableIcon: (entityId, sessionId) => AppIcons.companyDepartment,
      tablePrefix: (entityId, sessionId) => '',
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
        final stateNotifier = ref.watch(
          companyDepartmentStateProvider(entityId, sessionId).notifier,
        );

        useEffect(
          () {
            if (meta.isDraft) return;
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: initialEntity.name,
                      additionalData: CompanyDepartmentAdditionalData(
                        name: initialEntity.name,
                        description: initialEntity.description,
                        companyId: companyId,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          noteEntityId: entityId,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          isFirstRun: isFirstRender.value,
          noteTableType: TableType.companyDepartment.name,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          showShareButton: true,
          formKey: formKey,
          floatingWindowType: FloatingWindowType.companyDepartment.name,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<CompanyDepartment>(
            stateProvider:
                companyDepartmentStateProvider.call(entityId, sessionId),
            floatingWindowId: floatingWindowId,
            onSaveError: null,
            savedOrInitialEntity: savedOrInitialEntity,
            isSavingNotifier: isSaving,
            onSavePressed: () => onSavePressed(entityId, sessionId, null),
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
            formKey: formKey,
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.home,
                  label: crmL10n.general,
                  showErrorBadge: false,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: _CompanyDepartmentCardMainPage(
                entityId: entityId,
                companyId: companyId,
                savedOrInitialEntity: savedOrInitialEntity,
                floatingWindowFocus: floatingWindowFocus,
                onOpenContactSelection: onOpenContactSelection,
                formKey: formKey,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly,
                sessionId: sessionId,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
