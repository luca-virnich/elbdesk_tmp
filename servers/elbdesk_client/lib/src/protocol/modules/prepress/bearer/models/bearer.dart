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
import '../../../../modules/prepress/bearer/models/bearer_type.dart' as _i2;
import '../../../../modules/prepress/bearer/models/types/bearer_type1.dart'
    as _i3;
import '../../../../modules/prepress/bearer/models/types/bearer_type2.dart'
    as _i4;
import '../../../../modules/prepress/bearer/models/types/bearer_standard_flexo.dart'
    as _i5;
import '../../../../modules/prepress/bearer/models/types/bearer_flexo_print_multilayer.dart'
    as _i6;
import '../../../../modules/prepress/bearer/models/types/bearer_sheet_fed_press_min_plate.dart'
    as _i7;
import '../../../../modules/prepress/bearer/models/types/bearer_sheet_fed_press_plate_equals_sub.dart'
    as _i8;
import '../../../../modules/prepress/bearer/models/types/bearer_offset_press_fixed_plate.dart'
    as _i9;
import '../../../../modules/prepress/bearer/models/types/bearer_sheet_fed_press_fixed_plate.dart'
    as _i10;
import '../../../../modules/unsorted/junction_tables/customer_bearer.dart'
    as _i11;

abstract class BearerDTO implements _i1.SerializableModel {
  BearerDTO._({
    this.id,
    required this.type,
    required this.bearerName,
    required this.description,
    required this.longText,
    required this.costCenterCode,
    this.type1Id,
    this.type1,
    this.type2Id,
    this.type2,
    this.typeStandardFlexoPrintId,
    this.typeStandardFlexoPrint,
    this.typeFlexoPrintMultilayerId,
    this.typeFlexoPrintMultilayer,
    this.typeSheetFedPressMinPlateId,
    this.typeSheetFedPressMinPlate,
    this.typeSheetFedPressPlateEqualsSubId,
    this.typeSheetFedPressPlateEqualsSub,
    this.typeOffsetPressFixedPlateId,
    this.typeOffsetPressFixedPlate,
    this.typeSheetFedPressFixedPlateId,
    this.typeSheetFedPressFixedPlate,
    this.customer,
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

  factory BearerDTO({
    int? id,
    required _i2.BearerType type,
    required String bearerName,
    required String description,
    required String longText,
    required String costCenterCode,
    int? type1Id,
    _i3.BearerType1DTO? type1,
    int? type2Id,
    _i4.BearerType2DTO? type2,
    int? typeStandardFlexoPrintId,
    _i5.BearerTypeStandardFlexoPrintDTO? typeStandardFlexoPrint,
    int? typeFlexoPrintMultilayerId,
    _i6.BearerTypeFlexoPrintMultilayerDTO? typeFlexoPrintMultilayer,
    int? typeSheetFedPressMinPlateId,
    _i7.BearerTypeSheetFedPressMinPlateDTO? typeSheetFedPressMinPlate,
    int? typeSheetFedPressPlateEqualsSubId,
    _i8.BearerTypeSheetFedPressPlateEqualsSubDTO?
        typeSheetFedPressPlateEqualsSub,
    int? typeOffsetPressFixedPlateId,
    _i9.BearerTypeOffsetPressFixedPlateDTO? typeOffsetPressFixedPlate,
    int? typeSheetFedPressFixedPlateId,
    _i10.BearerTypeSheetFedPressFixedPlateDTO? typeSheetFedPressFixedPlate,
    List<_i11.BearerCustomerRelation>? customer,
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
  }) = _BearerDTOImpl;

  factory BearerDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return BearerDTO(
      id: jsonSerialization['id'] as int?,
      type: _i2.BearerType.fromJson((jsonSerialization['type'] as String)),
      bearerName: jsonSerialization['bearerName'] as String,
      description: jsonSerialization['description'] as String,
      longText: jsonSerialization['longText'] as String,
      costCenterCode: jsonSerialization['costCenterCode'] as String,
      type1Id: jsonSerialization['type1Id'] as int?,
      type1: jsonSerialization['type1'] == null
          ? null
          : _i3.BearerType1DTO.fromJson(
              (jsonSerialization['type1'] as Map<String, dynamic>)),
      type2Id: jsonSerialization['type2Id'] as int?,
      type2: jsonSerialization['type2'] == null
          ? null
          : _i4.BearerType2DTO.fromJson(
              (jsonSerialization['type2'] as Map<String, dynamic>)),
      typeStandardFlexoPrintId:
          jsonSerialization['typeStandardFlexoPrintId'] as int?,
      typeStandardFlexoPrint:
          jsonSerialization['typeStandardFlexoPrint'] == null
              ? null
              : _i5.BearerTypeStandardFlexoPrintDTO.fromJson(
                  (jsonSerialization['typeStandardFlexoPrint']
                      as Map<String, dynamic>)),
      typeFlexoPrintMultilayerId:
          jsonSerialization['typeFlexoPrintMultilayerId'] as int?,
      typeFlexoPrintMultilayer:
          jsonSerialization['typeFlexoPrintMultilayer'] == null
              ? null
              : _i6.BearerTypeFlexoPrintMultilayerDTO.fromJson(
                  (jsonSerialization['typeFlexoPrintMultilayer']
                      as Map<String, dynamic>)),
      typeSheetFedPressMinPlateId:
          jsonSerialization['typeSheetFedPressMinPlateId'] as int?,
      typeSheetFedPressMinPlate:
          jsonSerialization['typeSheetFedPressMinPlate'] == null
              ? null
              : _i7.BearerTypeSheetFedPressMinPlateDTO.fromJson(
                  (jsonSerialization['typeSheetFedPressMinPlate']
                      as Map<String, dynamic>)),
      typeSheetFedPressPlateEqualsSubId:
          jsonSerialization['typeSheetFedPressPlateEqualsSubId'] as int?,
      typeSheetFedPressPlateEqualsSub:
          jsonSerialization['typeSheetFedPressPlateEqualsSub'] == null
              ? null
              : _i8.BearerTypeSheetFedPressPlateEqualsSubDTO.fromJson(
                  (jsonSerialization['typeSheetFedPressPlateEqualsSub']
                      as Map<String, dynamic>)),
      typeOffsetPressFixedPlateId:
          jsonSerialization['typeOffsetPressFixedPlateId'] as int?,
      typeOffsetPressFixedPlate:
          jsonSerialization['typeOffsetPressFixedPlate'] == null
              ? null
              : _i9.BearerTypeOffsetPressFixedPlateDTO.fromJson(
                  (jsonSerialization['typeOffsetPressFixedPlate']
                      as Map<String, dynamic>)),
      typeSheetFedPressFixedPlateId:
          jsonSerialization['typeSheetFedPressFixedPlateId'] as int?,
      typeSheetFedPressFixedPlate:
          jsonSerialization['typeSheetFedPressFixedPlate'] == null
              ? null
              : _i10.BearerTypeSheetFedPressFixedPlateDTO.fromJson(
                  (jsonSerialization['typeSheetFedPressFixedPlate']
                      as Map<String, dynamic>)),
      customer: (jsonSerialization['customer'] as List?)
          ?.map((e) =>
              _i11.BearerCustomerRelation.fromJson((e as Map<String, dynamic>)))
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  _i2.BearerType type;

  String bearerName;

  String description;

  String longText;

  String costCenterCode;

  int? type1Id;

  _i3.BearerType1DTO? type1;

  int? type2Id;

  _i4.BearerType2DTO? type2;

  int? typeStandardFlexoPrintId;

  _i5.BearerTypeStandardFlexoPrintDTO? typeStandardFlexoPrint;

  int? typeFlexoPrintMultilayerId;

  _i6.BearerTypeFlexoPrintMultilayerDTO? typeFlexoPrintMultilayer;

  int? typeSheetFedPressMinPlateId;

  _i7.BearerTypeSheetFedPressMinPlateDTO? typeSheetFedPressMinPlate;

  int? typeSheetFedPressPlateEqualsSubId;

  _i8.BearerTypeSheetFedPressPlateEqualsSubDTO? typeSheetFedPressPlateEqualsSub;

  int? typeOffsetPressFixedPlateId;

  _i9.BearerTypeOffsetPressFixedPlateDTO? typeOffsetPressFixedPlate;

  int? typeSheetFedPressFixedPlateId;

  _i10.BearerTypeSheetFedPressFixedPlateDTO? typeSheetFedPressFixedPlate;

  List<_i11.BearerCustomerRelation>? customer;

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

  /// Returns a shallow copy of this [BearerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerDTO copyWith({
    int? id,
    _i2.BearerType? type,
    String? bearerName,
    String? description,
    String? longText,
    String? costCenterCode,
    int? type1Id,
    _i3.BearerType1DTO? type1,
    int? type2Id,
    _i4.BearerType2DTO? type2,
    int? typeStandardFlexoPrintId,
    _i5.BearerTypeStandardFlexoPrintDTO? typeStandardFlexoPrint,
    int? typeFlexoPrintMultilayerId,
    _i6.BearerTypeFlexoPrintMultilayerDTO? typeFlexoPrintMultilayer,
    int? typeSheetFedPressMinPlateId,
    _i7.BearerTypeSheetFedPressMinPlateDTO? typeSheetFedPressMinPlate,
    int? typeSheetFedPressPlateEqualsSubId,
    _i8.BearerTypeSheetFedPressPlateEqualsSubDTO?
        typeSheetFedPressPlateEqualsSub,
    int? typeOffsetPressFixedPlateId,
    _i9.BearerTypeOffsetPressFixedPlateDTO? typeOffsetPressFixedPlate,
    int? typeSheetFedPressFixedPlateId,
    _i10.BearerTypeSheetFedPressFixedPlateDTO? typeSheetFedPressFixedPlate,
    List<_i11.BearerCustomerRelation>? customer,
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
      'type': type.toJson(),
      'bearerName': bearerName,
      'description': description,
      'longText': longText,
      'costCenterCode': costCenterCode,
      if (type1Id != null) 'type1Id': type1Id,
      if (type1 != null) 'type1': type1?.toJson(),
      if (type2Id != null) 'type2Id': type2Id,
      if (type2 != null) 'type2': type2?.toJson(),
      if (typeStandardFlexoPrintId != null)
        'typeStandardFlexoPrintId': typeStandardFlexoPrintId,
      if (typeStandardFlexoPrint != null)
        'typeStandardFlexoPrint': typeStandardFlexoPrint?.toJson(),
      if (typeFlexoPrintMultilayerId != null)
        'typeFlexoPrintMultilayerId': typeFlexoPrintMultilayerId,
      if (typeFlexoPrintMultilayer != null)
        'typeFlexoPrintMultilayer': typeFlexoPrintMultilayer?.toJson(),
      if (typeSheetFedPressMinPlateId != null)
        'typeSheetFedPressMinPlateId': typeSheetFedPressMinPlateId,
      if (typeSheetFedPressMinPlate != null)
        'typeSheetFedPressMinPlate': typeSheetFedPressMinPlate?.toJson(),
      if (typeSheetFedPressPlateEqualsSubId != null)
        'typeSheetFedPressPlateEqualsSubId': typeSheetFedPressPlateEqualsSubId,
      if (typeSheetFedPressPlateEqualsSub != null)
        'typeSheetFedPressPlateEqualsSub':
            typeSheetFedPressPlateEqualsSub?.toJson(),
      if (typeOffsetPressFixedPlateId != null)
        'typeOffsetPressFixedPlateId': typeOffsetPressFixedPlateId,
      if (typeOffsetPressFixedPlate != null)
        'typeOffsetPressFixedPlate': typeOffsetPressFixedPlate?.toJson(),
      if (typeSheetFedPressFixedPlateId != null)
        'typeSheetFedPressFixedPlateId': typeSheetFedPressFixedPlateId,
      if (typeSheetFedPressFixedPlate != null)
        'typeSheetFedPressFixedPlate': typeSheetFedPressFixedPlate?.toJson(),
      if (customer != null)
        'customer': customer?.toJson(valueToJson: (v) => v.toJson()),
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

class _BearerDTOImpl extends BearerDTO {
  _BearerDTOImpl({
    int? id,
    required _i2.BearerType type,
    required String bearerName,
    required String description,
    required String longText,
    required String costCenterCode,
    int? type1Id,
    _i3.BearerType1DTO? type1,
    int? type2Id,
    _i4.BearerType2DTO? type2,
    int? typeStandardFlexoPrintId,
    _i5.BearerTypeStandardFlexoPrintDTO? typeStandardFlexoPrint,
    int? typeFlexoPrintMultilayerId,
    _i6.BearerTypeFlexoPrintMultilayerDTO? typeFlexoPrintMultilayer,
    int? typeSheetFedPressMinPlateId,
    _i7.BearerTypeSheetFedPressMinPlateDTO? typeSheetFedPressMinPlate,
    int? typeSheetFedPressPlateEqualsSubId,
    _i8.BearerTypeSheetFedPressPlateEqualsSubDTO?
        typeSheetFedPressPlateEqualsSub,
    int? typeOffsetPressFixedPlateId,
    _i9.BearerTypeOffsetPressFixedPlateDTO? typeOffsetPressFixedPlate,
    int? typeSheetFedPressFixedPlateId,
    _i10.BearerTypeSheetFedPressFixedPlateDTO? typeSheetFedPressFixedPlate,
    List<_i11.BearerCustomerRelation>? customer,
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
          type: type,
          bearerName: bearerName,
          description: description,
          longText: longText,
          costCenterCode: costCenterCode,
          type1Id: type1Id,
          type1: type1,
          type2Id: type2Id,
          type2: type2,
          typeStandardFlexoPrintId: typeStandardFlexoPrintId,
          typeStandardFlexoPrint: typeStandardFlexoPrint,
          typeFlexoPrintMultilayerId: typeFlexoPrintMultilayerId,
          typeFlexoPrintMultilayer: typeFlexoPrintMultilayer,
          typeSheetFedPressMinPlateId: typeSheetFedPressMinPlateId,
          typeSheetFedPressMinPlate: typeSheetFedPressMinPlate,
          typeSheetFedPressPlateEqualsSubId: typeSheetFedPressPlateEqualsSubId,
          typeSheetFedPressPlateEqualsSub: typeSheetFedPressPlateEqualsSub,
          typeOffsetPressFixedPlateId: typeOffsetPressFixedPlateId,
          typeOffsetPressFixedPlate: typeOffsetPressFixedPlate,
          typeSheetFedPressFixedPlateId: typeSheetFedPressFixedPlateId,
          typeSheetFedPressFixedPlate: typeSheetFedPressFixedPlate,
          customer: customer,
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

  /// Returns a shallow copy of this [BearerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerDTO copyWith({
    Object? id = _Undefined,
    _i2.BearerType? type,
    String? bearerName,
    String? description,
    String? longText,
    String? costCenterCode,
    Object? type1Id = _Undefined,
    Object? type1 = _Undefined,
    Object? type2Id = _Undefined,
    Object? type2 = _Undefined,
    Object? typeStandardFlexoPrintId = _Undefined,
    Object? typeStandardFlexoPrint = _Undefined,
    Object? typeFlexoPrintMultilayerId = _Undefined,
    Object? typeFlexoPrintMultilayer = _Undefined,
    Object? typeSheetFedPressMinPlateId = _Undefined,
    Object? typeSheetFedPressMinPlate = _Undefined,
    Object? typeSheetFedPressPlateEqualsSubId = _Undefined,
    Object? typeSheetFedPressPlateEqualsSub = _Undefined,
    Object? typeOffsetPressFixedPlateId = _Undefined,
    Object? typeOffsetPressFixedPlate = _Undefined,
    Object? typeSheetFedPressFixedPlateId = _Undefined,
    Object? typeSheetFedPressFixedPlate = _Undefined,
    Object? customer = _Undefined,
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
    return BearerDTO(
      id: id is int? ? id : this.id,
      type: type ?? this.type,
      bearerName: bearerName ?? this.bearerName,
      description: description ?? this.description,
      longText: longText ?? this.longText,
      costCenterCode: costCenterCode ?? this.costCenterCode,
      type1Id: type1Id is int? ? type1Id : this.type1Id,
      type1: type1 is _i3.BearerType1DTO? ? type1 : this.type1?.copyWith(),
      type2Id: type2Id is int? ? type2Id : this.type2Id,
      type2: type2 is _i4.BearerType2DTO? ? type2 : this.type2?.copyWith(),
      typeStandardFlexoPrintId: typeStandardFlexoPrintId is int?
          ? typeStandardFlexoPrintId
          : this.typeStandardFlexoPrintId,
      typeStandardFlexoPrint:
          typeStandardFlexoPrint is _i5.BearerTypeStandardFlexoPrintDTO?
              ? typeStandardFlexoPrint
              : this.typeStandardFlexoPrint?.copyWith(),
      typeFlexoPrintMultilayerId: typeFlexoPrintMultilayerId is int?
          ? typeFlexoPrintMultilayerId
          : this.typeFlexoPrintMultilayerId,
      typeFlexoPrintMultilayer:
          typeFlexoPrintMultilayer is _i6.BearerTypeFlexoPrintMultilayerDTO?
              ? typeFlexoPrintMultilayer
              : this.typeFlexoPrintMultilayer?.copyWith(),
      typeSheetFedPressMinPlateId: typeSheetFedPressMinPlateId is int?
          ? typeSheetFedPressMinPlateId
          : this.typeSheetFedPressMinPlateId,
      typeSheetFedPressMinPlate:
          typeSheetFedPressMinPlate is _i7.BearerTypeSheetFedPressMinPlateDTO?
              ? typeSheetFedPressMinPlate
              : this.typeSheetFedPressMinPlate?.copyWith(),
      typeSheetFedPressPlateEqualsSubId:
          typeSheetFedPressPlateEqualsSubId is int?
              ? typeSheetFedPressPlateEqualsSubId
              : this.typeSheetFedPressPlateEqualsSubId,
      typeSheetFedPressPlateEqualsSub: typeSheetFedPressPlateEqualsSub
              is _i8.BearerTypeSheetFedPressPlateEqualsSubDTO?
          ? typeSheetFedPressPlateEqualsSub
          : this.typeSheetFedPressPlateEqualsSub?.copyWith(),
      typeOffsetPressFixedPlateId: typeOffsetPressFixedPlateId is int?
          ? typeOffsetPressFixedPlateId
          : this.typeOffsetPressFixedPlateId,
      typeOffsetPressFixedPlate:
          typeOffsetPressFixedPlate is _i9.BearerTypeOffsetPressFixedPlateDTO?
              ? typeOffsetPressFixedPlate
              : this.typeOffsetPressFixedPlate?.copyWith(),
      typeSheetFedPressFixedPlateId: typeSheetFedPressFixedPlateId is int?
          ? typeSheetFedPressFixedPlateId
          : this.typeSheetFedPressFixedPlateId,
      typeSheetFedPressFixedPlate: typeSheetFedPressFixedPlate
              is _i10.BearerTypeSheetFedPressFixedPlateDTO?
          ? typeSheetFedPressFixedPlate
          : this.typeSheetFedPressFixedPlate?.copyWith(),
      customer: customer is List<_i11.BearerCustomerRelation>?
          ? customer
          : this.customer?.map((e0) => e0.copyWith()).toList(),
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
