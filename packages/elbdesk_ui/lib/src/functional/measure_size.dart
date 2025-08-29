import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// Signature for a function that is called when the size of a widget changes.
// typedef OnWidgetSizeChange = void Function(Size size);

/// A widget that measures the size of its child and notifies when the size
/// changes.
///
/// The [ElbMeasureSize] widget is used to measure the size of its child widget and
/// calls the [onChange] callback whenever the size changes. This can be useful
/// for scenarios where you need to react to size changes of a widget.
///
/// {@tool snippet}
/// This example shows how to use [ElbMeasureSize] to measure the size of a widget:
///
/// ```dart
/// MeasureSize(
///   onChange: (size) {
///     print('Size changed: $size');
///   },
///   child: Container(
///     width: 100,
///     height: 100,
///     color: Colors.blue,
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [SingleChildRenderObjectWidget], which is the base class for widgets that
///    have a single child.
class ElbMeasureSize extends SingleChildRenderObjectWidget {
  /// Creates a [ElbMeasureSize] widget.
  ///
  /// The [onChange] parameter must not be null.
  const ElbMeasureSize({
    required this.onChange,
    required Widget super.child,
    super.key,
  });

  /// Called when the size of the child widget changes.
  final void Function(Size size) onChange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    covariant MeasureSizeRenderObject renderObject,
  ) {
    renderObject.onChange = onChange;
  }
}

/// A render object that measures the size of its child and notifies when the
/// size changes.
///
/// The [MeasureSizeRenderObject] class is used by the [ElbMeasureSize] widget to
/// measure the size of its child and call the [onChange] callback whenever the
/// size changes.
class MeasureSizeRenderObject extends RenderProxyBox {
  /// Creates a [MeasureSizeRenderObject].
  ///
  /// The [onChange] parameter must not be null.
  MeasureSizeRenderObject(this.onChange);

  /// The previous size of the child widget.
  Size? oldSize;

  /// Called when the size of the child widget changes.
  void Function(Size size) onChange;

  @override
  void performLayout() {
    super.performLayout();

    final newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}
