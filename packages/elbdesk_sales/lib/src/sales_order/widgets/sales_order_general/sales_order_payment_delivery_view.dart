import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_sales/src/sales_order/logic/sales_order_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class SalesOrderPaymentDeliveryView extends ConsumerWidget {
  const SalesOrderPaymentDeliveryView({
    required this.stateNotifier,
    required this.initialEntity,
    required this.sessionId,
    required this.readOnly,
    required this.width,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.savedOrInitialEntity,
    required this.entityId,
    required this.identifier,
    super.key,
  });
  final SalesOrderState stateNotifier;
  final int entityId;
  final double width;
  final String sessionId;
  final bool readOnly;
  final SalesOrder initialEntity;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ObjectRef<SalesOrder?> savedOrInitialEntity;
  final ComponentIdentifier identifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesL10n = context.salesL10n;
    final crmL10n = context.crmL10n;
    return CollapsibleCardSection(
      identifier: identifier.name,
      title: crmL10n.payment_and_delivery_address,
      child: ElbTwoColumnWrap(
        customL10n: salesL10n,
        readOnly: readOnly,
        validationGroupId: null,
        width: width,
        columnLeft: [
          ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
            label: '',
            childBuilder: (labelPosition) => Consumer(
              builder: (context, ref, child) {
                return _Billing(
                  initialEntity: initialEntity,
                  stateNotifier: stateNotifier,
                  readOnly: readOnly,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  savedOrInitialEntity: savedOrInitialEntity,
                  entityId: entityId,
                );
              },
            ),
          ),
        ],
        columnRight: [
          ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
            label: '',
            childBuilder: (labelPosition) => Consumer(
              builder: (context, ref, child) {
                return _Shipping(
                  initialEntity: initialEntity,
                  stateNotifier: stateNotifier,
                  readOnly: readOnly,
                  sessionId: sessionId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                  floatingWindowFocus: floatingWindowFocus,
                  savedOrInitialEntity: savedOrInitialEntity,
                  entityId: entityId,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Shipping extends ConsumerWidget {
  const _Shipping({
    required this.initialEntity,
    required this.stateNotifier,
    required this.readOnly,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.savedOrInitialEntity,
    required this.entityId,
  });
  final SalesOrder initialEntity;
  final SalesOrderState stateNotifier;
  final bool readOnly;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ObjectRef<SalesOrder?> savedOrInitialEntity;
  final int entityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final shippingAddress = ref.watch(
      salesOrderStateProvider(initialEntity.meta.id!, sessionId).select(
        (state) => state.requireValue.shippingAddress,
      ),
    );

    final contactId = shippingAddress?.meta.id;

    final contact = ref.watch(
      fetchAndWatchContactProvider(
        contactId!,
      ),
    );

    return contact.fastWhen(
      data: (contact) {
        return AppCardAddressAndCommunicationTile.addressOnly(
          titleOutsideCard: crmL10n.shipping_address,
          titleInsideCard: contact.general.name,
          address: contact.address,
          readOnly: readOnly,
          onShiftPressed: () {
            final currentState = ref.read(
              salesOrderStateProvider(entityId, sessionId).select(
                (state) => state.requireValue,
              ),
            );

            final hasChanges = hasEntityChanges(
              savedOrInitialEntity.value,
              currentState,
            );

            if (!hasChanges) {
              ref.removeWindow(floatingWindowId);
            }
          },
          onTitleInsideCardTap: () {
            ref.openWindow(
              FloatingContactPersonWindowData(
                contactId: shippingAddress!.meta.id,
              ),
            );
          },
          onEditTap: () async {
            final contact = await showElbDialog<Contact?>(
              context: context,
              navigatorKey: navigatorKey,
              child: _SelectContactShippingAddressFromTable(
                navigatorKey: navigatorKey,
                initialEntity: initialEntity,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
            if (contact != null) {
              stateNotifier.updateShippingAddress(contact);
            }
          },
        );
      },
    );
  }
}

class _SelectContactShippingAddressFromTable extends HookConsumerWidget {
  const _SelectContactShippingAddressFromTable({
    required this.navigatorKey,
    required this.initialEntity,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final SalesOrder initialEntity;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);

    return ElbDialog(
      isSelfScrollable: false,
      floatingWindowId: floatingWindowId,
      title: crmL10n.customer_shipping_select_address,
      isLoading: isLoading.value,
      child: SelectContactTableForShippingAddress(
        tableTitle: crmL10n.customer_shipping_addresses,
        dataProvider: (sessionId) =>
            fetchCustomerShippingAddressesForSalesOrderProvider(
          sessionId,
          customer: initialEntity.customer!,
        ),
        onRowTap: (contact) => Navigator.of(context).pop(contact),
        defaultTableConfig:
            ContactFields.defaultSelectionShippingAddressTableColumns,
      ),
    );
  }
}

class _Billing extends ConsumerWidget {
  const _Billing({
    required this.initialEntity,
    required this.stateNotifier,
    required this.readOnly,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.savedOrInitialEntity,
    required this.entityId,
  });
  final SalesOrder initialEntity;
  final SalesOrderState stateNotifier;
  final bool readOnly;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ObjectRef<SalesOrder?> savedOrInitialEntity;
  final int entityId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final billingCustomer = ref.watch(
      salesOrderStateProvider(initialEntity.meta.id!, sessionId).select(
        (state) => state.requireValue.billingAddress,
      ),
    );
    final contactId = billingCustomer?.contact?.meta.id;
    final contact = ref.watch(
      fetchAndWatchContactProvider(
        contactId!,
      ),
    );

    return contact.fastWhen(
      data: (contact) {
        return AppCardAddressAndCommunicationTile.addressOnly(
          titleOutsideCard: crmL10n.billing_address,
          titleInsideCard: contact.general.name,
          address: contact.address,
          readOnly: readOnly,
          onShiftPressed: () {
            final currentState = ref.read(
              salesOrderStateProvider(entityId, sessionId).select(
                (state) => state.requireValue,
              ),
            );

            final hasChanges = hasEntityChanges(
              savedOrInitialEntity.value,
              currentState,
            );

            if (!hasChanges) {
              ref.removeWindow(floatingWindowId);
            }
          },
          onTitleInsideCardTap: () {
            ref.openWindow(
              FloatingCustomerWindowData(
                customerId: billingCustomer!.id,
              ),
            );
          },
          onEditTap: () async {
            final customer = await showElbDialog<Customer?>(
              context: context,
              navigatorKey: navigatorKey,
              child: _SelectCustomerBillingAddressFromTable(
                navigatorKey: navigatorKey,
                initialEntity: initialEntity,
                floatingWindowId: floatingWindowId,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
            if (customer != null) {
              stateNotifier.updateBillingAddress(customer);
            }
          },
        );
      },
    );
  }
}

class _SelectCustomerBillingAddressFromTable extends HookConsumerWidget {
  const _SelectCustomerBillingAddressFromTable({
    required this.navigatorKey,
    required this.initialEntity,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final SalesOrder initialEntity;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);

    return ElbDialog(
      floatingWindowId: floatingWindowId,
      isLoading: isLoading.value,
      title: crmL10n.customer_billing_select_address,
      child: CustomerTable.selectBillingAddressForSalesOrder(
        componentIdentifier:
            ComponentIdentifier.customerTableSelectBillingAddressForSalesOrder,
        isCollapsible: false,
        selfGrowable: false,
        fixedTableTitle: crmL10n.customer_billing_addresses,
        dataProvider: (sessionId) =>
            fetchCustomerBillingAddressesForSalesOrderProvider(
          customer: initialEntity.customer!,
        ),
        onSelect: (customer) => Navigator.of(context).pop(customer),
      ),
    );
  }
}
