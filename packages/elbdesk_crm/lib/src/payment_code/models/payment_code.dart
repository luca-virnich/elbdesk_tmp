import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_code.freezed.dart';
part 'payment_code.g.dart';

@freezed
class PaymentCode with _$PaymentCode, HasMetaData {
  const factory PaymentCode({
    required String code,
    required String description,
    required String dueDateCalculation,
    required String discountDateCalculation,
    required double discountPercentage,
    required bool calculateDiscountOnCreditNote,
    required DataMeta meta,
    int? id,
  }) = _PaymentCode;

  const PaymentCode._();

  factory PaymentCode.fromJson(Map<String, Object?> json) =>
      _$PaymentCodeFromJson(json);

  /// Creates a [PaymentCode] from a [PaymentCodeDTO]
  factory PaymentCode.fromDTO(PaymentCodeDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return PaymentCode(
      id: dto.id,
      code: dto.code,
      description: dto.description,
      dueDateCalculation: dto.dueDateCalculation,
      discountDateCalculation: dto.discountDateCalculation,
      discountPercentage: dto.discountPercentage,
      calculateDiscountOnCreditNote: dto.calculateDiscountOnCreditNote,
      meta: dataMeta,
    );
  }

  factory PaymentCode.initial() => PaymentCode(
        code: '',
        description: '',
        dueDateCalculation: '',
        discountDateCalculation: '',
        discountPercentage: 0,
        calculateDiscountOnCreditNote: false,
        meta: DataMeta.initial(),
      );

  PaymentCodeDTO toDTO() => PaymentCodeDTO(
        code: code,
        description: description,
        dueDateCalculation: dueDateCalculation,
        discountDateCalculation: discountDateCalculation,
        discountPercentage: discountPercentage,
        calculateDiscountOnCreditNote: calculateDiscountOnCreditNote,
        createdAt: DateTime.now(),
        isDraft: meta.isDraft,
        id: id,
      );
}
