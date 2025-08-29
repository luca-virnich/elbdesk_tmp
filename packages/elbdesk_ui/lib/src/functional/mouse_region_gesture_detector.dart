import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ElbMouseRegionGestureDetector extends StatelessWidget {
  const ElbMouseRegionGestureDetector({
    required this.child,
    this.onTap,
    this.onEnter,
    this.onExit,
    super.key,
    this.cursor = SystemMouseCursors.click,
    this.hitTestBehavior = HitTestBehavior.opaque,
    this.onSecondaryTapDown,
    this.enabled = true,
  });

  final void Function()? onTap;
  final void Function(PointerEnterEvent)? onEnter;
  final void Function(PointerExitEvent)? onExit;
  final void Function(TapDownDetails)? onSecondaryTapDown;
  final Widget child;
  final MouseCursor cursor;
  final HitTestBehavior hitTestBehavior;
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    if (!enabled) {
      return child;
    }

    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      cursor: cursor,
      child: GestureDetector(
        behavior: hitTestBehavior,
        onTap: onTap,
        onSecondaryTapDown: onSecondaryTapDown,
        child: child,
      ),
    );
  }
}
