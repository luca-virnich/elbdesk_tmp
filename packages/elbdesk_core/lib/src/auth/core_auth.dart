import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

part 'core_auth.g.dart';

late SessionManager sessionManager;

@riverpod
class AuthUserState extends _$AuthUserState {
  @override
  UserInfo? build() {
    sessionManager.addListener(ref.invalidateSelf);

    final user = sessionManager.signedInUser;

    return user;
  }

  /// Updates the user state with the new user information
  void updateUserInfo(UserInfo? user) {
    state = user;
  }
}
