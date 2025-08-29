import 'package:collection/collection.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class CoreUtils {
  const CoreUtils._();

  /// Returns the current timestamp and userId from the session
  static Future<({DateTime now, int userId})> getCurrentTimeAndUser(
    Session session,
  ) async {
    final userId = await getCurrentUserId(session);
    return (
      now: DateTime.now(),
      userId: userId,
    );
  }

  /// Returns the current userId from the session
  static Future<int> getCurrentUserId(Session session) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) {
      throw Exception();
    }
    return userId;
  }

  static Future<UserInfo?> getCurrentUserInfo(Session session) async {
    final userId = await getCurrentUserId(session);
    final user = await Users.findUserByUserId(session, userId);
    return user;
  }

  static Future<void> requirePermissions(
    Session session, {
    required Set<Scope> permissions,
  }) async {
    final userInfo = await getCurrentUserInfo(session);
    final missingPermissions = permissions.difference(userInfo!.scopes);

    if (missingPermissions.isNotEmpty) {
      throw Exception();
    }
  }

  static Future<bool> hasPermissions(
    Session session, {
    required Set<Scope> permissions,
  }) async {
    final userInfo = await getCurrentUserInfo(session);
    final hasPermissions = userInfo!.scopes.containsAll(permissions);
    return hasPermissions;
  }

  static T? enumFromString<T>(List<T> values, String? value) {
    if (value == null) return null;
    try {
      return values.firstWhereOrNull(
        (e) => e.toString().split('.').last == value,
      );
    } catch (e) {
      return null;
    }
  }
}
