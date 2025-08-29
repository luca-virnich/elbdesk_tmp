// Barrel file for all floating window providers
//
// ⚠️ INTERNAL USE ONLY ⚠️
// These providers are implementation details of the window manager.
// External packages should use the WindowManager API via windowManagerProvider.
// See ARCHITECTURE.md for more information.

export 'management/open_windows_provider.dart';
export 'management/window_focus_provider.dart';
// Management providers - Core window management functionality
export 'management/window_manager_provider.dart';
export 'management/window_z_order_provider.dart';
export 'management/windows_list_provider.dart';
// State providers - Window state management
export 'state/floating_window_is_maximized_state.dart';
export 'state/floating_window_is_minimized_state.dart';
export 'state/floating_window_title_state.dart';
export 'state/minimized_window_positions_provider.dart';
export 'state/window_position_provider.dart';
// UI State providers - UI-specific state management
export 'ui_state/allow_windows_outside_view_provider.dart';
export 'ui_state/background_window_overlay_color_provider.dart';
export 'ui_state/dragging_window_id_provider.dart';
export 'ui_state/edge_snap_preview_provider.dart';
export 'ui_state/minimize_animation_provider.dart';
export 'ui_state/minimize_requests_provider.dart';
export 'ui_state/show_titlebar_base_title_provider.dart';
export 'ui_state/snapshot_request_provider.dart';
export 'ui_state/taskbar_tile_positions_provider.dart';
export 'ui_state/window_highlight_provider.dart';
export 'ui_state/window_snapshot_provider.dart';
