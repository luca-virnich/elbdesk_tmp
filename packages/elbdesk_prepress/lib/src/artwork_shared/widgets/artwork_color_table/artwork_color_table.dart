import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/config/artwork_color_fields.dart';
import 'package:elbdesk_prepress/src/artwork_color/extensions/artwork_color_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork_shared/config/artwork_color_table_default_columns.dart';
import 'package:elbdesk_prepress/src/prepress_color_palette/widgets/table/search_and_select_color_in_artwork_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_core/project_core.dart';

part 'artwork_color_table_color_name_cell.dart';

/// Customer Color Spec Table
///
/// The Table View for the Customer Color Spec Table
class ArtworkColorsTable extends HookConsumerWidget {
  const ArtworkColorsTable({
    required this.navigatorKey,
    required this.onCopy,
    required this.customerId,
    required this.dataProvider,
    required this.floatingWindowFocus,
    required this.sessionId,
    required this.onUpdateColorName,
    required this.onResetColorName,
    required this.onSelectColorSpecType,
    required this.onSelectColorType,
    required this.onSelectVerarbeitungsEbene,
    required this.onSelectPrintProcess,
    required this.onUpdateScreenLineature,
    required this.onUpdateScreenAngle,
    required this.onUpdateScreenPointForm,
    required this.onDelete,
    required this.onUpdateBoost,
    required this.onAddColor,
    required this.onMoveUp,
    required this.onMoveDown,
    required this.floatingWindowId,
    required this.onUpdateCustomText,
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

  final void Function(String runtimeId)? onDelete;
  final void Function(String runtimeId, double? boost)? onUpdateBoost;
  final void Function(String runtimeId, double? screenLineature)?
      onUpdateScreenLineature;
  final void Function(String runtimeId, double? screenAngle)?
      onUpdateScreenAngle;
  final void Function(String runtimeId, String? screenPointForm)?
      onUpdateScreenPointForm;
  final void Function(String runtimeId, String? screenPointForm)?
      onUpdateCustomText;
  final void Function(String runtimeId, ArtworkColorSpecType?)?
      onSelectColorSpecType;
  final void Function(String runtimeId, ArtworkColorType?)? onSelectColorType;
  final void Function(String runtimeId, ArtworkVerarbeitungsebeneType?)?
      onSelectVerarbeitungsEbene;
  final ProviderListenable<AsyncValue<List<ArtworkColor>>> dataProvider;
  final void Function(
    String runtimeId,
    ArtworkColor newColor,
  )? onUpdateColorName;
  final void Function(String runtimeId)? onResetColorName;
  final void Function(String runtimeId, ArtworkColorPrintProcessType?)?
      onSelectPrintProcess;
  final void Function()? onAddColor;
  final void Function(String runtimeId)? onMoveUp;
  final void Function(String runtimeId)? onMoveDown;
  final void Function(String runtimeId)? onCopy;
  final String floatingWindowId;
  final List<ArtworkColor>? colors;
  final ComponentIdentifier componentIdentifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    final dropdownFilterItems = useMemoized(
      () {
        return ArtworkColorFields.buildFilterDropdownItems(l10n, ppL10n);
      },
      [l10n, ppL10n],
    );

    return AppTableView<ArtworkColor, ArtworkColorField>(
      tableDefaultNamePlural: ppL10n.color_plural,
      showLoadingIndicatorOnRefresh: false,
      isHighlightable: false,
      fixedTableTitle: 'Farben'.hc,
      isSortable: false,
      showToolbarDivider: true,
      isResizable: false,
      showTableViews: false,
      tableViewIdentifier: componentIdentifier.name,
      selfGrowable: true,
      dropdownFilterItems: dropdownFilterItems,
      availableFilterFieldsWithLabels: null,
      availableTableColumnsWithLabels: null,
      toolbarTrailingActions: (sessionId) => [
        if (onAddColor != null && !readOnly)
          AddEntityInCardButton(
            onPressed: readOnly ? null : onAddColor,
            tooltip: ppL10n.artwork_add_color,
          ),
      ],
      defaultTableConfig:
          readOnly ? artworkColorTableConfigReadOnly : artworkColorTableConfig,
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
                Icon(AppIcons.expand_less, size: 20),
                SizedBox(width: 8),
                Icon(AppIcons.expand_more, size: 20),
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
        return switch (field) {
          ArtworkColorField.move => _MoveUpAndDownButtons(
              readOnly: readOnly,
              key: ValueKey('${item.runtimeId}_move'),
              onMoveUp: () {
                onMoveUp?.call(item.runtimeId);
              },
              onMoveDown: () {
                onMoveDown?.call(item.runtimeId);
              },
            ),
          ArtworkColorField.actions => readOnly
              ? const SizedBox.shrink()
              : _CopyAndRemoveButtons(
                  readOnly: readOnly,
                  key: ValueKey('${item.runtimeId}_actions'),
                  onCopy: () {
                    onCopy?.call(item.runtimeId);
                  },
                  onRemove: () {
                    onDelete?.call(item.runtimeId);
                  },
                ),
          ArtworkColorField.boost => AppTableCellInputField.double(
              key: Key('${item.runtimeId}_boost'),
              readOnly: readOnly,
              isDraggable: true,
              isDroppable: true,
              initialDouble: item.boost,
              onChanged: (v) {
                final asDouble = Parser.parseDouble(v);
                onUpdateBoost?.call(
                  item.runtimeId,
                  asDouble,
                );
              },
            ),
          ArtworkColorField.colorSpecType =>
            AppTableCellDropdownField<ArtworkColorSpecType>(
              key: Key('${item.runtimeId}_colorSpecType'),
              initialValue: item.colorSpecType?.readable(ppL10n),
              readOnly: readOnly,
              dropdownMenuEntries: ArtworkColorSpecType.values
                  .map(
                    (e) => NextDropdownMenuEntry(
                      value: e,
                      label: e.readable(ppL10n),
                    ),
                  )
                  .toList(),
              onSelected: (v) {
                onSelectColorSpecType?.call(item.runtimeId, v);
              },
            ),
          ArtworkColorField.colorType =>
            AppTableCellDropdownField<ArtworkColorType>(
              key: Key('${item.runtimeId}_colorType'),
              initialValue: item.colorType?.readable(ppL10n),
              readOnly: readOnly,
              dropdownMenuEntries: ArtworkColorType.values
                  .map(
                    (e) => NextDropdownMenuEntry(
                      value: e,
                      label: e.readable(ppL10n),
                    ),
                  )
                  .toList(),
              onSelected: (v) {
                onSelectColorType?.call(item.runtimeId, v);
              },
            ),
          ArtworkColorField.verarbeitungsEbene =>
            AppTableCellDropdownField<ArtworkVerarbeitungsebeneType>(
              key: Key('${item.runtimeId}_verarbeitungsEbene'),
              initialValue: item.verarbeitungsEbene?.readable(ppL10n),
              onSelected: (v) {
                onSelectVerarbeitungsEbene?.call(item.runtimeId, v);
              },
              dropdownMenuEntries: ArtworkVerarbeitungsebeneType.values
                  .map(
                    (e) => NextDropdownMenuEntry(
                      value: e,
                      label: e.readable(ppL10n),
                    ),
                  )
                  .toList(),
              readOnly: readOnly,
            ),
          ArtworkColorField.printProcess =>
            AppTableCellDropdownField<ArtworkColorPrintProcessType>(
              key: Key('${item.runtimeId}_printProcess'),
              initialValue: item.printProcess?.readable(ppL10n),
              onSelected: (v) {
                onSelectPrintProcess?.call(item.runtimeId, v);
              },
              dropdownMenuEntries: ArtworkColorPrintProcessType.values
                  .map(
                    (e) => NextDropdownMenuEntry(
                      value: e,
                      label: e.readable(ppL10n),
                    ),
                  )
                  .toList(),
              readOnly: readOnly,
            ),
          ArtworkColorField.colorName => ArtworkColorTableColorNameCell(
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
              key: Key('${item.runtimeId}_colorName'),
              customerId: customerId ?? 0,
              initialColor: item,
              onUpdate: onUpdateColorName,
              onReset: onResetColorName,
              currentColorProvider: dataProvider,
              readOnly: readOnly,
              navigatorKey: navigatorKey,
            ),
          ArtworkColorField.screenLineature => AppTableCellInputField.double(
              readOnly: readOnly,
              isDraggable: true,
              isDroppable: true,
              key: Key('${item.runtimeId}_screenLineature'),
              initialDouble: item.screenLineature,
              validator: (v) {
                if (v == null) return null;
                if (v.trim().isEmpty) return null;
                final asDouble = Parser.parseDouble(v);
                if (asDouble == null) {
                  return l10n.validation_please_enter_a_number;
                }
                return null;
              },
              onChanged: (v) {
                final asDouble = Parser.parseDouble(v);
                onUpdateScreenLineature?.call(
                  item.runtimeId,
                  asDouble,
                );
              },
            ),
          ArtworkColorField.screenAngle => AppTableCellInputField.double(
              key: Key('${item.runtimeId}_screenAngle'),
              isDraggable: true,
              isDroppable: true,
              readOnly: readOnly,
              initialDouble: item.screenAngle,
              validator: (v) {
                if (v == null) return null;
                if (v.trim().isEmpty) return null;
                final asInt = double.tryParse(v);
                if (asInt == null) return l10n.validation_please_enter_a_number;
                return null;
              },
              onChanged: (v) {
                final asDouble = Parser.parseDouble(v);
                onUpdateScreenAngle?.call(
                  item.runtimeId,
                  asDouble,
                );
              },
            ),
          ArtworkColorField.screenPointForm => AppTableCellInputField.text(
              key: Key('${item.runtimeId}_screenPointForm'),
              isDraggable: true,
              isDroppable: true,
              initialText: item.screenPointForm,
              readOnly: readOnly,
              validator: (v) {
                return null;
              },
              onChanged: (v) {
                onUpdateScreenPointForm?.call(
                  item.runtimeId,
                  v,
                );
              },
            ),
          ArtworkColorField.customText => AppTableCellInputField.text(
              key: Key('${item.runtimeId}_customText'),
              initialText: item.customText,
              readOnly: readOnly,
              validator: (v) {
                return null;
              },
              onChanged: (v) {
                onUpdateCustomText?.call(
                  item.runtimeId,
                  v,
                );
              },
              onFieldSubmitted: (p0) {
                if (!readOnly) {
                  onAddColor?.call();
                  Future.delayed(const Duration(milliseconds: 500), () {
                    if (context.mounted) {
                      FocusScope.of(context).nextFocus();
                    }
                  });
                }
              },
            ),
          ArtworkColorField.id => const SizedBox.shrink(),
          ArtworkColorField.colorPalette => const SizedBox.shrink(),
          ArtworkColorField.l => const SizedBox.shrink(),
          ArtworkColorField.a => const SizedBox.shrink(),
          ArtworkColorField.b => const SizedBox.shrink(),
          ArtworkColorField.shortName => const SizedBox.shrink(),
          ArtworkColorField.color => const SizedBox.shrink(),
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

class _MoveUpAndDownButtons extends StatelessWidget {
  const _MoveUpAndDownButtons({
    required this.onMoveUp,
    required this.onMoveDown,
    super.key,
    this.readOnly = false,
  });

  final bool readOnly;
  final void Function() onMoveUp;
  final void Function() onMoveDown;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppIconButton.blank(
          skipTraversal: true,
          onPressed: readOnly ? null : onMoveUp,
          iconData: AppIcons.expand_less,
        ),
        AppIconButton.blank(
          skipTraversal: true,
          onPressed: readOnly ? null : onMoveDown,
          iconData: AppIcons.expand_more,
        ),
      ],
    );
  }
}

class _CopyAndRemoveButtons extends StatelessWidget {
  const _CopyAndRemoveButtons({
    required this.readOnly,
    required this.onCopy,
    required this.onRemove,
    super.key,
  });
  final bool readOnly;

  final void Function() onCopy;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          width: 4,
        ),
        AppIconButton.secondary(
          skipTraversal: true,
          onPressed: readOnly ? null : onCopy,
          iconData: AppIcons.copyItem,
        ),
        const SizedBox(width: UiConstants.elementMargin),
        AppIconButton.danger(
          skipTraversal: true,
          onPressed: readOnly ? null : onRemove,
          iconData: AppIcons.delete,
        ),
      ],
    );
  }
}
