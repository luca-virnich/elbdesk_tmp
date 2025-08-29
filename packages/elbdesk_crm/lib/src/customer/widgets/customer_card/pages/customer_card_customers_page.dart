import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/logic/customer_state.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_customers_table/customer_customers_table.dart';
import 'package:elbdesk_crm/src/ui/app_card_address_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CustomerCardCustomersPage extends HookConsumerWidget {
  const CustomerCardCustomersPage({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.readonly,
    super.key,
  });

  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final bool readonly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final showListView = useState<bool>(false);
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );
    return SelfScrollableCardItem(
      showRightPadding: true,
      child: CustomerCustomersTable(
        componentIdentifier:
            ComponentIdentifier.customerCardCustomersPageCustomerCustomers,
        isCollapsible: false,
        customerId: customerId,
        fixedTableTitle: crmL10n.customer_customer_clients,
        showFilter: true,
        toolbarTrailingActions: [
          ElbTableSwitchLayoutButton(
            showList: showListView.value,
            onPressed: () => showListView.value = !showListView.value,
          ),
          AddEntityInCardButton(
            tooltip: l10n.gen_add_entity(crmL10n.customer_customer_clients),
            onPressed: () async {
              await showElbDialog<void>(
                context: context,
                child: _SelectCustomer(
                  customerId: customerId,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                ),
              );
            },
          ),
        ],
        showTable: showListView.value,
        secondContent: (sessionId) => _CustomerCustomers(
          customerId: customerId,
          navigatorKey: navigatorKey,
          readonly: readonly,
          sessionId: sessionId,
        ),
      ),
    );
  }
}

class _CustomerCustomers extends ConsumerWidget {
  const _CustomerCustomers({
    required this.customerId,
    required this.navigatorKey,
    required this.readonly,
    required this.sessionId,
  });

  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool readonly;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final customerCustomers = ref.watch(
      watchCustomerCustomersProvider(
        sessionId,
        customerId: customerId,
      ),
    );

    return customerCustomers.fastWhen(
      data: (addresses) {
        if (addresses.isEmpty) {
          return Align(
            alignment: Alignment.topLeft,
            child: AppText(crmL10n.customer_no_customer_clients),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          itemCount: addresses.length,
          separatorBuilder: (_, __) => const AppListViewSeperator.space(),
          itemBuilder: (context, index) => _CustomerCustomerListTile(
            customerCustomer: addresses[index],
            navigatorKey: navigatorKey,
            readonly: readonly,
          ),
        );
      },
    );
  }
}

class _SelectCustomer extends HookConsumerWidget {
  const _SelectCustomer({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });

  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);
    final customerContactId = ref.watch(
      customerStateProvider(customerId, sessionId).select(
        (value) => value.requireValue.contact!.meta.id,
      ),
    );

    return ElbDialog(
      floatingWindowId: floatingWindowId,
      isLoading: isLoading.value,
      title: crmL10n.company_select,
      child: ContactTable.companies(
        showTableViews: false,
        componentIdentifier:
            ComponentIdentifier.selectContactTableCustomerCustomersSelection,
        hiddenFilterGroup: FilterGroup(
          nextOperator: FilterOperator.and,
          filters: [
            FilterField(
              filterOperator: FilterOperator.and,
              type: FilterType.notEqual,
              fieldKey: ContactField.id.name,
              value: customerContactId.toString(),
              fieldType: FilterFieldType.number,
              uuid: const Uuid().v4(),
            ),
          ],
        ),
        onSelect: isLoading.value
            ? null
            : (contact) async {
                isLoading.value = true;
                final (:exception, :success, :data) =
                    await AsyncHandler.handleAsyncOperation<void>(
                  context,
                  () => ref
                      .read(customerCustomerRepositoryProvider)
                      .addCustomerCustomer(
                        customerId: customerId,
                        customerCustomerContactId: contact.meta.id!,
                      ),
                  errorNavigatorKey: navigatorKey,
                  successMessage: l10n.gen_saving_success,
                  successNavigatorKey: navigatorKey,
                );
                if (context.mounted) {
                  isLoading.value = false;
                  if (success) {
                    Navigator.of(context).pop();
                  }
                }
              },
      ),
    );
  }
}

class _CustomerCustomerListTile extends ConsumerWidget {
  const _CustomerCustomerListTile({
    required this.customerCustomer,
    required this.navigatorKey,
    required this.readonly,
  });

  final CustomerCustomer customerCustomer;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool readonly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final asyncContact = ref.watch(
      fetchAndWatchContactProvider(
        customerCustomer.customerCustomerContact!.meta.id!,
      ),
    );

    return asyncContact.fastWhen(
      data: (contact) {
        return AppCardAddressAndCommunicationTile.addressAndCommunication(
          address: contact.address,
          communication: contact.communication,
          titleOutsideCard: null,
          readOnly: readonly,
          onEditTap: null,
          titleInsideCard: contact.general.name,
          onTitleInsideCardTap: () {
            final isPerson = contact.general.type == ContactType.person;
            if (isPerson) {
              ref.openWindow(
                FloatingContactPersonWindowData(
                  contactId: contact.meta.id,
                ),
              );
            } else {
              ref.openWindow(
                FloatingContactCompanyWindowData(
                  contactId: contact.meta.id,
                ),
              );
            }
          },
          onDelete: () async {
            final name = '"${contact.general.name}"';
            final delete = await showElbDialog<bool>(
              navigatorKey: navigatorKey,
              context: context,
              child: ElbAlertDialog(
                titleText: l10n.gen_attention,
                contentText:
                    crmL10n.customer_customer_client_delete_dialog_text(name),
                onCancel: () => Navigator.of(context).pop(false),
                actions: [
                  AppButton.secondary(
                    label: l10n.gen_cancel,
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  AppButton.danger(
                    label: l10n.gen_remove,
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
              isDismissible: false,
            );
            if (delete ?? false) {
              unawaited(
                ref
                    .read(customerCustomerRepositoryProvider)
                    .deleteCustomerCustomer(customerCustomer.id),
              );
            }
          },
        );
      },
    );
  }
}
