import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/salutation_code/config/salutation_code_fields.dart';
import 'package:elbdesk_crm/src/salutation_code/logic/salutation_code_provider.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';
import 'package:elbdesk_crm/src/salutation_code/widgets/salutation_code_card.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class SalutationCodeTable extends HookConsumerWidget {
  const SalutationCodeTable({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
  });

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

    return AppTableView<SalutationCode, SalutationCodeField>(
      tableDefaultNamePlural: crmL10n.salutation_code_plural,
      showToolbarDivider: true,
      sessionId: sessionId,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      defaultTableConfig: SalutationCodeFields.defaultTableColumns,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      onRowTap: (item) async {
        await showElbDialog<void>(
          context: context,
          navigatorKey: navigatorKey,
          child: SalutationCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: item.id,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
        );
      },
      dataProvider: (sessionId) => findSalutationCodesProvider(sessionId),
      fieldFromKey: (fieldKey) =>
          SalutationCodeFields.fromFieldKey(fieldKey).value,
      buildCell: (field, item) {
        final alignment = SalutationCodeFields.fromEnum(field).cellAlignment;
        return switch (field) {
          SalutationCodeField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          SalutationCodeField.isPrimaryPerson => AppTableCellBool(
              item.isPrimaryPerson,
              alignment: alignment,
            ),
          SalutationCodeField.isPrimaryCompany => AppTableCellBool(
              item.isPrimaryCompany,
              alignment: alignment,
            ),
          SalutationCodeField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          SalutationCodeField.id => AppTableCellText(
              item.id.toString(),
              alignment: alignment,
            ),
          SalutationCodeField.code => AppTableCellText(
              item.code,
              alignment: alignment,
            ),
          SalutationCodeField.description => AppTableCellText(
              item.description,
              alignment: alignment,
            ),
          SalutationCodeField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          SalutationCodeField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          SalutationCodeField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          SalutationCodeField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
        };
      },
      buildCellTitle: (field) =>
          SalutationCodeFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          SalutationCodeFields.fromEnum(field).cellAlignment,
      availableFilterFieldsWithLabels:
          SalutationCodeField.values.filterableWithLabels(
        l10n,
        crmL10n,
      ),
      availableTableColumnsWithLabels:
          SalutationCodeField.values.tableColumnsWithLabels(l10n, crmL10n),
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            ref.invalidate(findSalutationCodesProvider);
          },
        ),
        AddEntityInDialogButton<SalutationCode>(
          entityCard: SalutationCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: null,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
          navigatorKey: navigatorKey,
          title: l10n.gen_add_entity(crmL10n.salutation_code_singular),
          tooltip: l10n.gen_add_entity(crmL10n.salutation_code_singular),
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.invalidate(findSalutationCodesProvider);
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
        MobileTableToolbarActionItem(
          onPressed: () {
            showElbDialog<SalutationCode>(
              // title: l10n.gen_add_entity(l10n.crm_salutation_code_singular),
              context: context,
              navigatorKey: navigatorKey,
              child: SalutationCodeCard(
                floatingWindowId: floatingWindowId,
                entityId: null,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
          },
          label: crmL10n.salutation_code_singular,
          icon: AppIcons.add,
        ),
      ],
    );
  }
}
