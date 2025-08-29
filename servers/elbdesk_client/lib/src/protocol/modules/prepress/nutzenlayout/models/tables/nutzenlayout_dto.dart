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
import '../../../../../modules/prepress/nutzenlayout/models/nutzenlayout_form_type.dart'
    as _i2;
import '../../../../../modules/prepress/nutzenlayout/models/nutzenlayout_column_dto.dart'
    as _i3;
import '../../../../../modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i4;
import '../../../../../modules/crm/customer/models/customer.dart' as _i5;

abstract class NutzenlayoutDTO implements _i1.SerializableModel {
  NutzenlayoutDTO._({
    this.id,
    required this.description,
    required this.drucklaenge,
    required this.formType,
    required this.nutzenlayoutColumns,
    required this.dimensions,
    required this.customerId,
    this.customer,
    required this.leadingUnitSystem,
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

  factory NutzenlayoutDTO({
    int? id,
    required String description,
    required double drucklaenge,
    required _i2.NutzenlayoutFormType formType,
    required List<_i3.NutzenlayoutColumnDTO> nutzenlayoutColumns,
    required List<_i4.NutzenlayoutArtworkDimensions> dimensions,
    required int customerId,
    _i5.CustomerDTO? customer,
    required String leadingUnitSystem,
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
  }) = _NutzenlayoutDTOImpl;

  factory NutzenlayoutDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return NutzenlayoutDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      drucklaenge: (jsonSerialization['drucklaenge'] as num).toDouble(),
      formType: _i2.NutzenlayoutFormType.fromJson(
          (jsonSerialization['formType'] as String)),
      nutzenlayoutColumns: (jsonSerialization['nutzenlayoutColumns'] as List)
          .map((e) =>
              _i3.NutzenlayoutColumnDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      dimensions: (jsonSerialization['dimensions'] as List)
          .map((e) => _i4.NutzenlayoutArtworkDimensions.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i5.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      leadingUnitSystem: jsonSerialization['leadingUnitSystem'] as String,
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

  String description;

  double drucklaenge;

  _i2.NutzenlayoutFormType formType;

  List<_i3.NutzenlayoutColumnDTO> nutzenlayoutColumns;

  List<_i4.NutzenlayoutArtworkDimensions> dimensions;

  int customerId;

  _i5.CustomerDTO? customer;

  String leadingUnitSystem;

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

  /// Returns a shallow copy of this [NutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  NutzenlayoutDTO copyWith({
    int? id,
    String? description,
    double? drucklaenge,
    _i2.NutzenlayoutFormType? formType,
    List<_i3.NutzenlayoutColumnDTO>? nutzenlayoutColumns,
    List<_i4.NutzenlayoutArtworkDimensions>? dimensions,
    int? customerId,
    _i5.CustomerDTO? customer,
    String? leadingUnitSystem,
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
      'drucklaenge': drucklaenge,
      'formType': formType.toJson(),
      'nutzenlayoutColumns':
          nutzenlayoutColumns.toJson(valueToJson: (v) => v.toJson()),
      'dimensions': dimensions.toJson(valueToJson: (v) => v.toJson()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'leadingUnitSystem': leadingUnitSystem,
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

class _NutzenlayoutDTOImpl extends NutzenlayoutDTO {
  _NutzenlayoutDTOImpl({
    int? id,
    required String description,
    required double drucklaenge,
    required _i2.NutzenlayoutFormType formType,
    required List<_i3.NutzenlayoutColumnDTO> nutzenlayoutColumns,
    required List<_i4.NutzenlayoutArtworkDimensions> dimensions,
    required int customerId,
    _i5.CustomerDTO? customer,
    required String leadingUnitSystem,
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
          drucklaenge: drucklaenge,
          formType: formType,
          nutzenlayoutColumns: nutzenlayoutColumns,
          dimensions: dimensions,
          customerId: customerId,
          customer: customer,
          leadingUnitSystem: leadingUnitSystem,
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

  /// Returns a shallow copy of this [NutzenlayoutDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  NutzenlayoutDTO copyWith({
    Object? id = _Undefined,
    String? description,
    double? drucklaenge,
    _i2.NutzenlayoutFormType? formType,
    List<_i3.NutzenlayoutColumnDTO>? nutzenlayoutColumns,
    List<_i4.NutzenlayoutArtworkDimensions>? dimensions,
    int? customerId,
    Object? customer = _Undefined,
    String? leadingUnitSystem,
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
    return NutzenlayoutDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      drucklaenge: drucklaenge ?? this.drucklaenge,
      formType: formType ?? this.formType,
      nutzenlayoutColumns: nutzenlayoutColumns ??
          this.nutzenlayoutColumns.map((e0) => e0.copyWith()).toList(),
      dimensions:
          dimensions ?? this.dimensions.map((e0) => e0.copyWith()).toList(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i5.CustomerDTO? ? customer : this.customer?.copyWith(),
      leadingUnitSystem: leadingUnitSystem ?? this.leadingUnitSystem,
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
