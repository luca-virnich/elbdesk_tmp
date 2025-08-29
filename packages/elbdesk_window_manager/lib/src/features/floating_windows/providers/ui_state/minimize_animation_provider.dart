import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../constants/animation_constants.dart';

part 'minimize_animation_provider.g.dart';

/// Represents the state of a minimize/restore animation
class MinimizeAnimationState {
  const MinimizeAnimationState({
    required this.windowId,
    required this.isMinimizing,
    required this.startBounds,
    required this.endBounds,
    this.animationController,
  });

  final String windowId;
  final bool isMinimizing; // true for minimize, false for restore
  final Rect startBounds; // Window bounds
  final Rect endBounds; // Taskbar tile bounds
  final AnimationController? animationController;

  MinimizeAnimationState copyWith({
    String? windowId,
    bool? isMinimizing,
    Rect? startBounds,
    Rect? endBounds,
    AnimationController? animationController,
  }) {
    return MinimizeAnimationState(
      windowId: windowId ?? this.windowId,
      isMinimizing: isMinimizing ?? this.isMinimizing,
      startBounds: startBounds ?? this.startBounds,
      endBounds: endBounds ?? this.endBounds,
      animationController: animationController ?? this.animationController,
    );
  }
}

/// Manages minimize/restore animations for windows
@riverpod
class MinimizeAnimations extends _$MinimizeAnimations {
  @override
  Map<String, MinimizeAnimationState> build() {
    // Dispose all animations when provider is disposed
    ref.onDispose(() {
      disposeAll();
    });
    
    return {};
  }

  /// Start a minimize animation
  void startMinimizeAnimation({
    required String windowId,
    required Rect windowBounds,
    required Rect taskbarTileBounds,
    required TickerProvider tickerProvider,
    required VoidCallback onComplete,
  }) {
    final controller = AnimationController(
      duration: AnimationConstants.minimizeAnimationDuration,
      vsync: tickerProvider,
    );

    // Adjust the end bounds by the animation offset from the left edge
    final adjustedTileBounds = Rect.fromLTWH(
      taskbarTileBounds.left + AnimationConstants.taskbarTileAnimationOffset,
      taskbarTileBounds.top,
      taskbarTileBounds.width,
      taskbarTileBounds.height,
    );

    state = {
      ...state,
      windowId: MinimizeAnimationState(
        windowId: windowId,
        isMinimizing: true,
        startBounds: windowBounds,
        endBounds: adjustedTileBounds,
        animationController: controller,
      ),
    };

    // Start animation immediately without delay
    controller.forward(from: 0.0).then((_) {
      onComplete();
      removeAnimation(windowId);
    });
  }

  /// Start a restore animation
  void startRestoreAnimation({
    required String windowId,
    required Rect taskbarTileBounds,
    required Rect windowBounds,
    required TickerProvider tickerProvider,
    required VoidCallback onComplete,
  }) {
    // Remove any existing animation for this window first
    final existingAnimation = state[windowId];
    existingAnimation?.animationController?.dispose();
    
    final controller = AnimationController(
      duration: AnimationConstants.minimizeAnimationDuration,
      vsync: tickerProvider,
    );

    // Adjust the start bounds to match minimize end position
    final adjustedTileBounds = Rect.fromLTWH(
      taskbarTileBounds.left + AnimationConstants.taskbarTileAnimationOffset,
      taskbarTileBounds.top,
      taskbarTileBounds.width,
      taskbarTileBounds.height,
    );

    state = {
      ...state,
      windowId: MinimizeAnimationState(
        windowId: windowId,
        isMinimizing: false,
        startBounds: adjustedTileBounds,
        endBounds: windowBounds,
        animationController: controller,
      ),
    };

    controller.forward().then((_) {
      onComplete();
      // Delay removal slightly to ensure smooth transition
      // Window starts fading in at 80% (400ms), so we wait a bit after completion
      Future.delayed(const Duration(milliseconds: 150), () {
        removeAnimation(windowId);
      });
    });
  }

  /// Remove an animation
  void removeAnimation(String windowId) {
    final animation = state[windowId];
    
    // Ensure proper disposal
    try {
      animation?.animationController?.dispose();
    } catch (e) {
      // Silently handle disposal errors
    }
    
    // Create new state without the removed animation
    final newState = Map<String, MinimizeAnimationState>.from(state);
    newState.remove(windowId);
    state = newState;
  }
  
  /// Dispose all animations (called when provider is disposed)
  void disposeAll() {
    for (final animation in state.values) {
      try {
        animation.animationController?.dispose();
      } catch (e) {
        // Silently handle disposal errors
      }
    }
    state = {};
  }

  /// Get animation for a window
  MinimizeAnimationState? getAnimation(String windowId) => state[windowId];
}