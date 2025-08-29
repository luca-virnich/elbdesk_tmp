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
import '../../../../modules/crm/customer/models/customer.dart' as _i2;
import '../../../../modules/prepress/drucklayout/models/drucklayout_sales_order_jt.dart'
    as _i3;
import '../../../../modules/prepress/drucklayout/models/drucklayout_single_nutzenlayout_jt.dart'
    as _i4;
import '../../../../modules/prepress/drucklayout/models/drucklayout_multi_nutzenlayout_jt.dart'
    as _i5;
import '../../../../modules/prepress/drucklayout/models/drucklayout_selection.dart'
    as _i6;
import '../../../../modules/prepress/drucklayout/models/drucklayout_pre_selection.dart'
    as _i7;

abstract class DrucklayoutDTO implements _i1.SerializableModel {
  DrucklayoutDTO._({
    this.id,
    required this.title,
    this.description,
    this.customerId,
    this.customer,
    this.salesOrders,
    this.singleNutzenlayouts,
    this.multiNutzenlayouts,
    required this.drucklayoutSelectionId,
    this.drucklayoutSelection,
    required this.drucklayoutPreSelectionId,
    this.drucklayoutPreSelection,
    required this.createdAt,
    this.createdById,
    this.lastModifiedAt,
    this.lastModifiedById,
    this.deletedAt,
    this.deletedById,
    this.editingById,
    this.editingSince,
    required this.isDraft,
    this.editingSession,
  });

  factory DrucklayoutDTO({
    int? id,
    required String title,
    String? description,
    int? customerId,
    _i2.CustomerDTO? customer,
    List<_i3.DrucklayoutSalesOrderJT>? salesOrders,
    List<_i4.DrucklayoutSingleNutzenlayoutJT>? singleNutzenlayouts,
    List<_i5.DrucklayoutMultiNutzenlayoutJT>? multiNutzenlayouts,
    required int drucklayoutSelectionId,
    _i6.DrucklayoutSelectionDTO? drucklayoutSelection,
    required int drucklayoutPreSelectionId,
    _i7.DrucklayoutPreSelectionDTO? drucklayoutPreSelection,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) = _DrucklayoutDTOImpl;

  factory DrucklayoutDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return DrucklayoutDTO(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String?,
      customerId: jsonSerialization['customerId'] as int?,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      salesOrders: (jsonSerialization['salesOrders'] as List?)
          ?.map((e) =>
              _i3.DrucklayoutSalesOrderJT.fromJson((e as Map<String, dynamic>)))
          .toList(),
      singleNutzenlayouts: (jsonSerialization['singleNutzenlayouts'] as List?)
          ?.map((e) => _i4.DrucklayoutSingleNutzenlayoutJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      multiNutzenlayouts: (jsonSerialization['multiNutzenlayouts'] as List?)
          ?.map((e) => _i5.DrucklayoutMultiNutzenlayoutJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      drucklayoutSelectionId:
          jsonSerialization['drucklayoutSelectionId'] as int,
      drucklayoutSelection: jsonSerialization['drucklayoutSelection'] == null
          ? null
          : _i6.DrucklayoutSelectionDTO.fromJson(
              (jsonSerialization['drucklayoutSelection']
                  as Map<String, dynamic>)),
      drucklayoutPreSelectionId:
          jsonSerialization['drucklayoutPreSelectionId'] as int,
      drucklayoutPreSelection:
          jsonSerialization['drucklayoutPreSelection'] == null
              ? null
              : _i7.DrucklayoutPreSelectionDTO.fromJson(
                  (jsonSerialization['drucklayoutPreSelection']
                      as Map<String, dynamic>)),
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      createdById: jsonSerialization['createdById'] as int?,
      lastModifiedAt: jsonSerialization['lastModifiedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['lastModifiedAt']),
      lastModifiedById: jsonSerialization['lastModifiedById'] as int?,
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
      deletedById: jsonSerialization['deletedById'] as int?,
      editingById: jsonSerialization['editingById'] as int?,
      editingSince: jsonSerialization['editingSince'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['editingSince']),
      isDraft: jsonSerialization['isDraft'] as bool,
      editingSession: jsonSerialization['editingSession'] as String?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String? description;

  int? customerId;

  _i2.CustomerDTO? customer;

  List<_i3.DrucklayoutSalesOrderJT>? salesOrders;

  List<_i4.DrucklayoutSingleNutzenlayoutJT>? singleNutzenlayouts;

  List<_i5.DrucklayoutMultiNutzenlayoutJT>? multiNutzenlayouts;

  int drucklayoutSelectionId;

  _i6.DrucklayoutSelectionDTO? drucklayoutSelection;

  int drucklayoutPreSelectionId;

  _i7.DrucklayoutPreSelectionDTO? drucklayoutPreSelection;

  DateTime createdAt;

  int? createdById;

  DateTime? lastModifiedAt;

  int? lastModifiedById;

  DateTime? deletedAt;

  int? deletedById;

  int? editingById;

  DateTime? editingSince;

  bool isDraft;

  String? editingSession;

  /// Returns a shallow copy of this [DrucklayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  DrucklayoutDTO copyWith({
    int? id,
    String? title,
    String? description,
    int? customerId,
    _i2.CustomerDTO? customer,
    List<_i3.DrucklayoutSalesOrderJT>? salesOrders,
    List<_i4.DrucklayoutSingleNutzenlayoutJT>? singleNutzenlayouts,
    List<_i5.DrucklayoutMultiNutzenlayoutJT>? multiNutzenlayouts,
    int? drucklayoutSelectionId,
    _i6.DrucklayoutSelectionDTO? drucklayoutSelection,
    int? drucklayoutPreSelectionId,
    _i7.DrucklayoutPreSelectionDTO? drucklayoutPreSelection,
    DateTime? createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    bool? isDraft,
    String? editingSession,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      if (salesOrders != null)
        'salesOrders': salesOrders?.toJson(valueToJson: (v) => v.toJson()),
      if (singleNutzenlayouts != null)
        'singleNutzenlayouts':
            singleNutzenlayouts?.toJson(valueToJson: (v) => v.toJson()),
      if (multiNutzenlayouts != null)
        'multiNutzenlayouts':
            multiNutzenlayouts?.toJson(valueToJson: (v) => v.toJson()),
      'drucklayoutSelectionId': drucklayoutSelectionId,
      if (drucklayoutSelection != null)
        'drucklayoutSelection': drucklayoutSelection?.toJson(),
      'drucklayoutPreSelectionId': drucklayoutPreSelectionId,
      if (drucklayoutPreSelection != null)
        'drucklayoutPreSelection': drucklayoutPreSelection?.toJson(),
      'createdAt': createdAt.toJson(),
      if (createdById != null) 'createdById': createdById,
      if (lastModifiedAt != null) 'lastModifiedAt': lastModifiedAt?.toJson(),
      if (lastModifiedById != null) 'lastModifiedById': lastModifiedById,
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
      if (deletedById != null) 'deletedById': deletedById,
      if (editingById != null) 'editingById': editingById,
      if (editingSince != null) 'editingSince': editingSince?.toJson(),
      'isDraft': isDraft,
      if (editingSession != null) 'editingSession': editingSession,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DrucklayoutDTOImpl extends DrucklayoutDTO {
  _DrucklayoutDTOImpl({
    int? id,
    required String title,
    String? description,
    int? customerId,
    _i2.CustomerDTO? customer,
    List<_i3.DrucklayoutSalesOrderJT>? salesOrders,
    List<_i4.DrucklayoutSingleNutzenlayoutJT>? singleNutzenlayouts,
    List<_i5.DrucklayoutMultiNutzenlayoutJT>? multiNutzenlayouts,
    required int drucklayoutSelectionId,
    _i6.DrucklayoutSelectionDTO? drucklayoutSelection,
    required int drucklayoutPreSelectionId,
    _i7.DrucklayoutPreSelectionDTO? drucklayoutPreSelection,
    required DateTime createdAt,
    int? createdById,
    DateTime? lastModifiedAt,
    int? lastModifiedById,
    DateTime? deletedAt,
    int? deletedById,
    int? editingById,
    DateTime? editingSince,
    required bool isDraft,
    String? editingSession,
  }) : super._(
          id: id,
          title: title,
          description: description,
          customerId: customerId,
          customer: customer,
          salesOrders: salesOrders,
          singleNutzenlayouts: singleNutzenlayouts,
          multiNutzenlayouts: multiNutzenlayouts,
          drucklayoutSelectionId: drucklayoutSelectionId,
          drucklayoutSelection: drucklayoutSelection,
          drucklayoutPreSelectionId: drucklayoutPreSelectionId,
          drucklayoutPreSelection: drucklayoutPreSelection,
          createdAt: createdAt,
          createdById: createdById,
          lastModifiedAt: lastModifiedAt,
          lastModifiedById: lastModifiedById,
          deletedAt: deletedAt,
          deletedById: deletedById,
          editingById: editingById,
          editingSince: editingSince,
          isDraft: isDraft,
          editingSession: editingSession,
        );

  /// Returns a shallow copy of this [DrucklayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  DrucklayoutDTO copyWith({
    Object? id = _Undefined,
    String? title,
    Object? description = _Undefined,
    Object? customerId = _Undefined,
    Object? customer = _Undefined,
    Object? salesOrders = _Undefined,
    Object? singleNutzenlayouts = _Undefined,
    Object? multiNutzenlayouts = _Undefined,
    int? drucklayoutSelectionId,
    Object? drucklayoutSelection = _Undefined,
    int? drucklayoutPreSelectionId,
    Object? drucklayoutPreSelection = _Undefined,
    DateTime? createdAt,
    Object? createdById = _Undefined,
    Object? lastModifiedAt = _Undefined,
    Object? lastModifiedById = _Undefined,
    Object? deletedAt = _Undefined,
    Object? deletedById = _Undefined,
    Object? editingById = _Undefined,
    Object? editingSince = _Undefined,
    bool? isDraft,
    Object? editingSession = _Undefined,
  }) {
    return DrucklayoutDTO(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description is String? ? description : this.description,
      customerId: customerId is int? ? customerId : this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      salesOrders: salesOrders is List<_i3.DrucklayoutSalesOrderJT>?
          ? salesOrders
          : this.salesOrders?.map((e0) => e0.copyWith()).toList(),
      singleNutzenlayouts:
          singleNutzenlayouts is List<_i4.DrucklayoutSingleNutzenlayoutJT>?
              ? singleNutzenlayouts
              : this.singleNutzenlayouts?.map((e0) => e0.copyWith()).toList(),
      multiNutzenlayouts:
          multiNutzenlayouts is List<_i5.DrucklayoutMultiNutzenlayoutJT>?
              ? multiNutzenlayouts
              : this.multiNutzenlayouts?.map((e0) => e0.copyWith()).toList(),
      drucklayoutSelectionId:
          drucklayoutSelectionId ?? this.drucklayoutSelectionId,
      drucklayoutSelection: drucklayoutSelection is _i6.DrucklayoutSelectionDTO?
          ? drucklayoutSelection
          : this.drucklayoutSelection?.copyWith(),
      drucklayoutPreSelectionId:
          drucklayoutPreSelectionId ?? this.drucklayoutPreSelectionId,
      drucklayoutPreSelection:
          drucklayoutPreSelection is _i7.DrucklayoutPreSelectionDTO?
              ? drucklayoutPreSelection
              : this.drucklayoutPreSelection?.copyWith(),
      createdAt: createdAt ?? this.createdAt,
      createdById: createdById is int? ? createdById : this.createdById,
      lastModifiedAt:
          lastModifiedAt is DateTime? ? lastModifiedAt : this.lastModifiedAt,
      lastModifiedById:
          lastModifiedById is int? ? lastModifiedById : this.lastModifiedById,
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
      deletedById: deletedById is int? ? deletedById : this.deletedById,
      editingById: editingById is int? ? editingById : this.editingById,
      editingSince:
          editingSince is DateTime? ? editingSince : this.editingSince,
      isDraft: isDraft ?? this.isDraft,
      editingSession:
          editingSession is String? ? editingSession : this.editingSession,
    );
  }
}
