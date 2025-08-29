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

abstract class BearerDTO
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = BearerDTOTable();

  static const db = BearerDTORepository._();

  @override
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

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'type': type.toJson(),
      'bearerName': bearerName,
      'description': description,
      'longText': longText,
      'costCenterCode': costCenterCode,
      if (type1Id != null) 'type1Id': type1Id,
      if (type1 != null) 'type1': type1?.toJsonForProtocol(),
      if (type2Id != null) 'type2Id': type2Id,
      if (type2 != null) 'type2': type2?.toJsonForProtocol(),
      if (typeStandardFlexoPrintId != null)
        'typeStandardFlexoPrintId': typeStandardFlexoPrintId,
      if (typeStandardFlexoPrint != null)
        'typeStandardFlexoPrint': typeStandardFlexoPrint?.toJsonForProtocol(),
      if (typeFlexoPrintMultilayerId != null)
        'typeFlexoPrintMultilayerId': typeFlexoPrintMultilayerId,
      if (typeFlexoPrintMultilayer != null)
        'typeFlexoPrintMultilayer':
            typeFlexoPrintMultilayer?.toJsonForProtocol(),
      if (typeSheetFedPressMinPlateId != null)
        'typeSheetFedPressMinPlateId': typeSheetFedPressMinPlateId,
      if (typeSheetFedPressMinPlate != null)
        'typeSheetFedPressMinPlate':
            typeSheetFedPressMinPlate?.toJsonForProtocol(),
      if (typeSheetFedPressPlateEqualsSubId != null)
        'typeSheetFedPressPlateEqualsSubId': typeSheetFedPressPlateEqualsSubId,
      if (typeSheetFedPressPlateEqualsSub != null)
        'typeSheetFedPressPlateEqualsSub':
            typeSheetFedPressPlateEqualsSub?.toJsonForProtocol(),
      if (typeOffsetPressFixedPlateId != null)
        'typeOffsetPressFixedPlateId': typeOffsetPressFixedPlateId,
      if (typeOffsetPressFixedPlate != null)
        'typeOffsetPressFixedPlate':
            typeOffsetPressFixedPlate?.toJsonForProtocol(),
      if (typeSheetFedPressFixedPlateId != null)
        'typeSheetFedPressFixedPlateId': typeSheetFedPressFixedPlateId,
      if (typeSheetFedPressFixedPlate != null)
        'typeSheetFedPressFixedPlate':
            typeSheetFedPressFixedPlate?.toJsonForProtocol(),
      if (customer != null)
        'customer': customer?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
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

  static BearerDTOInclude include({
    _i3.BearerType1DTOInclude? type1,
    _i4.BearerType2DTOInclude? type2,
    _i5.BearerTypeStandardFlexoPrintDTOInclude? typeStandardFlexoPrint,
    _i6.BearerTypeFlexoPrintMultilayerDTOInclude? typeFlexoPrintMultilayer,
    _i7.BearerTypeSheetFedPressMinPlateDTOInclude? typeSheetFedPressMinPlate,
    _i8.BearerTypeSheetFedPressPlateEqualsSubDTOInclude?
        typeSheetFedPressPlateEqualsSub,
    _i9.BearerTypeOffsetPressFixedPlateDTOInclude? typeOffsetPressFixedPlate,
    _i10.BearerTypeSheetFedPressFixedPlateDTOInclude?
        typeSheetFedPressFixedPlate,
    _i11.BearerCustomerRelationIncludeList? customer,
  }) {
    return BearerDTOInclude._(
      type1: type1,
      type2: type2,
      typeStandardFlexoPrint: typeStandardFlexoPrint,
      typeFlexoPrintMultilayer: typeFlexoPrintMultilayer,
      typeSheetFedPressMinPlate: typeSheetFedPressMinPlate,
      typeSheetFedPressPlateEqualsSub: typeSheetFedPressPlateEqualsSub,
      typeOffsetPressFixedPlate: typeOffsetPressFixedPlate,
      typeSheetFedPressFixedPlate: typeSheetFedPressFixedPlate,
      customer: customer,
    );
  }

  static BearerDTOIncludeList includeList({
    _i1.WhereExpressionBuilder<BearerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerDTOTable>? orderByList,
    BearerDTOInclude? include,
  }) {
    return BearerDTOIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(BearerDTO.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(BearerDTO.t),
      include: include,
    );
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

class BearerDTOTable extends _i1.Table<int?> {
  BearerDTOTable({super.tableRelation})
      : super(tableName: 'ed_prepress_bearer') {
    type = _i1.ColumnEnum(
      'type',
      this,
      _i1.EnumSerialization.byName,
    );
    bearerName = _i1.ColumnString(
      'bearerName',
      this,
    );
    description = _i1.ColumnString(
      'description',
      this,
    );
    longText = _i1.ColumnString(
      'longText',
      this,
    );
    costCenterCode = _i1.ColumnString(
      'costCenterCode',
      this,
    );
    type1Id = _i1.ColumnInt(
      'type1Id',
      this,
    );
    type2Id = _i1.ColumnInt(
      'type2Id',
      this,
    );
    typeStandardFlexoPrintId = _i1.ColumnInt(
      'typeStandardFlexoPrintId',
      this,
    );
    typeFlexoPrintMultilayerId = _i1.ColumnInt(
      'typeFlexoPrintMultilayerId',
      this,
    );
    typeSheetFedPressMinPlateId = _i1.ColumnInt(
      'typeSheetFedPressMinPlateId',
      this,
    );
    typeSheetFedPressPlateEqualsSubId = _i1.ColumnInt(
      'typeSheetFedPressPlateEqualsSubId',
      this,
    );
    typeOffsetPressFixedPlateId = _i1.ColumnInt(
      'typeOffsetPressFixedPlateId',
      this,
    );
    typeSheetFedPressFixedPlateId = _i1.ColumnInt(
      'typeSheetFedPressFixedPlateId',
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

  late final _i1.ColumnEnum<_i2.BearerType> type;

  late final _i1.ColumnString bearerName;

  late final _i1.ColumnString description;

  late final _i1.ColumnString longText;

  late final _i1.ColumnString costCenterCode;

  late final _i1.ColumnInt type1Id;

  _i3.BearerType1DTOTable? _type1;

  late final _i1.ColumnInt type2Id;

  _i4.BearerType2DTOTable? _type2;

  late final _i1.ColumnInt typeStandardFlexoPrintId;

  _i5.BearerTypeStandardFlexoPrintDTOTable? _typeStandardFlexoPrint;

  late final _i1.ColumnInt typeFlexoPrintMultilayerId;

  _i6.BearerTypeFlexoPrintMultilayerDTOTable? _typeFlexoPrintMultilayer;

  late final _i1.ColumnInt typeSheetFedPressMinPlateId;

  _i7.BearerTypeSheetFedPressMinPlateDTOTable? _typeSheetFedPressMinPlate;

  late final _i1.ColumnInt typeSheetFedPressPlateEqualsSubId;

  _i8.BearerTypeSheetFedPressPlateEqualsSubDTOTable?
      _typeSheetFedPressPlateEqualsSub;

  late final _i1.ColumnInt typeOffsetPressFixedPlateId;

  _i9.BearerTypeOffsetPressFixedPlateDTOTable? _typeOffsetPressFixedPlate;

  late final _i1.ColumnInt typeSheetFedPressFixedPlateId;

  _i10.BearerTypeSheetFedPressFixedPlateDTOTable? _typeSheetFedPressFixedPlate;

  _i11.BearerCustomerRelationTable? ___customer;

  _i1.ManyRelation<_i11.BearerCustomerRelationTable>? _customer;

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

  _i3.BearerType1DTOTable get type1 {
    if (_type1 != null) return _type1!;
    _type1 = _i1.createRelationTable(
      relationFieldName: 'type1',
      field: BearerDTO.t.type1Id,
      foreignField: _i3.BearerType1DTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.BearerType1DTOTable(tableRelation: foreignTableRelation),
    );
    return _type1!;
  }

  _i4.BearerType2DTOTable get type2 {
    if (_type2 != null) return _type2!;
    _type2 = _i1.createRelationTable(
      relationFieldName: 'type2',
      field: BearerDTO.t.type2Id,
      foreignField: _i4.BearerType2DTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.BearerType2DTOTable(tableRelation: foreignTableRelation),
    );
    return _type2!;
  }

  _i5.BearerTypeStandardFlexoPrintDTOTable get typeStandardFlexoPrint {
    if (_typeStandardFlexoPrint != null) return _typeStandardFlexoPrint!;
    _typeStandardFlexoPrint = _i1.createRelationTable(
      relationFieldName: 'typeStandardFlexoPrint',
      field: BearerDTO.t.typeStandardFlexoPrintId,
      foreignField: _i5.BearerTypeStandardFlexoPrintDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.BearerTypeStandardFlexoPrintDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _typeStandardFlexoPrint!;
  }

  _i6.BearerTypeFlexoPrintMultilayerDTOTable get typeFlexoPrintMultilayer {
    if (_typeFlexoPrintMultilayer != null) return _typeFlexoPrintMultilayer!;
    _typeFlexoPrintMultilayer = _i1.createRelationTable(
      relationFieldName: 'typeFlexoPrintMultilayer',
      field: BearerDTO.t.typeFlexoPrintMultilayerId,
      foreignField: _i6.BearerTypeFlexoPrintMultilayerDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i6.BearerTypeFlexoPrintMultilayerDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _typeFlexoPrintMultilayer!;
  }

  _i7.BearerTypeSheetFedPressMinPlateDTOTable get typeSheetFedPressMinPlate {
    if (_typeSheetFedPressMinPlate != null) return _typeSheetFedPressMinPlate!;
    _typeSheetFedPressMinPlate = _i1.createRelationTable(
      relationFieldName: 'typeSheetFedPressMinPlate',
      field: BearerDTO.t.typeSheetFedPressMinPlateId,
      foreignField: _i7.BearerTypeSheetFedPressMinPlateDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i7.BearerTypeSheetFedPressMinPlateDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _typeSheetFedPressMinPlate!;
  }

  _i8.BearerTypeSheetFedPressPlateEqualsSubDTOTable
      get typeSheetFedPressPlateEqualsSub {
    if (_typeSheetFedPressPlateEqualsSub != null)
      return _typeSheetFedPressPlateEqualsSub!;
    _typeSheetFedPressPlateEqualsSub = _i1.createRelationTable(
      relationFieldName: 'typeSheetFedPressPlateEqualsSub',
      field: BearerDTO.t.typeSheetFedPressPlateEqualsSubId,
      foreignField: _i8.BearerTypeSheetFedPressPlateEqualsSubDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i8.BearerTypeSheetFedPressPlateEqualsSubDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _typeSheetFedPressPlateEqualsSub!;
  }

  _i9.BearerTypeOffsetPressFixedPlateDTOTable get typeOffsetPressFixedPlate {
    if (_typeOffsetPressFixedPlate != null) return _typeOffsetPressFixedPlate!;
    _typeOffsetPressFixedPlate = _i1.createRelationTable(
      relationFieldName: 'typeOffsetPressFixedPlate',
      field: BearerDTO.t.typeOffsetPressFixedPlateId,
      foreignField: _i9.BearerTypeOffsetPressFixedPlateDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i9.BearerTypeOffsetPressFixedPlateDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _typeOffsetPressFixedPlate!;
  }

  _i10.BearerTypeSheetFedPressFixedPlateDTOTable
      get typeSheetFedPressFixedPlate {
    if (_typeSheetFedPressFixedPlate != null)
      return _typeSheetFedPressFixedPlate!;
    _typeSheetFedPressFixedPlate = _i1.createRelationTable(
      relationFieldName: 'typeSheetFedPressFixedPlate',
      field: BearerDTO.t.typeSheetFedPressFixedPlateId,
      foreignField: _i10.BearerTypeSheetFedPressFixedPlateDTO.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i10.BearerTypeSheetFedPressFixedPlateDTOTable(
              tableRelation: foreignTableRelation),
    );
    return _typeSheetFedPressFixedPlate!;
  }

  _i11.BearerCustomerRelationTable get __customer {
    if (___customer != null) return ___customer!;
    ___customer = _i1.createRelationTable(
      relationFieldName: '__customer',
      field: BearerDTO.t.id,
      foreignField: _i11.BearerCustomerRelation.t.bearerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i11.BearerCustomerRelationTable(tableRelation: foreignTableRelation),
    );
    return ___customer!;
  }

  _i1.ManyRelation<_i11.BearerCustomerRelationTable> get customer {
    if (_customer != null) return _customer!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'customer',
      field: BearerDTO.t.id,
      foreignField: _i11.BearerCustomerRelation.t.bearerId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i11.BearerCustomerRelationTable(tableRelation: foreignTableRelation),
    );
    _customer = _i1.ManyRelation<_i11.BearerCustomerRelationTable>(
      tableWithRelations: relationTable,
      table: _i11.BearerCustomerRelationTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _customer!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        type,
        bearerName,
        description,
        longText,
        costCenterCode,
        type1Id,
        type2Id,
        typeStandardFlexoPrintId,
        typeFlexoPrintMultilayerId,
        typeSheetFedPressMinPlateId,
        typeSheetFedPressPlateEqualsSubId,
        typeOffsetPressFixedPlateId,
        typeSheetFedPressFixedPlateId,
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
    if (relationField == 'type1') {
      return type1;
    }
    if (relationField == 'type2') {
      return type2;
    }
    if (relationField == 'typeStandardFlexoPrint') {
      return typeStandardFlexoPrint;
    }
    if (relationField == 'typeFlexoPrintMultilayer') {
      return typeFlexoPrintMultilayer;
    }
    if (relationField == 'typeSheetFedPressMinPlate') {
      return typeSheetFedPressMinPlate;
    }
    if (relationField == 'typeSheetFedPressPlateEqualsSub') {
      return typeSheetFedPressPlateEqualsSub;
    }
    if (relationField == 'typeOffsetPressFixedPlate') {
      return typeOffsetPressFixedPlate;
    }
    if (relationField == 'typeSheetFedPressFixedPlate') {
      return typeSheetFedPressFixedPlate;
    }
    if (relationField == 'customer') {
      return __customer;
    }
    return null;
  }
}

class BearerDTOInclude extends _i1.IncludeObject {
  BearerDTOInclude._({
    _i3.BearerType1DTOInclude? type1,
    _i4.BearerType2DTOInclude? type2,
    _i5.BearerTypeStandardFlexoPrintDTOInclude? typeStandardFlexoPrint,
    _i6.BearerTypeFlexoPrintMultilayerDTOInclude? typeFlexoPrintMultilayer,
    _i7.BearerTypeSheetFedPressMinPlateDTOInclude? typeSheetFedPressMinPlate,
    _i8.BearerTypeSheetFedPressPlateEqualsSubDTOInclude?
        typeSheetFedPressPlateEqualsSub,
    _i9.BearerTypeOffsetPressFixedPlateDTOInclude? typeOffsetPressFixedPlate,
    _i10.BearerTypeSheetFedPressFixedPlateDTOInclude?
        typeSheetFedPressFixedPlate,
    _i11.BearerCustomerRelationIncludeList? customer,
  }) {
    _type1 = type1;
    _type2 = type2;
    _typeStandardFlexoPrint = typeStandardFlexoPrint;
    _typeFlexoPrintMultilayer = typeFlexoPrintMultilayer;
    _typeSheetFedPressMinPlate = typeSheetFedPressMinPlate;
    _typeSheetFedPressPlateEqualsSub = typeSheetFedPressPlateEqualsSub;
    _typeOffsetPressFixedPlate = typeOffsetPressFixedPlate;
    _typeSheetFedPressFixedPlate = typeSheetFedPressFixedPlate;
    _customer = customer;
  }

  _i3.BearerType1DTOInclude? _type1;

  _i4.BearerType2DTOInclude? _type2;

  _i5.BearerTypeStandardFlexoPrintDTOInclude? _typeStandardFlexoPrint;

  _i6.BearerTypeFlexoPrintMultilayerDTOInclude? _typeFlexoPrintMultilayer;

  _i7.BearerTypeSheetFedPressMinPlateDTOInclude? _typeSheetFedPressMinPlate;

  _i8.BearerTypeSheetFedPressPlateEqualsSubDTOInclude?
      _typeSheetFedPressPlateEqualsSub;

  _i9.BearerTypeOffsetPressFixedPlateDTOInclude? _typeOffsetPressFixedPlate;

  _i10.BearerTypeSheetFedPressFixedPlateDTOInclude?
      _typeSheetFedPressFixedPlate;

  _i11.BearerCustomerRelationIncludeList? _customer;

  @override
  Map<String, _i1.Include?> get includes => {
        'type1': _type1,
        'type2': _type2,
        'typeStandardFlexoPrint': _typeStandardFlexoPrint,
        'typeFlexoPrintMultilayer': _typeFlexoPrintMultilayer,
        'typeSheetFedPressMinPlate': _typeSheetFedPressMinPlate,
        'typeSheetFedPressPlateEqualsSub': _typeSheetFedPressPlateEqualsSub,
        'typeOffsetPressFixedPlate': _typeOffsetPressFixedPlate,
        'typeSheetFedPressFixedPlate': _typeSheetFedPressFixedPlate,
        'customer': _customer,
      };

  @override
  _i1.Table<int?> get table => BearerDTO.t;
}

class BearerDTOIncludeList extends _i1.IncludeList {
  BearerDTOIncludeList._({
    _i1.WhereExpressionBuilder<BearerDTOTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(BearerDTO.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => BearerDTO.t;
}

class BearerDTORepository {
  const BearerDTORepository._();

  final attach = const BearerDTOAttachRepository._();

  final attachRow = const BearerDTOAttachRowRepository._();

  final detach = const BearerDTODetachRepository._();

  final detachRow = const BearerDTODetachRowRepository._();

  /// Returns a list of [BearerDTO]s matching the given query parameters.
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
  Future<List<BearerDTO>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerDTOTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<BearerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    BearerDTOInclude? include,
  }) async {
    return session.db.find<BearerDTO>(
      where: where?.call(BearerDTO.t),
      orderBy: orderBy?.call(BearerDTO.t),
      orderByList: orderByList?.call(BearerDTO.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [BearerDTO] matching the given query parameters.
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
  Future<BearerDTO?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerDTOTable>? where,
    int? offset,
    _i1.OrderByBuilder<BearerDTOTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<BearerDTOTable>? orderByList,
    _i1.Transaction? transaction,
    BearerDTOInclude? include,
  }) async {
    return session.db.findFirstRow<BearerDTO>(
      where: where?.call(BearerDTO.t),
      orderBy: orderBy?.call(BearerDTO.t),
      orderByList: orderByList?.call(BearerDTO.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [BearerDTO] by its [id] or null if no such row exists.
  Future<BearerDTO?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    BearerDTOInclude? include,
  }) async {
    return session.db.findById<BearerDTO>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [BearerDTO]s in the list and returns the inserted rows.
  ///
  /// The returned [BearerDTO]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<BearerDTO>> insert(
    _i1.Session session,
    List<BearerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<BearerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [BearerDTO] and returns the inserted row.
  ///
  /// The returned [BearerDTO] will have its `id` field set.
  Future<BearerDTO> insertRow(
    _i1.Session session,
    BearerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<BearerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [BearerDTO]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<BearerDTO>> update(
    _i1.Session session,
    List<BearerDTO> rows, {
    _i1.ColumnSelections<BearerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<BearerDTO>(
      rows,
      columns: columns?.call(BearerDTO.t),
      transaction: transaction,
    );
  }

  /// Updates a single [BearerDTO]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<BearerDTO> updateRow(
    _i1.Session session,
    BearerDTO row, {
    _i1.ColumnSelections<BearerDTOTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<BearerDTO>(
      row,
      columns: columns?.call(BearerDTO.t),
      transaction: transaction,
    );
  }

  /// Deletes all [BearerDTO]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<BearerDTO>> delete(
    _i1.Session session,
    List<BearerDTO> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<BearerDTO>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [BearerDTO].
  Future<BearerDTO> deleteRow(
    _i1.Session session,
    BearerDTO row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<BearerDTO>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<BearerDTO>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<BearerDTOTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<BearerDTO>(
      where: where(BearerDTO.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<BearerDTOTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<BearerDTO>(
      where: where?.call(BearerDTO.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class BearerDTOAttachRepository {
  const BearerDTOAttachRepository._();

  /// Creates a relation between this [BearerDTO] and the given [BearerCustomerRelation]s
  /// by setting each [BearerCustomerRelation]'s foreign key `bearerId` to refer to this [BearerDTO].
  Future<void> customer(
    _i1.Session session,
    BearerDTO bearerDTO,
    List<_i11.BearerCustomerRelation> bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }

    var $bearerCustomerRelation = bearerCustomerRelation
        .map((e) => e.copyWith(bearerId: bearerDTO.id))
        .toList();
    await session.db.update<_i11.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i11.BearerCustomerRelation.t.bearerId],
      transaction: transaction,
    );
  }
}

class BearerDTOAttachRowRepository {
  const BearerDTOAttachRowRepository._();

  /// Creates a relation between the given [BearerDTO] and [BearerType1DTO]
  /// by setting the [BearerDTO]'s foreign key `type1Id` to refer to the [BearerType1DTO].
  Future<void> type1(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i3.BearerType1DTO type1, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (type1.id == null) {
      throw ArgumentError.notNull('type1.id');
    }

    var $bearerDTO = bearerDTO.copyWith(type1Id: type1.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.type1Id],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerDTO] and [BearerType2DTO]
  /// by setting the [BearerDTO]'s foreign key `type2Id` to refer to the [BearerType2DTO].
  Future<void> type2(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i4.BearerType2DTO type2, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (type2.id == null) {
      throw ArgumentError.notNull('type2.id');
    }

    var $bearerDTO = bearerDTO.copyWith(type2Id: type2.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.type2Id],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerDTO] and [BearerTypeStandardFlexoPrintDTO]
  /// by setting the [BearerDTO]'s foreign key `typeStandardFlexoPrintId` to refer to the [BearerTypeStandardFlexoPrintDTO].
  Future<void> typeStandardFlexoPrint(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i5.BearerTypeStandardFlexoPrintDTO typeStandardFlexoPrint, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (typeStandardFlexoPrint.id == null) {
      throw ArgumentError.notNull('typeStandardFlexoPrint.id');
    }

    var $bearerDTO =
        bearerDTO.copyWith(typeStandardFlexoPrintId: typeStandardFlexoPrint.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.typeStandardFlexoPrintId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerDTO] and [BearerTypeFlexoPrintMultilayerDTO]
  /// by setting the [BearerDTO]'s foreign key `typeFlexoPrintMultilayerId` to refer to the [BearerTypeFlexoPrintMultilayerDTO].
  Future<void> typeFlexoPrintMultilayer(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i6.BearerTypeFlexoPrintMultilayerDTO typeFlexoPrintMultilayer, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (typeFlexoPrintMultilayer.id == null) {
      throw ArgumentError.notNull('typeFlexoPrintMultilayer.id');
    }

    var $bearerDTO = bearerDTO.copyWith(
        typeFlexoPrintMultilayerId: typeFlexoPrintMultilayer.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.typeFlexoPrintMultilayerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerDTO] and [BearerTypeSheetFedPressMinPlateDTO]
  /// by setting the [BearerDTO]'s foreign key `typeSheetFedPressMinPlateId` to refer to the [BearerTypeSheetFedPressMinPlateDTO].
  Future<void> typeSheetFedPressMinPlate(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i7.BearerTypeSheetFedPressMinPlateDTO typeSheetFedPressMinPlate, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (typeSheetFedPressMinPlate.id == null) {
      throw ArgumentError.notNull('typeSheetFedPressMinPlate.id');
    }

    var $bearerDTO = bearerDTO.copyWith(
        typeSheetFedPressMinPlateId: typeSheetFedPressMinPlate.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.typeSheetFedPressMinPlateId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerDTO] and [BearerTypeSheetFedPressPlateEqualsSubDTO]
  /// by setting the [BearerDTO]'s foreign key `typeSheetFedPressPlateEqualsSubId` to refer to the [BearerTypeSheetFedPressPlateEqualsSubDTO].
  Future<void> typeSheetFedPressPlateEqualsSub(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i8.BearerTypeSheetFedPressPlateEqualsSubDTO
        typeSheetFedPressPlateEqualsSub, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (typeSheetFedPressPlateEqualsSub.id == null) {
      throw ArgumentError.notNull('typeSheetFedPressPlateEqualsSub.id');
    }

    var $bearerDTO = bearerDTO.copyWith(
        typeSheetFedPressPlateEqualsSubId: typeSheetFedPressPlateEqualsSub.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.typeSheetFedPressPlateEqualsSubId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerDTO] and [BearerTypeOffsetPressFixedPlateDTO]
  /// by setting the [BearerDTO]'s foreign key `typeOffsetPressFixedPlateId` to refer to the [BearerTypeOffsetPressFixedPlateDTO].
  Future<void> typeOffsetPressFixedPlate(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i9.BearerTypeOffsetPressFixedPlateDTO typeOffsetPressFixedPlate, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (typeOffsetPressFixedPlate.id == null) {
      throw ArgumentError.notNull('typeOffsetPressFixedPlate.id');
    }

    var $bearerDTO = bearerDTO.copyWith(
        typeOffsetPressFixedPlateId: typeOffsetPressFixedPlate.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.typeOffsetPressFixedPlateId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [BearerDTO] and [BearerTypeSheetFedPressFixedPlateDTO]
  /// by setting the [BearerDTO]'s foreign key `typeSheetFedPressFixedPlateId` to refer to the [BearerTypeSheetFedPressFixedPlateDTO].
  Future<void> typeSheetFedPressFixedPlate(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i10.BearerTypeSheetFedPressFixedPlateDTO typeSheetFedPressFixedPlate, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }
    if (typeSheetFedPressFixedPlate.id == null) {
      throw ArgumentError.notNull('typeSheetFedPressFixedPlate.id');
    }

    var $bearerDTO = bearerDTO.copyWith(
        typeSheetFedPressFixedPlateId: typeSheetFedPressFixedPlate.id);
    await session.db.updateRow<BearerDTO>(
      $bearerDTO,
      columns: [BearerDTO.t.typeSheetFedPressFixedPlateId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [BearerDTO] and the given [BearerCustomerRelation]
  /// by setting the [BearerCustomerRelation]'s foreign key `bearerId` to refer to this [BearerDTO].
  Future<void> customer(
    _i1.Session session,
    BearerDTO bearerDTO,
    _i11.BearerCustomerRelation bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.id == null) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }
    if (bearerDTO.id == null) {
      throw ArgumentError.notNull('bearerDTO.id');
    }

    var $bearerCustomerRelation =
        bearerCustomerRelation.copyWith(bearerId: bearerDTO.id);
    await session.db.updateRow<_i11.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i11.BearerCustomerRelation.t.bearerId],
      transaction: transaction,
    );
  }
}

class BearerDTODetachRepository {
  const BearerDTODetachRepository._();

  /// Detaches the relation between this [BearerDTO] and the given [BearerCustomerRelation]
  /// by setting the [BearerCustomerRelation]'s foreign key `bearerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    List<_i11.BearerCustomerRelation> bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.any((e) => e.id == null)) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }

    var $bearerCustomerRelation =
        bearerCustomerRelation.map((e) => e.copyWith(bearerId: null)).toList();
    await session.db.update<_i11.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i11.BearerCustomerRelation.t.bearerId],
      transaction: transaction,
    );
  }
}

class BearerDTODetachRowRepository {
  const BearerDTODetachRowRepository._();

  /// Detaches the relation between this [BearerDTO] and the [BearerType1DTO] set in `type1`
  /// by setting the [BearerDTO]'s foreign key `type1Id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> type1(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto = bearerdto.copyWith(type1Id: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.type1Id],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the [BearerType2DTO] set in `type2`
  /// by setting the [BearerDTO]'s foreign key `type2Id` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> type2(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto = bearerdto.copyWith(type2Id: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.type2Id],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the [BearerTypeStandardFlexoPrintDTO] set in `typeStandardFlexoPrint`
  /// by setting the [BearerDTO]'s foreign key `typeStandardFlexoPrintId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> typeStandardFlexoPrint(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto = bearerdto.copyWith(typeStandardFlexoPrintId: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.typeStandardFlexoPrintId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the [BearerTypeFlexoPrintMultilayerDTO] set in `typeFlexoPrintMultilayer`
  /// by setting the [BearerDTO]'s foreign key `typeFlexoPrintMultilayerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> typeFlexoPrintMultilayer(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto = bearerdto.copyWith(typeFlexoPrintMultilayerId: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.typeFlexoPrintMultilayerId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the [BearerTypeSheetFedPressMinPlateDTO] set in `typeSheetFedPressMinPlate`
  /// by setting the [BearerDTO]'s foreign key `typeSheetFedPressMinPlateId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> typeSheetFedPressMinPlate(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto = bearerdto.copyWith(typeSheetFedPressMinPlateId: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.typeSheetFedPressMinPlateId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the [BearerTypeSheetFedPressPlateEqualsSubDTO] set in `typeSheetFedPressPlateEqualsSub`
  /// by setting the [BearerDTO]'s foreign key `typeSheetFedPressPlateEqualsSubId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> typeSheetFedPressPlateEqualsSub(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto =
        bearerdto.copyWith(typeSheetFedPressPlateEqualsSubId: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.typeSheetFedPressPlateEqualsSubId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the [BearerTypeOffsetPressFixedPlateDTO] set in `typeOffsetPressFixedPlate`
  /// by setting the [BearerDTO]'s foreign key `typeOffsetPressFixedPlateId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> typeOffsetPressFixedPlate(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto = bearerdto.copyWith(typeOffsetPressFixedPlateId: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.typeOffsetPressFixedPlateId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the [BearerTypeSheetFedPressFixedPlateDTO] set in `typeSheetFedPressFixedPlate`
  /// by setting the [BearerDTO]'s foreign key `typeSheetFedPressFixedPlateId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> typeSheetFedPressFixedPlate(
    _i1.Session session,
    BearerDTO bearerdto, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerdto.id == null) {
      throw ArgumentError.notNull('bearerdto.id');
    }

    var $bearerdto = bearerdto.copyWith(typeSheetFedPressFixedPlateId: null);
    await session.db.updateRow<BearerDTO>(
      $bearerdto,
      columns: [BearerDTO.t.typeSheetFedPressFixedPlateId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [BearerDTO] and the given [BearerCustomerRelation]
  /// by setting the [BearerCustomerRelation]'s foreign key `bearerId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> customer(
    _i1.Session session,
    _i11.BearerCustomerRelation bearerCustomerRelation, {
    _i1.Transaction? transaction,
  }) async {
    if (bearerCustomerRelation.id == null) {
      throw ArgumentError.notNull('bearerCustomerRelation.id');
    }

    var $bearerCustomerRelation =
        bearerCustomerRelation.copyWith(bearerId: null);
    await session.db.updateRow<_i11.BearerCustomerRelation>(
      $bearerCustomerRelation,
      columns: [_i11.BearerCustomerRelation.t.bearerId],
      transaction: transaction,
    );
  }
}
