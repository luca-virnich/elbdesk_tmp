// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'light_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LightUserImpl _$$LightUserImplFromJson(Map<String, dynamic> json) =>
    _$LightUserImpl(
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      initials: json['initials'] as String,
      imageUrl: json['imageUrl'] as String,
      userInfoId: (json['userInfoId'] as num).toInt(),
      isActive: json['isActive'] as bool,
      lightUserId: (json['lightUserId'] as num).toInt(),
    );

Map<String, dynamic> _$$LightUserImplToJson(_$LightUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'initials': instance.initials,
      'imageUrl': instance.imageUrl,
      'userInfoId': instance.userInfoId,
      'isActive': instance.isActive,
      'lightUserId': instance.lightUserId,
    };
