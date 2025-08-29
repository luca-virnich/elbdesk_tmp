// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drucklayout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Drucklayout _$DrucklayoutFromJson(Map<String, dynamic> json) {
  return _Drucklayout.fromJson(json);
}

/// @nodoc
mixin _$Drucklayout {
  String get title => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  DrucklayoutPreSelection get drucklayoutPreSelection =>
      throw _privateConstructorUsedError;
  DrucklayoutSelection get drucklayoutSelection =>
      throw _privateConstructorUsedError;
  int? get preSelectionId => throw _privateConstructorUsedError;
  int? get selectionId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get customerId => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this Drucklayout to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DrucklayoutCopyWith<Drucklayout> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrucklayoutCopyWith<$Res> {
  factory $DrucklayoutCopyWith(
          Drucklayout value, $Res Function(Drucklayout) then) =
      _$DrucklayoutCopyWithImpl<$Res, Drucklayout>;
  @useResult
  $Res call(
      {String title,
      DataMeta meta,
      DrucklayoutPreSelection drucklayoutPreSelection,
      DrucklayoutSelection drucklayoutSelection,
      int? preSelectionId,
      int? selectionId,
      String? description,
      int? customerId,
      Customer? customer,
      int? id});

  $DataMetaCopyWith<$Res> get meta;
  $DrucklayoutPreSelectionCopyWith<$Res> get drucklayoutPreSelection;
  $DrucklayoutSelectionCopyWith<$Res> get drucklayoutSelection;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$DrucklayoutCopyWithImpl<$Res, $Val extends Drucklayout>
    implements $DrucklayoutCopyWith<$Res> {
  _$DrucklayoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? meta = null,
    Object? drucklayoutPreSelection = null,
    Object? drucklayoutSelection = null,
    Object? preSelectionId = freezed,
    Object? selectionId = freezed,
    Object? description = freezed,
    Object? customerId = freezed,
    Object? customer = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      drucklayoutPreSelection: null == drucklayoutPreSelection
          ? _value.drucklayoutPreSelection
          : drucklayoutPreSelection // ignore: cast_nullable_to_non_nullable
              as DrucklayoutPreSelection,
      drucklayoutSelection: null == drucklayoutSelection
          ? _value.drucklayoutSelection
          : drucklayoutSelection // ignore: cast_nullable_to_non_nullable
              as DrucklayoutSelection,
      preSelectionId: freezed == preSelectionId
          ? _value.preSelectionId
          : preSelectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionId: freezed == selectionId
          ? _value.selectionId
          : selectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrucklayoutPreSelectionCopyWith<$Res> get drucklayoutPreSelection {
    return $DrucklayoutPreSelectionCopyWith<$Res>(
        _value.drucklayoutPreSelection, (value) {
      return _then(_value.copyWith(drucklayoutPreSelection: value) as $Val);
    });
  }

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DrucklayoutSelectionCopyWith<$Res> get drucklayoutSelection {
    return $DrucklayoutSelectionCopyWith<$Res>(_value.drucklayoutSelection,
        (value) {
      return _then(_value.copyWith(drucklayoutSelection: value) as $Val);
    });
  }

  /// Create a copy of Drucklayout
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
}

/// @nodoc
abstract class _$$DrucklayoutImplCopyWith<$Res>
    implements $DrucklayoutCopyWith<$Res> {
  factory _$$DrucklayoutImplCopyWith(
          _$DrucklayoutImpl value, $Res Function(_$DrucklayoutImpl) then) =
      __$$DrucklayoutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      DataMeta meta,
      DrucklayoutPreSelection drucklayoutPreSelection,
      DrucklayoutSelection drucklayoutSelection,
      int? preSelectionId,
      int? selectionId,
      String? description,
      int? customerId,
      Customer? customer,
      int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
  @override
  $DrucklayoutPreSelectionCopyWith<$Res> get drucklayoutPreSelection;
  @override
  $DrucklayoutSelectionCopyWith<$Res> get drucklayoutSelection;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$DrucklayoutImplCopyWithImpl<$Res>
    extends _$DrucklayoutCopyWithImpl<$Res, _$DrucklayoutImpl>
    implements _$$DrucklayoutImplCopyWith<$Res> {
  __$$DrucklayoutImplCopyWithImpl(
      _$DrucklayoutImpl _value, $Res Function(_$DrucklayoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? meta = null,
    Object? drucklayoutPreSelection = null,
    Object? drucklayoutSelection = null,
    Object? preSelectionId = freezed,
    Object? selectionId = freezed,
    Object? description = freezed,
    Object? customerId = freezed,
    Object? customer = freezed,
    Object? id = freezed,
  }) {
    return _then(_$DrucklayoutImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      drucklayoutPreSelection: null == drucklayoutPreSelection
          ? _value.drucklayoutPreSelection
          : drucklayoutPreSelection // ignore: cast_nullable_to_non_nullable
              as DrucklayoutPreSelection,
      drucklayoutSelection: null == drucklayoutSelection
          ? _value.drucklayoutSelection
          : drucklayoutSelection // ignore: cast_nullable_to_non_nullable
              as DrucklayoutSelection,
      preSelectionId: freezed == preSelectionId
          ? _value.preSelectionId
          : preSelectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      selectionId: freezed == selectionId
          ? _value.selectionId
          : selectionId // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as int?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DrucklayoutImpl extends _Drucklayout {
  const _$DrucklayoutImpl(
      {required this.title,
      required this.meta,
      required this.drucklayoutPreSelection,
      required this.drucklayoutSelection,
      required this.preSelectionId,
      required this.selectionId,
      this.description,
      this.customerId,
      this.customer,
      this.id})
      : super._();

  factory _$DrucklayoutImpl.fromJson(Map<String, dynamic> json) =>
      _$$DrucklayoutImplFromJson(json);

  @override
  final String title;
  @override
  final DataMeta meta;
  @override
  final DrucklayoutPreSelection drucklayoutPreSelection;
  @override
  final DrucklayoutSelection drucklayoutSelection;
  @override
  final int? preSelectionId;
  @override
  final int? selectionId;
  @override
  final String? description;
  @override
  final int? customerId;
  @override
  final Customer? customer;
  @override
  final int? id;

  @override
  String toString() {
    return 'Drucklayout(title: $title, meta: $meta, drucklayoutPreSelection: $drucklayoutPreSelection, drucklayoutSelection: $drucklayoutSelection, preSelectionId: $preSelectionId, selectionId: $selectionId, description: $description, customerId: $customerId, customer: $customer, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrucklayoutImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(
                    other.drucklayoutPreSelection, drucklayoutPreSelection) ||
                other.drucklayoutPreSelection == drucklayoutPreSelection) &&
            (identical(other.drucklayoutSelection, drucklayoutSelection) ||
                other.drucklayoutSelection == drucklayoutSelection) &&
            (identical(other.preSelectionId, preSelectionId) ||
                other.preSelectionId == preSelectionId) &&
            (identical(other.selectionId, selectionId) ||
                other.selectionId == selectionId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      meta,
      drucklayoutPreSelection,
      drucklayoutSelection,
      preSelectionId,
      selectionId,
      description,
      customerId,
      customer,
      id);

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DrucklayoutImplCopyWith<_$DrucklayoutImpl> get copyWith =>
      __$$DrucklayoutImplCopyWithImpl<_$DrucklayoutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DrucklayoutImplToJson(
      this,
    );
  }
}

abstract class _Drucklayout extends Drucklayout {
  const factory _Drucklayout(
      {required final String title,
      required final DataMeta meta,
      required final DrucklayoutPreSelection drucklayoutPreSelection,
      required final DrucklayoutSelection drucklayoutSelection,
      required final int? preSelectionId,
      required final int? selectionId,
      final String? description,
      final int? customerId,
      final Customer? customer,
      final int? id}) = _$DrucklayoutImpl;
  const _Drucklayout._() : super._();

  factory _Drucklayout.fromJson(Map<String, dynamic> json) =
      _$DrucklayoutImpl.fromJson;

  @override
  String get title;
  @override
  DataMeta get meta;
  @override
  DrucklayoutPreSelection get drucklayoutPreSelection;
  @override
  DrucklayoutSelection get drucklayoutSelection;
  @override
  int? get preSelectionId;
  @override
  int? get selectionId;
  @override
  String? get description;
  @override
  int? get customerId;
  @override
  Customer? get customer;
  @override
  int? get id;

  /// Create a copy of Drucklayout
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DrucklayoutImplCopyWith<_$DrucklayoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
