/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum FlutterLogField implements _i1.SerializableModel {
  id,
  deviceId,
  userId,
  context,
  exception,
  flutterLibrary,
  stack,
  silent,
  information,
  time,
  platform,
  appVersion,
  buildNumber;

  static FlutterLogField fromJson(String name) {
    switch (name) {
      case 'id':
        return FlutterLogField.id;
      case 'deviceId':
        return FlutterLogField.deviceId;
      case 'userId':
        return FlutterLogField.userId;
      case 'context':
        return FlutterLogField.context;
      case 'exception':
        return FlutterLogField.exception;
      case 'flutterLibrary':
        return FlutterLogField.flutterLibrary;
      case 'stack':
        return FlutterLogField.stack;
      case 'silent':
        return FlutterLogField.silent;
      case 'information':
        return FlutterLogField.information;
      case 'time':
        return FlutterLogField.time;
      case 'platform':
        return FlutterLogField.platform;
      case 'appVersion':
        return FlutterLogField.appVersion;
      case 'buildNumber':
        return FlutterLogField.buildNumber;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "FlutterLogField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
