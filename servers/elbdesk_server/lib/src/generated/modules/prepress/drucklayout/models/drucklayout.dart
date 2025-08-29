/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
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

abstract class DrucklayoutDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = DrucklayoutDTOTable();

  static const db = DrucklayoutDTORepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'title': title,
      if (description != null) 'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      if (salesOrders != null)
        'salesOrders':
            salesOrders?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (singleNutzenlayouts != null)
        'singleNutzenlayouts': singleNutzenlayouts?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      if (multiNutzenlayouts != null)
        'multiNutzenlayouts': multiNutzenlayouts?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      'drucklayoutSelectionId': drucklayoutSelectionId,
      if (drucklayoutSelection != null)
        'drucklayoutSelection': drucklayoutSelection?.toJsonForProtocol(),
      'drucklayoutPreSelectionId': drucklayoutPreSelectionId,
      if (drucklayoutPreSelection != null)
        'drucklayoutPreSelection': drucklayoutPreSelection?.toJsonForProtocol(),
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

  static DrucklayoutDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.DrucklayoutSalesOrderJTIncludeList? salesOrders,
    _i4.DrucklayoutSingleNutzenlayoutJTIncludeList? singleNutzenlayouts,
    _i5.DrucklayoutMultiNutzenlayoutJTIncludeList? multiNutzenlayouts,
    _i6.DrucklayoutSelectionDTOInclude? drucklayoutSelection,
    _i7.DrucklayoutPreSelectionDTOInclude? drucklayoutPreSelection,
  }) {
    return DrucklayoutDTOInclude._(
      customer: customer,
      salesOrders: salesOrders,
      singleNutzenlayouts: singleNutzenlayouts,
      multiNutzenlayouts: multiNutzenlayouts,
      drucklayoutSelection: drucklayoutSelection,
      drucklayoutPreSelection: drucklayoutPreSelection,
    );
  }

  static DrucklayoutDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<DrucklayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutDTOTable>? orderByList,
    DrucklayoutDTOInclude? include,
  }) {
    return DrucklayoutDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(DrucklayoutDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(DrucklayoutDTO.t),
      include: include,
    );
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

class DrucklayoutDTOTable extends _i1.Table<int?> {
  DrucklayoutDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_drucklayout') {
    title = _i1.ColumnString(
      'title',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    drucklayoutSelectionId = _i1.ColumnInt(
      'drucklayoutSelectionId',
      this,
    );
    drucklayoutPreSelectionId = _i1.ColumnInt(
      'drucklayoutPreSelectionId',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
    );
    createdById = _i1.ColumnInt(
      'createdById',
      this,
    );
    lastModifiedAt = _i1.ColumnDateTime(
      'lastModifiedAt',
      this,
    );
    lastModifiedById = _i1.ColumnInt(
      'lastModifiedById',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
    deletedById = _i1.ColumnInt(
      'deletedById',
      this,
    );
    editingById = _i1.ColumnInt(
      'editingById',
      this,
    );
    editingSince = _i1.ColumnDateTime(
      'editingSince',
      this,
    );
    isDraft = _i1.ColumnBool(
      'isDraft',
      this,
    );
    editingSession = _i1.ColumnString(
      'editingSession',
      this,
    );
  }

  late final _i1.ColumnString title;

  late final _i1.ColumnString description;

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  _i3.DrucklayoutSalesOrderJTTable? ___salesOrders;

  _i1.ManyRelation<_i3.DrucklayoutSalesOrderJTTable>? _salesOrders;

  _i4.DrucklayoutSingleNutzenlayoutJTTable? ___singleNutzenlayouts;

  _i1.ManyRelation<_i4.DrucklayoutSingleNutzenlayoutJTTable>?
      _singleNutzenlayouts;

  _i5.DrucklayoutMultiNutzenlayoutJTTable? ___multiNutzenlayouts;

  _i1.ManyRelation<_i5.DrucklayoutMultiNutzenlayoutJTTable>?
      _multiNutzenlayouts;

  late final _i1.ColumnInt drucklayoutSelectionId;

  _i6.DrucklayoutSelectionDTOTable? _drucklayoutSelection;

  late final _i1.ColumnInt drucklayoutPreSelectionId;

  _i7.DrucklayoutPreSelectionDTOTable? _drucklayoutPreSelection;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnInt createdById;

  late final _i1.ColumnDateTime lastModifiedAt;

  late final _i1.ColumnInt lastModifiedById;

  late final _i1.ColumnDateTime deletedAt;

  late final _i1.ColumnInt deletedById;

  late final _i1.ColumnInt editingById;

  late final _i1.ColumnDateTime editingSince;

  late final _i1.ColumnBool isDraft;

  late final _i1.ColumnString editingSession;

  _i2.CustomerDTOTable get customer {
    if (_customer != null) return _customer!;
    _customer = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: DrucklayoutDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.DrucklayoutSalesOrderJTTable get __salesOrders {
    if (___salesOrders != null) return ___salesOrders!;
    ___salesOrders = _i1.createRelationTable(
      relationFieldName: '__salesOrders',
      field: DrucklayoutDTO.t.id,
      foreignField: _i3.DrucklayoutSalesOrderJT.t.drucklayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.DrucklayoutSalesOrderJTTable(tableRelation: foreignTableRelation),
    );
    return ___salesOrders!;
  }

  _i4.DrucklayoutSingleNutzenlayoutJTTable get __singleNutzenlayouts {
    if (___singleNutzenlayouts != null) return ___singleNutzenlayouts!;
    ___singleNutzenlayouts = _i1.createRelationTable(
      relationFieldName: '__singleNutzenlayouts',
      field: DrucklayoutDTO.t.id,
      foreignField: _i4.DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.DrucklayoutSingleNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___singleNutzenlayouts!;
  }

  _i5.DrucklayoutMultiNutzenlayoutJTTable get __multiNutzenlayouts {
    if (___multiNutzenlayouts != null) return ___multiNutzenlayouts!;
    ___multiNutzenlayouts = _i1.createRelationTable(
      relationFieldName: '__multiNutzenlayouts',
      field: DrucklayoutDTO.t.id,
      foreignField: _i5.DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.DrucklayoutMultiNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___multiNutzenlayouts!;
  }

  _i6.DrucklayoutSelectionDTOTable get drucklayoutSelection {
    if (_drucklayoutSelection != null) return _drucklayoutSelection!;
    _drucklayoutSelection = _i1.createRelationTable(
      relationFieldName: 'drucklayoutSelection',
      field: DrucklayoutDTO.t.drucklayoutSelectionId,
      foreignField: _i6.DrucklayoutSelectionDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.DrucklayoutSelectionDTOTable(tableRelation: foreignTableRelation),
    );
    return _drucklayoutSelection!;
  }

  _i7.DrucklayoutPreSelectionDTOTable get drucklayoutPreSelection {
    if (_drucklayoutPreSelection != null) return _drucklayoutPreSelection!;
    _drucklayoutPreSelection = _i1.createRelationTable(
      relationFieldName: 'drucklayoutPreSelection',
      field: DrucklayoutDTO.t.drucklayoutPreSelectionId,
      foreignField: _i7.DrucklayoutPreSelectionDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.DrucklayoutPreSelectionDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _drucklayoutPreSelection!;
  }

  _i1.ManyRelation<_i3.DrucklayoutSalesOrderJTTable> get salesOrders {
    if (_salesOrders != null) return _salesOrders!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'salesOrders',
      field: DrucklayoutDTO.t.id,
      foreignField: _i3.DrucklayoutSalesOrderJT.t.drucklayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.DrucklayoutSalesOrderJTTable(tableRelation: foreignTableRelation),
    );
    _salesOrders = _i1.ManyRelation<_i3.DrucklayoutSalesOrderJTTable>(
      tableWithRelations: relationTable,
      table: _i3.DrucklayoutSalesOrderJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _salesOrders!;
  }

  _i1.ManyRelation<_i4.DrucklayoutSingleNutzenlayoutJTTable>
      get singleNutzenlayouts {
    if (_singleNutzenlayouts != null) return _singleNutzenlayouts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'singleNutzenlayouts',
      field: DrucklayoutDTO.t.id,
      foreignField: _i4.DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.DrucklayoutSingleNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    _singleNutzenlayouts =
        _i1.ManyRelation<_i4.DrucklayoutSingleNutzenlayoutJTTable>(
      tableWithRelations: relationTable,
      table: _i4.DrucklayoutSingleNutzenlayoutJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _singleNutzenlayouts!;
  }

  _i1.ManyRelation<_i5.DrucklayoutMultiNutzenlayoutJTTable>
      get multiNutzenlayouts {
    if (_multiNutzenlayouts != null) return _multiNutzenlayouts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'multiNutzenlayouts',
      field: DrucklayoutDTO.t.id,
      foreignField: _i5.DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.DrucklayoutMultiNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    _multiNutzenlayouts =
        _i1.ManyRelation<_i5.DrucklayoutMultiNutzenlayoutJTTable>(
      tableWithRelations: relationTable,
      table: _i5.DrucklayoutMultiNutzenlayoutJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _multiNutzenlayouts!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        title,
        description,
        customerId,
        drucklayoutSelectionId,
        drucklayoutPreSelectionId,
        createdAt,
        createdById,
        lastModifiedAt,
        lastModifiedById,
        deletedAt,
        deletedById,
        editingById,
        editingSince,
        isDraft,
        editingSession,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'customer') {
      return customer;
    }
    if (relationField == 'salesOrders') {
      return __salesOrders;
    }
    if (relationField == 'singleNutzenlayouts') {
      return __singleNutzenlayouts;
    }
    if (relationField == 'multiNutzenlayouts') {
      return __multiNutzenlayouts;
    }
    if (relationField == 'drucklayoutSelection') {
      return drucklayoutSelection;
    }
    if (relationField == 'drucklayoutPreSelection') {
      return drucklayoutPreSelection;
    }
    return null;
  }
}

class DrucklayoutDTOInclude extends _i1.IncludeObject {
  DrucklayoutDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.DrucklayoutSalesOrderJTIncludeList? salesOrders,
    _i4.DrucklayoutSingleNutzenlayoutJTIncludeList? singleNutzenlayouts,
    _i5.DrucklayoutMultiNutzenlayoutJTIncludeList? multiNutzenlayouts,
    _i6.DrucklayoutSelectionDTOInclude? drucklayoutSelection,
    _i7.DrucklayoutPreSelectionDTOInclude? drucklayoutPreSelection,
  }) {
    _customer = customer;
    _salesOrders = salesOrders;
    _singleNutzenlayouts = singleNutzenlayouts;
    _multiNutzenlayouts = multiNutzenlayouts;
    _drucklayoutSelection = drucklayoutSelection;
    _drucklayoutPreSelection = drucklayoutPreSelection;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.DrucklayoutSalesOrderJTIncludeList? _salesOrders;

  _i4.DrucklayoutSingleNutzenlayoutJTIncludeList? _singleNutzenlayouts;

  _i5.DrucklayoutMultiNutzenlayoutJTIncludeList? _multiNutzenlayouts;

  _i6.DrucklayoutSelectionDTOInclude? _drucklayoutSelection;

  _i7.DrucklayoutPreSelectionDTOInclude? _drucklayoutPreSelection;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'salesOrders': _salesOrders,
        'singleNutzenlayouts': _singleNutzenlayouts,
        'multiNutzenlayouts': _multiNutzenlayouts,
        'drucklayoutSelection': _drucklayoutSelection,
        'drucklayoutPreSelection': _drucklayoutPreSelection,
      };

  @override
  _i1.Table<int?> get table => DrucklayoutDTO.t;
}

class DrucklayoutDTOIncludeList extends _i1.IncludeList {
  DrucklayoutDTOIncludeList._({
    _i1.WhereExpressionBuilder<DrucklayoutDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(DrucklayoutDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => DrucklayoutDTO.t;
}

class DrucklayoutDTORepository {
  const DrucklayoutDTORepository._();

  final attach = const DrucklayoutDTOAttachRepository._();

  final attachRow = const DrucklayoutDTOAttachRowRepository._();

  final detach = const DrucklayoutDTODetachRepository._();

  final detachRow = const DrucklayoutDTODetachRowRepository._();

  /// Returns a list of [DrucklayoutDTO]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<DrucklayoutDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutDTOInclude? include,
  }) async {
    return session.db.find<DrucklayoutDTO>(
      where: where?.call(DrucklayoutDTO.t),
      orderBy: orderBy?.call(DrucklayoutDTO.t),
      orderByList: orderByList?.call(DrucklayoutDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [DrucklayoutDTO] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<DrucklayoutDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<DrucklayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DrucklayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    DrucklayoutDTOInclude? include,
  }) async {
    return session.db.findFirstRow<DrucklayoutDTO>(
      where: where?.call(DrucklayoutDTO.t),
      orderBy: orderBy?.call(DrucklayoutDTO.t),
      orderByList: orderByList?.call(DrucklayoutDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [DrucklayoutDTO] by its [id] or null if no such row exists.
  Future<DrucklayoutDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DrucklayoutDTOInclude? include,
  }) async {
    return session.db.findById<DrucklayoutDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [DrucklayoutDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [DrucklayoutDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<DrucklayoutDTO>> insert(
    _i1.Session session,
    List<DrucklayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<DrucklayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [DrucklayoutDTO] and returns the inserted row.
  ///
  /// The returned [DrucklayoutDTO] will have its `id` field set.
  Future<DrucklayoutDTO> insertRow(
    _i1.Session session,
    DrucklayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<DrucklayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [DrucklayoutDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<DrucklayoutDTO>> update(
    _i1.Session session,
    List<DrucklayoutDTO> rows, {
    _i1.ColumnSelections<DrucklayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<DrucklayoutDTO>(
      rows,
      columns: columns?.call(DrucklayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [DrucklayoutDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<DrucklayoutDTO> updateRow(
    _i1.Session session,
    DrucklayoutDTO row, {
    _i1.ColumnSelections<DrucklayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<DrucklayoutDTO>(
      row,
      columns: columns?.call(DrucklayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [DrucklayoutDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<DrucklayoutDTO>> delete(
    _i1.Session session,
    List<DrucklayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<DrucklayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [DrucklayoutDTO].
  Future<DrucklayoutDTO> deleteRow(
    _i1.Session session,
    DrucklayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<DrucklayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<DrucklayoutDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DrucklayoutDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<DrucklayoutDTO>(
      where: where(DrucklayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DrucklayoutDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<DrucklayoutDTO>(
      where: where?.call(DrucklayoutDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class DrucklayoutDTOAttachRepository {
  const DrucklayoutDTOAttachRepository._();

  /// Creates a relation between this [DrucklayoutDTO] and the given [DrucklayoutSalesOrderJT]s
  /// by setting each [DrucklayoutSalesOrderJT]'s foreign key `drucklayoutId` to refer to this [DrucklayoutDTO].
  Future<void> salesOrders(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    List<_i3.DrucklayoutSalesOrderJT> drucklayoutSalesOrderJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }

    var $drucklayoutSalesOrderJT = drucklayoutSalesOrderJT
        .map((e) => e.copyWith(drucklayoutId: drucklayoutDTO.id))
        .toList();
    await session.db.update<_i3.DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [_i3.DrucklayoutSalesOrderJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [DrucklayoutDTO] and the given [DrucklayoutSingleNutzenlayoutJT]s
  /// by setting each [DrucklayoutSingleNutzenlayoutJT]'s foreign key `drucklayoutId` to refer to this [DrucklayoutDTO].
  Future<void> singleNutzenlayouts(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    List<_i4.DrucklayoutSingleNutzenlayoutJT> drucklayoutSingleNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }

    var $drucklayoutSingleNutzenlayoutJT = drucklayoutSingleNutzenlayoutJT
        .map((e) => e.copyWith(drucklayoutId: drucklayoutDTO.id))
        .toList();
    await session.db.update<_i4.DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [_i4.DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [DrucklayoutDTO] and the given [DrucklayoutMultiNutzenlayoutJT]s
  /// by setting each [DrucklayoutMultiNutzenlayoutJT]'s foreign key `drucklayoutId` to refer to this [DrucklayoutDTO].
  Future<void> multiNutzenlayouts(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    List<_i5.DrucklayoutMultiNutzenlayoutJT> drucklayoutMultiNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }

    var $drucklayoutMultiNutzenlayoutJT = drucklayoutMultiNutzenlayoutJT
        .map((e) => e.copyWith(drucklayoutId: drucklayoutDTO.id))
        .toList();
    await session.db.update<_i5.DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [_i5.DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }
}

class DrucklayoutDTOAttachRowRepository {
  const DrucklayoutDTOAttachRowRepository._();

  /// Creates a relation between the given [DrucklayoutDTO] and [CustomerDTO]
  /// by setting the [DrucklayoutDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $drucklayoutDTO = drucklayoutDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<DrucklayoutDTO>(
      $drucklayoutDTO,
      columns: [DrucklayoutDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [DrucklayoutDTO] and [DrucklayoutSelectionDTO]
  /// by setting the [DrucklayoutDTO]'s foreign key `drucklayoutSelectionId` to refer to the [DrucklayoutSelectionDTO].
  Future<void> drucklayoutSelection(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    _i6.DrucklayoutSelectionDTO drucklayoutSelection, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }
    if (drucklayoutSelection.id == null) {
      throw ArgumentError.notNull('drucklayoutSelection.id');
    }

    var $drucklayoutDTO = drucklayoutDTO.copyWith(
        drucklayoutSelectionId: drucklayoutSelection.id);
    await session.db.updateRow<DrucklayoutDTO>(
      $drucklayoutDTO,
      columns: [DrucklayoutDTO.t.drucklayoutSelectionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [DrucklayoutDTO] and [DrucklayoutPreSelectionDTO]
  /// by setting the [DrucklayoutDTO]'s foreign key `drucklayoutPreSelectionId` to refer to the [DrucklayoutPreSelectionDTO].
  Future<void> drucklayoutPreSelection(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    _i7.DrucklayoutPreSelectionDTO drucklayoutPreSelection, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }
    if (drucklayoutPreSelection.id == null) {
      throw ArgumentError.notNull('drucklayoutPreSelection.id');
    }

    var $drucklayoutDTO = drucklayoutDTO.copyWith(
        drucklayoutPreSelectionId: drucklayoutPreSelection.id);
    await session.db.updateRow<DrucklayoutDTO>(
      $drucklayoutDTO,
      columns: [DrucklayoutDTO.t.drucklayoutPreSelectionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [DrucklayoutDTO] and the given [DrucklayoutSalesOrderJT]
  /// by setting the [DrucklayoutSalesOrderJT]'s foreign key `drucklayoutId` to refer to this [DrucklayoutDTO].
  Future<void> salesOrders(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    _i3.DrucklayoutSalesOrderJT drucklayoutSalesOrderJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }

    var $drucklayoutSalesOrderJT =
        drucklayoutSalesOrderJT.copyWith(drucklayoutId: drucklayoutDTO.id);
    await session.db.updateRow<_i3.DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [_i3.DrucklayoutSalesOrderJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [DrucklayoutDTO] and the given [DrucklayoutSingleNutzenlayoutJT]
  /// by setting the [DrucklayoutSingleNutzenlayoutJT]'s foreign key `drucklayoutId` to refer to this [DrucklayoutDTO].
  Future<void> singleNutzenlayouts(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    _i4.DrucklayoutSingleNutzenlayoutJT drucklayoutSingleNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }

    var $drucklayoutSingleNutzenlayoutJT = drucklayoutSingleNutzenlayoutJT
        .copyWith(drucklayoutId: drucklayoutDTO.id);
    await session.db.updateRow<_i4.DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [_i4.DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [DrucklayoutDTO] and the given [DrucklayoutMultiNutzenlayoutJT]
  /// by setting the [DrucklayoutMultiNutzenlayoutJT]'s foreign key `drucklayoutId` to refer to this [DrucklayoutDTO].
  Future<void> multiNutzenlayouts(
    _i1.Session session,
    DrucklayoutDTO drucklayoutDTO,
    _i5.DrucklayoutMultiNutzenlayoutJT drucklayoutMultiNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }
    if (drucklayoutDTO.id == null) {
      throw ArgumentError.notNull('drucklayoutDTO.id');
    }

    var $drucklayoutMultiNutzenlayoutJT = drucklayoutMultiNutzenlayoutJT
        .copyWith(drucklayoutId: drucklayoutDTO.id);
    await session.db.updateRow<_i5.DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [_i5.DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }
}

class DrucklayoutDTODetachRepository {
  const DrucklayoutDTODetachRepository._();

  /// Detaches the relation between this [DrucklayoutDTO] and the given [DrucklayoutSalesOrderJT]
  /// by setting the [DrucklayoutSalesOrderJT]'s foreign key `drucklayoutId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesOrders(
    _i1.Session session,
    List<_i3.DrucklayoutSalesOrderJT> drucklayoutSalesOrderJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }

    var $drucklayoutSalesOrderJT = drucklayoutSalesOrderJT
        .map((e) => e.copyWith(drucklayoutId: null))
        .toList();
    await session.db.update<_i3.DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [_i3.DrucklayoutSalesOrderJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [DrucklayoutDTO] and the given [DrucklayoutSingleNutzenlayoutJT]
  /// by setting the [DrucklayoutSingleNutzenlayoutJT]'s foreign key `drucklayoutId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> singleNutzenlayouts(
    _i1.Session session,
    List<_i4.DrucklayoutSingleNutzenlayoutJT> drucklayoutSingleNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }

    var $drucklayoutSingleNutzenlayoutJT = drucklayoutSingleNutzenlayoutJT
        .map((e) => e.copyWith(drucklayoutId: null))
        .toList();
    await session.db.update<_i4.DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [_i4.DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [DrucklayoutDTO] and the given [DrucklayoutMultiNutzenlayoutJT]
  /// by setting the [DrucklayoutMultiNutzenlayoutJT]'s foreign key `drucklayoutId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> multiNutzenlayouts(
    _i1.Session session,
    List<_i5.DrucklayoutMultiNutzenlayoutJT> drucklayoutMultiNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }

    var $drucklayoutMultiNutzenlayoutJT = drucklayoutMultiNutzenlayoutJT
        .map((e) => e.copyWith(drucklayoutId: null))
        .toList();
    await session.db.update<_i5.DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [_i5.DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }
}

class DrucklayoutDTODetachRowRepository {
  const DrucklayoutDTODetachRowRepository._();

  /// Detaches the relation between this [DrucklayoutDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [DrucklayoutDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    DrucklayoutDTO drucklayoutdto, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutdto.id == null) {
      throw ArgumentError.notNull('drucklayoutdto.id');
    }

    var $drucklayoutdto = drucklayoutdto.copyWith(customerId: null);
    await session.db.updateRow<DrucklayoutDTO>(
      $drucklayoutdto,
      columns: [DrucklayoutDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [DrucklayoutDTO] and the given [DrucklayoutSalesOrderJT]
  /// by setting the [DrucklayoutSalesOrderJT]'s foreign key `drucklayoutId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> salesOrders(
    _i1.Session session,
    _i3.DrucklayoutSalesOrderJT drucklayoutSalesOrderJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSalesOrderJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSalesOrderJT.id');
    }

    var $drucklayoutSalesOrderJT =
        drucklayoutSalesOrderJT.copyWith(drucklayoutId: null);
    await session.db.updateRow<_i3.DrucklayoutSalesOrderJT>(
      $drucklayoutSalesOrderJT,
      columns: [_i3.DrucklayoutSalesOrderJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [DrucklayoutDTO] and the given [DrucklayoutSingleNutzenlayoutJT]
  /// by setting the [DrucklayoutSingleNutzenlayoutJT]'s foreign key `drucklayoutId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> singleNutzenlayouts(
    _i1.Session session,
    _i4.DrucklayoutSingleNutzenlayoutJT drucklayoutSingleNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }

    var $drucklayoutSingleNutzenlayoutJT =
        drucklayoutSingleNutzenlayoutJT.copyWith(drucklayoutId: null);
    await session.db.updateRow<_i4.DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [_i4.DrucklayoutSingleNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [DrucklayoutDTO] and the given [DrucklayoutMultiNutzenlayoutJT]
  /// by setting the [DrucklayoutMultiNutzenlayoutJT]'s foreign key `drucklayoutId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> multiNutzenlayouts(
    _i1.Session session,
    _i5.DrucklayoutMultiNutzenlayoutJT drucklayoutMultiNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }

    var $drucklayoutMultiNutzenlayoutJT =
        drucklayoutMultiNutzenlayoutJT.copyWith(drucklayoutId: null);
    await session.db.updateRow<_i5.DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [_i5.DrucklayoutMultiNutzenlayoutJT.t.drucklayoutId],
      transaction: transaction,
    );
  }
}
