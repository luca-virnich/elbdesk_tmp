// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soi_request_artwork_approval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SoiRequestArtworkApproval _$SoiRequestArtworkApprovalFromJson(
    Map<String, dynamic> json) {
  return _SoiRequestArtworkApproval.fromJson(json);
}

/// @nodoc
mixin _$SoiRequestArtworkApproval {
  Artwork get artwork => throw _privateConstructorUsedError;
  SalesOrder? get salesOrder => throw _privateConstructorUsedError;
  int get salesOrderItemId => throw _privateConstructorUsedError;
  int get artworkMasterId => throw _privateConstructorUsedError;
  SalesOrderItem? get salesOrderItem => throw _privateConstructorUsedError;
  SoiRequestArtworkApprovalType? get type => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this SoiRequestArtworkApproval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SoiRequestArtworkApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SoiRequestArtworkApprovalCopyWith<SoiRequestArtworkApproval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoiRequestArtworkApprovalCopyWith<$Res> {
  factory $SoiRequestArtworkApprovalCopyWith(SoiRequestArtworkApproval value,
          $Res Function(SoiRequestArtworkApproval) then) =
      _$SoiRequestArtworkApprovalCopyWithImpl<$Res, SoiRequestArtworkApproval>;
  @useResult
  $Res call(
      {Artwork artwork,
      SalesOrder? salesOrder,
      int salesOrderItemId,
      int artworkMasterId,
      SalesOrderItem? salesOrderItem,
      SoiRequestArtworkApprovalType? type,
      DataMeta meta});

  $ArtworkCopyWith<$Res> get artwork;
  $SalesOrderCopyWith<$Res>? get salesOrder;
  $SalesOrderItemCopyWith<$Res>? get salesOrderItem;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$SoiRequestArtworkApprovalCopyWithImpl<$Res,
        $Val extends SoiRequestArtworkApproval>
    implements $SoiRequestArtworkApprovalCopyWith<$Res> {
  _$SoiRequestArtworkApprovalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SoiRequestArtworkApproval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artwork = null,
    Object? salesOrder = freezed,
    Object? salesOrderItemId = null,
    Object? artworkMasterId = null,
    Object? salesOrderItem = freezed,
    Object? type = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SoiRequestArtworkApprovalType?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of SoiRequestArtworkApproval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkCopyWith<$Res> get artwork {
    return $ArtworkCopyWith<$Res>(_value.artwork, (value) {
      return _then(_value.copyWith(artwork: value) as $Val);
    });
  }

  /// Create a copy of SoiRequestArtworkApproval
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

  /// Create a copy of SoiRequestArtworkApproval
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

  /// Create a copy of SoiRequestArtworkApproval
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
abstract class _$$SoiRequestArtworkApprovalImplCopyWith<$Res>
    implements $SoiRequestArtworkApprovalCopyWith<$Res> {
  factory _$$SoiRequestArtworkApprovalImplCopyWith(
          _$SoiRequestArtworkApprovalImpl value,
          $Res Function(_$SoiRequestArtworkApprovalImpl) then) =
      __$$SoiRequestArtworkApprovalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Artwork artwork,
      SalesOrder? salesOrder,
      int salesOrderItemId,
      int artworkMasterId,
      SalesOrderItem? salesOrderItem,
      SoiRequestArtworkApprovalType? type,
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
class __$$SoiRequestArtworkApprovalImplCopyWithImpl<$Res>
    extends _$SoiRequestArtworkApprovalCopyWithImpl<$Res,
        _$SoiRequestArtworkApprovalImpl>
    implements _$$SoiRequestArtworkApprovalImplCopyWith<$Res> {
  __$$SoiRequestArtworkApprovalImplCopyWithImpl(
      _$SoiRequestArtworkApprovalImpl _value,
      $Res Function(_$SoiRequestArtworkApprovalImpl) _then)
      : super(_value, _then);

  /// Create a copy of SoiRequestArtworkApproval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artwork = null,
    Object? salesOrder = freezed,
    Object? salesOrderItemId = null,
    Object? artworkMasterId = null,
    Object? salesOrderItem = freezed,
    Object? type = freezed,
    Object? meta = null,
  }) {
    return _then(_$SoiRequestArtworkApprovalImpl(
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SoiRequestArtworkApprovalType?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoiRequestArtworkApprovalImpl extends _SoiRequestArtworkApproval {
  const _$SoiRequestArtworkApprovalImpl(
      {required this.artwork,
      required this.salesOrder,
      required this.salesOrderItemId,
      required this.artworkMasterId,
      required this.salesOrderItem,
      required this.type,
      required this.meta})
      : super._();

  factory _$SoiRequestArtworkApprovalImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoiRequestArtworkApprovalImplFromJson(json);

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
  final SoiRequestArtworkApprovalType? type;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'SoiRequestArtworkApproval(artwork: $artwork, salesOrder: $salesOrder, salesOrderItemId: $salesOrderItemId, artworkMasterId: $artworkMasterId, salesOrderItem: $salesOrderItem, type: $type, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoiRequestArtworkApprovalImpl &&
            (identical(other.artwork, artwork) || other.artwork == artwork) &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.salesOrderItemId, salesOrderItemId) ||
                other.salesOrderItemId == salesOrderItemId) &&
            (identical(other.artworkMasterId, artworkMasterId) ||
                other.artworkMasterId == artworkMasterId) &&
            (identical(other.salesOrderItem, salesOrderItem) ||
                other.salesOrderItem == salesOrderItem) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, artwork, salesOrder,
      salesOrderItemId, artworkMasterId, salesOrderItem, type, meta);

  /// Create a copy of SoiRequestArtworkApproval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SoiRequestArtworkApprovalImplCopyWith<_$SoiRequestArtworkApprovalImpl>
      get copyWith => __$$SoiRequestArtworkApprovalImplCopyWithImpl<
          _$SoiRequestArtworkApprovalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoiRequestArtworkApprovalImplToJson(
      this,
    );
  }
}

abstract class _SoiRequestArtworkApproval extends SoiRequestArtworkApproval {
  const factory _SoiRequestArtworkApproval(
      {required final Artwork artwork,
      required final SalesOrder? salesOrder,
      required final int salesOrderItemId,
      required final int artworkMasterId,
      required final SalesOrderItem? salesOrderItem,
      required final SoiRequestArtworkApprovalType? type,
      required final DataMeta meta}) = _$SoiRequestArtworkApprovalImpl;
  const _SoiRequestArtworkApproval._() : super._();

  factory _SoiRequestArtworkApproval.fromJson(Map<String, dynamic> json) =
      _$SoiRequestArtworkApprovalImpl.fromJson;

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
  SoiRequestArtworkApprovalType? get type;
  @override
  DataMeta get meta;

  /// Create a copy of SoiRequestArtworkApproval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SoiRequestArtworkApprovalImplCopyWith<_$SoiRequestArtworkApprovalImpl>
      get copyWith => throw _privateConstructorUsedError;
}
