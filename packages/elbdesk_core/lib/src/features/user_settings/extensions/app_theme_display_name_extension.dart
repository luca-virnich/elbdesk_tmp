import 'package:elbdesk_core/elbdesk_core.dart';

/// Extension to get the display name of a AppTheme
extension AppThemeDisplayNameExt on AppTheme {
  String get displayName {
    switch (this) {
      case AppTheme.light:
        return 'ElbDesk Light'.hc;
      case AppTheme.dark:
        return 'ElbDesk Dark'.hc;
      case AppTheme.windows11:
        return 'Albuquerque Dark'.hc;
      case AppTheme.dracula:
        return 'Dracula'.fixed;
      case AppTheme.system:
        return 'System'.fixed;
    }
  }
}
