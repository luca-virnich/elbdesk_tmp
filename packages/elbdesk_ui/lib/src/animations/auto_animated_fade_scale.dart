import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';

/// A widget that automatically animates its child with a fade and scale effect.
///
/// This widget uses [AnimatedSwitcher] to create a smooth transition between
/// its expanded and collapsed states. When expanded, it shows the child widget
/// with a fade and scale animation. When collapsed, it shows an empty
/// [SizedBox].
///
/// {@tool snippet}
///
/// This example shows how to use [AutoAnimatedFadeScale]:
///
/// ```dart
/// AutoAnimatedFadeScale(
///   expanded: _isExpanded,
///   child: Text('Hello, World!'),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AnimatedSwitcher], which this widget uses internally to create the
/// animation.
///  * [FadeTransition], which is used for the fade effect.
///  * [ScaleTransition], which is used for the scale effect.
class AutoAnimatedFadeScale extends StatelessWidget {
  /// Creates an [AutoAnimatedFadeScale] widget.
  ///
  /// The [expanded] and [child] arguments must not be null.
  const AutoAnimatedFadeScale({
    required this.expanded,
    required this.child,
    super.key,
    this.switchInCurve = AnimationConstants.linear,
    this.switchOutCurve = AnimationConstants.linear,
    this.alignment = Alignment.topLeft,
    this.animationDuration = AnimationConstants.veryLongDuration,
  });

  /// The duration of the animation.
  final Duration animationDuration;

  /// Whether the child is expanded (visible) or collapsed (hidden).
  final bool expanded;

  /// The widget to animate.
  final Widget child;

  /// The curve to use when transitioning in.
  final Curve switchInCurve;

  /// The curve to use when transitioning out.
  final Curve switchOutCurve;

  /// The alignment to use for the scale animation.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: animationDuration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (widget, animation) {
        final scaleAnimation = CurvedAnimation(
          parent: animation,
          curve: const Interval(0, 1, curve: AnimationConstants.easeOut),
        );

        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: scaleAnimation,
            alignment: alignment,
            child: widget,
          ),
        );
      },
      child: expanded ? child : const SizedBox.shrink(),
    );
  }
}
