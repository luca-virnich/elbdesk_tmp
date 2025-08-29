// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_billing_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerBillingCustomer {
  int get id => throw _privateConstructorUsedError;
  Customer? get billingCustomer => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;

  /// Create a copy of CustomerBillingCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerBillingCustomerCopyWith<CustomerBillingCustomer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerBillingCustomerCopyWith<$Res> {
  factory $CustomerBillingCustomerCopyWith(CustomerBillingCustomer value,
          $Res Function(CustomerBillingCustomer) then) =
      _$CustomerBillingCustomerCopyWithImpl<$Res, CustomerBillingCustomer>;
  @useResult
  $Res call(
      {int id, Customer? billingCustomer, bool isPrimary, Customer? customer});

  $CustomerCopyWith<$Res>? get billingCustomer;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$CustomerBillingCustomerCopyWithImpl<$Res,
        $Val extends CustomerBillingCustomer>
    implements $CustomerBillingCustomerCopyWith<$Res> {
  _$CustomerBillingCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerBillingCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billingCustomer = freezed,
    Object? isPrimary = null,
    Object? customer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      billingCustomer: freezed == billingCustomer
          ? _value.billingCustomer
          : billingCustomer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ) as $Val);
  }

  /// Create a copy of CustomerBillingCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get billingCustomer {
    if (_value.billingCustomer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.billingCustomer!, (value) {
      return _then(_value.copyWith(billingCustomer: value) as $Val);
    });
  }

  /// Create a copy of CustomerBillingCustomer
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
abstract class _$$CustomerBillingCustomerImplCopyWith<$Res>
    implements $CustomerBillingCustomerCopyWith<$Res> {
  factory _$$CustomerBillingCustomerImplCopyWith(
          _$CustomerBillingCustomerImpl value,
          $Res Function(_$CustomerBillingCustomerImpl) then) =
      __$$CustomerBillingCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, Customer? billingCustomer, bool isPrimary, Customer? customer});

  @override
  $CustomerCopyWith<$Res>? get billingCustomer;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$CustomerBillingCustomerImplCopyWithImpl<$Res>
    extends _$CustomerBillingCustomerCopyWithImpl<$Res,
        _$CustomerBillingCustomerImpl>
    implements _$$CustomerBillingCustomerImplCopyWith<$Res> {
  __$$CustomerBillingCustomerImplCopyWithImpl(
      _$CustomerBillingCustomerImpl _value,
      $Res Function(_$CustomerBillingCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerBillingCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? billingCustomer = freezed,
    Object? isPrimary = null,
    Object? customer = freezed,
  }) {
    return _then(_$CustomerBillingCustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      billingCustomer: freezed == billingCustomer
          ? _value.billingCustomer
          : billingCustomer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc

class _$CustomerBillingCustomerImpl extends _CustomerBillingCustomer {
  const _$CustomerBillingCustomerImpl(
      {required this.id,
      required this.billingCustomer,
      required this.isPrimary,
      required this.customer})
      : super._();

  @override
  final int id;
  @override
  final Customer? billingCustomer;
  @override
  final bool isPrimary;
  @override
  final Customer? customer;

  @override
  String toString() {
    return 'CustomerBillingCustomer(id: $id, billingCustomer: $billingCustomer, isPrimary: $isPrimary, customer: $customer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerBillingCustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.billingCustomer, billingCustomer) ||
                other.billingCustomer == billingCustomer) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, billingCustomer, isPrimary, customer);

  /// Create a copy of CustomerBillingCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerBillingCustomerImplCopyWith<_$CustomerBillingCustomerImpl>
      get copyWith => __$$CustomerBillingCustomerImplCopyWithImpl<
          _$CustomerBillingCustomerImpl>(this, _$identity);
}

abstract class _CustomerBillingCustomer extends CustomerBillingCustomer {
  const factory _CustomerBillingCustomer(
      {required final int id,
      required final Customer? billingCustomer,
      required final bool isPrimary,
      required final Customer? customer}) = _$CustomerBillingCustomerImpl;
  const _CustomerBillingCustomer._() : super._();

  @override
  int get id;
  @override
  Customer? get billingCustomer;
  @override
  bool get isPrimary;
  @override
  Customer? get customer;

  /// Create a copy of CustomerBillingCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerBillingCustomerImplCopyWith<_$CustomerBillingCustomerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
