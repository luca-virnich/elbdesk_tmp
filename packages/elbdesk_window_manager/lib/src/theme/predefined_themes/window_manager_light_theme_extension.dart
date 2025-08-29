import 'package:flutter/material.dart';
import '../extensions/window_manager_theme_extension.dart';
import '../mobile_bottom_bar_theme_data.dart';
import '../side_navigation_theme_data.dart';
import '../status_bar_theme_data.dart';
import '../taskbar_theme_data.dart';
import '../window_management_theme_data.dart';
import '../window_overview_theme_data.dart';
import '../window_theme_data.dart';
import '../window_title_bar_theme_data.dart';

/// Predefined light theme extension for WindowManager
class WindowManagerLightThemeExtension {
  static WindowManagerThemeExtension get theme => WindowManagerThemeExtension(
        globalBackgroundColor: const Color(0xFFF5F5F5),
        navigationBackgroundColor: const Color(0xFFFAFAFA),
        contentBackgroundColor: const Color(0xFFFFFFFF),
        
        taskbar: TaskbarThemeData(
          borderColor: const Color(0xFFE1E4E8),
          height: 56.0,
          iconColor: const Color(0xFF586069),
          iconActiveColor: const Color(0xFF0969DA),
          iconDisabledColor: const Color(0xFFD1D5DA),
          iconHoverColor: const Color(0xFF24292E),
          minimizeAllIconColor: const Color(0xFF586069),
          minimizeAllIconDisabledColor: const Color(0xFFD1D5DA),
          restoreAllIconColor: const Color(0xFF586069),
          restoreAllIconDisabledColor: const Color(0xFFD1D5DA),
          overviewIconColor: const Color(0xFF586069),
          overviewIconActiveColor: const Color(0xFF0969DA),
          overviewIconDisabledColor: const Color(0xFFD1D5DA),
          chevronIconColor: const Color(0xFF586069),
          chevronIconDisabledColor: const Color(0xFFD1D5DA),
          textColor: const Color(0xFF586069),
          textActiveColor: const Color(0xFF24292E),
          textDisabledColor: const Color(0xFFD1D5DA),
          tileBackgroundColor: Colors.transparent,
          tileActiveBackgroundColor: const Color(0xFF000000).withValues(alpha: 0.04),
          tileHoverBackgroundColor: const Color(0xFF000000).withValues(alpha: 0.08),
          tileHighlightColor: const Color(0xFFF57C00),
          tileMinimizedOpacity: 0.5,
          chevronBackgroundGradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFFAFAFA),
              Color(0x00FAFAFA),
            ],
          ),
          iconButtonHoverBackgroundColor: const Color(0xFFF0F0F0),
          iconButtonBorderRadius: 4.0,
        ),
        
        sideNavigation: SideNavigationThemeData(
          selectedBackgroundColor: const Color(0xFFE7F3FF),
          selectedBorderColor: const Color(0xFF0969DA),
          iconColor: const Color(0xFF586069),
          selectedIconColor: const Color(0xFF0969DA),
          textColor: const Color(0xFF586069),
          selectedTextColor: const Color(0xFF0969DA),
          sectionTextColor: const Color(0xFF6E7781),
          dividerColor: const Color(0xFFE1E4E8),
          hoverColor: const Color(0xFF000000).withValues(alpha: 0.04),
          expandCollapseButtonColor: const Color(0xFF586069),
          itemBorderRadius: 4.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          expandedWidth: 250,
          collapsedWidth: 80,
          selectedColor: const Color(0xFF0969DA),
          headerTextColor: const Color(0xFF24292E),
        ),
        
        mobileBottomBar: MobileBottomBarThemeData(
          borderColor: const Color(0xFFE1E4E8),
          iconColor: const Color(0xFF586069),
          activeIconColor: const Color(0xFF0969DA),
          disabledIconColor: const Color(0xFFD1D5DA),
          textColor: const Color(0xFF586069),
          activeTextColor: const Color(0xFF0969DA),
          disabledTextColor: const Color(0xFFD1D5DA),
          badgeBackgroundColor: const Color(0xFFCF222E),
          badgeTextColor: const Color(0xFFFFFFFF),
          shadowColor: const Color(0xFF000000).withValues(alpha: 0.1),
        ),
        
        window: WindowThemeData(
          backgroundColor: const Color(0xFFFFFFFF),
          borderColor: const Color(0xFFE1E4E8),
          borderWidth: 1.0,
          borderRadius: 8.0,
          shadowColor: const Color(0xFF000000).withValues(alpha: 0.15),
          shadowBlurRadius: 16.0,
          shadowOffset: const Offset(0, 4),
          resizeHandleColor: const Color(0xFF0969DA),
          resizeHandleHoverColor: const Color(0xFF218BFF),
          resizeHandleSize: 12.0,
        ),
        
        windowTitleBar: WindowTitleBarThemeData(
          height: 32.0,
          backgroundColor: const Color(0xFFF6F8FA),
          textColor: const Color(0xFF24292E),
          iconColor: const Color(0xFF586069),
          windowsControlButtonBackgroundColor: Colors.transparent,
          windowsControlButtonHoverBackgroundColor: const Color(0xFFE1E4E8),
          windowsControlButtonIconColor: const Color(0xFF586069),
          windowsCloseButtonHoverBackgroundColor: const Color(0xFFCF222E),
          windowsCloseButtonHoverIconColor: const Color(0xFFFFFFFF),
          macOSCloseButtonColor: const Color(0xFFFF5F57),
          macOSCloseButtonHoverColor: const Color(0xFFE0443E),
          macOSMinimizeButtonColor: const Color(0xFFFFBD2E),
          macOSMinimizeButtonHoverColor: const Color(0xFFDEA123),
          macOSMaximizeButtonColor: const Color(0xFF28CA42),
          macOSMaximizeButtonHoverColor: const Color(0xFF1AAB29),
          macOSButtonDisabledColor: const Color(0xFFE1E4E8),
          macOSCloseButtonIconColor: const Color(0xFF5C0000),
          macOSCloseButtonHoverIconColor: const Color(0xFFFFFFFF),
          macOSMinimizeButtonIconColor: const Color(0xFF995700),
          macOSMinimizeButtonHoverIconColor: const Color(0xFFFFFFFF),
          macOSMaximizeButtonIconColor: const Color(0xFF006500),
          macOSMaximizeButtonHoverIconColor: const Color(0xFFFFFFFF),
        ),
        
        windowManagement: WindowManagementThemeData(
          snapPreviewColor: const Color(0xFF0969DA),
          snapPreviewBorderColor: const Color(0xFF0969DA),
          snapPreviewBorderWidth: 2.0,
          snapPreviewOpacity: 0.2,
          snapOverlayBackgroundColor: const Color(0xFFF6F8FA),
          snapOverlayBorderColor: const Color(0xFFE1E4E8),
          snapOverlayShadowColor: const Color(0xFF000000).withValues(alpha: 0.1),
          snapOverlayBorderRadius: 8.0,
          snapLayoutBackgroundColor: const Color(0xFFFFFFFF),
          snapLayoutBorderColor: const Color(0xFFE1E4E8),
          snapLayoutSegmentColor: const Color(0xFFF6F8FA),
          snapLayoutSegmentHoverColor: const Color(0xFF0969DA).withValues(alpha: 0.1),
          snapLayoutSegmentBorderColor: const Color(0xFFE1E4E8),
          snapLayoutSegmentHoverBorderColor: const Color(0xFF0969DA),
          snapLayoutSegmentBorderWidth: 1.0,
        ),
        
        windowOverview: WindowOverviewThemeData(
          backgroundColor: const Color(0xFFF5F5F5).withValues(alpha: 0.95),
          overlayColor: const Color(0xFF000000).withValues(alpha: 0.3),
          tileBackgroundColor: const Color(0xFFFFFFFF),
          tileActiveBorderColor: const Color(0xFF0969DA),
          tileTitleBarBackgroundColor: const Color(0xFFF6F8FA),
          tileTitleBarActiveBackgroundColor: const Color(0xFFE7F3FF),
          tileTitleTextColor: const Color(0xFF24292E),
          tileTitleActiveTextColor: const Color(0xFF0969DA),
          tilePreviewTextColor: const Color(0xFF6E7781),
          tileShadowColor: const Color(0xFF000000).withValues(alpha: 0.1),
          tileBorderRadius: 8.0,
        ),
        
        statusBar: StatusBarThemeData(
          height: 24.0,
          backgroundColor: const Color(0xFF0969DA),
        ),
      );
}