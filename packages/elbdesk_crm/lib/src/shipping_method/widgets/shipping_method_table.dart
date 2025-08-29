import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/shipping_method/config/shipping_method_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Shipping Method Table
///
/// This table displays all shipping methods and allows the user to
/// create, edit and delete shipping methods.
class ShippingMethodTable extends HookConsumerWidget {
  const ShippingMethodTable({
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    required this.floatingWindowId,
    this.isCollapsible = true,
    super.key,
    this.initialTableConfig,
  });

  final List<TableFieldConfig>? initialTableConfig;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = useUuid();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    return AppTableView<ShippingMethod, ShippingMethodField>(
      tableDefaultNamePlural: crmL10n.shipping_method_plural,
      tableViewIdentifier: componentIdentifier.name,
      sessionId: sessionId,
      isCollapsible: isCollapsible,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      showTableViews: true,
      defaultTableConfig: ShippingMethodFields.defaultTableColumns,
      tableDensity: null,
      onRowTap: (item) async {
        await showElbDialog<void>(
          context: context,
          navigatorKey: navigatorKey,
          child: ShippingMethodCard(
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
            entityId: item.id,
            navigatorKey: navigatorKey,
          ),
        );
      },
      dataProvider: findShippingMethodsProvider.call,
      fieldFromKey: (fieldKey) =>
          ShippingMethodFields.fromFieldKey(fieldKey).value,
      showToolbarDivider: true,
      buildCell: (field, item) {
        final alignment = ShippingMethodFields.fromEnum(field).cellAlignment;
        return switch (field) {
          ShippingMethodField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          ShippingMethodField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          ShippingMethodField.id => AppTableCellText(
              item.id.toString(),
              alignment: alignment,
            ),
          ShippingMethodField.code => AppTableCellText(
              item.code,
              alignment: alignment,
            ),
          ShippingMethodField.description => AppTableCellText(
              item.description,
              alignment: alignment,
            ),
          ShippingMethodField.isActive => AppTableCellBool(
              item.isActive,
              alignment: alignment,
            ),
          ShippingMethodField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          ShippingMethodField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          ShippingMethodField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          ShippingMethodField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
        };
      },
      buildCellTitle: (field) =>
          ShippingMethodFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          ShippingMethodFields.fromEnum(field).cellAlignment,
      availableFilterFieldsWithLabels:
          ShippingMethodField.values.filterableWithLabels(l10n, crmL10n),
      availableTableColumnsWithLabels:
          ShippingMethodField.values.tableColumnsWithLabels(l10n, crmL10n),
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            ref.invalidate(findShippingMethodsProvider);
          },
        ),
        AddEntityInDialogButton<ShippingMethod>(
          entityCard: ShippingMethodCard(
            floatingWindowId: floatingWindowId,
            entityId: null,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
          navigatorKey: navigatorKey,
          title: l10n.gen_add_entity(crmL10n.shipping_method_singular),
          tooltip: l10n.gen_add_entity(crmL10n.shipping_method_singular),
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.invalidate(findShippingMethodsProvider);
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
        MobileTableToolbarActionItem(
          onPressed: () {
            showElbDialog<ShippingMethod>(
              // title: l10n.gen_add_entity(l10n.crm_shipping_method_singular),
              context: context,
              navigatorKey: navigatorKey,
              child: ShippingMethodCard(
                floatingWindowId: floatingWindowId,
                entityId: null,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
          },
          label: crmL10n.shipping_method_singular,
          icon: AppIcons.add,
        ),
      ],
    );
  }
}
