import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/logic/customer_state.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_color_palettes_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_customers_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_data_import_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_departmens_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_employees_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_main_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_payment_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_sales_orders_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/pages/customer_card_shipping_address_page.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/ribbons/customer_artwork_templates_ribbon.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/ribbons/customer_craete_sales_order_ribbon.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/ribbons/customer_drucklayouts_ribbon.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_card/ribbons/customer_sales_order_field_hints_ribbon.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Customer Card
///
/// This widget is used to display the main customer informations.
///
/// Usually displayed in a floating window
class CustomerCard extends HookConsumerWidget {
  /// Constructor

  const CustomerCard({
    required this.floatingWindowId,
    required this.customerId,
    required this.floatingWindowType,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int customerId;

  final int? initialNoteId;
  final int? initialNoteParentId;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalValidationGroupId = useUuid();

    final formKey = useFormKey();
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    Future<Customer> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final customer =
          ref.read(customerStateProvider(entityId, sessionId)).requireValue;
      final updatedCustomer = await ref.read(customerRepositoryProvider).update(
            entity: customer,
            release: false,
            sessionId: sessionId,
          );
      ref
          .read(customerStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      return updatedCustomer;
    }

    final crmL10n = context.crmL10n;

    return EntityCard<Customer>(
      floatingWindowType: FloatingWindowType.customer.name,
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
        CustomerArtworkTemplatesRibbon(
          customerId: entityId,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
        ),
        CustomerDrucklayoutsRibbon(
          customerId: customerId,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
        ),
        CustomerCraeteSalesOrderRibbon(
          customerId: entityId,
          floatingWindowId: floatingWindowId,
        ),
        CustomerSalesOrderFieldHintsRibbon(
          customerId: entityId,
          sessionId: sessionId,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
        ),
      ],
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(customerStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          customerStateProvider(entityId, sessionId),
        );
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchCustomerProvider(
        sessionId: sessionId,
        customerId: dataId,
      ),
      tableType: TableType.customer.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(customerStateProvider(dataId, editingSessionId).notifier)
            .saveAndUnlockAndRefetch();
      },
      entityId: customerId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(customerStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: customerStateProvider.call,
      createEntity: (sessionId) => Future.value(customerId),
      getTitle: (entity) =>
          '${entity.customId} - ${entity.contact!.general.name}',
      tableIcon: (_, __) => AppIcons.customer,
      tablePrefix: (_, __) => crmL10n.customer_singular,
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
                          savedOrInitialEntity.value?.contact?.general.name ??
                              '',
                    ),
                  );
            });
            return null;
          },
          [],
        );
        final stateNotifier =
            ref.watch(customerStateProvider(entityId, sessionId).notifier);
        final salesL10n = context.salesL10n;
        return FloatingCardBody(
          isFirstRun: isFirstRender.value,
          navigatorKey: navigatorKey,
          floatingWindowType: FloatingWindowType.customer.name,
          noteEntityId: entityId,
          initialNoteId: initialNoteId,
          showShareButton: true,
          initialNoteParentId: initialNoteParentId,
          noteTableType: TableType.customer.name,
          floatingWindowId: floatingWindowId,
          formKey: formKey,
          footer: EntityCardFooter<Customer>(
            stateProvider: customerStateProvider.call(entityId, sessionId),
            floatingWindowId: floatingWindowId,
            onSaveError: null,
            savedOrInitialEntity: savedOrInitialEntity,
            isSavingNotifier: isSaving,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            hideDeleteButton: true,
            onDeletePressed: () async {
              Future<void> deleteOperation() async {
                await ref.read(customerRepositoryProvider).delete(
                      entityId,
                      sessionId,
                    );
              }

              final (:success, :exception, :data) =
                  await AsyncHandler.handleAsyncOperation(
                context,
                deleteOperation,
                successMessage: l10n.gen_saving_success,
                successNavigatorKey: navigatorKey,
                errorNavigatorKey: navigatorKey,
              );
              if (success) {
                ref.removeWindow(floatingWindowId);
              }
            },
            formKey: formKey,
            meta: meta,
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.home,
                  label: crmL10n.general,
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
                CardNavigationItem(
                  icon: AppIcons.salesOrder,
                  label: salesL10n.sales_order_plural,
                ),
                CardNavigationItem(
                  icon: AppIcons.data_import,
                  label: l10n.data_import,
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.shipping,
                  label: crmL10n.customer_shipping,
                ),
                CardNavigationItem(
                  icon: AppIcons.payments,
                  label: crmL10n.customer_payments,
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.companyDepartment,
                  label: crmL10n.company_department_singular,
                ),
                CardNavigationItem(
                  icon: AppIcons.employee,
                  label: crmL10n.employee,
                ),
                CardNavigationItem(
                  icon: AppIcons.customerCustomer,
                  label: crmL10n.customer_customer_clients,
                ),
              ],
            ),
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.color_lens_outlined,
                  label: ppL10n.color_books,
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
              child: CustomerMainPage(
                floatingWindowId: floatingWindowId,
                savedOrInitialEntity: savedOrInitialEntity,
                customerCustomId: initialEntity.customId,
                customerId: entityId,
                sessionId: sessionId,
                readOnly: readOnly,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
              ),
            ),
            CardBodyItem(
              child: CustomerCardSalesOrdersPage(
                validationGroupId: generalValidationGroupId,
                customerId: entityId,
                sessionId: sessionId,
                readOnly: readOnly,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: CustomerDataImportPage(
                customerId: entityId,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
              ),
            ),
            CardBodyItem(
              child: CustomerCardShippingAddressPage(
                customerId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                readOnly: readOnly,
                customerContact: initialEntity.contact!,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
              ),
            ),
            CardBodyItem(
              child: CustomerCardPaymentPage(
                readOnly: readOnly,
                initialEntity: initialEntity,
                stateNotifier: stateNotifier,
                customerId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                customerContactId: initialEntity.contact!.meta.id!,
              ),
            ),
            CardBodyItem(
              child: CustomerCardDepartmentsPage(
                customerId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
              ),
            ),
            CardBodyItem(
              child: CustomerCardEmployeesPage(
                customerId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
              ),
            ),
            CardBodyItem(
              child: CustomerCardCustomersPage(
                customerId: entityId,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowId: floatingWindowId,
                readonly: readOnly,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: CustomerColorPalettesPage(
                floatingWindowId: floatingWindowId,
                customerId: entityId,
                navigatorKey: navigatorKey,
              ),
            ),
            CardBodyItem(
              keepAlive: false,
              child: EntityLogTable(
                fieldTitle: (log) => CustomerFields.fromFieldKey(
                  log.field,
                ).readable(l10n, crmL10n),
                entityId: entityId,
                tableType: TableType.customer,
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}
