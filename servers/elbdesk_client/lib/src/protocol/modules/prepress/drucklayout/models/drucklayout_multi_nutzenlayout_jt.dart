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
import '../../../../modules/prepress/drucklayout/models/drucklayout.dart'
    as _i2;
import '../../../../modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i3;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i4;

abstract class DrucklayoutMultiNutzenlayoutJT implements _i1.SerializableModel {
  DrucklayoutMultiNutzenlayoutJT._({
    this.id,
    required this.drucklayoutId,
    this.drucklayout,
    required this.salesOrderMultiNutzenlayoutId,
    this.salesOrderMultiNutzenlayout,
    required this.salesOrderId,
    this.salesOrder,
  });

  factory DrucklayoutMultiNutzenlayoutJT({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderMultiNutzenlayoutId,
    _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) = _DrucklayoutMultiNutzenlayoutJTImpl;

  factory DrucklayoutMultiNutzenlayoutJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DrucklayoutMultiNutzenlayoutJT(
      id: jsonSerialization['id'] as int?,
      drucklayoutId: jsonSerialization['drucklayoutId'] as int,
      drucklayout: jsonSerialization['drucklayout'] == null
          ? null
          : _i2.DrucklayoutDTO.fromJson(
              (jsonSerialization['drucklayout'] as Map<String, dynamic>)),
      salesOrderMultiNutzenlayoutId:
          jsonSerialization['salesOrderMultiNutzenlayoutId'] as int,
      salesOrderMultiNutzenlayout:
          jsonSerialization['salesOrderMultiNutzenlayout'] == null
              ? null
              : _i3.SalesOrderMultiNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderMultiNutzenlayout']
                      as Map<String, dynamic>)),
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i4.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int drucklayoutId;

  _i2.DrucklayoutDTO? drucklayout;

  int salesOrderMultiNutzenlayoutId;

  _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout;

  int salesOrderId;

  _i4.SalesOrderDTO? salesOrder;

  /// Returns a shallow copy of this [DrucklayoutMultiNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrucklayoutMultiNutzenlayoutJT copyWith({
    int? id,
    int? drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    int? salesOrderMultiNutzenlayoutId,
    _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    int? salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'drucklayoutId': drucklayoutId,
      if (drucklayout != null) 'drucklayout': drucklayout?.toJson(),
      'salesOrderMultiNutzenlayoutId': salesOrderMultiNutzenlayoutId,
      if (salesOrderMultiNutzenlayout != null)
        'salesOrderMultiNutzenlayout': salesOrderMultiNutzenlayout?.toJson(),
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrucklayoutMultiNutzenlayoutJTImpl
    extends DrucklayoutMultiNutzenlayoutJT {
  _DrucklayoutMultiNutzenlayoutJTImpl({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderMultiNutzenlayoutId,
    _i3.SalesOrderMultiNutzenlayoutDTO? salesOrderMultiNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) : super._(
          id: id,
          drucklayoutId: drucklayoutId,
          drucklayout: drucklayout,
          salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutId,
          salesOrderMultiNutzenlayout: salesOrderMultiNutzenlayout,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
        );

  /// Returns a shallow copy of this [DrucklayoutMultiNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrucklayoutMultiNutzenlayoutJT copyWith({
    Object? id = _Undefined,
    int? drucklayoutId,
    Object? drucklayout = _Undefined,
    int? salesOrderMultiNutzenlayoutId,
    Object? salesOrderMultiNutzenlayout = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
  }) {
    return DrucklayoutMultiNutzenlayoutJT(
      id: id is int? ? id : this.id,
      drucklayoutId: drucklayoutId ?? this.drucklayoutId,
      drucklayout: drucklayout is _i2.DrucklayoutDTO?
          ? drucklayout
          : this.drucklayout?.copyWith(),
      salesOrderMultiNutzenlayoutId:
          salesOrderMultiNutzenlayoutId ?? this.salesOrderMultiNutzenlayoutId,
      salesOrderMultiNutzenlayout:
          salesOrderMultiNutzenlayout is _i3.SalesOrderMultiNutzenlayoutDTO?
              ? salesOrderMultiNutzenlayout
              : this.salesOrderMultiNutzenlayout?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i4.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
    );
  }
}
