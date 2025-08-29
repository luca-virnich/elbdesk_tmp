// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artwork_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtworkCode _$ArtworkCodeFromJson(Map<String, dynamic> json) {
  return _ArtworkCode.fromJson(json);
}

/// @nodoc
mixin _$ArtworkCode {
  String get value => throw _privateConstructorUsedError;
  ArtworkCodeType get artworkCodeType => throw _privateConstructorUsedError;
  TwoOf5Code? get code2of5 => throw _privateConstructorUsedError;
  AztecCode? get codeAztec => throw _privateConstructorUsedError;
  TemplateCode? get codeTemplate => throw _privateConstructorUsedError;
  String get runtimeId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this ArtworkCode to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtworkCodeCopyWith<ArtworkCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkCodeCopyWith<$Res> {
  factory $ArtworkCodeCopyWith(
          ArtworkCode value, $Res Function(ArtworkCode) then) =
      _$ArtworkCodeCopyWithImpl<$Res, ArtworkCode>;
  @useResult
  $Res call(
      {String value,
      ArtworkCodeType artworkCodeType,
      TwoOf5Code? code2of5,
      AztecCode? codeAztec,
      TemplateCode? codeTemplate,
      String runtimeId,
      String? description});

  $TwoOf5CodeCopyWith<$Res>? get code2of5;
  $AztecCodeCopyWith<$Res>? get codeAztec;
  $TemplateCodeCopyWith<$Res>? get codeTemplate;
}

/// @nodoc
class _$ArtworkCodeCopyWithImpl<$Res, $Val extends ArtworkCode>
    implements $ArtworkCodeCopyWith<$Res> {
  _$ArtworkCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? artworkCodeType = null,
    Object? code2of5 = freezed,
    Object? codeAztec = freezed,
    Object? codeTemplate = freezed,
    Object? runtimeId = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      artworkCodeType: null == artworkCodeType
          ? _value.artworkCodeType
          : artworkCodeType // ignore: cast_nullable_to_non_nullable
              as ArtworkCodeType,
      code2of5: freezed == code2of5
          ? _value.code2of5
          : code2of5 // ignore: cast_nullable_to_non_nullable
              as TwoOf5Code?,
      codeAztec: freezed == codeAztec
          ? _value.codeAztec
          : codeAztec // ignore: cast_nullable_to_non_nullable
              as AztecCode?,
      codeTemplate: freezed == codeTemplate
          ? _value.codeTemplate
          : codeTemplate // ignore: cast_nullable_to_non_nullable
              as TemplateCode?,
      runtimeId: null == runtimeId
          ? _value.runtimeId
          : runtimeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TwoOf5CodeCopyWith<$Res>? get code2of5 {
    if (_value.code2of5 == null) {
      return null;
    }

    return $TwoOf5CodeCopyWith<$Res>(_value.code2of5!, (value) {
      return _then(_value.copyWith(code2of5: value) as $Val);
    });
  }

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AztecCodeCopyWith<$Res>? get codeAztec {
    if (_value.codeAztec == null) {
      return null;
    }

    return $AztecCodeCopyWith<$Res>(_value.codeAztec!, (value) {
      return _then(_value.copyWith(codeAztec: value) as $Val);
    });
  }

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TemplateCodeCopyWith<$Res>? get codeTemplate {
    if (_value.codeTemplate == null) {
      return null;
    }

    return $TemplateCodeCopyWith<$Res>(_value.codeTemplate!, (value) {
      return _then(_value.copyWith(codeTemplate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArtworkCodeImplCopyWith<$Res>
    implements $ArtworkCodeCopyWith<$Res> {
  factory _$$ArtworkCodeImplCopyWith(
          _$ArtworkCodeImpl value, $Res Function(_$ArtworkCodeImpl) then) =
      __$$ArtworkCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String value,
      ArtworkCodeType artworkCodeType,
      TwoOf5Code? code2of5,
      AztecCode? codeAztec,
      TemplateCode? codeTemplate,
      String runtimeId,
      String? description});

  @override
  $TwoOf5CodeCopyWith<$Res>? get code2of5;
  @override
  $AztecCodeCopyWith<$Res>? get codeAztec;
  @override
  $TemplateCodeCopyWith<$Res>? get codeTemplate;
}

/// @nodoc
class __$$ArtworkCodeImplCopyWithImpl<$Res>
    extends _$ArtworkCodeCopyWithImpl<$Res, _$ArtworkCodeImpl>
    implements _$$ArtworkCodeImplCopyWith<$Res> {
  __$$ArtworkCodeImplCopyWithImpl(
      _$ArtworkCodeImpl _value, $Res Function(_$ArtworkCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? artworkCodeType = null,
    Object? code2of5 = freezed,
    Object? codeAztec = freezed,
    Object? codeTemplate = freezed,
    Object? runtimeId = null,
    Object? description = freezed,
  }) {
    return _then(_$ArtworkCodeImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      artworkCodeType: null == artworkCodeType
          ? _value.artworkCodeType
          : artworkCodeType // ignore: cast_nullable_to_non_nullable
              as ArtworkCodeType,
      code2of5: freezed == code2of5
          ? _value.code2of5
          : code2of5 // ignore: cast_nullable_to_non_nullable
              as TwoOf5Code?,
      codeAztec: freezed == codeAztec
          ? _value.codeAztec
          : codeAztec // ignore: cast_nullable_to_non_nullable
              as AztecCode?,
      codeTemplate: freezed == codeTemplate
          ? _value.codeTemplate
          : codeTemplate // ignore: cast_nullable_to_non_nullable
              as TemplateCode?,
      runtimeId: null == runtimeId
          ? _value.runtimeId
          : runtimeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtworkCodeImpl extends _ArtworkCode {
  const _$ArtworkCodeImpl(
      {required this.value,
      required this.artworkCodeType,
      required this.code2of5,
      required this.codeAztec,
      required this.codeTemplate,
      required this.runtimeId,
      this.description})
      : super._();

  factory _$ArtworkCodeImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtworkCodeImplFromJson(json);

  @override
  final String value;
  @override
  final ArtworkCodeType artworkCodeType;
  @override
  final TwoOf5Code? code2of5;
  @override
  final AztecCode? codeAztec;
  @override
  final TemplateCode? codeTemplate;
  @override
  final String runtimeId;
  @override
  final String? description;

  @override
  String toString() {
    return 'ArtworkCode(value: $value, artworkCodeType: $artworkCodeType, code2of5: $code2of5, codeAztec: $codeAztec, codeTemplate: $codeTemplate, runtimeId: $runtimeId, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtworkCodeImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.artworkCodeType, artworkCodeType) ||
                other.artworkCodeType == artworkCodeType) &&
            (identical(other.code2of5, code2of5) ||
                other.code2of5 == code2of5) &&
            (identical(other.codeAztec, codeAztec) ||
                other.codeAztec == codeAztec) &&
            (identical(other.codeTemplate, codeTemplate) ||
                other.codeTemplate == codeTemplate) &&
            (identical(other.runtimeId, runtimeId) ||
                other.runtimeId == runtimeId) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, artworkCodeType, code2of5,
      codeAztec, codeTemplate, runtimeId, description);

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtworkCodeImplCopyWith<_$ArtworkCodeImpl> get copyWith =>
      __$$ArtworkCodeImplCopyWithImpl<_$ArtworkCodeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtworkCodeImplToJson(
      this,
    );
  }
}

abstract class _ArtworkCode extends ArtworkCode {
  const factory _ArtworkCode(
      {required final String value,
      required final ArtworkCodeType artworkCodeType,
      required final TwoOf5Code? code2of5,
      required final AztecCode? codeAztec,
      required final TemplateCode? codeTemplate,
      required final String runtimeId,
      final String? description}) = _$ArtworkCodeImpl;
  const _ArtworkCode._() : super._();

  factory _ArtworkCode.fromJson(Map<String, dynamic> json) =
      _$ArtworkCodeImpl.fromJson;

  @override
  String get value;
  @override
  ArtworkCodeType get artworkCodeType;
  @override
  TwoOf5Code? get code2of5;
  @override
  AztecCode? get codeAztec;
  @override
  TemplateCode? get codeTemplate;
  @override
  String get runtimeId;
  @override
  String? get description;

  /// Create a copy of ArtworkCode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtworkCodeImplCopyWith<_$ArtworkCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
