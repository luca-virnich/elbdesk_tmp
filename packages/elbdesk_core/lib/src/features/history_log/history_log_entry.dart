import 'package:serverpod_auth_client/serverpod_auth_client.dart';

class HistoryLogEntry {
  HistoryLogEntry({
    required this.oldValue,
    required this.newValue,
    required this.field,
    required this.editingSince,
    required this.editingBy,
  });
  final String oldValue;
  final String newValue;
  final String field;
  final DateTime editingSince;
  final UserInfo editingBy;
}
