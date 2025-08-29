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

abstract class UserRibbonConfigDTO implements _i1.SerializableModel {
  UserRibbonConfigDTO._({
    bool? useSmallRibbons,
    bool? hideRibbons,
  })  : useSmallRibbons = useSmallRibbons ?? false,
        hideRibbons = hideRibbons ?? false;

  factory UserRibbonConfigDTO({
    bool? useSmallRibbons,
    bool? hideRibbons,
  }) = _UserRibbonConfigDTOImpl;

  factory UserRibbonConfigDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserRibbonConfigDTO(
      useSmallRibbons: jsonSerialization['useSmallRibbons'] as bool,
      hideRibbons: jsonSerialization['hideRibbons'] as bool,
    );
  }

  bool useSmallRibbons;

  bool hideRibbons;

  /// Returns a shallow copy of this [UserRibbonConfigDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserRibbonConfigDTO copyWith({
    bool? useSmallRibbons,
    bool? hideRibbons,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'useSmallRibbons': useSmallRibbons,
      'hideRibbons': hideRibbons,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserRibbonConfigDTOImpl extends UserRibbonConfigDTO {
  _UserRibbonConfigDTOImpl({
    bool? useSmallRibbons,
    bool? hideRibbons,
  }) : super._(
          useSmallRibbons: useSmallRibbons,
          hideRibbons: hideRibbons,
        );

  /// Returns a shallow copy of this [UserRibbonConfigDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserRibbonConfigDTO copyWith({
    bool? useSmallRibbons,
    bool? hideRibbons,
  }) {
    return UserRibbonConfigDTO(
      useSmallRibbons: useSmallRibbons ?? this.useSmallRibbons,
      hideRibbons: hideRibbons ?? this.hideRibbons,
    );
  }
}
