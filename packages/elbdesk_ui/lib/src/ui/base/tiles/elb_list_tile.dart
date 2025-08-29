import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

// TODO(tk): Check height & adjust columns from table to match beautiful
/// A custom list tile widget that provides additional customization options.
///
/// The [ElbListTile] widget is a highly customizable list tile that can be used
/// to display a leading widget, a title, a trailing widget, and a child widget.
/// It also supports various styling options such as background color, hover
/// color, content padding, and more.
///
/// {@tool snippet}
/// This example shows how to create an [ElbListTile] with a title, leading,
/// and trailing widgets:
///
/// ```dart
/// AppListTile(
///   onPressed: () {
///     // Handle the tap event
///   },
///   leading: Icon(Icons.star),
///   titleText: 'Title',
///   trailing: Icon(Icons.chevron_right),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [ListTile], which is a similar widget provided by the Flutter framework.
class ElbListTile extends StatelessWidget {
  /// Creates an [ElbListTile].
  ///
  /// The [onPressed] callback must not be null.
  const ElbListTile({
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.end,
    super.key,
    this.height,
    this.onDoubleTap,
    this.titleText,
    this.child,
    this.trailing,
    this.leading,
    this.contentPadding,
    this.hoverColor,
    this.titleTextStyle,
    this.backgroundColor,
    this.tooltipText,
    this.isActive = false,
    this.buttonBorderRadius,
    this.onSecondaryTap,
  });

  /// Called when the user taps the list tile.
  final VoidCallback? onPressed;

  /// The height of the list tile.
  final double? height;

  /// The text to display as the title of the list tile.
  final String? titleText;

  /// The widget to display as the child of the list tile.
  final Widget? child;

  /// The widget to display at the trailing end of the list tile.
  final Widget? trailing;

  /// The widget to display at the leading end of the list tile.
  final Widget? leading;

  /// The padding to apply to the content of the list tile.
  final EdgeInsets? contentPadding;

  /// The color to use for the list tile when it is hovered over.
  final Color? hoverColor;

  /// The text style to use for the title text.
  final TextStyle? titleTextStyle;

  /// The main axis alignment for the row of children.
  final MainAxisAlignment mainAxisAlignment;

  /// The background color of the list tile.
  final Color? backgroundColor;

  /// Whether the list tile is active.
  final bool isActive;

  /// The text to display in the tooltip for the list tile.
  final String? tooltipText;

  /// The border radius of the list tile and its hover state
  final double? buttonBorderRadius;
  final VoidCallback? onSecondaryTap;
  final VoidCallback? onDoubleTap;
  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final primaryColor = appTheme.generalColors.primary;
    final activeOverlay = primaryColor.withAppOpacity(0.1);
    final actieBorderColor = primaryColor.withAppOpacity(0.3);
    final padding =
        contentPadding ?? const EdgeInsets.all(UiConstants.defaultPadding);

    final bgColor = isActive ? activeOverlay : backgroundColor;
    final borderColor = isActive ? actieBorderColor : null;
    return AppTooltip(
      message: tooltipText,
      waitDuration: const Duration(milliseconds: 1000),
      child: ElbInkWell(
        onDoubleTap: onDoubleTap,
        onTap: onPressed,
        onSecondaryTap: onSecondaryTap,
        hoverColor: hoverColor,
        borderRadius: buttonBorderRadius,
        borderColor: borderColor,
        backgroundColor: bgColor,
        child: SizedBox(
          height: height,
          child: AnimatedPadding(
            duration: AnimationConstants.defaultDuration,
            curve: AnimationConstants.defaultCurve,
            padding: padding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment,

              children: [
                leading ?? const SizedBox(),
                if (leading != null) const SizedBox(width: 6),
                child ??
                    Expanded(
                      child: AppText(
                        titleText ?? '',
                        style: titleTextStyle ?? context.appTheme.textStyles.h3,
                      ),
                    ),
                if (trailing != null) const SizedBox(width: 6),
                trailing ?? const SizedBox(),
              ],

              // const Padding(
              //   padding: EdgeInsets.only(top: 2),
              //   child: AppIcon(
              //     Icons.chevron_right,
              //     size: 24,
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
