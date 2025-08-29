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

enum ElbExceptionType implements _i1.SerializableModel {
  unauthorized,
  forbidden,
  conflict,
  notFound,
  fileOperationException,
  validationFieldError,
  validationFormError,
  unknown;

  static ElbExceptionType fromJson(String name) {
    switch (name) {
      case 'unauthorized':
        return ElbExceptionType.unauthorized;
      case 'forbidden':
        return ElbExceptionType.forbidden;
      case 'conflict':
        return ElbExceptionType.conflict;
      case 'notFound':
        return ElbExceptionType.notFound;
      case 'fileOperationException':
        return ElbExceptionType.fileOperationException;
      case 'validationFieldError':
        return ElbExceptionType.validationFieldError;
      case 'validationFormError':
        return ElbExceptionType.validationFormError;
      case 'unknown':
        return ElbExceptionType.unknown;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ElbExceptionType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
