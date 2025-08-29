// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomerCustomer _$CustomerCustomerFromJson(Map<String, dynamic> json) {
  return _CustomerCustomer.fromJson(json);
}

/// @nodoc
mixin _$CustomerCustomer {
  Contact? get customerCustomerContact => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;

  /// Serializes this CustomerCustomer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCustomerCopyWith<CustomerCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCustomerCopyWith<$Res> {
  factory $CustomerCustomerCopyWith(
          CustomerCustomer value, $Res Function(CustomerCustomer) then) =
      _$CustomerCustomerCopyWithImpl<$Res, CustomerCustomer>;
  @useResult
  $Res call(
      {Contact? customerCustomerContact,
      Customer? customer,
      DateTime? deletedAt,
      int id});

  $ContactCopyWith<$Res>? get customerCustomerContact;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$CustomerCustomerCopyWithImpl<$Res, $Val extends CustomerCustomer>
    implements $CustomerCustomerCopyWith<$Res> {
  _$CustomerCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCustomerContact = freezed,
    Object? customer = freezed,
    Object? deletedAt = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      customerCustomerContact: freezed == customerCustomerContact
          ? _value.customerCustomerContact
          : customerCustomerContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of CustomerCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get customerCustomerContact {
    if (_value.customerCustomerContact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.customerCustomerContact!, (value) {
      return _then(_value.copyWith(customerCustomerContact: value) as $Val);
    });
  }

  /// Create a copy of CustomerCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerCustomerImplCopyWith<$Res>
    implements $CustomerCustomerCopyWith<$Res> {
  factory _$$CustomerCustomerImplCopyWith(_$CustomerCustomerImpl value,
          $Res Function(_$CustomerCustomerImpl) then) =
      __$$CustomerCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Contact? customerCustomerContact,
      Customer? customer,
      DateTime? deletedAt,
      int id});

  @override
  $ContactCopyWith<$Res>? get customerCustomerContact;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$CustomerCustomerImplCopyWithImpl<$Res>
    extends _$CustomerCustomerCopyWithImpl<$Res, _$CustomerCustomerImpl>
    implements _$$CustomerCustomerImplCopyWith<$Res> {
  __$$CustomerCustomerImplCopyWithImpl(_$CustomerCustomerImpl _value,
      $Res Function(_$CustomerCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerCustomerContact = freezed,
    Object? customer = freezed,
    Object? deletedAt = freezed,
    Object? id = null,
  }) {
    return _then(_$CustomerCustomerImpl(
      customerCustomerContact: freezed == customerCustomerContact
          ? _value.customerCustomerContact
          : customerCustomerContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerCustomerImpl extends _CustomerCustomer {
  const _$CustomerCustomerImpl(
      {required this.customerCustomerContact,
      required this.customer,
      required this.deletedAt,
      required this.id})
      : super._();

  factory _$CustomerCustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerCustomerImplFromJson(json);

  @override
  final Contact? customerCustomerContact;
  @override
  final Customer? customer;
  @override
  final DateTime? deletedAt;
  @override
  final int id;

  @override
  String toString() {
    return 'CustomerCustomer(customerCustomerContact: $customerCustomerContact, customer: $customer, deletedAt: $deletedAt, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerCustomerImpl &&
            (identical(
                    other.customerCustomerContact, customerCustomerContact) ||
                other.customerCustomerContact == customerCustomerContact) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, customerCustomerContact, customer, deletedAt, id);

  /// Create a copy of CustomerCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerCustomerImplCopyWith<_$CustomerCustomerImpl> get copyWith =>
      __$$CustomerCustomerImplCopyWithImpl<_$CustomerCustomerImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerCustomerImplToJson(
      this,
    );
  }
}

abstract class _CustomerCustomer extends CustomerCustomer {
  const factory _CustomerCustomer(
      {required final Contact? customerCustomerContact,
      required final Customer? customer,
      required final DateTime? deletedAt,
      required final int id}) = _$CustomerCustomerImpl;
  const _CustomerCustomer._() : super._();

  factory _CustomerCustomer.fromJson(Map<String, dynamic> json) =
      _$CustomerCustomerImpl.fromJson;

  @override
  Contact? get customerCustomerContact;
  @override
  Customer? get customer;
  @override
  DateTime? get deletedAt;
  @override
  int get id;

  /// Create a copy of CustomerCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerCustomerImplCopyWith<_$CustomerCustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
