import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/country_code/config/country_code_fields.dart';
import 'package:elbdesk_crm/src/country_code/widgets/country_code_card.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class CountryCodeTable extends HookConsumerWidget {
  /// Constructor
  const CountryCodeTable({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.componentIdentifier,
    required this.floatingWindowFocus,
    this.isCollapsible = true,
    super.key,
    this.readOnly = false,
    this.tableDensity = AppTableDensity.standard,
    this.initialFilter,
    this.showOpenInNewWindowButton = false,
    this.initialTableConfig,
  });

  final String floatingWindowId;

  /// Contact Table
  ///
  /// This is the standard ContactTable which displays all contacts
  /// available to the current user

  /// Type of the table
  /// Defined through constructors

  /// Wether available buttons should be clickable
  final bool readOnly;

  /// Size and look of the table
  final AppTableDensity tableDensity;

  /// Initial Filters added to the table
  final Filter? initialFilter;

  final bool showOpenInNewWindowButton;

  final GlobalKey<NavigatorState> navigatorKey;

  /// Wether to show the add new contact button

  final List<TableFieldConfig>? initialTableConfig;

  final FocusNode floatingWindowFocus;

  final ComponentIdentifier componentIdentifier;

  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Every table view needs a unique sessionId which will be used for
    // several operations like the filter, current view config etc.
    // We need this to be able to differentiate between different table views
    // with the same table (e.g. contact table in two different tabs)
    final sessionId = useUuid();
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppTableView<CountryCode, CountryCodeField>(
      tableDefaultNamePlural: crmL10n.country_code_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      showToolbarDivider: true,
      sessionId: sessionId,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      showTableViews: true,
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            ref.invalidate(findCountryCodesProvider);
          },
        ),
        AddEntityInDialogButton<CountryCode>(
          entityCard: CountryCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: null,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
          navigatorKey: navigatorKey,
          title: l10n.gen_add_entity(crmL10n.country_code_singular),
          tooltip: l10n.gen_add_entity(crmL10n.country_code_singular),
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.invalidate(findCountryCodesProvider);
          },
          label: l10n.gen_refresh,
          icon: AppIcons.refresh,
        ),
        MobileTableToolbarActionItem(
          onPressed: () {
            showElbDialog<CountryCode>(
              context: context,
              navigatorKey: navigatorKey,
              child: CountryCodeCard(
                floatingWindowId: floatingWindowId,
                entityId: null,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
              ),
            );
          },
          label: crmL10n.country_code_singular,
          icon: AppIcons.add,
        ),
      ],
      defaultTableConfig: CountryCodeFields.defaultTableColumns,
      tableDensity: tableDensity,
      dataProvider: findCountryCodesProvider.call,
      onRowTap: (item) async {
        await showElbDialog<void>(
          context: context,
          navigatorKey: navigatorKey,
          child: CountryCodeCard(
            floatingWindowId: floatingWindowId,
            entityId: item.id,
            navigatorKey: navigatorKey,
            floatingWindowFocus: floatingWindowFocus,
          ),
        );
      },
      fieldFromKey: (fieldKey) =>
          CountryCodeFields.fromFieldKey(fieldKey).value,
      buildCell: (field, item) {
        final alignment = CountryCodeFields.fromEnum(field).cellAlignment;
        return switch (field) {
          CountryCodeField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          CountryCodeField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          CountryCodeField.isPrimary => AppTableCellBool(
              item.isPrimary,
              alignment: alignment,
            ),
          CountryCodeField.createdAt => AppTableCellText(
              item.meta.createdAt!.toLocal().toIso8601String(),
              alignment: alignment,
            ),
          CountryCodeField.lastModifiedAt => AppTableCellText(
              item.meta.lastModifiedAt?.toLocal().toIso8601String() ?? '',
              alignment: alignment,
            ),
          CountryCodeField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
          CountryCodeField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          CountryCodeField.showState => AppTableCellBool(
              item.showState,
              alignment: alignment,
            ),
          CountryCodeField.id => AppTableCellText(
              item.id.toString(),
              alignment: alignment,
            ),
          CountryCodeField.code => AppTableCellText(
              item.code,
            ),
          CountryCodeField.countryRegionName => AppTableCellText(
              item.name,
              alignment: alignment,
            ),
          CountryCodeField.isoCode => AppTableCellText(
              item.isoCode,
              alignment: alignment,
            ),
          CountryCodeField.numericCode => AppTableCellText(
              item.numericIsoCode.toString(),
              alignment: alignment,
            ),
          CountryCodeField.addressFormat => AppTableCellText(
              item.addressFormat!.readable(crmL10n),
              alignment: alignment,
            ),
          CountryCodeField.contactAddressFormat => AppTableCellText(
              item.contactAddressFormat!.readable(crmL10n),
              alignment: alignment,
            ),
          CountryCodeField.federalRegion => AppTableCellText(
              item.federalRegion ?? '',
              alignment: alignment,
            ),
          CountryCodeField.euCode => AppTableCellText(
              item.euCode ?? '',
              alignment: alignment,
            ),
          CountryCodeField.intrastatCode => AppTableCellText(
              item.intrastatCode ?? '',
              alignment: alignment,
            ),
          CountryCodeField.taxScheme => AppTableCellText(
              item.taxScheme ?? '',
              alignment: alignment,
            ),
        };
      },
      buildCellTitle: (field) =>
          CountryCodeFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) =>
          CountryCodeFields.fromEnum(field).cellAlignment,
      availableFilterFieldsWithLabels:
          CountryCodeField.values.filterableWithLabels(l10n, crmL10n),
      availableTableColumnsWithLabels:
          CountryCodeField.values.tableColumnsWithLabels(l10n, crmL10n),
    );
  }
}
