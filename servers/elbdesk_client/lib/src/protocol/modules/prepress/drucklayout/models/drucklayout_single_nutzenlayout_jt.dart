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
import '../../../../modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i3;
import '../../../../modules/sales/sales_order/models/sales_order.dart' as _i4;

abstract class DrucklayoutSingleNutzenlayoutJT
    implements _i1.SerializableModel {
  DrucklayoutSingleNutzenlayoutJT._({
    this.id,
    required this.drucklayoutId,
    this.drucklayout,
    required this.salesOrderSingleNutzenlayoutId,
    this.salesOrderSingleNutzenlayout,
    required this.salesOrderId,
    this.salesOrder,
  });

  factory DrucklayoutSingleNutzenlayoutJT({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderSingleNutzenlayoutId,
    _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) = _DrucklayoutSingleNutzenlayoutJTImpl;

  factory DrucklayoutSingleNutzenlayoutJT.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return DrucklayoutSingleNutzenlayoutJT(
      id: jsonSerialization['id'] as int?,
      drucklayoutId: jsonSerialization['drucklayoutId'] as int,
      drucklayout: jsonSerialization['drucklayout'] == null
          ? null
          : _i2.DrucklayoutDTO.fromJson(
              (jsonSerialization['drucklayout'] as Map<String, dynamic>)),
      salesOrderSingleNutzenlayoutId:
          jsonSerialization['salesOrderSingleNutzenlayoutId'] as int,
      salesOrderSingleNutzenlayout:
          jsonSerialization['salesOrderSingleNutzenlayout'] == null
              ? null
              : _i3.SalesOrderSingleNutzenlayoutDTO.fromJson(
                  (jsonSerialization['salesOrderSingleNutzenlayout']
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

  int salesOrderSingleNutzenlayoutId;

  _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout;

  int salesOrderId;

  _i4.SalesOrderDTO? salesOrder;

  /// Returns a shallow copy of this [DrucklayoutSingleNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrucklayoutSingleNutzenlayoutJT copyWith({
    int? id,
    int? drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    int? salesOrderSingleNutzenlayoutId,
    _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    int? salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'drucklayoutId': drucklayoutId,
      if (drucklayout != null) 'drucklayout': drucklayout?.toJson(),
      'salesOrderSingleNutzenlayoutId': salesOrderSingleNutzenlayoutId,
      if (salesOrderSingleNutzenlayout != null)
        'salesOrderSingleNutzenlayout': salesOrderSingleNutzenlayout?.toJson(),
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

class _DrucklayoutSingleNutzenlayoutJTImpl
    extends DrucklayoutSingleNutzenlayoutJT {
  _DrucklayoutSingleNutzenlayoutJTImpl({
    int? id,
    required int drucklayoutId,
    _i2.DrucklayoutDTO? drucklayout,
    required int salesOrderSingleNutzenlayoutId,
    _i3.SalesOrderSingleNutzenlayoutDTO? salesOrderSingleNutzenlayout,
    required int salesOrderId,
    _i4.SalesOrderDTO? salesOrder,
  }) : super._(
          id: id,
          drucklayoutId: drucklayoutId,
          drucklayout: drucklayout,
          salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayoutId,
          salesOrderSingleNutzenlayout: salesOrderSingleNutzenlayout,
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
        );

  /// Returns a shallow copy of this [DrucklayoutSingleNutzenlayoutJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrucklayoutSingleNutzenlayoutJT copyWith({
    Object? id = _Undefined,
    int? drucklayoutId,
    Object? drucklayout = _Undefined,
    int? salesOrderSingleNutzenlayoutId,
    Object? salesOrderSingleNutzenlayout = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
  }) {
    return DrucklayoutSingleNutzenlayoutJT(
      id: id is int? ? id : this.id,
      drucklayoutId: drucklayoutId ?? this.drucklayoutId,
      drucklayout: drucklayout is _i2.DrucklayoutDTO?
          ? drucklayout
          : this.drucklayout?.copyWith(),
      salesOrderSingleNutzenlayoutId:
          salesOrderSingleNutzenlayoutId ?? this.salesOrderSingleNutzenlayoutId,
      salesOrderSingleNutzenlayout:
          salesOrderSingleNutzenlayout is _i3.SalesOrderSingleNutzenlayoutDTO?
              ? salesOrderSingleNutzenlayout
              : this.salesOrderSingleNutzenlayout?.copyWith(),
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i4.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
    );
  }
}
