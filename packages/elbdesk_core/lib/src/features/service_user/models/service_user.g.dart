// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceUserImpl _$$ServiceUserImplFromJson(Map<String, dynamic> json) =>
    _$ServiceUserImpl(
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      serviceName: json['serviceName'] as String,
      serviceDescription: json['serviceDescription'] as String,
      isActive: json['isActive'] as bool,
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => ServiceUserToken.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ServiceUserImplToJson(_$ServiceUserImpl instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'userInfo': instance.userInfo,
      'serviceName': instance.serviceName,
      'serviceDescription': instance.serviceDescription,
      'isActive': instance.isActive,
      'tokens': instance.tokens,
    };
