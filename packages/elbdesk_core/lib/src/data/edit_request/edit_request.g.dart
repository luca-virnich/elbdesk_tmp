// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EditRequestImpl _$$EditRequestImplFromJson(Map<String, dynamic> json) =>
    _$EditRequestImpl(
      createdByName: json['createdByName'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      message: json['message'] as String,
      requestId: json['requestId'] as String,
      requestingFloatingWindowId: json['requestingFloatingWindowId'] as String,
    );

Map<String, dynamic> _$$EditRequestImplToJson(_$EditRequestImpl instance) =>
    <String, dynamic>{
      'createdByName': instance.createdByName,
      'createdAt': instance.createdAt.toIso8601String(),
      'message': instance.message,
      'requestId': instance.requestId,
      'requestingFloatingWindowId': instance.requestingFloatingWindowId,
    };
