import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/src/payment_code/models/payment_code.dart';

final List<PaymentCode> allPaymentCodesForSetup = [
  PaymentCode(
    code: '10 TAGE',
    description: '10 Tage netto',
    dueDateCalculation: '10D',
    discountDateCalculation: '',
    discountPercentage: 0,
    calculateDiscountOnCreditNote: false,
    meta: DataMeta.initial(),
  ),
  PaymentCode(
    code: '14 TAGE',
    description: '14 Tage netto',
    dueDateCalculation: '14D',
    discountDateCalculation: '',
    discountPercentage: 0,
    calculateDiscountOnCreditNote: false,
    meta: DataMeta.initial(),
  ),
  PaymentCode(
    code: '15 TAGE',
    description: '15 Tage netto',
    dueDateCalculation: '15D',
    discountDateCalculation: '',
    discountPercentage: 0,
    calculateDiscountOnCreditNote: false,
    meta: DataMeta.initial(),
  ),
];
