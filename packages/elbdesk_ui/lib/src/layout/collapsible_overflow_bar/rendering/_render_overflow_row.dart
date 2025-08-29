import 'dart:math';

import 'package:elbdesk_ui/src/layout/collapsible_overflow_bar/models/overflow_direction.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

/// Parent data for children of [RenderOverflowRow].
///
/// The [OverflowRowParentData] class extends [ContainerBoxParentData] and
/// includes an additional property [visible] to indicate whether the child
/// is visible or not.
class OverflowRowParentData extends ContainerBoxParentData<RenderBox> {
  /// Whether the child is visible.
  bool visible = true;
}

/// A render object that arranges its children in a horizontal row and handles
/// overflow.
///
/// The [RenderOverflowRow] class extends [RenderBox] and arranges its children
/// in a horizontal row. If the children overflow the available space, it
/// notifies the parent using the [onOverflowChanged] callback. The direction
/// of overflow, spacing between children, and leading/trailing spacing can be
/// customized.
class RenderOverflowRow extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, OverflowRowParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, OverflowRowParentData> {
  /// Creates a [RenderOverflowRow] with the specified properties.
  ///
  /// The [onOverflowChanged] parameter must not be null.
  RenderOverflowRow({
    required void Function(int overflowCount) onOverflowChanged,
    OverflowDirection overflowDirection = OverflowDirection.ltr,
    double spacing = 0.0,
    double leadingSpacing = 0.0,
    double trailingSpacing = 0.0,
  })  : _onOverflowChanged = onOverflowChanged,
        _overflowDirection = overflowDirection,
        _spacing = spacing,
        _leadingSpacing = leadingSpacing,
        _trailingSpacing = trailingSpacing;

  /// Callback function that is called when the overflow count changes.
  ///
  /// The [overflowCount] parameter indicates the number of children that
  /// overflow the available space.
  void Function(int overflowCount) _onOverflowChanged;

  /// The direction in which the children overflow.
  OverflowDirection _overflowDirection;

  /// The spacing between the children.
  double _spacing;

  /// The spacing before the first child.
  double _leadingSpacing;

  /// The spacing after the last child.
  double _trailingSpacing;

  /// Sets the [onOverflowChanged] callback and marks the layout as needing to
  /// be updated.
  // ignore: avoid_setters_without_getters
  set onOverflowChanged(void Function(int overflowCount) value) {
    if (_onOverflowChanged != value) {
      _onOverflowChanged = value;
      markNeedsLayout();
    }
  }

  /// Sets the [overflowDirection] and marks the layout as needing to be
  /// updated.
  // ignore: avoid_setters_without_getters
  set overflowDirection(OverflowDirection value) {
    if (_overflowDirection != value) {
      _overflowDirection = value;
      markNeedsLayout();
    }
  }

  /// Sets the [spacing] between children and marks the layout as needing to be
  /// updated.
  // ignore: avoid_setters_without_getters
  set spacing(double value) {
    if (_spacing != value) {
      _spacing = value;
      markNeedsLayout();
    }
  }

  /// Sets the [leadingSpacing] before the first child and marks the layout as
  /// needing to be updated.
  // ignore: avoid_setters_without_getters
  set leadingSpacing(double value) {
    if (_leadingSpacing != value) {
      _leadingSpacing = value;
      markNeedsLayout();
    }
  }

  /// Sets the [trailingSpacing] after the last child and marks the layout as
  /// needing to be updated.
  // ignore: avoid_setters_without_getters
  set trailingSpacing(double value) {
    if (_trailingSpacing != value) {
      _trailingSpacing = value;
      markNeedsLayout();
    }
  }

  /// The previous overflow count.
  int _previousOverflowCount = -1;

  /// The current overflow count.
  int overflowCount = 0;

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! OverflowRowParentData) {
      child.parentData = OverflowRowParentData();
    }
  }

  @override
  void performLayout() {
    final maxWidth = constraints.maxWidth;
    final children = getChildrenAsList();
    final childCount = children.length;

    // Layout all children and collect their sizes.
    final childWidths = <double>[];
    final childHeights = <double>[];

    // Layout each child
    final childConstraints = BoxConstraints(
      // maxWidth: constraints.maxWidth,
      maxHeight: constraints.maxHeight,
    );

    for (final child in children) {
      child.layout(childConstraints.loosen(), parentUsesSize: true);
      childWidths.add(child.size.width);
      childHeights.add(child.size.height);
    }

    // ignore: prefer_int_literals
    final maxHeight = childHeights.fold(0.0, max);

    var visibleChildCount = 0;

    if (_overflowDirection == OverflowDirection.rtl) {
      // Calculate cumulative widths from the start.
      var cumulativeWidth = _leadingSpacing; // Start with leadingSpacing
      for (var i = 0; i < childCount; i++) {
        if (i > 0) {
          cumulativeWidth += _spacing;
        }
        cumulativeWidth += childWidths[i];
        final totalWidthWithTrailing = cumulativeWidth + _trailingSpacing;
        if (totalWidthWithTrailing <= maxWidth) {
          visibleChildCount = i + 1;
        } else {
          break;
        }
      }
    } else {
      // Calculate cumulative widths from the end.
      var cumulativeWidth = _leadingSpacing; // Start with leadingSpacing
      for (var i = childCount - 1; i >= 0; i--) {
        if (i < childCount - 1) {
          cumulativeWidth += _spacing;
        }
        cumulativeWidth += childWidths[i];
        final totalWidthWithTrailing = cumulativeWidth + _trailingSpacing;
        if (totalWidthWithTrailing <= maxWidth) {
          visibleChildCount = childCount - i;
        } else {
          break;
        }
      }
    }

    overflowCount = childCount - visibleChildCount;

    // Position the visible children.
    var currentX = _leadingSpacing;
    if (_overflowDirection == OverflowDirection.rtl) {
      for (var i = 0; i < childCount; i++) {
        final child = children[i];
        final childParentData = child.parentData! as OverflowRowParentData;
        if (i < visibleChildCount) {
          childParentData.visible = true;
          if (currentX > _leadingSpacing && _spacing > 0.0) {
            currentX += _spacing;
          }
          childParentData.offset = Offset(currentX, 0);
          currentX += child.size.width;
        } else {
          childParentData.visible = false;
        }
      }
    } else {
      for (var i = childCount - visibleChildCount; i < childCount; i++) {
        final child = children[i];
        final childParentData = child.parentData! as OverflowRowParentData;
        if (currentX > _leadingSpacing && _spacing > 0.0) {
          currentX += _spacing;
        }
        childParentData
          ..visible = true
          ..offset = Offset(currentX, 0);
        currentX += child.size.width;
      }
      // Hide the other children
      for (var i = 0; i < childCount - visibleChildCount; i++) {
        final child = children[i];
        final childParentData = child.parentData! as OverflowRowParentData
          ..visible = false;
      }
    }

    if (visibleChildCount > 0) {
      currentX +=
          _trailingSpacing; // Add trailingSpacing if there are visible children
    } else {
      currentX = 0.0; // No visible children, so total width is zero
    }

    size = constraints.constrain(Size(currentX, maxHeight));

    // Notify about the overflow count
    if (overflowCount != _previousOverflowCount) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        _onOverflowChanged(overflowCount);
      });
      _previousOverflowCount = overflowCount;
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    for (final child in getChildrenAsList()) {
      final childParentData = child.parentData! as OverflowRowParentData;
      if (childParentData.visible) {
        context.paintChild(child, offset + childParentData.offset);
      }
    }
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    for (final child in getChildrenAsList().reversed) {
      final childParentData = child.parentData! as OverflowRowParentData;
      if (!childParentData.visible) continue;

      if (!child.hasSize) continue;

      final isHit = result.addWithPaintOffset(
        offset: childParentData.offset,
        position: position,
        hitTest: (result, transformed) {
          return child.hitTest(result, position: transformed);
        },
      );
      if (isHit) return true;
    }
    return false;
  }
}
