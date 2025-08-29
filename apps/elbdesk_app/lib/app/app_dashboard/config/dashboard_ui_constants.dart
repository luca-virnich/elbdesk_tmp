/// Constants used throughout the dashboard feature
class DashboardUIConstants {
  const DashboardUIConstants._();

  /// Minimum height for dashboard tiles and slots
  static const double minTileHeight = 320;

  /// Default height for new dashboard tiles
  static const double defaultTileHeight = 400;

  /// Maximum height for dashboard tiles
  static const double maxTileHeight = 800;

  /// Minimum number of rows in the dashboard grid
  static const int minRows = 4;

  /// Number of extra rows to maintain below the last used row
  static const int bufferRows = 2;

  /// Default number of columns in the dashboard grid
  static const int defaultColumns = 2;

  /// Responsive breakpoint for the dashboard grid
  static const double responsiveBreakpoint = 600;
}
