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
import '../../../../modules/prepress/layer/models/artwork_layer_type.dart'
    as _i2;

abstract class ArtworkLayerDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkLayerDTO._({
    this.layerType,
    required this.layerName,
    required this.printable,
    required this.locked,
  });

  factory ArtworkLayerDTO({
    _i2.ArtworkLayerType? layerType,
    required String layerName,
    required bool printable,
    required bool locked,
  }) = _ArtworkLayerDTOImpl;

  factory ArtworkLayerDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkLayerDTO(
      layerType: jsonSerialization['layerType'] == null
          ? null
          : _i2.ArtworkLayerType.fromJson(
              (jsonSerialization['layerType'] as String)),
      layerName: jsonSerialization['layerName'] as String,
      printable: jsonSerialization['printable'] as bool,
      locked: jsonSerialization['locked'] as bool,
    );
  }

  _i2.ArtworkLayerType? layerType;

  String layerName;

  bool printable;

  bool locked;

  /// Returns a shallow copy of this [ArtworkLayerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkLayerDTO copyWith({
    _i2.ArtworkLayerType? layerType,
    String? layerName,
    bool? printable,
    bool? locked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (layerType != null) 'layerType': layerType?.toJson(),
      'layerName': layerName,
      'printable': printable,
      'locked': locked,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (layerType != null) 'layerType': layerType?.toJson(),
      'layerName': layerName,
      'printable': printable,
      'locked': locked,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkLayerDTOImpl extends ArtworkLayerDTO {
  _ArtworkLayerDTOImpl({
    _i2.ArtworkLayerType? layerType,
    required String layerName,
    required bool printable,
    required bool locked,
  }) : super._(
          layerType: layerType,
          layerName: layerName,
          printable: printable,
          locked: locked,
        );

  /// Returns a shallow copy of this [ArtworkLayerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkLayerDTO copyWith({
    Object? layerType = _Undefined,
    String? layerName,
    bool? printable,
    bool? locked,
  }) {
    return ArtworkLayerDTO(
      layerType:
          layerType is _i2.ArtworkLayerType? ? layerType : this.layerType,
      layerName: layerName ?? this.layerName,
      printable: printable ?? this.printable,
      locked: locked ?? this.locked,
    );
  }
}
