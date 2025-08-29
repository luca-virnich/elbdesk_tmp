import 'package:collection/collection.dart';
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PaymentCodeUtils {
  static const tableType = TableType.paymentCode;

  static Expression<dynamic>? buildExpression(
    Filter? filter,
  ) {
    return buildFilterExpression<PaymentCodeDTOTable, PaymentCodeField>(
      table: PaymentCodeDTOTable(),
      filter: filter,
      enumFromString: (String fieldKey) =>
          PaymentCodeField.values.firstWhereOrNull((e) => e.name == fieldKey),
      getDbField: (table, field) => dbFieldFromEnum(field)(table),
    );
  }

  static Column<dynamic> Function(PaymentCodeDTOTable) orderBy(
    PaymentCodeField? sortField,
  ) {
    if (sortField == null) {
      return dbFieldFromEnum(PaymentCodeField.code);
    }
    return dbFieldFromEnum(sortField);
  }

  static Column<dynamic> Function(PaymentCodeDTOTable) dbFieldFromEnum(
    PaymentCodeField sortFieldEnum,
  ) {
    switch (sortFieldEnum) {
      case PaymentCodeField.code:
        return (PaymentCodeDTOTable t) => t.code;
      case PaymentCodeField.id:
        return (PaymentCodeDTOTable t) => t.id;
      case PaymentCodeField.description:
        return (PaymentCodeDTOTable t) => t.description;
      case PaymentCodeField.dueDateCalculation:
        return (PaymentCodeDTOTable t) => t.dueDateCalculation;
      case PaymentCodeField.discountDateCalculation:
        return (PaymentCodeDTOTable t) => t.discountDateCalculation;
      case PaymentCodeField.discountPercentage:
        return (PaymentCodeDTOTable t) => t.discountPercentage;
      case PaymentCodeField.calculateDiscountOnCreditNote:
        return (PaymentCodeDTOTable t) => t.calculateDiscountOnCreditNote;
      case PaymentCodeField.createdAt:
        return (PaymentCodeDTOTable t) => t.createdAt;
      case PaymentCodeField.createdBy:
        return (PaymentCodeDTOTable t) => t.createdById;
      case PaymentCodeField.lastModifiedAt:
        return (PaymentCodeDTOTable t) => t.lastModifiedAt;
      case PaymentCodeField.lastModifiedBy:
        return (PaymentCodeDTOTable t) => t.lastModifiedById;
      case PaymentCodeField.deletedAt:
        return (PaymentCodeDTOTable t) => t.deletedAt;
      case PaymentCodeField.isDraft:
        return (PaymentCodeDTOTable t) => t.isDraft;
    }
  }

  static PaymentCodeDTO initialPaymentCode({
    required int userId,
    required DateTime now,
    required String sessionId,
    required PaymentCodeDTO entity,
    required bool release,
  }) {
    return PaymentCodeDTO(
      code: entity.code,
      dueDateCalculation: entity.dueDateCalculation,
      discountDateCalculation: entity.discountDateCalculation,
      discountPercentage: entity.discountPercentage,
      calculateDiscountOnCreditNote: entity.calculateDiscountOnCreditNote,
      description: entity.description,
      createdAt: now,
      isDraft: false,
      createdById: userId,
      editingSince: null,
      editingById: null,
      deletedAt: null,
      deletedById: null,
      lastModifiedAt: null,
      lastModifiedById: null,
      editingSession: release ? null : sessionId,
    );
  }
}
