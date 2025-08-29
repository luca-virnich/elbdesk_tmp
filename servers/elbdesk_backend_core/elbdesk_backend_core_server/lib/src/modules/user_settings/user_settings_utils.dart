import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';

class UserSettingsUtils {
  static UserSettingsDTO initial({
    required int userId,
  }) {
    return UserSettingsDTO(
      userId: userId,
      appTheme: AppTheme.system,
      appLocale: AppLocale.de,
      inactiveFloatingOverlayColor: '14000000',
      inactiveFloatingOverlaySavedColors: ['1E002800'],
      reduceMotion: false,
      showTooltips: true,
      enableTablePrefix: true,
      dragWindowOutOfMainWindow: true,
      defaultCollapseCardSections: false,
      collapseCardSection: {},
      recentWindowFilterValues: {},
      ribbonConfigs: {},
    );
  }
}
