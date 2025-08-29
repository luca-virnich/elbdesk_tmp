import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/table/table_controller.dart';
import 'package:elbdesk_core/src/data/table/table_repository.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

part 'table_view_actions.dart';

/// Table Views
///
/// Displays a dropdown menu with all available configurations for the table.
class TableViews extends StatelessWidget {
  /// Constructor
  const TableViews({
    required this.componentIdentifier,
    required this.sessionId,
    required this.containerKey,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.tableNames,
    required this.namePlural,
    required this.defaultConfig,
    super.key,
  });

  /// Session ID
  final String sessionId;

  /// Only use the default config
  final bool onlyDefaultConfig;

  /// Table Type
  final String componentIdentifier;
  final GlobalKey containerKey;

  /// Default config of the table
  final List<TableFieldConfig> tableDefaultConfig;
  final Widget tableNames;
  final String namePlural;
  final TableConfig defaultConfig;
  @override
  Widget build(BuildContext context) {
    return TableOverlay(
      preferredMinWidth: 600,
      containerKey: containerKey,
      // targetAnchor: Alignment.topLeft,
      // followerAnchor: Alignment.topLeft,
      builder: (showOverlay, hideOverlay, isOpen) {
        /// "Dropdown menu" button

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: tableNames),
            ExcludeFocus(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                // Chevron down Button
                child: AppIconButton.secondary(
                  tooltip: context.l10n.table_table_views,
                  iconData: AppIcons.expand_more,
                  iconSize: 24,
                  onPressed: isOpen ? null : showOverlay,
                ),
              ),
            ),
          ],
        );
      },

      overlayContent: (closeOverlay) {
        /// The actual popup TableView menu
        return _TableViewConfigPopup(
          onlyDefaultConfig: onlyDefaultConfig,
          closeOverlay: closeOverlay,
          sessionId: sessionId,
          componentIdentifier: componentIdentifier,
          defaultConfig: defaultConfig,
          tableDefaultConfig: tableDefaultConfig,
          namePlural: namePlural,
        );
      },
    );
  }
}

/// This widgets provides all available configurations for the table.
/// Also you can save the current view as a new configuration, this includes
/// the columns that are visible, the order of the columns and the filters.
class _TableViewConfigPopup extends StatelessWidget {
  const _TableViewConfigPopup({
    required this.closeOverlay,
    required this.componentIdentifier,
    required this.sessionId,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
    required this.defaultConfig,
  });
  final VoidCallback closeOverlay;
  final String componentIdentifier;
  final String sessionId;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;
  final TableConfig defaultConfig;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return NextCloseOverlayListener(
      onClose: closeOverlay,
      child: AppWindow.fixed(
        width: 600,
        contentPadding:
            EdgeInsets.zero.copyWith(bottom: UiConstants.defaultPadding),
        onClose: closeOverlay,
        titlebar: AppWindowTitlebar(
          titleIconData: AppIcons.table_chart_outlined,
          onClose: closeOverlay,
          titleText: l10n.table_table_view,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _AvailableTableConfigs(
              defaultConfig: defaultConfig,
              namePlural: namePlural,
              componentIdentifier: componentIdentifier,
              onlyDefaultConfig: onlyDefaultConfig,
              sessionId: sessionId,
              closeOverlay: closeOverlay,
              tableDefaultConfig: tableDefaultConfig,
            ),
            const AppDivider(),
            const SizedBox(height: UiConstants.defaultPadding),
            _AddNewConfigurationTile(
              componentIdentifier: componentIdentifier,
              sessionId: sessionId,
              namePlural: namePlural,
              tableDefaultConfig: tableDefaultConfig,
              onlyDefaultConfig: onlyDefaultConfig,
              extraFirstChild: null,
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows the available configurations for the table - the configurations are
/// independent of the table sessionId and only related to the [TableType].
class _AvailableTableConfigs extends HookConsumerWidget {
  const _AvailableTableConfigs({
    required this.componentIdentifier,
    required this.sessionId,
    required this.closeOverlay,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
    required this.defaultConfig,
  });
  final String componentIdentifier;
  final String sessionId;
  final VoidCallback closeOverlay;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;
  final TableConfig defaultConfig;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configs = ref.watch(
      appTableConfigsProvider(
        componentIdentifier: componentIdentifier,
      ),
    );

    final scrollController = useScrollController();

    return configs.componentWhen(
      loadingWidget: const SizedBox(
        height: 300,
        child: Center(
          child: AppLoadingIndicator(),
        ),
      ),
      skipLoadingOnRefresh: true,
      data: (remoteConfigs) {
        final allConfigs = [defaultConfig, ...remoteConfigs];

        return SizedBox(
          height: 300,
          child: ListView.separated(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            separatorBuilder: (context, index) => const Divider(
              height: 0,
            ),
            shrinkWrap: true,
            itemCount: allConfigs.length,
            itemBuilder: (context, index) {
              final config = allConfigs[index];

              return _ConfigTile(
                namePlural: namePlural,
                index: index,
                key: Key(config.id.toString()),
                config: config,
                onlyDefaultConfig: onlyDefaultConfig,
                componentIdentifier: componentIdentifier,
                sessionId: sessionId,
                closeOverlay: closeOverlay,
                tableDefaultConfig: tableDefaultConfig,
              );
            },
          ),
        );
      },
    );
  }
}

/// The Tile for a saved configuration of the table.
class _ConfigTile extends HookConsumerWidget {
  const _ConfigTile({
    required this.config,
    required this.closeOverlay,
    required this.sessionId,
    required this.componentIdentifier,
    required this.index,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
    super.key,
  });

  final TableConfig config;
  final int index;
  final String sessionId;
  final String componentIdentifier;
  final VoidCallback closeOverlay;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    /// State for the toggle switch
    final toggleState =
        useState<_TableViewToggleEnum>(_TableViewToggleEnum.delete);

    return ElbListTile(
      buttonBorderRadius: 0,
      contentPadding: const EdgeInsets.only(
        left: UiConstants.defaultPadding,
        right: AppSpace.l,
        top: AppSpace.m,
        bottom: AppSpace.m,
      ),
      onPressed: () {
        final filter = config.filter;
        ref
            .read(
              appTableFilterStateProvider(componentIdentifier, sessionId)
                  .notifier,
            )
            .updateFilter(filter);
        final sort = config.sort;
        if (sort != null) {
          ref
              .read(appTableSortStateProvider(sessionId).notifier)
              .updateSort(sort);
        }

        ref
            .read(
              appTableConfigStateProvider(
                componentIdentifier,
                sessionId,
              ).notifier,
            )
            .updateTableConfig(config);
        closeOverlay();
      },
      trailing: SizedBox(
        height: UiConstants.buttonHeight + 4,
        child: index == 0
            ? const SizedBox.shrink()
            : AnimatedToggleSwitcher(
                firstChildBuilder: (_, toggl) {
                  return _TableViewsTileButtonRow(
                    namePlural: namePlural,
                    config: config,
                    l10n: l10n,
                    toggleState: toggleState,
                    toggle: toggl,
                    tableDefaultConfig: tableDefaultConfig,
                  );
                },
                secondChildBuilder: (_, toggle) {
                  return toggleState.value == _TableViewToggleEnum.delete
                      ? _TableViewsConfirmDeleteActions(
                          namePlural: namePlural,
                          config: config,
                          componentIdentifier: componentIdentifier,
                          l10n: l10n,
                          toggle: toggle,
                          tableDefaultConfig: tableDefaultConfig,
                        )
                      : _TableViewsConfirmUpdateActions(
                          namePlural: namePlural,
                          componentIdentifier: componentIdentifier,
                          sessionId: sessionId,
                          l10n: l10n,
                          tableDefaultConfig: tableDefaultConfig,
                          config: config,
                          toggle: toggle,
                        );
                },
              ),
      ),
      titleText: config.name,
    );
  }
}

/// The Tile for a new configuration of the table.
class _AddNewConfigurationTile extends HookConsumerWidget {
  /// Constructor
  const _AddNewConfigurationTile({
    required this.sessionId,
    required this.componentIdentifier,
    required this.tableDefaultConfig,
    required this.onlyDefaultConfig,
    required this.namePlural,
    this.extraFirstChild,
  });

  final String componentIdentifier;
  final String sessionId;
  final Widget? extraFirstChild;
  final List<TableFieldConfig> tableDefaultConfig;
  final bool onlyDefaultConfig;
  final String namePlural;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final focusNode = useFocusNode();
    final textController = useTextEditingController(text: '');
    final isTextEmpty = useListenableSelector(
      textController,
      () => textController.text.isTrimmedEmpty,
    );
    final isLoading = useState<bool>(false);

    final onSave = useCallback(
      (void Function() toggle) async {
        isLoading.value = true;
        final currentFilter = ref.read(
          appTableFilterStateProvider(componentIdentifier, sessionId),
        );

        final currentTableConfig = ref
            .read(
              appTableConfigStateProvider(
                componentIdentifier,
                sessionId,
              ),
            )
            .requireValue!
            .tableFieldConfig;

        final currentSort = ref.read(appTableSortStateProvider(sessionId));

        final tableConfig = TableConfig(
          componentIdentifier: componentIdentifier,
          tableId: sessionId,
          tableFieldConfig: currentTableConfig,
          filter: currentFilter,
          sort: currentSort,
          isPrimary: false,
          name: textController.text,
        );

        await ref.read(tableRepositoryProvider).addTableConfig(tableConfig);

        // Updates the currently shown table name
        ref
            .read(
              appTableConfigStateProvider(
                componentIdentifier,
                sessionId,
              ).notifier,
            )
            .updateName(tableConfig.name);

        ref.invalidate(
          appTableConfigsProvider(
            componentIdentifier: componentIdentifier,
          ),
        );

        textController.clear();
        toggle();
        if (context.mounted) {
          isLoading.value = false;
        }
      },
      [],
    );

    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: UiConstants.defaultPadding),
      child: AnimatedToggleSwitcher(
        firstChildBuilder: (context, toggle) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child:

                    /// "Save View" configuration button
                    AppButton.secondary(
                  iconData: AppIcons.add,
                  onPressed: () {
                    toggle();
                    // focusNode.requestFocus();
                  },
                  label: l10n.table_save_view,
                ),
              ),
              if (extraFirstChild != null) ...[
                const SizedBox(width: UiConstants.defaultPadding),
                extraFirstChild!,
              ],
            ],
          );
        },
        secondChildBuilder: (context, toggle) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: _TextField(
                  focusNode: focusNode,
                  textController: textController,
                  l10n: l10n,
                  onSave: onSave,
                  toggle: toggle,
                ),
              ),
              const SizedBox(
                width: AppSpace.s,
              ),

              /// Cancel Button
              AppButton.danger(
                isLoading: isLoading.value,
                onPressed: () {
                  textController.clear();
                  toggle();
                },
                label: l10n.gen_cancel,
              ),
              const SizedBox(
                width: AppSpace.s,
              ),

              /// Save Button
              AppButton.primary(
                isLoading: isLoading.value,
                onPressed: isTextEmpty || isLoading.value
                    ? null
                    : () async {
                        await onSave(toggle);
                      },
                label: l10n.gen_save,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TextField extends HookWidget {
  const _TextField({
    required this.focusNode,
    required this.textController,
    required this.l10n,
    required this.onSave,
    required this.toggle,
  });

  final FocusNode focusNode;
  final TextEditingController textController;
  final ElbCoreLocalizations l10n;
  final Future<Null> Function(void Function() toggle) onSave;
  final void Function() toggle;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (context.mounted) {
            focusNode.requestFocus();
          }
        });
        return null;
      },
      [],
    );
    return AppTextFormField(
      autofocus: true,
      errorMessagePosition: TextFieldErrorMessagePosition.none,
      focusNode: focusNode,
      controller: textController,
      hintText: l10n.gen_description,
      onFieldSubmitted: (value) async {
        if (value.trim().isEmpty) return;
        await onSave(toggle);
      },
    );
  }
}
