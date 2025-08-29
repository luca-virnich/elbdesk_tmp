import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/config/artwork_color_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Color Book Table
///
/// The Table View for the Color Book Table
class SearchAndSelectColorInArtworkTable extends HookConsumerWidget {
  const SearchAndSelectColorInArtworkTable({
    required this.customerId,
    required this.componentIdentifier,
    super.key,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.items,
    this.isCollapsible = true,
  });

  final AppTableDensity tableDensity;
  final bool readOnly;
  final int customerId;
  final List<ArtworkColor>? items;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    if (items != null) {
      return AppTableViewWithItems<ArtworkColor, ArtworkColorField>(
        tableDefaultNamePlural: ppL10n.color_palette_plural,
        componentIdentifier: componentIdentifier.name,
        items: items!,
        fixedTableTitle: ppL10n.color_palette_plural,
        showToolbarDivider: true,
        showTableViews: false,
        availableTableColumnsWithLabels:
            ArtworkColorField.values.columns(l10n, ppL10n),
        toolbarTrailingActions: null,
        defaultTableConfig:
            ArtworkColorFields.selectArtworkColorInArtworkColumns,
        tableDensity: tableDensity,
        fieldFromKey: (fieldKey) =>
            ArtworkColorFields.fromFieldKey(fieldKey).value,
        buildCellTitle: (field) =>
            ArtworkColorFields.fromEnum(field).readable(l10n, ppL10n),
        getTitleAlignment: (field) =>
            ArtworkColorFields.fromEnum(field).cellAlignment,
        onRowTap: (item) {
          Navigator.of(context).pop(item);
        },
        buildCell: (field, item) {
          return switch (field) {
            ArtworkColorField.colorPalette => AppTableCellText(
                item.colorPalette?.paletteName ?? '',
                alignment: ArtworkColorFields.fromEnum(field).cellAlignment,
              ),
            ArtworkColorField.colorName => AppTableCellText(
                item.colorName,
              ),
            ArtworkColorField.color => AppTableCellColor(
                item.color!,
              ),
            _ => AppTableCellText(
                item.colorName,
              ),
          };
        },
      );
    }

    return AppTableView<ArtworkColor, ArtworkColorField>(
      tableDefaultNamePlural: ppL10n.color_palette_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      fixedTableTitle: ppL10n.color_palette_plural,
      showToolbarDivider: true,
      showLoadingIndicatorOnRefresh: true,
      showTableViews: false,
      availableFilterFieldsWithLabels: null,
      quickSearchFilterFields:
          ArtworkColorField.values.quickSearchFields(l10n, ppL10n),
      availableTableColumnsWithLabels:
          ArtworkColorField.values.columns(l10n, ppL10n),
      toolbarTrailingActions: null,
      defaultTableConfig: ArtworkColorFields.selectArtworkColorInArtworkColumns,
      tableDensity: tableDensity,
      dataProvider: (sessionId) =>
          findArtworkColorsByCustomerIdProvider(sessionId, customerId),
      fieldFromKey: (fieldKey) =>
          ArtworkColorFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ArtworkColorFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          ArtworkColorFields.fromEnum(field).cellAlignment,
      onRowTap: (item) {
        Navigator.of(context).pop(item);
      },
      buildCell: (field, item) {
        return switch (field) {
          ArtworkColorField.colorPalette => AppTableCellText(
              item.colorPalette?.paletteName ?? '',
              alignment: ArtworkColorFields.fromEnum(field).cellAlignment,
            ),
          ArtworkColorField.colorName => AppTableCellText(
              item.colorName,
            ),
          ArtworkColorField.color => AppTableCellColor(
              item.color!,
            ),
          _ => AppTableCellText(
              item.colorName,
            ),
        };
      },
    );
  }
}
