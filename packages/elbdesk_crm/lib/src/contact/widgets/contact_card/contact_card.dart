import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/company_employee/widgets/companies_by_employee_view.dart';
import 'package:elbdesk_crm/src/company_employee/widgets/employees_by_company_view.dart';
import 'package:elbdesk_crm/src/contact/logic/contact_state.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/contact_company_department/contact_company_card_departmens_page.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/contact_master_data/contact_master_data.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/ribbons/company_contact_debtor_ribbon.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/ribbons/company_employee_ribbton.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'contact_company_employee/contact_company_employee_view.dart';

class ContactCard extends HookConsumerWidget {
  const ContactCard({
    required this.floatingWindowId,
    required this.contactId,
    required this.floatingWindowType,
    required this.initialContactType,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int? contactId;

  final ContactType initialContactType;

  final int? initialNoteId;
  final int? initialNoteParentId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalValidationGroupId = useUuid();

    final formKey = useFormKey();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    Future<Contact> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final contact =
          ref.read(contactStateProvider(entityId, sessionId)).requireValue;

      final isCompany = contact.isCompany;
      // if not company, check if we
      // check if contact has customer
      final serverContact =
          await ref.read(contactRepositoryProvider).fetchById(contact.meta.id!);

      final hasDebtor = serverContact.customer != null;

      if (hasDebtor && !isCompany) {
        throw ElbException(
          exceptionType: ElbExceptionType.conflict,
          message: crmL10n.contact_already_customer,
        );
      }

      final updatedContact = await ref.read(contactRepositoryProvider).update(
            entity: contact,
            release: false,
            sessionId: sessionId,
          );

      if (serverContact.meta.isDraft) {
        ref.read(recentWindowsProvider.notifier).insertEntityWindow(
              RecentWindow(
                type: floatingWindowType,
                entityId: entityId,
                label: contact.general.name,
                additionalData: ContactAdditionalData(
                  contactType: contact.general.type!,
                ).toJson(),
              ),
            );
      } else {
        ref.read(recentWindowsProvider.notifier).updateEntityWindow(
              RecentWindow(
                type: floatingWindowType,
                entityId: entityId,
                label: contact.general.name,
                additionalData: ContactAdditionalData(
                  contactType: contact.general.type!,
                ).toJson(),
              ),
            );
      }

      if (contact.isCompany) {
        ref.invalidate(findCompanyContactsProvider);
      } else {
        ref.invalidate(findPersonContactsProvider);
      }

      ref.invalidate(findContactsProvider);

      if (context.mounted) {
        ref
            .read(contactStateProvider(entityId, sessionId).notifier)
            .updateMetaAfterSave();
      }
      return updatedContact;
    }

    return EntityCard<Contact>(
      floatingWindowType: FloatingWindowType.contactPerson.name,
      initialViewOnly: ElbDeskPlatformInfo.isMobileDevice && contactId != null,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      ribbonsBuilder: (
        entityId,
        sessionId,
        navigatorKey,
        savedOrInitialEntity,
      ) =>
          [
        CompanyContactDeborRibbon(
          contactId: entityId,
          sessionId: sessionId,
          floatingWindowId: floatingWindowId,
        ),
        CompanyEmployeeRibbon(
          contactId: entityId,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
        ),
      ],
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          contactStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(contactStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchContactEntityCardProvider(
        sessionId: sessionId,
        contactId: dataId,
      ),
      tableType: TableType.contact.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(contactStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: contactId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(contactStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: contactStateProvider.call,
      createEntity: (sessionId) => ref
          .read(contactRepositoryProvider)
          .create(sessionId: sessionId, type: initialContactType),
      getTitle: (entity) => entity.general.name,
      tableIcon: (entityId, sessionId) => ref.watch(
        contactStateProvider(entityId, sessionId).select(
          (value) {
            return value.requireValue.isCompany
                ? AppIcons.company
                : AppIcons.person;
          },
        ),
      ),
      tablePrefix: (entityId, sessionId) => ref.watch(
        contactStateProvider(entityId, sessionId).select(
          (value) {
            return value.value?.isCompany == null
                ? ''
                : value.value?.isCompany ?? false
                    ? crmL10n.contact_type_company
                    : crmL10n.contact_type_person;
          },
        ),
      ),
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
        final isCompany = ref.watch(
          contactStateProvider(entityId, sessionId)
              .select((value) => value.requireValue.isCompany),
        );

        final stateNotifier = ref.watch(
          contactStateProvider(entityId, sessionId).notifier,
        );

        useEffect(
          () {
            if (contactId == null || !isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: initialEntity.general.name,
                      additionalData: ContactAdditionalData(
                        contactType: initialEntity.general.type!,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );

        return FloatingCardBody(
          floatingWindowType: floatingWindowType,
          showShareButton: !meta.isDraft,
          isFirstRun: isFirstRender.value,
          showNotes: !meta.isDraft,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          navigatorKey: navigatorKey,
          additionalEntityData: ContactAdditionalData(
            contactType: initialEntity.general.type!,
          ),
          noteEntityId: entityId,
          noteTableType: TableType.contact.name,
          floatingWindowId: floatingWindowId,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: EntityCardFooter<Contact>(
            savedOrInitialEntity: savedOrInitialEntity,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            onSaveError: null,
            isSavingNotifier: isSaving,
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            meta: meta,
            stateProvider: contactStateProvider.call(entityId, sessionId),
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
                CardNavigationItem(
                  icon: isCompany ? AppIcons.employee : AppIcons.company,
                  label: isCompany
                      ? crmL10n.employee
                      : crmL10n.contact_type_company,
                ),
                if (isCompany)
                  CardNavigationItem(
                    icon: AppIcons.companyDepartment,
                    label: crmL10n.company_department_plural,
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
              child: ContactMasterData(
                stateNotifier: stateNotifier,
                validationGroupId: generalValidationGroupId,
                contactId: entityId,
                sessionId: sessionId,
                readOnly: readOnly,
                initialEntity: initialEntity,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: _ContactCompanyEmployeeView(
                contactId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                isCompany: isCompany,
                floatingWindowId: floatingWindowId,
              ),
            ),
            if (isCompany)
              CardBodyItem(
                keepAlive: false,
                child: ContactCompanyCardDepartmentsPage(
                  companyId: entityId,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                ),
              ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => ContactFields.fromFieldKey(
                  log.field,
                ).readable(l10n, crmL10n),
                entityId: entityId,
                tableType: TableType.contact,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
