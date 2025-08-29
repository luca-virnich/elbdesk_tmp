// ignore: lines_longer_than_80_chars
// ignore_for_file: use_design_system_item_AppIcons, use_design_system_item_AppText
// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:math' as math;

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const double _minimumDropdownWidth = 30;

double getDropdownMenuWidth(
  double width,
  NextCardFormFieldLabelPosition labelPosition,
) {
  return labelPosition == NextCardFormFieldLabelPosition.left
      ? width / 2 - UiConstants.twoColumnWrapVerticalSpacing * 2.5
      : width;
}

/// Loading Text Field

/// Dropdown Menus
@Deprecated('Use NextDropdownMenu instead')
class AppDropdownMenu<T> extends HookWidget {
  @Deprecated('Use NextDropdownMenu instead')
  const AppDropdownMenu({
    required this.dropdownMenuEntries,
    required this.focusNode,
    required this.onSelected,
    required this.readOnly,
    required this.previousFocusNode,
    required this.focusOrderId,
    required this.width,
    this.menuHeight,
    this.leadingIcon,
    this.labelText,
    this.initialSelection,
    this.enableFilter = false,
    this.showCopyButton = true,
    this.isMandatory = false,
    this.controller,
    this.hintText,
    this.labelPosition = NextCardFormFieldLabelPosition.left,
    this.errorMessagePosition = TextFieldErrorMessagePosition.top,
    this.suffixIcon,
    this.onSubmittedNotOpenWithValue,
    this.trailingIcon,
    this.onInvalidSelection,
    this.onNullOrEmptySelection,
    this.isCellWidget = false,
    super.key,
  });

  final List<AppDropdownMenuEntry<T>> dropdownMenuEntries;
  final VoidCallback? onSubmittedNotOpenWithValue;
  final FocusNode focusNode;
  final ValueChanged<T?> onSelected;
  final bool readOnly;
  final FocusNode? previousFocusNode;
  final double width;
  final double? menuHeight;
  final String? labelText;
  final T? initialSelection;
  final double? focusOrderId;
  final bool enableFilter;
  final bool showCopyButton;
  final TextEditingController? controller;
  final String? hintText;
  final NextCardFormFieldLabelPosition labelPosition;
  final bool isMandatory;
  final TextFieldErrorMessagePosition errorMessagePosition;
  final Widget? suffixIcon;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final VoidCallback? onInvalidSelection;
  final VoidCallback? onNullOrEmptySelection;
  final bool isCellWidget;
  @override
  Widget build(BuildContext context) {
    final fieldFocus = useFocusNode();
    useEffect(
      () {
        void listener() {
          if (fieldFocus.hasFocus && !readOnly) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              focusNode.requestFocus();
            });
          }
        }

        fieldFocus.addListener(listener);
        return () => fieldFocus.removeListener(listener);
      },
      [fieldFocus],
    );

    final dropdownWidth = labelPosition == NextCardFormFieldLabelPosition.left
        ? width - UiConstants.leftLabelWidth
        : width;

    if (isCellWidget) {
      return ElbFocusOrderWrapper(
        focusOrderId: focusOrderId,
        child: Focus(
          focusNode: fieldFocus,
          child: Padding(
            padding: EdgeInsets.zero,
            child: _AppDropdownMenuWidget<T>(
              leadingIcon: leadingIcon,
              isCellWidget: isCellWidget,
              dropdownWidth: dropdownWidth,
              onSubmittedNotOpenWithValue: onSubmittedNotOpenWithValue,
              errorMessagePosition: errorMessagePosition,
              dropdownMenuEntries: dropdownMenuEntries,
              focusNode: focusNode,
              onSelected: onSelected,
              readOnly: readOnly,
              previousFocusNode: previousFocusNode,
              width: width,
              menuHeight: menuHeight,
              labelText: labelText,
              isMandatory: isMandatory,
              initialSelection: initialSelection,
              labelPosition: labelPosition,
              enableFilter: enableFilter,
              showCopyButton: showCopyButton,
              controller: controller,
              hintText: hintText,
              suffixIcon: suffixIcon,
              onInvalidSelection: onInvalidSelection,
              onNullOrEmptySelection: onNullOrEmptySelection,
            ),
          ),
        ),
      );
    }

    // const dropdownWidth = 50.0;
    return ElbFocusOrderWrapper(
      focusOrderId: focusOrderId,
      child: Focus(
        focusNode: fieldFocus,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: labelPosition == NextCardFormFieldLabelPosition.top &&
                    labelText != null
                ? 8
                : 0,
          ),
          child: Row(
            children: [
              Expanded(
                child: _AppDropdownMenuWidget<T>(
                  leadingIcon: leadingIcon,
                  isCellWidget: isCellWidget,
                  dropdownWidth: dropdownWidth,
                  onSubmittedNotOpenWithValue: onSubmittedNotOpenWithValue,
                  errorMessagePosition: errorMessagePosition,
                  dropdownMenuEntries: dropdownMenuEntries,
                  focusNode: focusNode,
                  onSelected: onSelected,
                  readOnly: readOnly,
                  previousFocusNode: previousFocusNode,
                  width: width,
                  menuHeight: menuHeight,
                  labelText: labelText,
                  isMandatory: isMandatory,
                  initialSelection: initialSelection,
                  labelPosition: labelPosition,
                  enableFilter: enableFilter,
                  showCopyButton: showCopyButton,
                  controller: controller,
                  hintText: hintText,
                  suffixIcon: suffixIcon,
                  onInvalidSelection: onInvalidSelection,
                  onNullOrEmptySelection: onNullOrEmptySelection,
                ),
              ),
              if (trailingIcon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 4, top: 22),
                  child: trailingIcon,
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

// Examples can assume:
// late BuildContext context;
// late FocusNode myFocusNode;

/// A callback function that returns the list of the items that matches the
/// current applied filter.
///
/// Used by [_AppDropdownMenuWidget.filterCallback].
typedef FilterCallback<T> = List<AppDropdownMenuEntry<T>> Function(
  List<AppDropdownMenuEntry<T>> entries,
  String filter,
);

/// A callback function that returns the index of the item that matches the
/// current contents of a text field.
///
/// If a match doesn't exist then null must be returned.
///
/// Used by [_AppDropdownMenuWidget.searchCallback].
typedef SearchCallback<T> = int? Function(
  List<AppDropdownMenuEntry<T>> entries,
  String query,
);

// Navigation shortcuts to move the selected menu items up or down.
final Map<ShortcutActivator, Intent> _kMenuTraversalShortcuts =
    <ShortcutActivator, Intent>{
  LogicalKeySet(LogicalKeyboardKey.arrowUp): const _ArrowUpIntent(),
  LogicalKeySet(LogicalKeyboardKey.arrowDown): const _ArrowDownIntent(),
};

// const double _kMinimumWidth = 112;
const double _kMinimumWidth = _minimumDropdownWidth;

const double _kDefaultHorizontalPadding = 12;

/// Defines a [_AppDropdownMenuWidget] menu button that represents one item
/// view in the menu.
///
/// See also:
///
/// * [_AppDropdownMenuWidget]
class AppDropdownMenuEntry<T> {
  /// Creates an entry that is used
  /// with [_AppDropdownMenuWidget.dropdownMenuEntries].
  const AppDropdownMenuEntry({
    required this.value,
    required this.label,
    this.labelWidget,
    this.leadingIcon,
    this.trailingIcon,
    this.enabled = true,
    this.style,
  });

  /// the value used to identify the entry.
  ///
  /// This value must be unique across all entries in
  /// a [_AppDropdownMenuWidget].
  final T value;

  /// The label displayed in the center of the menu item.
  final String label;

  /// Overrides the default label widget which is `Text(label)`.
  ///
  /// {@tool dartpad}
  /// This sample shows how to override the default label [Text]
  /// widget with one that forces the menu entry to appear on one line
  /// by specifying [Text.maxLines] and [Text.overflow].
  ///
  /// ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu_entry_label_widget.0.dart **
  /// {@end-tool}
  final Widget? labelWidget;

  /// An optional icon to display before the label.
  final Widget? leadingIcon;

  /// An optional icon to display after the label.
  final Widget? trailingIcon;

  /// Whether the menu item is enabled or disabled.
  ///
  /// The default value is true. If true, the [AppDropdownMenuEntry.label]
  /// will be filled  out in the text field of the [_AppDropdownMenuWidget]
  /// when this entry is clicked; otherwise, this entry is disabled.
  final bool enabled;

  /// Customizes this menu item's appearance.
  ///
  /// Null by default.
  final ButtonStyle? style;
}

/// A dropdown menu that can be opened from a [TextField]. The selected
/// menu item is displayed in that field.
///
/// This widget is used to help people make a choice from a menu and put the
/// selected item into the text input field. People can also filter the list
/// based on the text input or search one item in the menu list.
///
/// The menu is composed of a list of [AppDropdownMenuEntry]s. People can
/// provide information, such as: label, leading icon or trailing icon for each
/// entry. The [TextField] will be updated based on the selection from the menu
/// entries. The text field will stay empty if the selected entry is disabled.
///
/// The dropdown menu can be traversed by pressing the up or down key. During
/// the process, the corresponding item will be highlighted and the text field
/// will be updated.
/// Disabled items will be skipped during traversal.
///
/// The menu can be scrollable if not all items in the list are displayed at
/// once.
///
/// {@tool dartpad}
/// This sample shows how to display outlined [_AppDropdownMenuWidget] and
/// filled [_AppDropdownMenuWidget].
///
/// ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu.0.dart **
/// {@end-tool}
///
/// See also:
///
/// * [MenuAnchor], which is a widget used to mark the "anchor" for a set of
///  * submenus.
///   The [_AppDropdownMenuWidget] uses a [TextField] as the "anchor".
/// * [TextField], which is a text input widget that uses an [InputDecoration].
/// * [AppDropdownMenuEntry], which is used to build the [MenuItemButton] in
/// * the [_AppDropdownMenuWidget] list.

class _AppDropdownMenuWidget<T> extends StatefulWidget {
  /// Creates a const [_AppDropdownMenuWidget].
  ///
  /// The leading and trailing icons in the text field can be customized by
  /// using [leadingIcon], [trailingIcon] and [selectedTrailingIcon] properties.
  /// They are passed down to the [InputDecoration] properties, and will
  /// override values in the [InputDecoration.prefixIcon] and
  /// [InputDecoration.suffixIcon].
  ///
  /// Except leading and trailing icons, the text field can be configured by the
  /// [InputDecorationTheme] property. The menu can be configured by the
  /// [menuStyle].
  const _AppDropdownMenuWidget({
    required this.dropdownMenuEntries,
    required this.focusNode,
    required this.onSelected,
    required this.readOnly,
    required this.isMandatory,
    required this.dropdownWidth,
    required this.isCellWidget,
    super.key,
    this.enabled = true,
    this.width,
    this.menuHeight,
    this.labelPosition = NextCardFormFieldLabelPosition.left,
    this.leadingIcon,
    this.trailingIcon,
    this.label,
    this.onSubmittedNotOpenWithValue,
    this.hintText,
    this.helperText,
    this.errorText,
    this.selectedTrailingIcon,
    this.enableFilter = false,
    this.enableSearch = true,
    this.textStyle,
    this.textAlign = TextAlign.start,
    this.inputDecorationTheme,
    this.menuStyle,
    this.controller,
    this.labelText,
    this.initialSelection,
    this.requestFocusOnTap,
    this.suffixIcon,
    this.expandedInsets,
    this.filterCallback,
    this.previousFocusNode,
    this.showCopyButton = true,
    this.searchCallback,
    this.errorMessagePosition = TextFieldErrorMessagePosition.bottom,
    this.onInvalidSelection,
    this.onNullOrEmptySelection,
    this.inputFormatters,
    // ignore: lines_longer_than_80_chars
  }) : assert(
          filterCallback == null || enableFilter,
          'filterCallback can only be used when enableFilter is true',
        );

  /// Determine if the [_AppDropdownMenuWidget] is enabled.
  ///
  /// Defaults to true.
  ///
  /// {@tool dartpad}
  /// This sample demonstrates how the [enabled] and [requestFocusOnTap]
  /// properties affect the textfield's hover cursor.
  ///
  /// ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu.2.dart **
  /// {@end-tool}
  final bool enabled;
  final bool isCellWidget;

  final bool isMandatory;
  final TextFieldErrorMessagePosition errorMessagePosition;

  final bool showCopyButton;

  final double dropdownWidth;

  final VoidCallback? onInvalidSelection;
  final VoidCallback? onNullOrEmptySelection;

  /// Determine the width of the [_AppDropdownMenuWidget].
  ///
  /// If this is null, the width of the [_AppDropdownMenuWidget] will be the
  /// same as the width of the widest menu item plus the width of the
  /// leading/trailing icon.
  final double? width;

  /// An optional icon at the end of the text field.
  ///
  /// Defaults to null.
  final Widget? suffixIcon;

  /// Determine the height of the menu.
  ///
  /// If this is null, the menu will display as many items as possible on the
  /// screen.
  final double? menuHeight;

  final FocusNode? previousFocusNode;

  /// An optional Icon at the front of the text input field.
  ///
  /// Defaults to null. If this is not null, the menu items will have extra
  /// paddings to be aligned with the text in the text field.
  final Widget? leadingIcon;

  final bool readOnly;

  final VoidCallback? onSubmittedNotOpenWithValue;

  /// An optional icon at the end of the text field.
  ///
  /// Defaults to an [Icon] with [Icons.arrow_drop_down].
  final Widget? trailingIcon;

  /// Optional widget that describes the input field.
  ///
  /// When the input field is empty and unfocused, the label is displayed on
  /// top of the input field (i.e., at the same location on the screen where
  /// text may be entered in the input field). When the input field receives
  /// focus (or if the field is non-empty), the label moves above, either
  /// vertically adjacent to, or to the center of the input field.
  ///
  /// Defaults to null.
  final Widget? label;
  final String? labelText;

  final NextCardFormFieldLabelPosition labelPosition;

  /// Text that suggests what sort of input the field accepts.
  ///
  /// Defaults to null;
  final String? hintText;

  /// Text that provides context about the [_AppDropdownMenuWidget]'s value,
  /// such as how the value will be used.
  ///
  /// If non-null, the text is displayed below the input field, in
  /// the same location as [errorText]. If a non-null [errorText] value is
  /// specified then the helper text is not shown.
  ///
  /// Defaults to null;
  ///
  /// See also:
  ///
  /// * [InputDecoration.helperText], which is the text that provides context
  /// about the [InputDecorator.child]'s value.
  final String? helperText;

  /// Text that appears below the input field and the border to show the error
  /// message.
  ///
  /// If non-null, the border's color animates to red and the [helperText] is
  /// not shown.
  ///
  /// Defaults to null;
  ///
  /// See also:
  ///
  /// * [InputDecoration.errorText], which is the text that appears below the
  /// [InputDecorator.child] and the border.
  final String? errorText;

  /// An optional icon at the end of the text field to indicate that the text
  /// field is pressed.
  ///
  /// Defaults to an [Icon] with [Icons.arrow_drop_up].
  final Widget? selectedTrailingIcon;

  /// Determine if the menu list can be filtered by the text input.
  ///
  /// Defaults to false.
  final bool enableFilter;

  /// Determine if the first item that matches the text input can be
  /// highlighted.
  ///
  /// Defaults to true as the search function could be commonly used.
  final bool enableSearch;

  /// The text style for the [TextField] of the [_AppDropdownMenuWidget];
  ///
  /// Defaults to the overall theme's [TextTheme.bodyLarge]
  /// if the dropdown menu theme's value is null.
  final TextStyle? textStyle;

  /// The text align for the [TextField] of the [_AppDropdownMenuWidget].
  ///
  /// Defaults to [TextAlign.start].
  final TextAlign textAlign;

  /// Defines the default appearance of [InputDecoration] to show around the
  /// text field.
  ///
  /// By default, shows a outlined text field.
  final InputDecorationTheme? inputDecorationTheme;

  /// The [MenuStyle] that defines the visual attributes of the menu.
  ///
  /// The default width of the menu is set to the width of the text field.
  final MenuStyle? menuStyle;

  /// Controls the text being edited or selected in the menu.
  ///
  /// If null, this widget will create its own [TextEditingController].
  final TextEditingController? controller;

  /// The value used to for an initial selection.
  ///
  /// Defaults to null.
  final T? initialSelection;

  /// The callback is called when a selection is made.
  ///
  /// Defaults to null. If null, only the text field is updated.
  final ValueChanged<T?> onSelected;

  /// Defines the keyboard focus for this widget.
  ///
  /// The [focusNode] is a long-lived object that's typically managed by a
  /// [StatefulWidget] parent. See [FocusNode] for more information.
  ///
  /// To give the keyboard focus to this widget, provide a [focusNode] and then
  /// use the current [FocusScope] to request the focus:
  ///
  /// ```dart
  /// FocusScope.of(context).requestFocus(myFocusNode);
  /// ```
  ///
  /// This happens automatically when the widget is tapped.
  ///
  /// To be notified when the widget gains or loses the focus, add a listener
  /// to the [focusNode]:
  ///
  /// ```dart
  /// myFocusNode.addListener(() { print(myFocusNode.hasFocus); });
  /// ```
  ///
  /// If null, this widget will create its own [FocusNode].
  ///
  /// ## Keyboard
  ///
  /// Requesting the focus will typically cause the keyboard to be shown
  /// if it's not showing already.
  ///
  /// On Android, the user can hide the keyboard - without changing the focus -
  /// with the system back button. They can restore the keyboard's visibility
  /// by tapping on a text field. The user might hide the keyboard and
  /// switch to a physical keyboard, or they might just need to get it
  /// out of the way for a moment, to expose something it's
  /// obscuring. In this case requesting the focus again will not
  /// cause the focus to change, and will not make the keyboard visible.
  ///
  /// If this is non-null, the behaviour of [requestFocusOnTap] is overridden
  /// by the [FocusNode.canRequestFocus] property.
  final FocusNode focusNode;

  /// Determine if the dropdown button requests focus and the on-screen virtual
  /// keyboard is shown in response to a touch event.
  ///
  /// Ignored if a [focusNode] is explicitly provided (in which case,
  /// [FocusNode.canRequestFocus] controls the behavior).
  ///
  /// Defaults to null, which enables platform-specific behavior:
  ///
  ///  * On mobile platforms, acts as if set to false; tapping on the text
  ///    field and opening the menu will not cause a focus request and the
  ///    virtual keyboard will not appear.
  ///
  ///  * On desktop platforms, acts as if set to true; the dropdown takes the
  ///    focus when activated.
  ///
  /// Set this to true or false explicitly to override the default behavior.
  ///
  /// {@tool dartpad}
  /// This sample demonstrates how the [enabled] and [requestFocusOnTap]
  /// properties affect the textfield's hover cursor.
  ///
  /// ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu.2.dart **
  /// {@end-tool}
  final bool? requestFocusOnTap;

  /// Descriptions of the menu items in the [_AppDropdownMenuWidget].
  ///
  /// This is a required parameter. It is recommended that at least one
  /// [AppDropdownMenuEntry] is provided. If this is an empty list, the menu
  /// will be empty and only contain space for padding.
  final List<AppDropdownMenuEntry<T>> dropdownMenuEntries;

  /// Defines the menu text field's width to be equal to its parent's width
  /// plus the horizontal width of the specified insets.
  ///
  /// If this property is null, the width of the text field will be determined
  /// by the width of menu items or [_AppDropdownMenuWidget.width]. If this
  /// property is not null, the text field's width will match the parent's width
  /// plus the specified insets.
  /// If the value of this property is [EdgeInsets.zero], the width of the text
  /// field will be the same as its parent's width.
  ///
  /// The [expandedInsets]' top and bottom are ignored, only its left and right
  /// properties are used.
  ///
  /// Defaults to null.
  final EdgeInsets? expandedInsets;

  /// When [_AppDropdownMenuWidget.enableFilter] is true, this callback is used
  /// to compute the list of filtered items.
  ///
  /// {@tool snippet}
  ///
  /// In this example the `filterCallback` returns the items that contains the
  /// trimmed query.
  ///
  /// ```dart
  /// DropdownMenu<Text>(
  ///   enableFilter: true,
  ///   filterCallback: (List<DropdownMenuEntry<Text>> entries, String filter) {
  ///     final String trimmedFilter = filter.trim().toLowerCase();
  ///       if (trimmedFilter.isEmpty) {
  ///         return entries;
  ///       }
  ///
  ///       return entries
  ///         .where((DropdownMenuEntry<Text> entry) =>
  ///           entry.label.toLowerCase().contains(trimmedFilter),
  ///         )
  ///         .toList();
  ///   },
  ///   dropdownMenuEntries: const <DropdownMenuEntry<Text>>[],
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// Defaults to null. If this parameter is null and the
  /// [_AppDropdownMenuWidget.enableFilter] property is set to true, the default
  /// behavior will return a filtered list. The filtered list will contain items
  /// that match the text provided by the input field, with a case-insensitive
  /// comparison. When this is not null, `enableFilter` must be set to true.
  final FilterCallback<T>? filterCallback;

  /// When [_AppDropdownMenuWidget.enableSearch] is true, this callback is used
  /// to compute the index of the search result to be highlighted.
  ///
  /// {@tool snippet}
  ///
  /// In this example the `searchCallback` returns the index of the search
  /// result that exactly matches the query.
  ///
  /// ```dart
  /// DropdownMenu<Text>(
  ///   searchCallback: (List<DropdownMenuEntry<Text>> entries, String query) {
  ///     if (query.isEmpty) {
  ///       return null;
  ///     }
  ///     final int index = entries.indexWhere((DropdownMenuEntry<Text> entry)
  ///     => entry.label == query);
  ///
  ///     return index != -1 ? index : null;
  ///   },
  ///   dropdownMenuEntries: const <DropdownMenuEntry<Text>>[],
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// Defaults to null. If this is null and
  /// [_AppDropdownMenuWidget.enableSearch] is true, the default function will
  /// return the index of the first matching result which contains the contents
  /// of the text input field.
  final SearchCallback<T>? searchCallback;

  /// Optional input validation and formatting overrides.
  ///
  /// Formatters are run in the provided order when the user changes the text
  /// this widget contains. When this parameter changes, the new formatters will
  /// not be applied until the next time the user inserts or deletes text.
  /// Formatters don't run when the text is changed
  /// programmatically via [controller].
  ///
  /// See also:
  ///
  ///  * [TextEditingController], which implements the [Listenable] interface
  ///    and notifies its listeners on [TextEditingValue] changes.
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<_AppDropdownMenuWidget<T>> createState() =>
      _AppDropdownMenuWidgetState<T>();
}

class _AppDropdownMenuWidgetState<T> extends State<_AppDropdownMenuWidget<T>> {
  final GlobalKey _anchorKey = GlobalKey();
  final GlobalKey _leadingKey = GlobalKey();
  late List<GlobalKey> buttonItemKeys;
  final MenuController _controller = MenuController();
  late bool _enableFilter;
  late List<AppDropdownMenuEntry<T>> filteredEntries;
  List<Widget>? _initialMenu;
  int? currentHighlight;
  double? leadingPadding;
  bool _menuHasEnabledItem = false;
  TextEditingController? _localTextEditingController;
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _localTextEditingController = widget.controller;
    } else {
      _localTextEditingController = TextEditingController();
    }
    _enableFilter = widget.enableFilter;
    filteredEntries = widget.dropdownMenuEntries;
    buttonItemKeys = List<GlobalKey>.generate(
      filteredEntries.length,
      (int index) => GlobalKey(),
    );
    _menuHasEnabledItem =
        filteredEntries.any((AppDropdownMenuEntry<T> entry) => entry.enabled);

    final index = filteredEntries.indexWhere(
      (AppDropdownMenuEntry<T> entry) => entry.value == widget.initialSelection,
    );
    if (index != -1) {
      _localTextEditingController?.value = TextEditingValue(
        text: filteredEntries[index].label,
        selection: TextSelection.collapsed(
          offset: filteredEntries[index].label.length,
        ),
      );
    }
    refreshLeadingPadding();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _localTextEditingController?.dispose();
      _localTextEditingController = null;
    }
    _isHovered.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(_AppDropdownMenuWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      if (widget.controller != null) {
        _localTextEditingController?.dispose();
      }
      _localTextEditingController =
          widget.controller ?? TextEditingController();
    }
    if (oldWidget.enableSearch != widget.enableSearch) {
      if (!widget.enableSearch) {
        currentHighlight = null;
      }
    }
    if (oldWidget.dropdownMenuEntries != widget.dropdownMenuEntries) {
      currentHighlight = null;
      filteredEntries = widget.dropdownMenuEntries;
      buttonItemKeys = List<GlobalKey>.generate(
        filteredEntries.length,
        (int index) => GlobalKey(),
      );
      _menuHasEnabledItem =
          filteredEntries.any((AppDropdownMenuEntry<T> entry) => entry.enabled);
    }
    if (oldWidget.leadingIcon != widget.leadingIcon) {
      refreshLeadingPadding();
    }
    if (oldWidget.initialSelection != widget.initialSelection) {
      final index = filteredEntries.indexWhere(
        (AppDropdownMenuEntry<T> entry) =>
            entry.value == widget.initialSelection,
      );
      if (index != -1) {
        _localTextEditingController?.value = TextEditingValue(
          text: filteredEntries[index].label,
          selection: TextSelection.collapsed(
            offset: filteredEntries[index].label.length,
          ),
        );
      }
    }
  }

  bool canRequestFocus() {
    return widget.focusNode.canRequestFocus;
  }

  void refreshLeadingPadding() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (!mounted) {
          return;
        }
        setState(() {
          leadingPadding = getWidth(_leadingKey);
        });
      },
      debugLabel: 'DropdownMenu.refreshLeadingPadding',
    );
  }

  void scrollToHighlight() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        final highlightContext =
            buttonItemKeys[currentHighlight!].currentContext;
        if (highlightContext != null) {
          Scrollable.ensureVisible(highlightContext);
        }
      },
      debugLabel: 'DropdownMenu.scrollToHighlight',
    );
  }

  double? getWidth(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject()! as RenderBox;
      return box.hasSize ? box.size.width : null;
    }
    return null;
  }

  List<AppDropdownMenuEntry<T>> filter(
    List<AppDropdownMenuEntry<T>> entries,
    TextEditingController textEditingController,
  ) {
    final filterText = textEditingController.text.toLowerCase();
    return entries
        .where(
          (AppDropdownMenuEntry<T> entry) =>
              entry.label.toLowerCase().contains(filterText),
        )
        .toList();
  }

  int? search(
    List<AppDropdownMenuEntry<T>> entries,
    TextEditingController textEditingController,
  ) {
    final searchText = textEditingController.value.text.toLowerCase();
    if (searchText.isEmpty) {
      return null;
    }

    // if (currentHighlight != null &&
    //     entries[currentHighlight!].label.toLowerCase().contains(searchText))
    //   {
    //   return currentHighlight;
    // }
    if (currentHighlight != null) {
      // check if currentHighlight is in entries
      if (currentHighlight! < entries.length) {
        final currentHighlightLabel = entries[currentHighlight!].label;
        final index = entries.indexWhere(
          (AppDropdownMenuEntry<T> entry) =>
              entry.label == currentHighlightLabel,
        );
        if (index != -1) {
          return index;
        }
      }
    }
    final index = entries.indexWhere(
      (AppDropdownMenuEntry<T> entry) =>
          entry.label.toLowerCase().contains(searchText),
    );

    return index != -1 ? index : null;
  }

  List<Widget> _buildButtons(
    List<AppDropdownMenuEntry<T>> filteredEntries,
    TextDirection textDirection, {
    int? focusedIndex,
    bool enableScrollToHighlight = true,
  }) {
    final result = <Widget>[];
    for (var i = 0; i < filteredEntries.length; i++) {
      final entry = filteredEntries[i];

      // By default, when the text field has a leading icon but a menu entry
      // doesn't have one, the label of the entry should have extra padding to
      // be aligned with the text in the text input field. When both the text
      // field and the menu entry have leading icons, the menu entry should
      // remove the extra paddings so its leading icon will be aligned with the
      // leading icon of the text field.
      final padding = entry.leadingIcon == null
          ? (leadingPadding ?? _kDefaultHorizontalPadding)
          : _kDefaultHorizontalPadding;
      final defaultStyle = switch (textDirection) {
        TextDirection.rtl => MenuItemButton.styleFrom(
            padding: EdgeInsets.only(
              left: _kDefaultHorizontalPadding,
              right: padding,
            ),
          ),
        TextDirection.ltr => MenuItemButton.styleFrom(
            padding: EdgeInsets.only(
              left: padding,
              right: _kDefaultHorizontalPadding,
            ),
          ),
      };

      var effectiveStyle = entry.style ?? defaultStyle;
      final focusedBackgroundColor = effectiveStyle.foregroundColor
              ?.resolve(<WidgetState>{WidgetState.focused}) ??
          Theme.of(context).colorScheme.onSurface;

      var label = entry.labelWidget ??
          Text(
            entry.label,
            overflow: TextOverflow.ellipsis,
          );
      if (widget.width != null) {
        final horizontalPadding = padding + _kDefaultHorizontalPadding;
        label = ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: widget.width! - horizontalPadding,
          ),
          child: label,
        );
      }

      // Simulate the focused state because the text field should always be
      // focused during traversal. If the menu item has a custom foreground
      // color, the "focused" color will also change to
      // foregroundColor.withOpacity(0.12).
      effectiveStyle = entry.enabled && i == focusedIndex
          ? effectiveStyle.copyWith(
              backgroundColor: WidgetStatePropertyAll<Color>(
                focusedBackgroundColor.withAppOpacity(0.12),
              ),
            )
          : effectiveStyle;

      final Widget menuItemButton = MenuItemButton(
        key: enableScrollToHighlight ? buttonItemKeys[i] : null,
        style: effectiveStyle,
        leadingIcon: entry.leadingIcon,
        trailingIcon: entry.trailingIcon,
        onPressed: entry.enabled && widget.enabled
            ? () {
                _localTextEditingController?.value = TextEditingValue(
                  text: entry.label,
                  selection:
                      TextSelection.collapsed(offset: entry.label.length),
                );
                currentHighlight = widget.enableSearch ? i : null;
                widget.onSelected.call(entry.value);
              }
            : null,
        requestFocusOnHover: false,
        child: widget.width != null
            ? SizedBox(
                width: 100,
                child: Text(
                  entry.label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : Text(
                entry.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
      );
      result.add(menuItemButton);
    }

    return result;
  }

  void handleUpKeyInvoke(_) {
    setState(() {
      if (!widget.enabled || !_menuHasEnabledItem || !_controller.isOpen) {
        return;
      }
      _enableFilter = false;
      currentHighlight ??= 0;
      currentHighlight = (currentHighlight! - 1) % filteredEntries.length;
      while (!filteredEntries[currentHighlight!].enabled) {
        currentHighlight = (currentHighlight! - 1) % filteredEntries.length;
      }
      final currentLabel = filteredEntries[currentHighlight!].label;
      _localTextEditingController?.value = TextEditingValue(
        text: currentLabel,
        selection: TextSelection.collapsed(offset: currentLabel.length),
      );
    });
  }

  void handleDownKeyInvoke(_) {
    setState(() {
      if (!widget.enabled || !_menuHasEnabledItem || !_controller.isOpen) {
        return;
      }
      _enableFilter = false;
      currentHighlight ??= -1;
      currentHighlight = (currentHighlight! + 1) % filteredEntries.length;
      while (!filteredEntries[currentHighlight!].enabled) {
        currentHighlight = (currentHighlight! + 1) % filteredEntries.length;
      }
      final currentLabel = filteredEntries[currentHighlight!].label;
      _localTextEditingController?.value = TextEditingValue(
        text: currentLabel,
        selection: TextSelection.collapsed(offset: currentLabel.length),
      );
    });
  }

  void handlePressed(MenuController controller) {
    if (controller.isOpen) {
      currentHighlight = null;
      controller.close();
    } else {
      // close to open
      if (_localTextEditingController!.text.isNotEmpty) {
        _enableFilter = false;
      }
      controller.open();
    }
    setState(() {});
  }

  void openMenu(MenuController controller) {
    if (!controller.isOpen) {
      controller.open();
      setState(() {});
    } else {
      setState(() {
        if (!_menuHasEnabledItem || !_controller.isOpen) {
          return;
        }
        _enableFilter = false;
        currentHighlight ??= -1;
        currentHighlight = (currentHighlight! + 1) % filteredEntries.length;
        while (!filteredEntries[currentHighlight!].enabled) {
          currentHighlight = (currentHighlight! + 1) % filteredEntries.length;
        }
        final currentLabel = filteredEntries[currentHighlight!].label;
        _localTextEditingController?.value = TextEditingValue(
          text: currentLabel,
          selection: TextSelection.collapsed(offset: currentLabel.length),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final temporaryProps = context.appTheme.temporaryProperties;
    final textDirection = Directionality.of(context);
    final borderRadiuses = context.appTheme.borderRadiuses;
    _initialMenu ??= _buildButtons(
      widget.dropdownMenuEntries,
      textDirection,
      enableScrollToHighlight: false,
    );
    final theme = DropdownMenuTheme.of(context);
    final DropdownMenuThemeData defaults = _DropdownMenuDefaultsM3(context);

    if (_enableFilter) {
      filteredEntries = widget.filterCallback
              ?.call(filteredEntries, _localTextEditingController!.text) ??
          filter(widget.dropdownMenuEntries, _localTextEditingController!);
    }

    if (widget.enableSearch) {
      if (widget.searchCallback != null) {
        currentHighlight = widget.searchCallback!
            .call(filteredEntries, _localTextEditingController!.text);
      } else {
        currentHighlight =
            search(filteredEntries, _localTextEditingController!);
      }
      if (currentHighlight != null) {
        scrollToHighlight();
      }
    }

    final menu = _buildButtons(
      filteredEntries,
      textDirection,
      focusedIndex: currentHighlight,
    );

    final effectiveTextStyle =
        widget.textStyle ?? theme.textStyle ?? defaults.textStyle;

    MenuStyle? effectiveMenuStyle = MenuStyle(
      backgroundColor: WidgetStatePropertyAll<Color>(
        temporaryProps.appNextDropdownMenuBackgroundColor,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiuses.m),
        ),
      ),
      side: WidgetStateProperty.all(
        BorderSide(
          color: temporaryProps.appNextDropdownMenuBorderColor,
        ),
      ),
    );

    final anchorWidth = getWidth(_anchorKey);
    if (widget.width != null) {
      effectiveMenuStyle = effectiveMenuStyle.copyWith(
        minimumSize: WidgetStatePropertyAll<Size?>(
          Size(widget.dropdownWidth + 8, 0), // +8 Added from Tobi
        ),
      );
    } else if (anchorWidth != null) {
      effectiveMenuStyle = effectiveMenuStyle.copyWith(
        minimumSize: WidgetStatePropertyAll<Size?>(Size(anchorWidth, 0)),
      );
    }

    if (widget.menuHeight != null) {
      effectiveMenuStyle = effectiveMenuStyle.copyWith(
        maximumSize: WidgetStatePropertyAll<Size>(
          Size(double.infinity, widget.menuHeight!),
        ),
      );
    }
    final effectiveInputDecorationTheme = widget.inputDecorationTheme ??
        theme.inputDecorationTheme ??
        defaults.inputDecorationTheme!;

    final MouseCursor? effectiveMouseCursor = switch (widget.enabled) {
      true =>
        canRequestFocus() ? SystemMouseCursors.text : SystemMouseCursors.click,
      false => null,
    };

    Widget menuAnchor = MenuAnchor(
      alignmentOffset: Offset(
        widget.width! - widget.dropdownWidth,
        5,
      ),
      style: effectiveMenuStyle.copyWith(
        backgroundColor: WidgetStatePropertyAll<Color>(
          temporaryProps.appNextDropdownMenuBackgroundColor,
        ),
        side: WidgetStatePropertyAll<BorderSide>(
          BorderSide(
            color: temporaryProps.appNextDropdownMenuBorderColor,
          ),
        ),
        shape: WidgetStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiuses.xs),
          ),
        ),
      ),
      controller: _controller,
      menuChildren: menu,
      crossAxisUnconstrained: false,
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        assert(
          _initialMenu != null,
          'Initial menu must be initialized before building',
        );
        final Widget trailingButton = Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_localTextEditingController!.text.isNotEmpty &&
                widget.showCopyButton)
              ValueListenableBuilder(
                valueListenable: _isHovered,
                builder: (context, isHovered, child) {
                  return AppTextFieldSuffixCopyButton(
                    visible: isHovered,
                    onPressed: () async {
                      await Clipboard.setData(
                        ClipboardData(
                          text: _localTextEditingController!.text,
                        ),
                      );
                    },
                  );
                },
              ),
            AppIconButton.rotating(
              visualDensity: VisualDensity.compact,
              skipTraversal: true,
              turns: controller.isOpen ? 0.5 : 0,
              iconData: AppIcons.expand_more,
              color: !widget.enabled || widget.readOnly
                  ? temporaryProps.appNextDropdownMenuReadOnlyColor
                  : temporaryProps.appNextDropdownMenuForegroundColor,
              onPressed: !widget.enabled || widget.readOnly
                  ? null
                  : () {
                      handlePressed(controller);
                    },
            ),
          ],
        );

        final Widget leadingButton = Padding(
          padding: const EdgeInsets.all(8),
          child: widget.leadingIcon ?? const SizedBox.shrink(),
        );

        final Widget textField = Shortcuts(
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.arrowDown):
                const _OpenMenuIntent(),
            LogicalKeySet(
              LogicalKeyboardKey.shift,
              LogicalKeyboardKey.tab,
            ): const _CustomPreviousFocusIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              _OpenMenuIntent: CallbackAction<_OpenMenuIntent>(
                onInvoke: (_) {
                  if (!widget.enabled || widget.readOnly) {
                    return null;
                  }
                  openMenu(controller);
                  return null;
                },
              ),
              _CustomPreviousFocusIntent:
                  CallbackAction<_CustomPreviousFocusIntent>(
                onInvoke: (_) {
                  widget.previousFocusNode?.requestFocus();
                  controller.close();
                  return true;
                },
              ),
            },
            child: HookBuilder(
              builder: (context) {
                final hasLostFocusOnce = useState<bool>(false);
                final hasSelectedValue = useState<bool>(false);
                useEffect(
                  () {
                    void onFocusChange() {
                      if (!widget.focusNode.hasFocus &&
                          !hasLostFocusOnce.value) {
                        hasLostFocusOnce.value = true;
                      }
                    }

                    widget.focusNode.addListener(onFocusChange);
                    return () {
                      widget.focusNode.removeListener(onFocusChange);
                    };
                  },
                  [widget.focusNode],
                );
                return MouseRegion(
                  onEnter: (event) {
                    _isHovered.value = true;
                  },
                  onExit: (event) {
                    _isHovered.value = false;
                  },
                  child: widget.isCellWidget
                      ? AppCellTextField(
                          focusNode: widget.focusNode,
                          controller: _localTextEditingController!,
                          readOnly: widget.readOnly,
                          key: _anchorKey,
                          enabled: widget.enabled,
                          mouseCursor: effectiveMouseCursor,
                          enableInteractiveSelection: canRequestFocus(),
                          textAlignVertical: TextAlignVertical.center,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              dlog('is null or empty');
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.onNullOrEmptySelection?.call();
                              });
                              return widget.isMandatory
                                  ? context.l10n.validation_invalid_selection
                                  : null;
                            }
                            final values =
                                filteredEntries.map((e) => e.label).toList();

                            if (values.contains(value)) {
                              return null;
                            }

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              widget.onInvalidSelection?.call();
                            });

                            return context.l10n.validation_invalid_selection;
                          },
                          onEditingComplete: () {
                            dlog('on editing complete triggered');
                            if (currentHighlight != null) {
                              final entry = filteredEntries[currentHighlight!];
                              if (entry.enabled) {
                                _localTextEditingController?.value =
                                    TextEditingValue(
                                  text: entry.label,
                                  selection: TextSelection.collapsed(
                                    offset: entry.label.length,
                                  ),
                                );
                                widget.onSelected.call(entry.value);

                                final isOpen = controller.isOpen;
                                if (!isOpen) {
                                  widget.onSubmittedNotOpenWithValue?.call();
                                }
                              }
                            } else {
                              widget.onSelected.call(null);
                            }
                            if (!widget.enableSearch) {
                              currentHighlight = null;
                            }
                            controller.close();
                          },
                          onTap: !widget.enabled || widget.readOnly
                              ? null
                              : () {
                                  handlePressed(controller);
                                },
                          onChanged: (String text) {
                            hasSelectedValue.value = true;
                            controller.open();
                            setState(() {
                              filteredEntries = widget.dropdownMenuEntries;
                              _enableFilter = widget.enableFilter;
                            });
                          },
                          inputFormatters: widget.inputFormatters,
                        )
                      : AppTextFormField(
                          errorMessagePosition: widget.errorMessagePosition,
                          readOnly: widget.readOnly,
                          key: _anchorKey,
                          enabled: widget.enabled,
                          label: widget.labelText,
                          labelPosition: widget.labelPosition,
                          mouseCursor: effectiveMouseCursor,
                          focusNode: widget.focusNode,
                          enableInteractiveSelection: canRequestFocus(),
                          textAlign: widget.textAlign,
                          textAlignVertical: TextAlignVertical.center,
                          style: effectiveTextStyle,
                          controller: _localTextEditingController,
                          autovalidateMode: hasLostFocusOnce.value
                              ? AutovalidateMode.onUserInteraction
                              : AutovalidateMode.onUnfocus,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              dlog('is null or empty');
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                widget.onNullOrEmptySelection?.call();
                              });
                              return widget.isMandatory
                                  ? context.l10n.validation_invalid_selection
                                  : null;
                            }
                            final values =
                                filteredEntries.map((e) => e.label).toList();

                            if (values.contains(value)) {
                              return null;
                            }

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              widget.onInvalidSelection?.call();
                            });

                            return context.l10n.validation_invalid_selection;
                          },
                          onEditingComplete: () {
                            dlog('on editing complete triggered');
                            if (currentHighlight != null) {
                              final entry = filteredEntries[currentHighlight!];
                              if (entry.enabled) {
                                _localTextEditingController?.value =
                                    TextEditingValue(
                                  text: entry.label,
                                  selection: TextSelection.collapsed(
                                    offset: entry.label.length,
                                  ),
                                );
                                widget.onSelected.call(entry.value);

                                final isOpen = controller.isOpen;
                                if (!isOpen) {
                                  widget.onSubmittedNotOpenWithValue?.call();
                                }
                              }
                            } else {
                              widget.onSelected.call(null);
                            }
                            if (!widget.enableSearch) {
                              currentHighlight = null;
                            }
                            controller.close();
                          },
                          onTap: !widget.enabled || widget.readOnly
                              ? null
                              : () {
                                  handlePressed(controller);
                                },
                          onChanged: (String text) {
                            hasSelectedValue.value = true;
                            controller.open();
                            setState(() {
                              filteredEntries = widget.dropdownMenuEntries;
                              _enableFilter = widget.enableFilter;
                            });
                          },
                          inputFormatters: widget.inputFormatters,
                          decoration: InputDecoration(
                            label: widget.label,
                            hintText: widget.hintText,
                            helperText: widget.helperText,
                            errorText: widget.errorText,
                            prefixIcon: widget.leadingIcon != null
                                ? SizedBox(
                                    key: _leadingKey,
                                    child: widget.leadingIcon,
                                  )
                                : null,
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                widget.suffixIcon ?? const SizedBox.shrink(),
                                trailingButton,
                              ],
                            ),
                          ).applyDefaults(effectiveInputDecorationTheme),
                        ),
                );
              },
            ),
          ),
        );

        if (widget.expandedInsets != null) {
          // If [expandedInsets] is not null, the width of the text field
          // should depend on its parent width. So we don't need to use
          //`_DropdownMenuBody` to calculate the children's width.
          return textField;
        }

        return _DropdownMenuBody(
          width: widget.width,
          children: <Widget>[
            textField,
            ..._initialMenu!,
            trailingButton,
            leadingButton,
          ],
        );
      },
    );

    if (widget.expandedInsets case final EdgeInsets padding) {
      menuAnchor = Padding(
        padding: padding.copyWith(top: 0, bottom: 0),
        child: Align(
          alignment: AlignmentDirectional.topStart,
          child: menuAnchor,
        ),
      );
    }

    return Shortcuts(
      shortcuts: _kMenuTraversalShortcuts,
      child: Actions(
        actions: <Type, Action<Intent>>{
          _ArrowUpIntent: CallbackAction<_ArrowUpIntent>(
            onInvoke: handleUpKeyInvoke,
          ),
          _ArrowDownIntent: CallbackAction<_ArrowDownIntent>(
            onInvoke: handleDownKeyInvoke,
          ),
        },
        child: menuAnchor,
      ),
    );
  }
}

class _ArrowUpIntent extends Intent {
  const _ArrowUpIntent();
}

class _ArrowDownIntent extends Intent {
  const _ArrowDownIntent();
}

class _OpenMenuIntent extends Intent {
  const _OpenMenuIntent();
}

class _CustomPreviousFocusIntent extends Intent {
  const _CustomPreviousFocusIntent();
}

class _DropdownMenuBody extends MultiChildRenderObjectWidget {
  const _DropdownMenuBody({
    super.children,
    this.width,
  });

  final double? width;

  @override
  _RenderDropdownMenuBody createRenderObject(BuildContext context) {
    return _RenderDropdownMenuBody(
      width: width,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderDropdownMenuBody renderObject,
  ) {
    renderObject.width = width;
  }
}

class _DropdownMenuBodyParentData extends ContainerBoxParentData<RenderBox> {}

class _RenderDropdownMenuBody extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, _DropdownMenuBodyParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox,
            _DropdownMenuBodyParentData> {
  _RenderDropdownMenuBody({
    double? width,
  }) : _width = width;

  double? get width => _width;
  double? _width;
  set width(double? value) {
    if (_width == value) {
      return;
    }
    _width = value;
    markNeedsLayout();
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! _DropdownMenuBodyParentData) {
      child.parentData = _DropdownMenuBodyParentData();
    }
  }

  @override
  void performLayout() {
    final constraints = this.constraints;
    var maxWidth = 0.0;
    double? maxHeight;
    var child = firstChild;

    final intrinsicWidth = width ?? getMaxIntrinsicWidth(constraints.maxHeight);
    final double widthConstraint =
        math.min(intrinsicWidth, constraints.maxWidth);
    final innerConstraints = BoxConstraints(
      maxWidth: widthConstraint,
      maxHeight: getMaxIntrinsicHeight(widthConstraint),
    );
    while (child != null) {
      if (child == firstChild) {
        child.layout(innerConstraints, parentUsesSize: true);
        maxHeight ??= child.size.height;
        final childParentData =
            child.parentData! as _DropdownMenuBodyParentData;
        assert(
          child.parentData == childParentData,
          'Child parent data mismatch',
        );
        child = childParentData.nextSibling;
        continue;
      }
      child.layout(innerConstraints, parentUsesSize: true);
      final childParentData = child.parentData! as _DropdownMenuBodyParentData;
      // ignore: cascade_invocations
      childParentData.offset = Offset.zero;
      maxWidth = math.max(maxWidth, child.size.width);
      maxHeight ??= child.size.height;
      assert(
        child.parentData == childParentData,
        'Child parent data does not match expected parent data',
      );
      child = childParentData.nextSibling;
    }

    assert(maxHeight != null, 'maxHeight must not be null after layout');
    maxWidth = math.max(_kMinimumWidth, maxWidth);
    size = constraints.constrain(Size(width ?? maxWidth, maxHeight!));
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final child = firstChild;
    if (child != null) {
      final childParentData = child.parentData! as _DropdownMenuBodyParentData;
      context.paintChild(child, offset + childParentData.offset);
    }
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final constraints = this.constraints;
    var maxWidth = 0.0;
    double? maxHeight;
    var child = firstChild;
    final intrinsicWidth = width ?? getMaxIntrinsicWidth(constraints.maxHeight);
    final double widthConstraint =
        math.min(intrinsicWidth, constraints.maxWidth);
    final innerConstraints = BoxConstraints(
      maxWidth: widthConstraint,
      maxHeight: getMaxIntrinsicHeight(widthConstraint),
    );

    while (child != null) {
      if (child == firstChild) {
        final childSize = child.getDryLayout(innerConstraints);
        maxHeight ??= childSize.height;
        final childParentData =
            child.parentData! as _DropdownMenuBodyParentData;
        assert(
          child.parentData == childParentData,
          'Child parent data does not match expected parent data',
        );
        child = childParentData.nextSibling;
        continue;
      }
      final childSize = child.getDryLayout(innerConstraints);
      final childParentData = child.parentData! as _DropdownMenuBodyParentData;
      // ignore: cascade_invocations
      childParentData.offset = Offset.zero;
      maxWidth = math.max(maxWidth, childSize.width);
      maxHeight ??= childSize.height;
      assert(
        child.parentData == childParentData,
        'Child parent data does not match expected parent data',
      );
      child = childParentData.nextSibling;
    }

    assert(maxHeight != null, 'maxHeight must not be null after layout');
    maxWidth = math.max(_kMinimumWidth, maxWidth);
    return constraints.constrain(Size(width ?? maxWidth, maxHeight!));
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    var child = firstChild;
    var width = 0.0;
    while (child != null) {
      if (child == firstChild) {
        final childParentData =
            child.parentData! as _DropdownMenuBodyParentData;
        child = childParentData.nextSibling;
        continue;
      }
      final maxIntrinsicWidth = child.getMinIntrinsicWidth(height);
      if (child == lastChild) {
        width += maxIntrinsicWidth;
      }
      if (child == childBefore(lastChild!)) {
        width += maxIntrinsicWidth;
      }
      width = math.max(width, maxIntrinsicWidth);
      final childParentData = child.parentData! as _DropdownMenuBodyParentData;
      child = childParentData.nextSibling;
    }

    return math.max(width, _kMinimumWidth);
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    var child = firstChild;
    var width = 0.0;
    while (child != null) {
      if (child == firstChild) {
        final childParentData =
            child.parentData! as _DropdownMenuBodyParentData;
        child = childParentData.nextSibling;
        continue;
      }
      final maxIntrinsicWidth = child.getMaxIntrinsicWidth(height);
      // Add the width of leading Icon.
      if (child == lastChild) {
        width += maxIntrinsicWidth;
      }
      // Add the width of trailing Icon.
      if (child == childBefore(lastChild!)) {
        width += maxIntrinsicWidth;
      }
      width = math.max(width, maxIntrinsicWidth);
      final childParentData = child.parentData! as _DropdownMenuBodyParentData;
      child = childParentData.nextSibling;
    }

    return math.max(width, _kMinimumWidth);
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    final child = firstChild;
    var width = 0.0;
    if (child != null) {
      width = math.max(width, child.getMinIntrinsicHeight(width));
    }
    return width;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    final child = firstChild;
    var width = 0.0;
    if (child != null) {
      width = math.max(width, child.getMaxIntrinsicHeight(width));
    }
    return width;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    final child = firstChild;
    if (child != null) {
      final childParentData = child.parentData! as _DropdownMenuBodyParentData;
      final isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (BoxHitTestResult result, Offset transformed) {
          assert(
            transformed == position - childParentData.offset,
            'Transformed position does not match expected position',
          );
          return child.hitTest(result, position: transformed);
        },
      );
      if (isHit) {
        return true;
      }
    }
    return false;
  }
}

// Hand coded defaults. These will be updated once we have tokens/spec.
class _DropdownMenuDefaultsM3 extends DropdownMenuThemeData {
  _DropdownMenuDefaultsM3(this.context);

  final BuildContext context;
  late final ThemeData _theme = Theme.of(context);

  @override
  TextStyle? get textStyle => _theme.textTheme.bodyLarge;

  @override
  MenuStyle get menuStyle {
    return const MenuStyle(
      minimumSize: WidgetStatePropertyAll<Size>(Size(_kMinimumWidth, 0)),
      maximumSize: WidgetStatePropertyAll<Size>(Size.infinite),
      visualDensity: VisualDensity.standard,
    );
  }

  @override
  InputDecorationTheme get inputDecorationTheme {
    return const InputDecorationTheme(border: OutlineInputBorder());
  }
}

class AppLoadingDropdownTextField extends StatelessWidget {
  /// @nodoc
  const AppLoadingDropdownTextField({
    required this.label,
    required this.labelPosition,
    super.key,
  });
  final String? label;
  final NextCardFormFieldLabelPosition labelPosition;
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Row(
        children: [
          if (labelPosition == NextCardFormFieldLabelPosition.left)
            SizedBox(
              width: UiConstants.leftLabelWidth,
              child: Padding(
                padding: const EdgeInsets.only(right: 2, top: 18),
                child: AppTooltip(
                  message: label,
                  waitDuration: const Duration(milliseconds: 500),
                  preferBelow: false,
                  child: AppText(
                    label ?? '',
                    autoSize: false,
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                AppTextField(
                  label: labelPosition == NextCardFormFieldLabelPosition.left
                      ? ''
                      : label,
                  suffixIcon: const AppIconButton.secondary(
                    onPressed: null,
                    iconData: AppIcons.expand_less,
                  ),
                ),
                Padding(
                  padding: label == null
                      ? EdgeInsets.zero
                      : const EdgeInsets.only(top: 20),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: AppLoadingIndicator(
                        radius: 6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
