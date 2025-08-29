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
import '../../../../modules/crm/language_code/models/language_code.dart' as _i2;
import '../../../../modules/crm/salutation_code/models/salutation_type.dart'
    as _i3;
import '../../../../modules/crm/contact/models/contact_field.dart' as _i4;

abstract class SalutationCodeFormularDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  SalutationCodeFormularDTO._({
    this.id,
    required this.languageCodeId,
    this.languageCode,
    required this.salutationType,
    required this.salutation,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
  });

  factory SalutationCodeFormularDTO({
    int? id,
    required int languageCodeId,
    _i2.LanguageCodeDTO? languageCode,
    required _i3.SalutationType salutationType,
    required String salutation,
    required _i4.ContactField name1,
    required _i4.ContactField name2,
    required _i4.ContactField name3,
    required _i4.ContactField name4,
  }) = _SalutationCodeFormularDTOImpl;

  factory SalutationCodeFormularDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalutationCodeFormularDTO(
      id: jsonSerialization['id'] as int?,
      languageCodeId: jsonSerialization['languageCodeId'] as int,
      languageCode: jsonSerialization['languageCode'] == null
          ? null
          : _i2.LanguageCodeDTO.fromJson(
              (jsonSerialization['languageCode'] as Map<String, dynamic>)),
      salutationType: _i3.SalutationType.fromJson(
          (jsonSerialization['salutationType'] as String)),
      salutation: jsonSerialization['salutation'] as String,
      name1: _i4.ContactField.fromJson((jsonSerialization['name1'] as String)),
      name2: _i4.ContactField.fromJson((jsonSerialization['name2'] as String)),
      name3: _i4.ContactField.fromJson((jsonSerialization['name3'] as String)),
      name4: _i4.ContactField.fromJson((jsonSerialization['name4'] as String)),
    );
  }

  static final t = SalutationCodeFormularDTOTable();

  static const db = SalutationCodeFormularDTORepository._();

  @override
  int? id;

  int languageCodeId;

  _i2.LanguageCodeDTO? languageCode;

  _i3.SalutationType salutationType;

  String salutation;

  _i4.ContactField name1;

  _i4.ContactField name2;

  _i4.ContactField name3;

  _i4.ContactField name4;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [SalutationCodeFormularDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalutationCodeFormularDTO copyWith({
    int? id,
    int? languageCodeId,
    _i2.LanguageCodeDTO? languageCode,
    _i3.SalutationType? salutationType,
    String? salutation,
    _i4.ContactField? name1,
    _i4.ContactField? name2,
    _i4.ContactField? name3,
    _i4.ContactField? name4,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'languageCodeId': languageCodeId,
      if (languageCode != null) 'languageCode': languageCode?.toJson(),
      'salutationType': salutationType.toJson(),
      'salutation': salutation,
      'name1': name1.toJson(),
      'name2': name2.toJson(),
      'name3': name3.toJson(),
      'name4': name4.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'languageCodeId': languageCodeId,
      if (languageCode != null)
        'languageCode': languageCode?.toJsonForProtocol(),
      'salutationType': salutationType.toJson(),
      'salutation': salutation,
      'name1': name1.toJson(),
      'name2': name2.toJson(),
      'name3': name3.toJson(),
      'name4': name4.toJson(),
    };
  }

  static SalutationCodeFormularDTOInclude include(
      {_i2.LanguageCodeDTOInclude? languageCode}) {
    return SalutationCodeFormularDTOInclude._(languageCode: languageCode);
  }

  static SalutationCodeFormularDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<SalutationCodeFormularDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalutationCodeFormularDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalutationCodeFormularDTOTable>? orderByList,
    SalutationCodeFormularDTOInclude? include,
  }) {
    return SalutationCodeFormularDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(SalutationCodeFormularDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(SalutationCodeFormularDTO.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalutationCodeFormularDTOImpl extends SalutationCodeFormularDTO {
  _SalutationCodeFormularDTOImpl({
    int? id,
    required int languageCodeId,
    _i2.LanguageCodeDTO? languageCode,
    required _i3.SalutationType salutationType,
    required String salutation,
    required _i4.ContactField name1,
    required _i4.ContactField name2,
    required _i4.ContactField name3,
    required _i4.ContactField name4,
  }) : super._(
          id: id,
          languageCodeId: languageCodeId,
          languageCode: languageCode,
          salutationType: salutationType,
          salutation: salutation,
          name1: name1,
          name2: name2,
          name3: name3,
          name4: name4,
        );

  /// Returns a shallow copy of this [SalutationCodeFormularDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalutationCodeFormularDTO copyWith({
    Object? id = _Undefined,
    int? languageCodeId,
    Object? languageCode = _Undefined,
    _i3.SalutationType? salutationType,
    String? salutation,
    _i4.ContactField? name1,
    _i4.ContactField? name2,
    _i4.ContactField? name3,
    _i4.ContactField? name4,
  }) {
    return SalutationCodeFormularDTO(
      id: id is int? ? id : this.id,
      languageCodeId: languageCodeId ?? this.languageCodeId,
      languageCode: languageCode is _i2.LanguageCodeDTO?
          ? languageCode
          : this.languageCode?.copyWith(),
      salutationType: salutationType ?? this.salutationType,
      salutation: salutation ?? this.salutation,
      name1: name1 ?? this.name1,
      name2: name2 ?? this.name2,
      name3: name3 ?? this.name3,
      name4: name4 ?? this.name4,
    );
  }
}

class SalutationCodeFormularDTOTable extends _i1.Table<int?> {
  SalutationCodeFormularDTOTable({super.tableRelation})
      : super(tableName: 'ed_crm_salutation_code_formular') {
    languageCodeId = _i1.ColumnInt(
      'languageCodeId',
      this,
    );
    salutationType = _i1.ColumnEnum(
      'salutationType',
      this,
      _i1.EnumSerialization.byName,
    );
    salutation = _i1.ColumnString(
      'salutation',
      this,
    );
    name1 = _i1.ColumnEnum(
      'name1',
      this,
      _i1.EnumSerialization.byName,
    );
    name2 = _i1.ColumnEnum(
      'name2',
      this,
      _i1.EnumSerialization.byName,
    );
    name3 = _i1.ColumnEnum(
      'name3',
      this,
      _i1.EnumSerialization.byName,
    );
    name4 = _i1.ColumnEnum(
      'name4',
      this,
      _i1.EnumSerialization.byName,
    );
  }

  late final _i1.ColumnInt languageCodeId;

  _i2.LanguageCodeDTOTable? _languageCode;

  late final _i1.ColumnEnum<_i3.SalutationType> salutationType;

  late final _i1.ColumnString salutation;

  late final _i1.ColumnEnum<_i4.ContactField> name1;

  late final _i1.ColumnEnum<_i4.ContactField> name2;

  late final _i1.ColumnEnum<_i4.ContactField> name3;

  late final _i1.ColumnEnum<_i4.ContactField> name4;

  _i2.LanguageCodeDTOTable get languageCode {
    if (_languageCode != null) return _languageCode!;
    _languageCode = _i1.createRelationTable(
      relationFieldName: 'languageCode',
      field: SalutationCodeFormularDTO.t.languageCodeId,
      foreignField: _i2.LanguageCodeDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.LanguageCodeDTOTable(tableRelation: foreignTableRelation),
    );
    return _languageCode!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        languageCodeId,
        salutationType,
        salutation,
        name1,
        name2,
        name3,
        name4,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'languageCode') {
      return languageCode;
    }
    return null;
  }
}

class SalutationCodeFormularDTOInclude extends _i1.IncludeObject {
  SalutationCodeFormularDTOInclude._(
      {_i2.LanguageCodeDTOInclude? languageCode}) {
    _languageCode = languageCode;
  }

  _i2.LanguageCodeDTOInclude? _languageCode;

  @override
  Map<String, _i1.Include?> get includes => {'languageCode': _languageCode};

  @override
  _i1.Table<int?> get table => SalutationCodeFormularDTO.t;
}

class SalutationCodeFormularDTOIncludeList extends _i1.IncludeList {
  SalutationCodeFormularDTOIncludeList._({
    _i1.WhereExpressionBuilder<SalutationCodeFormularDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(SalutationCodeFormularDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => SalutationCodeFormularDTO.t;
}

class SalutationCodeFormularDTORepository {
  const SalutationCodeFormularDTORepository._();

  final attachRow = const SalutationCodeFormularDTOAttachRowRepository._();

  /// Returns a list of [SalutationCodeFormularDTO]s matching the given query parameters.
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
  Future<List<SalutationCodeFormularDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalutationCodeFormularDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<SalutationCodeFormularDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalutationCodeFormularDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalutationCodeFormularDTOInclude? include,
  }) async {
    return session.db.find<SalutationCodeFormularDTO>(
      where: where?.call(SalutationCodeFormularDTO.t),
      orderBy: orderBy?.call(SalutationCodeFormularDTO.t),
      orderByList: orderByList?.call(SalutationCodeFormularDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [SalutationCodeFormularDTO] matching the given query parameters.
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
  Future<SalutationCodeFormularDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalutationCodeFormularDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<SalutationCodeFormularDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<SalutationCodeFormularDTOTable>? orderByList,
    _i1.Transaction? transaction,
    SalutationCodeFormularDTOInclude? include,
  }) async {
    return session.db.findFirstRow<SalutationCodeFormularDTO>(
      where: where?.call(SalutationCodeFormularDTO.t),
      orderBy: orderBy?.call(SalutationCodeFormularDTO.t),
      orderByList: orderByList?.call(SalutationCodeFormularDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [SalutationCodeFormularDTO] by its [id] or null if no such row exists.
  Future<SalutationCodeFormularDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    SalutationCodeFormularDTOInclude? include,
  }) async {
    return session.db.findById<SalutationCodeFormularDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [SalutationCodeFormularDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [SalutationCodeFormularDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<SalutationCodeFormularDTO>> insert(
    _i1.Session session,
    List<SalutationCodeFormularDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<SalutationCodeFormularDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [SalutationCodeFormularDTO] and returns the inserted row.
  ///
  /// The returned [SalutationCodeFormularDTO] will have its `id` field set.
  Future<SalutationCodeFormularDTO> insertRow(
    _i1.Session session,
    SalutationCodeFormularDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<SalutationCodeFormularDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [SalutationCodeFormularDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<SalutationCodeFormularDTO>> update(
    _i1.Session session,
    List<SalutationCodeFormularDTO> rows, {
    _i1.ColumnSelections<SalutationCodeFormularDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<SalutationCodeFormularDTO>(
      rows,
      columns: columns?.call(SalutationCodeFormularDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [SalutationCodeFormularDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<SalutationCodeFormularDTO> updateRow(
    _i1.Session session,
    SalutationCodeFormularDTO row, {
    _i1.ColumnSelections<SalutationCodeFormularDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<SalutationCodeFormularDTO>(
      row,
      columns: columns?.call(SalutationCodeFormularDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [SalutationCodeFormularDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<SalutationCodeFormularDTO>> delete(
    _i1.Session session,
    List<SalutationCodeFormularDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<SalutationCodeFormularDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [SalutationCodeFormularDTO].
  Future<SalutationCodeFormularDTO> deleteRow(
    _i1.Session session,
    SalutationCodeFormularDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<SalutationCodeFormularDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<SalutationCodeFormularDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<SalutationCodeFormularDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<SalutationCodeFormularDTO>(
      where: where(SalutationCodeFormularDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<SalutationCodeFormularDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<SalutationCodeFormularDTO>(
      where: where?.call(SalutationCodeFormularDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class SalutationCodeFormularDTOAttachRowRepository {
  const SalutationCodeFormularDTOAttachRowRepository._();

  /// Creates a relation between the given [SalutationCodeFormularDTO] and [LanguageCodeDTO]
  /// by setting the [SalutationCodeFormularDTO]'s foreign key `languageCodeId` to refer to the [LanguageCodeDTO].
  Future<void> languageCode(
    _i1.Session session,
    SalutationCodeFormularDTO salutationCodeFormularDTO,
    _i2.LanguageCodeDTO languageCode, {
    _i1.Transaction? transaction,
  }) async {
    if (salutationCodeFormularDTO.id == null) {
      throw ArgumentError.notNull('salutationCodeFormularDTO.id');
    }
    if (languageCode.id == null) {
      throw ArgumentError.notNull('languageCode.id');
    }

    var $salutationCodeFormularDTO =
        salutationCodeFormularDTO.copyWith(languageCodeId: languageCode.id);
    await session.db.updateRow<SalutationCodeFormularDTO>(
      $salutationCodeFormularDTO,
      columns: [SalutationCodeFormularDTO.t.languageCodeId],
      transaction: transaction,
    );
  }
}
