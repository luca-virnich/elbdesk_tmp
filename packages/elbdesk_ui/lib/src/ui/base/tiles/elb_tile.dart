import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTile extends StatelessWidget {
  const ElbTile({
    required this.child,
    super.key,
    this.buttonBorderRadius,
    this.onPressed,
    this.contentPadding,
    this.tooltip,
  });

  final double? buttonBorderRadius;
  final Widget child;
  final VoidCallback? onPressed;
  final EdgeInsets? contentPadding;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    return ElbInkWell(
      borderRadius: buttonBorderRadius,
      onTap: onPressed,
      child: AppTooltip(
        message: tooltip,
        child: Container(
          padding: contentPadding ??
              const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 16,
              ),
          child: child,
        ),
      ),
    );
  }
}
