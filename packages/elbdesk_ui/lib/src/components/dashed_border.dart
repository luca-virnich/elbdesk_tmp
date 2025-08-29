import 'package:flutter/material.dart';

/// Dashed Border
///
/// Used in file drop area
class DashedBorder extends Border {
  const DashedBorder({
    super.top,
    super.right,
    super.bottom,
    super.left,
    this.dashLength = 5,
    this.gap = 3,
    this.borderRadius,
  });

  factory DashedBorder.fromBorderSide({
    required BorderSide borderSide,
    double dashLength = 5,
    double gap = 3,
    BorderRadius? borderRadius,
  }) {
    return DashedBorder(
      top: borderSide,
      right: borderSide,
      bottom: borderSide,
      left: borderSide,
      dashLength: dashLength,
      gap: gap,
      borderRadius: borderRadius,
    );
  }

  final double dashLength;
  final double gap;
  final BorderRadius? borderRadius;

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    TextDirection? textDirection,
    BoxShape shape = BoxShape.rectangle,
    BorderRadius? borderRadius,
  }) {
    final paint = Paint()
      ..strokeWidth = top.width
      ..color = top.color
      ..style = PaintingStyle.stroke;

    final path = Path();
    final rrect = (this.borderRadius ?? borderRadius)?.toRRect(rect) ??
        RRect.fromRectXY(rect, 0, 0);

    path.addRRect(rrect);

    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      double distance = 0;
      var draw = true;
      while (distance < metric.length) {
        if (draw) {
          canvas.drawPath(
            metric.extractPath(distance, distance + dashLength),
            paint,
          );
        }
        distance += dashLength;
        distance += gap;
        draw = !draw;
      }
    }
  }
}
