// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  DataMeta get meta => throw _privateConstructorUsedError;
  Contact? get contact => throw _privateConstructorUsedError;
  int get customId => throw _privateConstructorUsedError;
  String get vatId => throw _privateConstructorUsedError;
  String get invoiceEmail => throw _privateConstructorUsedError;
  InvoiceDeliveryMethod? get invoiceDeliveryMethod =>
      throw _privateConstructorUsedError;
  CustomerSalesOrderHints get salesOrderHints =>
      throw _privateConstructorUsedError;
  PaymentCode? get paymentCode => throw _privateConstructorUsedError;
  ShippingMethod? get shippingMethod => throw _privateConstructorUsedError;
  List<FTPInterfaceDTO> get ftpInterfaces => throw _privateConstructorUsedError;
  AppClient? get contractSovereignty => throw _privateConstructorUsedError;
  LightUser? get assignedUser => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {DataMeta meta,
      Contact? contact,
      int customId,
      String vatId,
      String invoiceEmail,
      InvoiceDeliveryMethod? invoiceDeliveryMethod,
      CustomerSalesOrderHints salesOrderHints,
      PaymentCode? paymentCode,
      ShippingMethod? shippingMethod,
      List<FTPInterfaceDTO> ftpInterfaces,
      AppClient? contractSovereignty,
      LightUser? assignedUser,
      int? id});

  $DataMetaCopyWith<$Res> get meta;
  $ContactCopyWith<$Res>? get contact;
  $CustomerSalesOrderHintsCopyWith<$Res> get salesOrderHints;
  $PaymentCodeCopyWith<$Res>? get paymentCode;
  $ShippingMethodCopyWith<$Res>? get shippingMethod;
  $AppClientCopyWith<$Res>? get contractSovereignty;
  $LightUserCopyWith<$Res>? get assignedUser;
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? contact = freezed,
    Object? customId = null,
    Object? vatId = null,
    Object? invoiceEmail = null,
    Object? invoiceDeliveryMethod = freezed,
    Object? salesOrderHints = null,
    Object? paymentCode = freezed,
    Object? shippingMethod = freezed,
    Object? ftpInterfaces = null,
    Object? contractSovereignty = freezed,
    Object? assignedUser = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customId: null == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as int,
      vatId: null == vatId
          ? _value.vatId
          : vatId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceEmail: null == invoiceEmail
          ? _value.invoiceEmail
          : invoiceEmail // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDeliveryMethod: freezed == invoiceDeliveryMethod
          ? _value.invoiceDeliveryMethod
          : invoiceDeliveryMethod // ignore: cast_nullable_to_non_nullable
              as InvoiceDeliveryMethod?,
      salesOrderHints: null == salesOrderHints
          ? _value.salesOrderHints
          : salesOrderHints // ignore: cast_nullable_to_non_nullable
              as CustomerSalesOrderHints,
      paymentCode: freezed == paymentCode
          ? _value.paymentCode
          : paymentCode // ignore: cast_nullable_to_non_nullable
              as PaymentCode?,
      shippingMethod: freezed == shippingMethod
          ? _value.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as ShippingMethod?,
      ftpInterfaces: null == ftpInterfaces
          ? _value.ftpInterfaces
          : ftpInterfaces // ignore: cast_nullable_to_non_nullable
              as List<FTPInterfaceDTO>,
      contractSovereignty: freezed == contractSovereignty
          ? _value.contractSovereignty
          : contractSovereignty // ignore: cast_nullable_to_non_nullable
              as AppClient?,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get contact {
    if (_value.contact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.contact!, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerSalesOrderHintsCopyWith<$Res> get salesOrderHints {
    return $CustomerSalesOrderHintsCopyWith<$Res>(_value.salesOrderHints,
        (value) {
      return _then(_value.copyWith(salesOrderHints: value) as $Val);
    });
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentCodeCopyWith<$Res>? get paymentCode {
    if (_value.paymentCode == null) {
      return null;
    }

    return $PaymentCodeCopyWith<$Res>(_value.paymentCode!, (value) {
      return _then(_value.copyWith(paymentCode: value) as $Val);
    });
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ShippingMethodCopyWith<$Res>? get shippingMethod {
    if (_value.shippingMethod == null) {
      return null;
    }

    return $ShippingMethodCopyWith<$Res>(_value.shippingMethod!, (value) {
      return _then(_value.copyWith(shippingMethod: value) as $Val);
    });
  }

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppClientCopyWith<$Res>? get contractSovereignty {
    if (_value.contractSovereignty == null) {
      return null;
    }

    return $AppClientCopyWith<$Res>(_value.contractSovereignty!, (value) {
      return _then(_value.copyWith(contractSovereignty: value) as $Val);
    });
  }

  /// Create a copy of Customer
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
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataMeta meta,
      Contact? contact,
      int customId,
      String vatId,
      String invoiceEmail,
      InvoiceDeliveryMethod? invoiceDeliveryMethod,
      CustomerSalesOrderHints salesOrderHints,
      PaymentCode? paymentCode,
      ShippingMethod? shippingMethod,
      List<FTPInterfaceDTO> ftpInterfaces,
      AppClient? contractSovereignty,
      LightUser? assignedUser,
      int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
  @override
  $ContactCopyWith<$Res>? get contact;
  @override
  $CustomerSalesOrderHintsCopyWith<$Res> get salesOrderHints;
  @override
  $PaymentCodeCopyWith<$Res>? get paymentCode;
  @override
  $ShippingMethodCopyWith<$Res>? get shippingMethod;
  @override
  $AppClientCopyWith<$Res>? get contractSovereignty;
  @override
  $LightUserCopyWith<$Res>? get assignedUser;
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? contact = freezed,
    Object? customId = null,
    Object? vatId = null,
    Object? invoiceEmail = null,
    Object? invoiceDeliveryMethod = freezed,
    Object? salesOrderHints = null,
    Object? paymentCode = freezed,
    Object? shippingMethod = freezed,
    Object? ftpInterfaces = null,
    Object? contractSovereignty = freezed,
    Object? assignedUser = freezed,
    Object? id = freezed,
  }) {
    return _then(_$CustomerImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      contact: freezed == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      customId: null == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as int,
      vatId: null == vatId
          ? _value.vatId
          : vatId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceEmail: null == invoiceEmail
          ? _value.invoiceEmail
          : invoiceEmail // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceDeliveryMethod: freezed == invoiceDeliveryMethod
          ? _value.invoiceDeliveryMethod
          : invoiceDeliveryMethod // ignore: cast_nullable_to_non_nullable
              as InvoiceDeliveryMethod?,
      salesOrderHints: null == salesOrderHints
          ? _value.salesOrderHints
          : salesOrderHints // ignore: cast_nullable_to_non_nullable
              as CustomerSalesOrderHints,
      paymentCode: freezed == paymentCode
          ? _value.paymentCode
          : paymentCode // ignore: cast_nullable_to_non_nullable
              as PaymentCode?,
      shippingMethod: freezed == shippingMethod
          ? _value.shippingMethod
          : shippingMethod // ignore: cast_nullable_to_non_nullable
              as ShippingMethod?,
      ftpInterfaces: null == ftpInterfaces
          ? _value._ftpInterfaces
          : ftpInterfaces // ignore: cast_nullable_to_non_nullable
              as List<FTPInterfaceDTO>,
      contractSovereignty: freezed == contractSovereignty
          ? _value.contractSovereignty
          : contractSovereignty // ignore: cast_nullable_to_non_nullable
              as AppClient?,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl extends _Customer {
  const _$CustomerImpl(
      {required this.meta,
      required this.contact,
      required this.customId,
      required this.vatId,
      required this.invoiceEmail,
      required this.invoiceDeliveryMethod,
      required this.salesOrderHints,
      required this.paymentCode,
      required this.shippingMethod,
      required final List<FTPInterfaceDTO> ftpInterfaces,
      required this.contractSovereignty,
      required this.assignedUser,
      this.id})
      : _ftpInterfaces = ftpInterfaces,
        super._();

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final DataMeta meta;
  @override
  final Contact? contact;
  @override
  final int customId;
  @override
  final String vatId;
  @override
  final String invoiceEmail;
  @override
  final InvoiceDeliveryMethod? invoiceDeliveryMethod;
  @override
  final CustomerSalesOrderHints salesOrderHints;
  @override
  final PaymentCode? paymentCode;
  @override
  final ShippingMethod? shippingMethod;
  final List<FTPInterfaceDTO> _ftpInterfaces;
  @override
  List<FTPInterfaceDTO> get ftpInterfaces {
    if (_ftpInterfaces is EqualUnmodifiableListView) return _ftpInterfaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ftpInterfaces);
  }

  @override
  final AppClient? contractSovereignty;
  @override
  final LightUser? assignedUser;
  @override
  final int? id;

  @override
  String toString() {
    return 'Customer(meta: $meta, contact: $contact, customId: $customId, vatId: $vatId, invoiceEmail: $invoiceEmail, invoiceDeliveryMethod: $invoiceDeliveryMethod, salesOrderHints: $salesOrderHints, paymentCode: $paymentCode, shippingMethod: $shippingMethod, ftpInterfaces: $ftpInterfaces, contractSovereignty: $contractSovereignty, assignedUser: $assignedUser, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.customId, customId) ||
                other.customId == customId) &&
            (identical(other.vatId, vatId) || other.vatId == vatId) &&
            (identical(other.invoiceEmail, invoiceEmail) ||
                other.invoiceEmail == invoiceEmail) &&
            (identical(other.invoiceDeliveryMethod, invoiceDeliveryMethod) ||
                other.invoiceDeliveryMethod == invoiceDeliveryMethod) &&
            (identical(other.salesOrderHints, salesOrderHints) ||
                other.salesOrderHints == salesOrderHints) &&
            (identical(other.paymentCode, paymentCode) ||
                other.paymentCode == paymentCode) &&
            (identical(other.shippingMethod, shippingMethod) ||
                other.shippingMethod == shippingMethod) &&
            const DeepCollectionEquality()
                .equals(other._ftpInterfaces, _ftpInterfaces) &&
            (identical(other.contractSovereignty, contractSovereignty) ||
                other.contractSovereignty == contractSovereignty) &&
            (identical(other.assignedUser, assignedUser) ||
                other.assignedUser == assignedUser) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      contact,
      customId,
      vatId,
      invoiceEmail,
      invoiceDeliveryMethod,
      salesOrderHints,
      paymentCode,
      shippingMethod,
      const DeepCollectionEquality().hash(_ftpInterfaces),
      contractSovereignty,
      assignedUser,
      id);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer extends Customer {
  const factory _Customer(
      {required final DataMeta meta,
      required final Contact? contact,
      required final int customId,
      required final String vatId,
      required final String invoiceEmail,
      required final InvoiceDeliveryMethod? invoiceDeliveryMethod,
      required final CustomerSalesOrderHints salesOrderHints,
      required final PaymentCode? paymentCode,
      required final ShippingMethod? shippingMethod,
      required final List<FTPInterfaceDTO> ftpInterfaces,
      required final AppClient? contractSovereignty,
      required final LightUser? assignedUser,
      final int? id}) = _$CustomerImpl;
  const _Customer._() : super._();

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  DataMeta get meta;
  @override
  Contact? get contact;
  @override
  int get customId;
  @override
  String get vatId;
  @override
  String get invoiceEmail;
  @override
  InvoiceDeliveryMethod? get invoiceDeliveryMethod;
  @override
  CustomerSalesOrderHints get salesOrderHints;
  @override
  PaymentCode? get paymentCode;
  @override
  ShippingMethod? get shippingMethod;
  @override
  List<FTPInterfaceDTO> get ftpInterfaces;
  @override
  AppClient? get contractSovereignty;
  @override
  LightUser? get assignedUser;
  @override
  int? get id;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerSalesOrderHints _$CustomerSalesOrderHintsFromJson(
    Map<String, dynamic> json) {
  return _CustomerSalesOrderHints.fromJson(json);
}

/// @nodoc
mixin _$CustomerSalesOrderHints {
  String get firstReference => throw _privateConstructorUsedError;
  String get secondReference => throw _privateConstructorUsedError;
  String get orderNumber => throw _privateConstructorUsedError;
  String get keywords => throw _privateConstructorUsedError;

  /// Serializes this CustomerSalesOrderHints to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerSalesOrderHints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerSalesOrderHintsCopyWith<CustomerSalesOrderHints> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerSalesOrderHintsCopyWith<$Res> {
  factory $CustomerSalesOrderHintsCopyWith(CustomerSalesOrderHints value,
          $Res Function(CustomerSalesOrderHints) then) =
      _$CustomerSalesOrderHintsCopyWithImpl<$Res, CustomerSalesOrderHints>;
  @useResult
  $Res call(
      {String firstReference,
      String secondReference,
      String orderNumber,
      String keywords});
}

/// @nodoc
class _$CustomerSalesOrderHintsCopyWithImpl<$Res,
        $Val extends CustomerSalesOrderHints>
    implements $CustomerSalesOrderHintsCopyWith<$Res> {
  _$CustomerSalesOrderHintsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerSalesOrderHints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstReference = null,
    Object? secondReference = null,
    Object? orderNumber = null,
    Object? keywords = null,
  }) {
    return _then(_value.copyWith(
      firstReference: null == firstReference
          ? _value.firstReference
          : firstReference // ignore: cast_nullable_to_non_nullable
              as String,
      secondReference: null == secondReference
          ? _value.secondReference
          : secondReference // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerSalesOrderHintsImplCopyWith<$Res>
    implements $CustomerSalesOrderHintsCopyWith<$Res> {
  factory _$$CustomerSalesOrderHintsImplCopyWith(
          _$CustomerSalesOrderHintsImpl value,
          $Res Function(_$CustomerSalesOrderHintsImpl) then) =
      __$$CustomerSalesOrderHintsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstReference,
      String secondReference,
      String orderNumber,
      String keywords});
}

/// @nodoc
class __$$CustomerSalesOrderHintsImplCopyWithImpl<$Res>
    extends _$CustomerSalesOrderHintsCopyWithImpl<$Res,
        _$CustomerSalesOrderHintsImpl>
    implements _$$CustomerSalesOrderHintsImplCopyWith<$Res> {
  __$$CustomerSalesOrderHintsImplCopyWithImpl(
      _$CustomerSalesOrderHintsImpl _value,
      $Res Function(_$CustomerSalesOrderHintsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomerSalesOrderHints
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstReference = null,
    Object? secondReference = null,
    Object? orderNumber = null,
    Object? keywords = null,
  }) {
    return _then(_$CustomerSalesOrderHintsImpl(
      firstReference: null == firstReference
          ? _value.firstReference
          : firstReference // ignore: cast_nullable_to_non_nullable
              as String,
      secondReference: null == secondReference
          ? _value.secondReference
          : secondReference // ignore: cast_nullable_to_non_nullable
              as String,
      orderNumber: null == orderNumber
          ? _value.orderNumber
          : orderNumber // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerSalesOrderHintsImpl extends _CustomerSalesOrderHints {
  const _$CustomerSalesOrderHintsImpl(
      {required this.firstReference,
      required this.secondReference,
      required this.orderNumber,
      required this.keywords})
      : super._();

  factory _$CustomerSalesOrderHintsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerSalesOrderHintsImplFromJson(json);

  @override
  final String firstReference;
  @override
  final String secondReference;
  @override
  final String orderNumber;
  @override
  final String keywords;

  @override
  String toString() {
    return 'CustomerSalesOrderHints(firstReference: $firstReference, secondReference: $secondReference, orderNumber: $orderNumber, keywords: $keywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerSalesOrderHintsImpl &&
            (identical(other.firstReference, firstReference) ||
                other.firstReference == firstReference) &&
            (identical(other.secondReference, secondReference) ||
                other.secondReference == secondReference) &&
            (identical(other.orderNumber, orderNumber) ||
                other.orderNumber == orderNumber) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstReference, secondReference, orderNumber, keywords);

  /// Create a copy of CustomerSalesOrderHints
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerSalesOrderHintsImplCopyWith<_$CustomerSalesOrderHintsImpl>
      get copyWith => __$$CustomerSalesOrderHintsImplCopyWithImpl<
          _$CustomerSalesOrderHintsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerSalesOrderHintsImplToJson(
      this,
    );
  }
}

abstract class _CustomerSalesOrderHints extends CustomerSalesOrderHints {
  const factory _CustomerSalesOrderHints(
      {required final String firstReference,
      required final String secondReference,
      required final String orderNumber,
      required final String keywords}) = _$CustomerSalesOrderHintsImpl;
  const _CustomerSalesOrderHints._() : super._();

  factory _CustomerSalesOrderHints.fromJson(Map<String, dynamic> json) =
      _$CustomerSalesOrderHintsImpl.fromJson;

  @override
  String get firstReference;
  @override
  String get secondReference;
  @override
  String get orderNumber;
  @override
  String get keywords;

  /// Create a copy of CustomerSalesOrderHints
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerSalesOrderHintsImplCopyWith<_$CustomerSalesOrderHintsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
