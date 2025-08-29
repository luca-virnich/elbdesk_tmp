// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TemplateCodeImpl _$$TemplateCodeImplFromJson(Map<String, dynamic> json) =>
    _$TemplateCodeImpl(
      codeSize: (json['codeSize'] as num?)?.toDouble(),
      errorCorrection: (json['errorCorrection'] as num?)?.toDouble(),
      outputResolution: (json['outputResolution'] as num?)?.toDouble(),
      barWidthReduction: (json['barWidthReduction'] as num?)?.toDouble(),
      deviceCompensation: (json['deviceCompensation'] as num?)?.toDouble(),
      narrowBarWidth: (json['narrowBarWidth'] as num?)?.toDouble(),
      cellSize: (json['cellSize'] as num?)?.toDouble(),
      magnification: (json['magnification'] as num?)?.toDouble(),
      aspectRatio: (json['aspectRatio'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$TemplateCodeImplToJson(_$TemplateCodeImpl instance) =>
    <String, dynamic>{
      'codeSize': instance.codeSize,
      'errorCorrection': instance.errorCorrection,
      'outputResolution': instance.outputResolution,
      'barWidthReduction': instance.barWidthReduction,
      'deviceCompensation': instance.deviceCompensation,
      'narrowBarWidth': instance.narrowBarWidth,
      'cellSize': instance.cellSize,
      'magnification': instance.magnification,
      'aspectRatio': instance.aspectRatio,
    };
