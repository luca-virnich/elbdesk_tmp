/// Constants for minimize/restore animations
class AnimationConstants {
  AnimationConstants._();

  /// Duration for minimize/restore genie animation
  static const Duration minimizeAnimationDuration = Duration(milliseconds: 500);
  
  /// Duration for window fade in/out when minimizing without animation
  static const Duration fadeAnimationDuration = Duration(milliseconds: 200);
  
  /// Duration for window fade animation controller
  static const Duration windowFadeAnimationDuration = Duration(milliseconds: 300);
  
  /// Offset from taskbar tile edge for minimize animation endpoint (in pixels)
  static const double taskbarTileAnimationOffset = 200.0;
  
  /// Delay before showing window during restore animation
  static const Duration restoreWindowShowDelay = Duration(milliseconds: 350);
  
  /// Duration for window fade-in during restore
  static const Duration restoreWindowFadeInDuration = Duration(milliseconds: 200);
  
  /// Delay before cleaning up window snapshot after restore
  static const Duration snapshotCleanupDelay = Duration(milliseconds: 250);
  
  /// Maximum number of checks for animation detection
  static const int maxAnimationDetectionChecks = 10;
  
  /// Interval between animation detection checks
  static const Duration animationDetectionInterval = Duration(milliseconds: 50);
  
  /// Frame delay for ensuring UI updates
  static const Duration frameDelay = Duration(milliseconds: 16);
}