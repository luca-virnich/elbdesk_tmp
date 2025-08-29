// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
mixin _$AppUser {
  DataMeta get meta => throw _privateConstructorUsedError;
  UserInfo get userInfo => throw _privateConstructorUsedError;
  AppUserGeneral get general => throw _privateConstructorUsedError;
  AppUserCommunication get communication => throw _privateConstructorUsedError;
  AppUserAddress get address => throw _privateConstructorUsedError;
  AppUserEmployee get employee => throw _privateConstructorUsedError;

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCopyWith<AppUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res, AppUser>;
  @useResult
  $Res call(
      {DataMeta meta,
      UserInfo userInfo,
      AppUserGeneral general,
      AppUserCommunication communication,
      AppUserAddress address,
      AppUserEmployee employee});

  $DataMetaCopyWith<$Res> get meta;
  $AppUserGeneralCopyWith<$Res> get general;
  $AppUserCommunicationCopyWith<$Res> get communication;
  $AppUserAddressCopyWith<$Res> get address;
  $AppUserEmployeeCopyWith<$Res> get employee;
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res, $Val extends AppUser>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? userInfo = null,
    Object? general = null,
    Object? communication = null,
    Object? address = null,
    Object? employee = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as AppUserGeneral,
      communication: null == communication
          ? _value.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as AppUserCommunication,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AppUserAddress,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as AppUserEmployee,
    ) as $Val);
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataMetaCopyWith<$Res> get meta {
    return $DataMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserGeneralCopyWith<$Res> get general {
    return $AppUserGeneralCopyWith<$Res>(_value.general, (value) {
      return _then(_value.copyWith(general: value) as $Val);
    });
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserCommunicationCopyWith<$Res> get communication {
    return $AppUserCommunicationCopyWith<$Res>(_value.communication, (value) {
      return _then(_value.copyWith(communication: value) as $Val);
    });
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserAddressCopyWith<$Res> get address {
    return $AppUserAddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppUserEmployeeCopyWith<$Res> get employee {
    return $AppUserEmployeeCopyWith<$Res>(_value.employee, (value) {
      return _then(_value.copyWith(employee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUserImplCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$$AppUserImplCopyWith(
          _$AppUserImpl value, $Res Function(_$AppUserImpl) then) =
      __$$AppUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataMeta meta,
      UserInfo userInfo,
      AppUserGeneral general,
      AppUserCommunication communication,
      AppUserAddress address,
      AppUserEmployee employee});

  @override
  $DataMetaCopyWith<$Res> get meta;
  @override
  $AppUserGeneralCopyWith<$Res> get general;
  @override
  $AppUserCommunicationCopyWith<$Res> get communication;
  @override
  $AppUserAddressCopyWith<$Res> get address;
  @override
  $AppUserEmployeeCopyWith<$Res> get employee;
}

/// @nodoc
class __$$AppUserImplCopyWithImpl<$Res>
    extends _$AppUserCopyWithImpl<$Res, _$AppUserImpl>
    implements _$$AppUserImplCopyWith<$Res> {
  __$$AppUserImplCopyWithImpl(
      _$AppUserImpl _value, $Res Function(_$AppUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? userInfo = null,
    Object? general = null,
    Object? communication = null,
    Object? address = null,
    Object? employee = null,
  }) {
    return _then(_$AppUserImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as AppUserGeneral,
      communication: null == communication
          ? _value.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as AppUserCommunication,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AppUserAddress,
      employee: null == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as AppUserEmployee,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserImpl extends _AppUser {
  const _$AppUserImpl(
      {required this.meta,
      required this.userInfo,
      required this.general,
      required this.communication,
      required this.address,
      required this.employee})
      : super._();

  factory _$AppUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserImplFromJson(json);

  @override
  final DataMeta meta;
  @override
  final UserInfo userInfo;
  @override
  final AppUserGeneral general;
  @override
  final AppUserCommunication communication;
  @override
  final AppUserAddress address;
  @override
  final AppUserEmployee employee;

  @override
  String toString() {
    return 'AppUser(meta: $meta, userInfo: $userInfo, general: $general, communication: $communication, address: $address, employee: $employee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.general, general) || other.general == general) &&
            (identical(other.communication, communication) ||
                other.communication == communication) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.employee, employee) ||
                other.employee == employee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, userInfo, general, communication, address, employee);

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      __$$AppUserImplCopyWithImpl<_$AppUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserImplToJson(
      this,
    );
  }
}

abstract class _AppUser extends AppUser {
  const factory _AppUser(
      {required final DataMeta meta,
      required final UserInfo userInfo,
      required final AppUserGeneral general,
      required final AppUserCommunication communication,
      required final AppUserAddress address,
      required final AppUserEmployee employee}) = _$AppUserImpl;
  const _AppUser._() : super._();

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$AppUserImpl.fromJson;

  @override
  DataMeta get meta;
  @override
  UserInfo get userInfo;
  @override
  AppUserGeneral get general;
  @override
  AppUserCommunication get communication;
  @override
  AppUserAddress get address;
  @override
  AppUserEmployee get employee;

  /// Create a copy of AppUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserImplCopyWith<_$AppUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppUserGeneral _$AppUserGeneralFromJson(Map<String, dynamic> json) {
  return _AppUserGeneral.fromJson(json);
}

/// @nodoc
mixin _$AppUserGeneral {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get initials => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;

  /// Serializes this AppUserGeneral to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUserGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserGeneralCopyWith<AppUserGeneral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserGeneralCopyWith<$Res> {
  factory $AppUserGeneralCopyWith(
          AppUserGeneral value, $Res Function(AppUserGeneral) then) =
      _$AppUserGeneralCopyWithImpl<$Res, AppUserGeneral>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String initials,
      DateTime? birthDate});
}

/// @nodoc
class _$AppUserGeneralCopyWithImpl<$Res, $Val extends AppUserGeneral>
    implements $AppUserGeneralCopyWith<$Res> {
  _$AppUserGeneralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUserGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? initials = null,
    Object? birthDate = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      initials: null == initials
          ? _value.initials
          : initials // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserGeneralImplCopyWith<$Res>
    implements $AppUserGeneralCopyWith<$Res> {
  factory _$$AppUserGeneralImplCopyWith(_$AppUserGeneralImpl value,
          $Res Function(_$AppUserGeneralImpl) then) =
      __$$AppUserGeneralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String initials,
      DateTime? birthDate});
}

/// @nodoc
class __$$AppUserGeneralImplCopyWithImpl<$Res>
    extends _$AppUserGeneralCopyWithImpl<$Res, _$AppUserGeneralImpl>
    implements _$$AppUserGeneralImplCopyWith<$Res> {
  __$$AppUserGeneralImplCopyWithImpl(
      _$AppUserGeneralImpl _value, $Res Function(_$AppUserGeneralImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUserGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? initials = null,
    Object? birthDate = freezed,
  }) {
    return _then(_$AppUserGeneralImpl(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      initials: null == initials
          ? _value.initials
          : initials // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserGeneralImpl extends _AppUserGeneral {
  const _$AppUserGeneralImpl(
      {required this.firstName,
      required this.lastName,
      required this.initials,
      this.birthDate})
      : super._();

  factory _$AppUserGeneralImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserGeneralImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String initials;
  @override
  final DateTime? birthDate;

  @override
  String toString() {
    return 'AppUserGeneral(firstName: $firstName, lastName: $lastName, initials: $initials, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserGeneralImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.initials, initials) ||
                other.initials == initials) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, initials, birthDate);

  /// Create a copy of AppUserGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserGeneralImplCopyWith<_$AppUserGeneralImpl> get copyWith =>
      __$$AppUserGeneralImplCopyWithImpl<_$AppUserGeneralImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserGeneralImplToJson(
      this,
    );
  }
}

abstract class _AppUserGeneral extends AppUserGeneral {
  const factory _AppUserGeneral(
      {required final String firstName,
      required final String lastName,
      required final String initials,
      final DateTime? birthDate}) = _$AppUserGeneralImpl;
  const _AppUserGeneral._() : super._();

  factory _AppUserGeneral.fromJson(Map<String, dynamic> json) =
      _$AppUserGeneralImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get initials;
  @override
  DateTime? get birthDate;

  /// Create a copy of AppUserGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserGeneralImplCopyWith<_$AppUserGeneralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppUserCommunication _$AppUserCommunicationFromJson(Map<String, dynamic> json) {
  return _AppUserCommunication.fromJson(json);
}

/// @nodoc
mixin _$AppUserCommunication {
  String get phone => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get privateEmail => throw _privateConstructorUsedError;

  /// Serializes this AppUserCommunication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUserCommunication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserCommunicationCopyWith<AppUserCommunication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserCommunicationCopyWith<$Res> {
  factory $AppUserCommunicationCopyWith(AppUserCommunication value,
          $Res Function(AppUserCommunication) then) =
      _$AppUserCommunicationCopyWithImpl<$Res, AppUserCommunication>;
  @useResult
  $Res call({String phone, String mobile, String privateEmail});
}

/// @nodoc
class _$AppUserCommunicationCopyWithImpl<$Res,
        $Val extends AppUserCommunication>
    implements $AppUserCommunicationCopyWith<$Res> {
  _$AppUserCommunicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUserCommunication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? mobile = null,
    Object? privateEmail = null,
  }) {
    return _then(_value.copyWith(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      privateEmail: null == privateEmail
          ? _value.privateEmail
          : privateEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppUserCommunicationImplCopyWith<$Res>
    implements $AppUserCommunicationCopyWith<$Res> {
  factory _$$AppUserCommunicationImplCopyWith(_$AppUserCommunicationImpl value,
          $Res Function(_$AppUserCommunicationImpl) then) =
      __$$AppUserCommunicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String mobile, String privateEmail});
}

/// @nodoc
class __$$AppUserCommunicationImplCopyWithImpl<$Res>
    extends _$AppUserCommunicationCopyWithImpl<$Res, _$AppUserCommunicationImpl>
    implements _$$AppUserCommunicationImplCopyWith<$Res> {
  __$$AppUserCommunicationImplCopyWithImpl(_$AppUserCommunicationImpl _value,
      $Res Function(_$AppUserCommunicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUserCommunication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? mobile = null,
    Object? privateEmail = null,
  }) {
    return _then(_$AppUserCommunicationImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      privateEmail: null == privateEmail
          ? _value.privateEmail
          : privateEmail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserCommunicationImpl extends _AppUserCommunication {
  const _$AppUserCommunicationImpl(
      {required this.phone, required this.mobile, required this.privateEmail})
      : super._();

  factory _$AppUserCommunicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserCommunicationImplFromJson(json);

  @override
  final String phone;
  @override
  final String mobile;
  @override
  final String privateEmail;

  @override
  String toString() {
    return 'AppUserCommunication(phone: $phone, mobile: $mobile, privateEmail: $privateEmail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserCommunicationImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.privateEmail, privateEmail) ||
                other.privateEmail == privateEmail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone, mobile, privateEmail);

  /// Create a copy of AppUserCommunication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserCommunicationImplCopyWith<_$AppUserCommunicationImpl>
      get copyWith =>
          __$$AppUserCommunicationImplCopyWithImpl<_$AppUserCommunicationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserCommunicationImplToJson(
      this,
    );
  }
}

abstract class _AppUserCommunication extends AppUserCommunication {
  const factory _AppUserCommunication(
      {required final String phone,
      required final String mobile,
      required final String privateEmail}) = _$AppUserCommunicationImpl;
  const _AppUserCommunication._() : super._();

  factory _AppUserCommunication.fromJson(Map<String, dynamic> json) =
      _$AppUserCommunicationImpl.fromJson;

  @override
  String get phone;
  @override
  String get mobile;
  @override
  String get privateEmail;

  /// Create a copy of AppUserCommunication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserCommunicationImplCopyWith<_$AppUserCommunicationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppUserAddress _$AppUserAddressFromJson(Map<String, dynamic> json) {
  return _AppUserAddress.fromJson(json);
}

/// @nodoc
mixin _$AppUserAddress {
  String get address => throw _privateConstructorUsedError;
  String get address2 => throw _privateConstructorUsedError;
  String get postCode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  CountryCode? get countryCode => throw _privateConstructorUsedError;

  /// Serializes this AppUserAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUserAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserAddressCopyWith<AppUserAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserAddressCopyWith<$Res> {
  factory $AppUserAddressCopyWith(
          AppUserAddress value, $Res Function(AppUserAddress) then) =
      _$AppUserAddressCopyWithImpl<$Res, AppUserAddress>;
  @useResult
  $Res call(
      {String address,
      String address2,
      String postCode,
      String city,
      String state,
      CountryCode? countryCode});

  $CountryCodeCopyWith<$Res>? get countryCode;
}

/// @nodoc
class _$AppUserAddressCopyWithImpl<$Res, $Val extends AppUserAddress>
    implements $AppUserAddressCopyWith<$Res> {
  _$AppUserAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUserAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? address2 = null,
    Object? postCode = null,
    Object? city = null,
    Object? state = null,
    Object? countryCode = freezed,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      postCode: null == postCode
          ? _value.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as CountryCode?,
    ) as $Val);
  }

  /// Create a copy of AppUserAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountryCodeCopyWith<$Res>? get countryCode {
    if (_value.countryCode == null) {
      return null;
    }

    return $CountryCodeCopyWith<$Res>(_value.countryCode!, (value) {
      return _then(_value.copyWith(countryCode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUserAddressImplCopyWith<$Res>
    implements $AppUserAddressCopyWith<$Res> {
  factory _$$AppUserAddressImplCopyWith(_$AppUserAddressImpl value,
          $Res Function(_$AppUserAddressImpl) then) =
      __$$AppUserAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String address2,
      String postCode,
      String city,
      String state,
      CountryCode? countryCode});

  @override
  $CountryCodeCopyWith<$Res>? get countryCode;
}

/// @nodoc
class __$$AppUserAddressImplCopyWithImpl<$Res>
    extends _$AppUserAddressCopyWithImpl<$Res, _$AppUserAddressImpl>
    implements _$$AppUserAddressImplCopyWith<$Res> {
  __$$AppUserAddressImplCopyWithImpl(
      _$AppUserAddressImpl _value, $Res Function(_$AppUserAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUserAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? address2 = null,
    Object? postCode = null,
    Object? city = null,
    Object? state = null,
    Object? countryCode = freezed,
  }) {
    return _then(_$AppUserAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      postCode: null == postCode
          ? _value.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as CountryCode?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserAddressImpl extends _AppUserAddress {
  const _$AppUserAddressImpl(
      {required this.address,
      required this.address2,
      required this.postCode,
      required this.city,
      required this.state,
      required this.countryCode})
      : super._();

  factory _$AppUserAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserAddressImplFromJson(json);

  @override
  final String address;
  @override
  final String address2;
  @override
  final String postCode;
  @override
  final String city;
  @override
  final String state;
  @override
  final CountryCode? countryCode;

  @override
  String toString() {
    return 'AppUserAddress(address: $address, address2: $address2, postCode: $postCode, city: $city, state: $state, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.postCode, postCode) ||
                other.postCode == postCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, address2, postCode, city, state, countryCode);

  /// Create a copy of AppUserAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserAddressImplCopyWith<_$AppUserAddressImpl> get copyWith =>
      __$$AppUserAddressImplCopyWithImpl<_$AppUserAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserAddressImplToJson(
      this,
    );
  }
}

abstract class _AppUserAddress extends AppUserAddress {
  const factory _AppUserAddress(
      {required final String address,
      required final String address2,
      required final String postCode,
      required final String city,
      required final String state,
      required final CountryCode? countryCode}) = _$AppUserAddressImpl;
  const _AppUserAddress._() : super._();

  factory _AppUserAddress.fromJson(Map<String, dynamic> json) =
      _$AppUserAddressImpl.fromJson;

  @override
  String get address;
  @override
  String get address2;
  @override
  String get postCode;
  @override
  String get city;
  @override
  String get state;
  @override
  CountryCode? get countryCode;

  /// Create a copy of AppUserAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserAddressImplCopyWith<_$AppUserAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppUserEmployee _$AppUserEmployeeFromJson(Map<String, dynamic> json) {
  return _AppUserEmployee.fromJson(json);
}

/// @nodoc
mixin _$AppUserEmployee {
  String get employeeNumber => throw _privateConstructorUsedError;
  DateTime? get entryDate => throw _privateConstructorUsedError;
  DateTime? get terminationDate => throw _privateConstructorUsedError;
  DepartmentCode? get department => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get costCenter => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this AppUserEmployee to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppUserEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppUserEmployeeCopyWith<AppUserEmployee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserEmployeeCopyWith<$Res> {
  factory $AppUserEmployeeCopyWith(
          AppUserEmployee value, $Res Function(AppUserEmployee) then) =
      _$AppUserEmployeeCopyWithImpl<$Res, AppUserEmployee>;
  @useResult
  $Res call(
      {String employeeNumber,
      DateTime? entryDate,
      DateTime? terminationDate,
      DepartmentCode? department,
      String position,
      String costCenter,
      bool isActive});

  $DepartmentCodeCopyWith<$Res>? get department;
}

/// @nodoc
class _$AppUserEmployeeCopyWithImpl<$Res, $Val extends AppUserEmployee>
    implements $AppUserEmployeeCopyWith<$Res> {
  _$AppUserEmployeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppUserEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeNumber = null,
    Object? entryDate = freezed,
    Object? terminationDate = freezed,
    Object? department = freezed,
    Object? position = null,
    Object? costCenter = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      employeeNumber: null == employeeNumber
          ? _value.employeeNumber
          : employeeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      entryDate: freezed == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminationDate: freezed == terminationDate
          ? _value.terminationDate
          : terminationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as DepartmentCode?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      costCenter: null == costCenter
          ? _value.costCenter
          : costCenter // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AppUserEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCodeCopyWith<$Res>? get department {
    if (_value.department == null) {
      return null;
    }

    return $DepartmentCodeCopyWith<$Res>(_value.department!, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppUserEmployeeImplCopyWith<$Res>
    implements $AppUserEmployeeCopyWith<$Res> {
  factory _$$AppUserEmployeeImplCopyWith(_$AppUserEmployeeImpl value,
          $Res Function(_$AppUserEmployeeImpl) then) =
      __$$AppUserEmployeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String employeeNumber,
      DateTime? entryDate,
      DateTime? terminationDate,
      DepartmentCode? department,
      String position,
      String costCenter,
      bool isActive});

  @override
  $DepartmentCodeCopyWith<$Res>? get department;
}

/// @nodoc
class __$$AppUserEmployeeImplCopyWithImpl<$Res>
    extends _$AppUserEmployeeCopyWithImpl<$Res, _$AppUserEmployeeImpl>
    implements _$$AppUserEmployeeImplCopyWith<$Res> {
  __$$AppUserEmployeeImplCopyWithImpl(
      _$AppUserEmployeeImpl _value, $Res Function(_$AppUserEmployeeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppUserEmployee
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeNumber = null,
    Object? entryDate = freezed,
    Object? terminationDate = freezed,
    Object? department = freezed,
    Object? position = null,
    Object? costCenter = null,
    Object? isActive = null,
  }) {
    return _then(_$AppUserEmployeeImpl(
      employeeNumber: null == employeeNumber
          ? _value.employeeNumber
          : employeeNumber // ignore: cast_nullable_to_non_nullable
              as String,
      entryDate: freezed == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      terminationDate: freezed == terminationDate
          ? _value.terminationDate
          : terminationDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as DepartmentCode?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      costCenter: null == costCenter
          ? _value.costCenter
          : costCenter // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppUserEmployeeImpl extends _AppUserEmployee {
  const _$AppUserEmployeeImpl(
      {required this.employeeNumber,
      required this.entryDate,
      required this.terminationDate,
      required this.department,
      required this.position,
      required this.costCenter,
      required this.isActive})
      : super._();

  factory _$AppUserEmployeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppUserEmployeeImplFromJson(json);

  @override
  final String employeeNumber;
  @override
  final DateTime? entryDate;
  @override
  final DateTime? terminationDate;
  @override
  final DepartmentCode? department;
  @override
  final String position;
  @override
  final String costCenter;
  @override
  final bool isActive;

  @override
  String toString() {
    return 'AppUserEmployee(employeeNumber: $employeeNumber, entryDate: $entryDate, terminationDate: $terminationDate, department: $department, position: $position, costCenter: $costCenter, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppUserEmployeeImpl &&
            (identical(other.employeeNumber, employeeNumber) ||
                other.employeeNumber == employeeNumber) &&
            (identical(other.entryDate, entryDate) ||
                other.entryDate == entryDate) &&
            (identical(other.terminationDate, terminationDate) ||
                other.terminationDate == terminationDate) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.costCenter, costCenter) ||
                other.costCenter == costCenter) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, employeeNumber, entryDate,
      terminationDate, department, position, costCenter, isActive);

  /// Create a copy of AppUserEmployee
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppUserEmployeeImplCopyWith<_$AppUserEmployeeImpl> get copyWith =>
      __$$AppUserEmployeeImplCopyWithImpl<_$AppUserEmployeeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppUserEmployeeImplToJson(
      this,
    );
  }
}

abstract class _AppUserEmployee extends AppUserEmployee {
  const factory _AppUserEmployee(
      {required final String employeeNumber,
      required final DateTime? entryDate,
      required final DateTime? terminationDate,
      required final DepartmentCode? department,
      required final String position,
      required final String costCenter,
      required final bool isActive}) = _$AppUserEmployeeImpl;
  const _AppUserEmployee._() : super._();

  factory _AppUserEmployee.fromJson(Map<String, dynamic> json) =
      _$AppUserEmployeeImpl.fromJson;

  @override
  String get employeeNumber;
  @override
  DateTime? get entryDate;
  @override
  DateTime? get terminationDate;
  @override
  DepartmentCode? get department;
  @override
  String get position;
  @override
  String get costCenter;
  @override
  bool get isActive;

  /// Create a copy of AppUserEmployee
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppUserEmployeeImplCopyWith<_$AppUserEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
