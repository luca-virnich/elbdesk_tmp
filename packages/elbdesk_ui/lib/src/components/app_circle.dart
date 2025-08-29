import 'package:elbdesk_ui/src/core/theme/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class AppCircle extends StatelessWidget {
  const AppCircle({
    required this.radius,
    required this.color,
    this.child,
    this.contentPadding,
    this.borderColor,
    this.borderWidth,
    super.key,
  });

  final double radius;
  final Color color;
  final Widget? child;
  final EdgeInsets? contentPadding;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? context.appTheme.generalColors.transparent,
          width: borderWidth ?? 0,
        ),
      ),
      child: Padding(
        padding: contentPadding ?? EdgeInsets.zero,
        child: child,
      ),
    );
  }
}
