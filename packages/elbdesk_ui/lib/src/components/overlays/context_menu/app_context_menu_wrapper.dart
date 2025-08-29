import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A wrapper widget specifically designed for the AppContextMenu
class AppContextMenuWrapper extends StatefulWidget {
  const AppContextMenuWrapper({
    required this.menuContent,
    required this.child,
    this.menuAlignment = Alignment.topRight,
    this.childAlignment = Alignment.bottomLeft,
    this.menuOffset = Offset.zero,
    this.useFixedOverlayPosition = false,
    this.isEnabled = true,
    this.parentContainerBounds,
    this.useGlobalPositioning = false,
    super.key,
  });

  /// The menu content builder
  final Widget Function(
    ListenableOverlayPortalController controller,
  ) menuContent;

  /// The child that triggers the menu
  final Widget Function(
    ListenableOverlayPortalController controller,
  ) child;

  /// The alignment of the menu relative to the child
  final Alignment menuAlignment;

  /// The alignment of the child that the menu should align to
  final Alignment childAlignment;

  /// Additional offset for fine-tuning menu position
  /// (used if useFixedOverlayPosition is true)
  final Offset menuOffset;

  /// Determines if the menu should be positioned relative to the child widget
  /// (fixed) or the cursor.
  /// Defaults to false (cursor-relative).
  final bool useFixedOverlayPosition;

  /// Whether the context menu is enabled and can be shown.
  /// Defaults to true.
  final bool isEnabled;

  /// Optional bounds of the parent container (e.g., FloatingWindow).
  /// When provided, the menu will be constrained within these bounds
  /// instead of the full screen.
  final Rect? parentContainerBounds;

  /// Whether to use global positioning instead of container-relative
  /// positioning
  /// When true, the menu will be positioned at the exact global coordinates
  /// regardless of parent containers. This is simpler and works with any widget
  /// Defaults to false.
  final bool useGlobalPositioning;

  @override
  State<AppContextMenuWrapper> createState() => _AppContextMenuWrapperState();
}

class _AppContextMenuWrapperState extends State<AppContextMenuWrapper> {
  late ListenableOverlayPortalController overlayPortalController;
  late LayerLink layerLink;

  void _onOverlayPortalControllerChange(bool isShowing) {
    if (!isShowing) {
      overlayPortalController.currentTapPosition = null;
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    overlayPortalController = ListenableOverlayPortalController();
    overlayPortalController.addListener(_onOverlayPortalControllerChange);
    layerLink = LayerLink();
  }

  @override
  void dispose() {
    overlayPortalController.removeAllListeners();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final transparent = context.appTheme.generalColors.transparent;

    final bool useFixedPosition;
    if (widget.useFixedOverlayPosition) {
      useFixedPosition = true;
    } else {
      useFixedPosition = overlayPortalController.currentTapPosition == null;
    }

    // Use global positioning if enabled
    final useGlobalPositioning = widget.useGlobalPositioning;

    final Widget menuStructure = UnconstrainedBox(
      child: GestureDetector(
        onTap: () {
          // Consumes tap to prevent background click handler when tapping on
          // menu itself
        },
        behavior: HitTestBehavior.opaque,
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(context.appTheme.borderRadiuses.m),
          child: Material(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: context.appTheme.generalColors.onBackground
                    .withAppOpacity(0.2),
                width: 1,
              ),
              borderRadius:
                  BorderRadius.circular(context.appTheme.borderRadiuses.m),
            ),
            elevation: 0,
            color: transparent,
            child: widget.menuContent(overlayPortalController),
          ),
        ),
      ),
    );

    // If menu is disabled, just return the child without overlay functionality
    if (!widget.isEnabled) {
      return widget.child(overlayPortalController);
    }

    return OverlayPortal(
      controller: overlayPortalController,
      overlayChildBuilder: (context) {
        return Stack(
          children: [
            // Background click handler
            Positioned.fill(
              child: MouseRegion(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: overlayPortalController.hide,
                  onSecondaryTap: overlayPortalController.hide,
                  child: Container(
                    color: transparent,
                  ),
                ),
              ),
            ),
            // Menu content positioning
            if (useFixedPosition)
              CompositedTransformFollower(
                link: layerLink,
                targetAnchor: widget.childAlignment,
                followerAnchor: widget.menuAlignment,
                offset: widget.menuOffset,
                child: menuStructure,
              )
            else if (overlayPortalController.currentTapPosition != null)
              // Use global positioning if enabled, otherwise use
              // container-relative
              useGlobalPositioning
                  ? _GlobalMenuOverlay(
                      tapPosition: overlayPortalController.currentTapPosition!,
                      menuOffset: widget.menuOffset,
                      menuStructure: menuStructure,
                      controller: overlayPortalController,
                    )
                  : CustomSingleChildLayout(
                      delegate: _MenuLayoutDelegate(
                        tapPosition:
                            overlayPortalController.currentTapPosition!,
                        menuOffset: widget.menuOffset == Offset.zero
                            ? const Offset(10, -6) + widget.menuOffset
                            : widget.menuOffset,
                        parentContainerBounds: widget.parentContainerBounds,
                      ),
                      child: menuStructure,
                    ),
          ],
        );
      },
      child: useFixedPosition
          ? CompositedTransformTarget(
              link: layerLink,
              child: widget.child(overlayPortalController),
            )
          : widget.child(overlayPortalController),
    );
  }
}

// New private class for layout delegation
class _MenuLayoutDelegate extends SingleChildLayoutDelegate {
  _MenuLayoutDelegate({
    required this.tapPosition,
    required this.menuOffset,
    this.parentContainerBounds,
  });

  final Offset tapPosition;
  final Offset menuOffset;
  final Rect? parentContainerBounds;
  final double screenPadding = 8;

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // Use parent container bounds if provided, otherwise use full screen
    final effectiveBounds =
        parentContainerBounds ?? Rect.fromLTWH(0, 0, size.width, size.height);

    // Convert global tap position to local position within the container
    final localTapPosition = parentContainerBounds != null
        ? Offset(
            tapPosition.dx - effectiveBounds.left,
            tapPosition.dy - effectiveBounds.top,
          )
        : tapPosition;

    // Restore usage of menuOffset.dy for initial Y position
    var x = localTapPosition.dx + menuOffset.dx;
    var y = localTapPosition.dy + menuOffset.dy;

    // Horizontal adjustment within container bounds
    if (x + childSize.width > effectiveBounds.width - screenPadding) {
      x = localTapPosition.dx - childSize.width - menuOffset.dx;
      if (x < screenPadding) {
        x = screenPadding;
      }
    } else if (x < screenPadding) {
      x = screenPadding;
    }
    if (x + childSize.width > effectiveBounds.width - screenPadding) {
      x = effectiveBounds.width - childSize.width - screenPadding;
    }
    // Ensure x is not NaN if childSize.width is very large, clamp robustly
    if (effectiveBounds.width - childSize.width - screenPadding <
        screenPadding) {
      // Handles cases where menu is wider than container
      x = x.clamp(
        0.0,
        (effectiveBounds.width - childSize.width).clamp(0.0, double.infinity),
      );
    } else {
      x = x.clamp(
        screenPadding,
        effectiveBounds.width - childSize.width - screenPadding,
      );
    }

    // Vertical adjustment within container bounds
    if (y + childSize.height > effectiveBounds.height - screenPadding) {
      y = effectiveBounds.height - childSize.height - screenPadding;
      if (y < screenPadding) {
        y = screenPadding;
      }
    } else if (y < screenPadding) {
      y = screenPadding;
    }
    // Ensure y is not NaN if childSize.height is very large, clamp robustly
    if (effectiveBounds.height - childSize.height - screenPadding <
        screenPadding) {
      // Handles cases where menu is taller than container
      y = y.clamp(
        0.0,
        (effectiveBounds.height - childSize.height).clamp(0.0, double.infinity),
      );
    } else {
      y = y.clamp(
        screenPadding,
        effectiveBounds.height - childSize.height - screenPadding,
      );
    }

    // Convert back to global coordinates if using parent container bounds
    if (parentContainerBounds != null) {
      return Offset(x + effectiveBounds.left, y + effectiveBounds.top);
    }

    return Offset(x, y);
  }

  @override
  bool shouldRelayout(_MenuLayoutDelegate oldDelegate) {
    return tapPosition != oldDelegate.tapPosition ||
        menuOffset != oldDelegate.menuOffset ||
        parentContainerBounds != oldDelegate.parentContainerBounds;
  }
}

/// Widget that inserts the menu into the root overlay for true global
/// positioning
class _GlobalMenuOverlay extends StatefulWidget {
  const _GlobalMenuOverlay({
    required this.tapPosition,
    required this.menuOffset,
    required this.menuStructure,
    required this.controller,
  });

  final Offset tapPosition;
  final Offset menuOffset;
  final Widget menuStructure;
  final ListenableOverlayPortalController controller;

  @override
  State<_GlobalMenuOverlay> createState() => _GlobalMenuOverlayState();
}

class _GlobalMenuOverlayState extends State<_GlobalMenuOverlay> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    // Defer overlay insertion until after build is completess
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _insertMenu();
    });
  }

  void _insertMenu() {
    // Get root overlay
    final rootOverlay =
        AppNavigatorKeys.appRootNavigatorKey.currentState?.overlay;
    if (rootOverlay == null) return;

    // Calculate position with offset
    final left = widget.tapPosition.dx +
        (widget.menuOffset == Offset.zero ? 10.0 : widget.menuOffset.dx);
    final top = widget.tapPosition.dy +
        (widget.menuOffset == Offset.zero ? -6.0 : widget.menuOffset.dy);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background click handler to close menu
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: widget.controller.hide,
              onSecondaryTap: widget.controller.hide,
              child: Container(color: Colors.transparent),
            ),
          ),
          // Menu at global position
          Positioned(
            left: left,
            top: top,
            child: widget.menuStructure,
          ),
        ],
      ),
    );

    rootOverlay.insert(_overlayEntry!);

    // Listen for controller changes to remove overlay
    widget.controller.addListener(_onControllerChange);
  }

  void _onControllerChange(bool isShowing) {
    if (!isShowing) {
      _removeMenu();
    }
  }

  void _removeMenu() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
    widget.controller.removeListener(_onControllerChange);
  }

  @override
  void dispose() {
    _removeMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Return empty since the actual menu is in the root overlay
    return const SizedBox.shrink();
  }
}
