/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

enum ServerpodLogField implements _i1.SerializableModel {
  id,
  sessionLogId,
  messageId,
  reference,
  serverId,
  time,
  logLevel,
  message,
  error,
  stackTrace;

  static ServerpodLogField fromJson(String name) {
    switch (name) {
      case 'id':
        return ServerpodLogField.id;
      case 'sessionLogId':
        return ServerpodLogField.sessionLogId;
      case 'messageId':
        return ServerpodLogField.messageId;
      case 'reference':
        return ServerpodLogField.reference;
      case 'serverId':
        return ServerpodLogField.serverId;
      case 'time':
        return ServerpodLogField.time;
      case 'logLevel':
        return ServerpodLogField.logLevel;
      case 'message':
        return ServerpodLogField.message;
      case 'error':
        return ServerpodLogField.error;
      case 'stackTrace':
        return ServerpodLogField.stackTrace;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ServerpodLogField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
