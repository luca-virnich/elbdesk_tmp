import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum AppOpenInNewTextButtonStyleIconPosition {
  left,
  right,
}

class AppOpenInNewTextButton extends StatefulWidget {
  const AppOpenInNewTextButton({
    required this.label,
    this.onPressed,
    this.onEnter,
    this.onExit,
    super.key,
    this.decorationColor,
    this.textColor,
    this.isDisabled = false,
    this.showAlwaysUnderline = false,
    this.fontSize = 15,
    this.tooltipMessage,
    this.onShiftPressed,
    this.highlightColorOnlyOnHover = true,
    this.iconPosition = AppOpenInNewTextButtonStyleIconPosition.left,
    this.hoverColor,
  });
  final String label;
  final VoidCallback? onPressed;
  final VoidCallback? onShiftPressed;
  final VoidCallback? onEnter;
  final VoidCallback? onExit;
  final Color? decorationColor;
  final Color? textColor;
  final Color? hoverColor;
  final bool showAlwaysUnderline;
  final double fontSize;
  final String? tooltipMessage;
  final bool highlightColorOnlyOnHover;
  final bool isDisabled;
  final AppOpenInNewTextButtonStyleIconPosition iconPosition;
  @override
  State<AppOpenInNewTextButton> createState() => _AppOpenInNewTextButtonState();
}

class _AppOpenInNewTextButtonState extends State<AppOpenInNewTextButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;
    final hoverColor = appTheme.generalColors.primary;
    final disabledColor = appTheme.buttonStyles.text.foregroundColorDisabled;

    final decorationColor =
        widget.decorationColor ?? context.appTheme.generalColors.primary;

    Color? buildTextColor() {
      if (widget.highlightColorOnlyOnHover) {
        if (isHovered) {
          return widget.hoverColor ?? hoverColor;
        }
        return widget.isDisabled ? disabledColor : widget.textColor;
      }
      return widget.textColor;
    }

    return ElbMouseRegionGestureDetector(
      onTap: () {
        final isShiftPressed = HardwareKeyboard.instance.isShiftPressed;
        if (isShiftPressed) {
          widget.onShiftPressed?.call();
        }
        widget.onPressed?.call();
      },
      onEnter: (_) {
        if (context.mounted) {
          setState(() {
            isHovered = true;
          });
          widget.onEnter?.call();
        }
      },
      onExit: (_) {
        if (context.mounted) {
          setState(() {
            isHovered = false;
          });
          widget.onExit?.call();
        }
      },
      child: AppTooltip(
        waitDuration: AnimationConstants.shortDuration,
        message: widget.tooltipMessage,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: widget.showAlwaysUnderline || isHovered
                    ? decorationColor
                    : decorationColor.withAppOpacity(0),
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.iconPosition ==
                  AppOpenInNewTextButtonStyleIconPosition.left) ...[
                ElbIcon(
                  AppIcons.open_in_new,
                  color: isHovered
                      ? hoverColor
                      : widget.isDisabled
                          ? disabledColor
                          : hoverColor,
                  size: AppIconSize.m,
                ),
                const SizedBox(width: AppSpace.s),
              ],
              Flexible(
                child: AppText(
                  widget.label,
                  fontSize: widget.fontSize,
                  color: buildTextColor(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (widget.iconPosition ==
                  AppOpenInNewTextButtonStyleIconPosition.right) ...[
                const SizedBox(width: AppSpace.s),
                ElbIcon(
                  AppIcons.open_in_new,
                  color: isHovered
                      ? hoverColor
                      : widget.isDisabled
                          ? disabledColor
                          : hoverColor,
                  size: AppIconSize.m,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
