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
import '../../../core/table_filter/models/filter_field.dart' as _i2;
import '../../../core/table_filter/models/filter_operator.dart' as _i3;

abstract class FilterGroup implements _i1.SerializableModel {
  FilterGroup._({
    required this.filters,
    required this.nextOperator,
  });

  factory FilterGroup({
    required List<_i2.FilterField> filters,
    required _i3.FilterOperator nextOperator,
  }) = _FilterGroupImpl;

  factory FilterGroup.fromJson(Map<String, dynamic> jsonSerialization) {
    return FilterGroup(
      filters: (jsonSerialization['filters'] as List)
          .map((e) => _i2.FilterField.fromJson((e as Map<String, dynamic>)))
          .toList(),
      nextOperator: _i3.FilterOperator.fromJson(
          (jsonSerialization['nextOperator'] as String)),
    );
  }

  List<_i2.FilterField> filters;

  _i3.FilterOperator nextOperator;

  /// Returns a shallow copy of this [FilterGroup]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  FilterGroup copyWith({
    List<_i2.FilterField>? filters,
    _i3.FilterOperator? nextOperator,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'filters': filters.toJson(valueToJson: (v) => v.toJson()),
      'nextOperator': nextOperator.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FilterGroupImpl extends FilterGroup {
  _FilterGroupImpl({
    required List<_i2.FilterField> filters,
    required _i3.FilterOperator nextOperator,
  }) : super._(
          filters: filters,
          nextOperator: nextOperator,
        );

  /// Returns a shallow copy of this [FilterGroup]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  FilterGroup copyWith({
    List<_i2.FilterField>? filters,
    _i3.FilterOperator? nextOperator,
  }) {
    return FilterGroup(
      filters: filters ?? this.filters.map((e0) => e0.copyWith()).toList(),
      nextOperator: nextOperator ?? this.nextOperator,
    );
  }
}
