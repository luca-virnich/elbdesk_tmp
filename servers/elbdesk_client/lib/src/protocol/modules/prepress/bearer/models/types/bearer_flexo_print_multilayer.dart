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

abstract class BearerTypeFlexoPrintMultilayerDTO
    implements _i1.SerializableModel {
  BearerTypeFlexoPrintMultilayerDTO._({
    this.id,
    this.machineControlFile,
  });

  factory BearerTypeFlexoPrintMultilayerDTO({
    int? id,
    String? machineControlFile,
  }) = _BearerTypeFlexoPrintMultilayerDTOImpl;

  factory BearerTypeFlexoPrintMultilayerDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerTypeFlexoPrintMultilayerDTO(
      id: jsonSerialization['id'] as int?,
      machineControlFile: jsonSerialization['machineControlFile'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? machineControlFile;

  /// Returns a shallow copy of this [BearerTypeFlexoPrintMultilayerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerTypeFlexoPrintMultilayerDTO copyWith({
    int? id,
    String? machineControlFile,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (machineControlFile != null) 'machineControlFile': machineControlFile,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerTypeFlexoPrintMultilayerDTOImpl
    extends BearerTypeFlexoPrintMultilayerDTO {
  _BearerTypeFlexoPrintMultilayerDTOImpl({
    int? id,
    String? machineControlFile,
  }) : super._(
          id: id,
          machineControlFile: machineControlFile,
        );

  /// Returns a shallow copy of this [BearerTypeFlexoPrintMultilayerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerTypeFlexoPrintMultilayerDTO copyWith({
    Object? id = _Undefined,
    Object? machineControlFile = _Undefined,
  }) {
    return BearerTypeFlexoPrintMultilayerDTO(
      id: id is int? ? id : this.id,
      machineControlFile: machineControlFile is String?
          ? machineControlFile
          : this.machineControlFile,
    );
  }
}
