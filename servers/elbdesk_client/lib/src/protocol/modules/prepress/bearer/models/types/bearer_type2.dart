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

abstract class BearerType2DTO implements _i1.SerializableModel {
  BearerType2DTO._({
    this.id,
    required this.minWidth,
    required this.minHeight,
  });

  factory BearerType2DTO({
    int? id,
    required double minWidth,
    required double minHeight,
  }) = _BearerType2DTOImpl;

  factory BearerType2DTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return BearerType2DTO(
      id: jsonSerialization['id'] as int?,
      minWidth: (jsonSerialization['minWidth'] as num).toDouble(),
      minHeight: (jsonSerialization['minHeight'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  double minWidth;

  double minHeight;

  /// Returns a shallow copy of this [BearerType2DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerType2DTO copyWith({
    int? id,
    double? minWidth,
    double? minHeight,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'minWidth': minWidth,
      'minHeight': minHeight,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerType2DTOImpl extends BearerType2DTO {
  _BearerType2DTOImpl({
    int? id,
    required double minWidth,
    required double minHeight,
  }) : super._(
          id: id,
          minWidth: minWidth,
          minHeight: minHeight,
        );

  /// Returns a shallow copy of this [BearerType2DTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerType2DTO copyWith({
    Object? id = _Undefined,
    double? minWidth,
    double? minHeight,
  }) {
    return BearerType2DTO(
      id: id is int? ? id : this.id,
      minWidth: minWidth ?? this.minWidth,
      minHeight: minHeight ?? this.minHeight,
    );
  }
}
