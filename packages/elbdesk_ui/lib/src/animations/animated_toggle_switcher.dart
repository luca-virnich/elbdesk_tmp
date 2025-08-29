import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';

/// A widget that animates between two child widgets with a sliding transition.
///
/// This widget is useful for creating inline confirmation dialogs or toggling
/// between two different views with a smooth animation.
///
/// The [AnimatedToggleSwitcher] uses two builder functions to create its child
/// widgets, allowing for dynamic content generation based on the current state.
///
/// {@tool snippet}
///
/// This example shows how to use [AnimatedToggleSwitcher] to toggle between
/// a button and a confirmation message:
///
/// ```dart
/// AnimatedToggleSwitcher(
///   firstChildBuilder: (context, toggle) => ElevatedButton(
///     onPressed: toggle,
///     child: Text('Delete'),
///   ),
///   secondChildBuilder: (context, toggle) => Row(
///     children: [
///       Text('Are you sure?'),
///       TextButton(onPressed: toggle, child: Text('Cancel')),
///       TextButton(onPressed: () {}, child: Text('Confirm')),
///     ],
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AnimatedCrossFade], which cross-fades between two given children.
///  * [AnimatedSwitcher], which switches between different widgets with
/// customizable transitions.
class AnimatedToggleSwitcher extends StatefulWidget {
  /// Creates an [AnimatedToggleSwitcher].
  ///
  /// The [firstChildBuilder] and [secondChildBuilder] arguments must not be
  /// null.
  const AnimatedToggleSwitcher({
    required this.firstChildBuilder,
    required this.secondChildBuilder,
    this.alignment = Alignment.centerRight,
    this.animationDuration = AnimationConstants.longDuration,
    this.reserveWidth = false,
    super.key,
  });

  /// A function that builds the first child widget.
  ///
  /// This function is called with the current [BuildContext] and a
  /// [VoidCallback] that can be used to trigger the toggle animation.
  final Widget Function(BuildContext, VoidCallback) firstChildBuilder;

  /// A function that builds the second child widget.
  ///
  /// This function is called with the current [BuildContext] and a
  /// [VoidCallback] that can be used to trigger the toggle animation.
  final Widget Function(BuildContext, VoidCallback) secondChildBuilder;

  /// The alignment of the children within the stack.
  ///
  /// Defaults to [Alignment.centerRight].
  final Alignment alignment;

  /// The duration of the toggle animation.
  ///
  /// Defaults to 500 milliseconds.
  final Duration animationDuration;

  /// Whether to reserve space for the hidden widget.
  ///
  /// If true, the widget will maintain its width even when not visible.
  /// Defaults to false.
  final bool reserveWidth;

  @override
  State<AnimatedToggleSwitcher> createState() => _AnimatedToggleSwitcherState();
}

class _AnimatedToggleSwitcherState extends State<AnimatedToggleSwitcher>
    with SingleTickerProviderStateMixin {
  bool showFirstWidget = true;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: AnimationConstants.defaultCurve,
    );
  }

  void _toggleWidgets() {
    if (showFirstWidget) {
      setState(() {
        showFirstWidget = false;
      });
      _controller.forward();
    } else {
      _controller.reverse().then((_) {
        if (mounted) {
          setState(() {
            showFirstWidget = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        alignment: widget.alignment,
        children: [
          _AnimatedWidget(
            controller: _controller,
            animation: _animation,
            builder: widget.firstChildBuilder,
            toggleWidgets: _toggleWidgets,
            begin: Offset.zero,
            end: const Offset(0, -1),
            showWidget: showFirstWidget,
            reserveWidth: widget.reserveWidth,
          ),
          _AnimatedWidget(
            controller: _controller,
            animation: _animation,
            builder: widget.secondChildBuilder,
            toggleWidgets: _toggleWidgets,
            begin: const Offset(0, 1),
            end: Offset.zero,
            showWidget: !showFirstWidget,
            reserveWidth: widget.reserveWidth,
          ),
        ],
      ),
    );
  }
}

/// A private widget that handles the animation of a single child in the
/// [AnimatedToggleSwitcher].
class _AnimatedWidget extends StatelessWidget {
  /// Creates an [_AnimatedWidget].
  ///
  /// All parameters are required and must not be null.
  const _AnimatedWidget({
    required this.controller,
    required this.animation,
    required this.builder,
    required this.toggleWidgets,
    required this.begin,
    required this.end,
    required this.showWidget,
    required this.reserveWidth,
  });

  /// The animation controller driving the animation.
  final AnimationController controller;

  /// The animation that defines the transition curve.
  final Animation<double> animation;

  /// A function that builds the child widget.
  final Widget Function(BuildContext, VoidCallback) builder;

  /// A callback function to toggle between widgets.
  final VoidCallback toggleWidgets;

  /// The starting offset for the slide animation.
  final Offset begin;

  /// The ending offset for the slide animation.
  final Offset end;

  /// Whether this widget should be visible.
  final bool showWidget;

  /// Whether to reserve space for this widget when it's not visible.
  final bool reserveWidth;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: begin,
            end: end,
          ).animate(animation),
          child: showWidget || controller.isAnimating
              ? Container(
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  child: builder(context, toggleWidgets),
                )
              : reserveWidth
                  ? Opacity(
                      opacity: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 2),
                        child: builder(context, toggleWidgets),
                      ),
                    )
                  : const SizedBox.shrink(),
        );
      },
    );
  }
}
