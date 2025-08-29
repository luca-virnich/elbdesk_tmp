import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/app_table_cell_artwork_colors.dart';
import 'package:elbdesk_prepress/src/artwork/config/artwork_fields.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_log_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

enum _ValueType {
  oldValue,
  newValue,
}

class ArtworkMasterLogTable extends HookConsumerWidget {
  const ArtworkMasterLogTable({
    required this.entityId,
    required this.tableType,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
  });

  final int entityId;
  final TableType tableType;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return AppTableView<ArtworkLogDTO, ArtworkLogField>(
      tableDefaultNamePlural: 'Log'.hc,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      selfGrowable: true,
      fixedTableTitle: l10n.gen_history_complete,
      showTableViews: false,
      showToolbarDivider: true,
      availableFilterFieldsWithLabels: null,
      availableTableColumnsWithLabels: null,
      toolbarPadding: const EdgeInsets.only(right: UiConstants.defaultPadding),
      dataProvider: (sessionId) =>
          fetchArtworkLogsProvider(entityId, sessionId),
      tableDensity: AppTableDensity.compact,
      fieldFromKey: (fieldKey) =>
          ArtworkLogFieldWrapper.fromFieldKey(fieldKey).field,
      buildCellTitle: (field) =>
          ArtworkLogFieldWrapper(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) => ArtworkLogFieldWrapper(field).cellAlignment,
      defaultTableConfig: _tableConfig,
      buildCell: (field, item) {
        return switch (field) {
          ArtworkLogField.field => _Field(field: item.field),
          ArtworkLogField.salesOrderCustomId => AppTableCellText(
              item.salesOrderCustomId.toString(),
            ),
          ArtworkLogField.updatedAt => AppTableCellDateTime(
              item.updatedAt,
            ),
          ArtworkLogField.updatedBy => AppTableCellUser(
              item.updatedById,
            ),
          ArtworkLogField.salesOrderId => AppTableCellText(
              item.salesOrderId.toString(),
            ),
          ArtworkLogField.oldValue => _ValueField(
              item: item,
              valueType: _ValueType.oldValue,
            ),
          ArtworkLogField.newValue => _ValueField(
              item: item,
              valueType: _ValueType.newValue,
            ),
          _ => AppTableCellText(
              item.field,
            ),
        };
      },
    );
  }
}

class _Field extends HookWidget {
  const _Field({
    required this.field,
  });
  final String field;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return AppTableCellText(
      ArtworkFields.fromFieldKey(field).readable(l10n, ppL10n),
    );
  }
}

class _ValueField extends StatelessWidget {
  const _ValueField({
    required this.item,
    required this.valueType,
  });

  final ArtworkLogDTO item;

  final _ValueType valueType;

  @override
  Widget build(BuildContext context) {
    final v = valueType == _ValueType.newValue ? item.newValue : item.oldValue;
    if (item.field == ArtworkField.colors.name) {
      return _Colors(value: v);
    }
    if (item.field == ArtworkField.layers.name) {
      return _Layers(value: v);
    }
    if (item.field == ArtworkField.codes.name) {
      return _Codes(value: v);
    }
    if (item.field == ArtworkField.artworkType.name) {
      return _Type(
        value: v,
      );
    }
    return AppTableCellText(v);
  }
}

class _Type extends StatelessWidget {
  const _Type({
    required this.value,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    final type = Parser.enumFromString(ArtworkType.values, value);
    final readable = type?.readable(ppL10n) ?? '';
    return AppTableCellText(readable);
  }
}

class _Layers extends HookWidget {
  const _Layers({
    required this.value,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    final layerLength = useMemoized(() {
      try {
        final jsonList = jsonDecode(value) as List;
        return jsonList.length;
      } catch (e) {
        dlog('Error parsing layers: $e');
        return 0;
      }
    });

    return AppTableCellText(layerLength.toString());
  }
}

class _Codes extends HookWidget {
  const _Codes({
    required this.value,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    final codeLength = useMemoized(() {
      try {
        final jsonList = jsonDecode(value) as List;
        return jsonList.length;
      } catch (e) {
        dlog('Error parsing codes: $e');
        return 0;
      }
    });

    return AppTableCellText(codeLength.toString());
  }
}

class _Colors extends StatelessWidget {
  const _Colors({
    required this.value,
  });
  final String value;

  @override
  Widget build(BuildContext context) {
    final colorList = <ArtworkColor>[];
    try {
      final jsonList = jsonDecode(value) as List;
      for (final colorJson in jsonList) {
        final colorMap = colorJson as Map<String, dynamic>;

        colorList.add(
          ArtworkColor(
            customText: colorMap['customText'] as String?,
            colorName: colorMap['colorName'] as String,
            shortName: colorMap['shortName'] as String,
            l: (colorMap['l'] as num).toDouble(),
            a: (colorMap['a'] as num).toDouble(),
            b: (colorMap['b'] as num).toDouble(),
            color: Color(int.parse(colorMap['color'] as String, radix: 16)),
            colorPalette: null,
            colorType: null,
            colorSpecType: null,
            verarbeitungsEbene: null,
            printProcess: null,
            screenPointForm: colorMap['screenPointForm'] as String?,
            screenLineature: (colorMap['screenLineature'] as num?)?.toDouble(),
            screenAngle: (colorMap['screenAngle'] as num?)?.toDouble(),
            boost: (colorMap['boost'] as num?)?.toDouble(),
            meta: DataMeta(
              id: colorMap['id'] as int,
              createdAt: DateTime.parse(colorMap['createdAt'] as String),
              isDraft: colorMap['isDraft'] as bool,
              lastModifiedAt: null,
              lastModifiedById: null,
              editingSessionId: null,
              createdById: null,
              editingSince: null,
              editingById: null,
              deletedById: null,
              deletedAt: null,
            ),
            runtimeId: const Uuid().v4(),
          ),
        );
      }
    } catch (e) {
      dlog('Error parsing colors: $e');
    }

    // TODO(tk): Is this still relevant?
    // this is a array string of colors, i need the parts in a list
    dlog(colorList);
    // final colorList =
    //     colors.map((color) => PrepressColor.fromLogString(color)).toList();

    return AppTableCellArtworkColors(
      colors: colorList,
    );
  }
}

final _tableConfig = [
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLogField.field.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLogField.salesOrderCustomId.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLogField.oldValue.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLogField.newValue.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLogField.updatedAt.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ArtworkLogField.updatedBy.name,
  ),
];
