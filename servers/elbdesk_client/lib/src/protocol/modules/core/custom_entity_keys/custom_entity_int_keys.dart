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
import '../../../modules/core/table/table_type.dart' as _i2;

abstract class CustomEntityIntKeys implements _i1.SerializableModel {
  CustomEntityIntKeys._({
    this.id,
    required this.tableType,
    required this.latestNumber,
  });

  factory CustomEntityIntKeys({
    int? id,
    required _i2.TableType tableType,
    required int latestNumber,
  }) = _CustomEntityIntKeysImpl;

  factory CustomEntityIntKeys.fromJson(Map<String, dynamic> jsonSerialization) {
    return CustomEntityIntKeys(
      id: jsonSerialization['id'] as int?,
      tableType:
          _i2.TableType.fromJson((jsonSerialization['tableType'] as String)),
      latestNumber: jsonSerialization['latestNumber'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.TableType tableType;

  int latestNumber;

  /// Returns a shallow copy of this [CustomEntityIntKeys]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomEntityIntKeys copyWith({
    int? id,
    _i2.TableType? tableType,
    int? latestNumber,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tableType': tableType.toJson(),
      'latestNumber': latestNumber,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomEntityIntKeysImpl extends CustomEntityIntKeys {
  _CustomEntityIntKeysImpl({
    int? id,
    required _i2.TableType tableType,
    required int latestNumber,
  }) : super._(
          id: id,
          tableType: tableType,
          latestNumber: latestNumber,
        );

  /// Returns a shallow copy of this [CustomEntityIntKeys]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomEntityIntKeys copyWith({
    Object? id = _Undefined,
    _i2.TableType? tableType,
    int? latestNumber,
  }) {
    return CustomEntityIntKeys(
      id: id is int? ? id : this.id,
      tableType: tableType ?? this.tableType,
      latestNumber: latestNumber ?? this.latestNumber,
    );
  }
}
