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
import '../../../modules/prepress/bearer/models/bearer.dart' as _i2;
import '../../../modules/crm/customer/models/customer.dart' as _i3;

abstract class BearerCustomerRelation implements _i1.SerializableModel {
  BearerCustomerRelation._({
    this.id,
    required this.bearerId,
    this.bearer,
    required this.customerId,
    this.customer,
  });

  factory BearerCustomerRelation({
    int? id,
    required int bearerId,
    _i2.BearerDTO? bearer,
    required int customerId,
    _i3.CustomerDTO? customer,
  }) = _BearerCustomerRelationImpl;

  factory BearerCustomerRelation.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return BearerCustomerRelation(
      id: jsonSerialization['id'] as int?,
      bearerId: jsonSerialization['bearerId'] as int,
      bearer: jsonSerialization['bearer'] == null
          ? null
          : _i2.BearerDTO.fromJson(
              (jsonSerialization['bearer'] as Map<String, dynamic>)),
      customerId: jsonSerialization['customerId'] as int,
      customer: jsonSerialization['customer'] == null
          ? null
          : _i3.CustomerDTO.fromJson(
              (jsonSerialization['customer'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int bearerId;

  _i2.BearerDTO? bearer;

  int customerId;

  _i3.CustomerDTO? customer;

  /// Returns a shallow copy of this [BearerCustomerRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  BearerCustomerRelation copyWith({
    int? id,
    int? bearerId,
    _i2.BearerDTO? bearer,
    int? customerId,
    _i3.CustomerDTO? customer,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'bearerId': bearerId,
      if (bearer != null) 'bearer': bearer?.toJson(),
      'customerId': customerId,
      if (customer != null) 'customer': customer?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _BearerCustomerRelationImpl extends BearerCustomerRelation {
  _BearerCustomerRelationImpl({
    int? id,
    required int bearerId,
    _i2.BearerDTO? bearer,
    required int customerId,
    _i3.CustomerDTO? customer,
  }) : super._(
          id: id,
          bearerId: bearerId,
          bearer: bearer,
          customerId: customerId,
          customer: customer,
        );

  /// Returns a shallow copy of this [BearerCustomerRelation]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  BearerCustomerRelation copyWith({
    Object? id = _Undefined,
    int? bearerId,
    Object? bearer = _Undefined,
    int? customerId,
    Object? customer = _Undefined,
  }) {
    return BearerCustomerRelation(
      id: id is int? ? id : this.id,
      bearerId: bearerId ?? this.bearerId,
      bearer: bearer is _i2.BearerDTO? ? bearer : this.bearer?.copyWith(),
      customerId: customerId ?? this.customerId,
      customer:
          customer is _i3.CustomerDTO? ? customer : this.customer?.copyWith(),
    );
  }
}
