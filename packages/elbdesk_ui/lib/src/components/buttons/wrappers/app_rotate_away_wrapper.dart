import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A typedef for the builder function that creates the content displayed on the
/// front of the wrapper.
///
/// [context] is the BuildContext.
/// [flipToBack] is a callback function that should be called by the front
/// content (e.g., a button's onPressed or a tile's onTap) to initiate the flip
/// animation to the revealed (back) side.
typedef FrontContentBuilder = Widget Function(
  BuildContext context,
  VoidCallback flipToBack,
);

/// A typedef for the builder function that creates the content revealed on the
/// back of the wrapper.
///
/// [context] is the BuildContext.
/// [triggerRevert] is a callback function that should be called by the revealed
/// content
/// (e.g., a button's onPressed) to flip the wrapper back to its front face.
typedef RevealedContentBuilder = Widget Function(
  BuildContext context,
  VoidCallback triggerRevert,
);

/// A widget that displays the default revealed content with one or two buttons.
class _DefaultRevealedContent extends StatelessWidget {
  const _DefaultRevealedContent({
    required this.primaryActionLabel,
    required this.triggerRevert,
    required this.onPrimaryAction,
    this.primaryActionIcon,
    this.onSecondaryAction,
    this.secondaryActionLabel,
    this.secondaryActionIcon,
  });

  final String primaryActionLabel;
  final VoidCallback triggerRevert;
  final VoidCallback? onPrimaryAction;
  final IconData? primaryActionIcon;
  final VoidCallback? onSecondaryAction;
  final String? secondaryActionLabel;
  final IconData? secondaryActionIcon;

  @override
  Widget build(BuildContext context) {
    final primaryBtn = _PictoStyleButton(
      label: primaryActionLabel,
      icon: primaryActionIcon,
      onPressed: () {
        onPrimaryAction?.call();
        triggerRevert();
      },
      isSingleButton: onSecondaryAction == null,
    );

    if (onSecondaryAction != null && secondaryActionLabel != null) {
      final secondaryBtn = _PictoStyleButton(
        label: secondaryActionLabel!,
        icon: secondaryActionIcon,
        onPressed: () {
          onSecondaryAction?.call();
          triggerRevert();
        },
      );
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Row(
              children: [Expanded(child: primaryBtn)],
            ),
          ),
          Expanded(
            child: Row(
              children: [Expanded(child: secondaryBtn)],
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: primaryBtn,
      );
    }
  }
}

/// A wrapper widget that displays content from [frontContentBuilder] on its
/// front face.
///
/// When triggered by the front content, it performs a slide animation to reveal
/// content on its back face. The back face can be defined by
/// [revealedContentBuilder] (which takes precedence) or by providing
/// [onPrimaryAction] (for a single button) or both [onPrimaryAction] and
/// [onSecondaryAction] (for two buttons).
class AppRotateAwayButtonWrapper extends HookWidget {
  /// Creates an [AppRotateAwayButtonWrapper].
  /// The name is a bit of a misnomer now, as it slides instead of rotating.
  const AppRotateAwayButtonWrapper({
    required this.frontContentBuilder,
    super.key,
    this.revealedContentBuilder,
    this.onPrimaryAction,
    this.primaryActionLabel,
    this.primaryActionIcon,
    this.onSecondaryAction,
    this.secondaryActionLabel,
    this.secondaryActionIcon,
    this.animationDuration = AnimationConstants.longDuration,
    this.targetWidth,
    this.targetHeight,
  });

  /// A builder function that creates the widget to be displayed on the front
  /// face.
  final FrontContentBuilder frontContentBuilder;

  /// Optional builder function for custom content on the back face.
  /// If provided, this takes precedence over [onPrimaryAction] and
  /// [onSecondaryAction].
  final RevealedContentBuilder? revealedContentBuilder;

  /// Label for the primary action button. Required if [onPrimaryAction] is set.
  final String? primaryActionLabel;

  /// Icon for the primary action button. If null, no icon is displayed.
  final IconData? primaryActionIcon;

  /// Callback for the primary action. If set (and [revealedContentBuilder] is
  /// null),
  /// a primary button is shown. Triggers revert after execution.
  final VoidCallback? onPrimaryAction;

  /// Label for the secondary action button. Required if [onSecondaryAction] is
  /// set.
  final String? secondaryActionLabel;

  /// Icon for the secondary action button. If null, no icon is displayed.
  final IconData? secondaryActionIcon;

  /// Callback for the secondary action. If set along with [onPrimaryAction]
  /// (and [revealedContentBuilder] is null), two buttons are shown. Triggers
  /// revert after execution.
  final VoidCallback? onSecondaryAction;

  /// The duration of the slide animation.
  final Duration animationDuration;

  /// Optional target width for the content.
  final double? targetWidth;

  /// Optional target height for the content.
  final double? targetHeight;

  bool _canRevealContent() =>
      revealedContentBuilder != null || onPrimaryAction != null;

  @override
  Widget build(BuildContext context) {
    final isRevealed = useState(false);
    final animationController = useAnimationController(
      duration: animationDuration,
    );
    final curvedAnimation = useMemoized(
      () => CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOutCubic,
        reverseCurve: Curves.easeInOutCubic,
      ),
      [animationController],
    );

    void flipToBackSide() {
      if (!_canRevealContent()) return;

      if (!isRevealed.value && !animationController.isAnimating) {
        isRevealed.value = true;
        animationController.forward();
      }
    }

    void flipToFrontSide() {
      if (isRevealed.value) {
        if (animationController.isAnimating &&
            animationController.status == AnimationStatus.forward) {
          animationController.reverse();
        } else if (!animationController.isAnimating) {
          animationController.reverse();
        }
        isRevealed.value = false;
      }
    }

    void handleMouseExit() {
      if (isRevealed.value) {
        flipToFrontSide();
      }
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final actualHeight = targetHeight ?? constraints.maxHeight;

        if (actualHeight == double.infinity || actualHeight <= 0) {
          return frontContentBuilder(context, flipToBackSide);
        }

        final actualWidth = targetWidth;

        return MouseRegion(
          onExit: (_) => handleMouseExit(),
          child: AnimatedBuilder(
            animation: curvedAnimation,
            builder: (context, animationBuilderChild) {
              final animationValue = curvedAnimation.value;

              var frontWidget = frontContentBuilder(context, flipToBackSide);

              Widget? backWidget;
              if (revealedContentBuilder != null) {
                backWidget = revealedContentBuilder!(context, flipToFrontSide);
              } else if (onPrimaryAction != null) {
                backWidget = _DefaultRevealedContent(
                  primaryActionLabel: primaryActionLabel!,
                  triggerRevert: flipToFrontSide,
                  onPrimaryAction: onPrimaryAction,
                  primaryActionIcon: primaryActionIcon,
                  onSecondaryAction: onSecondaryAction,
                  secondaryActionLabel: secondaryActionLabel,
                  secondaryActionIcon: secondaryActionIcon,
                );
              }

              frontWidget = SizedBox(
                width: actualWidth,
                height: actualHeight,
                child: frontWidget,
              );

              if (backWidget != null) {
                backWidget = SizedBox(
                  width: actualWidth,
                  height: actualHeight,
                  child: backWidget,
                );
              }

              return SizedBox(
                width: actualWidth,
                height: actualHeight,
                child: ClipRect(
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: <Widget>[
                      if (backWidget != null)
                        Transform.translate(
                          offset:
                              Offset(0, (1.0 - animationValue) * actualHeight),
                          child: backWidget,
                        ),
                      Transform.translate(
                        offset: Offset(0, animationValue * -actualHeight),
                        child: frontWidget,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

/// Internal button widget styled like an AppPictoTile.
class _PictoStyleButton extends HookWidget {
  const _PictoStyleButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isSingleButton = false,
  });

  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool isSingleButton;

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    final theme = context.appTheme;
    final generalColors = theme.generalColors;

    // Mimic AppPictoTile's effective color calculations
    final effectiveGradientColors = [
      generalColors.primarySurfaceBorder.withAppOpacity(0.2),
      generalColors.primarySurfaceBorder.withAppOpacity(0),
    ];
    final effectiveBorderRadius = theme.borderRadiuses.s;
    final effectiveBorderColor = isHovered.value
        ? generalColors.primarySurfaceBorder
        : generalColors.primarySurfaceBorder.withAppOpacity(0.9);
    final effectiveLabelColor = generalColors.onBackground;
    final effectiveShadowColor = isHovered.value
        ? generalColors.primary.withAppOpacity(0.05)
        : generalColors.transparent;

    return ElbMouseRegionGestureDetector(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      cursor: onPressed != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onTap: onPressed,
      child: AnimatedContainer(
        duration: AnimationConstants.shortDuration,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: context.appTheme.borderRadiuses.s,
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
        child: Center(
          child: TweenAnimationBuilder<Color?>(
            tween: ColorTween(
              begin: effectiveLabelColor,
              end: isHovered.value
                  ? effectiveLabelColor
                  : effectiveLabelColor.withAppOpacity(0.8),
            ),
            duration: AnimationConstants.shortDuration,
            builder: (context, color, child) => Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpace.s,
                vertical: AppSpace.xs,
              ),
              child: isSingleButton && icon != null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElbIcon(
                          icon!,
                          size: AppIconSize.xl,
                          color: color,
                        ),
                        const SizedBox(height: AppSpace.xxs),
                        AppText(
                          label,
                          fontSize: 11,
                          color: color,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null) ...[
                          ElbIcon(
                            icon!,
                            size: AppIconSize.s,
                            color: color,
                          ),
                          const SizedBox(width: AppSpace.xxs),
                        ],
                        Expanded(
                          child: AppText(
                            label,
                            fontSize: 12,
                            color: color,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
