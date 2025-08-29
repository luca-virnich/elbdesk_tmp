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

/// Defines standard sizes for icons used in the app.
///
/// The [AppIconSize] enum provides predefined sizes for icons, ranging from
/// extra small (xs) to triple extra large (xxxl). Each size is associated
/// with a specific pixel value.
enum AppIconSize {
  /// Extra extra small icon size (4 pixels).
  xxs(4),

  /// Extra small icon size (8 pixels).
  xs(8),

  /// Small icon size (12 pixels).
  s(12),

  /// Medium icon size (16 pixels).
  m(16),

  /// Large icon size (20 pixels).
  l(20),

  /// Extra large icon size (24 pixels).
  xl(24),

  /// Double extra large icon size (32 pixels).
  xxl(32),

  /// Triple extra large icon size (64 pixels).
  xxxl(64);

  /// Creates an [AppIconSize] instance with the given [value].
  ///
  /// The [value] parameter specifies the size of the icon in pixels.
  const AppIconSize(this.value);

  /// The size of the icon in pixels.
  final double value;
}
