import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/widgets/color_table/prepress_color_import_area.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// Possible types of the PrepressColorPaletteTable
enum _Type {
  standard,
  byCustomer,
}

/// Color Book Table
///
/// The Table View for the Color Book Table
class PrepressColorPaletteTable extends HookConsumerWidget {
  /// Standard constructor for general color palette view
  PrepressColorPaletteTable.standard({
    required this.componentIdentifier,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
    this.initialFilter,
    this.isCollapsible = true,
    this.availableFilterFieldsWithLabels,
    this.tableDensity = AppTableDensity.standard,
    this.toolbarPadding =
        const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
    this.readOnly = false,
  })  : customerId = null,
        defaultColumns = PrepressColorPaletteFields.defaultTableColumns,
        showToolbarDivider = true,
        showTableViews = false,
        fixedTableTitle = false,
        _type = _Type.standard;

  /// Constructor for customer-specific color palette view
  const PrepressColorPaletteTable.byCustomer({
    required this.customerId,
    required this.componentIdentifier,
    required this.navigatorKey,
    required this.floatingWindowId,
    super.key,
    this.initialFilter,
    this.availableFilterFieldsWithLabels,
    this.tableDensity = AppTableDensity.standard,
    this.readOnly = false,
    this.isCollapsible = false,
    this.defaultColumns,
    this.toolbarPadding = EdgeInsets.zero,
  })  : showToolbarDivider = true,
        showTableViews = false,
        fixedTableTitle = true,
        _type = _Type.byCustomer;

  final Filter? initialFilter;
  final AppTableDensity tableDensity;
  final bool readOnly;

  final int? customerId;
  final List<TableFieldConfig>? defaultColumns;
  final bool showToolbarDivider;
  final Map<PrepressColorPaletteField, TableFieldData>?
      availableFilterFieldsWithLabels;
  final bool showTableViews;
  final bool fixedTableTitle;
  final ComponentIdentifier componentIdentifier;
  final GlobalKey<NavigatorState> navigatorKey;
  final EdgeInsetsGeometry toolbarPadding;
  final String floatingWindowId;
  final bool isCollapsible;
  final _Type _type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    return AppTableView<PrepressColorPalette, PrepressColorPaletteField>(
      tableDefaultNamePlural: ppL10n.color_palette_plural,
      tableViewIdentifier: componentIdentifier.name,
      fixedTableTitle: fixedTableTitle ? ppL10n.color_palette_plural : null,
      showToolbarDivider: showToolbarDivider,
      showTableViews: showTableViews,
      isCollapsible: isCollapsible,
      toolbarPadding: toolbarPadding,
      hiddenFilterGroup: customerId == null
          ? null
          : FilterGroup(
              filters: [
                FilterField(
                  fieldKey: PrepressColorPaletteField.customerId.name,
                  value: customerId!.toString(),
                  type: FilterType.equal,
                  fieldType: FilterFieldType.number,
                  uuid: const Uuid().v4(),
                  filterOperator: FilterOperator.and,
                ),
              ],
              nextOperator: FilterOperator.and,
            ),
      availableFilterFieldsWithLabels: availableFilterFieldsWithLabels ??
          PrepressColorPaletteField.values.filters(l10n, ppL10n),
      availableTableColumnsWithLabels:
          PrepressColorPaletteField.values.columns(l10n, ppL10n),
      toolbarTrailingActions: (sessionId) => [
        _AddColorBookButton(
          tableType: _type,
          customerId: customerId,
          floatingWindowId: floatingWindowId,
          useSmallButton: tableDensity == AppTableDensity.compact,
          readOnly: readOnly,
          navigatorKey: navigatorKey,
        ),
      ],
      defaultTableConfig:
          defaultColumns ?? PrepressColorPaletteFields.defaultTableColumns,
      tableDensity: tableDensity,
      dataProvider: findPrepressColorPalettesProvider.call,
      fieldFromKey: (fieldKey) =>
          PrepressColorPaletteFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          PrepressColorPaletteFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          PrepressColorPaletteFields.fromEnum(field).cellAlignment,
      onRowTap: (item) {
        ref.openWindow(
          FloatingPrepressColorPaletteWindowData(
            colorPaletteId: item.meta.id,
            customerId: customerId,
          ),
        );
      },
      buildCell: (field, item) {
        final isDraft = item.meta.isDraft;

        return switch (field) {
          PrepressColorPaletteField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment:
                  PrepressColorPaletteFields.fromEnum(field).cellAlignment,
            ),
          PrepressColorPaletteField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment:
                  PrepressColorPaletteFields.fromEnum(field).cellAlignment,
            ),
          PrepressColorPaletteField.id => AppTableCellText(
              item.meta.id.toString(),
              alignment:
                  PrepressColorPaletteFields.fromEnum(field).cellAlignment,
              italic: isDraft,
            ),
          PrepressColorPaletteField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
            ),
          PrepressColorPaletteField.createdBy => AppTableCellUser(
              item.meta.createdById,
            ),
          PrepressColorPaletteField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
            ),
          PrepressColorPaletteField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
            ),
          PrepressColorPaletteField.paletteName => AppTableCellText(
              item.paletteName,
            ),
          PrepressColorPaletteField.description => AppTableCellText(
              item.description,
            ),
          PrepressColorPaletteField.customer => AppTableCellText(
              item.customer?.contact?.general.name ?? '',
            ),
          PrepressColorPaletteField.customerId => AppTableCellText(
              item.customer?.meta.id.toString() ?? '',
            ),
        };
      },
    );
  }
}

class _AddColorBookButton extends HookConsumerWidget {
  const _AddColorBookButton({
    required this.readOnly,
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.tableType,
    this.useSmallButton,
  });

  final bool? useSmallButton;
  final bool readOnly;
  final int? customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final _Type tableType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final isLoading = useState<bool>(false);

    final onPressed = readOnly || isLoading.value
        ? null
        : () async {
            isLoading.value = true;

            try {
              await showElbDialog<void>(
                context: context,
                navigatorKey: navigatorKey,
                child: _ImportColorPaletteDialog(
                  customerId: customerId,
                  navigatorKey: navigatorKey,
                  floatingWindowId: floatingWindowId,
                ),
              );
            } finally {
              isLoading.value = false;
            }
          };

    return switch (tableType) {
      _Type.standard => AppButton.primary(
          onPressed: onPressed,
          tooltip: l10n.gen_add_entity(ppL10n.color_palette_singular),
          label: null,
          iconData: AppIcons.add,
        ),
      _Type.byCustomer => AddEntityInCardButton(
          onPressed: onPressed,
          tooltip: l10n.gen_add_entity(ppL10n.color_palette_singular),
        ),
    };
  }
}

/// Dialog for importing color palettes
class _ImportColorPaletteDialog extends HookConsumerWidget {
  const _ImportColorPaletteDialog({
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowId,
  });

  final int? customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    final focusNode = useFocusNode();

    return ElbDialog(
      isSelfScrollable: false,
      title: ppL10n.import_colors,
      floatingWindowId: floatingWindowId,
      child: PrepressColorImportArea(
        navigatorKey: navigatorKey,
        floatingWindowId: floatingWindowId,
        floatingWindowFocus: focusNode,
        onImport: (colors, paletteName) async {
          await AsyncHandler.handleAsyncOperation(
            context,
            () async {
              unawaited(
                showElbDialog<void>(
                  context: context,
                  navigatorKey: AppNavigatorKeys.appRootNavigatorKey,
                  isDismissible: false,
                  child: AppFullscreenLoadingOverlay(
                    title: ppL10n.import_colors,
                  ),
                ),
              );

              final artworkColors = colors.map((c) => c.toDTO()).toList();
              await ref.read(artworkColorRepositoryProvider).importColors(
                    artworkColors: artworkColors,
                    paletteName: paletteName,
                    customerId: customerId,
                  );
              if (context.mounted) {
                ref.invalidate(findPrepressColorPalettesProvider);
                AppNotificationOverlay.success(
                  context,
                  ppL10n.color_import_success_message,
                );

                AppDialog.closeDialog(
                  AppNavigatorKeys.appRootNavigatorKey,
                );
                Navigator.of(context).pop();
              }
            },
          );
        },
      ),
    );
  }
}
