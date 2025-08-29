import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

enum AppScopePermission {
  none,
  read,
  rw,
  rwd;

  String readable(ElbCoreLocalizations l10n) {
    switch (this) {
      case AppScopePermission.none:
        return l10n.app_scope_permission_none;
      case AppScopePermission.read:
        return l10n.app_scope_permission_read;
      case AppScopePermission.rw:
        return l10n.app_scope_permission_rw;
      case AppScopePermission.rwd:
        return l10n.app_scope_permission_rwd;
    }
  }

  List<String> scopePermissions(AppScope scope) {
    switch (this) {
      case AppScopePermission.none:
        return [];
      case AppScopePermission.read:
        return [scope.read];
      case AppScopePermission.rw:
        return scope.rw;
      case AppScopePermission.rwd:
        return scope.rwd;
    }
  }
}
