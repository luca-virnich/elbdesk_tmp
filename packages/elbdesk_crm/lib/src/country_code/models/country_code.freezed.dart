// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryCode _$CountryCodeFromJson(Map<String, dynamic> json) {
  return _CountryCode.fromJson(json);
}

/// @nodoc
mixin _$CountryCode {
  String get code => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get isoCode => throw _privateConstructorUsedError;
  int? get numericIsoCode => throw _privateConstructorUsedError;
  CountryCodeAddressFormat? get addressFormat =>
      throw _privateConstructorUsedError;
  CountryCodeContactAddressFormat? get contactAddressFormat =>
      throw _privateConstructorUsedError;
  bool get showState => throw _privateConstructorUsedError;
  bool get isPrimary => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get federalRegion => throw _privateConstructorUsedError;
  String? get euCode => throw _privateConstructorUsedError;
  String? get intrastatCode => throw _privateConstructorUsedError;
  String? get taxScheme => throw _privateConstructorUsedError;

  /// Serializes this CountryCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CountryCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryCodeCopyWith<CountryCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCodeCopyWith<$Res> {
  factory $CountryCodeCopyWith(
          CountryCode value, $Res Function(CountryCode) then) =
      _$CountryCodeCopyWithImpl<$Res, CountryCode>;
  @useResult
  $Res call(
      {String code,
      String name,
      String isoCode,
      int? numericIsoCode,
      CountryCodeAddressFormat? addressFormat,
      CountryCodeContactAddressFormat? contactAddressFormat,
      bool showState,
      bool isPrimary,
      DataMeta meta,
      int? id,
      String? federalRegion,
      String? euCode,
      String? intrastatCode,
      String? taxScheme});

  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$CountryCodeCopyWithImpl<$Res, $Val extends CountryCode>
    implements $CountryCodeCopyWith<$Res> {
  _$CountryCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? isoCode = null,
    Object? numericIsoCode = freezed,
    Object? addressFormat = freezed,
    Object? contactAddressFormat = freezed,
    Object? showState = null,
    Object? isPrimary = null,
    Object? meta = null,
    Object? id = freezed,
    Object? federalRegion = freezed,
    Object? euCode = freezed,
    Object? intrastatCode = freezed,
    Object? taxScheme = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      numericIsoCode: freezed == numericIsoCode
          ? _value.numericIsoCode
          : numericIsoCode // ignore: cast_nullable_to_non_nullable
              as int?,
      addressFormat: freezed == addressFormat
          ? _value.addressFormat
          : addressFormat // ignore: cast_nullable_to_non_nullable
              as CountryCodeAddressFormat?,
      contactAddressFormat: freezed == contactAddressFormat
          ? _value.contactAddressFormat
          : contactAddressFormat // ignore: cast_nullable_to_non_nullable
              as CountryCodeContactAddressFormat?,
      showState: null == showState
          ? _value.showState
          : showState // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      federalRegion: freezed == federalRegion
          ? _value.federalRegion
          : federalRegion // ignore: cast_nullable_to_non_nullable
              as String?,
      euCode: freezed == euCode
          ? _value.euCode
          : euCode // ignore: cast_nullable_to_non_nullable
              as String?,
      intrastatCode: freezed == intrastatCode
          ? _value.intrastatCode
          : intrastatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      taxScheme: freezed == taxScheme
          ? _value.taxScheme
          : taxScheme // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CountryCode
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
abstract class _$$CountryCodeImplCopyWith<$Res>
    implements $CountryCodeCopyWith<$Res> {
  factory _$$CountryCodeImplCopyWith(
          _$CountryCodeImpl value, $Res Function(_$CountryCodeImpl) then) =
      __$$CountryCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String name,
      String isoCode,
      int? numericIsoCode,
      CountryCodeAddressFormat? addressFormat,
      CountryCodeContactAddressFormat? contactAddressFormat,
      bool showState,
      bool isPrimary,
      DataMeta meta,
      int? id,
      String? federalRegion,
      String? euCode,
      String? intrastatCode,
      String? taxScheme});

  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$CountryCodeImplCopyWithImpl<$Res>
    extends _$CountryCodeCopyWithImpl<$Res, _$CountryCodeImpl>
    implements _$$CountryCodeImplCopyWith<$Res> {
  __$$CountryCodeImplCopyWithImpl(
      _$CountryCodeImpl _value, $Res Function(_$CountryCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountryCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? name = null,
    Object? isoCode = null,
    Object? numericIsoCode = freezed,
    Object? addressFormat = freezed,
    Object? contactAddressFormat = freezed,
    Object? showState = null,
    Object? isPrimary = null,
    Object? meta = null,
    Object? id = freezed,
    Object? federalRegion = freezed,
    Object? euCode = freezed,
    Object? intrastatCode = freezed,
    Object? taxScheme = freezed,
  }) {
    return _then(_$CountryCodeImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isoCode: null == isoCode
          ? _value.isoCode
          : isoCode // ignore: cast_nullable_to_non_nullable
              as String,
      numericIsoCode: freezed == numericIsoCode
          ? _value.numericIsoCode
          : numericIsoCode // ignore: cast_nullable_to_non_nullable
              as int?,
      addressFormat: freezed == addressFormat
          ? _value.addressFormat
          : addressFormat // ignore: cast_nullable_to_non_nullable
              as CountryCodeAddressFormat?,
      contactAddressFormat: freezed == contactAddressFormat
          ? _value.contactAddressFormat
          : contactAddressFormat // ignore: cast_nullable_to_non_nullable
              as CountryCodeContactAddressFormat?,
      showState: null == showState
          ? _value.showState
          : showState // ignore: cast_nullable_to_non_nullable
              as bool,
      isPrimary: null == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      federalRegion: freezed == federalRegion
          ? _value.federalRegion
          : federalRegion // ignore: cast_nullable_to_non_nullable
              as String?,
      euCode: freezed == euCode
          ? _value.euCode
          : euCode // ignore: cast_nullable_to_non_nullable
              as String?,
      intrastatCode: freezed == intrastatCode
          ? _value.intrastatCode
          : intrastatCode // ignore: cast_nullable_to_non_nullable
              as String?,
      taxScheme: freezed == taxScheme
          ? _value.taxScheme
          : taxScheme // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryCodeImpl extends _CountryCode {
  const _$CountryCodeImpl(
      {required this.code,
      required this.name,
      required this.isoCode,
      required this.numericIsoCode,
      required this.addressFormat,
      required this.contactAddressFormat,
      required this.showState,
      required this.isPrimary,
      required this.meta,
      this.id,
      this.federalRegion,
      this.euCode,
      this.intrastatCode,
      this.taxScheme})
      : super._();

  factory _$CountryCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryCodeImplFromJson(json);

  @override
  final String code;
  @override
  final String name;
  @override
  final String isoCode;
  @override
  final int? numericIsoCode;
  @override
  final CountryCodeAddressFormat? addressFormat;
  @override
  final CountryCodeContactAddressFormat? contactAddressFormat;
  @override
  final bool showState;
  @override
  final bool isPrimary;
  @override
  final DataMeta meta;
  @override
  final int? id;
  @override
  final String? federalRegion;
  @override
  final String? euCode;
  @override
  final String? intrastatCode;
  @override
  final String? taxScheme;

  @override
  String toString() {
    return 'CountryCode(code: $code, name: $name, isoCode: $isoCode, numericIsoCode: $numericIsoCode, addressFormat: $addressFormat, contactAddressFormat: $contactAddressFormat, showState: $showState, isPrimary: $isPrimary, meta: $meta, id: $id, federalRegion: $federalRegion, euCode: $euCode, intrastatCode: $intrastatCode, taxScheme: $taxScheme)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryCodeImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isoCode, isoCode) || other.isoCode == isoCode) &&
            (identical(other.numericIsoCode, numericIsoCode) ||
                other.numericIsoCode == numericIsoCode) &&
            (identical(other.addressFormat, addressFormat) ||
                other.addressFormat == addressFormat) &&
            (identical(other.contactAddressFormat, contactAddressFormat) ||
                other.contactAddressFormat == contactAddressFormat) &&
            (identical(other.showState, showState) ||
                other.showState == showState) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.federalRegion, federalRegion) ||
                other.federalRegion == federalRegion) &&
            (identical(other.euCode, euCode) || other.euCode == euCode) &&
            (identical(other.intrastatCode, intrastatCode) ||
                other.intrastatCode == intrastatCode) &&
            (identical(other.taxScheme, taxScheme) ||
                other.taxScheme == taxScheme));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      name,
      isoCode,
      numericIsoCode,
      addressFormat,
      contactAddressFormat,
      showState,
      isPrimary,
      meta,
      id,
      federalRegion,
      euCode,
      intrastatCode,
      taxScheme);

  /// Create a copy of CountryCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryCodeImplCopyWith<_$CountryCodeImpl> get copyWith =>
      __$$CountryCodeImplCopyWithImpl<_$CountryCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryCodeImplToJson(
      this,
    );
  }
}

abstract class _CountryCode extends CountryCode {
  const factory _CountryCode(
      {required final String code,
      required final String name,
      required final String isoCode,
      required final int? numericIsoCode,
      required final CountryCodeAddressFormat? addressFormat,
      required final CountryCodeContactAddressFormat? contactAddressFormat,
      required final bool showState,
      required final bool isPrimary,
      required final DataMeta meta,
      final int? id,
      final String? federalRegion,
      final String? euCode,
      final String? intrastatCode,
      final String? taxScheme}) = _$CountryCodeImpl;
  const _CountryCode._() : super._();

  factory _CountryCode.fromJson(Map<String, dynamic> json) =
      _$CountryCodeImpl.fromJson;

  @override
  String get code;
  @override
  String get name;
  @override
  String get isoCode;
  @override
  int? get numericIsoCode;
  @override
  CountryCodeAddressFormat? get addressFormat;
  @override
  CountryCodeContactAddressFormat? get contactAddressFormat;
  @override
  bool get showState;
  @override
  bool get isPrimary;
  @override
  DataMeta get meta;
  @override
  int? get id;
  @override
  String? get federalRegion;
  @override
  String? get euCode;
  @override
  String? get intrastatCode;
  @override
  String? get taxScheme;

  /// Create a copy of CountryCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryCodeImplCopyWith<_$CountryCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
