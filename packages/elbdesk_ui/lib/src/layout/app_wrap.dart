import 'package:elbdesk_ui/src/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

/// A widget that arranges its children in a wrap layout with customizable
/// spacing and alignment.
///
/// The [AppWrap] widget is used to create a wrap layout where the children are
/// arranged in horizontal rows and can wrap to the next line if there is not
/// enough horizontal space. It supports customization of the spacing between
/// children, the alignment of the children within a row, and the alignment of
/// the rows.
///
/// {@tool snippet}
/// This example shows how to create an [AppWrap] with some children and custom
/// alignment:
///
/// ```dart
/// AppWrap(
///   crossAxisAlignment: WrapCrossAlignment.start,
///   children: [
///     Text('Child 1'),
///     Text('Child 2'),
///     Text('Child 3'),
///   ],
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Wrap], which is the underlying widget used to create the wrap layout.
///  * [Column], which arranges its children in a vertical layout.
class AppWrap extends StatelessWidget {
  /// Creates an [AppWrap].
  ///
  /// The [children] parameter must not be null.
  const AppWrap({
    required this.children,
    super.key,
    this.crossAxisAlignment = WrapCrossAlignment.center,
    this.alignment = WrapAlignment.center,
    this.runAlignment = WrapAlignment.center,
    this.spacing,
    this.runSpacing,
  });

  /// The list of widgets to display as children in the wrap layout.
  final List<Widget> children;

  /// How the children within a row should be aligned relative to each other.
  final WrapCrossAlignment crossAxisAlignment;

  final WrapAlignment alignment;

  final WrapAlignment runAlignment;

  final double? spacing;

  final double? runSpacing;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: spacing ?? UiConstants.elementMargin,
      runSpacing: runSpacing ?? UiConstants.elementMargin,
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: children,
    );
  }
}
