// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentCode _$PaymentCodeFromJson(Map<String, dynamic> json) {
  return _PaymentCode.fromJson(json);
}

/// @nodoc
mixin _$PaymentCode {
  String get code => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dueDateCalculation => throw _privateConstructorUsedError;
  String get discountDateCalculation => throw _privateConstructorUsedError;
  double get discountPercentage => throw _privateConstructorUsedError;
  bool get calculateDiscountOnCreditNote => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  /// Serializes this PaymentCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentCodeCopyWith<PaymentCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentCodeCopyWith<$Res> {
  factory $PaymentCodeCopyWith(
          PaymentCode value, $Res Function(PaymentCode) then) =
      _$PaymentCodeCopyWithImpl<$Res, PaymentCode>;
  @useResult
  $Res call(
      {String code,
      String description,
      String dueDateCalculation,
      String discountDateCalculation,
      double discountPercentage,
      bool calculateDiscountOnCreditNote,
      DataMeta meta,
      int? id});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$PaymentCodeCopyWithImpl<$Res, $Val extends PaymentCode>
    implements $PaymentCodeCopyWith<$Res> {
  _$PaymentCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? dueDateCalculation = null,
    Object? discountDateCalculation = null,
    Object? discountPercentage = null,
    Object? calculateDiscountOnCreditNote = null,
    Object? meta = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateCalculation: null == dueDateCalculation
          ? _value.dueDateCalculation
          : dueDateCalculation // ignore: cast_nullable_to_non_nullable
              as String,
      discountDateCalculation: null == discountDateCalculation
          ? _value.discountDateCalculation
          : discountDateCalculation // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      calculateDiscountOnCreditNote: null == calculateDiscountOnCreditNote
          ? _value.calculateDiscountOnCreditNote
          : calculateDiscountOnCreditNote // ignore: cast_nullable_to_non_nullable
              as bool,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of PaymentCode
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
abstract class _$$PaymentCodeImplCopyWith<$Res>
    implements $PaymentCodeCopyWith<$Res> {
  factory _$$PaymentCodeImplCopyWith(
          _$PaymentCodeImpl value, $Res Function(_$PaymentCodeImpl) then) =
      __$$PaymentCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String description,
      String dueDateCalculation,
      String discountDateCalculation,
      double discountPercentage,
      bool calculateDiscountOnCreditNote,
      DataMeta meta,
      int? id});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$PaymentCodeImplCopyWithImpl<$Res>
    extends _$PaymentCodeCopyWithImpl<$Res, _$PaymentCodeImpl>
    implements _$$PaymentCodeImplCopyWith<$Res> {
  __$$PaymentCodeImplCopyWithImpl(
      _$PaymentCodeImpl _value, $Res Function(_$PaymentCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? description = null,
    Object? dueDateCalculation = null,
    Object? discountDateCalculation = null,
    Object? discountPercentage = null,
    Object? calculateDiscountOnCreditNote = null,
    Object? meta = null,
    Object? id = freezed,
  }) {
    return _then(_$PaymentCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDateCalculation: null == dueDateCalculation
          ? _value.dueDateCalculation
          : dueDateCalculation // ignore: cast_nullable_to_non_nullable
              as String,
      discountDateCalculation: null == discountDateCalculation
          ? _value.discountDateCalculation
          : discountDateCalculation // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercentage: null == discountPercentage
          ? _value.discountPercentage
          : discountPercentage // ignore: cast_nullable_to_non_nullable
              as double,
      calculateDiscountOnCreditNote: null == calculateDiscountOnCreditNote
          ? _value.calculateDiscountOnCreditNote
          : calculateDiscountOnCreditNote // ignore: cast_nullable_to_non_nullable
              as bool,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentCodeImpl extends _PaymentCode {
  const _$PaymentCodeImpl(
      {required this.code,
      required this.description,
      required this.dueDateCalculation,
      required this.discountDateCalculation,
      required this.discountPercentage,
      required this.calculateDiscountOnCreditNote,
      required this.meta,
      this.id})
      : super._();

  factory _$PaymentCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentCodeImplFromJson(json);

  @override
  final String code;
  @override
  final String description;
  @override
  final String dueDateCalculation;
  @override
  final String discountDateCalculation;
  @override
  final double discountPercentage;
  @override
  final bool calculateDiscountOnCreditNote;
  @override
  final DataMeta meta;
  @override
  final int? id;

  @override
  String toString() {
    return 'PaymentCode(code: $code, description: $description, dueDateCalculation: $dueDateCalculation, discountDateCalculation: $discountDateCalculation, discountPercentage: $discountPercentage, calculateDiscountOnCreditNote: $calculateDiscountOnCreditNote, meta: $meta, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDateCalculation, dueDateCalculation) ||
                other.dueDateCalculation == dueDateCalculation) &&
            (identical(
                    other.discountDateCalculation, discountDateCalculation) ||
                other.discountDateCalculation == discountDateCalculation) &&
            (identical(other.discountPercentage, discountPercentage) ||
                other.discountPercentage == discountPercentage) &&
            (identical(other.calculateDiscountOnCreditNote,
                    calculateDiscountOnCreditNote) ||
                other.calculateDiscountOnCreditNote ==
                    calculateDiscountOnCreditNote) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      description,
      dueDateCalculation,
      discountDateCalculation,
      discountPercentage,
      calculateDiscountOnCreditNote,
      meta,
      id);

  /// Create a copy of PaymentCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentCodeImplCopyWith<_$PaymentCodeImpl> get copyWith =>
      __$$PaymentCodeImplCopyWithImpl<_$PaymentCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentCodeImplToJson(
      this,
    );
  }
}

abstract class _PaymentCode extends PaymentCode {
  const factory _PaymentCode(
      {required final String code,
      required final String description,
      required final String dueDateCalculation,
      required final String discountDateCalculation,
      required final double discountPercentage,
      required final bool calculateDiscountOnCreditNote,
      required final DataMeta meta,
      final int? id}) = _$PaymentCodeImpl;
  const _PaymentCode._() : super._();

  factory _PaymentCode.fromJson(Map<String, dynamic> json) =
      _$PaymentCodeImpl.fromJson;

  @override
  String get code;
  @override
  String get description;
  @override
  String get dueDateCalculation;
  @override
  String get discountDateCalculation;
  @override
  double get discountPercentage;
  @override
  bool get calculateDiscountOnCreditNote;
  @override
  DataMeta get meta;
  @override
  int? get id;

  /// Create a copy of PaymentCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentCodeImplCopyWith<_$PaymentCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
