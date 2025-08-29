import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/product/config/product_log_fields.dart';
import 'package:elbdesk_prepress/src/product/config/product_log_provider.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

enum _ValueType {
  oldValue,
  newValue,
}

/// Table to display product master log entries
class ProductMasterLogTable extends HookConsumerWidget {
  const ProductMasterLogTable({
    required this.entityId,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
  });

  final int entityId;
  // final TableType tableType;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return AppTableView<ProductLogDTO, ProductLogField>(
      tableDefaultNamePlural: ppL10n.product_master_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      selfGrowable: true,
      fixedTableTitle: l10n.gen_history_complete,
      showTableViews: false,
      showToolbarDivider: true,
      availableFilterFieldsWithLabels: null,
      availableTableColumnsWithLabels: null,
      dataProvider: (sessionId) =>
          fetchProductLogsProvider(entityId, sessionId),
      tableDensity: AppTableDensity.compact,
      fieldFromKey: (fieldKey) => ProductLogFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ProductLogFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          ProductLogFields.fromEnum(field).cellAlignment,
      defaultTableConfig: _tableConfig,
      buildCell: (field, item) {
        return switch (field) {
          ProductLogField.field => AppTableCellText(
              item.field,
            ),
          ProductLogField.salesOrderCustomId => AppTableCellText(
              item.salesOrderCustomId.toString(),
            ),
          ProductLogField.oldValue => _buildValueCell(
              context,
              item.field,
              item.oldValue,
              _ValueType.oldValue,
            ),
          ProductLogField.newValue => _buildValueCell(
              context,
              item.field,
              item.newValue,
              _ValueType.newValue,
            ),
          ProductLogField.updatedAt => AppTableCellDateTime(
              item.updatedAt,
            ),
          ProductLogField.updatedBy => AppTableCellUser(
              item.updatedById,
            ),
          _ => AppTableCellText(
              item.field,
            ),
        };
      },
    );
  }

  Widget _buildValueCell(
    BuildContext context,
    String field,
    String value,
    _ValueType type,
  ) {
    // Handle different field types
    if (field == ProductField.productType.name) {
      return _Type(value: value);
    }

    // Default to text cell
    return AppTableCellText(value);
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
    final type = Parser.enumFromString(ProductType.values, value);
    final readable = type?.readable(ppL10n) ?? '';
    return AppTableCellText(readable);
  }
}

final _tableConfig = [
  TableFieldConfig(
    width: 150,
    fieldKey: ProductLogField.field.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ProductLogField.salesOrderCustomId.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ProductLogField.oldValue.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ProductLogField.newValue.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ProductLogField.updatedAt.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: ProductLogField.updatedBy.name,
  ),
];
