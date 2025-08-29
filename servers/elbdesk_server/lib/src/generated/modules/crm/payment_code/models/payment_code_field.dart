/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

enum PaymentCodeField implements _i1.SerializableModel {
  id,
  code,
  dueDateCalculation,
  discountDateCalculation,
  discountPercentage,
  calculateDiscountOnCreditNote,
  description,
  createdAt,
  createdBy,
  lastModifiedAt,
  lastModifiedBy,
  deletedAt,
  isDraft;

  static PaymentCodeField fromJson(String name) {
    switch (name) {
      case 'id':
        return PaymentCodeField.id;
      case 'code':
        return PaymentCodeField.code;
      case 'dueDateCalculation':
        return PaymentCodeField.dueDateCalculation;
      case 'discountDateCalculation':
        return PaymentCodeField.discountDateCalculation;
      case 'discountPercentage':
        return PaymentCodeField.discountPercentage;
      case 'calculateDiscountOnCreditNote':
        return PaymentCodeField.calculateDiscountOnCreditNote;
      case 'description':
        return PaymentCodeField.description;
      case 'createdAt':
        return PaymentCodeField.createdAt;
      case 'createdBy':
        return PaymentCodeField.createdBy;
      case 'lastModifiedAt':
        return PaymentCodeField.lastModifiedAt;
      case 'lastModifiedBy':
        return PaymentCodeField.lastModifiedBy;
      case 'deletedAt':
        return PaymentCodeField.deletedAt;
      case 'isDraft':
        return PaymentCodeField.isDraft;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "PaymentCodeField"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
