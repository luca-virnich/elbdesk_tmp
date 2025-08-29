import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Defines the type of the divider, either horizontal or vertical.
enum _AppDividerType {
  horizontal,
  vertical,
}

/// A custom divider widget that can be either horizontal or vertical.
///
/// The [AppDivider] widget is used to create a divider with customizable
/// thickness, height, width, and color. It can be either horizontal or
/// vertical based on the constructor used.
///
/// {@tool snippet}
/// This example shows how to use [AppDivider] as a horizontal divider:
///
/// ```dart
/// AppDivider(
///   thickness: 2.0,
///   height: 10.0,
///   color: Colors.grey,
/// )
/// ```
///
/// This example shows how to use [AppDivider] as a vertical divider:
///
/// ```dart
/// AppDivider.vertical(
///   thickness: 2.0,
///   width: 10.0,
///   color: Colors.grey,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Divider], which is used for horizontal dividers.
///  * [VerticalDivider], which is used for vertical dividers.
class AppDivider extends StatelessWidget {
  /// Creates a horizontal [AppDivider].
  ///
  /// The [thickness], [height], and [color] parameters are optional.
  const AppDivider({
    super.key,
    this.thickness = 1.0,
    this.height = 1,
    this.color,
  })  : _type = _AppDividerType.horizontal,
        width = null,
        length = null;

  /// Creates a vertical [AppDivider].
  ///
  /// The [thickness], [width], and [color] parameters are optional.
  const AppDivider.vertical({
    super.key,
    this.thickness = 1.0,
    this.width = 1.0,
    this.color,
  })  : _type = _AppDividerType.vertical,
        height = null,
        length = null;

  /// The thickness of the divider.
  final double thickness;

  /// The height of the horizontal divider.
  final double? height;

  /// The width of the vertical divider.
  final double? width;

  /// The color of the divider.
  final Color? color;

  /// The type of the divider, either horizontal or vertical.
  final _AppDividerType _type;

  /// The length of the divider (not used but kept for consistency).
  final double? length;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.appTheme.generalColors.divider;
    return _type == _AppDividerType.horizontal
        ? Divider(
            thickness: thickness,
            height: height,
            color: color,
          )
        : VerticalDivider(
            thickness: thickness,
            width: width,
            color: color,
          );
  }
}
