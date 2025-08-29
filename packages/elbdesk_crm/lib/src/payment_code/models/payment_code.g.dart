// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentCodeImpl _$$PaymentCodeImplFromJson(Map<String, dynamic> json) =>
    _$PaymentCodeImpl(
      code: json['code'] as String,
      description: json['description'] as String,
      dueDateCalculation: json['dueDateCalculation'] as String,
      discountDateCalculation: json['discountDateCalculation'] as String,
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      calculateDiscountOnCreditNote:
          json['calculateDiscountOnCreditNote'] as bool,
      meta: DataMeta.fromJson(json['meta'] as Map<String, dynamic>),
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaymentCodeImplToJson(_$PaymentCodeImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'description': instance.description,
      'dueDateCalculation': instance.dueDateCalculation,
      'discountDateCalculation': instance.discountDateCalculation,
      'discountPercentage': instance.discountPercentage,
      'calculateDiscountOnCreditNote': instance.calculateDiscountOnCreditNote,
      'meta': instance.meta,
      'id': instance.id,
    };
