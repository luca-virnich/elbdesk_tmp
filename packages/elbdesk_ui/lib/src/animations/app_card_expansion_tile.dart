import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A customizable expansion tile widget that can be used in card-like layouts.
///
/// This widget extends the functionality of [AppExpansionTile] by providing
/// additional customization options and a card-like appearance.
///
/// The [AppCardExpansionTile] can display a title, optional actions, and
/// expandable content. It also provides options to control the initial
/// expansion state, visibility of dividers and leading chevrons.
///
/// {@tool snippet}
///
/// ```dart
/// AppCardExpansionTile(
///   title: Text('Expansion Tile Title'),
///   child: Text('Expanded Content'),
///   initialIsExpanded: true,
///   showLeadingChevron: false,
///   actions: [
///     IconButton(icon: Icon(Icons.info), onPressed: () {}),
///   ],
/// )
/// ```
///
/// {@end-tool}
///
/// See also:
///
///  * [AppExpansionTile], which this widget uses as its base.
///  * [ExpansionTile], the Flutter framework's default expansion tile widget.
class AppCardExpansionTile extends HookWidget {
  /// Creates an [AppCardExpansionTile].
  ///
  /// The [child] argument must not be null.
  const AppCardExpansionTile({
    required this.child,
    super.key,
    this.title,
    this.titleText,
    this.initialIsExpanded = false,
    this.showDivider = true,
    this.showLeadingChevron = true,
    this.actions = const [],
    this.formKey,
    this.keepAliveChildren = false,
  });

  /// The primary content of the expansion tile.
  ///
  /// Typically a [Widget] that's displayed when the tile is expanded.
  final Widget child;

  /// A widget to display before the title.
  ///
  /// Typically a [Text] widget.
  final Widget? title;

  /// The title string to display if [title] is not provided.
  final String? titleText;

  /// Whether the tile is initially expanded.
  final bool initialIsExpanded;

  /// Whether to show a divider between the title and the expanded content.
  final bool showDivider;

  /// Whether to show a leading chevron icon.
  final bool showLeadingChevron;

  /// A list of widgets to display after the title.
  ///
  /// Typically these widgets are [IconButton]s representing common operations.
  final List<Widget> actions;

  /// Formkey that's used to validate the children if the tile is minimized
  final GlobalKey<FormState>? formKey;

  /// Whether to keep the child in the tree when collapsed.
  ///
  /// If true, the child remains in the tree but is sized to zero and
  /// transparent
  /// If false, the child is removed from the tree when collapsed.
  final bool keepAliveChildren;

  @override
  Widget build(BuildContext context) {
    return AppExpansionTile(
      titleTextStyle: context.appTheme.textStyles.h2,
      hoverColor: context.appTheme.generalColors.transparent,
      initialIsExpanded: initialIsExpanded,
      showLeadingChevron: showLeadingChevron,
      title: title,
      titleText: titleText,
      actions: actions,
      formKey: formKey,
      keepAliveChildren: keepAliveChildren,
      child: child,
    );
  }
}
