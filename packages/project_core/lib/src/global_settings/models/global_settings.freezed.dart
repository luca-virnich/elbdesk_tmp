// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'global_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GlobalSettings _$GlobalSettingsFromJson(Map<String, dynamic> json) {
  return _GlobalSettings.fromJson(json);
}

/// @nodoc
mixin _$GlobalSettings {
  GlobalSettingsData get data => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this GlobalSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalSettingsCopyWith<GlobalSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingsCopyWith<$Res> {
  factory $GlobalSettingsCopyWith(
          GlobalSettings value, $Res Function(GlobalSettings) then) =
      _$GlobalSettingsCopyWithImpl<$Res, GlobalSettings>;
  @useResult
  $Res call({GlobalSettingsData data, DataMeta meta});

  $GlobalSettingsDataCopyWith<$Res> get data;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$GlobalSettingsCopyWithImpl<$Res, $Val extends GlobalSettings>
    implements $GlobalSettingsCopyWith<$Res> {
  _$GlobalSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GlobalSettingsData,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GlobalSettingsDataCopyWith<$Res> get data {
    return $GlobalSettingsDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of GlobalSettings
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
abstract class _$$GlobalSettingsImplCopyWith<$Res>
    implements $GlobalSettingsCopyWith<$Res> {
  factory _$$GlobalSettingsImplCopyWith(_$GlobalSettingsImpl value,
          $Res Function(_$GlobalSettingsImpl) then) =
      __$$GlobalSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GlobalSettingsData data, DataMeta meta});

  @override
  $GlobalSettingsDataCopyWith<$Res> get data;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$GlobalSettingsImplCopyWithImpl<$Res>
    extends _$GlobalSettingsCopyWithImpl<$Res, _$GlobalSettingsImpl>
    implements _$$GlobalSettingsImplCopyWith<$Res> {
  __$$GlobalSettingsImplCopyWithImpl(
      _$GlobalSettingsImpl _value, $Res Function(_$GlobalSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? meta = null,
  }) {
    return _then(_$GlobalSettingsImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GlobalSettingsData,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalSettingsImpl extends _GlobalSettings {
  const _$GlobalSettingsImpl({required this.data, required this.meta})
      : super._();

  factory _$GlobalSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalSettingsImplFromJson(json);

  @override
  final GlobalSettingsData data;
  @override
  final DataMeta meta;

  @override
  String toString() {
    return 'GlobalSettings(data: $data, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSettingsImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, meta);

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSettingsImplCopyWith<_$GlobalSettingsImpl> get copyWith =>
      __$$GlobalSettingsImplCopyWithImpl<_$GlobalSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalSettingsImplToJson(
      this,
    );
  }
}

abstract class _GlobalSettings extends GlobalSettings {
  const factory _GlobalSettings(
      {required final GlobalSettingsData data,
      required final DataMeta meta}) = _$GlobalSettingsImpl;
  const _GlobalSettings._() : super._();

  factory _GlobalSettings.fromJson(Map<String, dynamic> json) =
      _$GlobalSettingsImpl.fromJson;

  @override
  GlobalSettingsData get data;
  @override
  DataMeta get meta;

  /// Create a copy of GlobalSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalSettingsImplCopyWith<_$GlobalSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlobalSettingsData _$GlobalSettingsDataFromJson(Map<String, dynamic> json) {
  return _GlobalSettingsData.fromJson(json);
}

/// @nodoc
mixin _$GlobalSettingsData {
  String get aeEndpointPath => throw _privateConstructorUsedError;
  String? get pdfViewerUrl => throw _privateConstructorUsedError;
  String get dataImportFolderPath => throw _privateConstructorUsedError;
  String get artworkFolderPath => throw _privateConstructorUsedError;

  /// Serializes this GlobalSettingsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlobalSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlobalSettingsDataCopyWith<GlobalSettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlobalSettingsDataCopyWith<$Res> {
  factory $GlobalSettingsDataCopyWith(
          GlobalSettingsData value, $Res Function(GlobalSettingsData) then) =
      _$GlobalSettingsDataCopyWithImpl<$Res, GlobalSettingsData>;
  @useResult
  $Res call(
      {String aeEndpointPath,
      String? pdfViewerUrl,
      String dataImportFolderPath,
      String artworkFolderPath});
}

/// @nodoc
class _$GlobalSettingsDataCopyWithImpl<$Res, $Val extends GlobalSettingsData>
    implements $GlobalSettingsDataCopyWith<$Res> {
  _$GlobalSettingsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlobalSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aeEndpointPath = null,
    Object? pdfViewerUrl = freezed,
    Object? dataImportFolderPath = null,
    Object? artworkFolderPath = null,
  }) {
    return _then(_value.copyWith(
      aeEndpointPath: null == aeEndpointPath
          ? _value.aeEndpointPath
          : aeEndpointPath // ignore: cast_nullable_to_non_nullable
              as String,
      pdfViewerUrl: freezed == pdfViewerUrl
          ? _value.pdfViewerUrl
          : pdfViewerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dataImportFolderPath: null == dataImportFolderPath
          ? _value.dataImportFolderPath
          : dataImportFolderPath // ignore: cast_nullable_to_non_nullable
              as String,
      artworkFolderPath: null == artworkFolderPath
          ? _value.artworkFolderPath
          : artworkFolderPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlobalSettingsDataImplCopyWith<$Res>
    implements $GlobalSettingsDataCopyWith<$Res> {
  factory _$$GlobalSettingsDataImplCopyWith(_$GlobalSettingsDataImpl value,
          $Res Function(_$GlobalSettingsDataImpl) then) =
      __$$GlobalSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String aeEndpointPath,
      String? pdfViewerUrl,
      String dataImportFolderPath,
      String artworkFolderPath});
}

/// @nodoc
class __$$GlobalSettingsDataImplCopyWithImpl<$Res>
    extends _$GlobalSettingsDataCopyWithImpl<$Res, _$GlobalSettingsDataImpl>
    implements _$$GlobalSettingsDataImplCopyWith<$Res> {
  __$$GlobalSettingsDataImplCopyWithImpl(_$GlobalSettingsDataImpl _value,
      $Res Function(_$GlobalSettingsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlobalSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aeEndpointPath = null,
    Object? pdfViewerUrl = freezed,
    Object? dataImportFolderPath = null,
    Object? artworkFolderPath = null,
  }) {
    return _then(_$GlobalSettingsDataImpl(
      aeEndpointPath: null == aeEndpointPath
          ? _value.aeEndpointPath
          : aeEndpointPath // ignore: cast_nullable_to_non_nullable
              as String,
      pdfViewerUrl: freezed == pdfViewerUrl
          ? _value.pdfViewerUrl
          : pdfViewerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dataImportFolderPath: null == dataImportFolderPath
          ? _value.dataImportFolderPath
          : dataImportFolderPath // ignore: cast_nullable_to_non_nullable
              as String,
      artworkFolderPath: null == artworkFolderPath
          ? _value.artworkFolderPath
          : artworkFolderPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlobalSettingsDataImpl extends _GlobalSettingsData {
  const _$GlobalSettingsDataImpl(
      {required this.aeEndpointPath,
      required this.pdfViewerUrl,
      required this.dataImportFolderPath,
      required this.artworkFolderPath})
      : super._();

  factory _$GlobalSettingsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlobalSettingsDataImplFromJson(json);

  @override
  final String aeEndpointPath;
  @override
  final String? pdfViewerUrl;
  @override
  final String dataImportFolderPath;
  @override
  final String artworkFolderPath;

  @override
  String toString() {
    return 'GlobalSettingsData(aeEndpointPath: $aeEndpointPath, pdfViewerUrl: $pdfViewerUrl, dataImportFolderPath: $dataImportFolderPath, artworkFolderPath: $artworkFolderPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlobalSettingsDataImpl &&
            (identical(other.aeEndpointPath, aeEndpointPath) ||
                other.aeEndpointPath == aeEndpointPath) &&
            (identical(other.pdfViewerUrl, pdfViewerUrl) ||
                other.pdfViewerUrl == pdfViewerUrl) &&
            (identical(other.dataImportFolderPath, dataImportFolderPath) ||
                other.dataImportFolderPath == dataImportFolderPath) &&
            (identical(other.artworkFolderPath, artworkFolderPath) ||
                other.artworkFolderPath == artworkFolderPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, aeEndpointPath, pdfViewerUrl,
      dataImportFolderPath, artworkFolderPath);

  /// Create a copy of GlobalSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlobalSettingsDataImplCopyWith<_$GlobalSettingsDataImpl> get copyWith =>
      __$$GlobalSettingsDataImplCopyWithImpl<_$GlobalSettingsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlobalSettingsDataImplToJson(
      this,
    );
  }
}

abstract class _GlobalSettingsData extends GlobalSettingsData {
  const factory _GlobalSettingsData(
      {required final String aeEndpointPath,
      required final String? pdfViewerUrl,
      required final String dataImportFolderPath,
      required final String artworkFolderPath}) = _$GlobalSettingsDataImpl;
  const _GlobalSettingsData._() : super._();

  factory _GlobalSettingsData.fromJson(Map<String, dynamic> json) =
      _$GlobalSettingsDataImpl.fromJson;

  @override
  String get aeEndpointPath;
  @override
  String? get pdfViewerUrl;
  @override
  String get dataImportFolderPath;
  @override
  String get artworkFolderPath;

  /// Create a copy of GlobalSettingsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlobalSettingsDataImplCopyWith<_$GlobalSettingsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
