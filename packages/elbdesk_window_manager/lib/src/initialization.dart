import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/window_manager_initialization.dart';
import 'features/floating_windows/services/window_registry.dart';
import 'features/floating_windows/models/floating_window_data.dart';

/// Window registry entry that includes a registration function and optional duplicate check
class WindowRegistryEntry<T extends FloatingWindowData> {
  final Widget Function(BuildContext, T) builder;
  final bool Function(T existingWindow, T newWindow)? duplicateCheck;
  
  WindowRegistryEntry(
    this.builder, {
    this.duplicateCheck,
  });
  
  void register() {
    WindowRegistry.register<T>(builder);
    // Store duplicate check function for this window type
    if (duplicateCheck != null) {
      WindowDuplicateCheckRegistry.register<T>(duplicateCheck!);
    }
  }
}

/// Registry for window duplicate check functions
class WindowDuplicateCheckRegistry {
  static final Map<Type, Function> _duplicateChecks = {};
  
  static void register<T>(bool Function(T, T) check) {
    _duplicateChecks[T] = check;
  }
  
  static Function? get(Type type) {
    return _duplicateChecks[type];
  }
}

/// Initialize the ElbDesk Window Manager package
/// 
/// This function initializes all necessary services for the window manager.
/// 
/// @param windowRegistrations List of window registry entries
/// @param sharedPreferences Optional pre-initialized SharedPreferences instance
/// 
/// Example usage:
/// ```dart
/// await initializeElbDeskWindowManager(
///   windowRegistrations: [
///     WindowRegistryEntry<ContactWindowData>(
///       (context, data) => ContactWindowContent(data: data),
///     ),
///     WindowRegistryEntry<CompanyWindowData>(
///       (context, data) => CompanyWindowContent(data: data),
///     ),
///   ],
///   sharedPreferences: prefs, // optional
/// );
/// ```
Future<void> initializeElbDeskWindowManager({
  required List<WindowRegistryEntry> windowRegistrations,
  SharedPreferences? sharedPreferences,
}) async {
  // Initialize the window manager singleton
  await WindowManagerInitialization.instance.initialize(
    sharedPreferences: sharedPreferences,
  );
  
  // Register all window types
  for (final entry in windowRegistrations) {
    entry.register();
  }
  
  // Add any other package-specific initialization here in the future
  // For example:
  // - Set up default window configurations
  // - Initialize window animation settings
  // - Set up window event handlers
  // - Configure responsive breakpoints
}