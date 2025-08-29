// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EntityAssignment {
  int get entityId => throw _privateConstructorUsedError;
  String get additionalData => throw _privateConstructorUsedError;
  TableType get entity => throw _privateConstructorUsedError;
  DateTime? get deadline => throw _privateConstructorUsedError;

  /// Create a copy of EntityAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EntityAssignmentCopyWith<EntityAssignment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityAssignmentCopyWith<$Res> {
  factory $EntityAssignmentCopyWith(
          EntityAssignment value, $Res Function(EntityAssignment) then) =
      _$EntityAssignmentCopyWithImpl<$Res, EntityAssignment>;
  @useResult
  $Res call(
      {int entityId,
      String additionalData,
      TableType entity,
      DateTime? deadline});
}

/// @nodoc
class _$EntityAssignmentCopyWithImpl<$Res, $Val extends EntityAssignment>
    implements $EntityAssignmentCopyWith<$Res> {
  _$EntityAssignmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EntityAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = null,
    Object? additionalData = null,
    Object? entity = null,
    Object? deadline = freezed,
  }) {
    return _then(_value.copyWith(
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      additionalData: null == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String,
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as TableType,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EntityAssignmentImplCopyWith<$Res>
    implements $EntityAssignmentCopyWith<$Res> {
  factory _$$EntityAssignmentImplCopyWith(_$EntityAssignmentImpl value,
          $Res Function(_$EntityAssignmentImpl) then) =
      __$$EntityAssignmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int entityId,
      String additionalData,
      TableType entity,
      DateTime? deadline});
}

/// @nodoc
class __$$EntityAssignmentImplCopyWithImpl<$Res>
    extends _$EntityAssignmentCopyWithImpl<$Res, _$EntityAssignmentImpl>
    implements _$$EntityAssignmentImplCopyWith<$Res> {
  __$$EntityAssignmentImplCopyWithImpl(_$EntityAssignmentImpl _value,
      $Res Function(_$EntityAssignmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of EntityAssignment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entityId = null,
    Object? additionalData = null,
    Object? entity = null,
    Object? deadline = freezed,
  }) {
    return _then(_$EntityAssignmentImpl(
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as int,
      additionalData: null == additionalData
          ? _value.additionalData
          : additionalData // ignore: cast_nullable_to_non_nullable
              as String,
      entity: null == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as TableType,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$EntityAssignmentImpl extends _EntityAssignment {
  const _$EntityAssignmentImpl(
      {required this.entityId,
      required this.additionalData,
      required this.entity,
      this.deadline})
      : super._();

  @override
  final int entityId;
  @override
  final String additionalData;
  @override
  final TableType entity;
  @override
  final DateTime? deadline;

  @override
  String toString() {
    return 'EntityAssignment(entityId: $entityId, additionalData: $additionalData, entity: $entity, deadline: $deadline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntityAssignmentImpl &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.additionalData, additionalData) ||
                other.additionalData == additionalData) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, entityId, additionalData, entity, deadline);

  /// Create a copy of EntityAssignment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EntityAssignmentImplCopyWith<_$EntityAssignmentImpl> get copyWith =>
      __$$EntityAssignmentImplCopyWithImpl<_$EntityAssignmentImpl>(
          this, _$identity);
}

abstract class _EntityAssignment extends EntityAssignment {
  const factory _EntityAssignment(
      {required final int entityId,
      required final String additionalData,
      required final TableType entity,
      final DateTime? deadline}) = _$EntityAssignmentImpl;
  const _EntityAssignment._() : super._();

  @override
  int get entityId;
  @override
  String get additionalData;
  @override
  TableType get entity;
  @override
  DateTime? get deadline;

  /// Create a copy of EntityAssignment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EntityAssignmentImplCopyWith<_$EntityAssignmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
