import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTag extends StatelessWidget {
  const ElbTag({
    required this.color,
    required this.label,
    this.textColor,
    this.onPressed,
    this.isSelected = true,
    this.hideDot = false,
    this.disableDot = false,
    this.child,
    this.useOpacity = true,
    super.key,
  });
  final Color color;
  final String? label;
  final Color? textColor;
  final VoidCallback? onPressed;
  final bool isSelected;
  final Widget? child;
  final bool hideDot;
  final bool disableDot;
  final bool useOpacity;
  @override
  Widget build(BuildContext context) {
    final foregroundColor = isSelected
        ? context.appTheme.textStyles.defaultText.color
        : context.appTheme.textStyles.defaultText.color?.withAppOpacity(0.6);
    final transparent = context.appTheme.generalColors.transparent;
    final borderRadius = context.appTheme.borderRadiuses.xl;

    return ExcludeFocusTraversal(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSpace.xxs,
        ),
        child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              isSelected
                  ? color.withAppOpacity(useOpacity ? 0.15 : 1)
                  : useOpacity
                      ? transparent
                      : color.withAppOpacity(0.4),
            ),
            foregroundColor: WidgetStateProperty.all(
              foregroundColor,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
            side: WidgetStateProperty.all(
              BorderSide(
                color: color.withAppOpacity(0.7),
              ),
            ),
            padding: WidgetStateProperty.all(
              EdgeInsets.zero,
            ),
            minimumSize: WidgetStateProperty.all(Size.zero),
            elevation: WidgetStateProperty.all(0),
            overlayColor: WidgetStateProperty.all(
              color.withAppOpacity(0.2),
            ),
            splashFactory: NoSplash.splashFactory,
            visualDensity: VisualDensity.compact,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpace.s,
              vertical: AppSpace.xs,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!hideDot && !disableDot)
                  _AnimatedPrefixDot(isSelected: isSelected, color: color),
                child ??
                    AppText(
                      label ?? '',
                      color: textColor ?? foregroundColor,
                      maxLines: 1,
                      fontSize: 13,
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AnimatedPrefixDot extends StatelessWidget {
  const _AnimatedPrefixDot({
    required this.isSelected,
    required this.color,
  });

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: AnimationConstants.defaultDuration,
      curve: AnimationConstants.defaultCurve,
      // when changing padding or size of the child also needs to be changed
      width: isSelected ? 20 : 0,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSpace.xs,
          right: AppSpace.s,
        ),
        child: Container(
          width: AppSpace.s,
          height: AppSpace.s,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
