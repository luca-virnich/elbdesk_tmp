import 'dart:math' as math;

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _maxVisibleItems = 5;

class NextDropdownMenuSuggestions extends StatefulWidget {
  const NextDropdownMenuSuggestions({
    required this.initialText,
    this.readOnly = false,
    super.key,
    this.onChanged,
    this.onFetchSuggestions,
    this.inTableCell = false,
  });
  final String initialText;
  final bool readOnly;
  final void Function(String)? onChanged;
  final Future<List<String>> Function()? onFetchSuggestions;
  final bool inTableCell;
  @override
  State<NextDropdownMenuSuggestions> createState() =>
      _NextDropdownMenuSuggestionsState();
}

class _NextDropdownMenuSuggestionsState
    extends State<NextDropdownMenuSuggestions> {
  late final TextEditingController _textEditingController;
  final layerLink = LayerLink();
  final _overlayPortalController = OverlayPortalController();
  final GlobalKey _textFieldKey = GlobalKey();
  var _filteredItems = <String>[];
  late final ScrollController _scrollController;
  late final FocusNode _textFocusNode;
  int currentIndex = 0;
  var _suggestions = <String>[];
  bool hasLoadedSuggestions = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialText);
    _scrollController = ScrollController();
    _textFocusNode = FocusNode();
    _textFocusNode.addListener(() {
      if (!_textFocusNode.hasFocus) {
        _overlayPortalController.hide();
        setState(() {});
      }
    });
  }

  Future<void> _handleSuggestion() async {
    setState(() {
      currentIndex = 0;
    });
    if (hasLoadedSuggestions) {
      _overlayPortalController.show();
      return;
    }
    _overlayPortalController.show();
    setState(() {
      isLoading = true;
    });
    final suggestions = await widget.onFetchSuggestions?.call();
    if (suggestions != null) {
      setState(() {
        _filteredItems = suggestions;
        hasLoadedSuggestions = true;
        _suggestions = suggestions;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  void _onArrowDown() {
    if (widget.readOnly) return;

    if (!_overlayPortalController.isShowing) {
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

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    _textFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final l10n = context.l10n;
    final secondaryButtonStyles = theme.buttonStyles.secondary;
    final borderRadius = theme.borderRadiuses.s;

    return Shortcuts(
      shortcuts: {
        suggestShortcutMeta: const SuggestIntent(),
        suggestShortcutControl: const SuggestIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowDown): const _ArrowDownIntent(),
        LogicalKeySet(LogicalKeyboardKey.arrowUp): const _ArrowUpIntent(),
        LogicalKeySet(LogicalKeyboardKey.tab): const _TabIntent(),
        LogicalKeySet(LogicalKeyboardKey.escape): const _EscapeIntent(),
      },
      child: Actions(
        actions: {
          SuggestIntent: CallbackAction(
            onInvoke: (intent) {
              _handleSuggestion();
              return null;
            },
          ),
          _ArrowDownIntent: CallbackAction(
            onInvoke: (intent) {
              _onArrowDown();
              return null;
            },
          ),
          _ArrowUpIntent: CallbackAction(
            onInvoke: (intent) {
              _onArrowUp();
              return null;
            },
          ),
          _EscapeIntent: CallbackAction(
            onInvoke: (intent) {
              setState(() {
                _filteredItems = _suggestions;
                currentIndex = 0;
              });
              _overlayPortalController.hide();
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
                child: isLoading
                    ? ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: UiConstants.buttonHeight * 1,
                          maxWidth: 200,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: secondaryButtonStyles.backgroundColor,
                            borderRadius: BorderRadius.circular(
                              borderRadius,
                            ),
                          ),
                          child: const Center(child: AppLoadingIndicator()),
                        ),
                      )
                    : _suggestions.isEmpty
                        ? ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: UiConstants.buttonHeight * 2,
                              maxWidth: 200,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: secondaryButtonStyles.backgroundColor,
                                borderRadius: BorderRadius.circular(
                                  borderRadius,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                  l10n.gen_no_suggestions_found,
                                ),
                              ),
                            ),
                          )
                        : ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: UiConstants.buttonHeight * 5,
                              maxWidth: 200,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: secondaryButtonStyles.backgroundColor,
                                borderRadius: BorderRadius.circular(
                                  borderRadius,
                                ),
                                border: Border.all(
                                  color: secondaryButtonStyles.borderColor,
                                ),
                              ),
                              child: ScrollConfiguration(
                                behavior: ScrollConfiguration.of(
                                  context,
                                ).copyWith(
                                  physics: const ClampingScrollPhysics(),
                                  overscroll: false,
                                ),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const ClampingScrollPhysics(),
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  itemCount: _filteredItems.length,
                                  itemBuilder: (context, index) {
                                    return _MenuButton<String>(
                                      readOnly: widget.readOnly,
                                      onSelected: (value) {
                                        widget.onChanged?.call(value ?? '');
                                      },
                                      currentIndex: currentIndex,
                                      textEditingController:
                                          _textEditingController,
                                      filteredItems: _filteredItems,
                                      overlayPortalController:
                                          _overlayPortalController,
                                      index: index,
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
            child: NextTextField(
              suffix: const Icon(
                AppIcons.search,
                size: 16,
              ),
              isInTableCell: widget.inTableCell,
              focusNode: _textFocusNode,
              controller: _textEditingController,
              onChanged: widget.readOnly
                  ? null
                  : (value) {
                      widget.onChanged?.call(value);

                      if (_overlayPortalController.isShowing) {
                        setState(() {
                          _filteredItems = _suggestions
                              .where(
                                (item) => item.toLowerCase().contains(
                                      value.toLowerCase(),
                                    ),
                              )
                              .toList();
                        });
                      }
                    },
              onSubmitted: widget.readOnly
                  ? null
                  : (value) {
                      if (_filteredItems.isEmpty) {
                        return;
                      }

                      final item = _filteredItems[currentIndex];
                      _textEditingController.text = item;
                      widget.onChanged?.call(
                        item,
                      );

                      _overlayPortalController.hide();
                      FocusScope.of(context).nextFocus();
                    },
            ),
          ),
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
    required this.onSelected,
    required this.readOnly,
    super.key,
  });

  final int currentIndex;
  final int index;

  final TextEditingController textEditingController;
  final List<String> filteredItems;
  final OverlayPortalController overlayPortalController;

  final void Function(String?) onSelected;
  final bool readOnly;

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
              final newValue = widget.filteredItems[widget.index];
              widget.onSelected(newValue);

              widget.textEditingController.text = newValue;

              widget.overlayPortalController.hide();
            },
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppText(
          widget.filteredItems[widget.index],
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

class _EscapeIntent extends Intent {
  const _EscapeIntent();
}
