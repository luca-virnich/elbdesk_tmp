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

enum FTPIncomingReplyType implements _i1.SerializableModel {
  ftp0,
  ftp1,
  ftp2;

  static FTPIncomingReplyType fromJson(String name) {
    switch (name) {
      case 'ftp0':
        return FTPIncomingReplyType.ftp0;
      case 'ftp1':
        return FTPIncomingReplyType.ftp1;
      case 'ftp2':
        return FTPIncomingReplyType.ftp2;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "FTPIncomingReplyType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
