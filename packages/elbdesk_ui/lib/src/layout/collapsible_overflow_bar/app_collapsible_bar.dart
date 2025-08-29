import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/widgets/collapsible_overflow_bar.dart';
import 'package:flutter/material.dart';

/// A widget that displays a collapsible bar with overflow handling.
///
/// The [AppCollapsibleBar] widget is a stateless widget that arranges its
/// children in a horizontal row and handles overflow by collapsing the excess
/// children into a menu button. The position of the menu button, the direction
/// of overflow, and the spacing between children can be customized.
///
/// {@tool snippet}
/// This example shows how to use [AppCollapsibleBar] with some text widgets:
///
/// ```dart
/// AppCollapsibleBar(
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///     Text('Item 3'),
///   ],
///   mainAxisAlignment: MainAxisAlignment.end,
///   menuButtonPosition: MenuButtonPosition.start,
///   overflowDirection: OverflowDirection.ltr,
///   spacing: 8.0,
///   leadingSpacing: 4.0,
///   trailingSpacing: 4.0,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [CollapsibleOverflowBar], which is the underlying widget used to handle
/// overflow.
///  * [AppOverlay], which is used to display the overflowed children in a
/// popup.
class AppCollapsibleBar extends StatelessWidget {
  /// Creates an [AppCollapsibleBar] widget.
  ///
  /// The [children] parameter must not be null.
  const AppCollapsibleBar({
    required this.children,
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.menuButtonPosition = MenuButtonPosition.end,
    this.overflowDirection = OverflowDirection.ltr,
    this.spacing = 0.0,
    this.leadingSpacing = 0.0,
    this.trailingSpacing = 0.0,
  });

  /// The list of widgets to display inside the collapsible bar.
  final List<Widget> children;

  /// The main axis alignment of the children.
  final MainAxisAlignment mainAxisAlignment;

  /// The position of the menu button in the collapsible bar.
  final MenuButtonPosition menuButtonPosition;

  /// The direction of overflow in the collapsible bar.
  final OverflowDirection overflowDirection;

  /// The spacing between the children.
  final double spacing;

  /// The spacing before the first child.
  final double leadingSpacing;

  /// The spacing after the last child.
  final double trailingSpacing;

  @override
  Widget build(BuildContext context) {
    return CollapsibleOverflowBar(
      mainAxisAlignment: mainAxisAlignment,
      menuButtonPosition: menuButtonPosition,
      spacing: spacing,
      leadingSpacing: leadingSpacing,
      trailingSpacing: trailingSpacing,
      overflowDirection: overflowDirection,
      menuBuilder: (context, overflowedChildren) {
        return AppOverlay(
          showBarrier: false,
          targetAnchor: Alignment.bottomLeft,
          child: (controller) {
            return _MorePopupButton(
              controller: controller,
              useSmallButton: true,
            );
          },
          overlay: (controller) {
            const spacing = UiConstants.defaultPadding / 2;
            return AppWindow.fixed(
              width: 234,
              contentPadding: const EdgeInsets.all(
                UiConstants.defaultPadding / 2,
              ),
              child: Center(
                child: Wrap(
                  runSpacing: spacing,
                  spacing: spacing,
                  children: overflowedChildren,
                ),
              ),
            );
          },
        );
      },
      children: children,
    );
  }
}

class _MorePopupButton extends StatelessWidget {
  const _MorePopupButton({
    required this.controller,
    required this.useSmallButton,
  });

  final AppOverlayController controller;
  final bool useSmallButton;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return useSmallButton
        ? AppIconButton.secondary(
            iconData: Icons.more_vert,
            onPressed: controller.show,
          )
        : AppButton.secondary(
            iconData: Icons.more_vert,
            onPressed: controller.show,
            label: l10n.gen_more,
          );
  }
}
