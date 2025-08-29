// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'migration_mats_person.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MigrationMatsPerson _$MigrationMatsPersonFromJson(Map<String, dynamic> json) {
  return _MigrationMatsPerson.fromJson(json);
}

/// @nodoc
mixin _$MigrationMatsPerson {
  MigrationMatsPersonData get data => throw _privateConstructorUsedError;
  bool get isMigrated => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;

  /// Serializes this MigrationMatsPerson to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MigrationMatsPerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MigrationMatsPersonCopyWith<MigrationMatsPerson> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MigrationMatsPersonCopyWith<$Res> {
  factory $MigrationMatsPersonCopyWith(
          MigrationMatsPerson value, $Res Function(MigrationMatsPerson) then) =
      _$MigrationMatsPersonCopyWithImpl<$Res, MigrationMatsPerson>;
  @useResult
  $Res call({MigrationMatsPersonData data, bool isMigrated, DataMeta meta});

  $MigrationMatsPersonDataCopyWith<$Res> get data;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$MigrationMatsPersonCopyWithImpl<$Res, $Val extends MigrationMatsPerson>
    implements $MigrationMatsPersonCopyWith<$Res> {
  _$MigrationMatsPersonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MigrationMatsPerson
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
              as MigrationMatsPersonData,
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

  /// Create a copy of MigrationMatsPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MigrationMatsPersonDataCopyWith<$Res> get data {
    return $MigrationMatsPersonDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of MigrationMatsPerson
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
abstract class _$$MigrationMatsPersonImplCopyWith<$Res>
    implements $MigrationMatsPersonCopyWith<$Res> {
  factory _$$MigrationMatsPersonImplCopyWith(_$MigrationMatsPersonImpl value,
          $Res Function(_$MigrationMatsPersonImpl) then) =
      __$$MigrationMatsPersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MigrationMatsPersonData data, bool isMigrated, DataMeta meta});

  @override
  $MigrationMatsPersonDataCopyWith<$Res> get data;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$MigrationMatsPersonImplCopyWithImpl<$Res>
    extends _$MigrationMatsPersonCopyWithImpl<$Res, _$MigrationMatsPersonImpl>
    implements _$$MigrationMatsPersonImplCopyWith<$Res> {
  __$$MigrationMatsPersonImplCopyWithImpl(_$MigrationMatsPersonImpl _value,
      $Res Function(_$MigrationMatsPersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of MigrationMatsPerson
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isMigrated = null,
    Object? meta = null,
  }) {
    return _then(_$MigrationMatsPersonImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MigrationMatsPersonData,
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
class _$MigrationMatsPersonImpl extends _MigrationMatsPerson
    with DiagnosticableTreeMixin {
  const _$MigrationMatsPersonImpl(
      {required this.data, required this.isMigrated, required this.meta})
      : super._();

  factory _$MigrationMatsPersonImpl.fromJson(Map<String, dynamic> json) =>
      _$$MigrationMatsPersonImplFromJson(json);

  @override
  final MigrationMatsPersonData data;
  @override
  final bool isMigrated;
  @override
  final DataMeta meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MigrationMatsPerson(data: $data, isMigrated: $isMigrated, meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MigrationMatsPerson'))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('isMigrated', isMigrated))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationMatsPersonImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isMigrated, isMigrated) ||
                other.isMigrated == isMigrated) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data, isMigrated, meta);

  /// Create a copy of MigrationMatsPerson
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MigrationMatsPersonImplCopyWith<_$MigrationMatsPersonImpl> get copyWith =>
      __$$MigrationMatsPersonImplCopyWithImpl<_$MigrationMatsPersonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MigrationMatsPersonImplToJson(
      this,
    );
  }
}

abstract class _MigrationMatsPerson extends MigrationMatsPerson {
  const factory _MigrationMatsPerson(
      {required final MigrationMatsPersonData data,
      required final bool isMigrated,
      required final DataMeta meta}) = _$MigrationMatsPersonImpl;
  const _MigrationMatsPerson._() : super._();

  factory _MigrationMatsPerson.fromJson(Map<String, dynamic> json) =
      _$MigrationMatsPersonImpl.fromJson;

  @override
  MigrationMatsPersonData get data;
  @override
  bool get isMigrated;
  @override
  DataMeta get meta;

  /// Create a copy of MigrationMatsPerson
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MigrationMatsPersonImplCopyWith<_$MigrationMatsPersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MigrationMatsPersonData _$MigrationMatsPersonDataFromJson(
    Map<String, dynamic> json) {
  return _MigrationMatsPersonData.fromJson(json);
}

/// @nodoc
mixin _$MigrationMatsPersonData {
  String? get idContact => throw _privateConstructorUsedError;
  String? get nameFirst => throw _privateConstructorUsedError;
  String? get nameLast => throw _privateConstructorUsedError;
  String? get anrede => throw _privateConstructorUsedError;
  String? get titel => throw _privateConstructorUsedError;
  String? get department => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;
  String? get anredeLang => throw _privateConstructorUsedError;
  String? get idAccount => throw _privateConstructorUsedError;
  String? get primaryStreet1 => throw _privateConstructorUsedError;
  String? get primaryStreet2 => throw _privateConstructorUsedError;
  String? get primaryPostalCode => throw _privateConstructorUsedError;
  String? get primaryCity => throw _privateConstructorUsedError;
  String? get primaryCountry => throw _privateConstructorUsedError;
  String? get primaryState => throw _privateConstructorUsedError;
  String? get telefon1 => throw _privateConstructorUsedError;
  String? get telefon2 => throw _privateConstructorUsedError;
  String? get mobilTelefon => throw _privateConstructorUsedError;
  String? get fax => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get wK => throw _privateConstructorUsedError;
  String? get wWf => throw _privateConstructorUsedError;
  String? get wFp => throw _privateConstructorUsedError;
  String? get contactInfor => throw _privateConstructorUsedError;
  bool get isPerson => throw _privateConstructorUsedError;

  /// Serializes this MigrationMatsPersonData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MigrationMatsPersonData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MigrationMatsPersonDataCopyWith<MigrationMatsPersonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MigrationMatsPersonDataCopyWith<$Res> {
  factory $MigrationMatsPersonDataCopyWith(MigrationMatsPersonData value,
          $Res Function(MigrationMatsPersonData) then) =
      _$MigrationMatsPersonDataCopyWithImpl<$Res, MigrationMatsPersonData>;
  @useResult
  $Res call(
      {String? idContact,
      String? nameFirst,
      String? nameLast,
      String? anrede,
      String? titel,
      String? department,
      String? position,
      String? anredeLang,
      String? idAccount,
      String? primaryStreet1,
      String? primaryStreet2,
      String? primaryPostalCode,
      String? primaryCity,
      String? primaryCountry,
      String? primaryState,
      String? telefon1,
      String? telefon2,
      String? mobilTelefon,
      String? fax,
      String? email,
      String? status,
      String? wK,
      String? wWf,
      String? wFp,
      String? contactInfor,
      bool isPerson});
}

/// @nodoc
class _$MigrationMatsPersonDataCopyWithImpl<$Res,
        $Val extends MigrationMatsPersonData>
    implements $MigrationMatsPersonDataCopyWith<$Res> {
  _$MigrationMatsPersonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MigrationMatsPersonData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idContact = freezed,
    Object? nameFirst = freezed,
    Object? nameLast = freezed,
    Object? anrede = freezed,
    Object? titel = freezed,
    Object? department = freezed,
    Object? position = freezed,
    Object? anredeLang = freezed,
    Object? idAccount = freezed,
    Object? primaryStreet1 = freezed,
    Object? primaryStreet2 = freezed,
    Object? primaryPostalCode = freezed,
    Object? primaryCity = freezed,
    Object? primaryCountry = freezed,
    Object? primaryState = freezed,
    Object? telefon1 = freezed,
    Object? telefon2 = freezed,
    Object? mobilTelefon = freezed,
    Object? fax = freezed,
    Object? email = freezed,
    Object? status = freezed,
    Object? wK = freezed,
    Object? wWf = freezed,
    Object? wFp = freezed,
    Object? contactInfor = freezed,
    Object? isPerson = null,
  }) {
    return _then(_value.copyWith(
      idContact: freezed == idContact
          ? _value.idContact
          : idContact // ignore: cast_nullable_to_non_nullable
              as String?,
      nameFirst: freezed == nameFirst
          ? _value.nameFirst
          : nameFirst // ignore: cast_nullable_to_non_nullable
              as String?,
      nameLast: freezed == nameLast
          ? _value.nameLast
          : nameLast // ignore: cast_nullable_to_non_nullable
              as String?,
      anrede: freezed == anrede
          ? _value.anrede
          : anrede // ignore: cast_nullable_to_non_nullable
              as String?,
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      anredeLang: freezed == anredeLang
          ? _value.anredeLang
          : anredeLang // ignore: cast_nullable_to_non_nullable
              as String?,
      idAccount: freezed == idAccount
          ? _value.idAccount
          : idAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryStreet1: freezed == primaryStreet1
          ? _value.primaryStreet1
          : primaryStreet1 // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryStreet2: freezed == primaryStreet2
          ? _value.primaryStreet2
          : primaryStreet2 // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryPostalCode: freezed == primaryPostalCode
          ? _value.primaryPostalCode
          : primaryPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryCity: freezed == primaryCity
          ? _value.primaryCity
          : primaryCity // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryCountry: freezed == primaryCountry
          ? _value.primaryCountry
          : primaryCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryState: freezed == primaryState
          ? _value.primaryState
          : primaryState // ignore: cast_nullable_to_non_nullable
              as String?,
      telefon1: freezed == telefon1
          ? _value.telefon1
          : telefon1 // ignore: cast_nullable_to_non_nullable
              as String?,
      telefon2: freezed == telefon2
          ? _value.telefon2
          : telefon2 // ignore: cast_nullable_to_non_nullable
              as String?,
      mobilTelefon: freezed == mobilTelefon
          ? _value.mobilTelefon
          : mobilTelefon // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      wK: freezed == wK
          ? _value.wK
          : wK // ignore: cast_nullable_to_non_nullable
              as String?,
      wWf: freezed == wWf
          ? _value.wWf
          : wWf // ignore: cast_nullable_to_non_nullable
              as String?,
      wFp: freezed == wFp
          ? _value.wFp
          : wFp // ignore: cast_nullable_to_non_nullable
              as String?,
      contactInfor: freezed == contactInfor
          ? _value.contactInfor
          : contactInfor // ignore: cast_nullable_to_non_nullable
              as String?,
      isPerson: null == isPerson
          ? _value.isPerson
          : isPerson // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MigrationMatsPersonDataImplCopyWith<$Res>
    implements $MigrationMatsPersonDataCopyWith<$Res> {
  factory _$$MigrationMatsPersonDataImplCopyWith(
          _$MigrationMatsPersonDataImpl value,
          $Res Function(_$MigrationMatsPersonDataImpl) then) =
      __$$MigrationMatsPersonDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? idContact,
      String? nameFirst,
      String? nameLast,
      String? anrede,
      String? titel,
      String? department,
      String? position,
      String? anredeLang,
      String? idAccount,
      String? primaryStreet1,
      String? primaryStreet2,
      String? primaryPostalCode,
      String? primaryCity,
      String? primaryCountry,
      String? primaryState,
      String? telefon1,
      String? telefon2,
      String? mobilTelefon,
      String? fax,
      String? email,
      String? status,
      String? wK,
      String? wWf,
      String? wFp,
      String? contactInfor,
      bool isPerson});
}

/// @nodoc
class __$$MigrationMatsPersonDataImplCopyWithImpl<$Res>
    extends _$MigrationMatsPersonDataCopyWithImpl<$Res,
        _$MigrationMatsPersonDataImpl>
    implements _$$MigrationMatsPersonDataImplCopyWith<$Res> {
  __$$MigrationMatsPersonDataImplCopyWithImpl(
      _$MigrationMatsPersonDataImpl _value,
      $Res Function(_$MigrationMatsPersonDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MigrationMatsPersonData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idContact = freezed,
    Object? nameFirst = freezed,
    Object? nameLast = freezed,
    Object? anrede = freezed,
    Object? titel = freezed,
    Object? department = freezed,
    Object? position = freezed,
    Object? anredeLang = freezed,
    Object? idAccount = freezed,
    Object? primaryStreet1 = freezed,
    Object? primaryStreet2 = freezed,
    Object? primaryPostalCode = freezed,
    Object? primaryCity = freezed,
    Object? primaryCountry = freezed,
    Object? primaryState = freezed,
    Object? telefon1 = freezed,
    Object? telefon2 = freezed,
    Object? mobilTelefon = freezed,
    Object? fax = freezed,
    Object? email = freezed,
    Object? status = freezed,
    Object? wK = freezed,
    Object? wWf = freezed,
    Object? wFp = freezed,
    Object? contactInfor = freezed,
    Object? isPerson = null,
  }) {
    return _then(_$MigrationMatsPersonDataImpl(
      idContact: freezed == idContact
          ? _value.idContact
          : idContact // ignore: cast_nullable_to_non_nullable
              as String?,
      nameFirst: freezed == nameFirst
          ? _value.nameFirst
          : nameFirst // ignore: cast_nullable_to_non_nullable
              as String?,
      nameLast: freezed == nameLast
          ? _value.nameLast
          : nameLast // ignore: cast_nullable_to_non_nullable
              as String?,
      anrede: freezed == anrede
          ? _value.anrede
          : anrede // ignore: cast_nullable_to_non_nullable
              as String?,
      titel: freezed == titel
          ? _value.titel
          : titel // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      anredeLang: freezed == anredeLang
          ? _value.anredeLang
          : anredeLang // ignore: cast_nullable_to_non_nullable
              as String?,
      idAccount: freezed == idAccount
          ? _value.idAccount
          : idAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryStreet1: freezed == primaryStreet1
          ? _value.primaryStreet1
          : primaryStreet1 // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryStreet2: freezed == primaryStreet2
          ? _value.primaryStreet2
          : primaryStreet2 // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryPostalCode: freezed == primaryPostalCode
          ? _value.primaryPostalCode
          : primaryPostalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryCity: freezed == primaryCity
          ? _value.primaryCity
          : primaryCity // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryCountry: freezed == primaryCountry
          ? _value.primaryCountry
          : primaryCountry // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryState: freezed == primaryState
          ? _value.primaryState
          : primaryState // ignore: cast_nullable_to_non_nullable
              as String?,
      telefon1: freezed == telefon1
          ? _value.telefon1
          : telefon1 // ignore: cast_nullable_to_non_nullable
              as String?,
      telefon2: freezed == telefon2
          ? _value.telefon2
          : telefon2 // ignore: cast_nullable_to_non_nullable
              as String?,
      mobilTelefon: freezed == mobilTelefon
          ? _value.mobilTelefon
          : mobilTelefon // ignore: cast_nullable_to_non_nullable
              as String?,
      fax: freezed == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      wK: freezed == wK
          ? _value.wK
          : wK // ignore: cast_nullable_to_non_nullable
              as String?,
      wWf: freezed == wWf
          ? _value.wWf
          : wWf // ignore: cast_nullable_to_non_nullable
              as String?,
      wFp: freezed == wFp
          ? _value.wFp
          : wFp // ignore: cast_nullable_to_non_nullable
              as String?,
      contactInfor: freezed == contactInfor
          ? _value.contactInfor
          : contactInfor // ignore: cast_nullable_to_non_nullable
              as String?,
      isPerson: null == isPerson
          ? _value.isPerson
          : isPerson // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MigrationMatsPersonDataImpl extends _MigrationMatsPersonData
    with DiagnosticableTreeMixin {
  const _$MigrationMatsPersonDataImpl(
      {required this.idContact,
      required this.nameFirst,
      required this.nameLast,
      required this.anrede,
      required this.titel,
      required this.department,
      required this.position,
      required this.anredeLang,
      required this.idAccount,
      required this.primaryStreet1,
      required this.primaryStreet2,
      required this.primaryPostalCode,
      required this.primaryCity,
      required this.primaryCountry,
      required this.primaryState,
      required this.telefon1,
      required this.telefon2,
      required this.mobilTelefon,
      required this.fax,
      required this.email,
      required this.status,
      required this.wK,
      required this.wWf,
      required this.wFp,
      required this.contactInfor,
      required this.isPerson})
      : super._();

  factory _$MigrationMatsPersonDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MigrationMatsPersonDataImplFromJson(json);

  @override
  final String? idContact;
  @override
  final String? nameFirst;
  @override
  final String? nameLast;
  @override
  final String? anrede;
  @override
  final String? titel;
  @override
  final String? department;
  @override
  final String? position;
  @override
  final String? anredeLang;
  @override
  final String? idAccount;
  @override
  final String? primaryStreet1;
  @override
  final String? primaryStreet2;
  @override
  final String? primaryPostalCode;
  @override
  final String? primaryCity;
  @override
  final String? primaryCountry;
  @override
  final String? primaryState;
  @override
  final String? telefon1;
  @override
  final String? telefon2;
  @override
  final String? mobilTelefon;
  @override
  final String? fax;
  @override
  final String? email;
  @override
  final String? status;
  @override
  final String? wK;
  @override
  final String? wWf;
  @override
  final String? wFp;
  @override
  final String? contactInfor;
  @override
  final bool isPerson;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MigrationMatsPersonData(idContact: $idContact, nameFirst: $nameFirst, nameLast: $nameLast, anrede: $anrede, titel: $titel, department: $department, position: $position, anredeLang: $anredeLang, idAccount: $idAccount, primaryStreet1: $primaryStreet1, primaryStreet2: $primaryStreet2, primaryPostalCode: $primaryPostalCode, primaryCity: $primaryCity, primaryCountry: $primaryCountry, primaryState: $primaryState, telefon1: $telefon1, telefon2: $telefon2, mobilTelefon: $mobilTelefon, fax: $fax, email: $email, status: $status, wK: $wK, wWf: $wWf, wFp: $wFp, contactInfor: $contactInfor, isPerson: $isPerson)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MigrationMatsPersonData'))
      ..add(DiagnosticsProperty('idContact', idContact))
      ..add(DiagnosticsProperty('nameFirst', nameFirst))
      ..add(DiagnosticsProperty('nameLast', nameLast))
      ..add(DiagnosticsProperty('anrede', anrede))
      ..add(DiagnosticsProperty('titel', titel))
      ..add(DiagnosticsProperty('department', department))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('anredeLang', anredeLang))
      ..add(DiagnosticsProperty('idAccount', idAccount))
      ..add(DiagnosticsProperty('primaryStreet1', primaryStreet1))
      ..add(DiagnosticsProperty('primaryStreet2', primaryStreet2))
      ..add(DiagnosticsProperty('primaryPostalCode', primaryPostalCode))
      ..add(DiagnosticsProperty('primaryCity', primaryCity))
      ..add(DiagnosticsProperty('primaryCountry', primaryCountry))
      ..add(DiagnosticsProperty('primaryState', primaryState))
      ..add(DiagnosticsProperty('telefon1', telefon1))
      ..add(DiagnosticsProperty('telefon2', telefon2))
      ..add(DiagnosticsProperty('mobilTelefon', mobilTelefon))
      ..add(DiagnosticsProperty('fax', fax))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('wK', wK))
      ..add(DiagnosticsProperty('wWf', wWf))
      ..add(DiagnosticsProperty('wFp', wFp))
      ..add(DiagnosticsProperty('contactInfor', contactInfor))
      ..add(DiagnosticsProperty('isPerson', isPerson));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MigrationMatsPersonDataImpl &&
            (identical(other.idContact, idContact) ||
                other.idContact == idContact) &&
            (identical(other.nameFirst, nameFirst) ||
                other.nameFirst == nameFirst) &&
            (identical(other.nameLast, nameLast) ||
                other.nameLast == nameLast) &&
            (identical(other.anrede, anrede) || other.anrede == anrede) &&
            (identical(other.titel, titel) || other.titel == titel) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.anredeLang, anredeLang) ||
                other.anredeLang == anredeLang) &&
            (identical(other.idAccount, idAccount) ||
                other.idAccount == idAccount) &&
            (identical(other.primaryStreet1, primaryStreet1) ||
                other.primaryStreet1 == primaryStreet1) &&
            (identical(other.primaryStreet2, primaryStreet2) ||
                other.primaryStreet2 == primaryStreet2) &&
            (identical(other.primaryPostalCode, primaryPostalCode) ||
                other.primaryPostalCode == primaryPostalCode) &&
            (identical(other.primaryCity, primaryCity) ||
                other.primaryCity == primaryCity) &&
            (identical(other.primaryCountry, primaryCountry) ||
                other.primaryCountry == primaryCountry) &&
            (identical(other.primaryState, primaryState) ||
                other.primaryState == primaryState) &&
            (identical(other.telefon1, telefon1) ||
                other.telefon1 == telefon1) &&
            (identical(other.telefon2, telefon2) ||
                other.telefon2 == telefon2) &&
            (identical(other.mobilTelefon, mobilTelefon) ||
                other.mobilTelefon == mobilTelefon) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.wK, wK) || other.wK == wK) &&
            (identical(other.wWf, wWf) || other.wWf == wWf) &&
            (identical(other.wFp, wFp) || other.wFp == wFp) &&
            (identical(other.contactInfor, contactInfor) ||
                other.contactInfor == contactInfor) &&
            (identical(other.isPerson, isPerson) ||
                other.isPerson == isPerson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idContact,
        nameFirst,
        nameLast,
        anrede,
        titel,
        department,
        position,
        anredeLang,
        idAccount,
        primaryStreet1,
        primaryStreet2,
        primaryPostalCode,
        primaryCity,
        primaryCountry,
        primaryState,
        telefon1,
        telefon2,
        mobilTelefon,
        fax,
        email,
        status,
        wK,
        wWf,
        wFp,
        contactInfor,
        isPerson
      ]);

  /// Create a copy of MigrationMatsPersonData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MigrationMatsPersonDataImplCopyWith<_$MigrationMatsPersonDataImpl>
      get copyWith => __$$MigrationMatsPersonDataImplCopyWithImpl<
          _$MigrationMatsPersonDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MigrationMatsPersonDataImplToJson(
      this,
    );
  }
}

abstract class _MigrationMatsPersonData extends MigrationMatsPersonData {
  const factory _MigrationMatsPersonData(
      {required final String? idContact,
      required final String? nameFirst,
      required final String? nameLast,
      required final String? anrede,
      required final String? titel,
      required final String? department,
      required final String? position,
      required final String? anredeLang,
      required final String? idAccount,
      required final String? primaryStreet1,
      required final String? primaryStreet2,
      required final String? primaryPostalCode,
      required final String? primaryCity,
      required final String? primaryCountry,
      required final String? primaryState,
      required final String? telefon1,
      required final String? telefon2,
      required final String? mobilTelefon,
      required final String? fax,
      required final String? email,
      required final String? status,
      required final String? wK,
      required final String? wWf,
      required final String? wFp,
      required final String? contactInfor,
      required final bool isPerson}) = _$MigrationMatsPersonDataImpl;
  const _MigrationMatsPersonData._() : super._();

  factory _MigrationMatsPersonData.fromJson(Map<String, dynamic> json) =
      _$MigrationMatsPersonDataImpl.fromJson;

  @override
  String? get idContact;
  @override
  String? get nameFirst;
  @override
  String? get nameLast;
  @override
  String? get anrede;
  @override
  String? get titel;
  @override
  String? get department;
  @override
  String? get position;
  @override
  String? get anredeLang;
  @override
  String? get idAccount;
  @override
  String? get primaryStreet1;
  @override
  String? get primaryStreet2;
  @override
  String? get primaryPostalCode;
  @override
  String? get primaryCity;
  @override
  String? get primaryCountry;
  @override
  String? get primaryState;
  @override
  String? get telefon1;
  @override
  String? get telefon2;
  @override
  String? get mobilTelefon;
  @override
  String? get fax;
  @override
  String? get email;
  @override
  String? get status;
  @override
  String? get wK;
  @override
  String? get wWf;
  @override
  String? get wFp;
  @override
  String? get contactInfor;
  @override
  bool get isPerson;

  /// Create a copy of MigrationMatsPersonData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MigrationMatsPersonDataImplCopyWith<_$MigrationMatsPersonDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
