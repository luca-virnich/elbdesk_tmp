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
import '../../../../modules/prepress/artwork/models/artwork_master.dart' as _i2;
import '../../../../modules/crm/customer/models/customer.dart' as _i3;

abstract class ProductMasterDTO implements _i1.SerializableModel {
  ProductMasterDTO._({
    this.id,
    required this.description,
    required this.serienId,
    required this.serienIdString,
    required this.serienIndex,
    this.artworks,
    required this.customerId,
    this.customer,
    required this.keywords,
    required this.productType,
    required this.printProcessType,
    required this.customerReference,
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

  factory ProductMasterDTO({
    int? id,
    required String description,
    required int serienId,
    required String serienIdString,
    required int serienIndex,
    List<_i2.ArtworkMasterDTO>? artworks,
    required int customerId,
    _i3.CustomerDTO? customer,
    required String keywords,
    required String productType,
    required String printProcessType,
    required String customerReference,
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
  }) = _ProductMasterDTOImpl;

  factory ProductMasterDTO.fromJson(Map<String, dynamic> jsonSerialization) {
    return ProductMasterDTO(
      id: jsonSerialization['id'] as int?,
      description: jsonSerialization['description'] as String,
      serienId: jsonSerialization['serienId'] as int,
      serienIdString: jsonSerialization['serienIdString'] as String,
      serienIndex: jsonSerialization['serienIndex'] as int,
      artworks: (jsonSerialization['artworks'] as List?)
          ?.map(
              (e) => _i2.ArtworkMasterDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      keywords: jsonSerialization['keywords'] as String,
      productType: jsonSerialization['productType'] as String,
      printProcessType: jsonSerialization['printProcessType'] as String,
      customerReference: jsonSerialization['customerReference'] as String,
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

  int serienId;

  String serienIdString;

  int serienIndex;

  List<_i2.ArtworkMasterDTO>? artworks;

  int customerId;

  _i3.CustomerDTO? customer;

  String keywords;

  String productType;

  String printProcessType;

  String customerReference;

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

  /// Returns a shallow copy of this [ProductMasterDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ProductMasterDTO copyWith({
    int? id,
    String? description,
    int? serienId,
    String? serienIdString,
    int? serienIndex,
    List<_i2.ArtworkMasterDTO>? artworks,
    int? customerId,
    _i3.CustomerDTO? customer,
    String? keywords,
    String? productType,
    String? printProcessType,
    String? customerReference,
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
      'serienId': serienId,
      'serienIdString': serienIdString,
      'serienIndex': serienIndex,
      if (artworks != null)
        'artworks': artworks?.toJson(valueToJson: (v) => v.toJson()),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'keywords': keywords,
      'productType': productType,
      'printProcessType': printProcessType,
      'customerReference': customerReference,
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

class _ProductMasterDTOImpl extends ProductMasterDTO {
  _ProductMasterDTOImpl({
    int? id,
    required String description,
    required int serienId,
    required String serienIdString,
    required int serienIndex,
    List<_i2.ArtworkMasterDTO>? artworks,
    required int customerId,
    _i3.CustomerDTO? customer,
    required String keywords,
    required String productType,
    required String printProcessType,
    required String customerReference,
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
          serienId: serienId,
          serienIdString: serienIdString,
          serienIndex: serienIndex,
          artworks: artworks,
          customerId: customerId,
          customer: customer,
          keywords: keywords,
          productType: productType,
          printProcessType: printProcessType,
          customerReference: customerReference,
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

  /// Returns a shallow copy of this [ProductMasterDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ProductMasterDTO copyWith({
    Object? id = _Undefined,
    String? description,
    int? serienId,
    String? serienIdString,
    int? serienIndex,
    Object? artworks = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    String? keywords,
    String? productType,
    String? printProcessType,
    String? customerReference,
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
    return ProductMasterDTO(
      id: id is int? ? id : this.id,
      description: description ?? this.description,
      serienId: serienId ?? this.serienId,
      serienIdString: serienIdString ?? this.serienIdString,
      serienIndex: serienIndex ?? this.serienIndex,
      artworks: artworks is List<_i2.ArtworkMasterDTO>?
          ? artworks
          : this.artworks?.map((e0) => e0.copyWith()).toList(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i3.CustomerDTO? ? customer : this.customer?.copyWith(),
      keywords: keywords ?? this.keywords,
      productType: productType ?? this.productType,
      printProcessType: printProcessType ?? this.printProcessType,
      customerReference: customerReference ?? this.customerReference,
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
