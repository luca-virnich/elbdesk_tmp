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
import '../../../../modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i2;

abstract class ArtworkColorDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkColorDTO._({
    this.id,
    required this.colorName,
    required this.shortName,
    this.color,
    required this.l,
    required this.a,
    required this.b,
    this.customText,
    this.colorSpecType,
    this.colorType,
    this.verarbeitungsEbene,
    this.printProcess,
    this.screenLineature,
    this.screenAngle,
    this.screenPointForm,
    this.boost,
    this.colorPaletteId,
    this.colorPalette,
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

  factory ArtworkColorDTO({
    int? id,
    required String colorName,
    required String shortName,
    String? color,
    required double l,
    required double a,
    required double b,
    String? customText,
    String? colorSpecType,
    String? colorType,
    String? verarbeitungsEbene,
    String? printProcess,
    double? screenLineature,
    double? screenAngle,
    String? screenPointForm,
    double? boost,
    int? colorPaletteId,
    _i2.PrepressColorPaletteDTO? colorPalette,
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
  }) = _ArtworkColorDTOImpl;

  factory ArtworkColorDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkColorDTO(
      id: jsonSerialization['id'] as int?,
      colorName: jsonSerialization['colorName'] as String,
      shortName: jsonSerialization['shortName'] as String,
      color: jsonSerialization['color'] as String?,
      l: (jsonSerialization['l'] as num).toDouble(),
      a: (jsonSerialization['a'] as num).toDouble(),
      b: (jsonSerialization['b'] as num).toDouble(),
      customText: jsonSerialization['customText'] as String?,
      colorSpecType: jsonSerialization['colorSpecType'] as String?,
      colorType: jsonSerialization['colorType'] as String?,
      verarbeitungsEbene: jsonSerialization['verarbeitungsEbene'] as String?,
      printProcess: jsonSerialization['printProcess'] as String?,
      screenLineature:
          (jsonSerialization['screenLineature'] as num?)?.toDouble(),
      screenAngle: (jsonSerialization['screenAngle'] as num?)?.toDouble(),
      screenPointForm: jsonSerialization['screenPointForm'] as String?,
      boost: (jsonSerialization['boost'] as num?)?.toDouble(),
      colorPaletteId: jsonSerialization['colorPaletteId'] as int?,
      colorPalette: jsonSerialization['colorPalette'] == null
          ? null
          : _i2.PrepressColorPaletteDTO.fromJson(
              (jsonSerialization['colorPalette'] as Map<String, dynamic>)),
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

  static final t = ArtworkColorDTOTable();

  static const db = ArtworkColorDTORepository._();

  @override
  int? id;

  String colorName;

  String shortName;

  String? color;

  double l;

  double a;

  double b;

  String? customText;

  String? colorSpecType;

  String? colorType;

  String? verarbeitungsEbene;

  String? printProcess;

  double? screenLineature;

  double? screenAngle;

  String? screenPointForm;

  double? boost;

  int? colorPaletteId;

  _i2.PrepressColorPaletteDTO? colorPalette;

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

  /// Returns a shallow copy of this [ArtworkColorDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkColorDTO copyWith({
    int? id,
    String? colorName,
    String? shortName,
    String? color,
    double? l,
    double? a,
    double? b,
    String? customText,
    String? colorSpecType,
    String? colorType,
    String? verarbeitungsEbene,
    String? printProcess,
    double? screenLineature,
    double? screenAngle,
    String? screenPointForm,
    double? boost,
    int? colorPaletteId,
    _i2.PrepressColorPaletteDTO? colorPalette,
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
      'colorName': colorName,
      'shortName': shortName,
      if (color != null) 'color': color,
      'l': l,
      'a': a,
      'b': b,
      if (customText != null) 'customText': customText,
      if (colorSpecType != null) 'colorSpecType': colorSpecType,
      if (colorType != null) 'colorType': colorType,
      if (verarbeitungsEbene != null) 'verarbeitungsEbene': verarbeitungsEbene,
      if (printProcess != null) 'printProcess': printProcess,
      if (screenLineature != null) 'screenLineature': screenLineature,
      if (screenAngle != null) 'screenAngle': screenAngle,
      if (screenPointForm != null) 'screenPointForm': screenPointForm,
      if (boost != null) 'boost': boost,
      if (colorPaletteId != null) 'colorPaletteId': colorPaletteId,
      if (colorPalette != null) 'colorPalette': colorPalette?.toJson(),
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
      'colorName': colorName,
      'shortName': shortName,
      if (color != null) 'color': color,
      'l': l,
      'a': a,
      'b': b,
      if (customText != null) 'customText': customText,
      if (colorSpecType != null) 'colorSpecType': colorSpecType,
      if (colorType != null) 'colorType': colorType,
      if (verarbeitungsEbene != null) 'verarbeitungsEbene': verarbeitungsEbene,
      if (printProcess != null) 'printProcess': printProcess,
      if (screenLineature != null) 'screenLineature': screenLineature,
      if (screenAngle != null) 'screenAngle': screenAngle,
      if (screenPointForm != null) 'screenPointForm': screenPointForm,
      if (boost != null) 'boost': boost,
      if (colorPaletteId != null) 'colorPaletteId': colorPaletteId,
      if (colorPalette != null)
        'colorPalette': colorPalette?.toJsonForProtocol(),
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

  static ArtworkColorDTOInclude include(
      {_i2.PrepressColorPaletteDTOInclude? colorPalette}) {
    return ArtworkColorDTOInclude._(colorPalette: colorPalette);
  }

  static ArtworkColorDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkColorDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkColorDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkColorDTOTable>? orderByList,
    ArtworkColorDTOInclude? include,
  }) {
    return ArtworkColorDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkColorDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkColorDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkColorDTOImpl extends ArtworkColorDTO {
  _ArtworkColorDTOImpl({
    int? id,
    required String colorName,
    required String shortName,
    String? color,
    required double l,
    required double a,
    required double b,
    String? customText,
    String? colorSpecType,
    String? colorType,
    String? verarbeitungsEbene,
    String? printProcess,
    double? screenLineature,
    double? screenAngle,
    String? screenPointForm,
    double? boost,
    int? colorPaletteId,
    _i2.PrepressColorPaletteDTO? colorPalette,
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
          colorName: colorName,
          shortName: shortName,
          color: color,
          l: l,
          a: a,
          b: b,
          customText: customText,
          colorSpecType: colorSpecType,
          colorType: colorType,
          verarbeitungsEbene: verarbeitungsEbene,
          printProcess: printProcess,
          screenLineature: screenLineature,
          screenAngle: screenAngle,
          screenPointForm: screenPointForm,
          boost: boost,
          colorPaletteId: colorPaletteId,
          colorPalette: colorPalette,
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

  /// Returns a shallow copy of this [ArtworkColorDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkColorDTO copyWith({
    Object? id = _Undefined,
    String? colorName,
    String? shortName,
    Object? color = _Undefined,
    double? l,
    double? a,
    double? b,
    Object? customText = _Undefined,
    Object? colorSpecType = _Undefined,
    Object? colorType = _Undefined,
    Object? verarbeitungsEbene = _Undefined,
    Object? printProcess = _Undefined,
    Object? screenLineature = _Undefined,
    Object? screenAngle = _Undefined,
    Object? screenPointForm = _Undefined,
    Object? boost = _Undefined,
    Object? colorPaletteId = _Undefined,
    Object? colorPalette = _Undefined,
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
    return ArtworkColorDTO(
      id: id is int? ? id : this.id,
      colorName: colorName ?? this.colorName,
      shortName: shortName ?? this.shortName,
      color: color is String? ? color : this.color,
      l: l ?? this.l,
      a: a ?? this.a,
      b: b ?? this.b,
      customText: customText is String? ? customText : this.customText,
      colorSpecType:
          colorSpecType is String? ? colorSpecType : this.colorSpecType,
      colorType: colorType is String? ? colorType : this.colorType,
      verarbeitungsEbene: verarbeitungsEbene is String?
          ? verarbeitungsEbene
          : this.verarbeitungsEbene,
      printProcess: printProcess is String? ? printProcess : this.printProcess,
      screenLineature:
          screenLineature is double? ? screenLineature : this.screenLineature,
      screenAngle: screenAngle is double? ? screenAngle : this.screenAngle,
      screenPointForm:
          screenPointForm is String? ? screenPointForm : this.screenPointForm,
      boost: boost is double? ? boost : this.boost,
      colorPaletteId:
          colorPaletteId is int? ? colorPaletteId : this.colorPaletteId,
      colorPalette: colorPalette is _i2.PrepressColorPaletteDTO?
          ? colorPalette
          : this.colorPalette?.copyWith(),
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

class ArtworkColorDTOTable extends _i1.Table<int?> {
  ArtworkColorDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_artwork_color') {
    colorName = _i1.ColumnString(
      'colorName',
      this,
    );
    shortName = _i1.ColumnString(
      'shortName',
      this,
    );
    color = _i1.ColumnString(
      'color',
      this,
    );
    l = _i1.ColumnDouble(
      'l',
      this,
    );
    a = _i1.ColumnDouble(
      'a',
      this,
    );
    b = _i1.ColumnDouble(
      'b',
      this,
    );
    customText = _i1.ColumnString(
      'customText',
      this,
    );
    colorSpecType = _i1.ColumnString(
      'colorSpecType',
      this,
    );
    colorType = _i1.ColumnString(
      'colorType',
      this,
    );
    verarbeitungsEbene = _i1.ColumnString(
      'verarbeitungsEbene',
      this,
    );
    printProcess = _i1.ColumnString(
      'printProcess',
      this,
    );
    screenLineature = _i1.ColumnDouble(
      'screenLineature',
      this,
    );
    screenAngle = _i1.ColumnDouble(
      'screenAngle',
      this,
    );
    screenPointForm = _i1.ColumnString(
      'screenPointForm',
      this,
    );
    boost = _i1.ColumnDouble(
      'boost',
      this,
    );
    colorPaletteId = _i1.ColumnInt(
      'colorPaletteId',
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

  late final _i1.ColumnString colorName;

  late final _i1.ColumnString shortName;

  late final _i1.ColumnString color;

  late final _i1.ColumnDouble l;

  late final _i1.ColumnDouble a;

  late final _i1.ColumnDouble b;

  late final _i1.ColumnString customText;

  late final _i1.ColumnString colorSpecType;

  late final _i1.ColumnString colorType;

  late final _i1.ColumnString verarbeitungsEbene;

  late final _i1.ColumnString printProcess;

  late final _i1.ColumnDouble screenLineature;

  late final _i1.ColumnDouble screenAngle;

  late final _i1.ColumnString screenPointForm;

  late final _i1.ColumnDouble boost;

  late final _i1.ColumnInt colorPaletteId;

  _i2.PrepressColorPaletteDTOTable? _colorPalette;

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

  _i2.PrepressColorPaletteDTOTable get colorPalette {
    if (_colorPalette != null) return _colorPalette!;
    _colorPalette = _i1.createRelationTable(
      relationFieldName: 'colorPalette',
      field: ArtworkColorDTO.t.colorPaletteId,
      foreignField: _i2.PrepressColorPaletteDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PrepressColorPaletteDTOTable(tableRelation: foreignTableRelation),
    );
    return _colorPalette!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        colorName,
        shortName,
        color,
        l,
        a,
        b,
        customText,
        colorSpecType,
        colorType,
        verarbeitungsEbene,
        printProcess,
        screenLineature,
        screenAngle,
        screenPointForm,
        boost,
        colorPaletteId,
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
    if (relationField == 'colorPalette') {
      return colorPalette;
    }
    return null;
  }
}

class ArtworkColorDTOInclude extends _i1.IncludeObject {
  ArtworkColorDTOInclude._({_i2.PrepressColorPaletteDTOInclude? colorPalette}) {
    _colorPalette = colorPalette;
  }

  _i2.PrepressColorPaletteDTOInclude? _colorPalette;

  @override
  Map<String, _i1.Include?> get includes => {'colorPalette': _colorPalette};

  @override
  _i1.Table<int?> get table => ArtworkColorDTO.t;
}

class ArtworkColorDTOIncludeList extends _i1.IncludeList {
  ArtworkColorDTOIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkColorDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkColorDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkColorDTO.t;
}

class ArtworkColorDTORepository {
  const ArtworkColorDTORepository._();

  final attachRow = const ArtworkColorDTOAttachRowRepository._();

  final detachRow = const ArtworkColorDTODetachRowRepository._();

  /// Returns a list of [ArtworkColorDTO]s matching the given query parameters.
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
  Future<List<ArtworkColorDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkColorDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkColorDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkColorDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkColorDTOInclude? include,
  }) async {
    return session.db.find<ArtworkColorDTO>(
      where: where?.call(ArtworkColorDTO.t),
      orderBy: orderBy?.call(ArtworkColorDTO.t),
      orderByList: orderByList?.call(ArtworkColorDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkColorDTO] matching the given query parameters.
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
  Future<ArtworkColorDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkColorDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkColorDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkColorDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkColorDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkColorDTO>(
      where: where?.call(ArtworkColorDTO.t),
      orderBy: orderBy?.call(ArtworkColorDTO.t),
      orderByList: orderByList?.call(ArtworkColorDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkColorDTO] by its [id] or null if no such row exists.
  Future<ArtworkColorDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkColorDTOInclude? include,
  }) async {
    return session.db.findById<ArtworkColorDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkColorDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkColorDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkColorDTO>> insert(
    _i1.Session session,
    List<ArtworkColorDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkColorDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkColorDTO] and returns the inserted row.
  ///
  /// The returned [ArtworkColorDTO] will have its `id` field set.
  Future<ArtworkColorDTO> insertRow(
    _i1.Session session,
    ArtworkColorDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkColorDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkColorDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkColorDTO>> update(
    _i1.Session session,
    List<ArtworkColorDTO> rows, {
    _i1.ColumnSelections<ArtworkColorDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkColorDTO>(
      rows,
      columns: columns?.call(ArtworkColorDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkColorDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkColorDTO> updateRow(
    _i1.Session session,
    ArtworkColorDTO row, {
    _i1.ColumnSelections<ArtworkColorDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkColorDTO>(
      row,
      columns: columns?.call(ArtworkColorDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkColorDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkColorDTO>> delete(
    _i1.Session session,
    List<ArtworkColorDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkColorDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkColorDTO].
  Future<ArtworkColorDTO> deleteRow(
    _i1.Session session,
    ArtworkColorDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkColorDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkColorDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkColorDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkColorDTO>(
      where: where(ArtworkColorDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkColorDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkColorDTO>(
      where: where?.call(ArtworkColorDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkColorDTOAttachRowRepository {
  const ArtworkColorDTOAttachRowRepository._();

  /// Creates a relation between the given [ArtworkColorDTO] and [PrepressColorPaletteDTO]
  /// by setting the [ArtworkColorDTO]'s foreign key `colorPaletteId` to refer to the [PrepressColorPaletteDTO].
  Future<void> colorPalette(
    _i1.Session session,
    ArtworkColorDTO artworkColorDTO,
    _i2.PrepressColorPaletteDTO colorPalette, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkColorDTO.id == null) {
      throw ArgumentError.notNull('artworkColorDTO.id');
    }
    if (colorPalette.id == null) {
      throw ArgumentError.notNull('colorPalette.id');
    }

    var $artworkColorDTO =
        artworkColorDTO.copyWith(colorPaletteId: colorPalette.id);
    await session.db.updateRow<ArtworkColorDTO>(
      $artworkColorDTO,
      columns: [ArtworkColorDTO.t.colorPaletteId],
      transaction: transaction,
    );
  }
}

class ArtworkColorDTODetachRowRepository {
  const ArtworkColorDTODetachRowRepository._();

  /// Detaches the relation between this [ArtworkColorDTO] and the [PrepressColorPaletteDTO] set in `colorPalette`
  /// by setting the [ArtworkColorDTO]'s foreign key `colorPaletteId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> colorPalette(
    _i1.Session session,
    ArtworkColorDTO artworkcolordto, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkcolordto.id == null) {
      throw ArgumentError.notNull('artworkcolordto.id');
    }

    var $artworkcolordto = artworkcolordto.copyWith(colorPaletteId: null);
    await session.db.updateRow<ArtworkColorDTO>(
      $artworkcolordto,
      columns: [ArtworkColorDTO.t.colorPaletteId],
      transaction: transaction,
    );
  }
}
