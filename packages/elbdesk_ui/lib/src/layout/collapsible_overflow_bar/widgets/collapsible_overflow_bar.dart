// ignore_for_file: omit_local_variable_types, prefer_int_literals

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/models/menu_button_position.dart';
import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/models/overflow_direction.dart';
import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/widgets/_overflow_menu_button.dart';
import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/widgets/_overflow_row.dart';
import 'package:flutter/material.dart';

/// A widget that displays a row of children with overflow handling.
///
/// The [CollapsibleOverflowBar] widget is a stateful widget that displays a
/// row of children and handles overflow by collapsing the excess children
/// into a menu button. The position of the menu button, the direction of
/// overflow, and the spacing between children can be customized.
///
/// {@tool snippet}
/// This example shows how to use [CollapsibleOverflowBar] with some text
/// widgets:
///
/// ```dart
/// CollapsibleOverflowBar(
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///     Text('Item 3'),
///   ],
///   menuButtonPosition: MenuButtonPosition.end,
///   overflowDirection: OverflowDirection.ltr,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Row], which is used to arrange the children horizontally.
///  * [PopupMenuButton], which is used to display the overflowed children.
class CollapsibleOverflowBar extends StatefulWidget {
  /// Creates a [CollapsibleOverflowBar] widget.
  ///
  /// The [children] parameter must not be null.
  const CollapsibleOverflowBar({
    required this.children,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.menuButtonPosition = MenuButtonPosition.end,
    this.overflowDirection = OverflowDirection.ltr,
    this.menuBuilder,
    this.spacing = 0.0,
    this.leadingSpacing = 0.0,
    this.trailingSpacing = 0.0,
  }) : assert(
          mainAxisAlignment == MainAxisAlignment.start ||
              mainAxisAlignment == MainAxisAlignment.end,
          '''
CollapsibleOverflowBar only supports MainAxisAlignment.start or 
MainAxisAlignment.end.''',
        );

  /// The list of widgets to display inside the overflow bar.
  final List<Widget> children;

  /// A builder function to create a custom menu button for the overflowed
  /// children.
  final Widget Function(BuildContext context, List<Widget> overflowedChildren)?
      menuBuilder;

  /// The main axis alignment of the children.
  final MainAxisAlignment mainAxisAlignment;

  /// The position of the menu button in the overflow bar.
  final MenuButtonPosition menuButtonPosition;

  /// The direction of overflow in the overflow bar.
  final OverflowDirection overflowDirection;

  /// The spacing between the children.
  final double spacing;

  /// The spacing before the first child.
  final double leadingSpacing;

  /// The spacing after the last child.
  final double trailingSpacing;

  @override
  CollapsibleOverflowBarState createState() => CollapsibleOverflowBarState();
}

/// The state for a [CollapsibleOverflowBar] widget.
///
/// The [CollapsibleOverflowBarState] class manages the overflow count and
/// updates the state when the overflow changes.
class CollapsibleOverflowBarState extends State<CollapsibleOverflowBar> {
  /// A notifier for the overflow count.
  final ValueNotifier<int> overflowCountNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    overflowCountNotifier.dispose();
    super.dispose();
  }

  void _onOverflowChanged(int count) {
    if (mounted) overflowCountNotifier.value = count;
  }

  List<Widget> _getOverflowedChildren(int overflowCount) {
    if (overflowCount <= 0) return [];
    final totalChildren = widget.children.length;
    final visibleChildCount = totalChildren - overflowCount;

    if (widget.overflowDirection == OverflowDirection.rtl) {
      // For LTR, overflowed children are at the end of the list
      return widget.children.sublist(visibleChildCount, totalChildren);
    } else {
      // For RTL, overflowed children are at the start of the list
      return widget.children.sublist(0, totalChildren - visibleChildCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rowAlignment = widget.mainAxisAlignment;
    final isMenuButtonAtEnd =
        widget.menuButtonPosition == MenuButtonPosition.end;

    return ValueListenableBuilder<int>(
      valueListenable: overflowCountNotifier,
      builder: (context, overflowCount, child) {
        Widget buildMenuButton(List<Widget> overflowedChildren) {
          if (widget.menuBuilder != null) {
            return widget.menuBuilder!(context, overflowedChildren);
          } else {
            return OverflowPopupMenuButton(
              children: overflowedChildren,
            );
          }
        }

        final List<Widget> overflowedChildren =
            _getOverflowedChildren(overflowCount);

        return Row(
          // textDirection: TextDirection.rtl,
          mainAxisAlignment: rowAlignment,
          children: [
            if (!isMenuButtonAtEnd && overflowCount > 0)
              buildMenuButton(overflowedChildren),
            Flexible(
              child: AnimatedSize(
                duration: AnimationConstants.shortDuration,
                child: OverflowRow(
                  overflowDirection: widget.overflowDirection,
                  spacing: widget.spacing,
                  leadingSpacing: widget.leadingSpacing,
                  trailingSpacing: widget.trailingSpacing,
                  children: widget.children,
                  onOverflowChanged: (count) =>
                      mounted ? _onOverflowChanged(count) : null,
                ),
              ),
            ),
            if (isMenuButtonAtEnd && overflowCount > 0)
              buildMenuButton(overflowedChildren),
          ],
        );
      },
    );
  }
}
