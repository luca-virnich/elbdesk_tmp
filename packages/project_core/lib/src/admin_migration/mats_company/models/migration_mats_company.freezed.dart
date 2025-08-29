// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'migration_mats_company.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MigrationMatsCompany _$MigrationMatsCompanyFromJson(Map<String, dynamic> json) {
  return _MigrationMatsCompany.fromJson(json);
}

/// @nodoc
mixin _$MigrationMatsCompany {
  MigrationMatsCompanyData get data => throw _privateConstructorUsedError;
  bool get isMigrated => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this MigrationMatsCompany to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MigrationMatsCompany
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MigrationMatsCompanyCopyWith<MigrationMatsCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MigrationMatsCompanyCopyWith<$Res> {
  factory $MigrationMatsCompanyCopyWith(MigrationMatsCompany value,
          $Res Function(MigrationMatsCompany) then) =
      _$MigrationMatsCompanyCopyWithImpl<$Res, MigrationMatsCompany>;
  @useResult
  $Res call({MigrationMatsCompanyData data, bool isMigrated, DataMeta meta});

  $MigrationMatsCompanyDataCopyWith<$Res> get data;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$MigrationMatsCompanyCopyWithImpl<$Res,
        $Val extends MigrationMatsCompany>
    implements $MigrationMatsCompanyCopyWith<$Res> {
  _$MigrationMatsCompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MigrationMatsCompany
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isMigrated = null,
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MigrationMatsCompanyData,
      isMigrated: null == isMigrated
          ? _value.isMigrated
          : isMigrated // ignore: cast_nullable_to_non_nullable
              as bool,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ) as $Val);
  }

  /// Create a copy of MigrationMatsCompany
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MigrationMatsCompanyDataCopyWith<$Res> get data {
    return $MigrationMatsCompanyDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of MigrationMatsCompany
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
abstract class _$$MigrationMatsCompanyImplCopyWith<$Res>
    implements $MigrationMatsCompanyCopyWith<$Res> {
  factory _$$MigrationMatsCompanyImplCopyWith(_$MigrationMatsCompanyImpl value,
          $Res Function(_$MigrationMatsCompanyImpl) then) =
      __$$MigrationMatsCompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MigrationMatsCompanyData data, bool isMigrated, DataMeta meta});

  @override
  $MigrationMatsCompanyDataCopyWith<$Res> get data;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$MigrationMatsCompanyImplCopyWithImpl<$Res>
    extends _$MigrationMatsCompanyCopyWithImpl<$Res, _$MigrationMatsCompanyImpl>
    implements _$$MigrationMatsCompanyImplCopyWith<$Res> {
  __$$MigrationMatsCompanyImplCopyWithImpl(_$MigrationMatsCompanyImpl _value,
      $Res Function(_$MigrationMatsCompanyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MigrationMatsCompany
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isMigrated = null,
    Object? meta = null,
  }) {
    return _then(_$MigrationMatsCompanyImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MigrationMatsCompanyData,
      isMigrated: null == isMigrated
          ? _value.isMigrated
          : isMigrated // ignore: cast_nullable_to_non_nullable
              as bool,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MigrationMatsCompanyImpl extends _MigrationMatsCompany
    with DiagnosticableTreeMixin {
  const _$MigrationMatsCompanyImpl(
      {required this.data, required this.isMigrated, required this.meta})
      : super._();

  factory _$MigrationMatsCompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$MigrationMatsCompanyImplFromJson(json);

  @override
  final MigrationMatsCompanyData data;
  @override
  final bool isMigrated;
  @override
  final DataMeta meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MigrationMatsCompany(data: $data, isMigrated: $isMigrated, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MigrationMatsCompany'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('isMigrated', isMigrated))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationMatsCompanyImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isMigrated, isMigrated) ||
                other.isMigrated == isMigrated) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, isMigrated, meta);

  /// Create a copy of MigrationMatsCompany
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MigrationMatsCompanyImplCopyWith<_$MigrationMatsCompanyImpl>
      get copyWith =>
          __$$MigrationMatsCompanyImplCopyWithImpl<_$MigrationMatsCompanyImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MigrationMatsCompanyImplToJson(
      this,
    );
  }
}

abstract class _MigrationMatsCompany extends MigrationMatsCompany {
  const factory _MigrationMatsCompany(
      {required final MigrationMatsCompanyData data,
      required final bool isMigrated,
      required final DataMeta meta}) = _$MigrationMatsCompanyImpl;
  const _MigrationMatsCompany._() : super._();

  factory _MigrationMatsCompany.fromJson(Map<String, dynamic> json) =
      _$MigrationMatsCompanyImpl.fromJson;

  @override
  MigrationMatsCompanyData get data;
  @override
  bool get isMigrated;
  @override
  DataMeta get meta;

  /// Create a copy of MigrationMatsCompany
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MigrationMatsCompanyImplCopyWith<_$MigrationMatsCompanyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MigrationMatsCompanyData _$MigrationMatsCompanyDataFromJson(
    Map<String, dynamic> json) {
  return _MigrationMatsCompanyData.fromJson(json);
}

/// @nodoc
mixin _$MigrationMatsCompanyData {
  String? get idAccount => throw _privateConstructorUsedError;
  String? get account => throw _privateConstructorUsedError;
  String? get account2 => throw _privateConstructorUsedError;
  String? get idAramis => throw _privateConstructorUsedError;
  String? get idStaff => throw _privateConstructorUsedError;
  String? get idAvVerantw => throw _privateConstructorUsedError;
  String? get standort => throw _privateConstructorUsedError;
  String? get shippingStreet1 => throw _privateConstructorUsedError;
  String? get shippingStreet2 => throw _privateConstructorUsedError;
  String? get shippingPostalCode => throw _privateConstructorUsedError;
  String? get shippingCity => throw _privateConstructorUsedError;
  String? get shippingState => throw _privateConstructorUsedError;
  String? get shippingCountry => throw _privateConstructorUsedError;
  String? get phone1 => throw _privateConstructorUsedError;
  String? get phone2 => throw _privateConstructorUsedError;
  String? get fax => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get website => throw _privateConstructorUsedError;

  /// Serializes this MigrationMatsCompanyData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MigrationMatsCompanyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MigrationMatsCompanyDataCopyWith<MigrationMatsCompanyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MigrationMatsCompanyDataCopyWith<$Res> {
  factory $MigrationMatsCompanyDataCopyWith(MigrationMatsCompanyData value,
          $Res Function(MigrationMatsCompanyData) then) =
      _$MigrationMatsCompanyDataCopyWithImpl<$Res, MigrationMatsCompanyData>;
  @useResult
  $Res call(
      {String? idAccount,
      String? account,
      String? account2,
      String? idAramis,
      String? idStaff,
      String? idAvVerantw,
      String? standort,
      String? shippingStreet1,
      String? shippingStreet2,
      String? shippingPostalCode,
      String? shippingCity,
      String? shippingState,
      String? shippingCountry,
      String? phone1,
      String? phone2,
      String? fax,
      String? email,
      String? website});
}

/// @nodoc
class _$MigrationMatsCompanyDataCopyWithImpl<$Res,
        $Val extends MigrationMatsCompanyData>
    implements $MigrationMatsCompanyDataCopyWith<$Res> {
  _$MigrationMatsCompanyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MigrationMatsCompanyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idAccount = freezed,
    Object? account = freezed,
    Object? account2 = freezed,
    Object? idAramis = freezed,
    Object? idStaff = freezed,
    Object? idAvVerantw = freezed,
    Object? standort = freezed,
    Object? shippingStreet1 = freezed,
    Object? shippingStreet2 = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingCountry = freezed,
    Object? phone1 = freezed,
    Object? phone2 = freezed,
    Object? fax = freezed,
    Object? email = freezed,
    Object? website = freezed,
  }) {
    return _then(_value.copyWith(
      idAccount: freezed == idAccount
          ? _value.idAccount
          : idAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      account2: freezed == account2
          ? _value.account2
          : account2 // ignore: cast_nullable_to_non_nullable
              as String?,
      idAramis: freezed == idAramis
          ? _value.idAramis
          : idAramis // ignore: cast_nullable_to_non_nullable
              as String?,
      idStaff: freezed == idStaff
          ? _value.idStaff
          : idStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      idAvVerantw: freezed == idAvVerantw
          ? _value.idAvVerantw
          : idAvVerantw // ignore: cast_nullable_to_non_nullable
              as String?,
      standort: freezed == standort
          ? _value.standort
          : standort // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingStreet1: freezed == shippingStreet1
          ? _value.shippingStreet1
          : shippingStreet1 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingStreet2: freezed == shippingStreet2
          ? _value.shippingStreet2
          : shippingStreet2 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      phone1: freezed == phone1
          ? _value.phone1
          : phone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      phone2: freezed == phone2
          ? _value.phone2
          : phone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MigrationMatsCompanyDataImplCopyWith<$Res>
    implements $MigrationMatsCompanyDataCopyWith<$Res> {
  factory _$$MigrationMatsCompanyDataImplCopyWith(
          _$MigrationMatsCompanyDataImpl value,
          $Res Function(_$MigrationMatsCompanyDataImpl) then) =
      __$$MigrationMatsCompanyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idAccount,
      String? account,
      String? account2,
      String? idAramis,
      String? idStaff,
      String? idAvVerantw,
      String? standort,
      String? shippingStreet1,
      String? shippingStreet2,
      String? shippingPostalCode,
      String? shippingCity,
      String? shippingState,
      String? shippingCountry,
      String? phone1,
      String? phone2,
      String? fax,
      String? email,
      String? website});
}

/// @nodoc
class __$$MigrationMatsCompanyDataImplCopyWithImpl<$Res>
    extends _$MigrationMatsCompanyDataCopyWithImpl<$Res,
        _$MigrationMatsCompanyDataImpl>
    implements _$$MigrationMatsCompanyDataImplCopyWith<$Res> {
  __$$MigrationMatsCompanyDataImplCopyWithImpl(
      _$MigrationMatsCompanyDataImpl _value,
      $Res Function(_$MigrationMatsCompanyDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MigrationMatsCompanyData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idAccount = freezed,
    Object? account = freezed,
    Object? account2 = freezed,
    Object? idAramis = freezed,
    Object? idStaff = freezed,
    Object? idAvVerantw = freezed,
    Object? standort = freezed,
    Object? shippingStreet1 = freezed,
    Object? shippingStreet2 = freezed,
    Object? shippingPostalCode = freezed,
    Object? shippingCity = freezed,
    Object? shippingState = freezed,
    Object? shippingCountry = freezed,
    Object? phone1 = freezed,
    Object? phone2 = freezed,
    Object? fax = freezed,
    Object? email = freezed,
    Object? website = freezed,
  }) {
    return _then(_$MigrationMatsCompanyDataImpl(
      idAccount: freezed == idAccount
          ? _value.idAccount
          : idAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      account2: freezed == account2
          ? _value.account2
          : account2 // ignore: cast_nullable_to_non_nullable
              as String?,
      idAramis: freezed == idAramis
          ? _value.idAramis
          : idAramis // ignore: cast_nullable_to_non_nullable
              as String?,
      idStaff: freezed == idStaff
          ? _value.idStaff
          : idStaff // ignore: cast_nullable_to_non_nullable
              as String?,
      idAvVerantw: freezed == idAvVerantw
          ? _value.idAvVerantw
          : idAvVerantw // ignore: cast_nullable_to_non_nullable
              as String?,
      standort: freezed == standort
          ? _value.standort
          : standort // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingStreet1: freezed == shippingStreet1
          ? _value.shippingStreet1
          : shippingStreet1 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingStreet2: freezed == shippingStreet2
          ? _value.shippingStreet2
          : shippingStreet2 // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingPostalCode: freezed == shippingPostalCode
          ? _value.shippingPostalCode
          : shippingPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCity: freezed == shippingCity
          ? _value.shippingCity
          : shippingCity // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingState: freezed == shippingState
          ? _value.shippingState
          : shippingState // ignore: cast_nullable_to_non_nullable
              as String?,
      shippingCountry: freezed == shippingCountry
          ? _value.shippingCountry
          : shippingCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      phone1: freezed == phone1
          ? _value.phone1
          : phone1 // ignore: cast_nullable_to_non_nullable
              as String?,
      phone2: freezed == phone2
          ? _value.phone2
          : phone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      website: freezed == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MigrationMatsCompanyDataImpl extends _MigrationMatsCompanyData
    with DiagnosticableTreeMixin {
  const _$MigrationMatsCompanyDataImpl(
      {required this.idAccount,
      required this.account,
      required this.account2,
      required this.idAramis,
      required this.idStaff,
      required this.idAvVerantw,
      required this.standort,
      required this.shippingStreet1,
      required this.shippingStreet2,
      required this.shippingPostalCode,
      required this.shippingCity,
      required this.shippingState,
      required this.shippingCountry,
      required this.phone1,
      required this.phone2,
      required this.fax,
      required this.email,
      required this.website})
      : super._();

  factory _$MigrationMatsCompanyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MigrationMatsCompanyDataImplFromJson(json);

  @override
  final String? idAccount;
  @override
  final String? account;
  @override
  final String? account2;
  @override
  final String? idAramis;
  @override
  final String? idStaff;
  @override
  final String? idAvVerantw;
  @override
  final String? standort;
  @override
  final String? shippingStreet1;
  @override
  final String? shippingStreet2;
  @override
  final String? shippingPostalCode;
  @override
  final String? shippingCity;
  @override
  final String? shippingState;
  @override
  final String? shippingCountry;
  @override
  final String? phone1;
  @override
  final String? phone2;
  @override
  final String? fax;
  @override
  final String? email;
  @override
  final String? website;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MigrationMatsCompanyData(idAccount: $idAccount, account: $account, account2: $account2, idAramis: $idAramis, idStaff: $idStaff, idAvVerantw: $idAvVerantw, standort: $standort, shippingStreet1: $shippingStreet1, shippingStreet2: $shippingStreet2, shippingPostalCode: $shippingPostalCode, shippingCity: $shippingCity, shippingState: $shippingState, shippingCountry: $shippingCountry, phone1: $phone1, phone2: $phone2, fax: $fax, email: $email, website: $website)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MigrationMatsCompanyData'))
      ..add(DiagnosticsProperty('idAccount', idAccount))
      ..add(DiagnosticsProperty('account', account))
      ..add(DiagnosticsProperty('account2', account2))
      ..add(DiagnosticsProperty('idAramis', idAramis))
      ..add(DiagnosticsProperty('idStaff', idStaff))
      ..add(DiagnosticsProperty('idAvVerantw', idAvVerantw))
      ..add(DiagnosticsProperty('standort', standort))
      ..add(DiagnosticsProperty('shippingStreet1', shippingStreet1))
      ..add(DiagnosticsProperty('shippingStreet2', shippingStreet2))
      ..add(DiagnosticsProperty('shippingPostalCode', shippingPostalCode))
      ..add(DiagnosticsProperty('shippingCity', shippingCity))
      ..add(DiagnosticsProperty('shippingState', shippingState))
      ..add(DiagnosticsProperty('shippingCountry', shippingCountry))
      ..add(DiagnosticsProperty('phone1', phone1))
      ..add(DiagnosticsProperty('phone2', phone2))
      ..add(DiagnosticsProperty('fax', fax))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('website', website));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationMatsCompanyDataImpl &&
            (identical(other.idAccount, idAccount) ||
                other.idAccount == idAccount) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.account2, account2) ||
                other.account2 == account2) &&
            (identical(other.idAramis, idAramis) ||
                other.idAramis == idAramis) &&
            (identical(other.idStaff, idStaff) || other.idStaff == idStaff) &&
            (identical(other.idAvVerantw, idAvVerantw) ||
                other.idAvVerantw == idAvVerantw) &&
            (identical(other.standort, standort) ||
                other.standort == standort) &&
            (identical(other.shippingStreet1, shippingStreet1) ||
                other.shippingStreet1 == shippingStreet1) &&
            (identical(other.shippingStreet2, shippingStreet2) ||
                other.shippingStreet2 == shippingStreet2) &&
            (identical(other.shippingPostalCode, shippingPostalCode) ||
                other.shippingPostalCode == shippingPostalCode) &&
            (identical(other.shippingCity, shippingCity) ||
                other.shippingCity == shippingCity) &&
            (identical(other.shippingState, shippingState) ||
                other.shippingState == shippingState) &&
            (identical(other.shippingCountry, shippingCountry) ||
                other.shippingCountry == shippingCountry) &&
            (identical(other.phone1, phone1) || other.phone1 == phone1) &&
            (identical(other.phone2, phone2) || other.phone2 == phone2) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idAccount,
      account,
      account2,
      idAramis,
      idStaff,
      idAvVerantw,
      standort,
      shippingStreet1,
      shippingStreet2,
      shippingPostalCode,
      shippingCity,
      shippingState,
      shippingCountry,
      phone1,
      phone2,
      fax,
      email,
      website);

  /// Create a copy of MigrationMatsCompanyData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MigrationMatsCompanyDataImplCopyWith<_$MigrationMatsCompanyDataImpl>
      get copyWith => __$$MigrationMatsCompanyDataImplCopyWithImpl<
          _$MigrationMatsCompanyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MigrationMatsCompanyDataImplToJson(
      this,
    );
  }
}

abstract class _MigrationMatsCompanyData extends MigrationMatsCompanyData {
  const factory _MigrationMatsCompanyData(
      {required final String? idAccount,
      required final String? account,
      required final String? account2,
      required final String? idAramis,
      required final String? idStaff,
      required final String? idAvVerantw,
      required final String? standort,
      required final String? shippingStreet1,
      required final String? shippingStreet2,
      required final String? shippingPostalCode,
      required final String? shippingCity,
      required final String? shippingState,
      required final String? shippingCountry,
      required final String? phone1,
      required final String? phone2,
      required final String? fax,
      required final String? email,
      required final String? website}) = _$MigrationMatsCompanyDataImpl;
  const _MigrationMatsCompanyData._() : super._();

  factory _MigrationMatsCompanyData.fromJson(Map<String, dynamic> json) =
      _$MigrationMatsCompanyDataImpl.fromJson;

  @override
  String? get idAccount;
  @override
  String? get account;
  @override
  String? get account2;
  @override
  String? get idAramis;
  @override
  String? get idStaff;
  @override
  String? get idAvVerantw;
  @override
  String? get standort;
  @override
  String? get shippingStreet1;
  @override
  String? get shippingStreet2;
  @override
  String? get shippingPostalCode;
  @override
  String? get shippingCity;
  @override
  String? get shippingState;
  @override
  String? get shippingCountry;
  @override
  String? get phone1;
  @override
  String? get phone2;
  @override
  String? get fax;
  @override
  String? get email;
  @override
  String? get website;

  /// Create a copy of MigrationMatsCompanyData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MigrationMatsCompanyDataImplCopyWith<_$MigrationMatsCompanyDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
