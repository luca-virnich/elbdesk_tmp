import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../services/window_manager_initialization.dart';

/// Service to manage window preferences (size and position)
class WindowPreferences {
  static const String _sizePrefix = 'window_size_';
  static const String _positionPrefix = 'window_position_';
  
  /// Save window configuration (size and position) for a specific window type
  static void saveWindowConfig(String windowType, {Size? size, Offset? position}) {
    final instance = WindowManagerInitialization.instance;
    final prefs = instance.prefs;
    final prefix = instance.prefix;
    
    if (size != null) {
      final sizeKey = '$prefix$_sizePrefix$windowType';
      final sizeData = {
        'width': size.width,
        'height': size.height,
      };
      prefs.setString(sizeKey, jsonEncode(sizeData));
    }
    
    if (position != null) {
      final positionKey = '$prefix$_positionPrefix$windowType';
      final positionData = {
        'x': position.dx,
        'y': position.dy,
      };
      prefs.setString(positionKey, jsonEncode(positionData));
    }
  }
  
  /// Load window configuration for a specific window type
  static ({Size? size, Offset? position}) loadWindowConfig(String windowType) {
    final instance = WindowManagerInitialization.instance;
    final prefs = instance.prefs;
    final prefix = instance.prefix;
    
    // Load size
    Size? size;
    final sizeKey = '$prefix$_sizePrefix$windowType';
    final sizeJson = prefs.getString(sizeKey);
    if (sizeJson != null) {
      try {
        final sizeData = jsonDecode(sizeJson) as Map<String, dynamic>;
        size = Size(
          (sizeData['width'] as num).toDouble(),
          (sizeData['height'] as num).toDouble(),
        );
      } catch (e) {
        // If parsing fails, ignore
      }
    }
    
    // Load position
    Offset? position;
    final positionKey = '$prefix$_positionPrefix$windowType';
    final positionJson = prefs.getString(positionKey);
    if (positionJson != null) {
      try {
        final positionData = jsonDecode(positionJson) as Map<String, dynamic>;
        position = Offset(
          (positionData['x'] as num).toDouble(),
          (positionData['y'] as num).toDouble(),
        );
      } catch (e) {
        // If parsing fails, ignore
      }
    }
    
    return (size: size, position: position);
  }
  
  /// Clear saved configuration for a specific window type
  static void clearWindowConfig(String windowType) {
    final instance = WindowManagerInitialization.instance;
    final prefs = instance.prefs;
    final prefix = instance.prefix;
    prefs.remove('$prefix$_sizePrefix$windowType');
    prefs.remove('$prefix$_positionPrefix$windowType');
  }
  
  /// Clear all saved window configurations
  static void clearAllWindowConfigs() {
    final instance = WindowManagerInitialization.instance;
    final prefs = instance.prefs;
    final prefix = instance.prefix;
    final keys = prefs.getKeys()
        .where((key) => key.startsWith('$prefix$_sizePrefix') || key.startsWith('$prefix$_positionPrefix'))
        .toList();
    
    for (final key in keys) {
      prefs.remove(key);
    }
  }
}