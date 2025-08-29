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
import '../../../../modules/crm/crm_event/models/crm_event.dart' as _i2;
import '../../../../modules/crm/contact/models/contact.dart' as _i3;

abstract class CrmEventContactJT
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  CrmEventContactJT._({
    this.id,
    required this.crmEventId,
    this.crmEvent,
    required this.contactId,
    this.contact,
    this.deletedAt,
  });

  factory CrmEventContactJT({
    int? id,
    required int crmEventId,
    _i2.CrmEventDTO? crmEvent,
    required int contactId,
    _i3.ContactDTO? contact,
    DateTime? deletedAt,
  }) = _CrmEventContactJTImpl;

  factory CrmEventContactJT.fromJson(Map<String, dynamic> jsonSerialization) {
    return CrmEventContactJT(
      id: jsonSerialization['id'] as int?,
      crmEventId: jsonSerialization['crmEventId'] as int,
      crmEvent: jsonSerialization['crmEvent'] == null
          ? null
          : _i2.CrmEventDTO.fromJson(
              (jsonSerialization['crmEvent'] as Map<String, dynamic>)),
      contactId: jsonSerialization['contactId'] as int,
      contact: jsonSerialization['contact'] == null
          ? null
          : _i3.ContactDTO.fromJson(
              (jsonSerialization['contact'] as Map<String, dynamic>)),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  static final t = CrmEventContactJTTable();

  static const db = CrmEventContactJTRepository._();

  @override
  int? id;

  int crmEventId;

  _i2.CrmEventDTO? crmEvent;

  int contactId;

  _i3.ContactDTO? contact;

  DateTime? deletedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [CrmEventContactJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CrmEventContactJT copyWith({
    int? id,
    int? crmEventId,
    _i2.CrmEventDTO? crmEvent,
    int? contactId,
    _i3.ContactDTO? contact,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'crmEventId': crmEventId,
      if (crmEvent != null) 'crmEvent': crmEvent?.toJson(),
      'contactId': contactId,
      if (contact != null) 'contact': contact?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'crmEventId': crmEventId,
      if (crmEvent != null) 'crmEvent': crmEvent?.toJsonForProtocol(),
      'contactId': contactId,
      if (contact != null) 'contact': contact?.toJsonForProtocol(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  static CrmEventContactJTInclude include({
    _i2.CrmEventDTOInclude? crmEvent,
    _i3.ContactDTOInclude? contact,
  }) {
    return CrmEventContactJTInclude._(
      crmEvent: crmEvent,
      contact: contact,
    );
  }

  static CrmEventContactJTIncludeList includeList({
    _i1.WhereExpressionBuilder<CrmEventContactJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CrmEventContactJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrmEventContactJTTable>? orderByList,
    CrmEventContactJTInclude? include,
  }) {
    return CrmEventContactJTIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(CrmEventContactJT.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(CrmEventContactJT.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CrmEventContactJTImpl extends CrmEventContactJT {
  _CrmEventContactJTImpl({
    int? id,
    required int crmEventId,
    _i2.CrmEventDTO? crmEvent,
    required int contactId,
    _i3.ContactDTO? contact,
    DateTime? deletedAt,
  }) : super._(
          id: id,
          crmEventId: crmEventId,
          crmEvent: crmEvent,
          contactId: contactId,
          contact: contact,
          deletedAt: deletedAt,
        );

  /// Returns a shallow copy of this [CrmEventContactJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CrmEventContactJT copyWith({
    Object? id = _Undefined,
    int? crmEventId,
    Object? crmEvent = _Undefined,
    int? contactId,
    Object? contact = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return CrmEventContactJT(
      id: id is int? ? id : this.id,
      crmEventId: crmEventId ?? this.crmEventId,
      crmEvent:
          crmEvent is _i2.CrmEventDTO? ? crmEvent : this.crmEvent?.copyWith(),
      contactId: contactId ?? this.contactId,
      contact: contact is _i3.ContactDTO? ? contact : this.contact?.copyWith(),
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}

class CrmEventContactJTTable extends _i1.Table<int?> {
  CrmEventContactJTTable({super.tableRelation})
      : super(tableName: 'jt_crm_event_contacts') {
    crmEventId = _i1.ColumnInt(
      'crmEventId',
      this,
    );
    contactId = _i1.ColumnInt(
      'contactId',
      this,
    );
    deletedAt = _i1.ColumnDateTime(
      'deletedAt',
      this,
    );
  }

  late final _i1.ColumnInt crmEventId;

  _i2.CrmEventDTOTable? _crmEvent;

  late final _i1.ColumnInt contactId;

  _i3.ContactDTOTable? _contact;

  late final _i1.ColumnDateTime deletedAt;

  _i2.CrmEventDTOTable get crmEvent {
    if (_crmEvent != null) return _crmEvent!;
    _crmEvent = _i1.createRelationTable(
      relationFieldName: 'crmEvent',
      field: CrmEventContactJT.t.crmEventId,
      foreignField: _i2.CrmEventDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.CrmEventDTOTable(tableRelation: foreignTableRelation),
    );
    return _crmEvent!;
  }

  _i3.ContactDTOTable get contact {
    if (_contact != null) return _contact!;
    _contact = _i1.createRelationTable(
      relationFieldName: 'contact',
      field: CrmEventContactJT.t.contactId,
      foreignField: _i3.ContactDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ContactDTOTable(tableRelation: foreignTableRelation),
    );
    return _contact!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        crmEventId,
        contactId,
        deletedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'crmEvent') {
      return crmEvent;
    }
    if (relationField == 'contact') {
      return contact;
    }
    return null;
  }
}

class CrmEventContactJTInclude extends _i1.IncludeObject {
  CrmEventContactJTInclude._({
    _i2.CrmEventDTOInclude? crmEvent,
    _i3.ContactDTOInclude? contact,
  }) {
    _crmEvent = crmEvent;
    _contact = contact;
  }

  _i2.CrmEventDTOInclude? _crmEvent;

  _i3.ContactDTOInclude? _contact;

  @override
  Map<String, _i1.Include?> get includes => {
        'crmEvent': _crmEvent,
        'contact': _contact,
      };

  @override
  _i1.Table<int?> get table => CrmEventContactJT.t;
}

class CrmEventContactJTIncludeList extends _i1.IncludeList {
  CrmEventContactJTIncludeList._({
    _i1.WhereExpressionBuilder<CrmEventContactJTTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(CrmEventContactJT.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => CrmEventContactJT.t;
}

class CrmEventContactJTRepository {
  const CrmEventContactJTRepository._();

  final attachRow = const CrmEventContactJTAttachRowRepository._();

  /// Returns a list of [CrmEventContactJT]s matching the given query parameters.
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
  Future<List<CrmEventContactJT>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrmEventContactJTTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CrmEventContactJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrmEventContactJTTable>? orderByList,
    _i1.Transaction? transaction,
    CrmEventContactJTInclude? include,
  }) async {
    return session.db.find<CrmEventContactJT>(
      where: where?.call(CrmEventContactJT.t),
      orderBy: orderBy?.call(CrmEventContactJT.t),
      orderByList: orderByList?.call(CrmEventContactJT.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [CrmEventContactJT] matching the given query parameters.
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
  Future<CrmEventContactJT?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrmEventContactJTTable>? where,
    int? offset,
    _i1.OrderByBuilder<CrmEventContactJTTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CrmEventContactJTTable>? orderByList,
    _i1.Transaction? transaction,
    CrmEventContactJTInclude? include,
  }) async {
    return session.db.findFirstRow<CrmEventContactJT>(
      where: where?.call(CrmEventContactJT.t),
      orderBy: orderBy?.call(CrmEventContactJT.t),
      orderByList: orderByList?.call(CrmEventContactJT.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [CrmEventContactJT] by its [id] or null if no such row exists.
  Future<CrmEventContactJT?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CrmEventContactJTInclude? include,
  }) async {
    return session.db.findById<CrmEventContactJT>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [CrmEventContactJT]s in the list and returns the inserted rows.
  ///
  /// The returned [CrmEventContactJT]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<CrmEventContactJT>> insert(
    _i1.Session session,
    List<CrmEventContactJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<CrmEventContactJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [CrmEventContactJT] and returns the inserted row.
  ///
  /// The returned [CrmEventContactJT] will have its `id` field set.
  Future<CrmEventContactJT> insertRow(
    _i1.Session session,
    CrmEventContactJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<CrmEventContactJT>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [CrmEventContactJT]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<CrmEventContactJT>> update(
    _i1.Session session,
    List<CrmEventContactJT> rows, {
    _i1.ColumnSelections<CrmEventContactJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<CrmEventContactJT>(
      rows,
      columns: columns?.call(CrmEventContactJT.t),
      transaction: transaction,
    );
  }

  /// Updates a single [CrmEventContactJT]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<CrmEventContactJT> updateRow(
    _i1.Session session,
    CrmEventContactJT row, {
    _i1.ColumnSelections<CrmEventContactJTTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<CrmEventContactJT>(
      row,
      columns: columns?.call(CrmEventContactJT.t),
      transaction: transaction,
    );
  }

  /// Deletes all [CrmEventContactJT]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<CrmEventContactJT>> delete(
    _i1.Session session,
    List<CrmEventContactJT> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<CrmEventContactJT>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [CrmEventContactJT].
  Future<CrmEventContactJT> deleteRow(
    _i1.Session session,
    CrmEventContactJT row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<CrmEventContactJT>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<CrmEventContactJT>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CrmEventContactJTTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<CrmEventContactJT>(
      where: where(CrmEventContactJT.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CrmEventContactJTTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<CrmEventContactJT>(
      where: where?.call(CrmEventContactJT.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CrmEventContactJTAttachRowRepository {
  const CrmEventContactJTAttachRowRepository._();

  /// Creates a relation between the given [CrmEventContactJT] and [CrmEventDTO]
  /// by setting the [CrmEventContactJT]'s foreign key `crmEventId` to refer to the [CrmEventDTO].
  Future<void> crmEvent(
    _i1.Session session,
    CrmEventContactJT crmEventContactJT,
    _i2.CrmEventDTO crmEvent, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.id == null) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }
    if (crmEvent.id == null) {
      throw ArgumentError.notNull('crmEvent.id');
    }

    var $crmEventContactJT =
        crmEventContactJT.copyWith(crmEventId: crmEvent.id);
    await session.db.updateRow<CrmEventContactJT>(
      $crmEventContactJT,
      columns: [CrmEventContactJT.t.crmEventId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [CrmEventContactJT] and [ContactDTO]
  /// by setting the [CrmEventContactJT]'s foreign key `contactId` to refer to the [ContactDTO].
  Future<void> contact(
    _i1.Session session,
    CrmEventContactJT crmEventContactJT,
    _i3.ContactDTO contact, {
    _i1.Transaction? transaction,
  }) async {
    if (crmEventContactJT.id == null) {
      throw ArgumentError.notNull('crmEventContactJT.id');
    }
    if (contact.id == null) {
      throw ArgumentError.notNull('contact.id');
    }

    var $crmEventContactJT = crmEventContactJT.copyWith(contactId: contact.id);
    await session.db.updateRow<CrmEventContactJT>(
      $crmEventContactJT,
      columns: [CrmEventContactJT.t.contactId],
      transaction: transaction,
    );
  }
}
