// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soi_prepare_artwork.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SoiPrepareArtwork _$SoiPrepareArtworkFromJson(Map<String, dynamic> json) {
  return _SoiPrepareArtwork.fromJson(json);
}

/// @nodoc
mixin _$SoiPrepareArtwork {
  Artwork get artwork => throw _privateConstructorUsedError;
  SalesOrder? get salesOrder => throw _privateConstructorUsedError;
  int get salesOrderItemId => throw _privateConstructorUsedError;
  int get artworkMasterId => throw _privateConstructorUsedError;
  SalesOrderItem? get salesOrderItem => throw _privateConstructorUsedError;
  EyeCStatus? get eyeCStatus => throw _privateConstructorUsedError;
  SoiPrepareArtworkDifficultyLevel? get difficultyLevel =>
      throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this SoiPrepareArtwork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SoiPrepareArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SoiPrepareArtworkCopyWith<SoiPrepareArtwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoiPrepareArtworkCopyWith<$Res> {
  factory $SoiPrepareArtworkCopyWith(
          SoiPrepareArtwork value, $Res Function(SoiPrepareArtwork) then) =
      _$SoiPrepareArtworkCopyWithImpl<$Res, SoiPrepareArtwork>;
  @useResult
  $Res call(
      {Artwork artwork,
      SalesOrder? salesOrder,
      int salesOrderItemId,
      int artworkMasterId,
      SalesOrderItem? salesOrderItem,
      EyeCStatus? eyeCStatus,
      SoiPrepareArtworkDifficultyLevel? difficultyLevel,
      DataMeta meta});

  $ArtworkCopyWith<$Res> get artwork;
  $SalesOrderCopyWith<$Res>? get salesOrder;
  $SalesOrderItemCopyWith<$Res>? get salesOrderItem;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$SoiPrepareArtworkCopyWithImpl<$Res, $Val extends SoiPrepareArtwork>
    implements $SoiPrepareArtworkCopyWith<$Res> {
  _$SoiPrepareArtworkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SoiPrepareArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artwork = null,
    Object? salesOrder = freezed,
    Object? salesOrderItemId = null,
    Object? artworkMasterId = null,
    Object? salesOrderItem = freezed,
    Object? eyeCStatus = freezed,
    Object? difficultyLevel = freezed,
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
      eyeCStatus: freezed == eyeCStatus
          ? _value.eyeCStatus
          : eyeCStatus // ignore: cast_nullable_to_non_nullable
              as EyeCStatus?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as SoiPrepareArtworkDifficultyLevel?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of SoiPrepareArtwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ArtworkCopyWith<$Res> get artwork {
    return $ArtworkCopyWith<$Res>(_value.artwork, (value) {
      return _then(_value.copyWith(artwork: value) as $Val);
    });
  }

  /// Create a copy of SoiPrepareArtwork
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

  /// Create a copy of SoiPrepareArtwork
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

  /// Create a copy of SoiPrepareArtwork
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
abstract class _$$SoiPrepareArtworkImplCopyWith<$Res>
    implements $SoiPrepareArtworkCopyWith<$Res> {
  factory _$$SoiPrepareArtworkImplCopyWith(_$SoiPrepareArtworkImpl value,
          $Res Function(_$SoiPrepareArtworkImpl) then) =
      __$$SoiPrepareArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Artwork artwork,
      SalesOrder? salesOrder,
      int salesOrderItemId,
      int artworkMasterId,
      SalesOrderItem? salesOrderItem,
      EyeCStatus? eyeCStatus,
      SoiPrepareArtworkDifficultyLevel? difficultyLevel,
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
class __$$SoiPrepareArtworkImplCopyWithImpl<$Res>
    extends _$SoiPrepareArtworkCopyWithImpl<$Res, _$SoiPrepareArtworkImpl>
    implements _$$SoiPrepareArtworkImplCopyWith<$Res> {
  __$$SoiPrepareArtworkImplCopyWithImpl(_$SoiPrepareArtworkImpl _value,
      $Res Function(_$SoiPrepareArtworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of SoiPrepareArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? artwork = null,
    Object? salesOrder = freezed,
    Object? salesOrderItemId = null,
    Object? artworkMasterId = null,
    Object? salesOrderItem = freezed,
    Object? eyeCStatus = freezed,
    Object? difficultyLevel = freezed,
    Object? meta = null,
  }) {
    return _then(_$SoiPrepareArtworkImpl(
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
      eyeCStatus: freezed == eyeCStatus
          ? _value.eyeCStatus
          : eyeCStatus // ignore: cast_nullable_to_non_nullable
              as EyeCStatus?,
      difficultyLevel: freezed == difficultyLevel
          ? _value.difficultyLevel
          : difficultyLevel // ignore: cast_nullable_to_non_nullable
              as SoiPrepareArtworkDifficultyLevel?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SoiPrepareArtworkImpl extends _SoiPrepareArtwork {
  const _$SoiPrepareArtworkImpl(
      {required this.artwork,
      required this.salesOrder,
      required this.salesOrderItemId,
      required this.artworkMasterId,
      required this.salesOrderItem,
      required this.eyeCStatus,
      required this.difficultyLevel,
      required this.meta})
      : super._();

  factory _$SoiPrepareArtworkImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoiPrepareArtworkImplFromJson(json);

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
  final EyeCStatus? eyeCStatus;
  @override
  final SoiPrepareArtworkDifficultyLevel? difficultyLevel;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'SoiPrepareArtwork(artwork: $artwork, salesOrder: $salesOrder, salesOrderItemId: $salesOrderItemId, artworkMasterId: $artworkMasterId, salesOrderItem: $salesOrderItem, eyeCStatus: $eyeCStatus, difficultyLevel: $difficultyLevel, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoiPrepareArtworkImpl &&
            (identical(other.artwork, artwork) || other.artwork == artwork) &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.salesOrderItemId, salesOrderItemId) ||
                other.salesOrderItemId == salesOrderItemId) &&
            (identical(other.artworkMasterId, artworkMasterId) ||
                other.artworkMasterId == artworkMasterId) &&
            (identical(other.salesOrderItem, salesOrderItem) ||
                other.salesOrderItem == salesOrderItem) &&
            (identical(other.eyeCStatus, eyeCStatus) ||
                other.eyeCStatus == eyeCStatus) &&
            (identical(other.difficultyLevel, difficultyLevel) ||
                other.difficultyLevel == difficultyLevel) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      artwork,
      salesOrder,
      salesOrderItemId,
      artworkMasterId,
      salesOrderItem,
      eyeCStatus,
      difficultyLevel,
      meta);

  /// Create a copy of SoiPrepareArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SoiPrepareArtworkImplCopyWith<_$SoiPrepareArtworkImpl> get copyWith =>
      __$$SoiPrepareArtworkImplCopyWithImpl<_$SoiPrepareArtworkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SoiPrepareArtworkImplToJson(
      this,
    );
  }
}

abstract class _SoiPrepareArtwork extends SoiPrepareArtwork {
  const factory _SoiPrepareArtwork(
      {required final Artwork artwork,
      required final SalesOrder? salesOrder,
      required final int salesOrderItemId,
      required final int artworkMasterId,
      required final SalesOrderItem? salesOrderItem,
      required final EyeCStatus? eyeCStatus,
      required final SoiPrepareArtworkDifficultyLevel? difficultyLevel,
      required final DataMeta meta}) = _$SoiPrepareArtworkImpl;
  const _SoiPrepareArtwork._() : super._();

  factory _SoiPrepareArtwork.fromJson(Map<String, dynamic> json) =
      _$SoiPrepareArtworkImpl.fromJson;

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
  EyeCStatus? get eyeCStatus;
  @override
  SoiPrepareArtworkDifficultyLevel? get difficultyLevel;
  @override
  DataMeta get meta;

  /// Create a copy of SoiPrepareArtwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SoiPrepareArtworkImplCopyWith<_$SoiPrepareArtworkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
