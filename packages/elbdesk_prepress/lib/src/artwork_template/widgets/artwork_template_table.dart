import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/config/artwork_template_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Possible types of the CoeColor Table

/// CoeColor Table Widget
class ArtworkTemplateTable extends HookConsumerWidget {
  /// Standard CoeColors constructor
  const ArtworkTemplateTable.standard({
    required this.dataProvider,
    required this.toolbarTrailingActions,
    required this.onSelect,
    required this.componentIdentifier,
    super.key,
    this.hiddenFilterGroup,
    this.selfGrowable = false,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.isCollapsible = true,
  })  : _tableType = _ArtworkTemplateTableType.standard,
        initialFilter = null,
        customerId = null,
        preSelectionId = null,
        selectionId = null,
        showTableViews = true,
        showTableName = true,
        showToolbarDivider = true,
        isHighlightable = true,
        isResizable = true,
        isSortable = true,
        fixedTableName = null;

  const ArtworkTemplateTable.global({
    required this.dataProvider,
    required this.toolbarTrailingActions,
    required this.onSelect,
    required this.componentIdentifier,
    super.key,
    this.hiddenFilterGroup,
    this.tableDensity = AppTableDensity.minimal,
    this.readOnly = false,
    this.isCollapsible = true,
  })  : _tableType = _ArtworkTemplateTableType.global,
        initialFilter = null,
        customerId = null,
        preSelectionId = null,
        selectionId = null,
        selfGrowable = true,
        showTableViews = false,
        showTableName = false,
        showToolbarDivider = false,
        isHighlightable = true,
        isResizable = false,
        isSortable = false,
        fixedTableName = '';

  const ArtworkTemplateTable.byCustomer({
    required this.toolbarTrailingActions,
    required this.onSelect,
    required this.dataProvider,
    required this.componentIdentifier,
    super.key,
    this.initialFilter,
    this.tableDensity = AppTableDensity.minimal,
    this.readOnly = false,
    this.hiddenFilterGroup,
    this.customerId,
    this.preSelectionId,
    this.selectionId,
    this.showToolbarDivider = true,
    this.isCollapsible = true,
  })  : _tableType = _ArtworkTemplateTableType.byCustomer,
        showTableViews = false,
        showTableName = false,
        isSortable = false,
        isHighlightable = false,
        isResizable = false,
        selfGrowable = false,
        fixedTableName = '';

  const ArtworkTemplateTable.fromSalesOrder({
    required this.toolbarTrailingActions,
    required this.onSelect,
    required this.dataProvider,
    required this.componentIdentifier,
    super.key,
    this.tableDensity = AppTableDensity.compact,
    this.readOnly = false,
    this.hiddenFilterGroup,
    this.customerId,
    this.preSelectionId,
    this.selectionId,
    this.fixedTableName,
    this.isCollapsible = true,
  })  : _tableType = _ArtworkTemplateTableType.fromSalesOrder,
        showTableViews = false,
        showTableName = false,
        showToolbarDivider = true,
        isSortable = false,
        isHighlightable = false,
        isResizable = false,
        initialFilter = null,
        selfGrowable = true;

  /// Type of the table, based on the constructor used
  /// Used to determine the default columns and how they are displayed
  final _ArtworkTemplateTableType _tableType;

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity tableDensity;

  final bool readOnly;
  final int? customerId;
  final int? preSelectionId;
  final int? selectionId;
  final bool showTableViews;
  final bool showTableName;
  final bool isResizable;
  final bool isHighlightable;
  final String? fixedTableName;
  final bool showToolbarDivider;
  final bool selfGrowable;
  final bool isSortable;
  final void Function(ArtworkTemplate)? onSelect;
  final List<Widget> Function(String sessionId)? toolbarTrailingActions;
  final ProviderListenable<AsyncValue<List<ArtworkTemplate>>> Function(
    String sessionId,
  ) dataProvider;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return AppTableView<ArtworkTemplate, ArtworkTemplateField>(
      tableDefaultNamePlural: ppL10n.artwork_template_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      isHighlightable: isHighlightable || onSelect != null,
      showToolbarDivider: showToolbarDivider,
      isResizable: isResizable,
      isSortable: isSortable,
      selfGrowable: selfGrowable,
      fixedTableTitle: fixedTableName,
      hiddenFilterGroup: hiddenFilterGroup,
      showTableViews: showTableViews,
      availableFilterFieldsWithLabels:
          ArtworkTemplateField.values.filters(l10n, ppL10n),
      availableTableColumnsWithLabels: !showTableViews
          ? null
          : ArtworkTemplateField.values.columns(l10n, ppL10n),
      toolbarTrailingActions: toolbarTrailingActions,
      defaultTableConfig: _tableType == _ArtworkTemplateTableType.fromSalesOrder
          ? ArtworkTemplateFields.defaultTableColumnsWithCustomer
          : ArtworkTemplateFields.defaultTableColumns,
      tableDensity: tableDensity,
      dataProvider: dataProvider,
      fieldFromKey: (fieldKey) =>
          ArtworkTemplateFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ArtworkTemplateFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          ArtworkTemplateFields.fromEnum(field).cellAlignment,
      onRowTap: (item) {
        onSelect?.call(item);
      },
      buildCell: (field, item) {
        final cellAlignment =
            ArtworkTemplateFields.fromEnum(field).cellAlignment;

        return switch (field) {
          ArtworkTemplateField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.description => AppTableCellText(
              item.description,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.artworkTemplatePreSelection => AppTableCellText(
              item.artworkTemplatePreSelection.description,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.artworkTemplateSelection => AppTableCellText(
              item.artworkTemplateSelection.description,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.anschnitt => AppTableCellNum(
              item.anschnitt,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.layers => AppTableCellNum(
              item.layers.length,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.trappBilder => AppTableCellNum(
              item.trapping.trappBilder,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.trappBlack => AppTableCellNum(
              item.trapping.trappBlack,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.trappNormal => AppTableCellNum(
              item.trapping.trappNormal,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.trappRueckzug => AppTableCellNum(
              item.trapping.trappRueckzug,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.trappSonderfarben => AppTableCellNum(
              item.trapping.trappSonderfarben,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.customer => AppTableCellText(
              item.customer?.contact?.general.name ?? '',
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.templateType => AppTableCellIcon(
              item.customer != null ? AppIcons.customer : AppIcons.globe,
              color: context.appTheme.statusColors.disabled,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: cellAlignment,
            ),
          ArtworkTemplateField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: cellAlignment,
            ),
        };
      },
    );
  }
}

/// Add ArtworkTemplate Button Widget
class AddArtworkTemplateButton extends ConsumerWidget {
  const AddArtworkTemplateButton({
    required this.sessionId,
    required this.customerId,
    required this.preSelectionId,
    required this.selectionId,
    super.key,
  });

  final String sessionId;
  final int customerId;
  final int preSelectionId;
  final int selectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return AppButton.primary(
      label: l10n.gen_add_entity(ppL10n.artwork_template_singular),
      onPressed: () {
        ref.openWindow(
          FloatingArtworkTemplateWindowData(
            artworkTemplateId: null,
            customerId: customerId,
            preSelectionId: preSelectionId,
            selectionId: selectionId,
          ),
        );
      },
    );
  }
}

enum _ArtworkTemplateTableType {
  standard,
  byCustomer,
  fromSalesOrder,
  global,
}
