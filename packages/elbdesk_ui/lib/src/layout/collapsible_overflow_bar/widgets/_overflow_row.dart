import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/models/overflow_direction.dart';
import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/rendering/_render_overflow_row.dart';
import 'package:flutter/widgets.dart';

/// A widget that arranges its children in a horizontal row and handles
/// overflow.
///
/// The [OverflowRow] widget is a [MultiChildRenderObjectWidget] that arranges
/// its children in a horizontal row. If the children overflow the available
/// space, it notifies the parent using the [onOverflowChanged] callback. The
/// direction of overflow, spacing between children, and leading/trailing
/// spacing can be customized.
///
/// {@tool snippet}
/// This example shows how to use [OverflowRow] with some text widgets:
///
/// ```dart
/// OverflowRow(
///   children: [
///     Text('Item 1'),
///     Text('Item 2'),
///     Text('Item 3'),
///   ],
///   onOverflowChanged: (count) {
///     print('Overflow count: $count');
///   },
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
///  * [RenderOverflowRow], which is the underlying render object for this
/// widget.
///  * [OverflowDirection], which specifies the direction of overflow.
class OverflowRow extends MultiChildRenderObjectWidget {
  /// Creates an [OverflowRow] widget.
  ///
  /// The [children] and [onOverflowChanged] parameters must not be null.
  const OverflowRow({
    required super.children,
    required this.onOverflowChanged,
    super.key,
    this.overflowDirection = OverflowDirection.ltr,
    this.spacing = 0.0,
    this.leadingSpacing = 0.0,
    this.trailingSpacing = 0.0,
  });

  /// Callback function that is called when the overflow count changes.
  ///
  // ignore: comment_references
  /// The [overflowCount] parameter indicates the number of children that
  /// overflow the available space.
  final void Function(int overflowCount) onOverflowChanged;

  /// The direction in which the children overflow.
  ///
  /// Defaults to [OverflowDirection.ltr].
  final OverflowDirection overflowDirection;

  /// The spacing between the children.
  ///
  /// Defaults to 0.0.
  final double spacing;

  /// The spacing before the first child.
  ///
  /// Defaults to 0.0.
  final double leadingSpacing;

  /// The spacing after the last child.
  ///
  /// Defaults to 0.0.
  final double trailingSpacing;

  @override
  RenderOverflowRow createRenderObject(BuildContext context) {
    return RenderOverflowRow(
      onOverflowChanged: onOverflowChanged,
      overflowDirection: overflowDirection,
      spacing: spacing,
      leadingSpacing: leadingSpacing,
      trailingSpacing: trailingSpacing,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderOverflowRow renderObject,
  ) {
    renderObject
      ..onOverflowChanged = onOverflowChanged
      ..overflowDirection = overflowDirection
      ..spacing = spacing
      ..leadingSpacing = leadingSpacing
      ..trailingSpacing = trailingSpacing;
  }
}
