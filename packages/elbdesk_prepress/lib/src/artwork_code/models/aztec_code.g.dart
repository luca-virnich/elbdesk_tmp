// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aztec_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AztecCodeImpl _$$AztecCodeImplFromJson(Map<String, dynamic> json) =>
    _$AztecCodeImpl(
      symbolSize: (json['symbolSize'] as num?)?.toDouble(),
      errorCorrection: (json['errorCorrection'] as num?)?.toDouble(),
      deviceCompensation: (json['deviceCompensation'] as num?)?.toDouble(),
      cellSize: (json['cellSize'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$AztecCodeImplToJson(_$AztecCodeImpl instance) =>
    <String, dynamic>{
      'symbolSize': instance.symbolSize,
      'errorCorrection': instance.errorCorrection,
      'deviceCompensation': instance.deviceCompensation,
      'cellSize': instance.cellSize,
    };
