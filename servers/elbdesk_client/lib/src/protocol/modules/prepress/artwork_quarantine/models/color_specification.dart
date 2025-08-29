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
import '../../../../modules/prepress/color/models/artwork_color.dart' as _i2;

abstract class ColorSpecificationDTO implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
