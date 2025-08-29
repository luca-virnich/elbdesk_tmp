// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_manifest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateManifest _$UpdateManifestFromJson(Map<String, dynamic> json) {
  return _UpdateManifest.fromJson(json);
}

/// @nodoc
mixin _$UpdateManifest {
  String get version => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get releaseDate => throw _privateConstructorUsedError;
  String get runMode => throw _privateConstructorUsedError;
  String get commit => throw _privateConstructorUsedError;
  String get windowsVersion => throw _privateConstructorUsedError;

  /// Serializes this UpdateManifest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateManifestCopyWith<UpdateManifest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateManifestCopyWith<$Res> {
  factory $UpdateManifestCopyWith(
          UpdateManifest value, $Res Function(UpdateManifest) then) =
      _$UpdateManifestCopyWithImpl<$Res, UpdateManifest>;
  @useResult
  $Res call(
      {String version,
      String url,
      String releaseDate,
      String runMode,
      String commit,
      String windowsVersion});
}

/// @nodoc
class _$UpdateManifestCopyWithImpl<$Res, $Val extends UpdateManifest>
    implements $UpdateManifestCopyWith<$Res> {
  _$UpdateManifestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? url = null,
    Object? releaseDate = null,
    Object? runMode = null,
    Object? commit = null,
    Object? windowsVersion = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      runMode: null == runMode
          ? _value.runMode
          : runMode // ignore: cast_nullable_to_non_nullable
              as String,
      commit: null == commit
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as String,
      windowsVersion: null == windowsVersion
          ? _value.windowsVersion
          : windowsVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateManifestImplCopyWith<$Res>
    implements $UpdateManifestCopyWith<$Res> {
  factory _$$UpdateManifestImplCopyWith(_$UpdateManifestImpl value,
          $Res Function(_$UpdateManifestImpl) then) =
      __$$UpdateManifestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String version,
      String url,
      String releaseDate,
      String runMode,
      String commit,
      String windowsVersion});
}

/// @nodoc
class __$$UpdateManifestImplCopyWithImpl<$Res>
    extends _$UpdateManifestCopyWithImpl<$Res, _$UpdateManifestImpl>
    implements _$$UpdateManifestImplCopyWith<$Res> {
  __$$UpdateManifestImplCopyWithImpl(
      _$UpdateManifestImpl _value, $Res Function(_$UpdateManifestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateManifest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? url = null,
    Object? releaseDate = null,
    Object? runMode = null,
    Object? commit = null,
    Object? windowsVersion = null,
  }) {
    return _then(_$UpdateManifestImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String,
      runMode: null == runMode
          ? _value.runMode
          : runMode // ignore: cast_nullable_to_non_nullable
              as String,
      commit: null == commit
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as String,
      windowsVersion: null == windowsVersion
          ? _value.windowsVersion
          : windowsVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateManifestImpl implements _UpdateManifest {
  const _$UpdateManifestImpl(
      {required this.version,
      required this.url,
      required this.releaseDate,
      required this.runMode,
      required this.commit,
      required this.windowsVersion});

  factory _$UpdateManifestImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateManifestImplFromJson(json);

  @override
  final String version;
  @override
  final String url;
  @override
  final String releaseDate;
  @override
  final String runMode;
  @override
  final String commit;
  @override
  final String windowsVersion;

  @override
  String toString() {
    return 'UpdateManifest(version: $version, url: $url, releaseDate: $releaseDate, runMode: $runMode, commit: $commit, windowsVersion: $windowsVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateManifestImpl &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.runMode, runMode) || other.runMode == runMode) &&
            (identical(other.commit, commit) || other.commit == commit) &&
            (identical(other.windowsVersion, windowsVersion) ||
                other.windowsVersion == windowsVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, version, url, releaseDate, runMode, commit, windowsVersion);

  /// Create a copy of UpdateManifest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateManifestImplCopyWith<_$UpdateManifestImpl> get copyWith =>
      __$$UpdateManifestImplCopyWithImpl<_$UpdateManifestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateManifestImplToJson(
      this,
    );
  }
}

abstract class _UpdateManifest implements UpdateManifest {
  const factory _UpdateManifest(
      {required final String version,
      required final String url,
      required final String releaseDate,
      required final String runMode,
      required final String commit,
      required final String windowsVersion}) = _$UpdateManifestImpl;

  factory _UpdateManifest.fromJson(Map<String, dynamic> json) =
      _$UpdateManifestImpl.fromJson;

  @override
  String get version;
  @override
  String get url;
  @override
  String get releaseDate;
  @override
  String get runMode;
  @override
  String get commit;
  @override
  String get windowsVersion;

  /// Create a copy of UpdateManifest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateManifestImplCopyWith<_$UpdateManifestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
