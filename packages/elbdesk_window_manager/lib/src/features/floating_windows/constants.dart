/// Constants for the floating windows feature
class FloatingWindowConstants {
  // Dimensions
  static const double taskbarHeight = 48.0;
  static const double defaultTitleBarHeight = 40.0;
  static const double windowBorderRadius = 8.0;
  static const double windowElevation = 8.0;
  
  // Sizes
  static const double defaultWindowWidth = 800.0;
  static const double defaultWindowHeight = 600.0;
  static const double minWindowWidth = 400.0;
  static const double minWindowHeight = 300.0;
  
  // Animations
  static const Duration maximizeAnimationDuration = Duration(milliseconds: 200);
  static const Duration dragThrottleDelay = Duration(milliseconds: 16); // 60 FPS
  static const Duration edgeSnapDelay = Duration(seconds: 2);
  static const Duration snapMenuHoverDelay = Duration(milliseconds: 700);
  
  // Edge detection
  static const double edgeSnapThreshold = 20.0;
  
  // Window controls
  static const double windowControlButtonSize = 40.0;
  static const double windowControlIconSize = 18.0;
  
  // Snap menu
  static const double snapMenuWidth = 280.0;
  static const double snapButtonWidth = 60.0;
  static const double snapButtonHeight = 40.0;
}