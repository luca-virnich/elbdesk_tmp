// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get description => throw _privateConstructorUsedError;
  String get keywords => throw _privateConstructorUsedError;
  int get serienId => throw _privateConstructorUsedError;
  int get serienIndex => throw _privateConstructorUsedError;
  int? get productMasterId => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  List<Artwork> get artworks => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  SalesOrder? get salesOrder => throw _privateConstructorUsedError;
  ProductType? get productType => throw _privateConstructorUsedError;
  ArtworkPrintProcessType? get printProcessType =>
      throw _privateConstructorUsedError;
  String get customerReference => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String description,
      String keywords,
      int serienId,
      int serienIndex,
      int? productMasterId,
      DataMeta meta,
      List<Artwork> artworks,
      Customer? customer,
      SalesOrder? salesOrder,
      ProductType? productType,
      ArtworkPrintProcessType? printProcessType,
      String customerReference});

  $DataMetaCopyWith<$Res> get meta;
  $CustomerCopyWith<$Res>? get customer;
  $SalesOrderCopyWith<$Res>? get salesOrder;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? keywords = null,
    Object? serienId = null,
    Object? serienIndex = null,
    Object? productMasterId = freezed,
    Object? meta = null,
    Object? artworks = null,
    Object? customer = freezed,
    Object? salesOrder = freezed,
    Object? productType = freezed,
    Object? printProcessType = freezed,
    Object? customerReference = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      serienId: null == serienId
          ? _value.serienId
          : serienId // ignore: cast_nullable_to_non_nullable
              as int,
      serienIndex: null == serienIndex
          ? _value.serienIndex
          : serienIndex // ignore: cast_nullable_to_non_nullable
              as int,
      productMasterId: freezed == productMasterId
          ? _value.productMasterId
          : productMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      artworks: null == artworks
          ? _value.artworks
          : artworks // ignore: cast_nullable_to_non_nullable
              as List<Artwork>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
      customerReference: null == customerReference
          ? _value.customerReference
          : customerReference // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of Product
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

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res>? get salesOrder {
    if (_value.salesOrder == null) {
      return null;
    }

    return $SalesOrderCopyWith<$Res>(_value.salesOrder!, (value) {
      return _then(_value.copyWith(salesOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String description,
      String keywords,
      int serienId,
      int serienIndex,
      int? productMasterId,
      DataMeta meta,
      List<Artwork> artworks,
      Customer? customer,
      SalesOrder? salesOrder,
      ProductType? productType,
      ArtworkPrintProcessType? printProcessType,
      String customerReference});

  @override
  $DataMetaCopyWith<$Res> get meta;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $SalesOrderCopyWith<$Res>? get salesOrder;
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? keywords = null,
    Object? serienId = null,
    Object? serienIndex = null,
    Object? productMasterId = freezed,
    Object? meta = null,
    Object? artworks = null,
    Object? customer = freezed,
    Object? salesOrder = freezed,
    Object? productType = freezed,
    Object? printProcessType = freezed,
    Object? customerReference = null,
  }) {
    return _then(_$ProductImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      serienId: null == serienId
          ? _value.serienId
          : serienId // ignore: cast_nullable_to_non_nullable
              as int,
      serienIndex: null == serienIndex
          ? _value.serienIndex
          : serienIndex // ignore: cast_nullable_to_non_nullable
              as int,
      productMasterId: freezed == productMasterId
          ? _value.productMasterId
          : productMasterId // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      artworks: null == artworks
          ? _value._artworks
          : artworks // ignore: cast_nullable_to_non_nullable
              as List<Artwork>,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
      customerReference: null == customerReference
          ? _value.customerReference
          : customerReference // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl extends _Product {
  const _$ProductImpl(
      {required this.description,
      required this.keywords,
      required this.serienId,
      required this.serienIndex,
      required this.productMasterId,
      required this.meta,
      required final List<Artwork> artworks,
      required this.customer,
      required this.salesOrder,
      required this.productType,
      required this.printProcessType,
      required this.customerReference})
      : _artworks = artworks,
        super._();

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String description;
  @override
  final String keywords;
  @override
  final int serienId;
  @override
  final int serienIndex;
  @override
  final int? productMasterId;
  @override
  final DataMeta meta;
  final List<Artwork> _artworks;
  @override
  List<Artwork> get artworks {
    if (_artworks is EqualUnmodifiableListView) return _artworks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_artworks);
  }

  @override
  final Customer? customer;
  @override
  final SalesOrder? salesOrder;
  @override
  final ProductType? productType;
  @override
  final ArtworkPrintProcessType? printProcessType;
  @override
  final String customerReference;

  @override
  String toString() {
    return 'Product(description: $description, keywords: $keywords, serienId: $serienId, serienIndex: $serienIndex, productMasterId: $productMasterId, meta: $meta, artworks: $artworks, customer: $customer, salesOrder: $salesOrder, productType: $productType, printProcessType: $printProcessType, customerReference: $customerReference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.serienId, serienId) ||
                other.serienId == serienId) &&
            (identical(other.serienIndex, serienIndex) ||
                other.serienIndex == serienIndex) &&
            (identical(other.productMasterId, productMasterId) ||
                other.productMasterId == productMasterId) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality().equals(other._artworks, _artworks) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.printProcessType, printProcessType) ||
                other.printProcessType == printProcessType) &&
            (identical(other.customerReference, customerReference) ||
                other.customerReference == customerReference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      keywords,
      serienId,
      serienIndex,
      productMasterId,
      meta,
      const DeepCollectionEquality().hash(_artworks),
      customer,
      salesOrder,
      productType,
      printProcessType,
      customerReference);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product extends Product {
  const factory _Product(
      {required final String description,
      required final String keywords,
      required final int serienId,
      required final int serienIndex,
      required final int? productMasterId,
      required final DataMeta meta,
      required final List<Artwork> artworks,
      required final Customer? customer,
      required final SalesOrder? salesOrder,
      required final ProductType? productType,
      required final ArtworkPrintProcessType? printProcessType,
      required final String customerReference}) = _$ProductImpl;
  const _Product._() : super._();

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get description;
  @override
  String get keywords;
  @override
  int get serienId;
  @override
  int get serienIndex;
  @override
  int? get productMasterId;
  @override
  DataMeta get meta;
  @override
  List<Artwork> get artworks;
  @override
  Customer? get customer;
  @override
  SalesOrder? get salesOrder;
  @override
  ProductType? get productType;
  @override
  ArtworkPrintProcessType? get printProcessType;
  @override
  String get customerReference;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
