import 'package:flutter/material.dart';
import '../models/floating_window_data.dart';

/// Registry for mapping window data types to their widget builders
class WindowRegistry {
  static final _builders = <Type, Widget Function(BuildContext, FloatingWindowData)>{};

  /// Register a widget builder for a specific window data type
  static void register<T extends FloatingWindowData>(
    Widget Function(BuildContext, T) builder,
  ) {
    _builders[T] = (context, data) => builder(context, data as T);
  }

  /// Build a widget for the given window data
  static Widget buildWindow(BuildContext context, FloatingWindowData data) {
    final builder = _builders[data.runtimeType];
    
    if (builder == null) {
      // Log error and return fallback widget
      debugPrint('ERROR: No builder registered for window type: ${data.runtimeType}');
      debugPrint('Available builders: ${_builders.keys.join(', ')}');
      
      return _ErrorWindow(
        windowType: data.runtimeType.toString(),
        windowId: data.floatingWindowId,
      );
    }
    
    try {
      return builder.call(context, data);
    } catch (e, stack) {
      // Log error and return error boundary widget
      debugPrint('ERROR: Failed to build window for type ${data.runtimeType}: $e');
      debugPrint('Stack trace: $stack');
      
      return _ErrorWindow(
        windowType: data.runtimeType.toString(),
        windowId: data.floatingWindowId,
        error: e.toString(),
      );
    }
  }

  /// Check if a builder is registered for the given type
  static bool hasBuilder(Type type) {
    return _builders.containsKey(type);
  }

  /// Clear all registered builders (useful for testing)
  static void clear() {
    _builders.clear();
  }
}

/// Error boundary widget shown when window building fails
class _ErrorWindow extends StatelessWidget {
  const _ErrorWindow({
    required this.windowType,
    required this.windowId,
    this.error,
  });

  final String windowType;
  final String windowId;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 48,
                color: Theme.of(context).colorScheme.error,
              ),
              const SizedBox(height: 16),
              Text(
                'Window Error',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'Failed to load window type: $windowType',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              if (error != null) ...[
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    error!,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontFamily: 'monospace',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                'Window ID: $windowId',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}