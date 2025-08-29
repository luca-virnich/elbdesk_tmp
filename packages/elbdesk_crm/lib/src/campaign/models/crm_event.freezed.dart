// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crm_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CrmEvent _$CrmEventFromJson(Map<String, dynamic> json) {
  return _CrmEvent.fromJson(json);
}

/// @nodoc
mixin _$CrmEvent {
  DataMeta get meta => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  List<Contact> get contacts => throw _privateConstructorUsedError;
  CrmEventStatus get status => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  DateTime? get executionDate => throw _privateConstructorUsedError;

  /// Serializes this CrmEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CrmEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrmEventCopyWith<CrmEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrmEventCopyWith<$Res> {
  factory $CrmEventCopyWith(CrmEvent value, $Res Function(CrmEvent) then) =
      _$CrmEventCopyWithImpl<$Res, CrmEvent>;
  @useResult
  $Res call(
      {DataMeta meta,
      String name,
      String description,
      DateTime startDate,
      List<Contact> contacts,
      CrmEventStatus status,
      DateTime? endDate,
      DateTime? executionDate});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$CrmEventCopyWithImpl<$Res, $Val extends CrmEvent>
    implements $CrmEventCopyWith<$Res> {
  _$CrmEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrmEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? name = null,
    Object? description = null,
    Object? startDate = null,
    Object? contacts = null,
    Object? status = null,
    Object? endDate = freezed,
    Object? executionDate = freezed,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contacts: null == contacts
          ? _value.contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CrmEventStatus,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      executionDate: freezed == executionDate
          ? _value.executionDate
          : executionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of CrmEvent
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
abstract class _$$CrmEventImplCopyWith<$Res>
    implements $CrmEventCopyWith<$Res> {
  factory _$$CrmEventImplCopyWith(
          _$CrmEventImpl value, $Res Function(_$CrmEventImpl) then) =
      __$$CrmEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataMeta meta,
      String name,
      String description,
      DateTime startDate,
      List<Contact> contacts,
      CrmEventStatus status,
      DateTime? endDate,
      DateTime? executionDate});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$CrmEventImplCopyWithImpl<$Res>
    extends _$CrmEventCopyWithImpl<$Res, _$CrmEventImpl>
    implements _$$CrmEventImplCopyWith<$Res> {
  __$$CrmEventImplCopyWithImpl(
      _$CrmEventImpl _value, $Res Function(_$CrmEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CrmEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? name = null,
    Object? description = null,
    Object? startDate = null,
    Object? contacts = null,
    Object? status = null,
    Object? endDate = freezed,
    Object? executionDate = freezed,
  }) {
    return _then(_$CrmEventImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      contacts: null == contacts
          ? _value._contacts
          : contacts // ignore: cast_nullable_to_non_nullable
              as List<Contact>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CrmEventStatus,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      executionDate: freezed == executionDate
          ? _value.executionDate
          : executionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CrmEventImpl extends _CrmEvent {
  const _$CrmEventImpl(
      {required this.meta,
      required this.name,
      required this.description,
      required this.startDate,
      required final List<Contact> contacts,
      required this.status,
      this.endDate,
      this.executionDate})
      : _contacts = contacts,
        super._();

  factory _$CrmEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CrmEventImplFromJson(json);

  @override
  final DataMeta meta;
  @override
  final String name;
  @override
  final String description;
  @override
  final DateTime startDate;
  final List<Contact> _contacts;
  @override
  List<Contact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  final CrmEventStatus status;
  @override
  final DateTime? endDate;
  @override
  final DateTime? executionDate;

  @override
  String toString() {
    return 'CrmEvent(meta: $meta, name: $name, description: $description, startDate: $startDate, contacts: $contacts, status: $status, endDate: $endDate, executionDate: $executionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrmEventImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.executionDate, executionDate) ||
                other.executionDate == executionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      meta,
      name,
      description,
      startDate,
      const DeepCollectionEquality().hash(_contacts),
      status,
      endDate,
      executionDate);

  /// Create a copy of CrmEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrmEventImplCopyWith<_$CrmEventImpl> get copyWith =>
      __$$CrmEventImplCopyWithImpl<_$CrmEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CrmEventImplToJson(
      this,
    );
  }
}

abstract class _CrmEvent extends CrmEvent {
  const factory _CrmEvent(
      {required final DataMeta meta,
      required final String name,
      required final String description,
      required final DateTime startDate,
      required final List<Contact> contacts,
      required final CrmEventStatus status,
      final DateTime? endDate,
      final DateTime? executionDate}) = _$CrmEventImpl;
  const _CrmEvent._() : super._();

  factory _CrmEvent.fromJson(Map<String, dynamic> json) =
      _$CrmEventImpl.fromJson;

  @override
  DataMeta get meta;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime get startDate;
  @override
  List<Contact> get contacts;
  @override
  CrmEventStatus get status;
  @override
  DateTime? get endDate;
  @override
  DateTime? get executionDate;

  /// Create a copy of CrmEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrmEventImplCopyWith<_$CrmEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
