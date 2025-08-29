// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soi_einzelformaufbau.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SoiEinzelformaufbau _$SoiEinzelformaufbauFromJson(Map<String, dynamic> json) {
  return _SoiEinzelformaufbau.fromJson(json);
}

/// @nodoc
mixin _$SoiEinzelformaufbau {
  Artwork get artwork => throw _privateConstructorUsedError;
  SalesOrder? get salesOrder => throw _privateConstructorUsedError;
  int get salesOrderItemId => throw _privateConstructorUsedError;
  int get artworkMasterId => throw _privateConstructorUsedError;
  SalesOrderItem? get salesOrderItem => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this SoiEinzelformaufbau to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SoiEinzelformaufbau
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SoiEinzelformaufbauCopyWith<SoiEinzelformaufbau> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoiEinzelformaufbauCopyWith<$Res> {
  factory $SoiEinzelformaufbauCopyWith(
          SoiEinzelformaufbau value, $Res Function(SoiEinzelformaufbau) then) =
      _$SoiEinzelformaufbauCopyWithImpl<$Res, SoiEinzelformaufbau>;
  @useResult
  $Res call(
      {Artwork artwork,
      SalesOrder? salesOrder,
      int salesOrderItemId,
      int artworkMasterId,
      SalesOrderItem? salesOrderItem,
      int version,
      DataMeta meta});

  $ArtworkCopyWith<$Res> get artwork;
  $SalesOrderCopyWith<$Res>? get salesOrder;
  $SalesOrderItemCopyWith<$Res>? get salesOrderItem;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$SoiEinzelformaufbauCopyWithImpl<$Res, $Val extends SoiEinzelformaufbau>
    implements $SoiEinzelformaufbauCopyWith<$Res> {
  _$SoiEinzelformaufbauCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SoiEinzelformaufbau
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artwork = null,
    Object? salesOrder = freezed,
    Object? salesOrderItemId = null,
    Object? artworkMasterId = null,
    Object? salesOrderItem = freezed,
    Object? version = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      artwork: null == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      salesOrderItemId: null == salesOrderItemId
          ? _value.salesOrderItemId
          : salesOrderItemId // ignore: cast_nullable_to_non_nullable
              as int,
      artworkMasterId: null == artworkMasterId
          ? _value.artworkMasterId
          : artworkMasterId // ignore: cast_nullable_to_non_nullable
              as int,
      salesOrderItem: freezed == salesOrderItem
          ? _value.salesOrderItem
          : salesOrderItem // ignore: cast_nullable_to_non_nullable
              as SalesOrderItem?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of SoiEinzelformaufbau
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkCopyWith<$Res> get artwork {
    return $ArtworkCopyWith<$Res>(_value.artwork, (value) {
      return _then(_value.copyWith(artwork: value) as $Val);
    });
  }

  /// Create a copy of SoiEinzelformaufbau
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

  /// Create a copy of SoiEinzelformaufbau
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderItemCopyWith<$Res>? get salesOrderItem {
    if (_value.salesOrderItem == null) {
      return null;
    }

    return $SalesOrderItemCopyWith<$Res>(_value.salesOrderItem!, (value) {
      return _then(_value.copyWith(salesOrderItem: value) as $Val);
    });
  }

  /// Create a copy of SoiEinzelformaufbau
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
abstract class _$$SoiEinzelformaufbauImplCopyWith<$Res>
    implements $SoiEinzelformaufbauCopyWith<$Res> {
  factory _$$SoiEinzelformaufbauImplCopyWith(_$SoiEinzelformaufbauImpl value,
          $Res Function(_$SoiEinzelformaufbauImpl) then) =
      __$$SoiEinzelformaufbauImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Artwork artwork,
      SalesOrder? salesOrder,
      int salesOrderItemId,
      int artworkMasterId,
      SalesOrderItem? salesOrderItem,
      int version,
      DataMeta meta});

  @override
  $ArtworkCopyWith<$Res> get artwork;
  @override
  $SalesOrderCopyWith<$Res>? get salesOrder;
  @override
  $SalesOrderItemCopyWith<$Res>? get salesOrderItem;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$SoiEinzelformaufbauImplCopyWithImpl<$Res>
    extends _$SoiEinzelformaufbauCopyWithImpl<$Res, _$SoiEinzelformaufbauImpl>
    implements _$$SoiEinzelformaufbauImplCopyWith<$Res> {
  __$$SoiEinzelformaufbauImplCopyWithImpl(_$SoiEinzelformaufbauImpl _value,
      $Res Function(_$SoiEinzelformaufbauImpl) _then)
      : super(_value, _then);

  /// Create a copy of SoiEinzelformaufbau
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artwork = null,
    Object? salesOrder = freezed,
    Object? salesOrderItemId = null,
    Object? artworkMasterId = null,
    Object? salesOrderItem = freezed,
    Object? version = null,
    Object? meta = null,
  }) {
    return _then(_$SoiEinzelformaufbauImpl(
      artwork: null == artwork
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      salesOrderItemId: null == salesOrderItemId
          ? _value.salesOrderItemId
          : salesOrderItemId // ignore: cast_nullable_to_non_nullable
              as int,
      artworkMasterId: null == artworkMasterId
          ? _value.artworkMasterId
          : artworkMasterId // ignore: cast_nullable_to_non_nullable
              as int,
      salesOrderItem: freezed == salesOrderItem
          ? _value.salesOrderItem
          : salesOrderItem // ignore: cast_nullable_to_non_nullable
              as SalesOrderItem?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoiEinzelformaufbauImpl extends _SoiEinzelformaufbau {
  const _$SoiEinzelformaufbauImpl(
      {required this.artwork,
      required this.salesOrder,
      required this.salesOrderItemId,
      required this.artworkMasterId,
      required this.salesOrderItem,
      required this.version,
      required this.meta})
      : super._();

  factory _$SoiEinzelformaufbauImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoiEinzelformaufbauImplFromJson(json);

  @override
  final Artwork artwork;
  @override
  final SalesOrder? salesOrder;
  @override
  final int salesOrderItemId;
  @override
  final int artworkMasterId;
  @override
  final SalesOrderItem? salesOrderItem;
  @override
  final int version;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'SoiEinzelformaufbau(artwork: $artwork, salesOrder: $salesOrder, salesOrderItemId: $salesOrderItemId, artworkMasterId: $artworkMasterId, salesOrderItem: $salesOrderItem, version: $version, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoiEinzelformaufbauImpl &&
            (identical(other.artwork, artwork) || other.artwork == artwork) &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.salesOrderItemId, salesOrderItemId) ||
                other.salesOrderItemId == salesOrderItemId) &&
            (identical(other.artworkMasterId, artworkMasterId) ||
                other.artworkMasterId == artworkMasterId) &&
            (identical(other.salesOrderItem, salesOrderItem) ||
                other.salesOrderItem == salesOrderItem) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, artwork, salesOrder,
      salesOrderItemId, artworkMasterId, salesOrderItem, version, meta);

  /// Create a copy of SoiEinzelformaufbau
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SoiEinzelformaufbauImplCopyWith<_$SoiEinzelformaufbauImpl> get copyWith =>
      __$$SoiEinzelformaufbauImplCopyWithImpl<_$SoiEinzelformaufbauImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoiEinzelformaufbauImplToJson(
      this,
    );
  }
}

abstract class _SoiEinzelformaufbau extends SoiEinzelformaufbau {
  const factory _SoiEinzelformaufbau(
      {required final Artwork artwork,
      required final SalesOrder? salesOrder,
      required final int salesOrderItemId,
      required final int artworkMasterId,
      required final SalesOrderItem? salesOrderItem,
      required final int version,
      required final DataMeta meta}) = _$SoiEinzelformaufbauImpl;
  const _SoiEinzelformaufbau._() : super._();

  factory _SoiEinzelformaufbau.fromJson(Map<String, dynamic> json) =
      _$SoiEinzelformaufbauImpl.fromJson;

  @override
  Artwork get artwork;
  @override
  SalesOrder? get salesOrder;
  @override
  int get salesOrderItemId;
  @override
  int get artworkMasterId;
  @override
  SalesOrderItem? get salesOrderItem;
  @override
  int get version;
  @override
  DataMeta get meta;

  /// Create a copy of SoiEinzelformaufbau
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SoiEinzelformaufbauImplCopyWith<_$SoiEinzelformaufbauImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
