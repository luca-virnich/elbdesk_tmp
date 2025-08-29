import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/in_window_contact_selection.dart';
import 'package:elbdesk_crm/src/customer/logic/customer_state.dart';
import 'package:elbdesk_crm/src/customer/widgets/customer_shipping_contacts_table/customer_shipping_contacts_table.dart';
import 'package:elbdesk_crm/src/ui/app_card_address_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class CustomerCardShippingAddressPage extends HookConsumerWidget {
  const CustomerCardShippingAddressPage({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.readOnly,
    required this.customerContact,
    required this.stateNotifier,
    required this.initialEntity,
    super.key,
  });

  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final bool readOnly;
  final Contact customerContact;
  final CustomerState stateNotifier;
  final Customer initialEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus = ref.watch(
      windowFocusNodeProvider(floatingWindowId),
    );
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final showListView = useState<bool>(false);
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CardSectionTitle(
              title: crmL10n.customer_shipping,
            ),
            ElbTwoColumnWrap(
              customL10n: crmL10n,
              width: constraints.maxWidth,
              readOnly: readOnly,
              validationGroupId: null,
              columnLeft: [
                ElbTwoColumnWrapLazyTextDropdownItem(
                  field: CustomerFields.fromEnum(CustomerField.shippingMethod),
                  dataProvider: fetchAndWatchAllShippingMethodsProvider,
                  onSelected: stateNotifier.updateShippingMethod,
                  itemLabelBuilder: (v) => v.description,
                  initialValue: initialEntity.shippingMethod?.description ?? '',
                ),
              ],
              columnRight: const [],
            ),
            const CardSectionDivider(),
            const CardSectionDivider(),
            CustomerShippingContactsTable(
              showTableViews: false,
              componentIdentifier:
                  ComponentIdentifier.customerCardShippingPageShippingAddresses,
              customerId: customerId,
              fixedTableTitle: crmL10n.customer_shipping_addresses,
              showFilter: false,
              toolbarTrailingActions: [
                ElbTableSwitchLayoutButton(
                  showList: showListView.value,
                  onPressed: () => showListView.value = !showListView.value,
                ),
                AddEntityInCardButton(
                  tooltip:
                      l10n.gen_add_entity(crmL10n.customer_shipping_address),
                  onPressed: () async {
                    await showElbDialog<Contact?>(
                      context: context,
                      navigatorKey: navigatorKey,
                      child: SelectContactFromTable(
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
              secondContent: (sessionId) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _CustomerDeliveryAddresses(
                    customerId: customerId,
                    customerContact: customerContact,
                    navigatorKey: navigatorKey,
                    readonly: readOnly,
                    sessionId: sessionId,
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

class _CustomerDeliveryAddresses extends ConsumerWidget {
  const _CustomerDeliveryAddresses({
    required this.customerId,
    required this.customerContact,
    required this.navigatorKey,
    required this.readonly,
    required this.sessionId,
  });

  final int customerId;
  final Contact customerContact;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool readonly;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final addresses = ref.watch(
      watchCustomerShippingContactsProvider(
        sessionId,
        customerId: customerId,
      ),
    );

    return addresses.fastWhen(
      data: (addresses) {
        if (addresses.isEmpty) {
          return Align(
            alignment: Alignment.centerLeft,
            child: AppText(crmL10n.customer_no_shipping_addresses_added),
          );
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int index = 0; index < addresses.length; index++) ...[
              CustomerShippingContactListTile(
                shippignContact: addresses[index],
                navigatorKey: navigatorKey,
                readOnly: readonly,
                sessionId: sessionId,
                customerId: customerId,
              ),
              // Separator
              if (index < addresses.length - 1)
                const AppListViewSeperator.space(),
            ],
          ],
        );
      },
    );
  }
}

class CustomerShippingContactListTile extends ConsumerWidget {
  const CustomerShippingContactListTile({
    required this.shippignContact,
    required this.navigatorKey,
    required this.readOnly,
    required this.sessionId,
    required this.customerId,
    super.key,
  });

  final CustomerShippingContact shippignContact;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool readOnly;
  final String sessionId;
  final int customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompany = shippignContact.contact.isCompany;
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final contact = ref.watch(
      fetchAndWatchContactProvider(
        shippignContact.contact.meta.id!,
      ),
    );

    return contact.fastWhen(
      data: (contact) {
        return AppCardAddressAndCommunicationTile.addressOnly(
          titleOutsideCard: null,
          titleInsideCard: isCompany
              ? contact.general.name
              : '${contact.general.firstName} ${contact.general.lastName}',
          address: contact.address,
          readOnly: readOnly,
          onTitleInsideCardTap: () {
            final isPerson =
                shippignContact.contact.general.type == ContactType.person;
            if (isPerson) {
              ref.openWindow(
                FloatingContactPersonWindowData(
                  contactId: shippignContact.contact.meta.id,
                ),
              );
            } else {
              ref.openWindow(
                FloatingContactCompanyWindowData(
                  contactId: shippignContact.contact.meta.id,
                ),
              );
            }
          },
          onEditTap: null,
          footer: Align(
            alignment: Alignment.centerRight,
            child: AppButton.text(
              label: shippignContact.isPrimary
                  ? l10n.gen_remove_as_standard
                  : l10n.gen_set_as_standard,
              onPressed: readOnly
                  ? null
                  : () {
                      if (shippignContact.isPrimary) {
                        ref
                            .read(customerRepositoryProvider)
                            .removeShippingAddressPrimary(
                              shippignContact.customer.id!,
                            );
                      } else {
                        ref
                            .read(customerRepositoryProvider)
                            .markShippingAddressAsPrimary(
                              shippignContact,
                            );
                      }
                    },
            ),
          ),
          onDelete: () async {
            final name = '"${contact.general.name}"';
            final delete = await showElbDialog<bool>(
              navigatorKey: navigatorKey,
              context: context,
              child: ElbAlertDialog(
                titleText: l10n.gen_attention,
                contentText:
                    crmL10n.customer_shipping_address_delete_dialog_text(name),
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
                ref
                    .read(customerRepositoryProvider)
                    .deleteShippingAddress(shippignContact),
              );
              ref.invalidate(
                fetchCustomerShippingAddressesProvider(
                  sessionId,
                  customerId: customerId,
                ),
              );
            }
          },
        );
      },
    );
  }
}

class SelectContactFromTable extends HookConsumerWidget {
  const SelectContactFromTable({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    super.key,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final contactId = ref.watch(
      customerStateProvider(customerId, sessionId)
          .select((value) => value.requireValue.contact!.meta.id),
    );
    final l10n = context.l10n;
    final isLoading = useState<bool>(false);

    return InWindowContactSelection.all(
      hiddenFilterGroup: FilterGroup(
        nextOperator: FilterOperator.and,
        filters: [
          FilterField(
            fieldType: FilterFieldType.number,
            fieldKey: ContactField.id.name,
            type: FilterType.notEqual,
            filterOperator: FilterOperator.and,
            value: contactId.toString(),
            uuid: const Uuid().v4(),
          ),
        ],
      ),
      onSelect: isLoading.value
          ? null
          : (contact) async {
              isLoading.value = true;
              final (:exception, :success, :data) =
                  await AsyncHandler.handleAsyncOperation(
                context,
                () => ref.read(customerRepositoryProvider).addShippingAddress(
                      customerId,
                      contact.meta.id!,
                    ),
                errorNavigatorKey: navigatorKey,
                successMessage: l10n.gen_saving_success,
                successNavigatorKey: navigatorKey,
                showErrorNotification: false,
              );
              if (exception != null) {
                if (exception.message.contains(
                  'customer_shipping_contact_unique_idx',
                )) {
                  AppNotificationOverlay.error(
                    context,
                    crmL10n.customer_shipping_address_already_added,
                  );
                } else {
                  AppNotificationOverlay.error(
                    context,
                    exception.message,
                  );
                }
              }

              if (context.mounted) {
                isLoading.value = false;
                if (success) {
                  Navigator.of(context).pop();
                }
              }
            },
      floatingWindowId: floatingWindowId,
      navigatorKey: navigatorKey,
      floatingWindowFocus: floatingWindowFocus,
      isLoading: isLoading.value,
      titleText: crmL10n.customer_shipping_select_address,
    );
  }
}

// TODO(luca): Reimplement later

// class OwnShippingAddressListTile extends ConsumerWidget {
//   const OwnShippingAddressListTile({
//     required this.customerContact,
//     required this.navigatorKey,
//     required this.readOnly,
//     super.key,
//   });

//   final Contact customerContact;
//   final GlobalKey<NavigatorState> navigatorKey;
//   final bool readOnly;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final contact = ref.watch(
//       fetchAndWatchContactProvider(
//         customerContact.meta.id!,
//       ),
//     );

//     return contact.fastWhen(
//       data: (contact) {
//         return AppCardAddressAndCommunicationTile.addressOnly(
//           titleOutsideCard: null,
//           titleInsideCard: contact.general.name,
//           address: contact.address,
//           readOnly: readOnly,
//           onTitleInsideCardTap: () {
//             ref.read(floatingWindowDataStateProvider.notifier).addWindow(
//                   FloatingContactWindowData(
//                     contactId: customerContact.meta.id,
//                     initialContactType: customerContact.general.type,
//                   ),
//                 );
//           },
//           onEditTap: null,
//         );
//       },
//     );
//   }
// }
