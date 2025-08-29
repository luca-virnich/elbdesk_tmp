// class AppIconSize {
//   const AppIconSize._();

//   static const double xs = 4;
//   static const double s = 8;
//   static const double m = 12;
//   static const double l = 16;
//   static const double xl = 24;
//   static const double xxl = 32;
//   static const double xxxl = 64;

//   static const screenViewPadding = m;

//   static const standard = m;
// }

/// Defines standard text sizes used throughout the app.
///
/// The [AppTextSize] enum provides predefined sizes for text, ranging from
/// extra small (xs) to triple extra large (xxxl). Each size is associated
/// with a specific pixel value.
enum AppTextSize {
  /// Extra small text size (4 pixels).
  xs(4),

  /// Small text size (8 pixels).
  s(8),

  /// Medium text size (12 pixels).
  m(12),

  /// Large text size (16 pixels).
  l(16),

  /// Extra large text size (24 pixels).
  xl(24),

  /// Double extra large text size (32 pixels).
  xxl(32),

  /// Triple extra large text size (64 pixels).
  xxxl(64);

  /// Creates an [AppTextSize] instance with the given [value].
  ///
  /// The [value] parameter specifies the size of the text in pixels.
  const AppTextSize(this.value);

  /// The size of the text in pixels.
  final double value;
}
