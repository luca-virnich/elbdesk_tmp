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
import '../../../../modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i3;
import '../../../../modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i4;
import '../../../../modules/prepress/trapping/models/trapping.dart' as _i5;
import '../../../../modules/prepress/layer/models/artwork_layer.dart' as _i6;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i7;

abstract class ArtworkTemplateDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkTemplateDTO._({
    this.id,
    required this.description,
    this.customerId,
    this.customer,
    required this.artworkTemplateSelectionId,
    this.artworkTemplateSelection,
    required this.artworkTemplatePreSelectionId,
    this.artworkTemplatePreSelection,
    required this.trapping,
    required this.layers,
    required this.anschnitt,
    required this.colors,
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

  factory ArtworkTemplateDTO({
    int? id,
    required String description,
    int? customerId,
    _i2.CustomerDTO? customer,
    required int artworkTemplateSelectionId,
    _i3.ArtworkTemplateSelectionDTO? artworkTemplateSelection,
    required int artworkTemplatePreSelectionId,
    _i4.ArtworkTemplatePreSelectionDTO? artworkTemplatePreSelection,
    required _i5.TrappingDTO trapping,
    required List<_i6.ArtworkLayerDTO> layers,
    required double anschnitt,
    required List<_i7.ArtworkColorDTO> colors,
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
  }) = _ArtworkTemplateDTOImpl;

  factory ArtworkTemplateDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkTemplateDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      customerId: jsonSerialization['customerId'] as int?,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      artworkTemplateSelectionId:
          jsonSerialization['artworkTemplateSelectionId'] as int,
      artworkTemplateSelection:
          jsonSerialization['artworkTemplateSelection'] == null
              ? null
              : _i3.ArtworkTemplateSelectionDTO.fromJson(
                  (jsonSerialization['artworkTemplateSelection']
                      as Map<String, dynamic>)),
      artworkTemplatePreSelectionId:
          jsonSerialization['artworkTemplatePreSelectionId'] as int,
      artworkTemplatePreSelection:
          jsonSerialization['artworkTemplatePreSelection'] == null
              ? null
              : _i4.ArtworkTemplatePreSelectionDTO.fromJson(
                  (jsonSerialization['artworkTemplatePreSelection']
                      as Map<String, dynamic>)),
      trapping: _i5.TrappingDTO.fromJson(
          (jsonSerialization['trapping'] as Map<String, dynamic>)),
      layers: (jsonSerialization['layers'] as List)
          .map((e) => _i6.ArtworkLayerDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      anschnitt: (jsonSerialization['anschnitt'] as num).toDouble(),
      colors: (jsonSerialization['colors'] as List)
          .map((e) => _i7.ArtworkColorDTO.fromJson((e as Map<String, dynamic>)))
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

  static final t = ArtworkTemplateDTOTable();

  static const db = ArtworkTemplateDTORepository._();

  @override
  int? id;

  String description;

  int? customerId;

  _i2.CustomerDTO? customer;

  int artworkTemplateSelectionId;

  _i3.ArtworkTemplateSelectionDTO? artworkTemplateSelection;

  int artworkTemplatePreSelectionId;

  _i4.ArtworkTemplatePreSelectionDTO? artworkTemplatePreSelection;

  _i5.TrappingDTO trapping;

  List<_i6.ArtworkLayerDTO> layers;

  double anschnitt;

  List<_i7.ArtworkColorDTO> colors;

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

  /// Returns a shallow copy of this [ArtworkTemplateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkTemplateDTO copyWith({
    int? id,
    String? description,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? artworkTemplateSelectionId,
    _i3.ArtworkTemplateSelectionDTO? artworkTemplateSelection,
    int? artworkTemplatePreSelectionId,
    _i4.ArtworkTemplatePreSelectionDTO? artworkTemplatePreSelection,
    _i5.TrappingDTO? trapping,
    List<_i6.ArtworkLayerDTO>? layers,
    double? anschnitt,
    List<_i7.ArtworkColorDTO>? colors,
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
      'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'artworkTemplateSelectionId': artworkTemplateSelectionId,
      if (artworkTemplateSelection != null)
        'artworkTemplateSelection': artworkTemplateSelection?.toJson(),
      'artworkTemplatePreSelectionId': artworkTemplatePreSelectionId,
      if (artworkTemplatePreSelection != null)
        'artworkTemplatePreSelection': artworkTemplatePreSelection?.toJson(),
      'trapping': trapping.toJson(),
      'layers': layers.toJson(valueToJson: (v) => v.toJson()),
      'anschnitt': anschnitt,
      'colors': colors.toJson(valueToJson: (v) => v.toJson()),
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
      'description': description,
      if (customerId != null) 'customerId': customerId,
      if (customer != null) 'customer': customer?.toJsonForProtocol(),
      'artworkTemplateSelectionId': artworkTemplateSelectionId,
      if (artworkTemplateSelection != null)
        'artworkTemplateSelection':
            artworkTemplateSelection?.toJsonForProtocol(),
      'artworkTemplatePreSelectionId': artworkTemplatePreSelectionId,
      if (artworkTemplatePreSelection != null)
        'artworkTemplatePreSelection':
            artworkTemplatePreSelection?.toJsonForProtocol(),
      'trapping': trapping.toJsonForProtocol(),
      'layers': layers.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'anschnitt': anschnitt,
      'colors': colors.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static ArtworkTemplateDTOInclude include({
    _i2.CustomerDTOInclude? customer,
    _i3.ArtworkTemplateSelectionDTOInclude? artworkTemplateSelection,
    _i4.ArtworkTemplatePreSelectionDTOInclude? artworkTemplatePreSelection,
  }) {
    return ArtworkTemplateDTOInclude._(
      customer: customer,
      artworkTemplateSelection: artworkTemplateSelection,
      artworkTemplatePreSelection: artworkTemplatePreSelection,
    );
  }

  static ArtworkTemplateDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkTemplateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplateDTOTable>? orderByList,
    ArtworkTemplateDTOInclude? include,
  }) {
    return ArtworkTemplateDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkTemplateDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkTemplateDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkTemplateDTOImpl extends ArtworkTemplateDTO {
  _ArtworkTemplateDTOImpl({
    int? id,
    required String description,
    int? customerId,
    _i2.CustomerDTO? customer,
    required int artworkTemplateSelectionId,
    _i3.ArtworkTemplateSelectionDTO? artworkTemplateSelection,
    required int artworkTemplatePreSelectionId,
    _i4.ArtworkTemplatePreSelectionDTO? artworkTemplatePreSelection,
    required _i5.TrappingDTO trapping,
    required List<_i6.ArtworkLayerDTO> layers,
    required double anschnitt,
    required List<_i7.ArtworkColorDTO> colors,
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
          description: description,
          customerId: customerId,
          customer: customer,
          artworkTemplateSelectionId: artworkTemplateSelectionId,
          artworkTemplateSelection: artworkTemplateSelection,
          artworkTemplatePreSelectionId: artworkTemplatePreSelectionId,
          artworkTemplatePreSelection: artworkTemplatePreSelection,
          trapping: trapping,
          layers: layers,
          anschnitt: anschnitt,
          colors: colors,
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

  /// Returns a shallow copy of this [ArtworkTemplateDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkTemplateDTO copyWith({
    Object? id = _Undefined,
    String? description,
    Object? customerId = _Undefined,
    Object? customer = _Undefined,
    int? artworkTemplateSelectionId,
    Object? artworkTemplateSelection = _Undefined,
    int? artworkTemplatePreSelectionId,
    Object? artworkTemplatePreSelection = _Undefined,
    _i5.TrappingDTO? trapping,
    List<_i6.ArtworkLayerDTO>? layers,
    double? anschnitt,
    List<_i7.ArtworkColorDTO>? colors,
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
    return ArtworkTemplateDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      customerId: customerId is int? ? customerId : this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      artworkTemplateSelectionId:
          artworkTemplateSelectionId ?? this.artworkTemplateSelectionId,
      artworkTemplateSelection:
          artworkTemplateSelection is _i3.ArtworkTemplateSelectionDTO?
              ? artworkTemplateSelection
              : this.artworkTemplateSelection?.copyWith(),
      artworkTemplatePreSelectionId:
          artworkTemplatePreSelectionId ?? this.artworkTemplatePreSelectionId,
      artworkTemplatePreSelection:
          artworkTemplatePreSelection is _i4.ArtworkTemplatePreSelectionDTO?
              ? artworkTemplatePreSelection
              : this.artworkTemplatePreSelection?.copyWith(),
      trapping: trapping ?? this.trapping.copyWith(),
      layers: layers ?? this.layers.map((e0) => e0.copyWith()).toList(),
      anschnitt: anschnitt ?? this.anschnitt,
      colors: colors ?? this.colors.map((e0) => e0.copyWith()).toList(),
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

class ArtworkTemplateDTOTable extends _i1.Table<int?> {
  ArtworkTemplateDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_template') {
    description = _i1.ColumnString(
      'description',
      this,
    );
    customerId = _i1.ColumnInt(
      'customerId',
      this,
    );
    artworkTemplateSelectionId = _i1.ColumnInt(
      'artworkTemplateSelectionId',
      this,
    );
    artworkTemplatePreSelectionId = _i1.ColumnInt(
      'artworkTemplatePreSelectionId',
      this,
    );
    trapping = _i1.ColumnSerializable(
      'trapping',
      this,
    );
    layers = _i1.ColumnSerializable(
      'layers',
      this,
    );
    anschnitt = _i1.ColumnDouble(
      'anschnitt',
      this,
    );
    colors = _i1.ColumnSerializable(
      'colors',
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

  late final _i1.ColumnString description;

  late final _i1.ColumnInt customerId;

  _i2.CustomerDTOTable? _customer;

  late final _i1.ColumnInt artworkTemplateSelectionId;

  _i3.ArtworkTemplateSelectionDTOTable? _artworkTemplateSelection;

  late final _i1.ColumnInt artworkTemplatePreSelectionId;

  _i4.ArtworkTemplatePreSelectionDTOTable? _artworkTemplatePreSelection;

  late final _i1.ColumnSerializable trapping;

  late final _i1.ColumnSerializable layers;

  late final _i1.ColumnDouble anschnitt;

  late final _i1.ColumnSerializable colors;

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
      field: ArtworkTemplateDTO.t.customerId,
      foreignField: _i2.CustomerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CustomerDTOTable(tableRelation: foreignTableRelation),
    );
    return _customer!;
  }

  _i3.ArtworkTemplateSelectionDTOTable get artworkTemplateSelection {
    if (_artworkTemplateSelection != null) return _artworkTemplateSelection!;
    _artworkTemplateSelection = _i1.createRelationTable(
      relationFieldName: 'artworkTemplateSelection',
      field: ArtworkTemplateDTO.t.artworkTemplateSelectionId,
      foreignField: _i3.ArtworkTemplateSelectionDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ArtworkTemplateSelectionDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _artworkTemplateSelection!;
  }

  _i4.ArtworkTemplatePreSelectionDTOTable get artworkTemplatePreSelection {
    if (_artworkTemplatePreSelection != null)
      return _artworkTemplatePreSelection!;
    _artworkTemplatePreSelection = _i1.createRelationTable(
      relationFieldName: 'artworkTemplatePreSelection',
      field: ArtworkTemplateDTO.t.artworkTemplatePreSelectionId,
      foreignField: _i4.ArtworkTemplatePreSelectionDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ArtworkTemplatePreSelectionDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _artworkTemplatePreSelection!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        description,
        customerId,
        artworkTemplateSelectionId,
        artworkTemplatePreSelectionId,
        trapping,
        layers,
        anschnitt,
        colors,
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
    if (relationField == 'artworkTemplateSelection') {
      return artworkTemplateSelection;
    }
    if (relationField == 'artworkTemplatePreSelection') {
      return artworkTemplatePreSelection;
    }
    return null;
  }
}

class ArtworkTemplateDTOInclude extends _i1.IncludeObject {
  ArtworkTemplateDTOInclude._({
    _i2.CustomerDTOInclude? customer,
    _i3.ArtworkTemplateSelectionDTOInclude? artworkTemplateSelection,
    _i4.ArtworkTemplatePreSelectionDTOInclude? artworkTemplatePreSelection,
  }) {
    _customer = customer;
    _artworkTemplateSelection = artworkTemplateSelection;
    _artworkTemplatePreSelection = artworkTemplatePreSelection;
  }

  _i2.CustomerDTOInclude? _customer;

  _i3.ArtworkTemplateSelectionDTOInclude? _artworkTemplateSelection;

  _i4.ArtworkTemplatePreSelectionDTOInclude? _artworkTemplatePreSelection;

  @override
  Map<String, _i1.Include?> get includes => {
        'customer': _customer,
        'artworkTemplateSelection': _artworkTemplateSelection,
        'artworkTemplatePreSelection': _artworkTemplatePreSelection,
      };

  @override
  _i1.Table<int?> get table => ArtworkTemplateDTO.t;
}

class ArtworkTemplateDTOIncludeList extends _i1.IncludeList {
  ArtworkTemplateDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkTemplateDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkTemplateDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkTemplateDTO.t;
}

class ArtworkTemplateDTORepository {
  const ArtworkTemplateDTORepository._();

  final attachRow = const ArtworkTemplateDTOAttachRowRepository._();

  final detachRow = const ArtworkTemplateDTODetachRowRepository._();

  /// Returns a list of [ArtworkTemplateDTO]s matching the given query parameters.
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
  Future<List<ArtworkTemplateDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplateDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplateDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkTemplateDTOInclude? include,
  }) async {
    return session.db.find<ArtworkTemplateDTO>(
      where: where?.call(ArtworkTemplateDTO.t),
      orderBy: orderBy?.call(ArtworkTemplateDTO.t),
      orderByList: orderByList?.call(ArtworkTemplateDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkTemplateDTO] matching the given query parameters.
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
  Future<ArtworkTemplateDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplateDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkTemplateDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTemplateDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkTemplateDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkTemplateDTO>(
      where: where?.call(ArtworkTemplateDTO.t),
      orderBy: orderBy?.call(ArtworkTemplateDTO.t),
      orderByList: orderByList?.call(ArtworkTemplateDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkTemplateDTO] by its [id] or null if no such row exists.
  Future<ArtworkTemplateDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkTemplateDTOInclude? include,
  }) async {
    return session.db.findById<ArtworkTemplateDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkTemplateDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkTemplateDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkTemplateDTO>> insert(
    _i1.Session session,
    List<ArtworkTemplateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkTemplateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkTemplateDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkTemplateDTO] will have its `id` field set.
  Future<ArtworkTemplateDTO> insertRow(
    _i1.Session session,
    ArtworkTemplateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkTemplateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkTemplateDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkTemplateDTO>> update(
    _i1.Session session,
    List<ArtworkTemplateDTO> rows, {
    _i1.ColumnSelections<ArtworkTemplateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkTemplateDTO>(
      rows,
      columns: columns?.call(ArtworkTemplateDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkTemplateDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkTemplateDTO> updateRow(
    _i1.Session session,
    ArtworkTemplateDTO row, {
    _i1.ColumnSelections<ArtworkTemplateDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkTemplateDTO>(
      row,
      columns: columns?.call(ArtworkTemplateDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkTemplateDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkTemplateDTO>> delete(
    _i1.Session session,
    List<ArtworkTemplateDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkTemplateDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkTemplateDTO].
  Future<ArtworkTemplateDTO> deleteRow(
    _i1.Session session,
    ArtworkTemplateDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkTemplateDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkTemplateDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkTemplateDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkTemplateDTO>(
      where: where(ArtworkTemplateDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTemplateDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkTemplateDTO>(
      where: where?.call(ArtworkTemplateDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkTemplateDTOAttachRowRepository {
  const ArtworkTemplateDTOAttachRowRepository._();

  /// Creates a relation between the given [ArtworkTemplateDTO] and [CustomerDTO]
  /// by setting the [ArtworkTemplateDTO]'s foreign key `customerId` to refer to the [CustomerDTO].
  Future<void> customer(
    _i1.Session session,
    ArtworkTemplateDTO artworkTemplateDTO,
    _i2.CustomerDTO customer, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTemplateDTO.id == null) {
      throw ArgumentError.notNull('artworkTemplateDTO.id');
    }
    if (customer.id == null) {
      throw ArgumentError.notNull('customer.id');
    }

    var $artworkTemplateDTO =
        artworkTemplateDTO.copyWith(customerId: customer.id);
    await session.db.updateRow<ArtworkTemplateDTO>(
      $artworkTemplateDTO,
      columns: [ArtworkTemplateDTO.t.customerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkTemplateDTO] and [ArtworkTemplateSelectionDTO]
  /// by setting the [ArtworkTemplateDTO]'s foreign key `artworkTemplateSelectionId` to refer to the [ArtworkTemplateSelectionDTO].
  Future<void> artworkTemplateSelection(
    _i1.Session session,
    ArtworkTemplateDTO artworkTemplateDTO,
    _i3.ArtworkTemplateSelectionDTO artworkTemplateSelection, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTemplateDTO.id == null) {
      throw ArgumentError.notNull('artworkTemplateDTO.id');
    }
    if (artworkTemplateSelection.id == null) {
      throw ArgumentError.notNull('artworkTemplateSelection.id');
    }

    var $artworkTemplateDTO = artworkTemplateDTO.copyWith(
        artworkTemplateSelectionId: artworkTemplateSelection.id);
    await session.db.updateRow<ArtworkTemplateDTO>(
      $artworkTemplateDTO,
      columns: [ArtworkTemplateDTO.t.artworkTemplateSelectionId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkTemplateDTO] and [ArtworkTemplatePreSelectionDTO]
  /// by setting the [ArtworkTemplateDTO]'s foreign key `artworkTemplatePreSelectionId` to refer to the [ArtworkTemplatePreSelectionDTO].
  Future<void> artworkTemplatePreSelection(
    _i1.Session session,
    ArtworkTemplateDTO artworkTemplateDTO,
    _i4.ArtworkTemplatePreSelectionDTO artworkTemplatePreSelection, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTemplateDTO.id == null) {
      throw ArgumentError.notNull('artworkTemplateDTO.id');
    }
    if (artworkTemplatePreSelection.id == null) {
      throw ArgumentError.notNull('artworkTemplatePreSelection.id');
    }

    var $artworkTemplateDTO = artworkTemplateDTO.copyWith(
        artworkTemplatePreSelectionId: artworkTemplatePreSelection.id);
    await session.db.updateRow<ArtworkTemplateDTO>(
      $artworkTemplateDTO,
      columns: [ArtworkTemplateDTO.t.artworkTemplatePreSelectionId],
      transaction: transaction,
    );
  }
}

class ArtworkTemplateDTODetachRowRepository {
  const ArtworkTemplateDTODetachRowRepository._();

  /// Detaches the relation between this [ArtworkTemplateDTO] and the [CustomerDTO] set in `customer`
  /// by setting the [ArtworkTemplateDTO]'s foreign key `customerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    ArtworkTemplateDTO artworktemplatedto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworktemplatedto.id == null) {
      throw ArgumentError.notNull('artworktemplatedto.id');
    }

    var $artworktemplatedto = artworktemplatedto.copyWith(customerId: null);
    await session.db.updateRow<ArtworkTemplateDTO>(
      $artworktemplatedto,
      columns: [ArtworkTemplateDTO.t.customerId],
      transaction: transaction,
    );
  }
}
