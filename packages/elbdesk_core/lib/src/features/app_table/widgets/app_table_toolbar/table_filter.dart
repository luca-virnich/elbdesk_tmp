part of 'app_table_toolbar.dart';

class _TableFilter<T> extends HookConsumerWidget {
  const _TableFilter({
    required this.componentIdentifier,
    required this.sessionId,
    required this.availableFilterFields,
    required this.tableDensity,
    required this.navigatorKey,
    required this.containerKey,
    this.dropdownFilterItems,
    super.key,
  });
  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final AppTableDensity tableDensity;
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;

  final GlobalKey<NavigatorState>? navigatorKey;
  final GlobalKey containerKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (availableFilterFields.isEmpty) {
      return const SizedBox.shrink();
    }

    final hasFilters = ref.watch(
      appTableFilterStateProvider(componentIdentifier, sessionId)
          .select((state) {
        return state != null &&
            (state.filterGroups.isNotEmpty &&
                state.filterGroups[0].filters.isNotEmpty);
      }),
    );
    final l10n = context.l10n;
    final secondaryDisabledColor =
        context.appTheme.buttonStyles.secondary.foregroundColorDisabled;

    return Row(
      children: [
        TableOverlay(
          alignRight: true,
          containerKey: containerKey,
          builder: (showOverlay, hideOverlay, isOpen) {
            return AppButton.secondary(
              onPressed: isOpen ? null : showOverlay,
              label: tableDensity == AppTableDensity.standard
                  ? l10n.table_filter
                  : null,
              tooltip: l10n.table_filter,
              icon: AppBadge(
                color: context.appTheme.statusColors.error,
                visible: hasFilters,
                isDisabled: isOpen,
                child: ElbIcon(
                  AppIcons.filter_list,
                  color: isOpen ? secondaryDisabledColor : null,
                ),
              ),
            );
          },
          overlayContent: (hideOverlay) {
            return _TableFilterOverlay(
              sessionId: sessionId,
              availableFilterFields: availableFilterFields,
              componentIdentifier: componentIdentifier,
              close: hideOverlay,
              dropdownFilterItems: dropdownFilterItems,
            );
          },
        ),
      ],
    );
  }
}

class _TableFilterOverlay<T> extends HookWidget {
  const _TableFilterOverlay({
    required this.sessionId,
    required this.availableFilterFields,
    required this.componentIdentifier,
    required this.close,
    this.dropdownFilterItems,
    super.key,
  });

  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final String componentIdentifier;
  final VoidCallback close;
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final scrollController = useScrollController();

    return NextCloseOverlayListener(
      onClose: close,
      child: AppWindow.fixed(
        width: 700,
        contentPadding: EdgeInsets.zero,
        titlebar: AppWindowTitlebar(
          titleText: l10n.table_filter,
          titleIconData: AppIcons.filter_list,
          onClose: close,
        ),
        child: AppScrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            controller: scrollController,
            child: _FilterView(
              sessionId: sessionId,
              availableFilterFields: availableFilterFields,
              close: close,
              componentIdentifier: componentIdentifier,
              dropdownFilterItems: dropdownFilterItems,
            ),
          ),
        ),
      ),
    );
  }
}

/// The View for the filter
class _FilterView<T> extends HookConsumerWidget {
  const _FilterView({
    required this.sessionId,
    required this.availableFilterFields,
    required this.close,
    required this.componentIdentifier,
    this.dropdownFilterItems,
  });
  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;

  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // We are watching the TEMP filter state to get the current filter.
    // We are using a temp filter so that the table does not reload every time.
    // After applying the filter we will update the real filter state with
    // the temp filter state.
    final filter = ref
        .watch(appTableFilterTempStateProvider(componentIdentifier, sessionId));

    // If we have no filter initially, we have to add the first filter
    // manually
    final isInitialized = useState(false);
    useEffect(
      () {
        if (filter.filterGroups.isEmpty ||
            filter.filterGroups[0].filters.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final firstField = availableFilterFields.values.first;
            final fieldEnum = availableFilterFields.keys.first;
            ref
                .read(
                  appTableFilterTempStateProvider(
                    componentIdentifier,
                    sessionId,
                  ).notifier,
                )
                .initEmptyFilter(
                  fieldEnum.toString(),
                  firstField.filterTypes.first,
                  firstField.fieldType,
                );
            isInitialized.value = true;
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            isInitialized.value = true;
          });
        }
        return null;
      },
      [],
    );
    final formKey = useMemoized(GlobalKey<FormState>.new, []);
    return !isInitialized.value
        ? const SizedBox.shrink()
        : Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: UiConstants.elementMargin),
                // we are showing each filter group in a column
                // For now we have only one filter group, this could be extended
                // in the future
                for (final (groupIndex, group) in filter.filterGroups.indexed)
                  _FilterGroupView(
                    filterGroup: group,
                    availableFilterFields: availableFilterFields,
                    sessionId: sessionId,
                    formKey: formKey,
                    groupIndex: groupIndex,
                    close: close,
                    componentIdentifier: componentIdentifier,
                    dropdownFilterItems: dropdownFilterItems,
                  ),
              ],
            ),
          );
  }
}

class ApplyFilterIntent extends Intent {
  const ApplyFilterIntent();
}

/// The View for every FilterGroup
class _FilterGroupView<T> extends ConsumerWidget {
  const _FilterGroupView({
    required this.filterGroup,
    required this.availableFilterFields,
    required this.sessionId,
    required this.groupIndex,
    required this.formKey,
    required this.close,
    required this.componentIdentifier,
    this.dropdownFilterItems,
    super.key,
  });
  final FilterGroup filterGroup;
  final Map<T, TableFieldData> availableFilterFields;
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;

  final String componentIdentifier;
  final String sessionId;
  final int groupIndex;
  final GlobalKey<FormState> formKey;
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Shortcuts(
      shortcuts: {
        if (!kIsWeb)
          LogicalKeySet(LogicalKeyboardKey.meta, LogicalKeyboardKey.enter):
              const ApplyFilterIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.enter):
            const ApplyFilterIntent(),
      },
      child: Actions(
        actions: {
          ApplyFilterIntent: CallbackAction<ApplyFilterIntent>(
            onInvoke: (intent) {
              final isValid = formKey.currentState?.validate();

              if (isValid ?? false) {
                final tempFilter = ref.read(
                  appTableFilterTempStateProvider(
                    componentIdentifier,
                    sessionId,
                  ),
                );

                ref
                    .read(
                      appTableFilterStateProvider(
                        componentIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .updateFilter(
                      tempFilter,
                    );
                close.call();
              }
              return null;
            },
          ),
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.all(UiConstants.defaultPadding).copyWith(
                top: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // we are showing every filter field in a column
                  for (final (filterIndex, filter)
                      in filterGroup.filters.indexed)
                    FilterFieldView<T>(
                      key: ValueKey(filter.uuid),
                      groupIndex: groupIndex,
                      formKey: formKey,
                      close: close,
                      filterField: filter,
                      filterLength: filterGroup.filters.length,
                      componentIdentifier: componentIdentifier,
                      sessionId: sessionId,
                      filterIndex: filterIndex,
                      availableFilterFields: availableFilterFields,
                      dropdownFilterItems: dropdownFilterItems,
                    ),
                ],
              ),
            ),
            const AppDivider(),
            Padding(
              padding: const EdgeInsets.all(UiConstants.defaultPadding),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final rowWidth = constraints.maxWidth;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // add a new filter field (line) to the filter group, the
                      // default
                      // field is the first field in the availableFilterFields
                      AppButton.secondary(
                        onPressed: () {
                          final firstField = availableFilterFields.values.first;
                          final fieldEnum = availableFilterFields.keys.first;
                          ref
                              .read(
                                appTableFilterTempStateProvider(
                                  componentIdentifier,
                                  sessionId,
                                ).notifier,
                              )
                              .addFilterField(
                                0,
                                fieldEnum.toString(),
                                firstField.filterTypes.first,
                                firstField.fieldType,
                              );
                        },
                        tooltip: l10n.table_filter_add,
                        icon: const AppButtonIconData(iconData: AppIcons.add),
                        label: rowWidth > 550 ? l10n.table_filter_add : null,
                      ),
                      const Spacer(),
                      // delete all filters from the and close the filter view
                      AppButton.danger(
                        iconData: AppIcons.delete_sweep,
                        onPressed: () {
                          ref
                              .read(
                                appTableFilterStateProvider(
                                  componentIdentifier,
                                  sessionId,
                                ).notifier,
                              )
                              .updateFilter(
                                Filter(filterGroups: []),
                              );
                          close.call();
                        },
                        tooltip: l10n.gen_delete_all,
                        label: rowWidth > 400 ? l10n.gen_delete_all : null,
                      ),
                      const SizedBox(width: UiConstants.elementMargin),
                      // Apply the filter and close the window
                      AppApplyButton(
                        showLabel: rowWidth > 400,
                        onPressed: () {
                          final isValid = formKey.currentState?.validate();

                          if (isValid ?? false) {
                            final tempFilter = ref.read(
                              appTableFilterTempStateProvider(
                                componentIdentifier,
                                sessionId,
                              ),
                            );

                            ref
                                .read(
                                  appTableFilterStateProvider(
                                    componentIdentifier,
                                    sessionId,
                                  ).notifier,
                                )
                                .updateFilter(
                                  tempFilter,
                                );
                            close.call();
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TableOverlay extends StatefulWidget {
  const TableOverlay({
    required this.builder,
    required this.overlayContent,
    required this.containerKey,
    this.alignRight = false,
    this.preferredMinWidth = 700,
    this.yOffset = 40,
    super.key,
  });

  final Widget Function(
    void Function() showOverlay,
    void Function() hideOverlay,
    bool isOpen,
  ) builder;
  final Widget Function(void Function() hideOverlay) overlayContent;
  final bool alignRight;
  final double preferredMinWidth;
  final GlobalKey containerKey;
  final double yOffset;

  @override
  State<TableOverlay> createState() => _TableOverlayState();
}

class _TableOverlayState extends State<TableOverlay>
    with SingleTickerProviderStateMixin {
  final LayerLink layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final GlobalKey _buttonKey = GlobalKey();
  bool _isOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AnimationConstants.defaultDuration,
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: AnimationConstants.defaultCurve,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _showOverlay() {
    if (_isOpen) return;

    setState(() {
      _isOpen = true;
    });
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
  }

  void _hideOverlay() {
    if (!_isOpen) return;

    setState(() {
      _isOpen = false;
    });
    _animationController.reverse().then((_) {
      _removeOverlay();
    });
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) {
        final screenSize = MediaQuery.of(context).size;

        return LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            if (!mounted) {
              return const SizedBox();
            }

            try {
              final buttonContext = _buttonKey.currentContext;
              final containerContext = widget.containerKey.currentContext;
              if (buttonContext == null || containerContext == null) {
                return const SizedBox();
              }
              if (!buttonContext.mounted || !containerContext.mounted) {
                return const SizedBox();
              }

              final buttonRenderBox =
                  buttonContext.findRenderObject() as RenderBox?;
              final containerRenderBox =
                  containerContext.findRenderObject() as RenderBox?;

              // Check if render objects are available
              if (buttonRenderBox == null || containerRenderBox == null) {
                return const SizedBox();
              }

              // Check if render objects are available

              final buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);
              final containerPosition =
                  containerRenderBox.localToGlobal(Offset.zero);

              final relativeButtonPosition = Offset(
                buttonPosition.dx - containerPosition.dx,
                buttonPosition.dy - containerPosition.dy,
              );
              final buttonSize = buttonRenderBox.size;
              final relativeButtonEnd =
                  relativeButtonPosition.dx + buttonSize.width;

              double calculateOffset({
                required double
                    maxWidth, // Die maximale Breite des Bereichs, z.B. 1000
                required double
                    buttonEnd, // Der rechte Rand des Buttons, z.B. 700
                required double
                    preferredMinWidth, // Die bevorzugte Mindestbreite des
                //Overlays, z.B. 800
              }) {
                if (preferredMinWidth <= buttonEnd ||
                    widget.alignRight == false) {
                  return 0;
                }
                // Berechne den verfügbaren Platz rechts vom Button
                final availableRightSpace = maxWidth - buttonEnd - 32;

                // buttonEnd is smaller than preferredMinWidth, move overlay to
                //the right only the pixel needed

                final clampEnd =
                    (availableRightSpace - 0).clamp(0.0, double.infinity);

                final offset =
                    (preferredMinWidth - buttonEnd).clamp(0.0, clampEnd);

                return offset;
              }

              final (offset) = calculateOffset(
                maxWidth: maxWidth,
                buttonEnd: relativeButtonEnd,
                preferredMinWidth: widget.preferredMinWidth,
              );

              return Stack(
                children: [
                  // Add a transparent barrier that covers the entire screen
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: _hideOverlay,
                      behavior: HitTestBehavior.translucent,
                      child: Container(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                  Align(
                    child: CompositedTransformFollower(
                      showWhenUnlinked: false,
                      offset: Offset(offset, widget.yOffset),
                      link: layerLink,
                      targetAnchor: widget.alignRight
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      followerAnchor: widget.alignRight
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Material(
                        color: context.appTheme.generalColors.transparent,
                        child: ScaleTransition(
                          scale: _fadeAnimation,
                          alignment: widget.alignRight
                              ? Alignment.topRight
                              : Alignment.topLeft,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: maxWidth - 32,
                                maxHeight: screenSize.height * 0.8,
                              ),
                              child: widget.overlayContent(_hideOverlay),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } catch (e) {
              return const SizedBox();
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!context.mounted) {
      return const SizedBox();
    }
    return CompositedTransformTarget(
      link: layerLink,
      child: KeyedSubtree(
        key: _buttonKey,
        child: ValueListenableBuilder<bool>(
          valueListenable: ValueNotifier<bool>(_isOpen),
          builder: (context, isOpen, _) {
            return widget.builder(_showOverlay, _hideOverlay, isOpen);
          },
        ),
      ),
    );
  }
}
