import 'package:elbdesk_ui/src/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

/// A widget that displays an information bar with customizable content.
///
/// The [InfoBar] widget is a stateless widget that displays a bar with a
/// background color and a list of child widgets. It is typically used to
/// show important messages or alerts at the top of a screen.
///
/// {@tool snippet}
/// This example shows how to create an [InfoBar] with some text and an icon:
///
/// ```dart
/// InfoBar(
///   height: 50,
///   children: [
///     Icon(Icons.info, color: Colors.white),
///     SizedBox(width: 8),
///     Text('This is an info bar', style: TextStyle(color: Colors.white)),
///   ],
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Container], which is used to create the background and padding.
///  * [Row], which is used to arrange the child widgets horizontally.
class InfoBar extends StatelessWidget {
  /// Creates an [InfoBar] widget.
  ///
  /// The [children] parameter must not be null.
  const InfoBar({
    required this.children,
    required this.color,
    this.height,
    this.mainAxisAlignment = MainAxisAlignment.start,
    super.key,
  });

  /// The list of widgets to display inside the info bar.
  final List<Widget> children;

  /// The height of the info bar. If null, the height will be determined by its
  /// content.
  final double? height;

  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    // Retrieve the color scheme for the info bar from the context.

    // Return a container with the specified height and background color.
    return Container(
      height: height,
      color: color,
      child: Padding(
        // Apply padding to the container, with a custom right padding.
        padding: const EdgeInsets.symmetric(
          horizontal: UiConstants.defaultPadding,
          vertical: UiConstants.defaultPadding / 2,
        ),
        // Arrange the child widgets in a horizontal row.
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        ),
      ),
    );
  }
}
