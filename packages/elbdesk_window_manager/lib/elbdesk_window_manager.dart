// Main window manager widget
// Constants
// l10n
export 'l10n/elb_wm_localizations.dart';
export 'src/core/constants/window_manager_constants.dart';
export 'src/elbdesk_window_manager.dart';
// Window management

export 'src/features/floating_windows/models/floating_window_data.dart';
export 'src/features/floating_windows/models/floating_window_title_data.dart';
// Public API providers
export 'src/features/floating_windows/providers/public_providers.dart';
export 'src/features/floating_windows/providers/state/in_window_keyboard_height.dart';
// Responsive design

export 'src/features/floating_windows/providers/state/safe_area_padding_provider.dart';
export 'src/features/floating_windows/providers/state/view_insets_provider.dart';
export 'src/features/floating_windows/services/window_registry.dart';
export 'src/features/floating_windows/widgets/floating_window_title_bar.dart';
export 'src/features/floating_windows/widgets/window_title_bar.dart';
export 'src/features/mobile/models/mobile_taskbar_item.dart';
export 'src/features/mobile/widgets/mobile_bottom_bar.dart';
// Side Navigation
export 'src/features/side_navigation/widgets/expandable_side_navigation.dart';
// Taskbar
export 'src/features/taskbar/desktop_taskbar.dart';
export 'src/features/window_overview/models/window_preview_type.dart';
// Window Overview

// Initialization function
export 'src/initialization.dart';
// Services
export 'src/services/window_manager_initialization.dart';
// Theming
export 'src/theme/extensions/window_manager_theme_extension.dart';
export 'src/theme/mobile_bottom_bar_theme_data.dart';
export 'src/theme/predefined_themes/predefined_themes.dart';
export 'src/theme/predefined_themes/window_manager_dark_theme_extension.dart';
export 'src/theme/predefined_themes/window_manager_light_theme_extension.dart';
export 'src/theme/side_navigation_theme_data.dart';
export 'src/theme/status_bar_theme_data.dart';
export 'src/theme/taskbar_theme_data.dart';
export 'src/theme/window_management_theme_data.dart';
export 'src/theme/window_manager_theme.dart';
export 'src/theme/window_overview_theme_data.dart';
export 'src/theme/window_theme_data.dart';
export 'src/theme/window_title_bar_theme_data.dart';
