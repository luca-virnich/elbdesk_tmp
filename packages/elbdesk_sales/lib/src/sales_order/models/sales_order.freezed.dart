// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrder _$SalesOrderFromJson(Map<String, dynamic> json) {
  return _SalesOrder.fromJson(json);
}

/// @nodoc
mixin _$SalesOrder {
  String get description => throw _privateConstructorUsedError;
  int get customId => throw _privateConstructorUsedError;
  DateTime? get orderDate => throw _privateConstructorUsedError;
  LightUser? get assignedUser => throw _privateConstructorUsedError;
  String get keywords => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  SalesOrderStatus get status =>
      throw _privateConstructorUsedError; // required List<SalesOrderItem> items,
  Customer? get customer => throw _privateConstructorUsedError;
  Contact? get customerContactPerson => throw _privateConstructorUsedError;
  Contact? get customerCustomerContactPerson =>
      throw _privateConstructorUsedError;
  CustomerCustomer? get customerCustomer => throw _privateConstructorUsedError;
  String get customerFirstReference => throw _privateConstructorUsedError;
  String get customerSecondReference => throw _privateConstructorUsedError;
  String get customerCustomerReference => throw _privateConstructorUsedError;
  Contact? get shippingAddress => throw _privateConstructorUsedError;
  Customer? get billingAddress => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this SalesOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderCopyWith<SalesOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderCopyWith<$Res> {
  factory $SalesOrderCopyWith(
          SalesOrder value, $Res Function(SalesOrder) then) =
      _$SalesOrderCopyWithImpl<$Res, SalesOrder>;
  @useResult
  $Res call(
      {String description,
      int customId,
      DateTime? orderDate,
      LightUser? assignedUser,
      String keywords,
      String orderNumber,
      SalesOrderStatus status,
      Customer? customer,
      Contact? customerContactPerson,
      Contact? customerCustomerContactPerson,
      CustomerCustomer? customerCustomer,
      String customerFirstReference,
      String customerSecondReference,
      String customerCustomerReference,
      Contact? shippingAddress,
      Customer? billingAddress,
      DataMeta meta});

  $LightUserCopyWith<$Res>? get assignedUser;
  $CustomerCopyWith<$Res>? get customer;
  $ContactCopyWith<$Res>? get customerContactPerson;
  $ContactCopyWith<$Res>? get customerCustomerContactPerson;
  $CustomerCustomerCopyWith<$Res>? get customerCustomer;
  $ContactCopyWith<$Res>? get shippingAddress;
  $CustomerCopyWith<$Res>? get billingAddress;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$SalesOrderCopyWithImpl<$Res, $Val extends SalesOrder>
    implements $SalesOrderCopyWith<$Res> {
  _$SalesOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? customId = null,
    Object? orderDate = freezed,
    Object? assignedUser = freezed,
    Object? keywords = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customer = freezed,
    Object? customerContactPerson = freezed,
    Object? customerCustomerContactPerson = freezed,
    Object? customerCustomer = freezed,
    Object? customerFirstReference = null,
    Object? customerSecondReference = null,
    Object? customerCustomerReference = null,
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      customId: null == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalesOrderStatus,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      customerContactPerson: freezed == customerContactPerson
          ? _value.customerContactPerson
          : customerContactPerson // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customerCustomerContactPerson: freezed == customerCustomerContactPerson
          ? _value.customerCustomerContactPerson
          : customerCustomerContactPerson // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customerCustomer: freezed == customerCustomer
          ? _value.customerCustomer
          : customerCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerCustomer?,
      customerFirstReference: null == customerFirstReference
          ? _value.customerFirstReference
          : customerFirstReference // ignore: cast_nullable_to_non_nullable
              as String,
      customerSecondReference: null == customerSecondReference
          ? _value.customerSecondReference
          : customerSecondReference // ignore: cast_nullable_to_non_nullable
              as String,
      customerCustomerReference: null == customerCustomerReference
          ? _value.customerCustomerReference
          : customerCustomerReference // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as Contact?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as Customer?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LightUserCopyWith<$Res>? get assignedUser {
    if (_value.assignedUser == null) {
      return null;
    }

    return $LightUserCopyWith<$Res>(_value.assignedUser!, (value) {
      return _then(_value.copyWith(assignedUser: value) as $Val);
    });
  }

  /// Create a copy of SalesOrder
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

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get customerContactPerson {
    if (_value.customerContactPerson == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.customerContactPerson!, (value) {
      return _then(_value.copyWith(customerContactPerson: value) as $Val);
    });
  }

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get customerCustomerContactPerson {
    if (_value.customerCustomerContactPerson == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.customerCustomerContactPerson!,
        (value) {
      return _then(
          _value.copyWith(customerCustomerContactPerson: value) as $Val);
    });
  }

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCustomerCopyWith<$Res>? get customerCustomer {
    if (_value.customerCustomer == null) {
      return null;
    }

    return $CustomerCustomerCopyWith<$Res>(_value.customerCustomer!, (value) {
      return _then(_value.copyWith(customerCustomer: value) as $Val);
    });
  }

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get shippingAddress {
    if (_value.shippingAddress == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.shippingAddress!, (value) {
      return _then(_value.copyWith(shippingAddress: value) as $Val);
    });
  }

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get billingAddress {
    if (_value.billingAddress == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.billingAddress!, (value) {
      return _then(_value.copyWith(billingAddress: value) as $Val);
    });
  }

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesOrderImplCopyWith<$Res>
    implements $SalesOrderCopyWith<$Res> {
  factory _$$SalesOrderImplCopyWith(
          _$SalesOrderImpl value, $Res Function(_$SalesOrderImpl) then) =
      __$$SalesOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      int customId,
      DateTime? orderDate,
      LightUser? assignedUser,
      String keywords,
      String orderNumber,
      SalesOrderStatus status,
      Customer? customer,
      Contact? customerContactPerson,
      Contact? customerCustomerContactPerson,
      CustomerCustomer? customerCustomer,
      String customerFirstReference,
      String customerSecondReference,
      String customerCustomerReference,
      Contact? shippingAddress,
      Customer? billingAddress,
      DataMeta meta});

  @override
  $LightUserCopyWith<$Res>? get assignedUser;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $ContactCopyWith<$Res>? get customerContactPerson;
  @override
  $ContactCopyWith<$Res>? get customerCustomerContactPerson;
  @override
  $CustomerCustomerCopyWith<$Res>? get customerCustomer;
  @override
  $ContactCopyWith<$Res>? get shippingAddress;
  @override
  $CustomerCopyWith<$Res>? get billingAddress;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$SalesOrderImplCopyWithImpl<$Res>
    extends _$SalesOrderCopyWithImpl<$Res, _$SalesOrderImpl>
    implements _$$SalesOrderImplCopyWith<$Res> {
  __$$SalesOrderImplCopyWithImpl(
      _$SalesOrderImpl _value, $Res Function(_$SalesOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? customId = null,
    Object? orderDate = freezed,
    Object? assignedUser = freezed,
    Object? keywords = null,
    Object? orderNumber = null,
    Object? status = null,
    Object? customer = freezed,
    Object? customerContactPerson = freezed,
    Object? customerCustomerContactPerson = freezed,
    Object? customerCustomer = freezed,
    Object? customerFirstReference = null,
    Object? customerSecondReference = null,
    Object? customerCustomerReference = null,
    Object? shippingAddress = freezed,
    Object? billingAddress = freezed,
    Object? meta = null,
  }) {
    return _then(_$SalesOrderImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      customId: null == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: freezed == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalesOrderStatus,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      customerContactPerson: freezed == customerContactPerson
          ? _value.customerContactPerson
          : customerContactPerson // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customerCustomerContactPerson: freezed == customerCustomerContactPerson
          ? _value.customerCustomerContactPerson
          : customerCustomerContactPerson // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customerCustomer: freezed == customerCustomer
          ? _value.customerCustomer
          : customerCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerCustomer?,
      customerFirstReference: null == customerFirstReference
          ? _value.customerFirstReference
          : customerFirstReference // ignore: cast_nullable_to_non_nullable
              as String,
      customerSecondReference: null == customerSecondReference
          ? _value.customerSecondReference
          : customerSecondReference // ignore: cast_nullable_to_non_nullable
              as String,
      customerCustomerReference: null == customerCustomerReference
          ? _value.customerCustomerReference
          : customerCustomerReference // ignore: cast_nullable_to_non_nullable
              as String,
      shippingAddress: freezed == shippingAddress
          ? _value.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as Contact?,
      billingAddress: freezed == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as Customer?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderImpl extends _SalesOrder {
  const _$SalesOrderImpl(
      {required this.description,
      required this.customId,
      required this.orderDate,
      required this.assignedUser,
      required this.keywords,
      required this.orderNumber,
      required this.status,
      required this.customer,
      required this.customerContactPerson,
      required this.customerCustomerContactPerson,
      required this.customerCustomer,
      required this.customerFirstReference,
      required this.customerSecondReference,
      required this.customerCustomerReference,
      required this.shippingAddress,
      required this.billingAddress,
      required this.meta})
      : super._();

  factory _$SalesOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrderImplFromJson(json);

  @override
  final String description;
  @override
  final int customId;
  @override
  final DateTime? orderDate;
  @override
  final LightUser? assignedUser;
  @override
  final String keywords;
  @override
  final String orderNumber;
  @override
  final SalesOrderStatus status;
// required List<SalesOrderItem> items,
  @override
  final Customer? customer;
  @override
  final Contact? customerContactPerson;
  @override
  final Contact? customerCustomerContactPerson;
  @override
  final CustomerCustomer? customerCustomer;
  @override
  final String customerFirstReference;
  @override
  final String customerSecondReference;
  @override
  final String customerCustomerReference;
  @override
  final Contact? shippingAddress;
  @override
  final Customer? billingAddress;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'SalesOrder(description: $description, customId: $customId, orderDate: $orderDate, assignedUser: $assignedUser, keywords: $keywords, orderNumber: $orderNumber, status: $status, customer: $customer, customerContactPerson: $customerContactPerson, customerCustomerContactPerson: $customerCustomerContactPerson, customerCustomer: $customerCustomer, customerFirstReference: $customerFirstReference, customerSecondReference: $customerSecondReference, customerCustomerReference: $customerCustomerReference, shippingAddress: $shippingAddress, billingAddress: $billingAddress, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.customId, customId) ||
                other.customId == customId) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.assignedUser, assignedUser) ||
                other.assignedUser == assignedUser) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.customerContactPerson, customerContactPerson) ||
                other.customerContactPerson == customerContactPerson) &&
            (identical(other.customerCustomerContactPerson,
                    customerCustomerContactPerson) ||
                other.customerCustomerContactPerson ==
                    customerCustomerContactPerson) &&
            (identical(other.customerCustomer, customerCustomer) ||
                other.customerCustomer == customerCustomer) &&
            (identical(other.customerFirstReference, customerFirstReference) ||
                other.customerFirstReference == customerFirstReference) &&
            (identical(
                    other.customerSecondReference, customerSecondReference) ||
                other.customerSecondReference == customerSecondReference) &&
            (identical(other.customerCustomerReference,
                    customerCustomerReference) ||
                other.customerCustomerReference == customerCustomerReference) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      customId,
      orderDate,
      assignedUser,
      keywords,
      orderNumber,
      status,
      customer,
      customerContactPerson,
      customerCustomerContactPerson,
      customerCustomer,
      customerFirstReference,
      customerSecondReference,
      customerCustomerReference,
      shippingAddress,
      billingAddress,
      meta);

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderImplCopyWith<_$SalesOrderImpl> get copyWith =>
      __$$SalesOrderImplCopyWithImpl<_$SalesOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderImplToJson(
      this,
    );
  }
}

abstract class _SalesOrder extends SalesOrder {
  const factory _SalesOrder(
      {required final String description,
      required final int customId,
      required final DateTime? orderDate,
      required final LightUser? assignedUser,
      required final String keywords,
      required final String orderNumber,
      required final SalesOrderStatus status,
      required final Customer? customer,
      required final Contact? customerContactPerson,
      required final Contact? customerCustomerContactPerson,
      required final CustomerCustomer? customerCustomer,
      required final String customerFirstReference,
      required final String customerSecondReference,
      required final String customerCustomerReference,
      required final Contact? shippingAddress,
      required final Customer? billingAddress,
      required final DataMeta meta}) = _$SalesOrderImpl;
  const _SalesOrder._() : super._();

  factory _SalesOrder.fromJson(Map<String, dynamic> json) =
      _$SalesOrderImpl.fromJson;

  @override
  String get description;
  @override
  int get customId;
  @override
  DateTime? get orderDate;
  @override
  LightUser? get assignedUser;
  @override
  String get keywords;
  @override
  String get orderNumber;
  @override
  SalesOrderStatus get status; // required List<SalesOrderItem> items,
  @override
  Customer? get customer;
  @override
  Contact? get customerContactPerson;
  @override
  Contact? get customerCustomerContactPerson;
  @override
  CustomerCustomer? get customerCustomer;
  @override
  String get customerFirstReference;
  @override
  String get customerSecondReference;
  @override
  String get customerCustomerReference;
  @override
  Contact? get shippingAddress;
  @override
  Customer? get billingAddress;
  @override
  DataMeta get meta;

  /// Create a copy of SalesOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderImplCopyWith<_$SalesOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
