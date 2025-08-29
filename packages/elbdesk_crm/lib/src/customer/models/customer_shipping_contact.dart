import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_shipping_contact.freezed.dart';

@freezed
class CustomerShippingContact with _$CustomerShippingContact {
  const factory CustomerShippingContact({
    required int id,
    required Contact contact,
    required Customer customer,
    required bool isPrimary,
  }) = _CustomerShippingContact;

  const CustomerShippingContact._();

  factory CustomerShippingContact.fromDTO(CustomerShippingContactDTO dto) =>
      CustomerShippingContact(
        id: dto.id!,
        contact: Contact.fromDTO(dto.shippingContact!),
        isPrimary: dto.isPrimary,
        customer: Customer.fromDTO(dto.customer!),
      );

  CustomerShippingContactDTO toDTO() => CustomerShippingContactDTO(
        id: id,
        shippingContactId: contact.meta.id!,
        isPrimary: isPrimary,
        customerId: customer.id!,
      );
}
