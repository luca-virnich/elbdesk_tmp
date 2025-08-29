import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'
    show BuildContext, MediaQuery, Brightness, Color;

import 'platform_web.dart' if (dart.library.io) 'platform_io.dart';

/// Provides comprehensive platform detection utilities for Flutter applications.
///
/// This class offers various methods to detect the current platform, device type,
/// and runtime environment, supporting both native and web platforms.
class ElbDeskPlatformInfo {
  ElbDeskPlatformInfo._();

  /// Returns the user agent string on web platforms, empty string on native.
  static String get _userAgent => getUserAgent();

  /// Returns the number of touch points supported by the device.
  static int get _maxTouchPoints => getMaxTouchPoints();

  /// Checks if the current platform is running on an Apple device.
  ///
  /// Returns true for:
  /// - macOS (native)
  /// - iOS (native)
  /// - iPadOS (native)
  /// - Web browsers on Mac/iPhone/iPad
  ///
  /// This method detects iPads running Safari that identify as desktop browsers
  /// by checking for multi-touch support on macOS user agents.
  static bool get isAppleDevice {
    if (!kIsWeb) {
      return Platform.isMacOS || Platform.isIOS;
    }

    // Web platform detection
    final userAgent = _userAgent;

    // Direct iOS/iPhone detection
    if (userAgent.contains('iphone') || userAgent.contains('ipad')) {
      return true;
    }

    // Mac detection (includes iPads that identify as Mac)
    if (userAgent.contains('mac')) {
      return true;
    }

    return false;
  }

  /// Checks if the current platform is a mobile device (including tablets).
  ///
  /// Returns true for:
  /// - iOS native apps
  /// - Android native apps
  /// - Web browsers on iOS devices (iPhone/iPad)
  /// - Web browsers on Android devices
  ///
  /// This includes tablets like iPads and Android tablets.
  static bool get isMobileDevice {
    if (!kIsWeb) {
      return Platform.isIOS || Platform.isAndroid;
    }

    final userAgent = _userAgent;

    // Check for mobile keywords in user agent
    if (userAgent.contains('mobile') ||
        userAgent.contains('android') ||
        userAgent.contains('iphone')) {
      return true;
    }

    // iPad detection (may not contain 'mobile' keyword)
    if (userAgent.contains('ipad')) {
      return true;
    }

    // Modern iPad detection (iPadOS 13+ identifies as Mac)
    if (userAgent.contains('mac') && _maxTouchPoints > 1) {
      return true;
    }

    return false;
  }

  /// Checks if the current platform is a native mobile app.
  ///
  /// Returns true only for:
  /// - Native iOS apps
  /// - Native Android apps
  ///
  /// Returns false for any web browser, even on mobile devices.
  static bool get isMobileApp {
    return !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  }

  /// Checks if the web platform is running in WebAssembly (WASM) mode.
  ///
  /// Returns true if the Flutter web app is compiled to WebAssembly.
  /// Always returns false on native platforms.
  ///
  /// This detection uses the dart2wasm environment variable that is
  /// set during compilation, which is the most reliable method.
  static bool get isWasm {
    if (!kIsWeb) return false;

    // Check for the dart2wasm environment variable set during compilation
    return const bool.fromEnvironment('dart.tool.dart2wasm');
  }

  /// Checks if the platform is a desktop environment.
  ///
  /// Returns true for:
  /// - macOS (native)
  /// - Windows (native)
  /// - Linux (native)
  /// - Web browsers on desktop devices
  static bool get isDesktop {
    if (!kIsWeb) {
      return Platform.isMacOS || Platform.isWindows || Platform.isLinux;
    }

    // On web, if it's not mobile, it's desktop
    return !isMobileDevice;
  }

  /// Checks if the platform is a desktop native app.
  ///
  /// Returns true only for native desktop applications on:
  /// - macOS
  /// - Windows
  /// - Linux
  static bool get isDesktopApp {
    return !kIsWeb &&
        (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  }

  /// Checks if running on the web platform.
  static bool get isWeb => kIsWeb;

  /// Checks if running on a native platform (not web).
  static bool get isNative => !kIsWeb;

  /// Checks if running on Windows (native only).
  static bool get isWindows => !kIsWeb && Platform.isWindows;

  /// Checks if running on macOS (native only).
  static bool get isMacOS => !kIsWeb && Platform.isMacOS;

  /// Checks if running on Linux (native only).
  static bool get isLinux => !kIsWeb && Platform.isLinux;

  /// Checks if running on iOS (native only).
  static bool get isIOS => !kIsWeb && Platform.isIOS;

  /// Checks if running on Android (native only).
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;

  /// Checks if running on Fuchsia (native only).
  static bool get isFuchsia => !kIsWeb && Platform.isFuchsia;

  /// Checks if the platform supports touch input.
  ///
  /// Returns true for:
  /// - All mobile devices (native and web)
  /// - Desktop devices with touch screens
  static bool get hasTouch {
    if (!kIsWeb) {
      // Native mobile platforms always have touch
      return Platform.isIOS || Platform.isAndroid;
    }

    // On web, check maxTouchPoints
    return _maxTouchPoints > 0;
  }

  /// Checks if running on a tablet device.
  ///
  /// This is a best-effort detection based on:
  /// - iPad detection (including iPadOS that identifies as desktop)
  /// - Android tablets (devices with 'tablet' in user agent or large screens)
  ///
  /// Note: Tablet detection is not 100% accurate, especially for Android.
  static bool get isTablet {
    if (!kIsWeb && Platform.isIOS) {
      // On iOS, we can't distinguish iPad from iPhone in native apps
      // This would require additional native platform channels
      return false;
    }

    if (!kIsWeb && Platform.isAndroid) {
      // On Android native, we can't reliably detect tablets without platform channels
      return false;
    }

    if (kIsWeb) {
      final userAgent = _userAgent;

      // iPad detection
      if (userAgent.contains('ipad')) return true;

      // Modern iPad detection (identifies as Mac with touch)
      if (userAgent.contains('mac') && _maxTouchPoints > 1) {
        return true;
      }

      // Android tablet detection
      if (userAgent.contains('android')) {
        // Explicit tablet mention
        if (userAgent.contains('tablet')) return true;

        // No 'mobile' keyword often indicates tablet
        if (!userAgent.contains('mobile')) return true;
      }
    }

    return false;
  }

  /// Gets a human-readable string describing the current platform.
  ///
  /// Examples:
  /// - "iOS App"
  /// - "Android App"
  /// - "Web on iPhone"
  /// - "macOS App"
  /// - "Web on Windows"
  static String get platformDescription {
    if (kIsWeb) {
      if (isMobileDevice) {
        if (isAppleDevice) {
          if (isTablet) return 'Web on iPad';
          return 'Web on iPhone';
        }
        return 'Web on Android';
      }

      if (isAppleDevice) return 'Web on Mac';

      // Try to detect Windows/Linux from user agent
      if (_userAgent.contains('windows')) return 'Web on Windows';
      if (_userAgent.contains('linux')) return 'Web on Linux';

      return 'Web';
    }

    // Native platforms
    if (Platform.isIOS) return 'iOS App';
    if (Platform.isAndroid) return 'Android App';
    if (Platform.isMacOS) return 'macOS App';
    if (Platform.isWindows) return 'Windows App';
    if (Platform.isLinux) return 'Linux App';
    if (Platform.isFuchsia) return 'Fuchsia App';

    return 'Unknown Platform';
  }

  /// Checks if the platform supports a specific feature.
  ///
  /// Useful for feature detection and progressive enhancement.
  static bool supportsFeature(PlatformFeature feature) {
    switch (feature) {
      case PlatformFeature.camera:
        // Most platforms support camera except some desktop
        return isMobileDevice || isWeb;

      case PlatformFeature.pushNotifications:
        // Native apps and some web browsers
        return isNative || (isWeb && !isTablet);

      case PlatformFeature.biometricAuth:
        // Mobile devices primarily
        return isMobileApp;

      case PlatformFeature.fileSystem:
        // Native platforms have full file system access
        return isNative;

      case PlatformFeature.multiWindow:
        // Desktop platforms support multiple windows
        return isDesktopApp;
    }
  }

  /// Checks if running in a PWA (Progressive Web App).
  ///
  /// Returns true if the web app is installed as a PWA.
  static bool get isPwa {
    if (!kIsWeb) return false;

    // Check if running in standalone mode (common for PWAs)
    final userAgent = _userAgent;
    return userAgent.contains('standalone') || userAgent.contains('minimal-ui');
  }

  /// Checks if the browser is Safari (web only).
  static bool get isSafariBrowser {
    if (!kIsWeb) return false;

    final userAgent = _userAgent;
    return userAgent.contains('safari') &&
        !userAgent.contains('chrome') &&
        !userAgent.contains('android');
  }

  /// Checks if the browser is Chrome (web only).
  static bool get isChromeBrowser {
    if (!kIsWeb) return false;

    final userAgent = _userAgent;
    return userAgent.contains('chrome') && !userAgent.contains('edge');
  }

  /// Checks if the browser is Firefox (web only).
  static bool get isFirefoxBrowser {
    if (!kIsWeb) return false;

    final userAgent = _userAgent;
    return userAgent.contains('firefox');
  }

  /// Checks if the browser is Edge (web only).
  static bool get isEdgeBrowser {
    if (!kIsWeb) return false;

    final userAgent = _userAgent;
    return userAgent.contains('edge') || userAgent.contains('edg/');
  }

  /// Returns the current operating system name.
  ///
  /// On native platforms, returns the actual OS.
  /// On web, attempts to detect the OS from user agent.
  static String get operatingSystem {
    if (!kIsWeb) {
      if (Platform.isIOS) return 'iOS';
      if (Platform.isAndroid) return 'Android';
      if (Platform.isMacOS) return 'macOS';
      if (Platform.isWindows) return 'Windows';
      if (Platform.isLinux) return 'Linux';
      if (Platform.isFuchsia) return 'Fuchsia';
      return 'Unknown';
    }

    // Web platform OS detection
    final userAgent = _userAgent;

    if (userAgent.contains('iphone') || userAgent.contains('ipad')) {
      return 'iOS';
    }
    if (userAgent.contains('android')) return 'Android';
    if (userAgent.contains('mac')) return 'macOS';
    if (userAgent.contains('windows')) return 'Windows';
    if (userAgent.contains('linux')) return 'Linux';

    return 'Unknown';
  }

  /// Checks if the device prefers dark mode.
  ///
  /// Note: This requires using MediaQuery in your Flutter app
  /// and is provided here as a utility reference.
  static bool prefersDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  /// Sets the HTML body background color on web platforms.
  ///
  /// This method accepts a Flutter [Color] object and applies it as the
  /// background color for the HTML body element. This is useful for:
  /// - Matching the web page background with your Flutter app theme
  /// - Preventing white/black flashes during app initialization
  /// - Creating seamless color transitions
  ///
  /// On native platforms, this method does nothing.
  ///
  /// Example:
  /// ```dart
  /// // Set body background to match app theme
  /// ElbDeskPlatformInfo.setWebBodyBackgroundColor(Theme.of(context).scaffoldBackgroundColor);
  ///
  /// // Set a specific color
  /// ElbDeskPlatformInfo.setWebBodyBackgroundColor(Colors.blue);
  /// ```
  static void setWebBodyBackgroundColor(Color color) {
    if (!kIsWeb) return;

    // Convert Flutter Color to CSS color string
    // Format: #RRGGBB (removing alpha channel)
    final r = ((color.r * 255.0).round() & 0xff)
        .toRadixString(16)
        .padLeft(2, '0');
    final g = ((color.g * 255.0).round() & 0xff)
        .toRadixString(16)
        .padLeft(2, '0');
    final b = ((color.b * 255.0).round() & 0xff)
        .toRadixString(16)
        .padLeft(2, '0');
    final colorHex = '#$r$g$b';
    setBodyBackgroundColor(colorHex);
  }

  /// Returns debug information about the current platform.
  ///
  /// Useful for debugging and error reporting.
  static Map<String, dynamic> get debugInfo {
    return {
      'platform': platformDescription,
      'isWeb': isWeb,
      'isNative': isNative,
      'isMobileDevice': isMobileDevice,
      'isMobileApp': isMobileApp,
      'isDesktop': isDesktop,
      'isDesktopApp': isDesktopApp,
      'isAppleDevice': isAppleDevice,
      'isTablet': isTablet,
      'hasTouch': hasTouch,
      'isWasm': isWasm,
      'operatingSystem': operatingSystem,
      if (kIsWeb) 'userAgent': _userAgent,
      if (kIsWeb) 'maxTouchPoints': _maxTouchPoints,
    };
  }
}

/// Platform features that can be checked for availability.
enum PlatformFeature {
  /// Camera access capability
  camera,

  /// Push notifications support
  pushNotifications,

  /// Biometric authentication (Face ID, Touch ID, fingerprint)
  biometricAuth,

  /// Full file system access
  fileSystem,

  /// Multiple window support
  multiWindow,
}

/// Extension to use with BuildContext for convenience
extension PlatformInfoContext on BuildContext {
  /// Quick access to check if dark mode is preferred
  bool get prefersDarkMode => ElbDeskPlatformInfo.prefersDarkMode(this);
}
