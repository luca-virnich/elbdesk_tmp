import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CustomerTableCard extends HookConsumerWidget {
  /// Creates a new [CustomerTableCard]
  const CustomerTableCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
  });
  final String floatingWindowId;

  final FocusNode? floatingWindowFocus;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    const icon = AppIcons.customer;

    // This makes it closeable from the task bar
    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(floatingWindowId),
      (prev, next) {
        if (next) {
          ref.removeWindow(floatingWindowId);
        }
      },
    );
    return CustomCard(
      floatingWindowType: FloatingWindowType.customerTable.name,
      floatingWindowFocus: floatingWindowFocus,
      baseTitle: crmL10n.customer_plural,
      iconData: icon,
      floatingWindowId: floatingWindowId,
      childBuilder: (
        context,
        selectedNavIndexRef,
        navigatorKey,
      ) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.customerTable.name,
          isFirstRun: true,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: TableCardItem(
                table: _TableView(
                  floatingWindowId: floatingWindowId,
                  componentIdentifier: componentIdentifier,
                  isCollapsible: isCollapsible,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TableView extends ConsumerWidget {
  const _TableView({
    required this.floatingWindowId,
    required this.componentIdentifier,
    this.isCollapsible = true,
  });
  final String floatingWindowId;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomerTable.standard(
      componentIdentifier: componentIdentifier,
      isCollapsible: isCollapsible,
      onShiftSelect: (_) {
        ref.removeWindow(floatingWindowId);
      },
      onSelect: (customer) {
        ref.openWindow(
          FloatingCustomerWindowData(
            customerId: customer.id,
          ),
        );
      },
    );
  }
}
