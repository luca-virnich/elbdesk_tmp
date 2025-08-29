import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/language_code/config/language_code_fields.dart';
import 'package:elbdesk_crm/src/language_code/widgets/language_code_card.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
class LanguageCodeTable extends HookConsumerWidget {
  /// @nodoc
  const LanguageCodeTable({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionId = useUuid();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppTableView<LanguageCode, LanguageCodeField>(
      tableDefaultNamePlural: crmL10n.language_code_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      showToolbarDivider: true,
      sessionId: sessionId,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      showTableViews: true,
      defaultTableConfig: LanguageCodeFields.defaultTableColumns,
      tableDensity: null,
      dataProvider: findLanguageCodesProvider.call,
      onRowTap: (item) async {
        await showElbDialog<void>(
          context: context,
          child: LanguageCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: item.id,
            navigatorKey: navigatorKey,
          ),
        );
      },
      fieldFromKey: (fieldKey) =>
          LanguageCodeFields.fromFieldKey(fieldKey).value,
      buildCell: (field, item) {
        // Get field config once to avoid repeated lookups
        final extField = LanguageCodeFields.fromEnum(field);
        final alignment = extField.cellAlignment;

        // Build cell based on field - simpler and type-safe
        return switch (field) {
          LanguageCodeField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          LanguageCodeField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          LanguageCodeField.isPrimary => AppTableCellBool(
              item.isPrimary,
              alignment: alignment,
            ),
          LanguageCodeField.id => AppTableCellNum(
              item.id ?? 0,
              alignment: alignment,
            ),
          LanguageCodeField.code => AppTableCellText(
              item.code,
              alignment: alignment,
            ),
          LanguageCodeField.languageName => AppTableCellText(
              item.name,
              alignment: alignment,
            ),
          LanguageCodeField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          LanguageCodeField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          LanguageCodeField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          LanguageCodeField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
        };
      },
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            ref.invalidate(findLanguageCodesProvider);
          },
        ),
        AddEntityInDialogButton<LanguageCode>(
          entityCard: LanguageCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: null,
            navigatorKey: navigatorKey,
          ),
          navigatorKey: navigatorKey,
          title: l10n.gen_add_entity(crmL10n.language_code_singular),
          tooltip: l10n.gen_add_entity(crmL10n.language_code_singular),
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.invalidate(findLanguageCodesProvider);
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
        MobileTableToolbarActionItem(
          onPressed: () {
            showElbDialog<LanguageCode>(
              context: context,
              navigatorKey: navigatorKey,
              child: LanguageCodeCard(
                floatingWindowId: floatingWindowId,
                entityId: null,
                navigatorKey: navigatorKey,
              ),
            );
          },
          label: crmL10n.language_code_singular,
          icon: AppIcons.add,
        ),
      ],
      buildCellTitle: (field) {
        // Cache the field lookup to avoid repeated calls
        final extField = LanguageCodeFields.fromEnum(field);
        return extField.readable(l10n, crmL10n);
      },
      getTitleAlignment: (field) {
        // Use cached field lookup from buildCell if possible,
        // or do a single lookup here
        return LanguageCodeFields.fromEnum(field).cellAlignment;
      },
      availableFilterFieldsWithLabels:
          LanguageCodeField.values.filterableWithLabels(l10n, crmL10n),
      availableTableColumnsWithLabels:
          LanguageCodeField.values.tableColumnsWithLabels(l10n, crmL10n),
    );
  }
}
