// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceUserTokenImpl _$$ServiceUserTokenImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceUserTokenImpl(
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      authKey: json['authKey'] == null
          ? null
          : AuthKey.fromJson(json['authKey'] as Map<String, dynamic>),
      tokenDescription: json['tokenDescription'] as String,
    );

Map<String, dynamic> _$$ServiceUserTokenImplToJson(
        _$ServiceUserTokenImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'authKey': instance.authKey,
      'tokenDescription': instance.tokenDescription,
    };
