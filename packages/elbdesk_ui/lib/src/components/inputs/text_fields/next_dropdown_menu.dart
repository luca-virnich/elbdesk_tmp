import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

const _maxVisibleItems = 5;

class NextDropdownMenu<T> extends StatefulWidget {
  const NextDropdownMenu({
    required this.dropdownMenuEntries,
    required this.onSelected,
    required this.initialValue,
    required this.readOnly,
    this.controller,
    super.key,
    this.isInTableCell = false,
    this.focusOrderId,
    this.isMandatory = false,
    this.outsideTrailing,
    this.outsideLeading,
    this.focusNode,
    this.hintText,
    this.width,
    this.leadingIcon,
    this.isLazy = false,
    this.validationGroup,
    this.validationFieldId,
    this.validator,
    this.label,
  });

  final List<NextDropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?) onSelected;
  final String? initialValue;
  final bool readOnly;
  final bool isInTableCell;
  final double? focusOrderId;
  final bool isMandatory;
  final Widget? outsideTrailing;
  final Widget? outsideLeading;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? hintText;
  final double? width;
  final Widget? leadingIcon;
  final bool isLazy;
  final String? validationGroup;
  final String? validationFieldId;
  final String? Function(String?)? validator;
  final String? label;
  @override
  State<NextDropdownMenu<T>> createState() => _NextDropdownMenuState<T>();
}

class _NextDropdownMenuState<T> extends State<NextDropdownMenu<T>> {
  final layerLink = LayerLink();
  final _overlayPortalController = OverlayPortalController();
  AutovalidateMode _autovalidateMode = AutovalidateMode.onUnfocus;
  static final isMobileDevice = ElbDeskPlatformInfo.isMobileDevice;

  late final TextEditingController _textEditingController;
  late final ScrollController _scrollController;
  late final FocusNode _textFocusNode;
  final GlobalKey _textFieldKey = GlobalKey();
  var _filteredItems = <NextDropdownMenuEntry<T>>[];
  int currentIndex = 0;
  bool isMounted = true;
  late final String fieldId;
  T? _selectedValue;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _autovalidateMode = AutovalidateMode.onUserInteraction;
  }

  void _handleTextChange() {
    if (isMounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    fieldId = widget.validationFieldId ?? const Uuid().v4();
    _textEditingController = widget.controller != null
        ? (widget.controller!..text = widget.initialValue ?? '')
        : TextEditingController(text: widget.initialValue);
    _scrollController = ScrollController();
    _textFocusNode = widget.focusNode ?? FocusNode();
    _filteredItems = [...widget.dropdownMenuEntries];

    // Set initial selected value based on initialValue
    if (widget.initialValue != null) {
      _selectedValue = widget.dropdownMenuEntries
          .firstWhereOrNull((item) => item.label == widget.initialValue)
          ?.value;
    }
    _textFocusNode.addListener(() {
      if (!_textFocusNode.hasFocus) {
        Future.delayed(const Duration(milliseconds: 200), () {
          if (isMounted) {
            final hasMatch = widget.dropdownMenuEntries.firstWhereOrNull(
              (item) =>
                  item.label.toLowerCase() ==
                  _textEditingController.text.toLowerCase(),
            );
            if (hasMatch == null) {
              _selectedValue = null;
              widget.onSelected(null);
              _textEditingController.clear();
              setState(() {
                _filteredItems = [...widget.dropdownMenuEntries];
              });
            } else {
              if (_selectedValue != hasMatch.value) {
                widget.onSelected(hasMatch.value);
              }
            }
            _overlayPortalController.hide();
            setState(() {});
          }
        });
      } else {
        // _overlayPortalController.show();
      }
    });
    _textEditingController.addListener(_handleTextChange);

    if (widget.isLazy && !isMobileDevice) {
      _onArrowDown();
    }
    if (widget.isLazy && isMobileDevice) {}
  }

  @override
  void dispose() {
    isMounted = false;
    _textEditingController.removeListener(_handleTextChange);

    _scrollController.dispose();
    if (widget.focusNode == null) {
      _textFocusNode.dispose();
    }
    if (widget.controller == null) {
      _textEditingController.dispose();
    }
    super.dispose();
  }

  void _onArrowDown() {
    if (widget.readOnly) return;

    if (!_overlayPortalController.isShowing) {
      openMenu();
      return;
    }

    final currentLength = _filteredItems.length;
    if (currentLength == 0) return;

    final newIndex = currentIndex + 1;
    if (newIndex >= currentLength) return;

    setState(() {
      currentIndex = newIndex;
    });

    // Berechne die sichtbaren Items
    const visibleItems = _maxVisibleItems;
    final currentScrollPosition = _scrollController.offset;
    const itemHeight = UiConstants.buttonHeight;

    // Berechne den sichtbaren Bereich
    final firstVisibleItem = (currentScrollPosition / itemHeight).floor();
    final lastVisibleItem = firstVisibleItem + visibleItems - 1;

    // Scroll nur, wenn das neue Item nicht optimal im sichtbaren Bereich ist
    if (newIndex > lastVisibleItem - 2) {
      // Behalte 2 Items über dem ausgewählten Item wenn möglich
      final targetPosition = math.max<double>(
        0,
        (newIndex - 2) * itemHeight,
      );

      _scrollController.animateTo(
        targetPosition,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutCubic,
      );
    }
  }

  void _onArrowUp() {
    if (widget.readOnly) return;
    if (!_overlayPortalController.isShowing) {
      return;
    }
    final currentLength = _filteredItems.length;
    if (currentLength == 0) return;
    final newIndex = currentIndex - 1;

    if (newIndex >= 0) {
      setState(() {
        currentIndex = newIndex;
        // _textEditingController.text = newItem;
      });
      if (newIndex * UiConstants.buttonHeight < _scrollController.offset ||
          (newIndex + 1) * UiConstants.buttonHeight >
              _scrollController.offset +
                  _scrollController.position.viewportDimension) {
        _scrollController.jumpTo(
          newIndex * UiConstants.buttonHeight,
        );
      }
    }
  }

  void onTextFieldTap() {
    if (widget.readOnly) {
      return;
    }
    if (_overlayPortalController.isShowing) {
      _overlayPortalController.hide();
      setState(() {});
      return;
    }
    if (_textEditingController.text.isEmpty) {
      _filteredItems = [...widget.dropdownMenuEntries];
      _overlayPortalController.show();
      setState(() {});
      return;
    }
    final filtered = [...widget.dropdownMenuEntries];
    final indexOfMatch = filtered.indexWhere(
      (item) =>
          item.label.toLowerCase() == _textEditingController.text.toLowerCase(),
    );
    setState(() {
      _filteredItems = filtered;
      currentIndex = indexOfMatch;
    });
    if (indexOfMatch == -1) {
      return;
    }
    _overlayPortalController.show();

    final itemsInList = _filteredItems.length;
    const maxVisibleItems = 5;
    final scrollOffset = indexOfMatch * UiConstants.buttonHeight;

    // Wait for overlay to be built and attached before scrolling
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Set initial scroll position before overlay is visible
      if (!_scrollController.hasClients) return;

      // If there are less items than maxVisible or index is near end,
      // scroll to beginning of that section to avoid overscroll
      if (itemsInList <= maxVisibleItems ||
          indexOfMatch >= itemsInList - maxVisibleItems) {
        _scrollController.jumpTo(
          math.max(
            0,
            (itemsInList - maxVisibleItems) * UiConstants.buttonHeight,
          ),
        );
      } else {
        // Otherwise scroll to put selected item at top
        _scrollController.jumpTo(scrollOffset);
      }
    });
  }

  void requestNextFocus() {
    _textFocusNode
      ..requestFocus()
      ..nextFocus();
  }

  void requestTextFieldFocus() {
    _textFocusNode.requestFocus();
  }

  void resetFieldItems() {
    _filteredItems = [...widget.dropdownMenuEntries];
  }

  int findIndexFromCurrentInput() {
    final index = _filteredItems.indexWhere(
      (item) =>
          item.label.toLowerCase() == _textEditingController.text.toLowerCase(),
    );
    if (index == -1) {
      return 0;
    }
    return index;
  }

  void closeMenu() {
    _overlayPortalController.hide();
  }

  // action to open the menu
  void openMenu() {
    _overlayPortalController.show();
    final index = findIndexFromCurrentInput();
    setState(() {
      resetFieldItems();
      currentIndex = index;
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!_scrollController.hasClients) return;
      final allItemsLength = _filteredItems.length;
      const visibleItems = _maxVisibleItems;

      // Berechne die optimale Scroll-Position
      double targetPosition;
      if (allItemsLength <= visibleItems) {
        // Wenn die Liste kürzer als der sichtbare Bereich ist, scroll zum Anfang
        targetPosition = 0;
      } else if (currentIndex >= allItemsLength - visibleItems) {
        // Wenn wir nahe am Ende der Liste sind, zeige die letzten 'visibleItems' Einträge
        targetPosition =
            (allItemsLength - visibleItems) * UiConstants.buttonHeight;
      } else {
        // Ansonsten positioniere das ausgewählte Item so, dass noch 2 Items darüber sichtbar sind
        targetPosition = math.max(
          0,
          (currentIndex - 2) * UiConstants.buttonHeight,
        );
      }

      _scrollController.jumpTo(targetPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final secondaryButtonStyles = theme.buttonStyles.secondary;
    final borderRadius = theme.borderRadiuses.s;
    final temporaryProps = theme.temporaryProperties;
    final invalidSelection = context.l10n.validation_invalid_selection;

    return ExcludeFocus(
      excluding: widget.readOnly,
      child: ElbFocusOrderWrapper(
        focusOrderId: widget.focusOrderId,
        child: Consumer(
          builder: (context, ref, child) {
            return FormField<String>(
              autovalidateMode: _autovalidateMode,
              initialValue: widget.initialValue,
              validator: (value) {
                // Apply custom validator first if provided
                // and value is not empty
                if (widget.validator != null) {
                  final customValidationResult = widget.validator!(value);
                  if (customValidationResult != null) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (!context.mounted || widget.validationGroup == null) {
                        return;
                      }
                      ref
                          .read(
                            validationGroupProvider(widget.validationGroup!)
                                .notifier,
                          )
                          .add(fieldId);
                    });
                    return customValidationResult;
                  }
                }

                if (!widget.isMandatory) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!context.mounted || widget.validationGroup == null) {
                      return;
                    }
                    ref
                        .read(
                          validationGroupProvider(widget.validationGroup!)
                              .notifier,
                        )
                        .remove(fieldId);
                  });
                  return null;
                }

                final hasMatch = _filteredItems.firstWhereOrNull(
                  (item) => item.label.toLowerCase() == value?.toLowerCase(),
                );
                if (hasMatch == null) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (!context.mounted || widget.validationGroup == null) {
                      return;
                    }
                    ref
                        .read(
                          validationGroupProvider(widget.validationGroup!)
                              .notifier,
                        )
                        .add(fieldId);
                  });
                  return invalidSelection;
                }
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!context.mounted || widget.validationGroup == null) {
                    return;
                  }
                  ref
                      .read(
                        validationGroupProvider(widget.validationGroup!)
                            .notifier,
                      )
                      .remove(fieldId);
                });
                return null;
              },
              builder: (formState) {
                return HookBuilder(
                  builder: (context) {
                    useEffect(
                      () {
                        if (isMobileDevice && widget.isLazy) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return _MobileDialog(
                                  label: widget.label ?? '',
                                  dropdownMenuEntries:
                                      widget.dropdownMenuEntries,
                                  onSelected: (v) {
                                    _selectedValue = v;
                                    widget.onSelected(v);
                                  },
                                  textEditingController: _textEditingController,
                                  formState: formState,
                                );
                              },
                            );
                          });
                        }
                        return null;
                      },
                      [],
                    );
                    return LayoutWidthBuilder(
                      width: widget.width,
                      builder: (width) {
                        return Shortcuts(
                          shortcuts: {
                            LogicalKeySet(LogicalKeyboardKey.arrowDown):
                                const _ArrowDownIntent(),
                            LogicalKeySet(LogicalKeyboardKey.arrowUp):
                                const _ArrowUpIntent(),
                            LogicalKeySet(LogicalKeyboardKey.tab):
                                const _TabIntent(),
                            LogicalKeySet(LogicalKeyboardKey.escape):
                                const _EscapeIntent(),
                            LogicalKeySet(
                              LogicalKeyboardKey.shiftLeft,
                              LogicalKeyboardKey.tab,
                            ): const _ShiftTabIntent(),
                          },
                          child: Actions(
                            actions: {
                              _ArrowDownIntent: CallbackAction(
                                onInvoke: (intent) {
                                  if (widget.readOnly) {
                                    return null;
                                  }

                                  _onArrowDown();
                                  return null;
                                },
                              ),
                              _ArrowUpIntent: CallbackAction(
                                onInvoke: (intent) {
                                  if (widget.readOnly) {
                                    return null;
                                  }
                                  _onArrowUp();
                                  return null;
                                },
                              ),
                              _ShiftTabIntent: CallbackAction(
                                onInvoke: (intent) {
                                  FocusScope.of(context).previousFocus();
                                  if (widget.readOnly) {
                                    return null;
                                  }
                                  if (_textEditingController.text.isEmpty) {
                                    _selectedValue = null;
                                    widget.onSelected(null);
                                    formState.didChange('');
                                  } else if (_filteredItems.isNotEmpty) {
                                    if (!_overlayPortalController.isShowing) {
                                      // FocusScope.of(context).previousFocus();
                                      return;
                                    }
                                    final item = _filteredItems[currentIndex];
                                    _textEditingController.text = item.label;
                                    _selectedValue = item.value;
                                    widget.onSelected(item.value);
                                    formState.didChange(item.label);
                                  } else {
                                    _selectedValue = null;
                                    widget.onSelected(null);
                                    _textEditingController.clear();
                                    formState.didChange('');
                                  }
                                  _overlayPortalController.hide();

                                  return null;
                                },
                              ),
                              _TabIntent: CallbackAction(
                                onInvoke: (intent) {
                                  _textFocusNode.nextFocus();

                                  if (widget.readOnly) {
                                    return null;
                                  }
                                  if (_textEditingController.text.isEmpty) {
                                    _selectedValue = null;
                                    widget.onSelected(null);
                                    formState.didChange('');
                                  } else if (_filteredItems.isNotEmpty) {
                                    if (!_overlayPortalController.isShowing) {
                                      // FocusScope.of(context).nextFocus();
                                      return;
                                    }
                                    final item = _filteredItems[currentIndex];
                                    _textEditingController.text = item.label;
                                    _selectedValue = item.value;
                                    widget.onSelected(item.value);
                                    formState.didChange(item.label);
                                  } else {
                                    _selectedValue = null;
                                    widget.onSelected(null);
                                    _textEditingController.clear();
                                    formState.didChange('');
                                  }
                                  _overlayPortalController.hide();

                                  return null;
                                },
                              ),
                              _EscapeIntent: CallbackAction(
                                onInvoke: (intent) {
                                  if (widget.readOnly) {
                                    return null;
                                  }
                                  _overlayPortalController.hide();
                                  setState(() {});
                                  return null;
                                },
                              ),
                            },
                            child: OverlayPortal(
                              controller: _overlayPortalController,
                              overlayChildBuilder: (context) {
                                return CompositedTransformFollower(
                                  offset: const Offset(0, 5),
                                  link: layerLink,
                                  targetAnchor: Alignment.bottomLeft,
                                  followerAnchor: Alignment.topLeft,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: _filteredItems.isEmpty
                                        ? const SizedBox.shrink()
                                        : ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxHeight:
                                                  UiConstants.buttonHeight * 5,
                                              maxWidth: width,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: secondaryButtonStyles
                                                    .backgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  borderRadius,
                                                ),
                                                border: Border.all(
                                                  color: secondaryButtonStyles
                                                      .borderColor,
                                                ),
                                              ),
                                              child: ScrollConfiguration(
                                                behavior:
                                                    ScrollConfiguration.of(
                                                  context,
                                                ).copyWith(
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  overscroll: false,
                                                ),
                                                child: ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  controller: _scrollController,
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      _filteredItems.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return _MenuButton<T>(
                                                      readOnly: widget.readOnly,
                                                      requestNextFocus:
                                                          requestNextFocus,
                                                      onSelected: (v) {
                                                        _selectedValue = v;
                                                        widget.onSelected(v);
                                                      },
                                                      currentIndex:
                                                          currentIndex,
                                                      textEditingController:
                                                          _textEditingController,
                                                      filteredItems:
                                                          _filteredItems,
                                                      overlayPortalController:
                                                          _overlayPortalController,
                                                      index: index,
                                                      formFieldState: formState,
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                );
                              },
                              child: CompositedTransformTarget(
                                link: layerLink,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      // height: UiConstants.buttonHeight,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: !isMobileDevice
                                                  ? null
                                                  : () async {
                                                      await showDialog<void>(
                                                        context: context,
                                                        builder: (context) {
                                                          return _MobileDialog(
                                                            label:
                                                                widget.label ??
                                                                    '',
                                                            dropdownMenuEntries:
                                                                widget
                                                                    .dropdownMenuEntries,
                                                            onSelected: (v) {
                                                              _selectedValue =
                                                                  v;
                                                              widget.onSelected(
                                                                v,
                                                              );
                                                            },
                                                            textEditingController:
                                                                _textEditingController,
                                                            formState:
                                                                formState,
                                                          );
                                                        },
                                                      );
                                                    },
                                              child: AbsorbPointer(
                                                absorbing: isMobileDevice,
                                                child: NextTextField(
                                                  canRequestFocus:
                                                      !isMobileDevice,
                                                  readOnly: widget.readOnly,
                                                  isInTableCell:
                                                      widget.isInTableCell,
                                                  hasError: formState.hasError,
                                                  suffix: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      if (formState.hasError)
                                                        NextTextFormFieldErrorTooltip(
                                                          errorText: formState
                                                              .errorText,
                                                        ),
                                                      AppIconButton.rotating(
                                                        visualDensity:
                                                            VisualDensity
                                                                .compact,
                                                        skipTraversal: true,
                                                        turns:
                                                            _overlayPortalController
                                                                    .isShowing
                                                                ? 0.5
                                                                : 0,
                                                        iconData: AppIcons
                                                            .expand_more,
                                                        color: widget.readOnly
                                                            ? temporaryProps
                                                                .appNextDropdownMenuReadOnlyColor
                                                            : temporaryProps
                                                                .appNextDropdownMenuForegroundColor,
                                                        onPressed: widget
                                                                .readOnly
                                                            ? null
                                                            // ignore: unnecessary_lambdas
                                                            : () {
                                                                if (_overlayPortalController
                                                                    .isShowing) {
                                                                  _overlayPortalController
                                                                      .hide();
                                                                  setState(
                                                                    () {},
                                                                  );

                                                                  return;
                                                                }
                                                                requestTextFieldFocus();
                                                                openMenu();
                                                              },
                                                      ),
                                                    ],
                                                  ),
                                                  key: _textFieldKey,
                                                  focusNode: _textFocusNode,
                                                  controller:
                                                      _textEditingController,
                                                  // validator: (value) => null,
                                                  onChanged: widget.readOnly ||
                                                          isMobileDevice
                                                      ? null
                                                      : (value) {
                                                          setState(() {
                                                            _filteredItems = widget
                                                                .dropdownMenuEntries
                                                                .where(
                                                                  (item) => item
                                                                      .label
                                                                      .toLowerCase()
                                                                      .contains(
                                                                        value
                                                                            .toLowerCase(),
                                                                      ),
                                                                )
                                                                .toList();
                                                          });
                                                          formState
                                                              .didChange(value);
                                                          final match =
                                                              _filteredItems
                                                                  .firstWhereOrNull(
                                                            (item) =>
                                                                item.label
                                                                    .toLowerCase() ==
                                                                value
                                                                    .toLowerCase(),
                                                          );
                                                          if (match == null) {
                                                            _selectedValue =
                                                                null;
                                                            widget.onSelected(
                                                              null,
                                                            );
                                                          } else {
                                                            _selectedValue =
                                                                match.value;
                                                            widget.onSelected(
                                                              match.value,
                                                            );
                                                          }
                                                          if (!_overlayPortalController
                                                              .isShowing) {
                                                            _overlayPortalController
                                                                .show();
                                                          }
                                                          setState(() {
                                                            currentIndex = 0;
                                                          });
                                                        },
                                                  onSubmitted: widget.readOnly
                                                      ? null
                                                      : (value) {
                                                          if (_filteredItems
                                                              .isEmpty) {
                                                            return;
                                                          }

                                                          final item =
                                                              _filteredItems[
                                                                  currentIndex];
                                                          _textEditingController
                                                                  .text =
                                                              item.label;
                                                          _selectedValue =
                                                              item.value;
                                                          widget.onSelected(
                                                            item.value,
                                                          );
                                                          formState.didChange(
                                                            item.label,
                                                          );
                                                          _overlayPortalController
                                                              .hide();
                                                          FocusScope.of(context)
                                                              .nextFocus();
                                                        },
                                                  onTap: onTextFieldTap,
                                                ),
                                              ),
                                            ),
                                          ),
                                          if (widget.outsideTrailing !=
                                              null) ...[
                                            const SizedBox(
                                              width: UiConstants.elementMargin,
                                            ),
                                            widget.outsideTrailing!,
                                          ],
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MenuButton<T> extends StatefulWidget {
  const _MenuButton({
    required this.currentIndex,
    required this.textEditingController,
    required this.filteredItems,
    required this.overlayPortalController,
    required this.index,
    required this.formFieldState,
    required this.onSelected,
    required this.readOnly,
    required this.requestNextFocus,
    super.key,
  });

  final int currentIndex;
  final int index;

  final TextEditingController textEditingController;
  final List<NextDropdownMenuEntry<T>> filteredItems;
  final OverlayPortalController overlayPortalController;
  final FormFieldState<String> formFieldState;
  final void Function(T?) onSelected;
  final bool readOnly;
  final void Function() requestNextFocus;
  @override
  State<_MenuButton<T>> createState() => _MenuButtonState<T>();
}

class _MenuButtonState<T> extends State<_MenuButton<T>> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode(skipTraversal: true);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    final secondaryButtonStyles = theme.buttonStyles.secondary;
    final borderRadius = theme.borderRadiuses.s;

    return TextButton(
      focusNode: _focusNode,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          widget.index == widget.currentIndex
              ? secondaryButtonStyles.overlayColor
              : null,
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 8,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          const Size.fromHeight(
            UiConstants.buttonHeight,
          ),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                borderRadius,
              ),
            ),
          ),
        ),
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(
              WidgetState.disabled,
            )) {
              return secondaryButtonStyles.foregroundColorDisabled;
            }
            if (states.contains(
              WidgetState.hovered,
            )) {
              return secondaryButtonStyles.foregroundColorOnHover;
            }
            if (states.contains(
              WidgetState.focused,
            )) {
              return secondaryButtonStyles.foregroundColorOnHover;
            }

            return secondaryButtonStyles.foregroundColor;
          },
        ),
        overlayColor: WidgetStateProperty.all(
          secondaryButtonStyles.overlayColor,
        ),
        surfaceTintColor: WidgetStateProperty.all(
          theme.generalColors.transparent,
        ),
      ),
      onPressed: widget.readOnly
          ? null
          : () {
              widget.requestNextFocus();
              final newValue = widget.filteredItems[widget.index];
              // Note: _selectedValue is managed in parent component
              widget.onSelected(newValue.value);

              widget.formFieldState.didChange(newValue.label);
              widget.textEditingController.text = newValue.label;

              widget.overlayPortalController.hide();
            },
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppText(
          widget.filteredItems[widget.index].label,
          maxLines: 1,
          textAlign: TextAlign.left,
        ),
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

class _TabIntent extends Intent {
  const _TabIntent();
}

class _ShiftTabIntent extends Intent {
  const _ShiftTabIntent();
}

class _EscapeIntent extends Intent {
  const _EscapeIntent();
}

class NextDropdownMenuEntry<T> {
  const NextDropdownMenuEntry({
    required this.value,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
  });

  final T value;
  final String label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
}

class _MobileDialog<T> extends HookWidget {
  const _MobileDialog({
    required this.label,
    required this.dropdownMenuEntries,
    required this.onSelected,
    required this.textEditingController,
    required this.formState,
    super.key,
  });

  final String label;
  final List<NextDropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?) onSelected;
  final TextEditingController textEditingController;
  final FormFieldState<String> formState;

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final scrollController = useScrollController();

    // Use useMemoized to create a filtered list that updates when search text changes
    final searchText = useValueListenable(searchController);
    final filteredEntries = useMemoized(
      () {
        if (searchText.text.isEmpty) {
          return dropdownMenuEntries;
        }
        final searchLower = searchText.text.toLowerCase();
        return dropdownMenuEntries
            .where(
              (entry) => entry.label.toLowerCase().contains(searchLower),
            )
            .toList();
      },
      [searchText.text, dropdownMenuEntries],
    );

    return Dialog(
      alignment: Alignment.topCenter,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: AppWindow.fixed(
        titlebar: AppWindowTitlebar(
          skipCloseButtonFocus: true,
          titleText: label,

          // onClose: () => Navigator.of(context).pop(),
          onClose: () => Navigator.of(context).pop(),
        ),
        contentPadding:
            const EdgeInsets.all(UiConstants.defaultPadding).copyWith(right: 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: UiConstants.defaultPadding,
                bottom: UiConstants.defaultPadding,
              ),
              child: NextTextField(
                controller: searchController,
                hintText: 'Suche',
                readOnly: false,
                autofocus: true,
              ),
            ),
            const AppDivider(),
            Flexible(
              child: filteredEntries.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(UiConstants.defaultPadding)
                          .copyWith(bottom: 0),
                      child: const AppText(
                        'Keine Einträge gefunden',
                      ),
                    )
                  : AppScrollbar(
                      controller: scrollController,
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final (index, entry)
                                in filteredEntries.indexed)
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ElbListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 8,
                                      horizontal: 8,
                                    ),
                                    trailing: entry.label ==
                                            textEditingController.text
                                        ? ElbIcon(
                                            AppIcons.check,
                                            color: context
                                                .appTheme.generalColors.primary,
                                          )
                                        : null,
                                    titleText: entry.label,
                                    onPressed: () {
                                      onSelected(
                                        entry.value,
                                      );
                                      textEditingController.text = entry.label;
                                      formState.didChange(
                                        entry.label,
                                      );
                                      Navigator.of(
                                        context,
                                      ).pop();
                                    },
                                  ),
                                  if (index < filteredEntries.length - 1)
                                    const Divider(),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
