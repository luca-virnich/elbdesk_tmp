import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

const _animationDuration = AnimationConstants.shortDuration;

/// Simple controller for the overlay with show and close methods
class AppOverlayController {
  /// Show the overlay
  late VoidCallback show;

  /// Close the overlay
  late VoidCallback close;

  /// Check if the overlay is open
  bool get isOpen => _isOpen;
  bool _isOpen = false;

  void _setIsOpen(bool value) {
    _isOpen = value;
  }
}

/// Simple overlay that can be anchored to a specific widget
/// the child is typically a button that opens the overlay
class AppOverlay extends StatefulWidget {
  /// Create an overlay with a child and an overlay, the child is

  const AppOverlay({
    required this.child,
    required this.overlay,
    required this.targetAnchor,
    this.showBarrier = true,
    this.isDismissible = true,
    this.offset = const Offset(0, 5),
    super.key,
  });

  /// The child is typically a button that opens the overlay
  final Widget Function(AppOverlayController controller) child;

  /// The overlay is the content of the overlay, typically a [AppWindow]
  final Widget Function(AppOverlayController controller) overlay;

  /// Whether to show a barrier (semi-transparent black background)
  final bool showBarrier;

  /// Whether the overlay can be dismissed by tapping outside of it
  final bool isDismissible;

  /// The anchor of the overlay, relative to the child
  final Alignment targetAnchor;

  /// The offset of the overlay, relative to the child
  final Offset offset;

  @override
  State<AppOverlay> createState() => _AppOverlayState();
}

class _AppOverlayState extends State<AppOverlay> {
  final controller = AppOverlayController();
  OverlayEntry? overlayEntry;
  final buttonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller
      ..show = showOverlay
      ..close = closeOverlay;
  }

  OverlayEntry createOverlayEntry() {
    return OverlayEntry(
      builder: (context) => _Entry(
        generalColors: context.appTheme.generalColors,
        targetAnchor: widget.targetAnchor,
        overlay: widget.overlay,
        controller: controller,
        isDismissible: widget.isDismissible,
        buttonKey: buttonKey,
        showBarrier: widget.showBarrier,
        offset: widget.offset,
      ),
    );
  }

  void showOverlay() {
    overlayEntry = createOverlayEntry();
    Overlay.of(context, rootOverlay: true).insert(overlayEntry!);
    controller._setIsOpen(true);
  }

  void closeOverlay() {
    Future.delayed(_animationDuration, () {
      overlayEntry?.remove();
      overlayEntry = null;
      controller._setIsOpen(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!mounted) return const SizedBox();
    return SizedBox(
      key: buttonKey,
      child: widget.child(controller),
    );
  }
}

class _Entry extends StatefulWidget {
  const _Entry({
    required this.overlay,
    required this.controller,
    required this.buttonKey,
    required this.offset,
    required this.isDismissible,
    required this.showBarrier,
    required this.targetAnchor,
    required this.generalColors,
  });
  final Widget Function(AppOverlayController controller) overlay;
  final AppOverlayController controller;
  final Alignment targetAnchor;
  final bool showBarrier;
  final GlobalKey buttonKey;
  final bool isDismissible;
  final Offset offset;
  final AppGeneralColors generalColors;

  @override
  State<_Entry> createState() => _EntryState();
}

class _EntryState extends State<_Entry> with SingleTickerProviderStateMixin {
  Size? entrySize;
  late AnimationController barrierController;
  late Animation<Color?> barrierColorAnimation;
  bool isOpen = false;
  bool isAnimating = false;
  late VoidCallback originalClose;

  @override
  void initState() {
    super.initState();
    originalClose = widget.controller.close;
    widget.controller.close = () {
      closeBarrier();
      originalClose();
    };
    barrierController = AnimationController(
      duration: _animationDuration,
      vsync: this,
    );

    openBarrier();

    barrierColorAnimation = ColorTween(
      begin: widget.generalColors.transparent,
      //end: AppColorPaletteNew.transparent,
      end: widget.showBarrier
          ? widget.generalColors.barrierColor
          : widget.generalColors.transparent,
    ).animate(barrierController);
  }

  void openBarrier() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        isOpen = true;
        isAnimating = true;
      });
    });

    barrierController.forward().then((_) {
      setState(() {
        isAnimating = false;
      });
    });
  }

  void closeBarrier() {
    if (!mounted) return;
    setState(() {
      isOpen = false;
      isAnimating = true;
    });
    barrierController.reverse().then((value) {
      if (!isOpen && mounted) {
        setState(() {
          isAnimating = false;
        });
      }
    });
  }

  @override
  void dispose() {
    barrierController.dispose();
    widget.controller.close = originalClose;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final childWidgetMetrics =
        UiUtils.getWidgetPositionAndSize(widget.buttonKey);

    double? topPosition;
    double? leftPosition;

    if (childWidgetMetrics != null) {
      switch (widget.targetAnchor) {
        case Alignment.topLeft:
        case Alignment.topCenter:
        case Alignment.topRight:
          topPosition = childWidgetMetrics.position.dy +
              widget.offset.dy -
              childWidgetMetrics.size.height -
              (entrySize?.height ?? 0);
        case Alignment.bottomLeft:
        case Alignment.bottomCenter:
        case Alignment.bottomRight:
          topPosition = childWidgetMetrics.position.dy +
              childWidgetMetrics.size.height +
              widget.offset.dy;
        default:
          topPosition = childWidgetMetrics.position.dy +
              childWidgetMetrics.size.height / 2 +
              widget.offset.dy;
      }

      switch (widget.targetAnchor) {
        case Alignment.topLeft:
        case Alignment.centerLeft:
        case Alignment.bottomLeft:
          leftPosition = childWidgetMetrics.position.dx + widget.offset.dx;
        case Alignment.topRight:
        case Alignment.centerRight:
        case Alignment.bottomRight:
          leftPosition = childWidgetMetrics.position.dx +
              childWidgetMetrics.size.width -
              (entrySize?.width ?? 0) +
              widget.offset.dx;
        default:
          leftPosition = childWidgetMetrics.position.dx +
              childWidgetMetrics.size.width / 2 -
              (entrySize?.width ?? 0) / 2 +
              widget.offset.dx;
      }
    }

    final animationAlignment = switch (widget.targetAnchor) {
      Alignment.topLeft => Alignment.bottomLeft,
      Alignment.topCenter => Alignment.topCenter,
      Alignment.topRight => Alignment.topRight,
      Alignment.bottomLeft => Alignment.topLeft,
      Alignment.bottomCenter => Alignment.bottomCenter,
      Alignment.bottomRight => Alignment.topRight,
      _ => Alignment.center,
    };

    return NextCloseOverlayListener(
      onClose: widget.controller.close,
      child: Material(
        color: widget.generalColors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: barrierColorAnimation,
                builder: (context, child) {
                  return GestureDetector(
                    onTap:
                        widget.isDismissible ? widget.controller.close : null,
                    child: Container(
                      color: barrierColorAnimation.value,
                    ),
                  );
                },
              ),
            ),
            Positioned(
              top: topPosition,
              left: leftPosition,
              child: AutoAnimatedFadeScale(
                alignment: animationAlignment,
                animationDuration: _animationDuration,
                expanded: isOpen,
                child: ElbMeasureSize(
                  onChange: (size) {
                    setState(() {
                      entrySize = size;
                    });
                  },
                  child: Offstage(
                    offstage: entrySize == null,
                    child: widget.overlay(widget.controller),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
