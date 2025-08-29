import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import '../config/floating_{{#snakeCase}}{{feature_name}}{{/snakeCase}}_window_data.dart';
import '../config/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_table_default_columns.dart';
import '../extensions/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_field_ext.dart';
import '../models/{{#snakeCase}}{{feature_name}}{{/snakeCase}}.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Defines the different variants of the {{#pascalCase}}{{feature_name}}{{/pascalCase}} table
enum _Type {
  standard,
}

/// {{#pascalCase}}{{feature_name}}{{/pascalCase}} Table Widget
class {{#pascalCase}}{{feature_name}}{{/pascalCase}}Table extends HookConsumerWidget {
  /// Standard {{#pascalCase}}{{feature_name}}{{/pascalCase}} constructor
  /// 
  /// Used to display the standard {{#pascalCase}}{{feature_name}}{{/pascalCase}} table
  {{#pascalCase}}{{feature_name}}{{/pascalCase}}Table.all({
    required this.collapsibleIdentifier,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    super.key,
    this.initialFilter,
    this.hiddenFilterGroup,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
  })  : customerId = null,
        defaultTableConfig = {{#camelCase}}{{feature_name}}{{/camelCase}}TableDefaultColumns,
        showToolbarDivider = true,
        showWhenEmpty = true,
        showTableViews = true,
        showTableName = true,
        selfGrowable = false,
        toolbarTrailingActions = null,
        fixedTableName = null,
        isResizable = true,
        _type = _Type.standard;

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity tableDensity;

  final bool readOnly;
  final int? customerId;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;
  final bool showTableViews;
  final bool showTableName;
  final String? fixedTableName;
  final bool selfGrowable;
  final List<Widget> Function(String sessionId)? toolbarTrailingActions;
  final List<TableFieldConfig> defaultTableConfig;
  final _Type _type;
  final bool isResizable;
  final GlobalKey<NavigatorState>? navigatorKey;
  final bool showToolbarDivider;
  final bool showWhenEmpty;
  final CollapsibleIdentifier? collapsibleIdentifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final sessionId = useUuid();

    return AppTableView<{{#pascalCase}}{{feature_name}}{{/pascalCase}}, {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field>(
      sessionId: sessionId,
      showWhenEmpty: showWhenEmpty,
      collapsibleIdentifier: collapsibleIdentifier,
      showToolbarDivider: showToolbarDivider,
      selfGrowable: selfGrowable,
      isResizable: isResizable,
      isHighlightable: true,
      fixedTableTitle: fixedTableName,
      hiddenFilterGroup: hiddenFilterGroup,
      showTableViews: showTableViews,
      availableFilterFieldsWithLabels:
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.values.filterableWithLabels(l10n),
      availableTableColumnsWithLabels: !showTableViews
          ? null
          : {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.values.tableColumnsWithLabels(l10n),
      toolbarTrailingActions: (sessionId) => [
        ...?toolbarTrailingActions?.call(sessionId),
      ],
      tableType: TableType.{{#camelCase}}{{feature_name}}{{/camelCase}},
      defaultTableConfig: {{#camelCase}}{{feature_name}}{{/camelCase}}TableDefaultColumns,
      tableDensity: tableDensity,
      dataProvider: (_) {
        return switch (_type) {
          _Type.standard => find{{#pascalCase}}{{feature_name}}{{/pascalCase}}sProvider(sessionId),
        };
      },
      fieldFromKey: (fieldKey) =>
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper.fromFieldKey(fieldKey).field,
      buildCellTitle: (field) => {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper(field).readable(l10n),
      getTitleAlignment: (field) =>
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}FieldWrapper(field).cellAlignment,
      onRowTap: (item) {},
      buildCell: (field, item) {
        return switch (field) {
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.name => AppTableCellTextButton(
              item.name,
              onPressed: customerId == null
                  ? null
                  : () {
                      ref
                          .read(floatingWindowDataStateProvider.notifier)
                          .addWindow(
                            Floating{{#pascalCase}}{{feature_name}}{{/pascalCase}}WindowData(
                              entityId: item.meta.id,
                              customerId: customerId!,
                            ),
                          );
                    },
            ),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.description => AppTableCellText(
              item.description,
            ),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.id => AppTableCellText(
              item.meta.id.toString(),
            ),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdAt => const SizedBox(),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.createdBy => const SizedBox(),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedAt => const SizedBox(),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.lastModifiedBy => const SizedBox(),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.deletedAt => const SizedBox(),
          {{#pascalCase}}{{feature_name}}{{/pascalCase}}Field.isDraft => const SizedBox(),
        };
      },
    );
  }
} 
