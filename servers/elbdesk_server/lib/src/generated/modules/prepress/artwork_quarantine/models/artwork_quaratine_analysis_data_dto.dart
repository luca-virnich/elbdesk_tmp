/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../../../../modules/prepress/artwork_quarantine/models/color_specification.dart'
    as _i2;

abstract class ArtworkQuarantineAnalysisDataDTO
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkQuarantineAnalysisDataDTO._({
    this.fileName,
    this.analysisDate,
    required this.note,
    this.width,
    this.height,
    required this.colorSpecifications,
  });

  factory ArtworkQuarantineAnalysisDataDTO({
    String? fileName,
    DateTime? analysisDate,
    required String note,
    double? width,
    double? height,
    required List<_i2.ColorSpecificationDTO> colorSpecifications,
  }) = _ArtworkQuarantineAnalysisDataDTOImpl;

  factory ArtworkQuarantineAnalysisDataDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkQuarantineAnalysisDataDTO(
      fileName: jsonSerialization['fileName'] as String?,
      analysisDate: jsonSerialization['analysisDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['analysisDate']),
      note: jsonSerialization['note'] as String,
      width: (jsonSerialization['width'] as num?)?.toDouble(),
      height: (jsonSerialization['height'] as num?)?.toDouble(),
      colorSpecifications: (jsonSerialization['colorSpecifications'] as List)
          .map((e) =>
              _i2.ColorSpecificationDTO.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  String? fileName;

  DateTime? analysisDate;

  String note;

  double? width;

  double? height;

  List<_i2.ColorSpecificationDTO> colorSpecifications;

  /// Returns a shallow copy of this [ArtworkQuarantineAnalysisDataDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkQuarantineAnalysisDataDTO copyWith({
    String? fileName,
    DateTime? analysisDate,
    String? note,
    double? width,
    double? height,
    List<_i2.ColorSpecificationDTO>? colorSpecifications,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (fileName != null) 'fileName': fileName,
      if (analysisDate != null) 'analysisDate': analysisDate?.toJson(),
      'note': note,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      'colorSpecifications':
          colorSpecifications.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (fileName != null) 'fileName': fileName,
      if (analysisDate != null) 'analysisDate': analysisDate?.toJson(),
      'note': note,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      'colorSpecifications':
          colorSpecifications.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkQuarantineAnalysisDataDTOImpl
    extends ArtworkQuarantineAnalysisDataDTO {
  _ArtworkQuarantineAnalysisDataDTOImpl({
    String? fileName,
    DateTime? analysisDate,
    required String note,
    double? width,
    double? height,
    required List<_i2.ColorSpecificationDTO> colorSpecifications,
  }) : super._(
          fileName: fileName,
          analysisDate: analysisDate,
          note: note,
          width: width,
          height: height,
          colorSpecifications: colorSpecifications,
        );

  /// Returns a shallow copy of this [ArtworkQuarantineAnalysisDataDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkQuarantineAnalysisDataDTO copyWith({
    Object? fileName = _Undefined,
    Object? analysisDate = _Undefined,
    String? note,
    Object? width = _Undefined,
    Object? height = _Undefined,
    List<_i2.ColorSpecificationDTO>? colorSpecifications,
  }) {
    return ArtworkQuarantineAnalysisDataDTO(
      fileName: fileName is String? ? fileName : this.fileName,
      analysisDate:
          analysisDate is DateTime? ? analysisDate : this.analysisDate,
      note: note ?? this.note,
      width: width is double? ? width : this.width,
      height: height is double? ? height : this.height,
      colorSpecifications: colorSpecifications ??
          this.colorSpecifications.map((e0) => e0.copyWith()).toList(),
    );
  }
}
