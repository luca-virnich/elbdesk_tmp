import 'package:flutter/material.dart';

/// A widget that arranges its children in a row with optional leading, middle,
/// and trailing widgets.
///
/// The [AppTripleRail] widget is used to create a row layout with three
/// sections: leading, middle, and trailing. The leading and trailing sections
/// are aligned to the left and right respectively, while the middle section is
/// placed between them. It supports customization of height, padding,
/// background color, and border radius.
///
/// {@tool snippet}
/// This example shows how to create an [AppTripleRail] with leading, middle,
/// and trailing widgets:
///
/// ```dart
/// AppTripleRail(
///   leading: Icon(Icons.menu),
///   middle: Text('Title'),
///   trailing: Icon(Icons.search),
///   height: 50,
///   color: Colors.blue,
///   padding: EdgeInsets.all(8),
///   borderRadius: BorderRadius.circular(8),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Row], which is used to create the row layout.
///  * [Container], which is used to apply decoration and padding.
class AppTripleRail extends StatelessWidget {
  /// Creates an [AppTripleRail].
  ///
  /// The [leading], [middle], and [trailing] parameters are optional.
  const AppTripleRail({
    super.key,
    this.leading,
    this.middle,
    this.trailing,
    this.height,
    this.color,
    this.padding,
    this.borderRadius,
  });

  /// The widget to display in the leading section.
  final Widget? leading;

  /// The widget to display in the middle section.
  final Widget? middle;

  /// The widget to display in the trailing section.
  final Widget? trailing;

  /// The height of the widget.
  final double? height;

  /// The padding to apply around the content.
  final EdgeInsets? padding;

  /// The background color of the widget.
  final Color? color;

  /// The border radius of the widget.
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      height: height,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                heightFactor: 1,
                child: leading,
              ),
            ),
            if (middle != null) middle!,
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                heightFactor: 1,
                child: trailing,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
