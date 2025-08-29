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
import '../../../modules/core/spotlight/spotlight_type.dart' as _i2;

abstract class SpotlightItem
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  SpotlightItem._({
    required this.primaryKey,
    required this.title,
    required this.description,
    required this.type,
  });

  factory SpotlightItem({
    required int primaryKey,
    required String title,
    required String description,
    required _i2.SpotlightType type,
  }) = _SpotlightItemImpl;

  factory SpotlightItem.fromJson(Map<String, dynamic> jsonSerialization) {
    return SpotlightItem(
      primaryKey: jsonSerialization['primaryKey'] as int,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      type: _i2.SpotlightType.fromJson((jsonSerialization['type'] as String)),
    );
  }

  int primaryKey;

  String title;

  String description;

  _i2.SpotlightType type;

  /// Returns a shallow copy of this [SpotlightItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SpotlightItem copyWith({
    int? primaryKey,
    String? title,
    String? description,
    _i2.SpotlightType? type,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'primaryKey': primaryKey,
      'title': title,
      'description': description,
      'type': type.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'primaryKey': primaryKey,
      'title': title,
      'description': description,
      'type': type.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SpotlightItemImpl extends SpotlightItem {
  _SpotlightItemImpl({
    required int primaryKey,
    required String title,
    required String description,
    required _i2.SpotlightType type,
  }) : super._(
          primaryKey: primaryKey,
          title: title,
          description: description,
          type: type,
        );

  /// Returns a shallow copy of this [SpotlightItem]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SpotlightItem copyWith({
    int? primaryKey,
    String? title,
    String? description,
    _i2.SpotlightType? type,
  }) {
    return SpotlightItem(
      primaryKey: primaryKey ?? this.primaryKey,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
    );
  }
}
