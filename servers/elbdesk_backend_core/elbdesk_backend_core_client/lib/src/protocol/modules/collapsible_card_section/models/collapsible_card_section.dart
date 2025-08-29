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

abstract class CollapsibleCardSectionConfig implements _i1.SerializableModel {
  CollapsibleCardSectionConfig._({
    this.id,
    required this.configs,
  });

  factory CollapsibleCardSectionConfig({
    int? id,
    required Map<String, bool> configs,
  }) = _CollapsibleCardSectionConfigImpl;

  factory CollapsibleCardSectionConfig.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CollapsibleCardSectionConfig(
      id: jsonSerialization['id'] as int?,
      configs: (jsonSerialization['configs'] as Map).map((k, v) => MapEntry(
            k as String,
            v as bool,
          )),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  Map<String, bool> configs;

  /// Returns a shallow copy of this [CollapsibleCardSectionConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CollapsibleCardSectionConfig copyWith({
    int? id,
    Map<String, bool>? configs,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'configs': configs.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CollapsibleCardSectionConfigImpl extends CollapsibleCardSectionConfig {
  _CollapsibleCardSectionConfigImpl({
    int? id,
    required Map<String, bool> configs,
  }) : super._(
          id: id,
          configs: configs,
        );

  /// Returns a shallow copy of this [CollapsibleCardSectionConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CollapsibleCardSectionConfig copyWith({
    Object? id = _Undefined,
    Map<String, bool>? configs,
  }) {
    return CollapsibleCardSectionConfig(
      id: id is int? ? id : this.id,
      configs: configs ??
          this.configs.map((
                key0,
                value0,
              ) =>
                  MapEntry(
                    key0,
                    value0,
                  )),
    );
  }
}
