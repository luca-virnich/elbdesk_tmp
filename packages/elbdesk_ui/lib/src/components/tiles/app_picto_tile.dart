import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A reusable, compact pictogram tile with animated gradient, border, icon,
/// label, hover, and tooltip.
class AppPictoTile extends HookWidget {
  const AppPictoTile({
    required this.icon,
    required this.label,
    this.tooltip,
    this.onPressed,
    this.size = 55.0,
    this.width,
    this.gradientColors,
    this.borderColor,
    this.iconColor,
    this.labelColor,
    this.isLoading = false,
    this.loadingColor,
    this.borderRadius,
    this.shadowColor,
    this.isEnabled = true,
    super.key,
  });

  final IconData icon;
  final String label;
  final String? tooltip;
  final VoidCallback? onPressed;
  final double size;
  final double? width;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final Color? iconColor;
  final Color? labelColor;
  final bool isLoading;
  final Color? loadingColor;
  final double? borderRadius;
  final Color? shadowColor;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final generalColors = theme.generalColors;
    final statusColors = theme.statusColors;
    final isHovered = useState(false);

    final effectiveGradientColors = gradientColors != null
        ? List<Color>.from(gradientColors!)
        : [
            generalColors.primarySurfaceBorder.withAppOpacity(0.2),
            generalColors.primarySurfaceBorder.withAppOpacity(0),
          ];
    final effectiveBorderRadius = borderRadius ?? theme.borderRadiuses.s;
    final effectiveBorderColor = isHovered.value
        ? (borderColor ?? generalColors.primarySurfaceBorder)
        : (borderColor ??
            generalColors.primarySurfaceBorder.withAppOpacity(0.9));
    final effectiveIconColor = isEnabled
        ? (iconColor ?? generalColors.onBackground.withAppOpacity(0.85))
        : statusColors.disabled;
    final effectiveLabelColor = isEnabled
        ? (labelColor ?? generalColors.onBackground)
        : statusColors.disabled;
    final effectiveShadowColor = isHovered.value
        ? (shadowColor ?? generalColors.primary.withAppOpacity(0.05))
        : generalColors.transparent;

    final tile = ElbMouseRegionGestureDetector(
      onEnter: isEnabled ? (_) => isHovered.value = true : null,
      onExit: isEnabled ? (_) => isHovered.value = false : null,
      cursor: isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onTap: isEnabled ? onPressed : null,
      child: AnimatedContainer(
        duration: AnimationConstants.defaultDuration,
        width: width ?? size * 1.3,
        height: size,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 0.85,
            colors: effectiveGradientColors,
            stops: const [0.0, 1.0],
          ),
          borderRadius: BorderRadius.circular(effectiveBorderRadius),
          boxShadow: [
            BoxShadow(
              color: effectiveShadowColor,
              blurRadius: isHovered.value ? 6.0 : 2.5,
              spreadRadius: isHovered.value ? 1.0 : 0.25,
            ),
          ],
          border: Border.all(
            color: effectiveBorderColor,
            width: 1.5,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 1),
                    if (isLoading)
                      SizedBox(
                        height: size * 0.38,
                        width: size * 0.38,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            loadingColor ?? effectiveIconColor,
                          ),
                        ),
                      )
                    else
                      TweenAnimationBuilder<Color?>(
                        tween: ColorTween(
                          begin: effectiveIconColor,
                          end: isHovered.value
                              ? effectiveIconColor
                              : effectiveIconColor.withAppOpacity(0.9),
                        ),
                        duration: AnimationConstants.shortDuration,
                        builder: (context, color, child) => ElbIcon(
                          icon,
                          color: color,
                          size: AppIconSize.xl,
                        ),
                      ),
                    const SizedBox(height: AppSpace.xxs),
                    TweenAnimationBuilder<Color?>(
                      tween: ColorTween(
                        begin: effectiveLabelColor,
                        end: isHovered.value
                            ? effectiveLabelColor
                            : effectiveLabelColor.withAppOpacity(0.8),
                      ),
                      duration: AnimationConstants.shortDuration,
                      builder: (context, color, child) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: AppText(
                          label,
                          fontSize: 11,
                          color: color,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    if (tooltip != null && tooltip!.isNotEmpty) {
      return Tooltip(message: tooltip, child: tile);
    }
    return tile;
  }
}
