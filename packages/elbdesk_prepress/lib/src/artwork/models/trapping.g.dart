// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trapping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrappingImpl _$$TrappingImplFromJson(Map<String, dynamic> json) =>
    _$TrappingImpl(
      trappNormal: (json['trappNormal'] as num).toDouble(),
      trappBlack: (json['trappBlack'] as num).toDouble(),
      trappBilder: (json['trappBilder'] as num).toDouble(),
      trappSonderfarben: (json['trappSonderfarben'] as num).toDouble(),
      trappRueckzug: (json['trappRueckzug'] as num).toDouble(),
    );

Map<String, dynamic> _$$TrappingImplToJson(_$TrappingImpl instance) =>
    <String, dynamic>{
      'trappNormal': instance.trappNormal,
      'trappBlack': instance.trappBlack,
      'trappBilder': instance.trappBilder,
      'trappSonderfarben': instance.trappSonderfarben,
      'trappRueckzug': instance.trappRueckzug,
    };
