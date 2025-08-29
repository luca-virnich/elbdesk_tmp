import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUnderlinedTextButton extends StatefulWidget {
  const AppUnderlinedTextButton({
    required this.text,
    this.onPressed,
    super.key,
    this.decorationColor,
    this.textColor,
    this.showAlwaysUnderline = false,
    this.fontSize = 17,
    this.onShiftPressed,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });
  final String text;
  final VoidCallback? onPressed;
  final Color? decorationColor;
  final Color? textColor;
  final bool showAlwaysUnderline;
  final double fontSize;
  final VoidCallback? onShiftPressed;
  final int maxLines;
  final TextOverflow overflow;
  @override
  State<AppUnderlinedTextButton> createState() =>
      _AppUnderlinedTextButtonState();
}

class _AppUnderlinedTextButtonState extends State<AppUnderlinedTextButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor =
        widget.textColor ?? context.appTheme.generalColors.primary;
    final decorationColor =
        widget.decorationColor ?? context.appTheme.generalColors.primary;
    return GestureDetector(
      onTap: () {
        final isShiftPressed = HardwareKeyboard.instance.isShiftPressed;
        if (isShiftPressed) {
          widget.onShiftPressed?.call();
        }
        widget.onPressed?.call();
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AppText(
          maxLines: widget.maxLines,
          overflow: widget.overflow,
          widget.text,
          style: TextStyle(
            color: textColor,
            fontSize: widget.fontSize,
            decorationColor: decorationColor,
            decorationThickness: 1,
            height: 1,
            decoration: widget.showAlwaysUnderline || isHovered
                ? TextDecoration.underline
                : null,
          ),
        ),
      ),
    );
  }
}
