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

abstract class CustomerBillingCustomerDTO implements _i1.SerializableModel {
  CustomerBillingCustomerDTO._({
    this.id,
    required this.customerId,
    this.customer,
    required this.billingCustomerId,
    this.billingCustomer,
    required this.isPrimary,
  });

  factory CustomerBillingCustomerDTO({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int billingCustomerId,
    _i2.CustomerDTO? billingCustomer,
    required bool isPrimary,
  }) = _CustomerBillingCustomerDTOImpl;

  factory CustomerBillingCustomerDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return CustomerBillingCustomerDTO(
      id: jsonSerialization['id'] as int?,
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
      billingCustomerId: jsonSerialization['billingCustomerId'] as int,
      billingCustomer: jsonSerialization['billingCustomer'] == null
          ? null
          : _i2.CustomerDTO.fromJson(
              (jsonSerialization['billingCustomer'] as Map<String, dynamic>)),
      isPrimary: jsonSerialization['isPrimary'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int customerId;

  _i2.CustomerDTO? customer;

  int billingCustomerId;

  _i2.CustomerDTO? billingCustomer;

  bool isPrimary;

  /// Returns a shallow copy of this [CustomerBillingCustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CustomerBillingCustomerDTO copyWith({
    int? id,
    int? customerId,
    _i2.CustomerDTO? customer,
    int? billingCustomerId,
    _i2.CustomerDTO? billingCustomer,
    bool? isPrimary,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
      'billingCustomerId': billingCustomerId,
      if (billingCustomer != null) 'billingCustomer': billingCustomer?.toJson(),
      'isPrimary': isPrimary,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CustomerBillingCustomerDTOImpl extends CustomerBillingCustomerDTO {
  _CustomerBillingCustomerDTOImpl({
    int? id,
    required int customerId,
    _i2.CustomerDTO? customer,
    required int billingCustomerId,
    _i2.CustomerDTO? billingCustomer,
    required bool isPrimary,
  }) : super._(
          id: id,
          customerId: customerId,
          customer: customer,
          billingCustomerId: billingCustomerId,
          billingCustomer: billingCustomer,
          isPrimary: isPrimary,
        );

  /// Returns a shallow copy of this [CustomerBillingCustomerDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CustomerBillingCustomerDTO copyWith({
    Object? id = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
    int? billingCustomerId,
    Object? billingCustomer = _Undefined,
    bool? isPrimary,
  }) {
    return CustomerBillingCustomerDTO(
      id: id is int? ? id : this.id,
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i2.CustomerDTO? ? customer : this.customer?.copyWith(),
      billingCustomerId: billingCustomerId ?? this.billingCustomerId,
      billingCustomer: billingCustomer is _i2.CustomerDTO?
          ? billingCustomer
          : this.billingCustomer?.copyWith(),
      isPrimary: isPrimary ?? this.isPrimary,
    );
  }
}
