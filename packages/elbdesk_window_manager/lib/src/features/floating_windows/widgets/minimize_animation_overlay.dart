import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/providers.dart';

/// Overlay that shows minimize/restore animations
class MinimizeAnimationOverlay extends ConsumerWidget {
  const MinimizeAnimationOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animations = ref.watch(minimizeAnimationsProvider);
    
    if (animations.isEmpty) {
      return const SizedBox.shrink();
    }
    


    return Stack(
      children: animations.entries.map((entry) {
        final animation = entry.value;
        final controller = animation.animationController;
        // Watch the snapshot for this window
        final snapshotData = ref.watch(windowSnapshotProvider(animation.windowId));
        final snapshot = snapshotData;
        
        if (controller == null) return const SizedBox.shrink();

        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            // Calculate animated values
            final t = controller.value;
            
            if (!animation.isMinimizing) {
            }
            
            // Use different curves for different properties
            final scaleT = animation.isMinimizing
                ? Curves.easeIn.transform(t)
                : Curves.easeOut.transform(1.0 - t);
            
            // Calculate scale
            final scale = animation.isMinimizing
                ? 1.0 - scaleT
                : scaleT;
            
            // Note: Position is calculated inline in the animation code
            
            // Calculate opacity
            final opacity = animation.isMinimizing
                ? 1.0 - Curves.easeInQuad.transform(t) * 0.3
                : Curves.easeOutQuad.transform(t);
            
            // For the macOS genie effect, create a perspective transform
            final Widget windowContent = Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3 * opacity),
                    blurRadius: 20 * scale,
                    offset: Offset(0, 8 * scale),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: snapshot != null
                    ? RawImage(
                        image: snapshot.image,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Theme.of(context).cardColor,
                        child: const Center(
                          child: Icon(
                            Icons.window,
                            size: 48,
                            color: Colors.grey,
                          ),
                        ),
                      ),
              ),
            );
            
            if (animation.isMinimizing) {
              // macOS genie effect with improved curved distortion
              final progress = t;
              
              final windowRect = animation.startBounds;
              final targetRect = animation.endBounds;
              
              // Use smoother curves for better animation
              final topProgress = Curves.easeInOutCubic.transform(progress * 0.6);
              final bottomProgress = Curves.fastOutSlowIn.transform(progress);
              
              // Calculate the center point of the taskbar tile for better targeting
              final targetCenterX = targetRect.center.dx;
              
              // Top of window moves towards center of tile
              final topX = windowRect.left + (targetCenterX - windowRect.width / 2 - windowRect.left) * topProgress;
              final topY = windowRect.top + (targetRect.top - windowRect.top) * topProgress;
              
              // Bottom moves faster and more directly
              final bottomX = windowRect.left + (targetCenterX - windowRect.width / 2 - windowRect.left) * bottomProgress;
              final bottomY = windowRect.bottom + (targetRect.center.dy - windowRect.bottom) * bottomProgress;
              
              // Improved width calculations - ensure we never get wider than original
              final maxShrink = 0.95; // Maximum shrinkage
              final topWidth = windowRect.width * (1.0 - topProgress * maxShrink * 0.7);
              final bottomWidth = windowRect.width * (1.0 - bottomProgress * maxShrink);
              
              // Ensure bottom is never wider than top
              final actualBottomWidth = bottomWidth.clamp(0.0, topWidth);
              
              // Calculate height
              final currentHeight = (bottomY - topY).abs().clamp(1.0, windowRect.height);
              
              // Curve amount should be proportional but capped
              final maxCurve = windowRect.width * 0.15; // Max 15% of width
              final curveAmount = (progress * maxCurve * (1.0 - progress)).clamp(0.0, maxCurve);
              
              // Calculate the actual display bounds
              final displayLeft = topX.clamp(0.0, MediaQuery.of(context).size.width);
              final displayTop = topY.clamp(0.0, MediaQuery.of(context).size.height);
              
              return Positioned(
                left: displayLeft,
                top: displayTop,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: opacity,
                    child: ClipPath(
                      clipper: _GenieClipper(
                        topWidth: topWidth,
                        bottomWidth: actualBottomWidth,
                        height: currentHeight,
                        bottomOffset: (bottomX - topX).clamp(-topWidth/2, topWidth/2).toDouble(),
                        curveAmount: curveAmount,
                      ),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0005) // subtle perspective
                          ..scale(
                            1.0, // Don't scale X in the transform
                            currentHeight / windowRect.height,
                            1.0,
                          ),
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: windowRect.width,
                          height: windowRect.height,
                          child: OverflowBox(
                            maxWidth: windowRect.width,
                            maxHeight: windowRect.height,
                            child: windowContent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              // Restore animation - reverse genie effect
              final progress = t;
              final windowRect = animation.endBounds; // endBounds is the window position for restore
              final tileRect = animation.startBounds; // startBounds is the tile position
              
              // Use exact reverse of minimize curves
              // For minimize: top uses easeInOutCubic(progress * 0.6), bottom uses fastOutSlowIn(progress)
              // For restore: we need to reverse this perfectly
              final reversedProgress = 1.0 - progress;
              final topProgress = 1.0 - Curves.easeInOutCubic.transform(reversedProgress * 0.6);
              final bottomProgress = 1.0 - Curves.fastOutSlowIn.transform(reversedProgress);
              
              // Calculate the center point of the taskbar tile
              final tileCenterX = tileRect.center.dx;
              
              // Interpolate from tile center to window position
              final topX = tileCenterX - (windowRect.width / 2) + (windowRect.left - (tileCenterX - windowRect.width / 2)) * topProgress;
              final topY = tileRect.top + (windowRect.top - tileRect.top) * topProgress;
              
              final bottomX = tileCenterX - (windowRect.width / 2) + (windowRect.left - (tileCenterX - windowRect.width / 2)) * bottomProgress;
              final bottomY = tileRect.center.dy + (windowRect.bottom - tileRect.center.dy) * bottomProgress;
              
              // Use exact reverse of minimize width calculations
              final maxShrink = 0.95;
              final topWidth = windowRect.width * (1.0 - (1.0 - topProgress) * maxShrink * 0.7);
              final bottomWidth = windowRect.width * (1.0 - (1.0 - bottomProgress) * maxShrink);
              
              // Ensure bottom is never wider than top (same as minimize)
              final actualBottomWidth = bottomWidth.clamp(0.0, topWidth);
              
              // Calculate height
              final currentHeight = (bottomY - topY).abs().clamp(1.0, windowRect.height);
              
              // Use exact reverse of minimize curve calculation
              final maxCurve = windowRect.width * 0.15;
              final curveAmount = (reversedProgress * maxCurve * (1.0 - reversedProgress)).clamp(0.0, maxCurve);
              
              // Note: Window visibility will be handled by the floating window itself
              
              return Positioned(
                left: topX.clamp(0.0, MediaQuery.of(context).size.width),
                top: topY.clamp(0.0, MediaQuery.of(context).size.height),
                child: IgnorePointer(
                  child: Opacity(
                    opacity: opacity,
                    child: ClipPath(
                      clipper: _GenieClipper(
                        topWidth: topWidth,
                        bottomWidth: actualBottomWidth,
                        height: currentHeight,
                        bottomOffset: (bottomX - topX).clamp(-topWidth/2, topWidth/2).toDouble(),
                        curveAmount: curveAmount,
                      ),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.0005) // subtle perspective
                          ..scale(
                            1.0, // Don't scale X
                            currentHeight / windowRect.height,
                            1.0,
                          ),
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          width: windowRect.width,
                          height: windowRect.height,
                          child: OverflowBox(
                            maxWidth: windowRect.width,
                            maxHeight: windowRect.height,
                            child: windowContent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      }).toList(),
    );
  }
}

/// Custom clipper for the genie effect curved shape
class _GenieClipper extends CustomClipper<Path> {
  final double topWidth;
  final double bottomWidth;
  final double height;
  final double bottomOffset;
  final double curveAmount;

  _GenieClipper({
    required this.topWidth,
    required this.bottomWidth,
    required this.height,
    this.bottomOffset = 0,
    this.curveAmount = 0,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final topCenterX = topWidth / 2;
    final bottomCenterX = topCenterX + bottomOffset;
    
    // Ensure we have valid dimensions
    if (topWidth <= 0 || height <= 0) {
      return path;
    }
    
    // Start from top-left
    path.moveTo(0, 0);
    
    // Top edge
    path.lineTo(topWidth, 0);
    
    // Right side with smooth cubic curve
    final rightControlY1 = height * 0.2;
    final rightControlY2 = height * 0.8;
    
    path.cubicTo(
      topWidth + curveAmount * 0.5, rightControlY1, // first control point
      bottomCenterX + bottomWidth / 2 + curveAmount * 0.5, rightControlY2, // second control point
      bottomCenterX + bottomWidth / 2, height, // end point
    );
    
    // Bottom edge
    if (bottomWidth > 0) {
      path.lineTo(bottomCenterX - bottomWidth / 2, height);
    }
    
    // Left side with smooth cubic curve
    final leftControlY1 = height * 0.8;
    final leftControlY2 = height * 0.2;
    
    path.cubicTo(
      bottomCenterX - bottomWidth / 2 - curveAmount * 0.5, leftControlY1, // first control point
      -curveAmount * 0.5, leftControlY2, // second control point
      0, 0, // back to start
    );
    
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(covariant _GenieClipper oldClipper) {
    return topWidth != oldClipper.topWidth ||
        bottomWidth != oldClipper.bottomWidth ||
        height != oldClipper.height ||
        bottomOffset != oldClipper.bottomOffset ||
        curveAmount != oldClipper.curveAmount;
  }
}

