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
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i2;

abstract class ColorSpecificationDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ColorSpecificationDTO._({
    this.id,
    this.name,
    this.type,
    this.book,
    this.egname,
    this.frequency,
    this.angle,
    this.dotshape,
    this.r,
    this.g,
    this.b,
    this.attribute,
    this.printingmethod,
    this.databaseColorId,
    this.databaseColor,
    this.artworkQuarantineId,
  });

  factory ColorSpecificationDTO({
    int? id,
    String? name,
    String? type,
    String? book,
    String? egname,
    double? frequency,
    double? angle,
    String? dotshape,
    double? r,
    double? g,
    double? b,
    String? attribute,
    String? printingmethod,
    int? databaseColorId,
    _i2.ArtworkColorDTO? databaseColor,
    int? artworkQuarantineId,
  }) = _ColorSpecificationDTOImpl;

  factory ColorSpecificationDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ColorSpecificationDTO(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String?,
      type: jsonSerialization['type'] as String?,
      book: jsonSerialization['book'] as String?,
      egname: jsonSerialization['egname'] as String?,
      frequency: (jsonSerialization['frequency'] as num?)?.toDouble(),
      angle: (jsonSerialization['angle'] as num?)?.toDouble(),
      dotshape: jsonSerialization['dotshape'] as String?,
      r: (jsonSerialization['r'] as num?)?.toDouble(),
      g: (jsonSerialization['g'] as num?)?.toDouble(),
      b: (jsonSerialization['b'] as num?)?.toDouble(),
      attribute: jsonSerialization['attribute'] as String?,
      printingmethod: jsonSerialization['printingmethod'] as String?,
      databaseColorId: jsonSerialization['databaseColorId'] as int?,
      databaseColor: jsonSerialization['databaseColor'] == null
          ? null
          : _i2.ArtworkColorDTO.fromJson(
              (jsonSerialization['databaseColor'] as Map<String, dynamic>)),
      artworkQuarantineId: jsonSerialization['artworkQuarantineId'] as int?,
    );
  }

  static final t = ColorSpecificationDTOTable();

  static const db = ColorSpecificationDTORepository._();

  @override
  int? id;

  String? name;

  String? type;

  String? book;

  String? egname;

  double? frequency;

  double? angle;

  String? dotshape;

  double? r;

  double? g;

  double? b;

  String? attribute;

  String? printingmethod;

  int? databaseColorId;

  _i2.ArtworkColorDTO? databaseColor;

  int? artworkQuarantineId;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ColorSpecificationDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ColorSpecificationDTO copyWith({
    int? id,
    String? name,
    String? type,
    String? book,
    String? egname,
    double? frequency,
    double? angle,
    String? dotshape,
    double? r,
    double? g,
    double? b,
    String? attribute,
    String? printingmethod,
    int? databaseColorId,
    _i2.ArtworkColorDTO? databaseColor,
    int? artworkQuarantineId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (book != null) 'book': book,
      if (egname != null) 'egname': egname,
      if (frequency != null) 'frequency': frequency,
      if (angle != null) 'angle': angle,
      if (dotshape != null) 'dotshape': dotshape,
      if (r != null) 'r': r,
      if (g != null) 'g': g,
      if (b != null) 'b': b,
      if (attribute != null) 'attribute': attribute,
      if (printingmethod != null) 'printingmethod': printingmethod,
      if (databaseColorId != null) 'databaseColorId': databaseColorId,
      if (databaseColor != null) 'databaseColor': databaseColor?.toJson(),
      if (artworkQuarantineId != null)
        'artworkQuarantineId': artworkQuarantineId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (book != null) 'book': book,
      if (egname != null) 'egname': egname,
      if (frequency != null) 'frequency': frequency,
      if (angle != null) 'angle': angle,
      if (dotshape != null) 'dotshape': dotshape,
      if (r != null) 'r': r,
      if (g != null) 'g': g,
      if (b != null) 'b': b,
      if (attribute != null) 'attribute': attribute,
      if (printingmethod != null) 'printingmethod': printingmethod,
      if (databaseColorId != null) 'databaseColorId': databaseColorId,
      if (databaseColor != null)
        'databaseColor': databaseColor?.toJsonForProtocol(),
      if (artworkQuarantineId != null)
        'artworkQuarantineId': artworkQuarantineId,
    };
  }

  static ColorSpecificationDTOInclude include(
      {_i2.ArtworkColorDTOInclude? databaseColor}) {
    return ColorSpecificationDTOInclude._(databaseColor: databaseColor);
  }

  static ColorSpecificationDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<ColorSpecificationDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ColorSpecificationDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ColorSpecificationDTOTable>? orderByList,
    ColorSpecificationDTOInclude? include,
  }) {
    return ColorSpecificationDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ColorSpecificationDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ColorSpecificationDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ColorSpecificationDTOImpl extends ColorSpecificationDTO {
  _ColorSpecificationDTOImpl({
    int? id,
    String? name,
    String? type,
    String? book,
    String? egname,
    double? frequency,
    double? angle,
    String? dotshape,
    double? r,
    double? g,
    double? b,
    String? attribute,
    String? printingmethod,
    int? databaseColorId,
    _i2.ArtworkColorDTO? databaseColor,
    int? artworkQuarantineId,
  }) : super._(
          id: id,
          name: name,
          type: type,
          book: book,
          egname: egname,
          frequency: frequency,
          angle: angle,
          dotshape: dotshape,
          r: r,
          g: g,
          b: b,
          attribute: attribute,
          printingmethod: printingmethod,
          databaseColorId: databaseColorId,
          databaseColor: databaseColor,
          artworkQuarantineId: artworkQuarantineId,
        );

  /// Returns a shallow copy of this [ColorSpecificationDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ColorSpecificationDTO copyWith({
    Object? id = _Undefined,
    Object? name = _Undefined,
    Object? type = _Undefined,
    Object? book = _Undefined,
    Object? egname = _Undefined,
    Object? frequency = _Undefined,
    Object? angle = _Undefined,
    Object? dotshape = _Undefined,
    Object? r = _Undefined,
    Object? g = _Undefined,
    Object? b = _Undefined,
    Object? attribute = _Undefined,
    Object? printingmethod = _Undefined,
    Object? databaseColorId = _Undefined,
    Object? databaseColor = _Undefined,
    Object? artworkQuarantineId = _Undefined,
  }) {
    return ColorSpecificationDTO(
      id: id is int? ? id : this.id,
      name: name is String? ? name : this.name,
      type: type is String? ? type : this.type,
      book: book is String? ? book : this.book,
      egname: egname is String? ? egname : this.egname,
      frequency: frequency is double? ? frequency : this.frequency,
      angle: angle is double? ? angle : this.angle,
      dotshape: dotshape is String? ? dotshape : this.dotshape,
      r: r is double? ? r : this.r,
      g: g is double? ? g : this.g,
      b: b is double? ? b : this.b,
      attribute: attribute is String? ? attribute : this.attribute,
      printingmethod:
          printingmethod is String? ? printingmethod : this.printingmethod,
      databaseColorId:
          databaseColorId is int? ? databaseColorId : this.databaseColorId,
      databaseColor: databaseColor is _i2.ArtworkColorDTO?
          ? databaseColor
          : this.databaseColor?.copyWith(),
      artworkQuarantineId: artworkQuarantineId is int?
          ? artworkQuarantineId
          : this.artworkQuarantineId,
    );
  }
}

class ColorSpecificationDTOTable extends _i1.Table<int?> {
  ColorSpecificationDTOTable({super.tableRelation})
      : super(tableName: 'color_specifications') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    type = _i1.ColumnString(
      'type',
      this,
    );
    book = _i1.ColumnString(
      'book',
      this,
    );
    egname = _i1.ColumnString(
      'egname',
      this,
    );
    frequency = _i1.ColumnDouble(
      'frequency',
      this,
    );
    angle = _i1.ColumnDouble(
      'angle',
      this,
    );
    dotshape = _i1.ColumnString(
      'dotshape',
      this,
    );
    r = _i1.ColumnDouble(
      'r',
      this,
    );
    g = _i1.ColumnDouble(
      'g',
      this,
    );
    b = _i1.ColumnDouble(
      'b',
      this,
    );
    attribute = _i1.ColumnString(
      'attribute',
      this,
    );
    printingmethod = _i1.ColumnString(
      'printingmethod',
      this,
    );
    databaseColorId = _i1.ColumnInt(
      'databaseColorId',
      this,
    );
    artworkQuarantineId = _i1.ColumnInt(
      'artworkQuarantineId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnString type;

  late final _i1.ColumnString book;

  late final _i1.ColumnString egname;

  late final _i1.ColumnDouble frequency;

  late final _i1.ColumnDouble angle;

  late final _i1.ColumnString dotshape;

  late final _i1.ColumnDouble r;

  late final _i1.ColumnDouble g;

  late final _i1.ColumnDouble b;

  late final _i1.ColumnString attribute;

  late final _i1.ColumnString printingmethod;

  late final _i1.ColumnInt databaseColorId;

  _i2.ArtworkColorDTOTable? _databaseColor;

  late final _i1.ColumnInt artworkQuarantineId;

  _i2.ArtworkColorDTOTable get databaseColor {
    if (_databaseColor != null) return _databaseColor!;
    _databaseColor = _i1.createRelationTable(
      relationFieldName: 'databaseColor',
      field: ColorSpecificationDTO.t.databaseColorId,
      foreignField: _i2.ArtworkColorDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkColorDTOTable(tableRelation: foreignTableRelation),
    );
    return _databaseColor!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        type,
        book,
        egname,
        frequency,
        angle,
        dotshape,
        r,
        g,
        b,
        attribute,
        printingmethod,
        databaseColorId,
        artworkQuarantineId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'databaseColor') {
      return databaseColor;
    }
    return null;
  }
}

class ColorSpecificationDTOInclude extends _i1.IncludeObject {
  ColorSpecificationDTOInclude._({_i2.ArtworkColorDTOInclude? databaseColor}) {
    _databaseColor = databaseColor;
  }

  _i2.ArtworkColorDTOInclude? _databaseColor;

  @override
  Map<String, _i1.Include?> get includes => {'databaseColor': _databaseColor};

  @override
  _i1.Table<int?> get table => ColorSpecificationDTO.t;
}

class ColorSpecificationDTOIncludeList extends _i1.IncludeList {
  ColorSpecificationDTOIncludeList._({
    _i1.WhereExpressionBuilder<ColorSpecificationDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ColorSpecificationDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ColorSpecificationDTO.t;
}

class ColorSpecificationDTORepository {
  const ColorSpecificationDTORepository._();

  final attachRow = const ColorSpecificationDTOAttachRowRepository._();

  final detachRow = const ColorSpecificationDTODetachRowRepository._();

  /// Returns a list of [ColorSpecificationDTO]s matching the given query parameters.
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
  Future<List<ColorSpecificationDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ColorSpecificationDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ColorSpecificationDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ColorSpecificationDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ColorSpecificationDTOInclude? include,
  }) async {
    return session.db.find<ColorSpecificationDTO>(
      where: where?.call(ColorSpecificationDTO.t),
      orderBy: orderBy?.call(ColorSpecificationDTO.t),
      orderByList: orderByList?.call(ColorSpecificationDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ColorSpecificationDTO] matching the given query parameters.
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
  Future<ColorSpecificationDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ColorSpecificationDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<ColorSpecificationDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ColorSpecificationDTOTable>? orderByList,
    _i1.Transaction? transaction,
    ColorSpecificationDTOInclude? include,
  }) async {
    return session.db.findFirstRow<ColorSpecificationDTO>(
      where: where?.call(ColorSpecificationDTO.t),
      orderBy: orderBy?.call(ColorSpecificationDTO.t),
      orderByList: orderByList?.call(ColorSpecificationDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ColorSpecificationDTO] by its [id] or null if no such row exists.
  Future<ColorSpecificationDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ColorSpecificationDTOInclude? include,
  }) async {
    return session.db.findById<ColorSpecificationDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ColorSpecificationDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [ColorSpecificationDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ColorSpecificationDTO>> insert(
    _i1.Session session,
    List<ColorSpecificationDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ColorSpecificationDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ColorSpecificationDTO] and returns the inserted row.
  ///
  /// The returned [ColorSpecificationDTO] will have its `id` field set.
  Future<ColorSpecificationDTO> insertRow(
    _i1.Session session,
    ColorSpecificationDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ColorSpecificationDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ColorSpecificationDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ColorSpecificationDTO>> update(
    _i1.Session session,
    List<ColorSpecificationDTO> rows, {
    _i1.ColumnSelections<ColorSpecificationDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ColorSpecificationDTO>(
      rows,
      columns: columns?.call(ColorSpecificationDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ColorSpecificationDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ColorSpecificationDTO> updateRow(
    _i1.Session session,
    ColorSpecificationDTO row, {
    _i1.ColumnSelections<ColorSpecificationDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ColorSpecificationDTO>(
      row,
      columns: columns?.call(ColorSpecificationDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ColorSpecificationDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ColorSpecificationDTO>> delete(
    _i1.Session session,
    List<ColorSpecificationDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ColorSpecificationDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ColorSpecificationDTO].
  Future<ColorSpecificationDTO> deleteRow(
    _i1.Session session,
    ColorSpecificationDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ColorSpecificationDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ColorSpecificationDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ColorSpecificationDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ColorSpecificationDTO>(
      where: where(ColorSpecificationDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ColorSpecificationDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ColorSpecificationDTO>(
      where: where?.call(ColorSpecificationDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ColorSpecificationDTOAttachRowRepository {
  const ColorSpecificationDTOAttachRowRepository._();

  /// Creates a relation between the given [ColorSpecificationDTO] and [ArtworkColorDTO]
  /// by setting the [ColorSpecificationDTO]'s foreign key `databaseColorId` to refer to the [ArtworkColorDTO].
  Future<void> databaseColor(
    _i1.Session session,
    ColorSpecificationDTO colorSpecificationDTO,
    _i2.ArtworkColorDTO databaseColor, {
    _i1.Transaction? transaction,
  }) async {
    if (colorSpecificationDTO.id == null) {
      throw ArgumentError.notNull('colorSpecificationDTO.id');
    }
    if (databaseColor.id == null) {
      throw ArgumentError.notNull('databaseColor.id');
    }

    var $colorSpecificationDTO =
        colorSpecificationDTO.copyWith(databaseColorId: databaseColor.id);
    await session.db.updateRow<ColorSpecificationDTO>(
      $colorSpecificationDTO,
      columns: [ColorSpecificationDTO.t.databaseColorId],
      transaction: transaction,
    );
  }
}

class ColorSpecificationDTODetachRowRepository {
  const ColorSpecificationDTODetachRowRepository._();

  /// Detaches the relation between this [ColorSpecificationDTO] and the [ArtworkColorDTO] set in `databaseColor`
  /// by setting the [ColorSpecificationDTO]'s foreign key `databaseColorId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> databaseColor(
    _i1.Session session,
    ColorSpecificationDTO colorspecificationdto, {
    _i1.Transaction? transaction,
  }) async {
    if (colorspecificationdto.id == null) {
      throw ArgumentError.notNull('colorspecificationdto.id');
    }

    var $colorspecificationdto =
        colorspecificationdto.copyWith(databaseColorId: null);
    await session.db.updateRow<ColorSpecificationDTO>(
      $colorspecificationdto,
      columns: [ColorSpecificationDTO.t.databaseColorId],
      transaction: transaction,
    );
  }
}
