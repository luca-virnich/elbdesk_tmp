/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../../modules/crm/customer/models/customer.dart' as _i2;
import '../../../../modules/crm/contact/models/contact.dart' as _i3;

abstract class CustomerShippingContactDTO implements _i1.SerializableModel {
  CustomerShippingContactDTO._({
    this.id,
    required this.customerId,
    this.customer,
    required this.shippingContactId,
    this.shippingContact,
    required this.isPrimary,
  });

  factory CustomerShippingContactDTO({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int shippingContactId,
    _i3.ContactDTO? shippingContact,
    required bool isPrimary,
  }) = _CustomerShippingContactDTOImpl;

  factory CustomerShippingContactDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CustomerShippingContactDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      shippingContactId: jsonSerialization['shippingContactId'] as int,
      shippingContact: jsonSerialization['shippingContact'] == null
          ? null
          : _i3.ContactDTO.fromJson(
              (jsonSerialization['shippingContact'] as Map<String, dynamic>)),
      isPrimary: jsonSerialization['isPrimary'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int customerId;

  _i2.CustomerDTO? customer;

  int shippingContactId;

  _i3.ContactDTO? shippingContact;

  bool isPrimary;

  /// Returns a shallow copy of this [CustomerShippingContactDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerShippingContactDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? shippingContactId,
    _i3.ContactDTO? shippingContact,
    bool? isPrimary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'shippingContactId': shippingContactId,
      if (shippingContact != null) 'shippingContact': shippingContact?.toJson(),
      'isPrimary': isPrimary,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerShippingContactDTOImpl extends CustomerShippingContactDTO {
  _CustomerShippingContactDTOImpl({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int shippingContactId,
    _i3.ContactDTO? shippingContact,
    required bool isPrimary,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          shippingContactId: shippingContactId,
          shippingContact: shippingContact,
          isPrimary: isPrimary,
        );

  /// Returns a shallow copy of this [CustomerShippingContactDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerShippingContactDTO copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? shippingContactId,
    Object? shippingContact = _Undefined,
    bool? isPrimary,
  }) {
    return CustomerShippingContactDTO(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      shippingContactId: shippingContactId ?? this.shippingContactId,
      shippingContact: shippingContact is _i3.ContactDTO?
          ? shippingContact
          : this.shippingContact?.copyWith(),
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }
}
