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

abstract class BearerType1DTO implements _i1.SerializableModel {
  BearerType1DTO._({
    this.id,
    required this.marginLeft,
    required this.marginRight,
  });

  factory BearerType1DTO({
    int? id,
    required double marginLeft,
    required double marginRight,
  }) = _BearerType1DTOImpl;

  factory BearerType1DTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return BearerType1DTO(
      id: jsonSerialization['id'] as int?,
      marginLeft: (jsonSerialization['marginLeft'] as num).toDouble(),
      marginRight: (jsonSerialization['marginRight'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  double marginLeft;

  double marginRight;

  /// Returns a shallow copy of this [BearerType1DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerType1DTO copyWith({
    int? id,
    double? marginLeft,
    double? marginRight,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'marginLeft': marginLeft,
      'marginRight': marginRight,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerType1DTOImpl extends BearerType1DTO {
  _BearerType1DTOImpl({
    int? id,
    required double marginLeft,
    required double marginRight,
  }) : super._(
          id: id,
          marginLeft: marginLeft,
          marginRight: marginRight,
        );

  /// Returns a shallow copy of this [BearerType1DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerType1DTO copyWith({
    Object? id = _Undefined,
    double? marginLeft,
    double? marginRight,
  }) {
    return BearerType1DTO(
      id: id is int? ? id : this.id,
      marginLeft: marginLeft ?? this.marginLeft,
      marginRight: marginRight ?? this.marginRight,
    );
  }
}
