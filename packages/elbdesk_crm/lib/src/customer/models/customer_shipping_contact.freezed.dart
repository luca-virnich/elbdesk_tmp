// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_shipping_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomerShippingContact {
  int get id => throw _privateConstructorUsedError;
  Contact get contact => throw _privateConstructorUsedError;
  Customer get customer => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;

  /// Create a copy of CustomerShippingContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerShippingContactCopyWith<CustomerShippingContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerShippingContactCopyWith<$Res> {
  factory $CustomerShippingContactCopyWith(CustomerShippingContact value,
          $Res Function(CustomerShippingContact) then) =
      _$CustomerShippingContactCopyWithImpl<$Res, CustomerShippingContact>;
  @useResult
  $Res call({int id, Contact contact, Customer customer, bool isPrimary});

  $ContactCopyWith<$Res> get contact;
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class _$CustomerShippingContactCopyWithImpl<$Res,
        $Val extends CustomerShippingContact>
    implements $CustomerShippingContactCopyWith<$Res> {
  _$CustomerShippingContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerShippingContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contact = null,
    Object? customer = null,
    Object? isPrimary = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of CustomerShippingContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res> get contact {
    return $ContactCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  /// Create a copy of CustomerShippingContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomerShippingContactImplCopyWith<$Res>
    implements $CustomerShippingContactCopyWith<$Res> {
  factory _$$CustomerShippingContactImplCopyWith(
          _$CustomerShippingContactImpl value,
          $Res Function(_$CustomerShippingContactImpl) then) =
      __$$CustomerShippingContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, Contact contact, Customer customer, bool isPrimary});

  @override
  $ContactCopyWith<$Res> get contact;
  @override
  $CustomerCopyWith<$Res> get customer;
}

/// @nodoc
class __$$CustomerShippingContactImplCopyWithImpl<$Res>
    extends _$CustomerShippingContactCopyWithImpl<$Res,
        _$CustomerShippingContactImpl>
    implements _$$CustomerShippingContactImplCopyWith<$Res> {
  __$$CustomerShippingContactImplCopyWithImpl(
      _$CustomerShippingContactImpl _value,
      $Res Function(_$CustomerShippingContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerShippingContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contact = null,
    Object? customer = null,
    Object? isPrimary = null,
  }) {
    return _then(_$CustomerShippingContactImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomerShippingContactImpl extends _CustomerShippingContact {
  const _$CustomerShippingContactImpl(
      {required this.id,
      required this.contact,
      required this.customer,
      required this.isPrimary})
      : super._();

  @override
  final int id;
  @override
  final Contact contact;
  @override
  final Customer customer;
  @override
  final bool isPrimary;

  @override
  String toString() {
    return 'CustomerShippingContact(id: $id, contact: $contact, customer: $customer, isPrimary: $isPrimary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerShippingContactImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, contact, customer, isPrimary);

  /// Create a copy of CustomerShippingContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerShippingContactImplCopyWith<_$CustomerShippingContactImpl>
      get copyWith => __$$CustomerShippingContactImplCopyWithImpl<
          _$CustomerShippingContactImpl>(this, _$identity);
}

abstract class _CustomerShippingContact extends CustomerShippingContact {
  const factory _CustomerShippingContact(
      {required final int id,
      required final Contact contact,
      required final Customer customer,
      required final bool isPrimary}) = _$CustomerShippingContactImpl;
  const _CustomerShippingContact._() : super._();

  @override
  int get id;
  @override
  Contact get contact;
  @override
  Customer get customer;
  @override
  bool get isPrimary;

  /// Create a copy of CustomerShippingContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerShippingContactImplCopyWith<_$CustomerShippingContactImpl>
      get copyWith => throw _privateConstructorUsedError;
}
