import 'package:serverpod_auth_client/serverpod_auth_client.dart';

extension UserInfoExtension on UserInfo {
  void requirePermissions(Set<String> permissions) {
    final missingPermissions = permissions.difference(scopeNames.toSet());

    if (missingPermissions.isNotEmpty) {
      // ! FIXME (kz,tk): whats this
      // throw ElbException(
      //   errorType: ExceptionType.forbidden,
      //   message: 'User does not have required permissions: $missingPermissions',
      //   value: ExceptionValue.noPermissions,
      // );
    }
  }

  bool hasPermissions(Set<String> permissions) {
    final hasPermissions = scopeNames.toSet().containsAll(permissions);
    return hasPermissions;
  }
}
