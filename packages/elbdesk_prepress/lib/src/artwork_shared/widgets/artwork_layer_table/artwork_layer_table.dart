import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/models/artwork_layer.dart';
import 'package:elbdesk_prepress/src/artwork_shared/config/artwork_layer_fields.dart';
import 'package:elbdesk_prepress/src/artwork_shared/extensions/artwork_layer_type_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Artwork Layer Table
///
/// A table that displays the layers of an artwork
/// Layers could be different colors or specific settings for the print
/// process
///
/// Example:
/// Layer: Magenta
/// Layer: Cyan
/// Layer: Black
/// Layer: Die Cutter
///
class ArtworkLayerTable extends HookConsumerWidget {
  const ArtworkLayerTable({
    required this.sessionId,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.dataProvider,
    required this.onDelete,
    required this.onUpdateName,
    required this.onSelectLayerType,
    required this.onUpdatePrintable,
    required this.onMoveUp,
    required this.onMoveDown,
    required this.onAddLayer,
    required this.onUpdateLocked,
    required this.readOnly,
    required this.componentIdentifier,
    super.key,
  });

  final String sessionId;

  final bool readOnly;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;
  // final ArtworkTemplateState stateNotifier;
  final void Function(String runtimeId)? onDelete;
  final void Function(String runtimeId, String name)? onUpdateName;

  final void Function(String runtimeId, ArtworkLayerType?)? onSelectLayerType;
  final void Function(String runtimeId, bool value)? onUpdatePrintable;
  final void Function(String runtimeId, bool value)? onUpdateLocked;
  final void Function(String runtimeId)? onMoveUp;
  final void Function(String runtimeId)? onMoveDown;
  final ProviderListenable<AsyncValue<List<ArtworkLayer>>> dataProvider;
  final void Function()? onAddLayer;
  final ComponentIdentifier componentIdentifier;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return AppTableView<ArtworkLayer, ArtworkLayerField>(
      tableDefaultNamePlural: ppL10n.artwork_layer_plural,
      selfGrowable: true,
      isHighlightable: false,
      showToolbarDivider: true,
      isResizable: false,
      isSortable: false,
      tableViewIdentifier: componentIdentifier.name,
      fixedTableTitle: ppL10n.layers,
      showTableViews: false,
      availableFilterFieldsWithLabels: null,
      availableTableColumnsWithLabels: null,
      toolbarTrailingActions: (sessionId) => [
        if (onAddLayer != null && !readOnly)
          AddEntityInCardButton(
            onPressed: readOnly ? null : onAddLayer,
            tooltip: ppL10n.artwork_add_layer,
          ),
      ],
      defaultTableConfig: readOnly ? _defaultColumnsReadOnly : _defaultColumns,
      tableDensity: AppTableDensity.compact,
      dataProvider: (sessionId) => dataProvider,
      fieldFromKey: (fieldKey) =>
          ArtworkLayerFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ArtworkLayerFields.fromEnum(field).readable(l10n, ppL10n),
      buildCellTitleWidget: (field) {
        return switch (field) {
          ArtworkLayerField.move => const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(AppIcons.expand_less, size: 20),
                SizedBox(width: 8),
                Icon(AppIcons.expand_more, size: 20),
              ],
            ),
          _ => AppTableTitleText(
              ArtworkLayerFields.fromEnum(field).readable(l10n, ppL10n),
              alignment: ArtworkLayerFields.fromEnum(field).cellAlignment,
            ),
        };
      },
      getTitleAlignment: (field) =>
          ArtworkLayerFields.fromEnum(field).cellAlignment,
      onRowTap: (item) {},
      buildCell: (field, item) {
        return switch (field) {
          ArtworkLayerField.id => const SizedBox.shrink(),
          ArtworkLayerField.move => _MoveUpAndDownButtons(
              readOnly: readOnly,
              key: ValueKey('${item.runtimeId}_move'),
              onMoveUp: () {
                onMoveUp?.call(item.runtimeId);
              },
              onMoveDown: () {
                onMoveDown?.call(item.runtimeId);
              },
            ),
          ArtworkLayerField.layerType =>
            AppTableCellDropdownField<ArtworkLayerType>(
              readOnly: readOnly,
              key: ValueKey('${item.runtimeId}_layerType'),
              dropdownMenuEntries: ArtworkLayerType.values
                  .map(
                    (e) => NextDropdownMenuEntry(
                      value: e,
                      label: e.readable(ppL10n),
                    ),
                  )
                  .toList(),
              onSelected: (value) {
                onSelectLayerType?.call(
                  item.runtimeId,
                  value,
                );
              },
              initialValue: item.layerType?.readable(ppL10n),
            ),
          ArtworkLayerField.layerName => AppTableCellInputField.text(
              readOnly: readOnly,
              key: ValueKey('${item.runtimeId}_layerName'),
              initialText: item.layerName,
              onChanged: (value) {
                onUpdateName?.call(item.runtimeId, value);
              },
              floatingWindowId: floatingWindowId,
              navigatorKey: navigatorKey,
              floatingWindowFocus: floatingWindowFocus,
            ),
          ArtworkLayerField.printable => _AppCellPrintable(
              runtimeId: item.runtimeId,
              initialValue: item.printable,
              onUpdate: onUpdatePrintable,
              dataProvider: dataProvider,
              readOnly: readOnly,
            ),
          ArtworkLayerField.locked => _AppCellLocked(
              runtimeId: item.runtimeId,
              initialValue: item.locked,
              onUpdate: onUpdateLocked,
              dataProvider: dataProvider,
              readOnly: readOnly,
            ),
          ArtworkLayerField.actions => _DeleteButton(
              readOnly: readOnly,
              key: ValueKey('${item.runtimeId}_actions'),
              onRemove: () {
                onDelete?.call(item.runtimeId);
              },
            ),
        };
      },
    );
  }
}

class _DeleteButton extends StatelessWidget {
  const _DeleteButton({
    required this.onRemove,
    required this.readOnly,
    super.key,
  });

  final VoidCallback onRemove;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: AppIconButton.danger(
        skipTraversal: true,
        onPressed: readOnly ? null : onRemove,
        iconData: AppIcons.delete,
      ),
    );
  }
}

class _AppCellPrintable extends ConsumerWidget {
  const _AppCellPrintable({
    required this.initialValue,
    required this.onUpdate,
    required this.dataProvider,
    required this.runtimeId,
    required this.readOnly,
  });
  final bool initialValue;
  final String runtimeId;

  final void Function(
    String runtimeId,
    bool value,
  )? onUpdate;

  final bool readOnly;

  final ProviderListenable<AsyncValue<List<ArtworkLayer>>> dataProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      dataProvider.select(
        (value) =>
            value.requireValue
                .firstWhereOrNull(
                  (element) => element.runtimeId == runtimeId,
                )
                ?.printable ??
            false,
      ),
    );
    return AppTableCellInputBool(
      key: ValueKey('${runtimeId}_printable'),
      value: isSelected,
      onChanged: (value) {
        onUpdate?.call(runtimeId, value);
      },
      readOnly: readOnly,
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

class _AppCellLocked extends ConsumerWidget {
  const _AppCellLocked({
    required this.initialValue,
    required this.onUpdate,
    required this.dataProvider,
    required this.runtimeId,
    required this.readOnly,
  });
  final bool initialValue;
  final String runtimeId;

  final void Function(
    String runtimeId,
    bool value,
  )? onUpdate;

  final bool readOnly;

  final ProviderListenable<AsyncValue<List<ArtworkLayer>>> dataProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      dataProvider.select(
        (value) =>
            value.requireValue
                .firstWhereOrNull(
                  (element) => element.runtimeId == runtimeId,
                )
                ?.locked ??
            false,
      ),
    );
    return AppTableCellInputBool(
      key: ValueKey('${runtimeId}_locked'),
      value: isSelected,
      onChanged: (value) {
        onUpdate?.call(runtimeId, value);
      },
      readOnly: readOnly,
    );
  }
}

final _defaultColumns = [
  TableFieldConfig(
    width: 60,
    fieldKey: ArtworkLayerField.move.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLayerField.layerName.name,
  ),
  TableFieldConfig(
    width: 120,
    fieldKey: ArtworkLayerField.layerType.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLayerField.printable.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLayerField.locked.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLayerField.actions.name,
  ),
];

final _defaultColumnsReadOnly = [
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLayerField.layerName.name,
  ),
  TableFieldConfig(
    width: 120,
    fieldKey: ArtworkLayerField.layerType.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLayerField.printable.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLayerField.locked.name,
  ),
];
