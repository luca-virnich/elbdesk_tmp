import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/src/core/theme/_export_theme.dart';
import 'package:flutter/material.dart';

enum ElbPopupPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  leftToTop,
  leftToBottom,
  rightToTop,
  rightToBottom,
}

class ElbPopupStyle {
  const ElbPopupStyle({
    this.backgroundColor,
    this.contentPadding = EdgeInsets.zero,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.borderColor,
    this.borderShadow,
    this.overlayColor,
  });

  final Color? backgroundColor;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;
  final Color? borderColor;
  final List<BoxShadow>? borderShadow;
  final Color? overlayColor;

  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];
}

class ElbPopupItem {
  const ElbPopupItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });
  final IconData? icon;
  final Color? iconColor;
  final String label;
  final VoidCallback? onTap;
}

class _ElbPopupItemWidget extends StatelessWidget {
  const _ElbPopupItemWidget({
    required this.item,
    required this.onTap,
    this.alignment = MainAxisAlignment.start,
    this.borderRadius,
    this.overlayColor,
    this.isFirst = false,
    this.isLast = false,
    this.hasFixedTop = false,
    this.hasFixedBottom = false,
    super.key,
  });
  final ElbPopupItem item;
  final VoidCallback onTap;
  final MainAxisAlignment alignment;
  final BorderRadius? borderRadius;
  final Color? overlayColor;
  final bool isFirst;
  final bool isLast;
  final bool hasFixedTop;
  final bool hasFixedBottom;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final effectiveOverlayColor =
        overlayColor ?? theme.buttonStyles.primary.overlayColor;

    // Build the content row separately
    final content = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (item.icon != null) ...[
          Icon(
            item.icon,
            size: 20,
            color: item.iconColor,
          ),
          const SizedBox(width: 8),
        ],
        Text(item.label),
      ],
    );

    // Wrap with InkWell and proper padding structure
    final inkWell = Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        overlayColor: WidgetStateProperty.all(effectiveOverlayColor),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            top: 8 +
                (isFirst && !hasFixedTop
                    ? 0
                    : isFirst
                        ? 0
                        : 0),
            bottom: 8 +
                (isLast && !hasFixedBottom
                    ? 0
                    : isLast
                        ? 0
                        : 0),
          ),
          child: content,
        ),
      ),
    );

    return borderRadius != null
        ? ClipRRect(
            borderRadius: borderRadius!,
            clipBehavior: Clip.hardEdge,
            child: inkWell,
          )
        : inkWell;
  }
}

enum ElbPopupAnimationType {
  scale, // Scale and fade animation from edge
  fade, // Fade only
  slideVertical, // Slide from button position vertically
  slideHorizontal, // Slide from button position horizontally
}

class ElbPopup extends StatefulWidget {
  const ElbPopup({
    required this.buttonBuilder,
    this.menuBuilder,
    this.items,
    this.position = ElbPopupPosition.bottomRight,
    this.animationType = ElbPopupAnimationType.scale,
    this.offset,
    this.barrierColor,
    this.style,
    this.barrierDismissible = true,
    this.animate = true,
    this.barrierAbsorbing = true,
    this.excludeButtonFromBarrier = false,
    this.useRootNavigator = false,
    this.forceButtonWidth = false,
    this.fixedTopWidget,
    this.fixedBottomWidget,
    super.key,
  }) : assert(
          (menuBuilder != null) ^ (items != null),
          'Either menuBuilder or items must be provided, but not both',
        );

  final Widget Function(
    void Function() showOverlay,
    void Function() hideOverlay,
    bool isOpen,
  ) buttonBuilder;
  final Widget Function(void Function({bool immediate}) hideOverlay)?
      menuBuilder;
  final List<ElbPopupItem>? items;
  final ElbPopupPosition position;
  final ElbPopupAnimationType animationType;
  final Offset? offset;
  final Color? barrierColor;
  final ElbPopupStyle? style;
  final bool barrierDismissible;
  final bool animate;
  final bool barrierAbsorbing;
  final bool excludeButtonFromBarrier;
  final bool useRootNavigator;
  final bool forceButtonWidth;
  final Widget? fixedTopWidget;
  final Widget? fixedBottomWidget;

  @override
  State<ElbPopup> createState() => _ElbPopupState();
}

class _ElbPopupState extends State<ElbPopup>
    with SingleTickerProviderStateMixin {
  final LayerLink layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _offsetAnimation;
  final GlobalKey _buttonKey = GlobalKey();
  bool _isOpen = false;
  ScrollController? _scrollController;

  Alignment get _targetAnchor {
    switch (widget.position) {
      case ElbPopupPosition.topLeft:
        return Alignment.topLeft;
      case ElbPopupPosition.topRight:
        return Alignment.topRight;
      case ElbPopupPosition.bottomLeft:
        return Alignment.bottomLeft;
      case ElbPopupPosition.bottomRight:
        return Alignment.bottomRight;
      case ElbPopupPosition.leftToTop:
        return Alignment.topLeft;
      case ElbPopupPosition.leftToBottom:
        return Alignment.topLeft;
      case ElbPopupPosition.rightToTop:
        return Alignment.topRight;
      case ElbPopupPosition.rightToBottom:
        return Alignment.topRight;
    }
  }

  Alignment get _followerAnchor {
    switch (widget.position) {
      case ElbPopupPosition.topLeft:
        return Alignment.bottomLeft;
      case ElbPopupPosition.topRight:
        return Alignment.bottomRight;
      case ElbPopupPosition.bottomLeft:
        return Alignment.topLeft;
      case ElbPopupPosition.bottomRight:
        return Alignment.topRight;
      case ElbPopupPosition.leftToTop:
        return Alignment.topRight;
      case ElbPopupPosition.leftToBottom:
        return Alignment.topRight;
      case ElbPopupPosition.rightToTop:
        return Alignment.topLeft;
      case ElbPopupPosition.rightToBottom:
        return Alignment.topLeft;
    }
  }

  Alignment get _animationAlignment {
    switch (widget.position) {
      case ElbPopupPosition.topLeft:
        return Alignment.bottomLeft;
      case ElbPopupPosition.topRight:
        return Alignment.bottomRight;
      case ElbPopupPosition.bottomLeft:
        return Alignment.topLeft;
      case ElbPopupPosition.bottomRight:
        return Alignment.topRight;
      case ElbPopupPosition.leftToTop:
        return Alignment.bottomRight;
      case ElbPopupPosition.leftToBottom:
        return Alignment.topRight;
      case ElbPopupPosition.rightToTop:
        return Alignment.bottomLeft;
      case ElbPopupPosition.rightToBottom:
        return Alignment.topLeft;
    }
  }

  Offset get _defaultOffset {
    switch (widget.position) {
      case ElbPopupPosition.topLeft:
      case ElbPopupPosition.topRight:
        return const Offset(0, -8); // Negative Y to add space above
      case ElbPopupPosition.bottomLeft:
      case ElbPopupPosition.bottomRight:
        return const Offset(0, 8); // Positive Y to add space below
      case ElbPopupPosition.leftToTop:
      case ElbPopupPosition.leftToBottom:
        return const Offset(-8, 0); // Negative X to add space on left
      case ElbPopupPosition.rightToTop:
      case ElbPopupPosition.rightToBottom:
        return const Offset(8, 0); // Positive X to add space on right
    }
  }

  double _calculateMaxHeight(
    ElbPopupPosition position,
    double spaceAbove,
    double spaceBelow,
    Offset buttonPosition,
    double screenHeight,
    bool shouldFlipVertical,
  ) {
    // For side positions (left/right), use most of screen height
    if (position == ElbPopupPosition.leftToTop ||
        position == ElbPopupPosition.leftToBottom ||
        position == ElbPopupPosition.rightToTop ||
        position == ElbPopupPosition.rightToBottom) {
      // Calculate from button position to screen edge
      final spaceFromButton = position == ElbPopupPosition.leftToBottom ||
              position == ElbPopupPosition.rightToBottom
          ? screenHeight - buttonPosition.dy - 20 // Space to bottom
          : buttonPosition.dy - 20; // Space to top

      // Use minimum of calculated space or 80% of screen height
      return spaceFromButton.clamp(200, screenHeight * 0.8);
    }

    // For top/bottom positions
    return shouldFlipVertical ? spaceAbove - 20 : spaceBelow - 20;
  }

  Tween<Offset> get _slideTween {
    final finalOffset = widget.offset ?? _defaultOffset;

    switch (widget.animationType) {
      case ElbPopupAnimationType.slideVertical:
        switch (widget.position) {
          case ElbPopupPosition.topLeft:
          case ElbPopupPosition.topRight:
            // Start at button edge (0), slide up to final position (-8)
            return Tween<Offset>(
              begin: Offset(finalOffset.dx, 0),
              end: finalOffset,
            );
          case ElbPopupPosition.bottomLeft:
          case ElbPopupPosition.bottomRight:
            // Start at button edge (0), slide down to final position (+8)
            return Tween<Offset>(
              begin: Offset(finalOffset.dx, 0),
              end: finalOffset,
            );
          case ElbPopupPosition.leftToTop:
          case ElbPopupPosition.rightToTop:
            // Slide vertically from bottom to top
            return Tween<Offset>(
              begin: Offset(finalOffset.dx, 20),
              end: finalOffset,
            );
          case ElbPopupPosition.leftToBottom:
          case ElbPopupPosition.rightToBottom:
            // Slide vertically from top to bottom
            return Tween<Offset>(
              begin: Offset(finalOffset.dx, -20),
              end: finalOffset,
            );
        }
      case ElbPopupAnimationType.slideHorizontal:
        switch (widget.position) {
          case ElbPopupPosition.topLeft:
          case ElbPopupPosition.bottomLeft:
            // Start at button edge (0), slide left
            return Tween<Offset>(
              begin: Offset(0, finalOffset.dy),
              end: finalOffset,
            );
          case ElbPopupPosition.topRight:
          case ElbPopupPosition.bottomRight:
            // Start at button edge (0), slide right
            return Tween<Offset>(
              begin: Offset(0, finalOffset.dy),
              end: finalOffset,
            );
          case ElbPopupPosition.leftToTop:
          case ElbPopupPosition.leftToBottom:
            // Slide horizontally from right to left
            return Tween<Offset>(
              begin: Offset(20, finalOffset.dy),
              end: finalOffset,
            );
          case ElbPopupPosition.rightToTop:
          case ElbPopupPosition.rightToBottom:
            // Slide horizontally from left to right
            return Tween<Offset>(
              begin: Offset(-20, finalOffset.dy),
              end: finalOffset,
            );
        }
      case ElbPopupAnimationType.scale:
      case ElbPopupAnimationType.fade:
        return Tween<Offset>(
          begin: finalOffset,
          end: finalOffset,
        );
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration:
          widget.animate ? AnimationConstants.defaultDuration : Duration.zero,
      vsync: this,
    );

    final curve =
        widget.animate ? AnimationConstants.defaultCurve : Curves.linear;

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: curve,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: curve,
    );

    // For slide animations, animate the offset from button edge to final position
    _offsetAnimation =
        (widget.animationType == ElbPopupAnimationType.slideVertical ||
                widget.animationType == ElbPopupAnimationType.slideHorizontal)
            ? _slideTween.animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: curve,
                ),
              )
            : AlwaysStoppedAnimation(widget.offset ?? _defaultOffset);
  }

  @override
  void didUpdateWidget(ElbPopup oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update animations if properties change
    if (oldWidget.animate != widget.animate ||
        oldWidget.animationType != widget.animationType ||
        oldWidget.position != widget.position) {
      _animationController.duration =
          widget.animate ? AnimationConstants.defaultDuration : Duration.zero;

      final curve =
          widget.animate ? AnimationConstants.defaultCurve : Curves.linear;

      _fadeAnimation = CurvedAnimation(
        parent: _animationController,
        curve: curve,
      );

      _scaleAnimation = CurvedAnimation(
        parent: _animationController,
        curve: curve,
      );

      _offsetAnimation =
          (widget.animationType == ElbPopupAnimationType.slideVertical ||
                  widget.animationType == ElbPopupAnimationType.slideHorizontal)
              ? _slideTween.animate(
                  CurvedAnimation(
                    parent: _animationController,
                    curve: curve,
                  ),
                )
              : AlwaysStoppedAnimation(widget.offset ?? _defaultOffset);
    }
  }

  @override
  void dispose() {
    // Remove overlay first to ensure it's not using the controllers
    _removeOverlay();
    _animationController.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  void _showOverlay() {
    if (_isOpen) return;

    setState(() {
      _isOpen = true;
    });
    _overlayEntry = _createOverlayEntry();

    // Always use root navigator so popup appears above all windows
    final overlay = Overlay.of(context, rootOverlay: true);

    overlay.insert(_overlayEntry!);
    _animationController.forward();
  }

  void _hideOverlay({bool immediate = false}) {
    if (!_isOpen) return;

    setState(() {
      _isOpen = false;
    });

    if (widget.animate && !immediate) {
      _animationController.reverse().then((_) {
        _removeOverlay();
      });
    } else {
      _animationController.reset();
      _removeOverlay();
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildContent(
    BuildContext context,
    void Function({bool immediate}) hideOverlay, {
    BoxConstraints? constraints,
    double? maxAvailableHeight,
  }) {
    final theme = context.appTheme;
    if (widget.menuBuilder != null) {
      // Wrap menuBuilder content with constraints and scrolling
      final effectiveMaxHeight = maxAvailableHeight ?? 400;
      final effectiveStyle = widget.style ?? const ElbPopupStyle();
      final borderRadius = effectiveStyle.borderRadius;

      return ElbPopupWrapper(
        style: widget.style,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: effectiveMaxHeight,
            ),
            child: SingleChildScrollView(
              child: widget.menuBuilder!(hideOverlay),
            ),
          ),
        ),
      );
    } else if (widget.items != null) {
      // Determine alignment based on position
      final isRightAligned = widget.position == ElbPopupPosition.topRight ||
          widget.position == ElbPopupPosition.bottomRight ||
          widget.position == ElbPopupPosition.rightToTop ||
          widget.position == ElbPopupPosition.rightToBottom;
      final itemAlignment =
          isRightAligned ? MainAxisAlignment.end : MainAxisAlignment.start;
      final crossAlignment =
          isRightAligned ? CrossAxisAlignment.end : CrossAxisAlignment.start;

      final effectiveStyle = widget.style ?? const ElbPopupStyle();
      final borderRadius = effectiveStyle.borderRadius;
      final hasFixedTop = widget.fixedTopWidget != null;
      final hasFixedBottom = widget.fixedBottomWidget != null;

      final itemsList = widget.items!.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isFirst = index == 0;
        final isLast = index == widget.items!.length - 1;

        // Calculate item border radius based on position
        BorderRadius? itemBorderRadius;
        if (isFirst && isLast && !hasFixedTop && !hasFixedBottom) {
          // Only item with no fixed widgets - use full border radius
          itemBorderRadius = borderRadius;
        } else if (isFirst && !hasFixedTop) {
          // First item with no fixed top - only top corners rounded
          itemBorderRadius = BorderRadius.only(
            topLeft: borderRadius.topLeft,
            topRight: borderRadius.topRight,
          );
        } else if (isLast && !hasFixedBottom) {
          // Last item with no fixed bottom - only bottom corners rounded
          itemBorderRadius = BorderRadius.only(
            bottomLeft: borderRadius.bottomLeft,
            bottomRight: borderRadius.bottomRight,
          );
        }

        return _ElbPopupItemWidget(
          item: item,
          alignment: itemAlignment,
          borderRadius: itemBorderRadius,
          overlayColor: effectiveStyle.overlayColor,
          isFirst: isFirst,
          isLast: isLast,
          hasFixedTop: hasFixedTop,
          hasFixedBottom: hasFixedBottom,
          onTap: () {
            hideOverlay(immediate: true);
            item.onTap?.call();
          },
        );
      }).toList();

      final Widget content = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: crossAlignment,
        children: itemsList,
      );

      // Build content based on whether we need scrolling
      // Use provided maxAvailableHeight if available, otherwise try constraints
      final effectiveMaxHeight = maxAvailableHeight ??
          (constraints != null && constraints.maxHeight < double.infinity
              ? constraints.maxHeight - 100
              : 400); // Default max height if no constraints

      // Always use scrollable version if we have items that might overflow
      if (widget.items!.length > 5 || effectiveMaxHeight < 600) {
        // Build scrollable version
        _scrollController ??= ScrollController();

        final hasFixedTop = widget.fixedTopWidget != null;
        final hasFixedBottom = widget.fixedBottomWidget != null;

        final scrollableContent = Padding(
          padding: EdgeInsets.only(
            top: hasFixedTop ? 8 : 0,
            bottom: hasFixedBottom ? 8 : 0,
          ),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAlignment,
              children: itemsList,
            ),
          ),
        );

        return ElbPopupWrapper(
          style: widget.style,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Material(
              color: Colors.transparent,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: effectiveMaxHeight),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.fixedTopWidget != null) widget.fixedTopWidget!,
                      if (widget.fixedTopWidget != null)
                        const Divider(height: 1),
                      Flexible(
                        child: scrollableContent,
                      ),
                      if (widget.fixedBottomWidget != null)
                        const Divider(height: 1),
                      if (widget.fixedBottomWidget != null)
                        widget.fixedBottomWidget!,
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } else {
        // Non-scrollable version
        final hasFixedTop = widget.fixedTopWidget != null;
        final hasFixedBottom = widget.fixedBottomWidget != null;

        // Wrap content with padding only when fixed widgets are present
        final paddedContent = Padding(
          padding: EdgeInsets.only(
            top: hasFixedTop ? 8 : 0,
            bottom: hasFixedBottom ? 8 : 0,
          ),
          child: content,
        );

        return ElbPopupWrapper(
          style: widget.style,
          child: ClipRRect(
            borderRadius: borderRadius,
            child: IntrinsicWidth(
              child: Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.fixedTopWidget != null) widget.fixedTopWidget!,
                    if (widget.fixedTopWidget != null) const Divider(height: 1),
                    paddedContent,
                    if (widget.fixedBottomWidget != null)
                      const Divider(height: 1),
                    if (widget.fixedBottomWidget != null)
                      widget.fixedBottomWidget!,
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }
    return const SizedBox();
  }

  Widget _buildAnimatedContent(Widget child, {
    bool shouldFlipVertical = false,
    bool shouldFlipHorizontal = false,
  }) {
    if (!widget.animate) {
      return child;
    }

    switch (widget.animationType) {
      case ElbPopupAnimationType.fade:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: child,
        );
      case ElbPopupAnimationType.scale:
        // Adjust animation alignment based on flipping
        var animationAlignment = _animationAlignment;
        if (shouldFlipVertical) {
          animationAlignment = Alignment(
            animationAlignment.x,
            -animationAlignment.y,
          );
        }
        if (shouldFlipHorizontal) {
          animationAlignment = Alignment(
            -animationAlignment.x,
            animationAlignment.y,
          );
        }
        
        return ScaleTransition(
          scale: _scaleAnimation,
          alignment: animationAlignment,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: child,
          ),
        );
      case ElbPopupAnimationType.slideVertical:
      case ElbPopupAnimationType.slideHorizontal:
        // Slide is handled by animating the offset, just add fade
        return FadeTransition(
          opacity: _fadeAnimation,
          child: child,
        );
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      maintainState: true,
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            if (!mounted) {
              return const SizedBox();
            }

            try {
              final buttonContext = _buttonKey.currentContext;
              if (buttonContext == null) {
                return const SizedBox();
              }
              if (!buttonContext.mounted) {
                return const SizedBox();
              }

              final buttonRenderBox =
                  buttonContext.findRenderObject() as RenderBox?;

              // Check if render objects are available
              if (buttonRenderBox == null) {
                return const SizedBox();
              }

              final buttonSize = buttonRenderBox.size;

              // Get button position in screen coordinates
              final buttonPosition = buttonRenderBox.localToGlobal(Offset.zero);

              // Calculate available space using View to get actual window size
              // This ensures we get the full window bounds, not Navigator bounds
              final view = View.of(context);
              final screenHeight = 
                  view.physicalSize.height / view.devicePixelRatio;
              final screenWidth = 
                  view.physicalSize.width / view.devicePixelRatio;
              final spaceBelow =
                  screenHeight - (buttonPosition.dy + buttonSize.height);
              final spaceAbove = buttonPosition.dy;
              final spaceRight =
                  screenWidth - (buttonPosition.dx + buttonSize.width);
              final spaceLeft = buttonPosition.dx;

              // Determine if we need to flip the position
              var shouldFlipVertical = false;
              var shouldFlipHorizontal = false;

              // Check if popup should flip based on available space
              if (widget.position == ElbPopupPosition.bottomLeft ||
                  widget.position == ElbPopupPosition.bottomRight) {
                // For bottom positions, check if there's more space above
                if (spaceBelow < 200 && spaceAbove > spaceBelow) {
                  shouldFlipVertical = true;
                }
              } else if (widget.position == ElbPopupPosition.topLeft ||
                  widget.position == ElbPopupPosition.topRight) {
                // For top positions, check if there's more space below
                if (spaceAbove < 200 && spaceBelow > spaceAbove) {
                  shouldFlipVertical = true;
                }
              }

              // Check horizontal space for right/left positions
              if (widget.position == ElbPopupPosition.bottomRight ||
                  widget.position == ElbPopupPosition.topRight ||
                  widget.position == ElbPopupPosition.rightToTop ||
                  widget.position == ElbPopupPosition.rightToBottom) {
                if (spaceRight < 200 && spaceLeft > spaceRight) {
                  shouldFlipHorizontal = true;
                }
              } else if (widget.position == ElbPopupPosition.bottomLeft ||
                  widget.position == ElbPopupPosition.topLeft ||
                  widget.position == ElbPopupPosition.leftToTop ||
                  widget.position == ElbPopupPosition.leftToBottom) {
                if (spaceLeft < 200 && spaceRight > spaceLeft) {
                  shouldFlipHorizontal = true;
                }
              }

              // Adjust anchors based on flipping
              var adjustedTargetAnchor = _targetAnchor;
              var adjustedFollowerAnchor = _followerAnchor;

              if (shouldFlipVertical) {
                // Flip vertical component of anchors
                adjustedTargetAnchor = Alignment(
                  adjustedTargetAnchor.x,
                  -adjustedTargetAnchor.y,
                );
                adjustedFollowerAnchor = Alignment(
                  adjustedFollowerAnchor.x,
                  -adjustedFollowerAnchor.y,
                );
              }

              if (shouldFlipHorizontal) {
                // Flip horizontal component of anchors
                adjustedTargetAnchor = Alignment(
                  -adjustedTargetAnchor.x,
                  adjustedTargetAnchor.y,
                );
                adjustedFollowerAnchor = Alignment(
                  -adjustedFollowerAnchor.x,
                  adjustedFollowerAnchor.y,
                );
              }

              return Stack(
                children: [
                  // Add a barrier that covers the entire screen
                  // Add a barrier that covers the entire screen
                  Positioned.fill(
                    child: widget.barrierAbsorbing
                        ? GestureDetector(
                            onTap:
                                widget.barrierDismissible ? _hideOverlay : null,
                            behavior: HitTestBehavior.opaque,
                            child: widget.animate
                                ? FadeTransition(
                                    opacity: _fadeAnimation,
                                    child: Container(
                                      color: widget.barrierColor ??
                                          Colors.transparent,
                                    ),
                                  )
                                : Container(
                                    color: widget.barrierColor ??
                                        Colors.transparent,
                                  ),
                          )
                        : IgnorePointer(
                            child: widget.animate
                                ? FadeTransition(
                                    opacity: _fadeAnimation,
                                    child: Container(
                                      color: widget.barrierColor ??
                                          Colors.transparent,
                                    ),
                                  )
                                : Container(
                                    color: widget.barrierColor ??
                                        Colors.transparent,
                                  ),
                          ),
                  ),
                  // Render the actual button on top of the barrier when excludeButtonFromBarrier is true
                  if (widget.excludeButtonFromBarrier &&
                      widget.barrierAbsorbing)
                    AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        // Only show the button when fully open or not animating
                        if (!widget.animate ||
                            _animationController.value == 1.0) {
                          return CompositedTransformFollower(
                            link: layerLink,
                            targetAnchor: Alignment.topLeft,
                            followerAnchor: Alignment.topLeft,
                            child: widget.buttonBuilder(
                              _showOverlay,
                              _hideOverlay,
                              _isOpen,
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  AnimatedBuilder(
                    animation: _offsetAnimation,
                    builder: (context, child) => CompositedTransformFollower(
                      showWhenUnlinked: false,
                      offset: _offsetAnimation.value,
                      link: layerLink,
                      targetAnchor: adjustedTargetAnchor,
                      followerAnchor: adjustedFollowerAnchor,
                      child: child,
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: widget.forceButtonWidth
                          ? SizedBox(
                              width: buttonSize.width,
                              child: _buildAnimatedContent(
                                _buildContent(
                                  context,
                                  _hideOverlay,
                                  constraints: constraints,
                                  maxAvailableHeight: _calculateMaxHeight(
                                    widget.position,
                                    spaceAbove,
                                    spaceBelow,
                                    buttonPosition,
                                    screenHeight,
                                    shouldFlipVertical,
                                  ),
                                ),
                                shouldFlipVertical: shouldFlipVertical,
                                shouldFlipHorizontal: shouldFlipHorizontal,
                              ),
                            )
                          : _buildAnimatedContent(
                              _buildContent(
                                context,
                                _hideOverlay,
                                constraints: constraints,
                                maxAvailableHeight: shouldFlipVertical
                                    ? spaceAbove - 20
                                    : spaceBelow - 20,
                              ),
                              shouldFlipVertical: shouldFlipVertical,
                              shouldFlipHorizontal: shouldFlipHorizontal,
                            ),
                    ),
                  ),
                ],
              );
            } catch (e) {
              return const SizedBox();
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // If items is not null but empty, don't render anything
    if (widget.items != null && widget.items!.isEmpty) {
      return const SizedBox.shrink();
    }

    return CompositedTransformTarget(
      link: layerLink,
      child: KeyedSubtree(
        key: _buttonKey,
        child: widget.buttonBuilder(_showOverlay, _hideOverlay, _isOpen),
      ),
    );
  }
}

class ElbPopupWrapper extends StatelessWidget {
  const ElbPopupWrapper({
    required this.child,
    super.key,
    this.style,
  });
  final Widget child;
  final ElbPopupStyle? style;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final effectiveStyle = style ?? const ElbPopupStyle();

    return Container(
      decoration: BoxDecoration(
        color: effectiveStyle.backgroundColor ??
            theme.generalColors.primarySurface,
        borderRadius: effectiveStyle.borderRadius,
        border: effectiveStyle.borderColor != null
            ? Border.all(color: effectiveStyle.borderColor!)
            : null,
        boxShadow: effectiveStyle.borderShadow ?? ElbPopupStyle.defaultShadow,
      ),
      child: child,
    );
  }
}
