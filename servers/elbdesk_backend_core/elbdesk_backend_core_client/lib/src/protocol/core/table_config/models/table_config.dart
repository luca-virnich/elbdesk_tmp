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
import '../../../core/table_config/models/table_field_config.dart' as _i2;
import '../../../core/table_filter/models/filter.dart' as _i3;
import '../../../core/table_filter/models/sort.dart' as _i4;

abstract class TableConfig implements _i1.SerializableModel {
  TableConfig._({
    this.id,
    required this.componentIdentifier,
    required this.tableId,
    required this.tableFieldConfig,
    this.filter,
    required this.isPrimary,
    required this.name,
    this.sort,
  });

  factory TableConfig({
    int? id,
    required String componentIdentifier,
    required String tableId,
    required List<_i2.TableFieldConfig> tableFieldConfig,
    _i3.Filter? filter,
    required bool isPrimary,
    required String name,
    _i4.Sort? sort,
  }) = _TableConfigImpl;

  factory TableConfig.fromJson(Map<String, dynamic> jsonSerialization) {
    return TableConfig(
      id: jsonSerialization['id'] as int?,
      componentIdentifier: jsonSerialization['componentIdentifier'] as String,
      tableId: jsonSerialization['tableId'] as String,
      tableFieldConfig: (jsonSerialization['tableFieldConfig'] as List)
          .map(
              (e) => _i2.TableFieldConfig.fromJson((e as Map<String, dynamic>)))
          .toList(),
      filter: jsonSerialization['filter'] == null
          ? null
          : _i3.Filter.fromJson(
              (jsonSerialization['filter'] as Map<String, dynamic>)),
      isPrimary: jsonSerialization['isPrimary'] as bool,
      name: jsonSerialization['name'] as String,
      sort: jsonSerialization['sort'] == null
          ? null
          : _i4.Sort.fromJson(
              (jsonSerialization['sort'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String componentIdentifier;

  String tableId;

  List<_i2.TableFieldConfig> tableFieldConfig;

  _i3.Filter? filter;

  bool isPrimary;

  String name;

  _i4.Sort? sort;

  /// Returns a shallow copy of this [TableConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TableConfig copyWith({
    int? id,
    String? componentIdentifier,
    String? tableId,
    List<_i2.TableFieldConfig>? tableFieldConfig,
    _i3.Filter? filter,
    bool? isPrimary,
    String? name,
    _i4.Sort? sort,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'componentIdentifier': componentIdentifier,
      'tableId': tableId,
      'tableFieldConfig':
          tableFieldConfig.toJson(valueToJson: (v) => v.toJson()),
      if (filter != null) 'filter': filter?.toJson(),
      'isPrimary': isPrimary,
      'name': name,
      if (sort != null) 'sort': sort?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TableConfigImpl extends TableConfig {
  _TableConfigImpl({
    int? id,
    required String componentIdentifier,
    required String tableId,
    required List<_i2.TableFieldConfig> tableFieldConfig,
    _i3.Filter? filter,
    required bool isPrimary,
    required String name,
    _i4.Sort? sort,
  }) : super._(
          id: id,
          componentIdentifier: componentIdentifier,
          tableId: tableId,
          tableFieldConfig: tableFieldConfig,
          filter: filter,
          isPrimary: isPrimary,
          name: name,
          sort: sort,
        );

  /// Returns a shallow copy of this [TableConfig]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TableConfig copyWith({
    Object? id = _Undefined,
    String? componentIdentifier,
    String? tableId,
    List<_i2.TableFieldConfig>? tableFieldConfig,
    Object? filter = _Undefined,
    bool? isPrimary,
    String? name,
    Object? sort = _Undefined,
  }) {
    return TableConfig(
      id: id is int? ? id : this.id,
      componentIdentifier: componentIdentifier ?? this.componentIdentifier,
      tableId: tableId ?? this.tableId,
      tableFieldConfig: tableFieldConfig ??
          this.tableFieldConfig.map((e0) => e0.copyWith()).toList(),
      filter: filter is _i3.Filter? ? filter : this.filter?.copyWith(),
      isPrimary: isPrimary ?? this.isPrimary,
      name: name ?? this.name,
      sort: sort is _i4.Sort? ? sort : this.sort?.copyWith(),
    );
  }
}
