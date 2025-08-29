import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/app_user/models/app_scope_server_extension.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

class SuperAdminPermissionsRefreshCall extends FutureCall {
  @override
  Future<void> invoke(Session session, _) async {
    // Gives the initial admin rwd permissions on all scopes every time the
    // server starts
    const initialAdminUserId = 1;
    final user = await auth.Users.findUserByUserId(session, initialAdminUserId);
    if (user != null) {
      // session.log(
      //   'Initial admin user ${user.email} found with id $initialAdminUserId',
      // );
      await auth.Users.updateUserScopes(
        session,
        initialAdminUserId,
        AppScope.values.rwd,
      );
    }

    // TODO(kz): create the support for initial user based on the config file
    // option
    // else {
    //   session.log('Initial admin user not found with id $initialAdminUserId');
    // }
  }
}
