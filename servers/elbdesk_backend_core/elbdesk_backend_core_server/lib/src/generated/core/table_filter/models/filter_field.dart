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
import '../../../core/table_filter/models/filter_type.dart' as _i2;
import '../../../core/table_filter/models/filter_operator.dart' as _i3;
import '../../../core/table_filter/models/filter_field_type.dart' as _i4;

abstract class FilterField
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  FilterField._({
    required this.fieldKey,
    required this.value,
    required this.type,
    required this.filterOperator,
    required this.uuid,
    required this.fieldType,
  });

  factory FilterField({
    required String fieldKey,
    required String value,
    required _i2.FilterType type,
    required _i3.FilterOperator filterOperator,
    required String uuid,
    required _i4.FilterFieldType fieldType,
  }) = _FilterFieldImpl;

  factory FilterField.fromJson(Map<String, dynamic> jsonSerialization) {
    return FilterField(
      fieldKey: jsonSerialization['fieldKey'] as String,
      value: jsonSerialization['value'] as String,
      type: _i2.FilterType.fromJson((jsonSerialization['type'] as String)),
      filterOperator: _i3.FilterOperator.fromJson(
          (jsonSerialization['filterOperator'] as String)),
      uuid: jsonSerialization['uuid'] as String,
      fieldType: _i4.FilterFieldType.fromJson(
          (jsonSerialization['fieldType'] as String)),
    );
  }

  String fieldKey;

  String value;

  _i2.FilterType type;

  _i3.FilterOperator filterOperator;

  String uuid;

  _i4.FilterFieldType fieldType;

  /// Returns a shallow copy of this [FilterField]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FilterField copyWith({
    String? fieldKey,
    String? value,
    _i2.FilterType? type,
    _i3.FilterOperator? filterOperator,
    String? uuid,
    _i4.FilterFieldType? fieldType,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'fieldKey': fieldKey,
      'value': value,
      'type': type.toJson(),
      'filterOperator': filterOperator.toJson(),
      'uuid': uuid,
      'fieldType': fieldType.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'fieldKey': fieldKey,
      'value': value,
      'type': type.toJson(),
      'filterOperator': filterOperator.toJson(),
      'uuid': uuid,
      'fieldType': fieldType.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FilterFieldImpl extends FilterField {
  _FilterFieldImpl({
    required String fieldKey,
    required String value,
    required _i2.FilterType type,
    required _i3.FilterOperator filterOperator,
    required String uuid,
    required _i4.FilterFieldType fieldType,
  }) : super._(
          fieldKey: fieldKey,
          value: value,
          type: type,
          filterOperator: filterOperator,
          uuid: uuid,
          fieldType: fieldType,
        );

  /// Returns a shallow copy of this [FilterField]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FilterField copyWith({
    String? fieldKey,
    String? value,
    _i2.FilterType? type,
    _i3.FilterOperator? filterOperator,
    String? uuid,
    _i4.FilterFieldType? fieldType,
  }) {
    return FilterField(
      fieldKey: fieldKey ?? this.fieldKey,
      value: value ?? this.value,
      type: type ?? this.type,
      filterOperator: filterOperator ?? this.filterOperator,
      uuid: uuid ?? this.uuid,
      fieldType: fieldType ?? this.fieldType,
    );
  }
}
