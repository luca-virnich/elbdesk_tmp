import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/customer/logic/customer_state.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class CustomerSalesOrderFieldHintsRibbon extends ConsumerWidget {
  const CustomerSalesOrderFieldHintsRibbon({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final stateNotifier = ref.watch(
      customerStateProvider(customerId, sessionId).notifier,
    );
    // final showSmallRibbons = ref.watch(useSmallRibbonsProvider);
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.customer.name,
      onPressed: () async {
        final initialHints = ref.read(
          customerStateProvider(customerId, sessionId).select(
            (value) => value.requireValue.salesOrderHints,
          ),
        );

        final reset = await showElbDialog<bool?>(
          context: context,
          // navigatorKey: navigatorKey,
          // onCancel: () {
          //   Navigator.of(context).pop(true);
          // },
          child: _CustomerSalesOrderFieldHints(
            stateNotifier: stateNotifier,
            customerId: customerId,
            sessionId: sessionId,
            navigatorKey: navigatorKey,
            floatingWindowId: floatingWindowId,
          ),
        );
        if (reset ?? false) {
          stateNotifier.updateSalesOrderHints(initialHints);
        }
      },
      label: crmL10n.customer_sales_order_field_hints,
      icon: AppIcons.salesOrder,
      badge: AppIcons.settings,
    );
  }
}

class _CustomerSalesOrderFieldHints extends HookConsumerWidget {
  const _CustomerSalesOrderFieldHints({
    required this.customerId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.stateNotifier,
  });
  final int customerId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;

  final String floatingWindowId;

  final CustomerState stateNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readOnly = ref.watch(
      customerStateProvider(customerId, sessionId).select(
        (value) => value.requireValue.meta.editingSessionId != sessionId,
      ),
    );

    final initialHints = useMemoized(
      () {
        return ref.read(
          customerStateProvider(customerId, sessionId).select(
            (value) => value.requireValue.salesOrderHints,
          ),
        );
      },
      [customerId, sessionId],
    );

    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final salesL10n = context.salesL10n;
    return ElbDialog(
      blockShortcuts: false,
      floatingWindowId: floatingWindowId,
      onCancel: () {
        Navigator.of(context).pop(true);
      },
      footer: InWindowCardDialogFooter(
        trailingActions: [
          AppApplyButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElbTwoColumnWrap(
                width: width,
                readOnly: readOnly,
                customL10n: crmL10n,
                validationGroupId: null,
                columnLeft: [
                  ElbTwoColumnWrapTextItem<ElbCrmLocalizations>(
                    field: null,
                    label: salesL10n.sales_order_order_number,
                    initialText: initialHints.orderNumber,
                    onChanged: stateNotifier.updateSalesOrderHintOrderNumber,
                    validator: null,
                  ),
                  ElbTwoColumnWrapTextItem<ElbCrmLocalizations>(
                    field: null,
                    label: crmL10n.customer_sales_order_keywords,
                    initialText: initialHints.keywords,
                    onChanged: stateNotifier.updateSalesOrderHintKeywords,
                    validator: null,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapTextItem<ElbCrmLocalizations>(
                    field: null,
                    label: crmL10n.customer_sales_order_first_ref,
                    initialText: initialHints.firstReference,
                    onChanged: stateNotifier.updateSalesOrderHintFirstReference,
                    validator: null,
                  ),
                  ElbTwoColumnWrapTextItem<ElbCrmLocalizations>(
                    field: null,
                    label: crmL10n.customer_sales_order_second_ref,
                    initialText: initialHints.secondReference,
                    onChanged:
                        stateNotifier.updateSalesOrderHintSecondReference,
                    validator: null,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
