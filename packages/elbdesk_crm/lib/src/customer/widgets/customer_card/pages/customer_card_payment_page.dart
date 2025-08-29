import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/logic/customer_state.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_billing_customers_table/customer_billing_customers_table.dart';
import 'package:elbdesk_crm/src/payment_code/logic/payment_code_provider.dart';
import 'package:elbdesk_crm/src/ui/app_card_address_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CustomerCardPaymentPage extends HookConsumerWidget {
  const CustomerCardPaymentPage({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.customerContactId,
    required this.stateNotifier,
    required this.readOnly,
    required this.initialEntity,
    super.key,
  });

  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final int customerContactId;
  final CustomerState stateNotifier;
  final bool readOnly;
  final Customer initialEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final showListView = useState<bool>(false);
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          children: [
            CardSectionTitle(
              title: crmL10n.customer_payment,
            ),
            _CustomerPayment(
              width: constraints.maxWidth,
              customerId: customerId,
              sessionId: sessionId,
              stateNotifier: stateNotifier,
              readOnly: readOnly,
              initialEntity: initialEntity,
            ),
            const CardSectionDivider(),
            CustomerBillingCustomersTable(
              componentIdentifier:
                  ComponentIdentifier.customerCardPaymentPageBillingAddresses,
              customerId: customerId,
              fixedTableTitle: crmL10n.customer_billing_addresses,
              showFilter: false,
              toolbarTrailingActions: [
                ElbTableSwitchLayoutButton(
                  showList: showListView.value,
                  onPressed: () => showListView.value = !showListView.value,
                ),
                AddEntityInCardButton(
                  tooltip:
                      l10n.gen_add_entity(crmL10n.customer_billing_address),
                  onPressed: () async {
                    await showElbDialog<Contact?>(
                      context: context,
                      child: _SelectCustomerFromTable(
                        customerId: customerId,
                        customerContactId: customerContactId,
                        navigatorKey: navigatorKey,
                        floatingWindowId: floatingWindowId,
                        floatingWindowFocus: floatingWindowFocus,
                      ),
                    );
                  },
                ),
              ],
              showTable: showListView.value,
              secondContent: (sessionId) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _CustomerBillingAddresses(
                    customerId: customerId,
                    sessionId: sessionId,
                    customerContact: initialEntity.contact!,
                    navigatorKey: navigatorKey,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CustomerBillingAddresses extends ConsumerWidget {
  const _CustomerBillingAddresses({
    required this.customerId,
    required this.sessionId,
    required this.customerContact,
    required this.navigatorKey,
  });

  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final Contact customerContact;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addresses = ref.watch(
      watchCustomerBillingContactsProvider(
        sessionId,
        customerId: customerId,
      ),
    );
    final filter = ref.watch(
      appTableFilterStateProvider(
        TableType.customer.name,
        sessionId,
      ),
    );
    final crmL10n = context.crmL10n;
    return addresses.fastWhen(
      data: (addresses) {
        if (addresses.isEmpty) {
          return Align(
            alignment: Alignment.centerLeft,
            child: AppText(
              filter == null
                  ? crmL10n.customer_no_billing_addresses_added
                  : 'Keine Rechnungsadressen gefunden'.hc,
            ),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: addresses.length,
              separatorBuilder: (context, index) =>
                  const AppListViewSeperator.space(),
              itemBuilder: (context, index) => _BillingAddressListTile(
                customerBillingCustomer: addresses[index],
                navigatorKey: navigatorKey,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SelectCustomerFromTable extends HookConsumerWidget {
  const _SelectCustomerFromTable({
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.customerContactId,
  });

  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final int customerContactId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);

    return ElbDialog(
      floatingWindowId: floatingWindowId,
      title: crmL10n.customer_billing_select_address,
      isLoading: isLoading.value,
      child: CustomerTable.selectAddress(
        componentIdentifier: ComponentIdentifier.customerTableSelectAddress,
        hiddenFilterGroup: FilterGroup(
          nextOperator: FilterOperator.and,
          filters: [
            FilterField(
              fieldType: FilterFieldType.number,
              fieldKey: ContactField.id.name,
              type: FilterType.notEqual,
              filterOperator: FilterOperator.and,
              value: customerId.toString(),
              uuid: const Uuid().v4(),
            ),
          ],
        ),
        onSelect: isLoading.value
            ? null
            : (customer) async {
                isLoading.value = true;
                final (:exception, :success, :data) =
                    await AsyncHandler.handleAsyncOperation(
                  context,
                  () => ref.read(customerRepositoryProvider).addBillingAddress(
                        customerId,
                        customer.meta.id!,
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

class _BillingAddressListTile extends ConsumerWidget {
  const _BillingAddressListTile({
    required this.customerBillingCustomer,
    required this.navigatorKey,
  });

  final CustomerBillingCustomer customerBillingCustomer;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final contactId = customerBillingCustomer.billingCustomer!.contact!.meta.id;
    final contact = ref.watch(
      fetchAndWatchContactProvider(
        contactId!,
      ),
    );

    return contact.fastWhen(
      data: (contact) {
        return AppCardAddressAndCommunicationTile.addressOnly(
          titleOutsideCard: null,
          titleInsideCard: contact.general.name,
          address: contact.address,
          readOnly: true,
          onTitleInsideCardTap: () {
            ref.openWindow(
              FloatingCustomerWindowData(
                customerId: customerBillingCustomer.billingCustomer!.meta.id,
              ),
            );
          },
          footer: Align(
            alignment: Alignment.centerRight,
            child: AppButton.text(
              label: customerBillingCustomer.isPrimary
                  ? l10n.gen_remove_as_standard
                  : l10n.gen_set_as_standard,
              onPressed: () {
                if (customerBillingCustomer.isPrimary) {
                  ref
                      .read(customerRepositoryProvider)
                      .removeBillingAddressPrimary(
                        customerBillingCustomer.customer!.meta.id!,
                      );
                } else {
                  ref
                      .read(customerRepositoryProvider)
                      .markBillingAddressAsPrimary(
                        customerBillingCustomer,
                      );
                }
              },
            ),
          ),
          onEditTap: null,
          onDelete: () async {
            final name =
                // ignore: lines_longer_than_80_chars
                '"${customerBillingCustomer.billingCustomer!.contact!.general.name}"';
            final delete = await showElbDialog<bool>(
              navigatorKey: navigatorKey,
              context: context,
              child: ElbAlertDialog(
                titleText: l10n.gen_attention,
                contentText:
                    crmL10n.customer_payment_address_delete_dialog_text(name),
                onCancel: () {
                  Navigator.of(context).pop(false);
                },
                actions: [
                  AppButton.secondary(
                    label: l10n.gen_cancel,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  AppButton.danger(
                    label: l10n.gen_remove,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
              isDismissible: false,
            );
            if (delete ?? false) {
              unawaited(
                ref.read(customerRepositoryProvider).deleteBillingAddress(
                      customerBillingCustomer,
                    ),
              );
            }
          },
        );
      },
    );
  }
}

class _CustomerPayment extends ConsumerWidget {
  const _CustomerPayment({
    required this.width,
    required this.customerId,
    required this.sessionId,
    required this.stateNotifier,
    required this.readOnly,
    required this.initialEntity,
  });
  final double width;
  final int customerId;
  final String sessionId;
  final CustomerState stateNotifier;
  final bool readOnly;
  final Customer initialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    return ElbTwoColumnWrap(
      width: width,
      customL10n: crmL10n,
      readOnly: readOnly,
      validationGroupId: null,
      columnLeft: [
        ElbTwoColumnDropdown.text(
          field: CustomerFields.fromEnum(
            CustomerField.invoiceDeliveryMethod,
          ),
          initialValue: initialEntity.invoiceDeliveryMethod,
          onChanged: stateNotifier.updateInvoiceDeliveryMethod,
        ),
        ElbTwoColumnDropdown.text(
          field: CustomerFields.fromEnum(
            CustomerField.invoiceDeliveryMethod,
          ),
          onChanged: stateNotifier.updateInvoiceDeliveryMethod,
          initialValue: initialEntity.invoiceDeliveryMethod,
        ),
        ElbTwoColumnDropdown.lazyText(
          field: CustomerFields.fromEnum(
            CustomerField.paymentCode,
          ),
          lazyDataProvider: fetchAndWatchAllPaymentCodesProvider,
          onChanged: stateNotifier.updatePaymentCode,
          lazyItemLabelBuilder: (v) => v.description,
          initialValueText: initialEntity.paymentCode?.description,
        ),
      ],
      columnRight: [
        ElbTwoColumnWrapTextItem(
          field: CustomerFields.fromEnum(
            CustomerField.vatId,
          ),
          initialText: initialEntity.vatId,
          onChanged: stateNotifier.updateVatId,
        ),
      ],
    );
  }
}

// TODO(luca): Reimplement later

// class _OwnBillingAddressListTile extends ConsumerWidget {
//   const _OwnBillingAddressListTile({
//     required this.customerContact,
//     required this.navigatorKey,
//   });

//   final Contact customerContact;
//   final GlobalKey<NavigatorState> navigatorKey;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final contactId = customerContact.meta.id;
//     final contact = ref.watch(
//       fetchAndWatchContactProvider(
//         contactId!,
//       ),
//     );

//     return contact.fastWhen(
//       data: (contact) {
//         return AppCardAddressAndCommunicationTile.addressOnly(
//           onEditTap: null,
//           titleOutsideCard: null,
//           titleInsideCard: contact.general.name,
//           address: contact.address,
//           readOnly: true,
//           onTitleInsideCardTap: () {},
//         );
//       },
//     );
//   }
// }
