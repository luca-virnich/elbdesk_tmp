import 'package:flutter/material.dart';

class LayoutWidthBuilder extends StatelessWidget {
  const LayoutWidthBuilder({
    required this.builder,
    super.key,
    this.width,
  });
  final double? width;

  final Widget Function(double width) builder;

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return builder(width!);
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return builder(constraints.maxWidth);
      },
    );
  }
}
