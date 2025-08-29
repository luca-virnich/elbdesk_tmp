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

abstract class PaymentCodeDTO implements _i1.SerializableModel {
  PaymentCodeDTO._({
    this.id,
    required this.code,
    required this.dueDateCalculation,
    required this.discountDateCalculation,
    required this.discountPercentage,
    required this.calculateDiscountOnCreditNote,
    required this.description,
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

  factory PaymentCodeDTO({
    int? id,
    required String code,
    required String dueDateCalculation,
    required String discountDateCalculation,
    required double discountPercentage,
    required bool calculateDiscountOnCreditNote,
    required String description,
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
  }) = _PaymentCodeDTOImpl;

  factory PaymentCodeDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return PaymentCodeDTO(
      id: jsonSerialization['id'] as int?,
      code: jsonSerialization['code'] as String,
      dueDateCalculation: jsonSerialization['dueDateCalculation'] as String,
      discountDateCalculation:
          jsonSerialization['discountDateCalculation'] as String,
      discountPercentage:
          (jsonSerialization['discountPercentage'] as num).toDouble(),
      calculateDiscountOnCreditNote:
          jsonSerialization['calculateDiscountOnCreditNote'] as bool,
      description: jsonSerialization['description'] as String,
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

  String code;

  String dueDateCalculation;

  String discountDateCalculation;

  double discountPercentage;

  bool calculateDiscountOnCreditNote;

  String description;

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

  /// Returns a shallow copy of this [PaymentCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PaymentCodeDTO copyWith({
    int? id,
    String? code,
    String? dueDateCalculation,
    String? discountDateCalculation,
    double? discountPercentage,
    bool? calculateDiscountOnCreditNote,
    String? description,
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
      'code': code,
      'dueDateCalculation': dueDateCalculation,
      'discountDateCalculation': discountDateCalculation,
      'discountPercentage': discountPercentage,
      'calculateDiscountOnCreditNote': calculateDiscountOnCreditNote,
      'description': description,
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

class _PaymentCodeDTOImpl extends PaymentCodeDTO {
  _PaymentCodeDTOImpl({
    int? id,
    required String code,
    required String dueDateCalculation,
    required String discountDateCalculation,
    required double discountPercentage,
    required bool calculateDiscountOnCreditNote,
    required String description,
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
          code: code,
          dueDateCalculation: dueDateCalculation,
          discountDateCalculation: discountDateCalculation,
          discountPercentage: discountPercentage,
          calculateDiscountOnCreditNote: calculateDiscountOnCreditNote,
          description: description,
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

  /// Returns a shallow copy of this [PaymentCodeDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PaymentCodeDTO copyWith({
    Object? id = _Undefined,
    String? code,
    String? dueDateCalculation,
    String? discountDateCalculation,
    double? discountPercentage,
    bool? calculateDiscountOnCreditNote,
    String? description,
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
    return PaymentCodeDTO(
      id: id is int? ? id : this.id,
      code: code ?? this.code,
      dueDateCalculation: dueDateCalculation ?? this.dueDateCalculation,
      discountDateCalculation:
          discountDateCalculation ?? this.discountDateCalculation,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      calculateDiscountOnCreditNote:
          calculateDiscountOnCreditNote ?? this.calculateDiscountOnCreditNote,
      description: description ?? this.description,
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
