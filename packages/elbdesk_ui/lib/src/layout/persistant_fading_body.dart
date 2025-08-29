import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A widget that provides a fading effect for its child based on selection
/// state.
///
/// This widget uses an [AnimatedOpacity] to fade its child in and out smoothly
/// when the [isSelected] property changes. It also uses [Offstage] to improve
/// performance by removing the child from the widget tree when it's fully
/// transparent.
class PersistentFadingBody extends HookWidget {
  /// Creates a [PersistentFadingBody].
  ///
  /// The [child] parameter is the widget to be displayed with the fading
  /// effect.
  /// The [isSelected] parameter determines whether the child should be visible
  /// or not.
  const PersistentFadingBody({
    required this.child,
    required this.isSelected,
    this.keepAlive = true,
    this.loadLazy = false,
    super.key,
  });

  /// The widget to display with the fading effect.
  final Widget child;

  /// Whether the child should be visible (true) or hidden (false).
  final bool isSelected;

  /// Whether the child should be kept in the widget tree when it's not visible.
  final bool keepAlive;
  final bool loadLazy;

  @override
  Widget build(BuildContext context) {
    // State for managing the opacity of the child widget
    final opacity = useState<double>(isSelected ? 1.0 : 0.0);

    // Effect to handle changes in the isSelected state
    useEffect(
      () {
        if (isSelected) {
          // Delay the fade-in effect slightly for a smoother transition
          Future.delayed(AnimationConstants.staggeredDelay, () {
            opacity.value = 1.0;
          });
        } else {
          // Immediately start fading out when deselected
          opacity.value = 0.0;
        }
        return null;
      },
      [isSelected],
    );

    // loaded when first visit and then keep alive
    if (loadLazy && keepAlive) {
      return _LazyKeepAlive(
        opacity: opacity.value,
        child: child,
      );
    }

    if (loadLazy && !keepAlive) {
      return _LazyDontKeepAlive(
        opacity: opacity.value,
        child: child,
      );
    }

    return AnimatedOpacity(
      opacity: opacity.value,
      duration: AnimationConstants.defaultDuration,
      child: Offstage(
        offstage: opacity.value == 0,
        child: child,
      ),
    );
  }
}

class _LazyKeepAlive extends HookWidget {
  const _LazyKeepAlive({
    required this.opacity,
    required this.child,
  });
  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final loadedOnce = useState<bool>(false);
    useEffect(
      () {
        if (opacity > 0) {
          loadedOnce.value = true;
        }
        return null;
      },
      [opacity],
    );

    return AnimatedOpacity(
      opacity: opacity,
      duration: AnimationConstants.defaultDuration,
      child: loadedOnce.value
          ? Offstage(
              offstage: opacity == 0,
              child: child,
            )
          : const SizedBox.shrink(),
    );
  }
}

class _LazyDontKeepAlive extends HookWidget {
  const _LazyDontKeepAlive({
    required this.opacity,
    required this.child,
  });
  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final loadedOnce = useState<bool>(false);
    useEffect(
      () {
        if (opacity > 0) {
          loadedOnce.value = true;
        }
        return null;
      },
      [opacity],
    );

    return AnimatedOpacity(
      opacity: opacity,
      duration: AnimationConstants.staggeredDelay,
      // child: opacity == 0 ? const SizedBox.shrink() : child,
      child:
          opacity == 0 || !loadedOnce.value ? const SizedBox.shrink() : child,
    );
  }
}
