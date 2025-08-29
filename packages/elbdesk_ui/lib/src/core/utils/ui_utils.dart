import 'package:flutter/material.dart';

/// A utility class for UI-related helper methods.
///
/// The [UiUtils] class provides static methods to assist with common UI tasks,
/// such as retrieving the position and size of a widget.
class UiUtils {
  /// Private constructor to prevent instantiation.
  const UiUtils._();

  /// Retrieves the position and size of a widget given its [GlobalKey].
  ///
  /// This method returns a tuple containing the [Offset] position and [Size] of
  /// the widget. If the widget is not mounted or the render object is not a
  /// [RenderBox], it returns `null`.
  ///
  /// Example usage:
  /// ```dart
  /// final widgetKey = GlobalKey();
  /// final widgetInfo = UiUtils.getWidgetPositionAndSize(widgetKey);
  /// if (widgetInfo != null) {
  ///   print('Position: ${widgetInfo.position}, Size: ${widgetInfo.size}');
  /// }
  /// ```
  ///
  /// - [widgetKey]: The [GlobalKey] of the widget whose position and size are
  /// to be retrieved.
  ///
  /// Returns a tuple containing the [Offset] position and [Size] of the
  /// widget, or `null` if the widget is not mounted.
  static ({Offset position, Size size})? getWidgetPositionAndSize(
    GlobalKey widgetKey,
  ) {
    // Check if the widget is mounted
    if (widgetKey.currentContext == null) {
      return null;
    }

    // Retrieve the render object and cast it to RenderBox
    final renderBox =
        widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return null;
    }

    // Get the position and size of the widget
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    return (position: position, size: size);
  }
}
