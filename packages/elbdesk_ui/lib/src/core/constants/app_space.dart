/// Defines standard spacing values used throughout the app.
///
/// The [AppSpace] class provides predefined spacing values, ranging from
/// extra small (xs) to triple extra large (xxxl). Each size is associated
/// with a specific pixel value.
class AppSpace {
  /// Private constructor to prevent instantiation.
  const AppSpace._();

  /// Extra extra small spacing (2 pixels).
  static const double xxs = 2;

  /// Extra small spacing (4 pixels).
  static const double xs = 4;

  /// Small spacing (8 pixels).
  static const double s = 8;

  /// Medium spacing (12 pixels).
  static const double m = 12;

  /// Large spacing (16 pixels).
  static const double l = 16;

  /// Extra large spacing (24 pixels).
  static const double xl = 24;

  /// Double extra large spacing (32 pixels).
  static const double xxl = 32;

  /// Triple extra large spacing (64 pixels).
  static const double xxxl = 64;

  /// Default padding for screen views (12 pixels).
  static const screenViewPadding = m;

  /// Standard spacing value (12 pixels).
  static const standard = m;
}
