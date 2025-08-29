import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/user_settings/widgets/user_settings_dialog/user_settings_dialog.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'spotlight_dialog.g.dart';

@riverpod
class SelectedSearchMode extends _$SelectedSearchMode {
  @override
  SearchMode build() {
    return SearchMode.actions;
  }

  void updateSearchMode(SearchMode mode) {
    state = mode;
  }
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return '';
  }

  void updateQuery(String value) {
    state = value;
  }

  void clear() {
    state = '';
  }
}

@riverpod
List<SpotlightItem> actionsSpotlightItems(
  Ref ref,
  ElbCoreLocalizations l10n,
) {
  return [
    SpotlightItem(
      title: l10n.spotlight_action_new_contact_title,
      primaryKey: 0,
      description: l10n.spotlight_action_new_contact_subtitle,
      type: SpotlightType.newContact,
    ),
    SpotlightItem(
      title: l10n.spotlight_action_new_sales_order_title,
      primaryKey: 0,
      description: l10n.spotlight_action_new_sales_order_subtitle,
      type: SpotlightType.newSalesOrder,
    ),
    SpotlightItem(
      title: l10n.spotlight_action_search_customer_title,
      primaryKey: 0,
      description: l10n.spotlight_action_search_customer_subtitle,
      type: SpotlightType.searchCustomer,
    ),
    SpotlightItem(
      title: l10n.spotlight_action_search_contact_title,
      primaryKey: 0,
      description: l10n.spotlight_action_search_contact_subtitle,
      type: SpotlightType.searchContact,
    ),
    SpotlightItem(
      title: l10n.spotlight_action_settings_title,
      primaryKey: 0,
      description: l10n.spotlight_action_settings_subtitle,
      type: SpotlightType.settings,
    ),
  ];
}

@riverpod
Future<List<SpotlightItem>> showSpotlightItems(
  Ref ref,
  ElbCoreLocalizations l10n,
) async {
  final searchMode = ref.watch(selectedSearchModeProvider);
  final query = ref.watch(searchQueryProvider);
  return switch (searchMode) {
    SearchMode.actions => ref.watch(actionsSpotlightItemsProvider(l10n)),
    SearchMode.contacts =>
      ref.watch(findContactsSpotlightProvider(query).future),
    SearchMode.salesOrders =>
      ref.watch(findSalesOrdersSpotlightProvider(query).future),
    SearchMode.customers =>
      ref.watch(findCustomersSpotlightProvider(query).future),
  };
}

enum SearchMode {
  actions,
  salesOrders,
  customers,
  contacts,
}

extension SearchModeExt on SearchMode {
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      SearchMode.actions => l10n.spotlight_search_mode_actions,
      SearchMode.contacts => l10n.spotlight_search_mode_contacts,
      SearchMode.salesOrders => l10n.spotlight_search_mode_sales_orders,
      SearchMode.customers => l10n.spotlight_search_mode_customers,
    };
  }
}

class SpotlightDialog extends HookConsumerWidget {
  const SpotlightDialog({
    this.spotlightType = SpotlightType.general,
    super.key,
  });

  final SpotlightType spotlightType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final textFocus = useFocusNode();
    final keyboardFocus = useFocusNode();
    final selectedIndex = useState<int>(0);
    final searchQueryNotifier = ref.watch(searchQueryProvider.notifier);
    final searchModeNotifier = ref.watch(selectedSearchModeProvider.notifier);
    final searchMode = ref.watch(selectedSearchModeProvider);

    // Auto-focus input on open
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (spotlightType == SpotlightType.searchCustomer) {
            searchModeNotifier.updateSearchMode(SearchMode.customers);
          }
        });

        Future.delayed(
          const Duration(milliseconds: 100),
          textFocus.requestFocus,
        );
        return null;
      },
      [],
    );

    final l10n = context.l10n;

    final isMobile = ElbDeskPlatformInfo.isMobileDevice;

    final userName = ref.watch(currentAppUserStateProvider
        .select((value) => value.requireValue.userInfo.fullName));

    return ElbDialog(
      dialogMode: ElbDialogMode.normal,
      floatingWindowId: null,
      minWidth: 600,
      maxWidth: 600,
      blurBackground: true,
      hideTitlebar: true,
      child: ref.watch(showSpotlightItemsProvider(l10n)).when(
            skipLoadingOnRefresh: false,
            skipLoadingOnReload: true,
            loading: () => const SizedBox.shrink(
              child: Center(
                child: AppLoadingIndicator(),
              ),
            ),
            error: (error, stackTrace) => Text('Error: $error'),
            data: (items) {
              final filteredItems = items;

              return KeyboardListener(
                autofocus: true,
                focusNode: keyboardFocus,
                onKeyEvent: (event) async {
                  if (event is KeyDownEvent) {
                    final key = event.logicalKey;
                    if (key == LogicalKeyboardKey.tab &&
                        HardwareKeyboard.instance.isShiftPressed) {
                      searchModeNotifier.updateSearchMode(
                        SearchMode.values[
                            (searchMode.index - 1 + SearchMode.values.length) %
                                SearchMode.values.length],
                      );
                      searchQueryNotifier.clear();
                      controller.clear();
                      selectedIndex.value = 0;
                    } else if (key == LogicalKeyboardKey.tab) {
                      searchModeNotifier.updateSearchMode(
                        SearchMode.values[
                            (searchMode.index + 1) % SearchMode.values.length],
                      );
                      searchQueryNotifier.clear();
                      controller.clear();
                      selectedIndex.value = 0;
                      Future.delayed(
                        const Duration(milliseconds: 100),
                        textFocus.requestFocus,
                      );
                    } else if (key == LogicalKeyboardKey.arrowDown) {
                      selectedIndex.value =
                          (selectedIndex.value + 1) % filteredItems.length;
                    } else if (key == LogicalKeyboardKey.arrowUp) {
                      selectedIndex.value =
                          (selectedIndex.value - 1 + filteredItems.length) %
                              filteredItems.length;
                    } else if (key == LogicalKeyboardKey.enter) {
                      if (filteredItems.isNotEmpty) {
                        final item = filteredItems[selectedIndex.value];

                        switch (item.type) {
                          case SpotlightType.general:
                            break;
                          case SpotlightType.newContact:
                            ref.openWindow(
                              FloatingContactCompanyWindowData(
                                contactId: null,
                              ),
                            );
                            Navigator.of(context).pop();
                          case SpotlightType.newSalesOrder:
                            await showDialog<void>(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) =>
                                  const _AddSalesOrderDialog(),
                            );

                          case SpotlightType.searchCustomer:
                            searchModeNotifier.updateSearchMode(
                              SearchMode.customers,
                            );
                            searchQueryNotifier.clear();
                            controller.clear();
                            textFocus.requestFocus();
                          case SpotlightType.searchContact:
                            searchModeNotifier.updateSearchMode(
                              SearchMode.contacts,
                            );
                            searchQueryNotifier.clear();
                            controller.clear();
                            textFocus.requestFocus();

                          case SpotlightType.searchSalesOrder:
                            searchModeNotifier.updateSearchMode(
                              SearchMode.salesOrders,
                            );
                            searchQueryNotifier.clear();
                            controller.clear();
                            textFocus.requestFocus();

                          case SpotlightType.customer:
                            ref.openWindow(
                              FloatingCustomerWindowData(
                                customerId: item.primaryKey,
                              ),
                            );

                            Navigator.of(context).pop();

                          case SpotlightType.salesOrder:
                            ref.openWindow(
                              FloatingSalesOrderWindowData(
                                salesOrderId: item.primaryKey,
                              ),
                            );
                            Navigator.of(context).pop();

                          case SpotlightType.contact:
                            ref.openWindow(
                              FloatingContactCompanyWindowData(
                                contactId: item.primaryKey,
                              ),
                            );
                            Navigator.of(context).pop();
                          case SpotlightType.settings:
                            Navigator.of(context).pop();
                            await showElbDialog<void>(
                              context: context,
                              isDismissible: true,
                              child: UserSettingsOverlay(
                                userName: userName ?? '',
                                onClose: () {
                                  AppDialog.closeDialog(
                                    AppNavigatorKeys.appRootNavigatorKey,
                                  );
                                },
                              ),
                            );
                        }
                      }
                    }
                  }
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _HeaderTabBar(
                      searchModeNotifier: searchModeNotifier,
                      searchQueryNotifier: searchQueryNotifier,
                      controller: controller,
                      textFocus: textFocus,
                      searchMode: searchMode,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: AppSpace.xl,
                        right: AppSpace.xl,
                        top: AppSpace.xl,
                        bottom: AppSpace.l,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Shortcuts(
                              shortcuts: const {
                                SingleActivator(LogicalKeyboardKey.arrowDown):
                                    _ArrowDownIntent(),
                                SingleActivator(LogicalKeyboardKey.arrowUp):
                                    _ArrowUpIntent(),
                              },
                              child: Actions(
                                actions: {
                                  _ArrowDownIntent:
                                      CallbackAction<_ArrowDownIntent>(
                                    onInvoke: (_) {
                                      if (filteredItems.isNotEmpty) {
                                        selectedIndex.value =
                                            (selectedIndex.value + 1) %
                                                filteredItems.length;
                                      }
                                      return null;
                                    },
                                  ),
                                  _ArrowUpIntent:
                                      CallbackAction<_ArrowUpIntent>(
                                    onInvoke: (_) {
                                      if (filteredItems.isNotEmpty) {
                                        selectedIndex.value =
                                            (selectedIndex.value -
                                                    1 +
                                                    filteredItems.length) %
                                                filteredItems.length;
                                      }
                                      return null;
                                    },
                                  ),
                                },
                                child: NextTextField(
                                  suffix: const Padding(
                                    padding: EdgeInsets.only(
                                      right: AppSpace.s,
                                    ),
                                    child: ElbIcon(
                                      AppIcons.search,
                                    ),
                                  ),
                                  controller: controller,
                                  focusNode: textFocus,
                                  hintText: switch (searchMode) {
                                    SearchMode.actions =>
                                      l10n.spotlight_search_mode_actions_hint,
                                    SearchMode.contacts =>
                                      l10n.spotlight_search_mode_contacts_hint,
                                    SearchMode.salesOrders => l10n
                                        .spotlight_search_mode_sales_orders_hint,
                                    SearchMode.customers =>
                                      l10n.spotlight_search_mode_customers_hint,
                                  },
                                  style: const TextStyle(fontSize: 16),
                                  onChanged: (value) {
                                    searchQueryNotifier.updateQuery(value);
                                    selectedIndex.value = 0;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = filteredItems[index];
                          final isSelected = selectedIndex.value == index;

                          return InkWell(
                            onTap: () async {
                              switch (item.type) {
                                case SpotlightType.general:
                                  break;
                                case SpotlightType.newContact:
                                  ref.openWindow(
                                    FloatingContactCompanyWindowData(
                                      contactId: null,
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                case SpotlightType.newSalesOrder:
                                  await showDialog<void>(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) =>
                                        const _AddSalesOrderDialog(),
                                  );

                                case SpotlightType.searchCustomer:
                                  searchModeNotifier.updateSearchMode(
                                    SearchMode.customers,
                                  );
                                  searchQueryNotifier.clear();
                                  controller.clear();
                                  textFocus.requestFocus();
                                case SpotlightType.searchContact:
                                  searchModeNotifier.updateSearchMode(
                                    SearchMode.contacts,
                                  );
                                  searchQueryNotifier.clear();
                                  controller.clear();
                                  textFocus.requestFocus();

                                case SpotlightType.searchSalesOrder:
                                  searchModeNotifier.updateSearchMode(
                                    SearchMode.salesOrders,
                                  );
                                  searchQueryNotifier.clear();
                                  controller.clear();
                                  textFocus.requestFocus();

                                case SpotlightType.customer:
                                  ref.openWindow(
                                    FloatingCustomerWindowData(
                                      customerId: item.primaryKey,
                                    ),
                                  );

                                  Navigator.of(context).pop();

                                case SpotlightType.salesOrder:
                                  ref.openWindow(
                                    FloatingSalesOrderWindowData(
                                      salesOrderId: item.primaryKey,
                                    ),
                                  );
                                  Navigator.of(context).pop();

                                case SpotlightType.contact:
                                  ref.openWindow(
                                    FloatingContactCompanyWindowData(
                                      contactId: item.primaryKey,
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                case SpotlightType.settings:
                                  Navigator.of(context).pop();
                                  await showElbDialog<void>(
                                    context: context,
                                    isDismissible: true,
                                    child: UserSettingsOverlay(
                                      userName: userName ?? '',
                                      onClose: () {
                                        AppDialog.closeDialog(
                                          AppNavigatorKeys.appRootNavigatorKey,
                                        );
                                      },
                                    ),
                                  );
                              }
                            },
                            onHover: (_) => selectedIndex.value = index,
                            child: Container(
                              color: isSelected
                                  ? Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withAppOpacity(0.5)
                                  : Colors.transparent,
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpace.l,
                                vertical: AppSpace.s,
                              ),
                              child: Row(
                                children: [
                                  // Icon(item.icon, size: 20),
                                  const SizedBox(
                                    width: UiConstants.elementMargin,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AppText(
                                          item.title,
                                          fontSize: 14,
                                        ),
                                        AppText(
                                          item.description,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: AppSpace.l),
                    if (!isMobile) ...[
                      const AppDivider(),
                      const _BottomHintLine(),
                    ],
                  ],
                ),
              );
            },
          ),
    );
  }
}

class _HeaderTabBar extends StatelessWidget {
  const _HeaderTabBar({
    required this.searchModeNotifier,
    required this.searchQueryNotifier,
    required this.controller,
    required this.textFocus,
    required this.searchMode,
  });

  final SelectedSearchMode searchModeNotifier;
  final SearchQuery searchQueryNotifier;
  final TextEditingController controller;
  final FocusNode textFocus;
  final SearchMode searchMode;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final l10n = context.l10n;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: AppSpace.xl,
            right: AppSpace.xl,
            top: AppSpace.s,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(
              spacing: AppSpace.xl,
              children: [
                for (final mode in SearchMode.values)
                  InkWell(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () {
                      searchModeNotifier.updateSearchMode(mode);
                      searchQueryNotifier.clear();
                      controller.clear();
                      textFocus.requestFocus();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: AppSpace.s,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: searchMode == mode
                                ? generalColors.primary
                                : generalColors.transparent,
                            width: 2,
                          ),
                        ),
                      ),
                      child: AppText(
                        switch (mode) {
                          SearchMode.customers =>
                            l10n.spotlight_search_mode_customers,
                          SearchMode.contacts =>
                            l10n.spotlight_search_mode_contacts,
                          SearchMode.salesOrders =>
                            l10n.spotlight_search_mode_sales_orders,
                          SearchMode.actions =>
                            l10n.spotlight_search_mode_actions,
                        },
                        color:
                            searchMode == mode ? generalColors.primary : null,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const AppDivider(),
      ],
    );
  }
}

class _AddSalesOrderDialog extends HookConsumerWidget {
  const _AddSalesOrderDialog();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = useState<bool>(false);

    return Dialog(
      alignment: Alignment.topCenter,
      child: AppWindow.fixed(
        showBorder: false,
        showShadow: false,
        isLoading: isLoading.value,
        height: 600,
        width: 1000,
        titlebar: AppWindowTitlebar(
          onClose: isLoading.value ? null : () => Navigator.of(context).pop(),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 400,
              width: 1000,
              child: CustomerTable.standard(
                componentIdentifier: ComponentIdentifier
                    .customerTablegAddSalesOrderDialogSpotlight,
                onSelect: (customer) {
                  ref.openWindow(
                    FloatingSalesOrderWindowData(
                      salesOrderId: null,
                      customerId: customer.id,
                    ),
                  );
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomHintLine extends StatelessWidget {
  const _BottomHintLine();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.xl,
        vertical: AppSpace.l,
      ),
      child: AppWrap(
        alignment: WrapAlignment.start,
        children: [
          // Enter
          AppKeyboardKeySymbol(
            keySign: '\u21B5',
            description: l10n.spotlight_select,
          ),
          // Arrow up and down
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppKeyboardKeySymbol(keySign: '\u2191'),
              AppKeyboardKeySymbol(
                keySign: '\u2193',
                description: l10n.spotlight_navigate,
              ),
            ],
          ),
          // Tab
          AppKeyboardKeySymbol(
            keySign: '\u21E5',
            description: l10n.spotlight_switch,
          ),
          // Esc
          AppKeyboardKeySymbol(
            keySign: 'esc',
            description: l10n.spotlight_close,
          ),
        ],
      ),
    );
  }
}

class _ArrowDownIntent extends Intent {
  const _ArrowDownIntent();
}

class _ArrowUpIntent extends Intent {
  const _ArrowUpIntent();
}
