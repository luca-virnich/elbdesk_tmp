import 'package:elbdesk_ui/src/core/constants/app_icon_size.dart';
import 'package:elbdesk_ui/src/core/theme/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

/// A widget that displays an icon with customizable size and color.
///
/// The [ElbIcon] widget is used to display an icon with a specified [iconData].
/// The size and color of the icon can be customized using the [size] and
/// [color] parameters, respectively. If the [size] is not provided, it
/// defaults to the large size defined in [AppIconSize].
///
/// {@tool snippet}
/// This example shows how to use [ElbIcon] with default size:
///
/// ```dart
/// AppIcon(Icons.home)
/// ```
///
/// This example shows how to use [ElbIcon] with custom size and color:
///
/// ```dart
/// AppIcon(
///   Icons.home,
///   size: AppIconSize.m,
///   color: Colors.blue,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Icon], which is the underlying widget used to display the icon.
///  * [AppIconSize], which defines the standard sizes for icons.
class ElbIcon extends StatelessWidget {
  /// Creates an [ElbIcon] widget.
  ///
  /// The [iconData] parameter must not be null.
  const ElbIcon(
    this.iconData, {
    this.size,
    this.color,
    super.key,
  }) : _isDanger = false;

  /// Creates a danger-themed [ElbIcon] widget.
  ///
  /// The [iconData] parameter must not be null.
  /// By default, the icon will be displayed in the theme's danger color.
  const ElbIcon.danger(
    this.iconData, {
    this.size,
    this.color,
    super.key,
  }) : _isDanger = true;

  /// The icon to display.
  final IconData iconData;

  /// The size of the icon.
  final AppIconSize? size;

  /// The color of the icon.
  final Color? color;

  final bool _isDanger;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: size?.value ?? AppIconSize.m.value,
      color: color ??
          (_isDanger
              ? context.appTheme.buttonStyles.danger.foregroundColor
              : context.appTheme.buttonStyles.secondary.foregroundColor),
    );
  }
}
