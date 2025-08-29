import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/models/app_user.dart';
import 'package:project_core/src/app_user/models/user_info_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

part 'auth_provider.g.dart';

/// The state of the current logged in user from serverpod (Serverpod build-in
/// UserInfo model)

@riverpod
class CurrentAppUserState extends _$CurrentAppUserState {
  @override
  Future<AppUser> build() async {
    ref.listen(watchAppUserUpdatesProvider, (previous, next) {
      if (next is AsyncData<AppUser>) {
        handleUserUpdate(next.value);
      }
    });
    final user = await serverpodClient.appUserSelf.fetchSelf();
    return AppUser.fromDTO(user);
  }

  Future<void> handleUserUpdate(AppUser user) async {
    await future;
    state = AsyncData(user);
  }
}

/// Is Admin Provider
///
/// This indicates if the current user is an admin
@riverpod
bool isAdmin(Ref ref) {
  final user = ref.watch(
    currentAppUserStateProvider.select((value) => value.requireValue.userInfo),
  );

  final isAdmin = user.hasPermissions(AppScope.admin.rwd.toSet());

  return isAdmin;
}

/// Is CRM Admin Provider
///
/// This indicates if the current user is a CRM admin with access to
/// CRM resources and customer-specific data
@riverpod
bool isCrmAdmin(Ref ref) {
  final user = ref.watch(
    currentAppUserStateProvider.select((value) => value.requireValue.userInfo),
  );

  return user.hasPermissions(AppScope.crmAdmin.rwd.toSet());
}

/// Is MOP Admin Provider
///
/// This indicates if the current user is a Prepress admin with access to
/// prepress resources and artwork-related data
@riverpod
bool isMopAdmin(Ref ref) {
  final user = ref.watch(
    currentAppUserStateProvider.select((value) => value.requireValue.userInfo),
  );

  return user.hasPermissions(AppScope.mopAdmin.rwd.toSet());
}

/// Is super admin provider
///
/// Checks if the current user is a super admin
@riverpod
bool isSuperAdmin(Ref ref) {
  final user = ref.watch(
    authUserStateProvider,
  );

  if (user == null) return false;

  final isSuperAdmin = user.hasPermissions(AppScope.superAdmin.rwd.toSet());

  return isSuperAdmin;
}

/// The authentication provider
@riverpod
Auth auth(Ref ref) {
  ref.keepAlive();
  final emailAuth = EmailAuthController(serverpodClient.modules.auth);
  return Auth(emailAuth: emailAuth);
}

/// The authentication class
class Auth {
  /// @nodoc
  Auth({required this.emailAuth});

  /// The email authentication controller
  final EmailAuthController emailAuth;

  /// Signs in the user with the given email and password.
  Future<bool> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userInfo = await emailAuth.signIn(email, password);
    return userInfo == null;
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    await sessionManager.signOutDevice();
  }

  /// Trigger a password reset email to be sent to the entered email address.
  Future<void> sendPasswordResetMail(String email) async {
    await emailAuth.initiatePasswordReset(email);
  }

  /// Returns false if the reset does not succeed.
  // TODO(tk): handle errors better (validation code and password reset)
  Future<bool> validateAndResetPassword(
    String email,
    String code,
    String password,
    ElbCoreLocalizations l10n,
  ) async {
    final userInfo = await emailAuth.resetPassword(email, code, password);
    debugPrint('from validateAccount: $userInfo');

    // it seems that you can login with a random password after validating
    // the account ?!
    final userInfo2 = await emailAuth.signIn(email, password);
    if (userInfo2 == null) {
      throw ElbException(
        exceptionType: ElbExceptionType.unauthorized,
        message: l10n.auth_wrong_code,
      );
    }
    return true;
  }
}

@riverpod
Stream<AppUser> watchAppUserUpdates(
  Ref ref,
) async* {
  final streamHelper = ServerpodStreamManager<AppUser, AppUserDTO>();
  yield* streamHelper.setupStream(
    ref: ref,
    startListening: () => serverpodClient.appUserSelf.watchSelf(),
    convertDtoToModel: AppUser.fromDTO,
  );
}
