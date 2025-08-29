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

abstract class LayerInfoDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  LayerInfoDTO._({
    required this.name,
    required this.printable,
    required this.locked,
  });

  factory LayerInfoDTO({
    required String name,
    required bool printable,
    required bool locked,
  }) = _LayerInfoDTOImpl;

  factory LayerInfoDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return LayerInfoDTO(
      name: jsonSerialization['name'] as String,
      printable: jsonSerialization['printable'] as bool,
      locked: jsonSerialization['locked'] as bool,
    );
  }

  String name;

  bool printable;

  bool locked;

  /// Returns a shallow copy of this [LayerInfoDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LayerInfoDTO copyWith({
    String? name,
    bool? printable,
    bool? locked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'printable': printable,
      'locked': locked,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'name': name,
      'printable': printable,
      'locked': locked,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _LayerInfoDTOImpl extends LayerInfoDTO {
  _LayerInfoDTOImpl({
    required String name,
    required bool printable,
    required bool locked,
  }) : super._(
          name: name,
          printable: printable,
          locked: locked,
        );

  /// Returns a shallow copy of this [LayerInfoDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LayerInfoDTO copyWith({
    String? name,
    bool? printable,
    bool? locked,
  }) {
    return LayerInfoDTO(
      name: name ?? this.name,
      printable: printable ?? this.printable,
      locked: locked ?? this.locked,
    );
  }
}
