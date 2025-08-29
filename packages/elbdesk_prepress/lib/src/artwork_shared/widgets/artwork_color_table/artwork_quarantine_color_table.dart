import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/config/artwork_color_fields.dart';
import 'package:elbdesk_prepress/src/artwork_shared/widgets/artwork_color_table/artwork_color_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Customer Color Spec Table
///
/// The Table View for the Customer Color Spec Table
class ArtworkQuarantineColorsTable extends HookConsumerWidget {
  const ArtworkQuarantineColorsTable({
    required this.navigatorKey,
    required this.customerId,
    required this.dataProvider,
    required this.floatingWindowFocus,
    required this.sessionId,
    required this.onAcceptColor,
    required this.floatingWindowId,
    required this.componentIdentifier,
    super.key,
    this.colors,
    this.readOnly = false,
    this.availableTableFilterFieldsWithLabel,
  });
  final int? customerId;
  final String sessionId;

  final bool readOnly;

  final GlobalKey<NavigatorState> navigatorKey;

  final Map<ArtworkColorField, TableFieldData>?
      availableTableFilterFieldsWithLabel;
  final FocusNode floatingWindowFocus;
  final ProviderListenable<AsyncValue<List<ArtworkColor>>> dataProvider;

  final void Function(ArtworkColor color)? onAcceptColor;
  final String floatingWindowId;
  final List<ArtworkColor>? colors;
  final ComponentIdentifier componentIdentifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return AppTableView<ArtworkColor, ArtworkColorField>(
      tableDefaultNamePlural: ppL10n.color_plural,
      isHighlightable: false,
      fixedTableTitle: ppL10n.artwork_quarantine_colors,
      isSortable: false,
      showToolbarDivider: true,
      isResizable: false,
      showTableViews: false,
      tableViewIdentifier: componentIdentifier.name,
      selfGrowable: true,
      availableFilterFieldsWithLabels: null,
      availableTableColumnsWithLabels: null,
      toolbarTrailingActions: null,
      defaultTableConfig: ArtworkColorFields.artworkQuarantineTableColumns,
      tableDensity: AppTableDensity.compact,
      dataProvider: (sessionId) => dataProvider,
      fieldFromKey: (fieldKey) =>
          ArtworkColorFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ArtworkColorFields.fromEnum(field).readable(l10n, ppL10n),
      buildCellTitleWidget: (field) {
        return switch (field) {
          ArtworkColorField.move => const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElbIcon(AppIcons.expand_less, size: AppIconSize.m),
                SizedBox(width: 8),
                ElbIcon(AppIcons.expand_more, size: AppIconSize.m),
              ],
            ),
          _ => AppTableTitleText(
              ArtworkColorFields.fromEnum(field).readable(l10n, ppL10n),
              alignment: ArtworkColorFields.fromEnum(field).cellAlignment,
            ),
        };
      },
      getTitleAlignment: (field) =>
          ArtworkColorFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final cellAlignment = ArtworkColorFields.fromEnum(field).cellAlignment;

        return switch (field) {
          ArtworkColorField.actions => AppTableCellTextButton(
              l10n.gen_add,
              onPressed: () {
                onAcceptColor?.call(item);
              },
              alignment: cellAlignment,
            ),
          ArtworkColorField.customText => AppTableCellText(
              item.customText ?? '',
              key: Key('${item.runtimeId}_customText'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.boost => AppTableCellText(
              item.boost.toString(),
              key: Key('${item.runtimeId}_boost'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.colorSpecType => AppTableCellText(
              item.colorSpecType.toString(),
              key: Key('${item.runtimeId}_colorSpecType'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.colorType => AppTableCellText(
              item.colorType.toString(),
              key: Key('${item.runtimeId}_colorType'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.verarbeitungsEbene => AppTableCellText(
              item.verarbeitungsEbene.toString(),
              key: Key('${item.runtimeId}_verarbeitungsEbene'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.printProcess => AppTableCellText(
              item.printProcess.toString(),
              key: Key('${item.runtimeId}_printProcess'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.colorName => ArtworkColorTableColorNameCell(
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
              key: Key('${item.runtimeId}_colorName'),
              customerId: customerId ?? 0,
              initialColor: item,
              onUpdate: null,
              onReset: null,
              currentColorProvider: dataProvider,
              readOnly: readOnly,
              navigatorKey: navigatorKey,
              disabled: true,
            ),
          ArtworkColorField.screenLineature => AppTableCellText(
              item.screenLineature.toString(),
              key: Key('${item.runtimeId}_screenLineature'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.screenAngle => AppTableCellText(
              item.screenAngle.toString(),
              key: Key('${item.runtimeId}_screenAngle'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.screenPointForm => AppTableCellText(
              item.screenPointForm.toString(),
              key: Key('${item.runtimeId}_screenPointForm'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.id => const SizedBox.shrink(),
          ArtworkColorField.colorPalette => AppTableCellText(
              item.colorPalette?.paletteName ?? '',
              key: Key('${item.runtimeId}_colorPalette'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.l => const SizedBox.shrink(),
          ArtworkColorField.a => const SizedBox.shrink(),
          ArtworkColorField.b => const SizedBox.shrink(),
          ArtworkColorField.move => const SizedBox.shrink(),
          ArtworkColorField.shortName => AppTableCellText(
              item.shortName,
              key: Key('${item.runtimeId}_shortName'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.color => AppTableCellColor(
              item.color ?? Colors.transparent,
              key: Key('${item.runtimeId}_color'),
              alignment: cellAlignment,
            ),
          ArtworkColorField.createdAt => const SizedBox.shrink(),
          ArtworkColorField.createdBy => const SizedBox.shrink(),
          ArtworkColorField.lastModifiedAt => const SizedBox.shrink(),
          ArtworkColorField.lastModifiedBy => const SizedBox.shrink(),
          ArtworkColorField.deletedAt => const SizedBox.shrink(),
          ArtworkColorField.isDraft => const SizedBox.shrink(),
        };
      },
    );
  }
}
