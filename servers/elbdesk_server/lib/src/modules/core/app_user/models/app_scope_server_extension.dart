import 'package:elbdesk_server/src/generated/modules/core/app_user/models/app_scope.dart';
import 'package:serverpod/serverpod.dart';

/// App Scope Server Extension
///
/// Extension for the AppScope enum
///
/// Converts the AppScope name to a Scope object
///
extension AppScopeExtension on AppScope {
  // Scope get scope => Scope(name);

  /// Returns the read scope
  Scope get read => Scope('$name.read');

  /// Returns the write scope
  Scope get write => Scope('$name.write');

  /// Returns the delete scope
  Scope get delete => Scope('$name.delete');

  /// Returns the read and write scopes
  Set<Scope> get rw => {read, write};

  /// Returns the read, write and delete scopes
  Set<Scope> get rwd => {read, write, delete};
}

extension AppScopeListExtension on List<AppScope> {
  Set<Scope> get read => map((scope) => scope.read).toSet();
  Set<Scope> get write => map((scope) => scope.write).toSet();
  Set<Scope> get delete => map((scope) => scope.delete).toSet();
  Set<Scope> get rw => expand((scope) => scope.rw).toSet();
  Set<Scope> get rwd => expand((scope) => scope.rwd).toSet();
}

extension ScopeListExtension on Set<Scope> {
  String toReadableString() {
    return map((scope) => scope.name).join(', ');
  }
}
