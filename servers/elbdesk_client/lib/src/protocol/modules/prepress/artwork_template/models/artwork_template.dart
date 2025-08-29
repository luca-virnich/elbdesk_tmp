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
import '../../../../modules/crm/customer/models/customer.dart' as _i2;
import '../../../../modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i3;
import '../../../../modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i4;
import '../../../../modules/prepress/trapping/models/trapping.dart' as _i5;
import '../../../../modules/prepress/layer/models/artwork_layer.dart' as _i6;
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i7;

abstract class ArtworkTemplateDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
