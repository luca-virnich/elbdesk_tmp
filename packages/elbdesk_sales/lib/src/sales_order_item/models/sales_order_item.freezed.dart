// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrderItem _$SalesOrderItemFromJson(Map<String, dynamic> json) {
  return _SalesOrderItem.fromJson(json);
}

/// @nodoc
mixin _$SalesOrderItem {
  int get id => throw _privateConstructorUsedError;
  SalesOrderItemType get type => throw _privateConstructorUsedError;
  SalesOrderItemStatus get status => throw _privateConstructorUsedError;
  int get salesOrderId => throw _privateConstructorUsedError;
  SalesOrder? get salesOrder => throw _privateConstructorUsedError;
  int get soiTypePrimaryKey => throw _privateConstructorUsedError;
  LightUser? get assignedUser => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get billableTime => throw _privateConstructorUsedError;
  int get customerId => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;

  /// Serializes this SalesOrderItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderItemCopyWith<SalesOrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderItemCopyWith<$Res> {
  factory $SalesOrderItemCopyWith(
          SalesOrderItem value, $Res Function(SalesOrderItem) then) =
      _$SalesOrderItemCopyWithImpl<$Res, SalesOrderItem>;
  @useResult
  $Res call(
      {int id,
      SalesOrderItemType type,
      SalesOrderItemStatus status,
      int salesOrderId,
      SalesOrder? salesOrder,
      int soiTypePrimaryKey,
      LightUser? assignedUser,
      String description,
      int billableTime,
      int customerId,
      DateTime? deadline});

  $SalesOrderCopyWith<$Res>? get salesOrder;
  $LightUserCopyWith<$Res>? get assignedUser;
}

/// @nodoc
class _$SalesOrderItemCopyWithImpl<$Res, $Val extends SalesOrderItem>
    implements $SalesOrderItemCopyWith<$Res> {
  _$SalesOrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? salesOrderId = null,
    Object? salesOrder = freezed,
    Object? soiTypePrimaryKey = null,
    Object? assignedUser = freezed,
    Object? description = null,
    Object? billableTime = null,
    Object? customerId = null,
    Object? deadline = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SalesOrderItemType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalesOrderItemStatus,
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      soiTypePrimaryKey: null == soiTypePrimaryKey
          ? _value.soiTypePrimaryKey
          : soiTypePrimaryKey // ignore: cast_nullable_to_non_nullable
              as int,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      billableTime: null == billableTime
          ? _value.billableTime
          : billableTime // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of SalesOrderItem
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

  /// Create a copy of SalesOrderItem
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
abstract class _$$SalesOrderItemImplCopyWith<$Res>
    implements $SalesOrderItemCopyWith<$Res> {
  factory _$$SalesOrderItemImplCopyWith(_$SalesOrderItemImpl value,
          $Res Function(_$SalesOrderItemImpl) then) =
      __$$SalesOrderItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      SalesOrderItemType type,
      SalesOrderItemStatus status,
      int salesOrderId,
      SalesOrder? salesOrder,
      int soiTypePrimaryKey,
      LightUser? assignedUser,
      String description,
      int billableTime,
      int customerId,
      DateTime? deadline});

  @override
  $SalesOrderCopyWith<$Res>? get salesOrder;
  @override
  $LightUserCopyWith<$Res>? get assignedUser;
}

/// @nodoc
class __$$SalesOrderItemImplCopyWithImpl<$Res>
    extends _$SalesOrderItemCopyWithImpl<$Res, _$SalesOrderItemImpl>
    implements _$$SalesOrderItemImplCopyWith<$Res> {
  __$$SalesOrderItemImplCopyWithImpl(
      _$SalesOrderItemImpl _value, $Res Function(_$SalesOrderItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? status = null,
    Object? salesOrderId = null,
    Object? salesOrder = freezed,
    Object? soiTypePrimaryKey = null,
    Object? assignedUser = freezed,
    Object? description = null,
    Object? billableTime = null,
    Object? customerId = null,
    Object? deadline = freezed,
  }) {
    return _then(_$SalesOrderItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SalesOrderItemType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalesOrderItemStatus,
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as int,
      salesOrder: freezed == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      soiTypePrimaryKey: null == soiTypePrimaryKey
          ? _value.soiTypePrimaryKey
          : soiTypePrimaryKey // ignore: cast_nullable_to_non_nullable
              as int,
      assignedUser: freezed == assignedUser
          ? _value.assignedUser
          : assignedUser // ignore: cast_nullable_to_non_nullable
              as LightUser?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      billableTime: null == billableTime
          ? _value.billableTime
          : billableTime // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderItemImpl extends _SalesOrderItem {
  const _$SalesOrderItemImpl(
      {required this.id,
      required this.type,
      required this.status,
      required this.salesOrderId,
      required this.salesOrder,
      required this.soiTypePrimaryKey,
      required this.assignedUser,
      required this.description,
      required this.billableTime,
      required this.customerId,
      required this.deadline})
      : super._();

  factory _$SalesOrderItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrderItemImplFromJson(json);

  @override
  final int id;
  @override
  final SalesOrderItemType type;
  @override
  final SalesOrderItemStatus status;
  @override
  final int salesOrderId;
  @override
  final SalesOrder? salesOrder;
  @override
  final int soiTypePrimaryKey;
  @override
  final LightUser? assignedUser;
  @override
  final String description;
  @override
  final int billableTime;
  @override
  final int customerId;
  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'SalesOrderItem(id: $id, type: $type, status: $status, salesOrderId: $salesOrderId, salesOrder: $salesOrder, soiTypePrimaryKey: $soiTypePrimaryKey, assignedUser: $assignedUser, description: $description, billableTime: $billableTime, customerId: $customerId, deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.soiTypePrimaryKey, soiTypePrimaryKey) ||
                other.soiTypePrimaryKey == soiTypePrimaryKey) &&
            (identical(other.assignedUser, assignedUser) ||
                other.assignedUser == assignedUser) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.billableTime, billableTime) ||
                other.billableTime == billableTime) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      status,
      salesOrderId,
      salesOrder,
      soiTypePrimaryKey,
      assignedUser,
      description,
      billableTime,
      customerId,
      deadline);

  /// Create a copy of SalesOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderItemImplCopyWith<_$SalesOrderItemImpl> get copyWith =>
      __$$SalesOrderItemImplCopyWithImpl<_$SalesOrderItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderItemImplToJson(
      this,
    );
  }
}

abstract class _SalesOrderItem extends SalesOrderItem {
  const factory _SalesOrderItem(
      {required final int id,
      required final SalesOrderItemType type,
      required final SalesOrderItemStatus status,
      required final int salesOrderId,
      required final SalesOrder? salesOrder,
      required final int soiTypePrimaryKey,
      required final LightUser? assignedUser,
      required final String description,
      required final int billableTime,
      required final int customerId,
      required final DateTime? deadline}) = _$SalesOrderItemImpl;
  const _SalesOrderItem._() : super._();

  factory _SalesOrderItem.fromJson(Map<String, dynamic> json) =
      _$SalesOrderItemImpl.fromJson;

  @override
  int get id;
  @override
  SalesOrderItemType get type;
  @override
  SalesOrderItemStatus get status;
  @override
  int get salesOrderId;
  @override
  SalesOrder? get salesOrder;
  @override
  int get soiTypePrimaryKey;
  @override
  LightUser? get assignedUser;
  @override
  String get description;
  @override
  int get billableTime;
  @override
  int get customerId;
  @override
  DateTime? get deadline;

  /// Create a copy of SalesOrderItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderItemImplCopyWith<_$SalesOrderItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
