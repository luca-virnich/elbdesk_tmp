// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bearer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Bearer {
  BearerGeneral get general => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Create a copy of Bearer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BearerCopyWith<Bearer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BearerCopyWith<$Res> {
  factory $BearerCopyWith(Bearer value, $Res Function(Bearer) then) =
      _$BearerCopyWithImpl<$Res, Bearer>;
  @useResult
  $Res call({BearerGeneral general, DataMeta meta});

  $BearerGeneralCopyWith<$Res> get general;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$BearerCopyWithImpl<$Res, $Val extends Bearer>
    implements $BearerCopyWith<$Res> {
  _$BearerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bearer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as BearerGeneral,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of Bearer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BearerGeneralCopyWith<$Res> get general {
    return $BearerGeneralCopyWith<$Res>(_value.general, (value) {
      return _then(_value.copyWith(general: value) as $Val);
    });
  }

  /// Create a copy of Bearer
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
abstract class _$$BearerImplCopyWith<$Res> implements $BearerCopyWith<$Res> {
  factory _$$BearerImplCopyWith(
          _$BearerImpl value, $Res Function(_$BearerImpl) then) =
      __$$BearerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BearerGeneral general, DataMeta meta});

  @override
  $BearerGeneralCopyWith<$Res> get general;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$BearerImplCopyWithImpl<$Res>
    extends _$BearerCopyWithImpl<$Res, _$BearerImpl>
    implements _$$BearerImplCopyWith<$Res> {
  __$$BearerImplCopyWithImpl(
      _$BearerImpl _value, $Res Function(_$BearerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Bearer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
    Object? meta = null,
  }) {
    return _then(_$BearerImpl(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as BearerGeneral,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc

class _$BearerImpl extends _Bearer {
  const _$BearerImpl({required this.general, required this.meta}) : super._();

  @override
  final BearerGeneral general;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'Bearer(general: $general, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BearerImpl &&
            (identical(other.general, general) || other.general == general) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @override
  int get hashCode => Object.hash(runtimeType, general, meta);

  /// Create a copy of Bearer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BearerImplCopyWith<_$BearerImpl> get copyWith =>
      __$$BearerImplCopyWithImpl<_$BearerImpl>(this, _$identity);
}

abstract class _Bearer extends Bearer {
  const factory _Bearer(
      {required final BearerGeneral general,
      required final DataMeta meta}) = _$BearerImpl;
  const _Bearer._() : super._();

  @override
  BearerGeneral get general;
  @override
  DataMeta get meta;

  /// Create a copy of Bearer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BearerImplCopyWith<_$BearerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BearerGeneral {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get longText => throw _privateConstructorUsedError;
  String get costCenterCode => throw _privateConstructorUsedError;
  BearerType get type => throw _privateConstructorUsedError;
  BearerType1? get type1 => throw _privateConstructorUsedError;
  BearerType2? get type2 => throw _privateConstructorUsedError;

  /// Create a copy of BearerGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BearerGeneralCopyWith<BearerGeneral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BearerGeneralCopyWith<$Res> {
  factory $BearerGeneralCopyWith(
          BearerGeneral value, $Res Function(BearerGeneral) then) =
      _$BearerGeneralCopyWithImpl<$Res, BearerGeneral>;
  @useResult
  $Res call(
      {String name,
      String description,
      String longText,
      String costCenterCode,
      BearerType type,
      BearerType1? type1,
      BearerType2? type2});

  $BearerType1CopyWith<$Res>? get type1;
  $BearerType2CopyWith<$Res>? get type2;
}

/// @nodoc
class _$BearerGeneralCopyWithImpl<$Res, $Val extends BearerGeneral>
    implements $BearerGeneralCopyWith<$Res> {
  _$BearerGeneralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BearerGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? longText = null,
    Object? costCenterCode = null,
    Object? type = null,
    Object? type1 = freezed,
    Object? type2 = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      longText: null == longText
          ? _value.longText
          : longText // ignore: cast_nullable_to_non_nullable
              as String,
      costCenterCode: null == costCenterCode
          ? _value.costCenterCode
          : costCenterCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BearerType,
      type1: freezed == type1
          ? _value.type1
          : type1 // ignore: cast_nullable_to_non_nullable
              as BearerType1?,
      type2: freezed == type2
          ? _value.type2
          : type2 // ignore: cast_nullable_to_non_nullable
              as BearerType2?,
    ) as $Val);
  }

  /// Create a copy of BearerGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BearerType1CopyWith<$Res>? get type1 {
    if (_value.type1 == null) {
      return null;
    }

    return $BearerType1CopyWith<$Res>(_value.type1!, (value) {
      return _then(_value.copyWith(type1: value) as $Val);
    });
  }

  /// Create a copy of BearerGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BearerType2CopyWith<$Res>? get type2 {
    if (_value.type2 == null) {
      return null;
    }

    return $BearerType2CopyWith<$Res>(_value.type2!, (value) {
      return _then(_value.copyWith(type2: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BearerGeneralImplCopyWith<$Res>
    implements $BearerGeneralCopyWith<$Res> {
  factory _$$BearerGeneralImplCopyWith(
          _$BearerGeneralImpl value, $Res Function(_$BearerGeneralImpl) then) =
      __$$BearerGeneralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String longText,
      String costCenterCode,
      BearerType type,
      BearerType1? type1,
      BearerType2? type2});

  @override
  $BearerType1CopyWith<$Res>? get type1;
  @override
  $BearerType2CopyWith<$Res>? get type2;
}

/// @nodoc
class __$$BearerGeneralImplCopyWithImpl<$Res>
    extends _$BearerGeneralCopyWithImpl<$Res, _$BearerGeneralImpl>
    implements _$$BearerGeneralImplCopyWith<$Res> {
  __$$BearerGeneralImplCopyWithImpl(
      _$BearerGeneralImpl _value, $Res Function(_$BearerGeneralImpl) _then)
      : super(_value, _then);

  /// Create a copy of BearerGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? longText = null,
    Object? costCenterCode = null,
    Object? type = null,
    Object? type1 = freezed,
    Object? type2 = freezed,
  }) {
    return _then(_$BearerGeneralImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      longText: null == longText
          ? _value.longText
          : longText // ignore: cast_nullable_to_non_nullable
              as String,
      costCenterCode: null == costCenterCode
          ? _value.costCenterCode
          : costCenterCode // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BearerType,
      type1: freezed == type1
          ? _value.type1
          : type1 // ignore: cast_nullable_to_non_nullable
              as BearerType1?,
      type2: freezed == type2
          ? _value.type2
          : type2 // ignore: cast_nullable_to_non_nullable
              as BearerType2?,
    ));
  }
}

/// @nodoc

class _$BearerGeneralImpl extends _BearerGeneral {
  const _$BearerGeneralImpl(
      {required this.name,
      required this.description,
      required this.longText,
      required this.costCenterCode,
      required this.type,
      required this.type1,
      required this.type2})
      : super._();

  @override
  final String name;
  @override
  final String description;
  @override
  final String longText;
  @override
  final String costCenterCode;
  @override
  final BearerType type;
  @override
  final BearerType1? type1;
  @override
  final BearerType2? type2;

  @override
  String toString() {
    return 'BearerGeneral(name: $name, description: $description, longText: $longText, costCenterCode: $costCenterCode, type: $type, type1: $type1, type2: $type2)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BearerGeneralImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.longText, longText) ||
                other.longText == longText) &&
            (identical(other.costCenterCode, costCenterCode) ||
                other.costCenterCode == costCenterCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.type1, type1) || other.type1 == type1) &&
            (identical(other.type2, type2) || other.type2 == type2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, description, longText,
      costCenterCode, type, type1, type2);

  /// Create a copy of BearerGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BearerGeneralImplCopyWith<_$BearerGeneralImpl> get copyWith =>
      __$$BearerGeneralImplCopyWithImpl<_$BearerGeneralImpl>(this, _$identity);
}

abstract class _BearerGeneral extends BearerGeneral {
  const factory _BearerGeneral(
      {required final String name,
      required final String description,
      required final String longText,
      required final String costCenterCode,
      required final BearerType type,
      required final BearerType1? type1,
      required final BearerType2? type2}) = _$BearerGeneralImpl;
  const _BearerGeneral._() : super._();

  @override
  String get name;
  @override
  String get description;
  @override
  String get longText;
  @override
  String get costCenterCode;
  @override
  BearerType get type;
  @override
  BearerType1? get type1;
  @override
  BearerType2? get type2;

  /// Create a copy of BearerGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BearerGeneralImplCopyWith<_$BearerGeneralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ComparableBearer {
  BearerGeneral get general => throw _privateConstructorUsedError;

  /// Create a copy of ComparableBearer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComparableBearerCopyWith<ComparableBearer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComparableBearerCopyWith<$Res> {
  factory $ComparableBearerCopyWith(
          ComparableBearer value, $Res Function(ComparableBearer) then) =
      _$ComparableBearerCopyWithImpl<$Res, ComparableBearer>;
  @useResult
  $Res call({BearerGeneral general});

  $BearerGeneralCopyWith<$Res> get general;
}

/// @nodoc
class _$ComparableBearerCopyWithImpl<$Res, $Val extends ComparableBearer>
    implements $ComparableBearerCopyWith<$Res> {
  _$ComparableBearerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComparableBearer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
  }) {
    return _then(_value.copyWith(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as BearerGeneral,
    ) as $Val);
  }

  /// Create a copy of ComparableBearer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BearerGeneralCopyWith<$Res> get general {
    return $BearerGeneralCopyWith<$Res>(_value.general, (value) {
      return _then(_value.copyWith(general: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComparableBearerImplCopyWith<$Res>
    implements $ComparableBearerCopyWith<$Res> {
  factory _$$ComparableBearerImplCopyWith(_$ComparableBearerImpl value,
          $Res Function(_$ComparableBearerImpl) then) =
      __$$ComparableBearerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BearerGeneral general});

  @override
  $BearerGeneralCopyWith<$Res> get general;
}

/// @nodoc
class __$$ComparableBearerImplCopyWithImpl<$Res>
    extends _$ComparableBearerCopyWithImpl<$Res, _$ComparableBearerImpl>
    implements _$$ComparableBearerImplCopyWith<$Res> {
  __$$ComparableBearerImplCopyWithImpl(_$ComparableBearerImpl _value,
      $Res Function(_$ComparableBearerImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComparableBearer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
  }) {
    return _then(_$ComparableBearerImpl(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as BearerGeneral,
    ));
  }
}

/// @nodoc

class _$ComparableBearerImpl extends _ComparableBearer {
  const _$ComparableBearerImpl({required this.general}) : super._();

  @override
  final BearerGeneral general;

  @override
  String toString() {
    return 'ComparableBearer(general: $general)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComparableBearerImpl &&
            (identical(other.general, general) || other.general == general));
  }

  @override
  int get hashCode => Object.hash(runtimeType, general);

  /// Create a copy of ComparableBearer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComparableBearerImplCopyWith<_$ComparableBearerImpl> get copyWith =>
      __$$ComparableBearerImplCopyWithImpl<_$ComparableBearerImpl>(
          this, _$identity);
}

abstract class _ComparableBearer extends ComparableBearer {
  const factory _ComparableBearer({required final BearerGeneral general}) =
      _$ComparableBearerImpl;
  const _ComparableBearer._() : super._();

  @override
  BearerGeneral get general;

  /// Create a copy of ComparableBearer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComparableBearerImplCopyWith<_$ComparableBearerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BearerType1 {
  double get marginLeft => throw _privateConstructorUsedError;
  double get marginRight => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Create a copy of BearerType1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BearerType1CopyWith<BearerType1> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BearerType1CopyWith<$Res> {
  factory $BearerType1CopyWith(
          BearerType1 value, $Res Function(BearerType1) then) =
      _$BearerType1CopyWithImpl<$Res, BearerType1>;
  @useResult
  $Res call({double marginLeft, double marginRight, int? id});
}

/// @nodoc
class _$BearerType1CopyWithImpl<$Res, $Val extends BearerType1>
    implements $BearerType1CopyWith<$Res> {
  _$BearerType1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BearerType1
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marginLeft = null,
    Object? marginRight = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      marginLeft: null == marginLeft
          ? _value.marginLeft
          : marginLeft // ignore: cast_nullable_to_non_nullable
              as double,
      marginRight: null == marginRight
          ? _value.marginRight
          : marginRight // ignore: cast_nullable_to_non_nullable
              as double,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BearerType1ImplCopyWith<$Res>
    implements $BearerType1CopyWith<$Res> {
  factory _$$BearerType1ImplCopyWith(
          _$BearerType1Impl value, $Res Function(_$BearerType1Impl) then) =
      __$$BearerType1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double marginLeft, double marginRight, int? id});
}

/// @nodoc
class __$$BearerType1ImplCopyWithImpl<$Res>
    extends _$BearerType1CopyWithImpl<$Res, _$BearerType1Impl>
    implements _$$BearerType1ImplCopyWith<$Res> {
  __$$BearerType1ImplCopyWithImpl(
      _$BearerType1Impl _value, $Res Function(_$BearerType1Impl) _then)
      : super(_value, _then);

  /// Create a copy of BearerType1
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? marginLeft = null,
    Object? marginRight = null,
    Object? id = freezed,
  }) {
    return _then(_$BearerType1Impl(
      marginLeft: null == marginLeft
          ? _value.marginLeft
          : marginLeft // ignore: cast_nullable_to_non_nullable
              as double,
      marginRight: null == marginRight
          ? _value.marginRight
          : marginRight // ignore: cast_nullable_to_non_nullable
              as double,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$BearerType1Impl extends _BearerType1 {
  const _$BearerType1Impl(
      {required this.marginLeft, required this.marginRight, this.id})
      : super._();

  @override
  final double marginLeft;
  @override
  final double marginRight;
  @override
  final int? id;

  @override
  String toString() {
    return 'BearerType1(marginLeft: $marginLeft, marginRight: $marginRight, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BearerType1Impl &&
            (identical(other.marginLeft, marginLeft) ||
                other.marginLeft == marginLeft) &&
            (identical(other.marginRight, marginRight) ||
                other.marginRight == marginRight) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, marginLeft, marginRight, id);

  /// Create a copy of BearerType1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BearerType1ImplCopyWith<_$BearerType1Impl> get copyWith =>
      __$$BearerType1ImplCopyWithImpl<_$BearerType1Impl>(this, _$identity);
}

abstract class _BearerType1 extends BearerType1 {
  const factory _BearerType1(
      {required final double marginLeft,
      required final double marginRight,
      final int? id}) = _$BearerType1Impl;
  const _BearerType1._() : super._();

  @override
  double get marginLeft;
  @override
  double get marginRight;
  @override
  int? get id;

  /// Create a copy of BearerType1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BearerType1ImplCopyWith<_$BearerType1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BearerType2 {
  double get minWidth => throw _privateConstructorUsedError;
  double get minHeight => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Create a copy of BearerType2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BearerType2CopyWith<BearerType2> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BearerType2CopyWith<$Res> {
  factory $BearerType2CopyWith(
          BearerType2 value, $Res Function(BearerType2) then) =
      _$BearerType2CopyWithImpl<$Res, BearerType2>;
  @useResult
  $Res call({double minWidth, double minHeight, int? id});
}

/// @nodoc
class _$BearerType2CopyWithImpl<$Res, $Val extends BearerType2>
    implements $BearerType2CopyWith<$Res> {
  _$BearerType2CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BearerType2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minWidth = null,
    Object? minHeight = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      minWidth: null == minWidth
          ? _value.minWidth
          : minWidth // ignore: cast_nullable_to_non_nullable
              as double,
      minHeight: null == minHeight
          ? _value.minHeight
          : minHeight // ignore: cast_nullable_to_non_nullable
              as double,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BearerType2ImplCopyWith<$Res>
    implements $BearerType2CopyWith<$Res> {
  factory _$$BearerType2ImplCopyWith(
          _$BearerType2Impl value, $Res Function(_$BearerType2Impl) then) =
      __$$BearerType2ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double minWidth, double minHeight, int? id});
}

/// @nodoc
class __$$BearerType2ImplCopyWithImpl<$Res>
    extends _$BearerType2CopyWithImpl<$Res, _$BearerType2Impl>
    implements _$$BearerType2ImplCopyWith<$Res> {
  __$$BearerType2ImplCopyWithImpl(
      _$BearerType2Impl _value, $Res Function(_$BearerType2Impl) _then)
      : super(_value, _then);

  /// Create a copy of BearerType2
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minWidth = null,
    Object? minHeight = null,
    Object? id = freezed,
  }) {
    return _then(_$BearerType2Impl(
      minWidth: null == minWidth
          ? _value.minWidth
          : minWidth // ignore: cast_nullable_to_non_nullable
              as double,
      minHeight: null == minHeight
          ? _value.minHeight
          : minHeight // ignore: cast_nullable_to_non_nullable
              as double,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$BearerType2Impl extends _BearerType2 {
  const _$BearerType2Impl(
      {required this.minWidth, required this.minHeight, this.id})
      : super._();

  @override
  final double minWidth;
  @override
  final double minHeight;
  @override
  final int? id;

  @override
  String toString() {
    return 'BearerType2(minWidth: $minWidth, minHeight: $minHeight, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BearerType2Impl &&
            (identical(other.minWidth, minWidth) ||
                other.minWidth == minWidth) &&
            (identical(other.minHeight, minHeight) ||
                other.minHeight == minHeight) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, minWidth, minHeight, id);

  /// Create a copy of BearerType2
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BearerType2ImplCopyWith<_$BearerType2Impl> get copyWith =>
      __$$BearerType2ImplCopyWithImpl<_$BearerType2Impl>(this, _$identity);
}

abstract class _BearerType2 extends BearerType2 {
  const factory _BearerType2(
      {required final double minWidth,
      required final double minHeight,
      final int? id}) = _$BearerType2Impl;
  const _BearerType2._() : super._();

  @override
  double get minWidth;
  @override
  double get minHeight;
  @override
  int? get id;

  /// Create a copy of BearerType2
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BearerType2ImplCopyWith<_$BearerType2Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
