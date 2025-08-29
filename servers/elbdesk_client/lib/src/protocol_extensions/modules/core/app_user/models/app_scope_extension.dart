import 'package:elbdesk_client/elbdesk_client.dart';

extension AppScopeExtension on AppScope {
  // Scope get scope => Scope(name);

  /// Returns the read scope
  String get read => '$name.read';

  /// Returns the write scope
  String get write => '$name.write';

  /// Returns the delete scope
  String get delete => '$name.delete';

  /// Returns the read and write scopes
  List<String> get rw => [read, write];

  /// Returns the read, write and delete scopes
  List<String> get rwd => [read, write, delete];
}

extension AppScopeListExtension on List<AppScope> {
  List<String> get read => map((scope) => scope.read).toList();
  List<String> get write => map((scope) => scope.write).toList();
  List<String> get delete => map((scope) => scope.delete).toList();
  List<String> get rw => expand((scope) => scope.rw).toList();
  List<String> get rwd => expand((scope) => scope.rwd).toList();
}
