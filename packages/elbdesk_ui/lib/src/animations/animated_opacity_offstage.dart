import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';

class AnimatedOpacityOffstage extends StatefulWidget {
  const AnimatedOpacityOffstage({
    required this.child,
    required this.visible,
    this.duration = AnimationConstants.shortDuration,
    this.onEnd,
    super.key,
  });
  final Widget child;
  final bool visible;
  final Duration duration;
  final VoidCallback? onEnd;

  @override
  State<AnimatedOpacityOffstage> createState() =>
      _AnimatedOpacityOffstageState();
}

class _AnimatedOpacityOffstageState extends State<AnimatedOpacityOffstage> {
  bool _offstage = false;

  @override
  void initState() {
    super.initState();
    _offstage = !widget.visible;
  }

  @override
  void didUpdateWidget(AnimatedOpacityOffstage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible) {
      _offstage = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.visible ? 1 : 0,
      duration: widget.duration,
      onEnd: () {
        if (!widget.visible) {
          setState(() {
            _offstage = true;
          });
        }
        widget.onEnd?.call();
      },
      child: Offstage(offstage: _offstage, child: widget.child),
    );
  }
}
