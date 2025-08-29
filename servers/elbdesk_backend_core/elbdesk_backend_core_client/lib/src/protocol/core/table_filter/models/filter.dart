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
import '../../../core/table_filter/models/filter_group.dart' as _i2;

abstract class Filter implements _i1.SerializableModel {
  Filter._({required this.filterGroups});

  factory Filter({required List<_i2.FilterGroup> filterGroups}) = _FilterImpl;

  factory Filter.fromJson(Map<String, dynamic> jsonSerialization) {
    return Filter(
        filterGroups: (jsonSerialization['filterGroups'] as List)
            .map((e) => _i2.FilterGroup.fromJson((e as Map<String, dynamic>)))
            .toList());
  }

  List<_i2.FilterGroup> filterGroups;

  /// Returns a shallow copy of this [Filter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Filter copyWith({List<_i2.FilterGroup>? filterGroups});
  @override
  Map<String, dynamic> toJson() {
    return {
      'filterGroups': filterGroups.toJson(valueToJson: (v) => v.toJson())
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _FilterImpl extends Filter {
  _FilterImpl({required List<_i2.FilterGroup> filterGroups})
      : super._(filterGroups: filterGroups);

  /// Returns a shallow copy of this [Filter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Filter copyWith({List<_i2.FilterGroup>? filterGroups}) {
    return Filter(
        filterGroups: filterGroups ??
            this.filterGroups.map((e0) => e0.copyWith()).toList());
  }
}
