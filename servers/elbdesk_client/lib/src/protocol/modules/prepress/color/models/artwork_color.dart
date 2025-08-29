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
import '../../../../modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i2;

abstract class ArtworkColorDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
