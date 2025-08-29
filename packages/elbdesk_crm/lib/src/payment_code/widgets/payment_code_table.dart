import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/payment_code/config/payment_code_fields.dart';
import 'package:elbdesk_crm/src/payment_code/logic/payment_code_provider.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';
import 'package:elbdesk_crm/src/payment_code/widgets/payment_code_card.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class PaymentCodeTable extends HookConsumerWidget {
  const PaymentCodeTable({
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
    // OnSave Callback
    // Called when an object is saved to this table
    return AppTableView<PaymentCode, PaymentCodeField>(
      tableDefaultNamePlural: crmL10n.payment_code_plural,
      tableViewIdentifier: componentIdentifier.name,
      sessionId: sessionId,
      isCollapsible: isCollapsible,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      showTableViews: true,
      defaultTableConfig: PaymentCodeFields.defaultTableColumns,
      tableDensity: null,
      onRowTap: (item) async {
        await showElbDialog<void>(
          context: context,
          navigatorKey: navigatorKey,
          // title: l10n.crm_payment_code_singular,
          child: PaymentCodeCard(
            floatingWindowFocus: floatingWindowFocus,
            floatingWindowId: floatingWindowId,
            entityId: item.id,
            navigatorKey: navigatorKey,
          ),
        );
      },
      dataProvider: findPaymentCodesProvider.call,
      fieldFromKey: (fieldKey) =>
          PaymentCodeFields.fromFieldKey(fieldKey).value,
      showToolbarDivider: true,
      buildCell: (field, item) {
        final alignment = PaymentCodeFields.fromEnum(field).cellAlignment;
        return switch (field) {
          PaymentCodeField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          PaymentCodeField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          PaymentCodeField.id => AppTableCellText(
              item.id.toString(),
              alignment: alignment,
            ),
          PaymentCodeField.code => AppTableCellText(
              item.code,
              alignment: alignment,
            ),
          PaymentCodeField.description => AppTableCellText(
              item.description,
              alignment: alignment,
            ),
          PaymentCodeField.dueDateCalculation => AppTableCellText(
              item.dueDateCalculation,
              alignment: alignment,
            ),
          PaymentCodeField.discountDateCalculation => AppTableCellText(
              item.discountDateCalculation,
              alignment: alignment,
            ),
          PaymentCodeField.discountPercentage => AppTableCellNum(
              item.discountPercentage,
              alignment: alignment,
            ),
          PaymentCodeField.calculateDiscountOnCreditNote => AppTableCellBool(
              item.calculateDiscountOnCreditNote,
              alignment: alignment,
            ),
          PaymentCodeField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          PaymentCodeField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          PaymentCodeField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          PaymentCodeField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
        };
      },
      buildCellTitle: (field) =>
          PaymentCodeFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          PaymentCodeFields.fromEnum(field).cellAlignment,
      availableFilterFieldsWithLabels:
          PaymentCodeField.values.filterableWithLabels(l10n, crmL10n),
      availableTableColumnsWithLabels:
          PaymentCodeField.values.tableColumnsWithLabels(l10n, crmL10n),
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            ref.invalidate(findPaymentCodesProvider);
          },
        ),
        AddEntityInDialogButton<PaymentCode>(
          entityCard: PaymentCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: null,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
          navigatorKey: navigatorKey,
          title: l10n.gen_add_entity(crmL10n.payment_code_singular),
          tooltip: l10n.gen_add_entity(crmL10n.payment_code_singular),
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.invalidate(findPaymentCodesProvider);
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
        MobileTableToolbarActionItem(
          onPressed: () {
            showElbDialog<PaymentCode>(
              // title: l10n.gen_add_entity(l10n.crm_payment_code_singular),
              context: context,
              navigatorKey: navigatorKey,
              child: PaymentCodeCard(
                floatingWindowId: floatingWindowId,
                entityId: null,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
          },
          label: crmL10n.payment_code_singular,
          icon: AppIcons.add,
        ),
      ],
    );
  }
}
