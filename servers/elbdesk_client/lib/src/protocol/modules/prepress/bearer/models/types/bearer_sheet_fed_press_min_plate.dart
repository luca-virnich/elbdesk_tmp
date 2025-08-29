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

abstract class BearerTypeSheetFedPressMinPlateDTO
    implements _i1.SerializableModel {
  BearerTypeSheetFedPressMinPlateDTO._({
    this.id,
    this.machineControlFile,
    this.rasterFieldType,
    this.registrationMarkType,
    required this.atsType,
  });

  factory BearerTypeSheetFedPressMinPlateDTO({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
    required String atsType,
  }) = _BearerTypeSheetFedPressMinPlateDTOImpl;

  factory BearerTypeSheetFedPressMinPlateDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerTypeSheetFedPressMinPlateDTO(
      id: jsonSerialization['id'] as int?,
      machineControlFile: jsonSerialization['machineControlFile'] as String?,
      rasterFieldType: jsonSerialization['rasterFieldType'] as String?,
      registrationMarkType:
          jsonSerialization['registrationMarkType'] as String?,
      atsType: jsonSerialization['atsType'] as String,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String? machineControlFile;

  String? rasterFieldType;

  String? registrationMarkType;

  String atsType;

  /// Returns a shallow copy of this [BearerTypeSheetFedPressMinPlateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerTypeSheetFedPressMinPlateDTO copyWith({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
    String? atsType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (machineControlFile != null) 'machineControlFile': machineControlFile,
      if (rasterFieldType != null) 'rasterFieldType': rasterFieldType,
      if (registrationMarkType != null)
        'registrationMarkType': registrationMarkType,
      'atsType': atsType,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerTypeSheetFedPressMinPlateDTOImpl
    extends BearerTypeSheetFedPressMinPlateDTO {
  _BearerTypeSheetFedPressMinPlateDTOImpl({
    int? id,
    String? machineControlFile,
    String? rasterFieldType,
    String? registrationMarkType,
    required String atsType,
  }) : super._(
          id: id,
          machineControlFile: machineControlFile,
          rasterFieldType: rasterFieldType,
          registrationMarkType: registrationMarkType,
          atsType: atsType,
        );

  /// Returns a shallow copy of this [BearerTypeSheetFedPressMinPlateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerTypeSheetFedPressMinPlateDTO copyWith({
    Object? id = _Undefined,
    Object? machineControlFile = _Undefined,
    Object? rasterFieldType = _Undefined,
    Object? registrationMarkType = _Undefined,
    String? atsType,
  }) {
    return BearerTypeSheetFedPressMinPlateDTO(
      id: id is int? ? id : this.id,
      machineControlFile: machineControlFile is String?
          ? machineControlFile
          : this.machineControlFile,
      rasterFieldType:
          rasterFieldType is String? ? rasterFieldType : this.rasterFieldType,
      registrationMarkType: registrationMarkType is String?
          ? registrationMarkType
          : this.registrationMarkType,
      atsType: atsType ?? this.atsType,
    );
  }
}
