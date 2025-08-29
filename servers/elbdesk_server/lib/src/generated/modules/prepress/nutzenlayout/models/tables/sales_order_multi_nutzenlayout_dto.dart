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
import '../../../../../modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_artwork_jt.dart'
    as _i4;
import '../../../../../modules/prepress/drucklayout/models/drucklayout_multi_nutzenlayout_jt.dart'
    as _i5;
import '../../../../../modules/prepress/artwork/models/artwork_artwork_master.dart'
    as _i6;

abstract class SalesOrderMultiNutzenlayoutDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SalesOrderMultiNutzenlayoutDTO._({
    this.id,
    required this.salesOrderId,
    this.salesOrder,
    required this.nutzenlayoutId,
    this.nutzenlayout,
    this.artworks,
    this.drucklayouts,
    required this.cellArtworkAssignments,
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

  factory SalesOrderMultiNutzenlayoutDTO({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    required int nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderMultiNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutMultiNutzenlayoutJT>? drucklayouts,
    required List<_i6.ArtworkArtworkMaster> cellArtworkAssignments,
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
  }) = _SalesOrderMultiNutzenlayoutDTOImpl;

  factory SalesOrderMultiNutzenlayoutDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalesOrderMultiNutzenlayoutDTO(
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
          ?.map((e) => _i4.SalesOrderMultiNutzenlayoutArtworkJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      drucklayouts: (jsonSerialization['drucklayouts'] as List?)
          ?.map((e) => _i5.DrucklayoutMultiNutzenlayoutJT.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      cellArtworkAssignments: (jsonSerialization['cellArtworkAssignments']
              as List)
          .map((e) =>
              _i6.ArtworkArtworkMaster.fromJson((e as Map<String, dynamic>)))
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

  static final t = SalesOrderMultiNutzenlayoutDTOTable();

  static const db = SalesOrderMultiNutzenlayoutDTORepository._();

  @override
  int? id;

  int salesOrderId;

  _i2.SalesOrderDTO? salesOrder;

  int nutzenlayoutId;

  _i3.NutzenlayoutDTO? nutzenlayout;

  List<_i4.SalesOrderMultiNutzenlayoutArtworkJT>? artworks;

  List<_i5.DrucklayoutMultiNutzenlayoutJT>? drucklayouts;

  List<_i6.ArtworkArtworkMaster> cellArtworkAssignments;

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

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalesOrderMultiNutzenlayoutDTO copyWith({
    int? id,
    int? salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    int? nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderMultiNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutMultiNutzenlayoutJT>? drucklayouts,
    List<_i6.ArtworkArtworkMaster>? cellArtworkAssignments,
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
      'cellArtworkAssignments':
          cellArtworkAssignments.toJson(valueToJson: (v) => v.toJson()),
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
      'cellArtworkAssignments': cellArtworkAssignments.toJson(
          valueToJson: (v) => v.toJsonForProtocol()),
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

  static SalesOrderMultiNutzenlayoutDTOInclude include({
    _i2.SalesOrderDTOInclude? salesOrder,
    _i3.NutzenlayoutDTOInclude? nutzenlayout,
    _i4.SalesOrderMultiNutzenlayoutArtworkJTIncludeList? artworks,
    _i5.DrucklayoutMultiNutzenlayoutJTIncludeList? drucklayouts,
  }) {
    return SalesOrderMultiNutzenlayoutDTOInclude._(
      salesOrder: salesOrder,
      nutzenlayout: nutzenlayout,
      artworks: artworks,
      drucklayouts: drucklayouts,
    );
  }

  static SalesOrderMultiNutzenlayoutDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderMultiNutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderMultiNutzenlayoutDTOTable>? orderByList,
    SalesOrderMultiNutzenlayoutDTOInclude? include,
  }) {
    return SalesOrderMultiNutzenlayoutDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalesOrderMultiNutzenlayoutDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalesOrderMultiNutzenlayoutDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalesOrderMultiNutzenlayoutDTOImpl
    extends SalesOrderMultiNutzenlayoutDTO {
  _SalesOrderMultiNutzenlayoutDTOImpl({
    int? id,
    required int salesOrderId,
    _i2.SalesOrderDTO? salesOrder,
    required int nutzenlayoutId,
    _i3.NutzenlayoutDTO? nutzenlayout,
    List<_i4.SalesOrderMultiNutzenlayoutArtworkJT>? artworks,
    List<_i5.DrucklayoutMultiNutzenlayoutJT>? drucklayouts,
    required List<_i6.ArtworkArtworkMaster> cellArtworkAssignments,
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
          cellArtworkAssignments: cellArtworkAssignments,
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

  /// Returns a shallow copy of this [SalesOrderMultiNutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalesOrderMultiNutzenlayoutDTO copyWith({
    Object? id = _Undefined,
    int? salesOrderId,
    Object? salesOrder = _Undefined,
    int? nutzenlayoutId,
    Object? nutzenlayout = _Undefined,
    Object? artworks = _Undefined,
    Object? drucklayouts = _Undefined,
    List<_i6.ArtworkArtworkMaster>? cellArtworkAssignments,
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
    return SalesOrderMultiNutzenlayoutDTO(
      id: id is int? ? id : this.id,
      salesOrderId: salesOrderId ?? this.salesOrderId,
      salesOrder: salesOrder is _i2.SalesOrderDTO?
          ? salesOrder
          : this.salesOrder?.copyWith(),
      nutzenlayoutId: nutzenlayoutId ?? this.nutzenlayoutId,
      nutzenlayout: nutzenlayout is _i3.NutzenlayoutDTO?
          ? nutzenlayout
          : this.nutzenlayout?.copyWith(),
      artworks: artworks is List<_i4.SalesOrderMultiNutzenlayoutArtworkJT>?
          ? artworks
          : this.artworks?.map((e0) => e0.copyWith()).toList(),
      drucklayouts: drucklayouts is List<_i5.DrucklayoutMultiNutzenlayoutJT>?
          ? drucklayouts
          : this.drucklayouts?.map((e0) => e0.copyWith()).toList(),
      cellArtworkAssignments: cellArtworkAssignments ??
          this.cellArtworkAssignments.map((e0) => e0.copyWith()).toList(),
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

class SalesOrderMultiNutzenlayoutDTOTable extends _i1.Table<int?> {
  SalesOrderMultiNutzenlayoutDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_sales_order_multi_nutzenlayout') {
    salesOrderId = _i1.ColumnInt(
      'salesOrderId',
      this,
    );
    nutzenlayoutId = _i1.ColumnInt(
      'nutzenlayoutId',
      this,
    );
    cellArtworkAssignments = _i1.ColumnSerializable(
      'cellArtworkAssignments',
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

  _i4.SalesOrderMultiNutzenlayoutArtworkJTTable? ___artworks;

  _i1.ManyRelation<_i4.SalesOrderMultiNutzenlayoutArtworkJTTable>? _artworks;

  _i5.DrucklayoutMultiNutzenlayoutJTTable? ___drucklayouts;

  _i1.ManyRelation<_i5.DrucklayoutMultiNutzenlayoutJTTable>? _drucklayouts;

  late final _i1.ColumnSerializable cellArtworkAssignments;

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
      field: SalesOrderMultiNutzenlayoutDTO.t.salesOrderId,
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
      field: SalesOrderMultiNutzenlayoutDTO.t.nutzenlayoutId,
      foreignField: _i3.NutzenlayoutDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.NutzenlayoutDTOTable(tableRelation: foreignTableRelation),
    );
    return _nutzenlayout!;
  }

  _i4.SalesOrderMultiNutzenlayoutArtworkJTTable get __artworks {
    if (___artworks != null) return ___artworks!;
    ___artworks = _i1.createRelationTable(
      relationFieldName: '__artworks',
      field: SalesOrderMultiNutzenlayoutDTO.t.id,
      foreignField: _i4
          .SalesOrderMultiNutzenlayoutArtworkJT.t.salesOrderMultiNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SalesOrderMultiNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___artworks!;
  }

  _i5.DrucklayoutMultiNutzenlayoutJTTable get __drucklayouts {
    if (___drucklayouts != null) return ___drucklayouts!;
    ___drucklayouts = _i1.createRelationTable(
      relationFieldName: '__drucklayouts',
      field: SalesOrderMultiNutzenlayoutDTO.t.id,
      foreignField:
          _i5.DrucklayoutMultiNutzenlayoutJT.t.salesOrderMultiNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.DrucklayoutMultiNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    return ___drucklayouts!;
  }

  _i1.ManyRelation<_i4.SalesOrderMultiNutzenlayoutArtworkJTTable> get artworks {
    if (_artworks != null) return _artworks!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'artworks',
      field: SalesOrderMultiNutzenlayoutDTO.t.id,
      foreignField: _i4
          .SalesOrderMultiNutzenlayoutArtworkJT.t.salesOrderMultiNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.SalesOrderMultiNutzenlayoutArtworkJTTable(
              tableRelation: foreignTableRelation),
    );
    _artworks = _i1.ManyRelation<_i4.SalesOrderMultiNutzenlayoutArtworkJTTable>(
      tableWithRelations: relationTable,
      table: _i4.SalesOrderMultiNutzenlayoutArtworkJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _artworks!;
  }

  _i1.ManyRelation<_i5.DrucklayoutMultiNutzenlayoutJTTable> get drucklayouts {
    if (_drucklayouts != null) return _drucklayouts!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'drucklayouts',
      field: SalesOrderMultiNutzenlayoutDTO.t.id,
      foreignField:
          _i5.DrucklayoutMultiNutzenlayoutJT.t.salesOrderMultiNutzenlayoutId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.DrucklayoutMultiNutzenlayoutJTTable(
              tableRelation: foreignTableRelation),
    );
    _drucklayouts = _i1.ManyRelation<_i5.DrucklayoutMultiNutzenlayoutJTTable>(
      tableWithRelations: relationTable,
      table: _i5.DrucklayoutMultiNutzenlayoutJTTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _drucklayouts!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        salesOrderId,
        nutzenlayoutId,
        cellArtworkAssignments,
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

class SalesOrderMultiNutzenlayoutDTOInclude extends _i1.IncludeObject {
  SalesOrderMultiNutzenlayoutDTOInclude._({
    _i2.SalesOrderDTOInclude? salesOrder,
    _i3.NutzenlayoutDTOInclude? nutzenlayout,
    _i4.SalesOrderMultiNutzenlayoutArtworkJTIncludeList? artworks,
    _i5.DrucklayoutMultiNutzenlayoutJTIncludeList? drucklayouts,
  }) {
    _salesOrder = salesOrder;
    _nutzenlayout = nutzenlayout;
    _artworks = artworks;
    _drucklayouts = drucklayouts;
  }

  _i2.SalesOrderDTOInclude? _salesOrder;

  _i3.NutzenlayoutDTOInclude? _nutzenlayout;

  _i4.SalesOrderMultiNutzenlayoutArtworkJTIncludeList? _artworks;

  _i5.DrucklayoutMultiNutzenlayoutJTIncludeList? _drucklayouts;

  @override
  Map<String, _i1.Include?> get includes => {
        'salesOrder': _salesOrder,
        'nutzenlayout': _nutzenlayout,
        'artworks': _artworks,
        'drucklayouts': _drucklayouts,
      };

  @override
  _i1.Table<int?> get table => SalesOrderMultiNutzenlayoutDTO.t;
}

class SalesOrderMultiNutzenlayoutDTOIncludeList extends _i1.IncludeList {
  SalesOrderMultiNutzenlayoutDTOIncludeList._({
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalesOrderMultiNutzenlayoutDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalesOrderMultiNutzenlayoutDTO.t;
}

class SalesOrderMultiNutzenlayoutDTORepository {
  const SalesOrderMultiNutzenlayoutDTORepository._();

  final attach = const SalesOrderMultiNutzenlayoutDTOAttachRepository._();

  final attachRow = const SalesOrderMultiNutzenlayoutDTOAttachRowRepository._();

  /// Returns a list of [SalesOrderMultiNutzenlayoutDTO]s matching the given query parameters.
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
  Future<List<SalesOrderMultiNutzenlayoutDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalesOrderMultiNutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderMultiNutzenlayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderMultiNutzenlayoutDTOInclude? include,
  }) async {
    return session.db.find<SalesOrderMultiNutzenlayoutDTO>(
      where: where?.call(SalesOrderMultiNutzenlayoutDTO.t),
      orderBy: orderBy?.call(SalesOrderMultiNutzenlayoutDTO.t),
      orderByList: orderByList?.call(SalesOrderMultiNutzenlayoutDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SalesOrderMultiNutzenlayoutDTO] matching the given query parameters.
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
  Future<SalesOrderMultiNutzenlayoutDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SalesOrderMultiNutzenlayoutDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalesOrderMultiNutzenlayoutDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalesOrderMultiNutzenlayoutDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SalesOrderMultiNutzenlayoutDTO>(
      where: where?.call(SalesOrderMultiNutzenlayoutDTO.t),
      orderBy: orderBy?.call(SalesOrderMultiNutzenlayoutDTO.t),
      orderByList: orderByList?.call(SalesOrderMultiNutzenlayoutDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SalesOrderMultiNutzenlayoutDTO] by its [id] or null if no such row exists.
  Future<SalesOrderMultiNutzenlayoutDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalesOrderMultiNutzenlayoutDTOInclude? include,
  }) async {
    return session.db.findById<SalesOrderMultiNutzenlayoutDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SalesOrderMultiNutzenlayoutDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SalesOrderMultiNutzenlayoutDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalesOrderMultiNutzenlayoutDTO>> insert(
    _i1.Session session,
    List<SalesOrderMultiNutzenlayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalesOrderMultiNutzenlayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalesOrderMultiNutzenlayoutDTO] and returns the inserted row.
  ///
  /// The returned [SalesOrderMultiNutzenlayoutDTO] will have its `id` field set.
  Future<SalesOrderMultiNutzenlayoutDTO> insertRow(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalesOrderMultiNutzenlayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalesOrderMultiNutzenlayoutDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalesOrderMultiNutzenlayoutDTO>> update(
    _i1.Session session,
    List<SalesOrderMultiNutzenlayoutDTO> rows, {
    _i1.ColumnSelections<SalesOrderMultiNutzenlayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalesOrderMultiNutzenlayoutDTO>(
      rows,
      columns: columns?.call(SalesOrderMultiNutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalesOrderMultiNutzenlayoutDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalesOrderMultiNutzenlayoutDTO> updateRow(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO row, {
    _i1.ColumnSelections<SalesOrderMultiNutzenlayoutDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalesOrderMultiNutzenlayoutDTO>(
      row,
      columns: columns?.call(SalesOrderMultiNutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalesOrderMultiNutzenlayoutDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalesOrderMultiNutzenlayoutDTO>> delete(
    _i1.Session session,
    List<SalesOrderMultiNutzenlayoutDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalesOrderMultiNutzenlayoutDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalesOrderMultiNutzenlayoutDTO].
  Future<SalesOrderMultiNutzenlayoutDTO> deleteRow(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalesOrderMultiNutzenlayoutDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalesOrderMultiNutzenlayoutDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutDTOTable>
        where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalesOrderMultiNutzenlayoutDTO>(
      where: where(SalesOrderMultiNutzenlayoutDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalesOrderMultiNutzenlayoutDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalesOrderMultiNutzenlayoutDTO>(
      where: where?.call(SalesOrderMultiNutzenlayoutDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalesOrderMultiNutzenlayoutDTOAttachRepository {
  const SalesOrderMultiNutzenlayoutDTOAttachRepository._();

  /// Creates a relation between this [SalesOrderMultiNutzenlayoutDTO] and the given [SalesOrderMultiNutzenlayoutArtworkJT]s
  /// by setting each [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `salesOrderMultiNutzenlayoutId` to refer to this [SalesOrderMultiNutzenlayoutDTO].
  Future<void> artworks(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayoutDTO,
    List<_i4.SalesOrderMultiNutzenlayoutArtworkJT>
        salesOrderMultiNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }
    if (salesOrderMultiNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutDTO.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT
            .map((e) => e.copyWith(
                salesOrderMultiNutzenlayoutId:
                    salesOrderMultiNutzenlayoutDTO.id))
            .toList();
    await session.db.update<_i4.SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [
        _i4.SalesOrderMultiNutzenlayoutArtworkJT.t.salesOrderMultiNutzenlayoutId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [SalesOrderMultiNutzenlayoutDTO] and the given [DrucklayoutMultiNutzenlayoutJT]s
  /// by setting each [DrucklayoutMultiNutzenlayoutJT]'s foreign key `salesOrderMultiNutzenlayoutId` to refer to this [SalesOrderMultiNutzenlayoutDTO].
  Future<void> drucklayouts(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayoutDTO,
    List<_i5.DrucklayoutMultiNutzenlayoutJT> drucklayoutMultiNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.any((e) => e.id == null)) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }
    if (salesOrderMultiNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutDTO.id');
    }

    var $drucklayoutMultiNutzenlayoutJT = drucklayoutMultiNutzenlayoutJT
        .map((e) => e.copyWith(
            salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutDTO.id))
        .toList();
    await session.db.update<_i5.DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [
        _i5.DrucklayoutMultiNutzenlayoutJT.t.salesOrderMultiNutzenlayoutId
      ],
      transaction: transaction,
    );
  }
}

class SalesOrderMultiNutzenlayoutDTOAttachRowRepository {
  const SalesOrderMultiNutzenlayoutDTOAttachRowRepository._();

  /// Creates a relation between the given [SalesOrderMultiNutzenlayoutDTO] and [SalesOrderDTO]
  /// by setting the [SalesOrderMultiNutzenlayoutDTO]'s foreign key `salesOrderId` to refer to the [SalesOrderDTO].
  Future<void> salesOrder(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayoutDTO,
    _i2.SalesOrderDTO salesOrder, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutDTO.id');
    }
    if (salesOrder.id == null) {
      throw ArgumentError.notNull('salesOrder.id');
    }

    var $salesOrderMultiNutzenlayoutDTO =
        salesOrderMultiNutzenlayoutDTO.copyWith(salesOrderId: salesOrder.id);
    await session.db.updateRow<SalesOrderMultiNutzenlayoutDTO>(
      $salesOrderMultiNutzenlayoutDTO,
      columns: [SalesOrderMultiNutzenlayoutDTO.t.salesOrderId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [SalesOrderMultiNutzenlayoutDTO] and [NutzenlayoutDTO]
  /// by setting the [SalesOrderMultiNutzenlayoutDTO]'s foreign key `nutzenlayoutId` to refer to the [NutzenlayoutDTO].
  Future<void> nutzenlayout(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayoutDTO,
    _i3.NutzenlayoutDTO nutzenlayout, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutDTO.id');
    }
    if (nutzenlayout.id == null) {
      throw ArgumentError.notNull('nutzenlayout.id');
    }

    var $salesOrderMultiNutzenlayoutDTO = salesOrderMultiNutzenlayoutDTO
        .copyWith(nutzenlayoutId: nutzenlayout.id);
    await session.db.updateRow<SalesOrderMultiNutzenlayoutDTO>(
      $salesOrderMultiNutzenlayoutDTO,
      columns: [SalesOrderMultiNutzenlayoutDTO.t.nutzenlayoutId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [SalesOrderMultiNutzenlayoutDTO] and the given [SalesOrderMultiNutzenlayoutArtworkJT]
  /// by setting the [SalesOrderMultiNutzenlayoutArtworkJT]'s foreign key `salesOrderMultiNutzenlayoutId` to refer to this [SalesOrderMultiNutzenlayoutDTO].
  Future<void> artworks(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayoutDTO,
    _i4.SalesOrderMultiNutzenlayoutArtworkJT
        salesOrderMultiNutzenlayoutArtworkJT, {
    _i1.Transaction? transaction,
  }) async {
    if (salesOrderMultiNutzenlayoutArtworkJT.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutArtworkJT.id');
    }
    if (salesOrderMultiNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutDTO.id');
    }

    var $salesOrderMultiNutzenlayoutArtworkJT =
        salesOrderMultiNutzenlayoutArtworkJT.copyWith(
            salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutDTO.id);
    await session.db.updateRow<_i4.SalesOrderMultiNutzenlayoutArtworkJT>(
      $salesOrderMultiNutzenlayoutArtworkJT,
      columns: [
        _i4.SalesOrderMultiNutzenlayoutArtworkJT.t.salesOrderMultiNutzenlayoutId
      ],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [SalesOrderMultiNutzenlayoutDTO] and the given [DrucklayoutMultiNutzenlayoutJT]
  /// by setting the [DrucklayoutMultiNutzenlayoutJT]'s foreign key `salesOrderMultiNutzenlayoutId` to refer to this [SalesOrderMultiNutzenlayoutDTO].
  Future<void> drucklayouts(
    _i1.Session session,
    SalesOrderMultiNutzenlayoutDTO salesOrderMultiNutzenlayoutDTO,
    _i5.DrucklayoutMultiNutzenlayoutJT drucklayoutMultiNutzenlayoutJT, {
    _i1.Transaction? transaction,
  }) async {
    if (drucklayoutMultiNutzenlayoutJT.id == null) {
      throw ArgumentError.notNull('drucklayoutMultiNutzenlayoutJT.id');
    }
    if (salesOrderMultiNutzenlayoutDTO.id == null) {
      throw ArgumentError.notNull('salesOrderMultiNutzenlayoutDTO.id');
    }

    var $drucklayoutMultiNutzenlayoutJT =
        drucklayoutMultiNutzenlayoutJT.copyWith(
            salesOrderMultiNutzenlayoutId: salesOrderMultiNutzenlayoutDTO.id);
    await session.db.updateRow<_i5.DrucklayoutMultiNutzenlayoutJT>(
      $drucklayoutMultiNutzenlayoutJT,
      columns: [
        _i5.DrucklayoutMultiNutzenlayoutJT.t.salesOrderMultiNutzenlayoutId
      ],
      transaction: transaction,
    );
  }
}
