// // Minimal public API for elbdesk_window_manager package
// // This shows what should actually be exported based on real usage

// // Core widget - The main entry point
// export 'src/elbdesk_window_manager.dart';
// // Models - Required for creating windows
// export 'src/features/floating_windows/models/floating_window_data.dart';
// // Window Management API - The main interface
// export 'src/features/floating_windows/providers/public_providers.dart';
// // Window Title Bar - Used for custom window chrome
// export 'src/features/floating_windows/widgets/floating_window_title_bar.dart';
// // Side Navigation - Used directly by apps
// export 'src/features/side_navigation/widgets/expandable_side_navigation.dart';
// // Initialization - Required to set up the package
// export 'src/initialization.dart'
//     show initializeElbDeskWindowManager, WindowRegistryEntry;
// export 'src/theme/extensions/window_manager_theme_extension.dart';
// export 'src/theme/predefined_themes/predefined_themes.dart';
// // Theming - Required for customization
// export 'src/theme/window_manager_theme.dart';

// // Localization - For internationalization


// // Optional: Keep for backward compatibility but mark as deprecated
// // export 'src/features/floating_windows/services/window_registry.dart';  // Use WindowRegistryEntry instead
// // export 'src/features/floating_windows/widgets/floating_window.dart';  // Internal widget