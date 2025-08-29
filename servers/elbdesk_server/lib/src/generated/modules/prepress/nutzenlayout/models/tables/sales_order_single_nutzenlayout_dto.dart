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
import '../../../../../modules/sales/sales_order/models/sales_order.dart'
    as _i2;
import '../../../../../modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i3;
import '../../../../../modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_artwork_jt.dart'
    as _i4;
import '../../../../../modules/prepress/drucklayout/models/drucklayout_single_nutzenlayout_jt.dart'
    as _i5;

abstract class SalesOrderSingleNutzenlayoutDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SalesOrderSingleNutzenlayoutDTO._({
    this.id,
    required this.salesOrderId,
    this.salesOrder,
    required this.nutzenlayoutId,
    this.nutzenlayout,
    this.artworks,
    this.drucklayouts,
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

  factory SalesOrderSingleNutzenlayoutDTO({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    required int nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts,
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
  }) = _SalesOrderSingleNutzenlayoutDTOImpl;

  factory SalesOrderSingleNutzenlayoutDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderSingleNutzenlayoutDTO(
      id: jsonSerialization['id'] as int?,
      salesOrderId: jsonSerialization['salesOrderId'] as int,
      salesOrder: jsonSerialization['salesOrder'] == null
          ? null
          : _i2.SalesOrderDTO.fromJson(
              (jsonSerialization['salesOrder'] as Map<String, dynamic>)),
      nutzenlayoutId: jsonSerialization['nutzenlayoutId'] as int,
      nutzenlayout: jsonSerialization['nutzenlayout'] == null
          ? null
          : _i3.NutzenlayoutDTO.fromJson(
              (jsonSerialization['nutzenlayout'] as Map<String, dynamic>)),
      artworks: (jsonSerialization['artworks'] as List?)
          ?.map((e) => _i4.SalesOrderSingleNutzenlayoutArtworkJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      drucklayouts: (jsonSerialization['drucklayouts'] as List?)
          ?.map((e) => _i5.DrucklayoutSingleNutzenlayoutJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
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

  static final t = SalesOrderSingleNutzenlayoutDTOTable();

  static const db = SalesOrderSingleNutzenlayoutDTORepository._();

  @override
  int? id;

  int salesOrderId;

  _i2.SalesOrderDTO? salesOrder;

  int nutzenlayoutId;

  _i3.NutzenlayoutDTO? nutzenlayout;

  List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks;

  List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts;

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

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderSingleNutzenlayoutDTO copyWith({
    int? id,
    int? salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    int? nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts,
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
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJson(),
      'nutzenlayoutId': nutzenlayoutId,
      if (nutzenlayout != null) 'nutzenlayout': nutzenlayout?.toJson(),
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJson()),
      if (drucklayouts != null)
        'drucklayouts': drucklayouts?.toJson(valueToJson: (v) => v.toJson()),
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
      'salesOrderId': salesOrderId,
      if (salesOrder != null) 'salesOrder': salesOrder?.toJsonForProtocol(),
      'nutzenlayoutId': nutzenlayoutId,
      if (nutzenlayout != null)
        'nutzenlayout': nutzenlayout?.toJsonForProtocol(),
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (drucklayouts != null)
        'drucklayouts':
            drucklayouts?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static SalesOrderSingleNutzenlayoutDTOInclude include({
    _i2.SalesOrderDTOInclude? salesOrder,
    _i3.NutzenlayoutDTOInclude? nutzenlayout,
    _i4.SalesOrderSingleNutzenlayoutArtworkJTIncludeList? artworks,
    _i5.DrucklayoutSingleNutzenlayoutJTIncludeList? drucklayouts,
  }) {
    return SalesOrderSingleNutzenlayoutDTOInclude._(
      salesOrder: salesOrder,
      nutzenlayout: nutzenlayout,
      artworks: artworks,
      drucklayouts: drucklayouts,
    );
  }

  static SalesOrderSingleNutzenlayoutDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderSingleNutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderSingleNutzenlayoutDTOTable>? orderByList,
    SalesOrderSingleNutzenlayoutDTOInclude? include,
  }) {
    return SalesOrderSingleNutzenlayoutDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalesOrderSingleNutzenlayoutDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalesOrderSingleNutzenlayoutDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderSingleNutzenlayoutDTOImpl
    extends SalesOrderSingleNutzenlayoutDTO {
  _SalesOrderSingleNutzenlayoutDTOImpl({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    required int nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutSingleNutzenlayoutJT>? drucklayouts,
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
          salesOrderId: salesOrderId,
          salesOrder: salesOrder,
          nutzenlayoutId: nutzenlayoutId,
          nutzenlayout: nutzenlayout,
          artworks: artworks,
          drucklayouts: drucklayouts,
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

  /// Returns a shallow copy of this [SalesOrderSingleNutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderSingleNutzenlayoutDTO copyWith({
    Object? id = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    int? nutzenlayoutId,
    Object? nutzenlayout = _Undefined,
    Object? artworks = _Undefined,
    Object? drucklayouts = _Undefined,
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
    return SalesOrderSingleNutzenlayoutDTO(
      id: id is int? ? id : this.id,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i2.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      nutzenlayoutId: nutzenlayoutId ?? this.nutzenlayoutId,
      nutzenlayout: nutzenlayout is _i3.NutzenlayoutDTO?
          ? nutzenlayout
          : this.nutzenlayout?.copyWith(),
      artworks: artworks is List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>?
          ? artworks
          : this.artworks?.map((e0) => e0.copyWith()).toList(),
      drucklayouts: drucklayouts is List<_i5.DrucklayoutSingleNutzenlayoutJT>?
          ? drucklayouts
          : this.drucklayouts?.map((e0) => e0.copyWith()).toList(),
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

class SalesOrderSingleNutzenlayoutDTOTable extends _i1.Table<int?> {
  SalesOrderSingleNutzenlayoutDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_sales_order_single_nutzenlayout') {
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    nutzenlayoutId = _i1.ColumnInt(
      'nutzenlayoutId',
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

  late final _i1.ColumnInt salesOrderId;

  _i2.SalesOrderDTOTable? _salesOrder;

  late final _i1.ColumnInt nutzenlayoutId;

  _i3.NutzenlayoutDTOTable? _nutzenlayout;

  _i4.SalesOrderSingleNutzenlayoutArtworkJTTable? ___artworks;

  _i1.ManyRelation<_i4.SalesOrderSingleNutzenlayoutArtworkJTTable>? _artworks;

  _i5.DrucklayoutSingleNutzenlayoutJTTable? ___drucklayouts;

  _i1.ManyRelation<_i5.DrucklayoutSingleNutzenlayoutJTTable>? _drucklayouts;

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

  _i2.SalesOrderDTOTable get salesOrder {
    if (_salesOrder != null) return _salesOrder!;
    _salesOrder = _i1.createRelationTable(
      relationFieldName: 'salesOrder',
      field: SalesOrderSingleNutzenlayoutDTO.t.salesOrderId,
      foreignField: _i2.SalesOrderDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.SalesOrderDTOTable(tableRelation: foreignTableRelation),
    );
    return _salesOrder!;
  }

  _i3.NutzenlayoutDTOTable get nutzenlayout {
    if (_nutzenlayout != null) return _nutzenlayout!;
    _nutzenlayout = _i1.createRelationTable(
      relationFieldName: 'nutzenlayout',
      field: SalesOrderSingleNutzenlayoutDTO.t.nutzenlayoutId,
      foreignField: _i3.NutzenlayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.NutzenlayoutDTOTable(tableRelation: foreignTableRelation),
    );
    return _nutzenlayout!;
  }

  _i4.SalesOrderSingleNutzenlayoutArtworkJTTable get __artworks {
    if (___artworks != null) return ___artworks!;
    ___artworks = _i1.createRelationTable(
      relationFieldName: '__artworks',
      field: SalesOrderSingleNutzenlayoutDTO.t.id,
      foreignField: _i4.SalesOrderSingleNutzenlayoutArtworkJT.t
          .salesOrderSingleNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SalesOrderSingleNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___artworks!;
  }

  _i5.DrucklayoutSingleNutzenlayoutJTTable get __drucklayouts {
    if (___drucklayouts != null) return ___drucklayouts!;
    ___drucklayouts = _i1.createRelationTable(
      relationFieldName: '__drucklayouts',
      field: SalesOrderSingleNutzenlayoutDTO.t.id,
      foreignField:
          _i5.DrucklayoutSingleNutzenlayoutJT.t.salesOrderSingleNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.DrucklayoutSingleNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___drucklayouts!;
  }

  _i1.ManyRelation<_i4.SalesOrderSingleNutzenlayoutArtworkJTTable>
      get artworks {
    if (_artworks != null) return _artworks!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'artworks',
      field: SalesOrderSingleNutzenlayoutDTO.t.id,
      foreignField: _i4.SalesOrderSingleNutzenlayoutArtworkJT.t
          .salesOrderSingleNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SalesOrderSingleNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    _artworks =
        _i1.ManyRelation<_i4.SalesOrderSingleNutzenlayoutArtworkJTTable>(
      tableWithRelations: relationTable,
      table: _i4.SalesOrderSingleNutzenlayoutArtworkJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _artworks!;
  }

  _i1.ManyRelation<_i5.DrucklayoutSingleNutzenlayoutJTTable> get drucklayouts {
    if (_drucklayouts != null) return _drucklayouts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'drucklayouts',
      field: SalesOrderSingleNutzenlayoutDTO.t.id,
      foreignField:
          _i5.DrucklayoutSingleNutzenlayoutJT.t.salesOrderSingleNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.DrucklayoutSingleNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    _drucklayouts = _i1.ManyRelation<_i5.DrucklayoutSingleNutzenlayoutJTTable>(
      tableWithRelations: relationTable,
      table: _i5.DrucklayoutSingleNutzenlayoutJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _drucklayouts!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        salesOrderId,
        nutzenlayoutId,
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
    if (relationField == 'salesOrder') {
      return salesOrder;
    }
    if (relationField == 'nutzenlayout') {
      return nutzenlayout;
    }
    if (relationField == 'artworks') {
      return __artworks;
    }
    if (relationField == 'drucklayouts') {
      return __drucklayouts;
    }
    return null;
  }
}

class SalesOrderSingleNutzenlayoutDTOInclude extends _i1.IncludeObject {
  SalesOrderSingleNutzenlayoutDTOInclude._({
    _i2.SalesOrderDTOInclude? salesOrder,
    _i3.NutzenlayoutDTOInclude? nutzenlayout,
    _i4.SalesOrderSingleNutzenlayoutArtworkJTIncludeList? artworks,
    _i5.DrucklayoutSingleNutzenlayoutJTIncludeList? drucklayouts,
  }) {
    _salesOrder = salesOrder;
    _nutzenlayout = nutzenlayout;
    _artworks = artworks;
    _drucklayouts = drucklayouts;
  }

  _i2.SalesOrderDTOInclude? _salesOrder;

  _i3.NutzenlayoutDTOInclude? _nutzenlayout;

  _i4.SalesOrderSingleNutzenlayoutArtworkJTIncludeList? _artworks;

  _i5.DrucklayoutSingleNutzenlayoutJTIncludeList? _drucklayouts;

  @override
  Map<String, _i1.Include?> get includes => {
        'salesOrder': _salesOrder,
        'nutzenlayout': _nutzenlayout,
        'artworks': _artworks,
        'drucklayouts': _drucklayouts,
      };

  @override
  _i1.Table<int?> get table => SalesOrderSingleNutzenlayoutDTO.t;
}

class SalesOrderSingleNutzenlayoutDTOIncludeList extends _i1.IncludeList {
  SalesOrderSingleNutzenlayoutDTOIncludeList._({
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalesOrderSingleNutzenlayoutDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalesOrderSingleNutzenlayoutDTO.t;
}

class SalesOrderSingleNutzenlayoutDTORepository {
  const SalesOrderSingleNutzenlayoutDTORepository._();

  final attach = const SalesOrderSingleNutzenlayoutDTOAttachRepository._();

  final attachRow =
      const SalesOrderSingleNutzenlayoutDTOAttachRowRepository._();

  /// Returns a list of [SalesOrderSingleNutzenlayoutDTO]s matching the given query parameters.
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
  Future<List<SalesOrderSingleNutzenlayoutDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderSingleNutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderSingleNutzenlayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderSingleNutzenlayoutDTOInclude? include,
  }) async {
    return session.db.find<SalesOrderSingleNutzenlayoutDTO>(
      where: where?.call(SalesOrderSingleNutzenlayoutDTO.t),
      orderBy: orderBy?.call(SalesOrderSingleNutzenlayoutDTO.t),
      orderByList: orderByList?.call(SalesOrderSingleNutzenlayoutDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SalesOrderSingleNutzenlayoutDTO] matching the given query parameters.
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
  Future<SalesOrderSingleNutzenlayoutDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SalesOrderSingleNutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderSingleNutzenlayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderSingleNutzenlayoutDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SalesOrderSingleNutzenlayoutDTO>(
      where: where?.call(SalesOrderSingleNutzenlayoutDTO.t),
      orderBy: orderBy?.call(SalesOrderSingleNutzenlayoutDTO.t),
      orderByList: orderByList?.call(SalesOrderSingleNutzenlayoutDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SalesOrderSingleNutzenlayoutDTO] by its [id] or null if no such row exists.
  Future<SalesOrderSingleNutzenlayoutDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalesOrderSingleNutzenlayoutDTOInclude? include,
  }) async {
    return session.db.findById<SalesOrderSingleNutzenlayoutDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SalesOrderSingleNutzenlayoutDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SalesOrderSingleNutzenlayoutDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalesOrderSingleNutzenlayoutDTO>> insert(
    _i1.Session session,
    List<SalesOrderSingleNutzenlayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalesOrderSingleNutzenlayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalesOrderSingleNutzenlayoutDTO] and returns the inserted row.
  ///
  /// The returned [SalesOrderSingleNutzenlayoutDTO] will have its `id` field set.
  Future<SalesOrderSingleNutzenlayoutDTO> insertRow(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalesOrderSingleNutzenlayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalesOrderSingleNutzenlayoutDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalesOrderSingleNutzenlayoutDTO>> update(
    _i1.Session session,
    List<SalesOrderSingleNutzenlayoutDTO> rows, {
    _i1.ColumnSelections<SalesOrderSingleNutzenlayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalesOrderSingleNutzenlayoutDTO>(
      rows,
      columns: columns?.call(SalesOrderSingleNutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalesOrderSingleNutzenlayoutDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalesOrderSingleNutzenlayoutDTO> updateRow(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO row, {
    _i1.ColumnSelections<SalesOrderSingleNutzenlayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalesOrderSingleNutzenlayoutDTO>(
      row,
      columns: columns?.call(SalesOrderSingleNutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalesOrderSingleNutzenlayoutDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalesOrderSingleNutzenlayoutDTO>> delete(
    _i1.Session session,
    List<SalesOrderSingleNutzenlayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalesOrderSingleNutzenlayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalesOrderSingleNutzenlayoutDTO].
  Future<SalesOrderSingleNutzenlayoutDTO> deleteRow(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalesOrderSingleNutzenlayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalesOrderSingleNutzenlayoutDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutDTOTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalesOrderSingleNutzenlayoutDTO>(
      where: where(SalesOrderSingleNutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderSingleNutzenlayoutDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalesOrderSingleNutzenlayoutDTO>(
      where: where?.call(SalesOrderSingleNutzenlayoutDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalesOrderSingleNutzenlayoutDTOAttachRepository {
  const SalesOrderSingleNutzenlayoutDTOAttachRepository._();

  /// Creates a relation between this [SalesOrderSingleNutzenlayoutDTO] and the given [SalesOrderSingleNutzenlayoutArtworkJT]s
  /// by setting each [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `salesOrderSingleNutzenlayoutId` to refer to this [SalesOrderSingleNutzenlayoutDTO].
  Future<void> artworks(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayoutDTO,
    List<_i4.SalesOrderSingleNutzenlayoutArtworkJT>
        salesOrderSingleNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }
    if (salesOrderSingleNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutDTO.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT
            .map((e) => e.copyWith(
                salesOrderSingleNutzenlayoutId:
                    salesOrderSingleNutzenlayoutDTO.id))
            .toList();
    await session.db.update<_i4.SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [
        _i4.SalesOrderSingleNutzenlayoutArtworkJT.t
            .salesOrderSingleNutzenlayoutId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [SalesOrderSingleNutzenlayoutDTO] and the given [DrucklayoutSingleNutzenlayoutJT]s
  /// by setting each [DrucklayoutSingleNutzenlayoutJT]'s foreign key `salesOrderSingleNutzenlayoutId` to refer to this [SalesOrderSingleNutzenlayoutDTO].
  Future<void> drucklayouts(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayoutDTO,
    List<_i5.DrucklayoutSingleNutzenlayoutJT> drucklayoutSingleNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }
    if (salesOrderSingleNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutDTO.id');
    }

    var $drucklayoutSingleNutzenlayoutJT = drucklayoutSingleNutzenlayoutJT
        .map((e) => e.copyWith(
            salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayoutDTO.id))
        .toList();
    await session.db.update<_i5.DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [
        _i5.DrucklayoutSingleNutzenlayoutJT.t.salesOrderSingleNutzenlayoutId
      ],
      transaction: transaction,
    );
  }
}

class SalesOrderSingleNutzenlayoutDTOAttachRowRepository {
  const SalesOrderSingleNutzenlayoutDTOAttachRowRepository._();

  /// Creates a relation between the given [SalesOrderSingleNutzenlayoutDTO] and [SalesOrderDTO]
  /// by setting the [SalesOrderSingleNutzenlayoutDTO]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayoutDTO,
    _i2.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutDTO.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $salesOrderSingleNutzenlayoutDTO =
        salesOrderSingleNutzenlayoutDTO.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<SalesOrderSingleNutzenlayoutDTO>(
      $salesOrderSingleNutzenlayoutDTO,
      columns: [SalesOrderSingleNutzenlayoutDTO.t.salesOrderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderSingleNutzenlayoutDTO] and [NutzenlayoutDTO]
  /// by setting the [SalesOrderSingleNutzenlayoutDTO]'s foreign key `nutzenlayoutId` to refer to the [NutzenlayoutDTO].
  Future<void> nutzenlayout(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayoutDTO,
    _i3.NutzenlayoutDTO nutzenlayout, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutDTO.id');
    }
    if (nutzenlayout.id == null) {
      throw ArgumentError.notNull('nutzenlayout.id');
    }

    var $salesOrderSingleNutzenlayoutDTO = salesOrderSingleNutzenlayoutDTO
        .copyWith(nutzenlayoutId: nutzenlayout.id);
    await session.db.updateRow<SalesOrderSingleNutzenlayoutDTO>(
      $salesOrderSingleNutzenlayoutDTO,
      columns: [SalesOrderSingleNutzenlayoutDTO.t.nutzenlayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [SalesOrderSingleNutzenlayoutDTO] and the given [SalesOrderSingleNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderSingleNutzenlayoutArtworkJT]'s foreign key `salesOrderSingleNutzenlayoutId` to refer to this [SalesOrderSingleNutzenlayoutDTO].
  Future<void> artworks(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayoutDTO,
    _i4.SalesOrderSingleNutzenlayoutArtworkJT
        salesOrderSingleNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderSingleNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutArtworkJT.id');
    }
    if (salesOrderSingleNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutDTO.id');
    }

    var $salesOrderSingleNutzenlayoutArtworkJT =
        salesOrderSingleNutzenlayoutArtworkJT.copyWith(
            salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayoutDTO.id);
    await session.db.updateRow<_i4.SalesOrderSingleNutzenlayoutArtworkJT>(
      $salesOrderSingleNutzenlayoutArtworkJT,
      columns: [
        _i4.SalesOrderSingleNutzenlayoutArtworkJT.t
            .salesOrderSingleNutzenlayoutId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [SalesOrderSingleNutzenlayoutDTO] and the given [DrucklayoutSingleNutzenlayoutJT]
  /// by setting the [DrucklayoutSingleNutzenlayoutJT]'s foreign key `salesOrderSingleNutzenlayoutId` to refer to this [SalesOrderSingleNutzenlayoutDTO].
  Future<void> drucklayouts(
    _i1.Session session,
    SalesOrderSingleNutzenlayoutDTO salesOrderSingleNutzenlayoutDTO,
    _i5.DrucklayoutSingleNutzenlayoutJT drucklayoutSingleNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutSingleNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutSingleNutzenlayoutJT.id');
    }
    if (salesOrderSingleNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderSingleNutzenlayoutDTO.id');
    }

    var $drucklayoutSingleNutzenlayoutJT =
        drucklayoutSingleNutzenlayoutJT.copyWith(
            salesOrderSingleNutzenlayoutId: salesOrderSingleNutzenlayoutDTO.id);
    await session.db.updateRow<_i5.DrucklayoutSingleNutzenlayoutJT>(
      $drucklayoutSingleNutzenlayoutJT,
      columns: [
        _i5.DrucklayoutSingleNutzenlayoutJT.t.salesOrderSingleNutzenlayoutId
      ],
      transaction: transaction,
    );
  }
}
