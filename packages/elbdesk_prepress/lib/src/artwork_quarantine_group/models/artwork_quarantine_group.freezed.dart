// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_quarantine_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkQuarantineGroup _$ArtworkQuarantineGroupFromJson(
    Map<String, dynamic> json) {
  return _ArtworkQuarantineGroup.fromJson(json);
}

/// @nodoc
mixin _$ArtworkQuarantineGroup {
  int? get customerId => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  ArtworkType? get artworkType => throw _privateConstructorUsedError;
  ArtworkQuarantineGroupStatus get status => throw _privateConstructorUsedError;
  ArtworkQuarantineGroupType? get type => throw _privateConstructorUsedError;
  ProductType? get productType => throw _privateConstructorUsedError;
  ArtworkPrintProcessType? get printProcessType =>
      throw _privateConstructorUsedError;
  int? get selectedProductSeriesId => throw _privateConstructorUsedError;
  double? get width => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  double? get cornerRadius => throw _privateConstructorUsedError;
  String? get outputPath => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<SystemFile>? get attachments => throw _privateConstructorUsedError;
  List<ArtworkQuarantine>? get artworkQuarantines =>
      throw _privateConstructorUsedError;
  LightUser? get assignedUser => throw _privateConstructorUsedError;
  DateTime? get sendToAeAt => throw _privateConstructorUsedError;
  int? get sendToAeBy => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this ArtworkQuarantineGroup to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkQuarantineGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkQuarantineGroupCopyWith<ArtworkQuarantineGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkQuarantineGroupCopyWith<$Res> {
  factory $ArtworkQuarantineGroupCopyWith(ArtworkQuarantineGroup value,
          $Res Function(ArtworkQuarantineGroup) then) =
      _$ArtworkQuarantineGroupCopyWithImpl<$Res, ArtworkQuarantineGroup>;
  @useResult
  $Res call(
      {int? customerId,
      Customer? customer,
      ArtworkType? artworkType,
      ArtworkQuarantineGroupStatus status,
      ArtworkQuarantineGroupType? type,
      ProductType? productType,
      ArtworkPrintProcessType? printProcessType,
      int? selectedProductSeriesId,
      double? width,
      double? height,
      double? cornerRadius,
      String? outputPath,
      String description,
      List<SystemFile>? attachments,
      List<ArtworkQuarantine>? artworkQuarantines,
      LightUser? assignedUser,
      DateTime? sendToAeAt,
      int? sendToAeBy,
      DataMeta meta});

  $CustomerCopyWith<$Res>? get customer;
  $LightUserCopyWith<$Res>? get assignedUser;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ArtworkQuarantineGroupCopyWithImpl<$Res,
        $Val extends ArtworkQuarantineGroup>
    implements $ArtworkQuarantineGroupCopyWith<$Res> {
  _$ArtworkQuarantineGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkQuarantineGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customer = freezed,
    Object? artworkType = freezed,
    Object? status = null,
    Object? type = freezed,
    Object? productType = freezed,
    Object? printProcessType = freezed,
    Object? selectedProductSeriesId = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? cornerRadius = freezed,
    Object? outputPath = freezed,
    Object? description = null,
    Object? attachments = freezed,
    Object? artworkQuarantines = freezed,
    Object? assignedUser = freezed,
    Object? sendToAeAt = freezed,
    Object? sendToAeBy = freezed,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      artworkType: freezed == artworkType
          ? _value.artworkType
          : artworkType // ignore: cast_nullable_to_non_nullable
              as ArtworkType?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroupStatus,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroupType?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
      selectedProductSeriesId: freezed == selectedProductSeriesId
          ? _value.selectedProductSeriesId
          : selectedProductSeriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      cornerRadius: freezed == cornerRadius
          ? _value.cornerRadius
          : cornerRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      outputPath: freezed == outputPath
          ? _value.outputPath
          : outputPath // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<SystemFile>?,
      artworkQuarantines: freezed == artworkQuarantines
          ? _value.artworkQuarantines
          : artworkQuarantines // ignore: cast_nullable_to_non_nullable
              as List<ArtworkQuarantine>?,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      sendToAeAt: freezed == sendToAeAt
          ? _value.sendToAeAt
          : sendToAeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sendToAeBy: freezed == sendToAeBy
          ? _value.sendToAeBy
          : sendToAeBy // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of ArtworkQuarantineGroup
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

  /// Create a copy of ArtworkQuarantineGroup
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

  /// Create a copy of ArtworkQuarantineGroup
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
abstract class _$$ArtworkQuarantineGroupImplCopyWith<$Res>
    implements $ArtworkQuarantineGroupCopyWith<$Res> {
  factory _$$ArtworkQuarantineGroupImplCopyWith(
          _$ArtworkQuarantineGroupImpl value,
          $Res Function(_$ArtworkQuarantineGroupImpl) then) =
      __$$ArtworkQuarantineGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? customerId,
      Customer? customer,
      ArtworkType? artworkType,
      ArtworkQuarantineGroupStatus status,
      ArtworkQuarantineGroupType? type,
      ProductType? productType,
      ArtworkPrintProcessType? printProcessType,
      int? selectedProductSeriesId,
      double? width,
      double? height,
      double? cornerRadius,
      String? outputPath,
      String description,
      List<SystemFile>? attachments,
      List<ArtworkQuarantine>? artworkQuarantines,
      LightUser? assignedUser,
      DateTime? sendToAeAt,
      int? sendToAeBy,
      DataMeta meta});

  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $LightUserCopyWith<$Res>? get assignedUser;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ArtworkQuarantineGroupImplCopyWithImpl<$Res>
    extends _$ArtworkQuarantineGroupCopyWithImpl<$Res,
        _$ArtworkQuarantineGroupImpl>
    implements _$$ArtworkQuarantineGroupImplCopyWith<$Res> {
  __$$ArtworkQuarantineGroupImplCopyWithImpl(
      _$ArtworkQuarantineGroupImpl _value,
      $Res Function(_$ArtworkQuarantineGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkQuarantineGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = freezed,
    Object? customer = freezed,
    Object? artworkType = freezed,
    Object? status = null,
    Object? type = freezed,
    Object? productType = freezed,
    Object? printProcessType = freezed,
    Object? selectedProductSeriesId = freezed,
    Object? width = freezed,
    Object? height = freezed,
    Object? cornerRadius = freezed,
    Object? outputPath = freezed,
    Object? description = null,
    Object? attachments = freezed,
    Object? artworkQuarantines = freezed,
    Object? assignedUser = freezed,
    Object? sendToAeAt = freezed,
    Object? sendToAeBy = freezed,
    Object? meta = null,
  }) {
    return _then(_$ArtworkQuarantineGroupImpl(
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      artworkType: freezed == artworkType
          ? _value.artworkType
          : artworkType // ignore: cast_nullable_to_non_nullable
              as ArtworkType?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroupStatus,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ArtworkQuarantineGroupType?,
      productType: freezed == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as ProductType?,
      printProcessType: freezed == printProcessType
          ? _value.printProcessType
          : printProcessType // ignore: cast_nullable_to_non_nullable
              as ArtworkPrintProcessType?,
      selectedProductSeriesId: freezed == selectedProductSeriesId
          ? _value.selectedProductSeriesId
          : selectedProductSeriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      cornerRadius: freezed == cornerRadius
          ? _value.cornerRadius
          : cornerRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      outputPath: freezed == outputPath
          ? _value.outputPath
          : outputPath // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<SystemFile>?,
      artworkQuarantines: freezed == artworkQuarantines
          ? _value._artworkQuarantines
          : artworkQuarantines // ignore: cast_nullable_to_non_nullable
              as List<ArtworkQuarantine>?,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      sendToAeAt: freezed == sendToAeAt
          ? _value.sendToAeAt
          : sendToAeAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      sendToAeBy: freezed == sendToAeBy
          ? _value.sendToAeBy
          : sendToAeBy // ignore: cast_nullable_to_non_nullable
              as int?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkQuarantineGroupImpl extends _ArtworkQuarantineGroup {
  const _$ArtworkQuarantineGroupImpl(
      {required this.customerId,
      required this.customer,
      required this.artworkType,
      required this.status,
      required this.type,
      required this.productType,
      required this.printProcessType,
      required this.selectedProductSeriesId,
      required this.width,
      required this.height,
      required this.cornerRadius,
      required this.outputPath,
      required this.description,
      required final List<SystemFile>? attachments,
      required final List<ArtworkQuarantine>? artworkQuarantines,
      required this.assignedUser,
      required this.sendToAeAt,
      required this.sendToAeBy,
      required this.meta})
      : _attachments = attachments,
        _artworkQuarantines = artworkQuarantines,
        super._();

  factory _$ArtworkQuarantineGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkQuarantineGroupImplFromJson(json);

  @override
  final int? customerId;
  @override
  final Customer? customer;
  @override
  final ArtworkType? artworkType;
  @override
  final ArtworkQuarantineGroupStatus status;
  @override
  final ArtworkQuarantineGroupType? type;
  @override
  final ProductType? productType;
  @override
  final ArtworkPrintProcessType? printProcessType;
  @override
  final int? selectedProductSeriesId;
  @override
  final double? width;
  @override
  final double? height;
  @override
  final double? cornerRadius;
  @override
  final String? outputPath;
  @override
  final String description;
  final List<SystemFile>? _attachments;
  @override
  List<SystemFile>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ArtworkQuarantine>? _artworkQuarantines;
  @override
  List<ArtworkQuarantine>? get artworkQuarantines {
    final value = _artworkQuarantines;
    if (value == null) return null;
    if (_artworkQuarantines is EqualUnmodifiableListView)
      return _artworkQuarantines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final LightUser? assignedUser;
  @override
  final DateTime? sendToAeAt;
  @override
  final int? sendToAeBy;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'ArtworkQuarantineGroup(customerId: $customerId, customer: $customer, artworkType: $artworkType, status: $status, type: $type, productType: $productType, printProcessType: $printProcessType, selectedProductSeriesId: $selectedProductSeriesId, width: $width, height: $height, cornerRadius: $cornerRadius, outputPath: $outputPath, description: $description, attachments: $attachments, artworkQuarantines: $artworkQuarantines, assignedUser: $assignedUser, sendToAeAt: $sendToAeAt, sendToAeBy: $sendToAeBy, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkQuarantineGroupImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.artworkType, artworkType) ||
                other.artworkType == artworkType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(other.printProcessType, printProcessType) ||
                other.printProcessType == printProcessType) &&
            (identical(
                    other.selectedProductSeriesId, selectedProductSeriesId) ||
                other.selectedProductSeriesId == selectedProductSeriesId) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.cornerRadius, cornerRadius) ||
                other.cornerRadius == cornerRadius) &&
            (identical(other.outputPath, outputPath) ||
                other.outputPath == outputPath) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            const DeepCollectionEquality()
                .equals(other._artworkQuarantines, _artworkQuarantines) &&
            (identical(other.assignedUser, assignedUser) ||
                other.assignedUser == assignedUser) &&
            (identical(other.sendToAeAt, sendToAeAt) ||
                other.sendToAeAt == sendToAeAt) &&
            (identical(other.sendToAeBy, sendToAeBy) ||
                other.sendToAeBy == sendToAeBy) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        customerId,
        customer,
        artworkType,
        status,
        type,
        productType,
        printProcessType,
        selectedProductSeriesId,
        width,
        height,
        cornerRadius,
        outputPath,
        description,
        const DeepCollectionEquality().hash(_attachments),
        const DeepCollectionEquality().hash(_artworkQuarantines),
        assignedUser,
        sendToAeAt,
        sendToAeBy,
        meta
      ]);

  /// Create a copy of ArtworkQuarantineGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkQuarantineGroupImplCopyWith<_$ArtworkQuarantineGroupImpl>
      get copyWith => __$$ArtworkQuarantineGroupImplCopyWithImpl<
          _$ArtworkQuarantineGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkQuarantineGroupImplToJson(
      this,
    );
  }
}

abstract class _ArtworkQuarantineGroup extends ArtworkQuarantineGroup {
  const factory _ArtworkQuarantineGroup(
      {required final int? customerId,
      required final Customer? customer,
      required final ArtworkType? artworkType,
      required final ArtworkQuarantineGroupStatus status,
      required final ArtworkQuarantineGroupType? type,
      required final ProductType? productType,
      required final ArtworkPrintProcessType? printProcessType,
      required final int? selectedProductSeriesId,
      required final double? width,
      required final double? height,
      required final double? cornerRadius,
      required final String? outputPath,
      required final String description,
      required final List<SystemFile>? attachments,
      required final List<ArtworkQuarantine>? artworkQuarantines,
      required final LightUser? assignedUser,
      required final DateTime? sendToAeAt,
      required final int? sendToAeBy,
      required final DataMeta meta}) = _$ArtworkQuarantineGroupImpl;
  const _ArtworkQuarantineGroup._() : super._();

  factory _ArtworkQuarantineGroup.fromJson(Map<String, dynamic> json) =
      _$ArtworkQuarantineGroupImpl.fromJson;

  @override
  int? get customerId;
  @override
  Customer? get customer;
  @override
  ArtworkType? get artworkType;
  @override
  ArtworkQuarantineGroupStatus get status;
  @override
  ArtworkQuarantineGroupType? get type;
  @override
  ProductType? get productType;
  @override
  ArtworkPrintProcessType? get printProcessType;
  @override
  int? get selectedProductSeriesId;
  @override
  double? get width;
  @override
  double? get height;
  @override
  double? get cornerRadius;
  @override
  String? get outputPath;
  @override
  String get description;
  @override
  List<SystemFile>? get attachments;
  @override
  List<ArtworkQuarantine>? get artworkQuarantines;
  @override
  LightUser? get assignedUser;
  @override
  DateTime? get sendToAeAt;
  @override
  int? get sendToAeBy;
  @override
  DataMeta get meta;

  /// Create a copy of ArtworkQuarantineGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkQuarantineGroupImplCopyWith<_$ArtworkQuarantineGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}
