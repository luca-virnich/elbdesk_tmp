import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_print_process_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork/extensions/artwork_type_ext.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/config/artwork_quarantine_group_fields.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_status_extension.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_type_extension.dart';
import 'package:elbdesk_prepress/src/product/extensions/product_type_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Possible types of the Artwork Quarantine Group Table
enum _Type {
  byCustomer,
  standard,
  todo,
}

/// Artwork Quarantine Group Table Widget
class ArtworkQuarantineGroupTable extends HookConsumerWidget {
  /// Standard Groups constructor
  ArtworkQuarantineGroupTable.standard({
    required this.componentIdentifier,
    required this.floatingWindowId,
    required FocusNode this.floatingWindowFocus,
    required this.navigatorKey,
    this.toolbarPadding,
    super.key,
    this.initialFilter,
    this.hiddenFilterGroup,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.isCollapsible = true,
  })  : customerId = null,
        defaultTableConfig = ArtworkQuarantineGroupFields.defaultTableColumns,
        showToolbarDivider = true,
        showWhenEmpty = true,
        showTableViews = true,
        showTableName = true,
        selfGrowable = false,
        toolbarTrailingActions = null,
        fixedTableName = null,
        isResizable = true,
        _type = _Type.standard;

  /// TO DO Groups constructor
  ArtworkQuarantineGroupTable.todo({
    required this.componentIdentifier,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    this.toolbarPadding,
    super.key,
    this.initialFilter,
    this.hiddenFilterGroup,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.isCollapsible = true,
  })  : customerId = null,
        defaultTableConfig = ArtworkQuarantineGroupFields.defaultTableColumns,
        showToolbarDivider = true,
        showWhenEmpty = true,
        showTableViews = true,
        showTableName = true,
        selfGrowable = false,
        toolbarTrailingActions = null,
        fixedTableName = null,
        isResizable = true,
        _type = _Type.todo;

  ArtworkQuarantineGroupTable.byCustomer({
    required this.toolbarTrailingActions,
    required this.customerId,
    required this.navigatorKey,
    required FocusNode this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
    this.initialFilter,
    this.fixedTableName,
    this.toolbarPadding,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.hiddenFilterGroup,
  })  : showTableViews = false,
        showTableName = true,
        defaultTableConfig = ArtworkQuarantineGroupFields.defaultTableColumns,
        selfGrowable = false,
        isResizable = true,
        showToolbarDivider = true,
        showWhenEmpty = true,
        _type = _Type.byCustomer;

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity tableDensity;
  final bool isCollapsible;
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
  final ComponentIdentifier componentIdentifier;
  final EdgeInsets? toolbarPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    final initialFilter = useMemoized(
      () {
        return Filter(
          filterGroups: [
            FilterGroup(
              nextOperator: FilterOperator.and,
              filters: [
                FilterField(
                  fieldKey: ArtworkQuarantineGroupField.status.name,
                  value: ArtworkQuarantineGroupStatus.todo.name,
                  type: FilterType.equal,
                  fieldType: FilterFieldType.text,
                  filterOperator: FilterOperator.and,
                  uuid: const Uuid().v4(),
                ),
              ],
            ),
          ],
        );
      },
      [_type],
    );

    return AppTableView<ArtworkQuarantineGroup, ArtworkQuarantineGroupField>(
      tableDefaultNamePlural: ppL10n.artwork_quarantine_group_plural,
      isCollapsible: isCollapsible,
      showWhenEmpty: showWhenEmpty,
      tableViewIdentifier: componentIdentifier.name,
      initialFilter: initialFilter,
      showToolbarDivider: showToolbarDivider,
      selfGrowable: selfGrowable,
      isResizable: isResizable,
      isHighlightable: true,
      fixedTableTitle: fixedTableName,
      quickSearchFilterFields:
          ArtworkQuarantineGroupField.values.quickSearchFilters(l10n, ppL10n),
      hiddenFilterGroup: hiddenFilterGroup,
      showTableViews: showTableViews,
      toolbarPadding: toolbarPadding ?? EdgeInsets.zero,
      availableFilterFieldsWithLabels:
          ArtworkQuarantineGroupField.values.filters(l10n, ppL10n),
      availableTableColumnsWithLabels: !showTableViews
          ? null
          : ArtworkQuarantineGroupField.values.columns(l10n, ppL10n),
      toolbarTrailingActions: (sessionId) => [
        ...?toolbarTrailingActions?.call(sessionId),
        if (_type == _Type.byCustomer)
          _AddArtworkQuarantineGroupButton(
            navigatorKey: navigatorKey!,
            floatingWindowId: floatingWindowId!,
            floatingWindowFocus: floatingWindowFocus!,
            customerId: customerId,
            sessionId: sessionId,
          ),
      ],
      defaultTableConfig: defaultTableConfig,
      tableDensity: tableDensity,
      dataProvider: (sessionId) {
        return switch (_type) {
          _Type.standard => findArtworkQuarantineGroupsProvider(sessionId),
          _Type.byCustomer =>
            watchArtworkQuarantineGroupsByCustomerProvider(customerId!),
          // _Type.todo => watchArtworkQuarantineGroupsByStatusProvider(
          //     ArtworkQuarantineGroupStatus.todo,
          //   ),
          _Type.todo => findArtworkQuarantineGroupsProvider(sessionId),
        };
      },
      isSortable: false,
      fieldFromKey: (fieldKey) =>
          ArtworkQuarantineGroupFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ArtworkQuarantineGroupFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          ArtworkQuarantineGroupFields.fromEnum(field).cellAlignment,
      onRowTap: (artworkQuarantineGroup) {
        // Open ArtworkQuarantineGroupCard via floating window
        ref.openWindow(
          FloatingArtworkQuarantineGroupWindowData(
            groupId: artworkQuarantineGroup.meta.id,
            customerId: customerId,
          ),
        );
      },
      buildCell: (field, item) {
        final isDraft = item.meta.isDraft;

        final cellAlignment =
            ArtworkQuarantineGroupFields.fromEnum(field).cellAlignment;

        return switch (field) {
          ArtworkQuarantineGroupField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment: cellAlignment,
              italic: isDraft,
            ),
          ArtworkQuarantineGroupField.status => AppTableCellText(
              leadingIconData: item.status.icon,
              leadingIconColor: item.status.color,
              item.status.readable(ppL10n),
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.type => AppTableCellText(
              item.type?.readable(ppL10n) ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.selectedProductSeriesId =>
            AppTableCellText(
              item.selectedProductSeriesId?.toString(),
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.outputPath => AppTableCellText(
              item.outputPath,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.attachments => AppTableCellText(
              item.attachments?.join(', '),
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.customer => AppTableCellText(
              item.customer?.contact?.general.name ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.artworkType => AppTableCellText(
              item.artworkType?.readable(ppL10n) ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.productType => AppTableCellText(
              item.productType?.readable(ppL10n) ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.printProcessType => AppTableCellText(
              item.printProcessType?.readable(ppL10n) ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.width => AppTableCellNum(
              item.width,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.height => AppTableCellNum(
              item.height,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.cornerRadius => AppTableCellNum(
              item.cornerRadius,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.description => AppTableCellText(
              item.description,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.assignedUser => AppTableCellUser(
              item.assignedUser?.userInfoId,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.sendToAeAt => AppTableCellDateTime(
              item.sendToAeAt,
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.artworkQuarantines => AppTableCellText(
              item.artworkQuarantines?.join(', ') ?? '',
              alignment: cellAlignment,
            ),
          ArtworkQuarantineGroupField.sendToAeBy => const SizedBox(),
        };
      },
    );
  }
}

// Add artwork quarantine group button
class _AddArtworkQuarantineGroupButton extends ConsumerWidget {
  const _AddArtworkQuarantineGroupButton({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.sessionId,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  final int? customerId;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return AddEntityInCardButton(
      tooltip: l10n.gen_add_entity(l10n.data_import),
      onPressed: () async {
        ref.openWindow(
          FloatingArtworkQuarantineGroupWindowData(
            groupId: null,
            customerId: customerId,
          ),
        );
      },
    );
  }
}
