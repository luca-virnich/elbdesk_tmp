import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_billing_customer.freezed.dart';

@freezed
class CustomerBillingCustomer with _$CustomerBillingCustomer {
  const factory CustomerBillingCustomer({
    required int id,
    required Customer? billingCustomer,
    required bool isPrimary,
    required Customer? customer,
  }) = _CustomerBillingCustomer;

  const CustomerBillingCustomer._();

  factory CustomerBillingCustomer.fromDTO(CustomerBillingCustomerDTO dto) =>
      CustomerBillingCustomer(
        id: dto.id!,
        billingCustomer: dto.billingCustomer == null
            ? null
            : Customer.fromDTO(dto.billingCustomer!),
        isPrimary: dto.isPrimary,
        customer: dto.customer == null ? null : Customer.fromDTO(dto.customer!),
      );

  CustomerBillingCustomerDTO toDTO() => CustomerBillingCustomerDTO(
        id: id,
        billingCustomerId: billingCustomer!.id!,
        customerId: customer!.id!,
        isPrimary: isPrimary,
      );
}
