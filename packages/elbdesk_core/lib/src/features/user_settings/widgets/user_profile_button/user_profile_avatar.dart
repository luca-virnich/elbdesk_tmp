import 'dart:math' as math;

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// The Avatar of the user profile, shows the initials of the user and the
/// connection status.
class UserProfileAvatar extends HookConsumerWidget {
  /// @nodoc
  const UserProfileAvatar({
    super.key,
    this.radius = 20,
  });

  /// The radius of the main circle
  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;

    // Add hover state
    final isHovered = useState<bool>(false);

    // Create animation controller for hover effect
    final animationController = useAnimationController(
      duration: AnimationConstants.defaultDuration,
    );

    // Update animation based on hover state
    useEffect(
      () {
        if (isHovered.value) {
          animationController.forward();
        } else {
          animationController.reverse();
        }
        return null;
      },
      [isHovered.value],
    );

    // Create color tween for animation
    final colorTween = ColorTween(
      begin: generalColors.primary,
      end: generalColors.primary.withAppOpacity(0.85),
    );

    // Calculate activity indicator constraints
    final activityIndicatorConstraints = useMemoized(
      () {
        final strokeRadius = radius * 0.3; // 30% of the main circle's radius
        const angleInDegrees = 45;
        const angleInRadians = angleInDegrees * (math.pi / 180.0);

        // Calculate the position of the smaller circle
        final xOffset = (radius - strokeRadius / 10) * math.cos(angleInRadians);
        final yOffset = (radius - strokeRadius / 10) * math.sin(angleInRadians);

        final offset = Offset(
          radius + xOffset - strokeRadius,
          radius + yOffset - strokeRadius,
        );
        final fillRadius = strokeRadius * 0.7;

        return (
          offset: offset,
          strokeRadius: strokeRadius,
          fillRadius: fillRadius
        );
      },
      [radius],
    );

    // final userInfo = ref
    //     .watch(
    //       currentAppUserStateProvider,
    //     )
    //     .requireValue
    //     .userInfo;

    return Stack(
      children: [
        // * Profile avatar
        MouseRegion(
          onEnter: (_) => isHovered.value = true,
          onExit: (_) => isHovered.value = false,
          cursor: SystemMouseCursors.click,
          child: AnimatedBuilder(
            animation: animationController,
            builder: (context, child) {
              return AppCircle(
                radius: radius,
                color: colorTween.evaluate(animationController) ??
                    generalColors.primary,
                child: const Padding(
                  padding: EdgeInsets.all(7),
                  child: FittedBox(
                    child: _InitialsText(),
                  ),
                ),
              );
            },
          ),
        ),
        // * Activity indicator
        Positioned(
          left: activityIndicatorConstraints.offset.dx,
          top: activityIndicatorConstraints.offset.dy,
          child: AppCircle(
            radius: activityIndicatorConstraints.strokeRadius,
            color: generalColors.onPrimary,
            child: AppCircle(
              radius: activityIndicatorConstraints.fillRadius,
              color: context.appTheme.statusColors.success,
            ),
          ),
        ),
      ],
    );
  }
}

class _InitialsText extends ConsumerWidget {
  const _InitialsText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    final userId = ref.watch(authUserStateProvider)?.id;
    final initials = (userId == null || userId == 1)
        ? 'A'
        : ref
            .watch(
              fetchLocalLightUserByUserInfoIdProvider(userId),
            )
            .initials;
    return AppText(
      initials,
      color: generalColors.onPrimary,
    );
  }
}
