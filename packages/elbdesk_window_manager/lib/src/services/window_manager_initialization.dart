import 'package:shared_preferences/shared_preferences.dart';

/// Singleton service for window manager initialization
class WindowManagerInitialization {
  WindowManagerInitialization._();

  static final WindowManagerInitialization _instance =
      WindowManagerInitialization._();
  static WindowManagerInitialization get instance => _instance;

  SharedPreferences? _prefs;
  bool _initialized = false;
  int? _currentUserId;
  String? _currentEnvironment;
  double _mobileBreakpoint = 600;

  /// Get the SharedPreferences instance
  SharedPreferences get prefs {
    if (_prefs == null) {
      throw StateError(
        'WindowManagerInitialization not initialized. Call initialize() first.',
      );
    }
    return _prefs!;
  }

  /// Get the preference key prefix for current user and environment
  String get prefix {
    if (_currentUserId == null || _currentEnvironment == null) {
      throw StateError(
        'User ID and environment must be set before accessing preferences.',
      );
    }
    return 'elbdesk_wm_${_currentEnvironment}_${_currentUserId}_';
  }

  /// Check if initialization is complete
  bool get isInitialized => _initialized;

  /// Set current user and environment
  void setUserAndEnvironment(int userId, String environment) {
    _currentUserId = userId;
    _currentEnvironment = environment;
  }

  double get mobileBreakpoint => _mobileBreakpoint;

  void setMobileBreakpoint(double mobileBreakpoint) {
    _mobileBreakpoint = mobileBreakpoint;
  }

  /// Initialize the window manager services
  ///
  /// @param sharedPreferences Optional pre-initialized SharedPreferences instance.
  /// If not provided, will initialize its own instance.
  Future<void> initialize({
    SharedPreferences? sharedPreferences,
  }) async {
    if (_initialized) return;

    // Use provided instance or initialize new one
    _prefs = sharedPreferences ?? await SharedPreferences.getInstance();

    // Add any other initialization logic here in the future

    _initialized = true;
  }

  /// Reset initialization (mainly for testing)
  void reset() {
    _prefs = null;
    _initialized = false;
  }
}
