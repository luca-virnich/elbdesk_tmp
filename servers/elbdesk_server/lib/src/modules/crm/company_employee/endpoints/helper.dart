import 'package:serverpod/serverpod.dart';

/// Generic helper for watch update patterns with filter matching
///
/// This helper provides a reusable pattern for streaming entity updates
/// with automatic filter matching and removal notifications.
class WatchUpdateHelper {
  /// Processes entity updates and determines if they should be
  /// added/updated or removed based on filter criteria and deletion status.
  ///
  /// Returns a record: (removedId, entity)
  /// - If entity matches filter: (null, entity) - add/update in frontend
  /// - If entity doesn't match or deleted: (id, null) - remove from frontend
  ///
  /// Automatically extracts id and deletedAt from entities using
  /// dynamic access
  static Stream<(int?, T?)> processUpdateWithFilter<T>({
    required Session session,
    required Stream<T> updates,
    required Future<T?> Function(Session, int id) matchChecker,
  }) async* {
    await for (final update in updates) {
      // Use dynamic to access standard fields
      final entity = update as dynamic;
      final updateId = entity.id as int?;
      if (updateId == null) continue;

      // Handle deletions - always send removal
      final deletedAt = entity.deletedAt as DateTime?;
      if (deletedAt != null) {
        yield (updateId, null);
        continue;
      }

      // Check if the update matches the filter
      // The matchChecker will return null if entity doesn't match
      final matches = await matchChecker(session, updateId);
      if (matches != null) {
        yield (null, matches);
      } else {
        yield (updateId, null);
      }
    }
  }
}

/// Extension methods for streaming entity updates with filter support
extension StreamFilterExtensions<T> on Stream<T> {
  /// Ultra-simple API for watching entity updates with filter support
  ///
  /// Returns a stream of records: (removedId, entity)
  /// - If entity matches filter: (null, entity) - add/update in frontend  
  /// - If entity doesn't match or deleted: (id, null) - remove from frontend
  ///
  /// Automatically extracts id and deletedAt fields from entities
  ///
  /// Parameters:
  /// - session: The current session
  /// - findByIdWithFilter: Function that returns the entity if it matches
  ///   the filter criteria, or null if it doesn't match
  Stream<(int?, T?)> withFilterUpdates({
    required Session session,
    required Future<T?> Function(Session, int) findByIdWithFilter,
  }) {
    return WatchUpdateHelper.processUpdateWithFilter(
      session: session,
      updates: this,
      matchChecker: findByIdWithFilter,
    );
  }
}
