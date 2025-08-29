import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_customer.freezed.dart';
part 'customer_customer.g.dart';

@freezed
class CustomerCustomer with _$CustomerCustomer {
  const factory CustomerCustomer({
    required Contact? customerCustomerContact,
    required Customer? customer,
    required DateTime? deletedAt,
    required int id,
  }) = _CustomerCustomer;

  const CustomerCustomer._();

  factory CustomerCustomer.fromJson(Map<String, Object?> json) =>
      _$CustomerCustomerFromJson(json);

  factory CustomerCustomer.fromDTO(CustomerCustomerDTO dto) {
    return CustomerCustomer(
      id: dto.id!,
      customerCustomerContact: dto.customerCustomerContact != null
          ? Contact.fromDTO(dto.customerCustomerContact!)
          : null,
      customer: dto.customer != null ? Customer.fromDTO(dto.customer!) : null,
      deletedAt: dto.deletedAt,
    );
  }
}
