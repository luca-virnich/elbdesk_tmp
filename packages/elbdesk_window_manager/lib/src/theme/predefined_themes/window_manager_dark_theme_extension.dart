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

/// Predefined dark theme extension for WindowManager
class WindowManagerDarkThemeExtension {
  static WindowManagerThemeExtension get theme => WindowManagerThemeExtension(
        globalBackgroundColor: const Color(0xff0d1117),
        navigationBackgroundColor: const Color(0xff212831),
        contentBackgroundColor: const Color(0xff0d1117),
        
        taskbar: TaskbarThemeData(
          borderColor: const Color(0xFF3F3F46),
          height: 56.0,
          iconColor: const Color(0xFFBEBEBE),
          iconActiveColor: const Color(0xff4493f8),
          iconDisabledColor: const Color(0xFF6B6B6B),
          iconHoverColor: const Color(0xFFFFFFFF),
          minimizeAllIconColor: const Color(0xFFE5E5E5),
          minimizeAllIconDisabledColor: const Color(0xFF6B6B6B),
          restoreAllIconColor: const Color(0xFFE5E5E5),
          restoreAllIconDisabledColor: const Color(0xFF6B6B6B),
          overviewIconColor: const Color(0xFFE5E5E5),
          overviewIconActiveColor: const Color(0xFF60CDFF),
          overviewIconDisabledColor: const Color(0xFF6B6B6B),
          chevronIconColor: const Color(0xFFE5E5E5),
          chevronIconDisabledColor: const Color(0xFF6B6B6B),
          textColor: const Color(0xFFBEBEBE),
          textActiveColor: const Color(0xFFE5E5E5),
          textDisabledColor: const Color(0xFF6B6B6B),
          tileBackgroundColor: Colors.transparent,
          tileActiveBackgroundColor: const Color(0xFFffffff).withValues(alpha: 0.08),
          tileHoverBackgroundColor: const Color(0xFFffffff).withValues(alpha: 0.08),
          tileHighlightColor: const Color(0xFFFFB74D),
          tileMinimizedOpacity: 0.6,
          chevronBackgroundGradient: const LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF0C0C0C),
              Color(0x000C0C0C),
            ],
          ),
          iconButtonHoverBackgroundColor: const Color(0xFF2D2D30),
          iconButtonBorderRadius: 4.0,
        ),
        
        sideNavigation: SideNavigationThemeData(
          selectedBackgroundColor: const Color(0xFF2D2D3F),
          selectedBorderColor: const Color(0xFF60CDFF),
          iconColor: const Color(0xFFCCCCCC),
          selectedIconColor: const Color(0xFF60CDFF),
          textColor: const Color(0xFFBEBEBE),
          selectedTextColor: const Color(0xFFE5E5E5),
          sectionTextColor: const Color(0xFF999999),
          dividerColor: const Color(0xFF404040),
          hoverColor: const Color(0xFFffffff).withValues(alpha: 0.08),
          expandCollapseButtonColor: const Color(0xFFCCCCCC),
          itemBorderRadius: 4.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          expandedWidth: 250,
          collapsedWidth: 80,
          selectedColor: const Color(0xFF60CDFF),
          headerTextColor: const Color(0xFFFFFFFF),
        ),
        
        mobileBottomBar: MobileBottomBarThemeData(
          borderColor: const Color(0xFF3F3F46),
          iconColor: const Color(0xFFE5E5E5),
          activeIconColor: const Color(0xFF60CDFF),
          disabledIconColor: const Color(0xFF6B6B6B),
          textColor: const Color(0xFFE5E5E5),
          activeTextColor: const Color(0xFF60CDFF),
          disabledTextColor: const Color(0xFF6B6B6B),
          badgeBackgroundColor: const Color(0xFFE81123),
          badgeTextColor: const Color(0xFFFFFFFF),
          shadowColor: const Color(0xFF0C0C0C),
        ),
        
        window: WindowThemeData(
          backgroundColor: const Color(0xff0d1117),
          borderColor: const Color(0xFF3F3F46),
          borderWidth: 1.0,
          borderRadius: 8.0,
          shadowColor: const Color(0xFF000000),
          shadowBlurRadius: 20.0,
          shadowOffset: const Offset(0, 8),
          resizeHandleColor: const Color(0xFF4A9CC4),
          resizeHandleHoverColor: const Color(0xFF60CDFF),
          resizeHandleSize: 12.0,
        ),
        
        windowTitleBar: WindowTitleBarThemeData(
          height: 32.0,
          backgroundColor: const Color(0xff35404F),
          textColor: const Color(0xFFD4D4D4),
          iconColor: const Color(0xFFD4D4D4),
          windowsControlButtonBackgroundColor: Colors.transparent,
          windowsControlButtonHoverBackgroundColor: const Color(0xFF2D2D3F),
          windowsControlButtonIconColor: const Color(0xFFD4D4D4),
          windowsCloseButtonHoverBackgroundColor: const Color(0xFFE81123),
          windowsCloseButtonHoverIconColor: const Color(0xFFFFFFFF),
          macOSCloseButtonColor: const Color(0xFFFF5F57),
          macOSCloseButtonHoverColor: const Color(0xFFE0443E),
          macOSMinimizeButtonColor: const Color(0xFFFFBD2E),
          macOSMinimizeButtonHoverColor: const Color(0xFFDEA123),
          macOSMaximizeButtonColor: const Color(0xFF28CA42),
          macOSMaximizeButtonHoverColor: const Color(0xFF1AAB29),
          macOSButtonDisabledColor: const Color(0xFF4B4B4B),
          macOSCloseButtonIconColor: const Color(0xFF5C0000),
          macOSCloseButtonHoverIconColor: const Color(0xFFFFFFFF),
          macOSMinimizeButtonIconColor: const Color(0xFF995700),
          macOSMinimizeButtonHoverIconColor: const Color(0xFFFFFFFF),
          macOSMaximizeButtonIconColor: const Color(0xFF006500),
          macOSMaximizeButtonHoverIconColor: const Color(0xFFFFFFFF),
        ),
        
        windowManagement: WindowManagementThemeData(
          snapPreviewColor: const Color(0xFF4493f8),
          snapPreviewBorderColor: const Color(0xFF4493f8),
          snapPreviewBorderWidth: 2.0,
          snapPreviewOpacity: 0.3,
          snapOverlayBackgroundColor: const Color(0xFF1a1f29),
          snapOverlayBorderColor: const Color(0xFF30363d),
          snapOverlayShadowColor: const Color(0xFF000000),
          snapOverlayBorderRadius: 8.0,
          snapLayoutBackgroundColor: const Color(0xFF0d1117),
          snapLayoutBorderColor: const Color(0xFF30363d),
          snapLayoutSegmentColor: const Color(0xFF161b22),
          snapLayoutSegmentHoverColor: const Color(0xFF4493f8).withValues(alpha: 0.3),
          snapLayoutSegmentBorderColor: const Color(0xFF30363d),
          snapLayoutSegmentHoverBorderColor: const Color(0xFF4493f8),
          snapLayoutSegmentBorderWidth: 1.0,
        ),
        
        windowOverview: WindowOverviewThemeData(
          backgroundColor: const Color(0xFF0F0F17).withValues(alpha: 0.92),
          overlayColor: const Color(0xFF0C0C0C).withValues(alpha: 0.55),
          tileBackgroundColor: const Color(0xFF1E1E2E),
          tileActiveBorderColor: const Color(0xFF60CDFF),
          tileTitleBarBackgroundColor: const Color(0xFF191825),
          tileTitleBarActiveBackgroundColor: const Color(0xFF2D2D3F),
          tileTitleTextColor: const Color(0xFFE5E5E5),
          tileTitleActiveTextColor: const Color(0xFFFFFFFF),
          tilePreviewTextColor: const Color(0xFF999999),
          tileShadowColor: const Color(0xFF0C0C0C),
          tileBorderRadius: 8.0,
        ),
        
        statusBar: StatusBarThemeData(
          height: 24.0,
          backgroundColor: const Color(0xff4493f8),
        ),
      );
}