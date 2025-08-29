import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// The default duration for the animation.
const _defaultDuration = AnimationConstants.defaultDuration;

/// The default curve for the animation.
const _defaultCurve = AnimationConstants.easeOut;

/// A widget that animates its size and opacity based on an [expanded] flag.
///
/// This widget can either keep its children alive in the widget tree or remove
/// them completely when not expanded, based on the [keepAliveChildren] flag.
///
/// When [expanded] is true, the child widget is shown with its natural size.
/// When false, the widget collapses to zero height
/// (and zero opacity if keep-alive)
class AutoAnimatedSize extends HookWidget {
  /// Creates an [AutoAnimatedSize] widget.
  ///
  /// The [expanded] and [child] parameters must not be null.
  const AutoAnimatedSize({
    required this.expanded,
    required this.child,
    super.key,
    this.animationDuration = _defaultDuration,
    this.switchInCurve,
    this.switchOutCurve,
    this.keepAliveChildren = false,
    this.animateOpacity = true,
    this.offstage = false,
  });

  /// Whether the child should be expanded (visible) or collapsed (hidden).
  final bool expanded;

  /// The widget to show when expanded.
  final Widget child;

  /// The duration over which to animate the size change.
  final Duration animationDuration;

  /// The curve to use when animating the expansion.
  final Curve? switchInCurve;

  /// The curve to use when animating the collapse.
  final Curve? switchOutCurve;

  /// Whether to animate the opacity of the child.
  ///
  /// If true, the child's opacity will be animated along with its size.
  /// If false, only the size will be animated.
  final bool animateOpacity;

  /// Whether to keep the child in the tree when collapsed.
  ///
  /// If true, the child remains in the tree but is sized to zero and
  /// transparent
  /// If false, the child is removed from the tree when collapsed.
  final bool keepAliveChildren;

  final bool offstage;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: animationDuration,
      initialValue: expanded ? 1.0 : 0.0,
    );

    final animation = useMemoized(
      () => CurvedAnimation(
        parent: controller,
        curve: switchInCurve ?? _defaultCurve,
        reverseCurve: switchOutCurve ?? _defaultCurve,
      ),
      [controller, switchInCurve, switchOutCurve],
    );

    final isChildVisible = useState(expanded);

    // Effect to handle changes in the expanded state
    useEffect(
      () {
        // If expanded, show the child
        if (expanded) {
          isChildVisible.value = true;
          controller.forward();
        }
        // If not expanded, hide the child
        else {
          controller.reverse().then((_) {
            if (!keepAliveChildren && !expanded) {
              isChildVisible.value = false;
            }
          });
        }
        return null;
      },
      [expanded],
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: animation.value,
            child: animateOpacity
                ? Opacity(
                    opacity: animation.value,
                    child: Offstage(
                      offstage: offstage && animation.value == 0,
                      child: child,
                    ),
                  )
                : child,
          ),
        );
      },
      child:
          isChildVisible.value || keepAliveChildren ? child : const SizedBox(),
    );
  }
}
