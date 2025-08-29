// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return _Contact.fromJson(json);
}

/// @nodoc
mixin _$Contact {
  ContactGeneral get general => throw _privateConstructorUsedError;
  ContactAddress get address => throw _privateConstructorUsedError;
  ContactCommunication get communication => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  DataMeta get meta => throw _privateConstructorUsedError;
  int? get customId => throw _privateConstructorUsedError;
  int? get migrationMatsPersonId => throw _privateConstructorUsedError;
  int? get migrationMatsCompanyId => throw _privateConstructorUsedError;

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCopyWith<Contact> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCopyWith<$Res> {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) then) =
      _$ContactCopyWithImpl<$Res, Contact>;
  @useResult
  $Res call(
      {ContactGeneral general,
      ContactAddress address,
      ContactCommunication communication,
      Customer? customer,
      DataMeta meta,
      int? customId,
      int? migrationMatsPersonId,
      int? migrationMatsCompanyId});

  $ContactGeneralCopyWith<$Res> get general;
  $ContactAddressCopyWith<$Res> get address;
  $ContactCommunicationCopyWith<$Res> get communication;
  $CustomerCopyWith<$Res>? get customer;
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$ContactCopyWithImpl<$Res, $Val extends Contact>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
    Object? address = null,
    Object? communication = null,
    Object? customer = freezed,
    Object? meta = null,
    Object? customId = freezed,
    Object? migrationMatsPersonId = freezed,
    Object? migrationMatsCompanyId = freezed,
  }) {
    return _then(_value.copyWith(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as ContactGeneral,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as ContactAddress,
      communication: null == communication
          ? _value.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as ContactCommunication,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      customId: freezed == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as int?,
      migrationMatsPersonId: freezed == migrationMatsPersonId
          ? _value.migrationMatsPersonId
          : migrationMatsPersonId // ignore: cast_nullable_to_non_nullable
              as int?,
      migrationMatsCompanyId: freezed == migrationMatsCompanyId
          ? _value.migrationMatsCompanyId
          : migrationMatsCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactGeneralCopyWith<$Res> get general {
    return $ContactGeneralCopyWith<$Res>(_value.general, (value) {
      return _then(_value.copyWith(general: value) as $Val);
    });
  }

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactAddressCopyWith<$Res> get address {
    return $ContactAddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactCommunicationCopyWith<$Res> get communication {
    return $ContactCommunicationCopyWith<$Res>(_value.communication, (value) {
      return _then(_value.copyWith(communication: value) as $Val);
    });
  }

  /// Create a copy of Contact
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

  /// Create a copy of Contact
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
abstract class _$$ContactImplCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$$ContactImplCopyWith(
          _$ContactImpl value, $Res Function(_$ContactImpl) then) =
      __$$ContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ContactGeneral general,
      ContactAddress address,
      ContactCommunication communication,
      Customer? customer,
      DataMeta meta,
      int? customId,
      int? migrationMatsPersonId,
      int? migrationMatsCompanyId});

  @override
  $ContactGeneralCopyWith<$Res> get general;
  @override
  $ContactAddressCopyWith<$Res> get address;
  @override
  $ContactCommunicationCopyWith<$Res> get communication;
  @override
  $CustomerCopyWith<$Res>? get customer;
  @override
  $DataMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$ContactImplCopyWithImpl<$Res>
    extends _$ContactCopyWithImpl<$Res, _$ContactImpl>
    implements _$$ContactImplCopyWith<$Res> {
  __$$ContactImplCopyWithImpl(
      _$ContactImpl _value, $Res Function(_$ContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? general = null,
    Object? address = null,
    Object? communication = null,
    Object? customer = freezed,
    Object? meta = null,
    Object? customId = freezed,
    Object? migrationMatsPersonId = freezed,
    Object? migrationMatsCompanyId = freezed,
  }) {
    return _then(_$ContactImpl(
      general: null == general
          ? _value.general
          : general // ignore: cast_nullable_to_non_nullable
              as ContactGeneral,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as ContactAddress,
      communication: null == communication
          ? _value.communication
          : communication // ignore: cast_nullable_to_non_nullable
              as ContactCommunication,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as DataMeta,
      customId: freezed == customId
          ? _value.customId
          : customId // ignore: cast_nullable_to_non_nullable
              as int?,
      migrationMatsPersonId: freezed == migrationMatsPersonId
          ? _value.migrationMatsPersonId
          : migrationMatsPersonId // ignore: cast_nullable_to_non_nullable
              as int?,
      migrationMatsCompanyId: freezed == migrationMatsCompanyId
          ? _value.migrationMatsCompanyId
          : migrationMatsCompanyId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactImpl extends _Contact {
  const _$ContactImpl(
      {required this.general,
      required this.address,
      required this.communication,
      required this.customer,
      required this.meta,
      required this.customId,
      required this.migrationMatsPersonId,
      required this.migrationMatsCompanyId})
      : super._();

  factory _$ContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactImplFromJson(json);

  @override
  final ContactGeneral general;
  @override
  final ContactAddress address;
  @override
  final ContactCommunication communication;
  @override
  final Customer? customer;
  @override
  final DataMeta meta;
  @override
  final int? customId;
  @override
  final int? migrationMatsPersonId;
  @override
  final int? migrationMatsCompanyId;

  @override
  String toString() {
    return 'Contact(general: $general, address: $address, communication: $communication, customer: $customer, meta: $meta, customId: $customId, migrationMatsPersonId: $migrationMatsPersonId, migrationMatsCompanyId: $migrationMatsCompanyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactImpl &&
            (identical(other.general, general) || other.general == general) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.communication, communication) ||
                other.communication == communication) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.customId, customId) ||
                other.customId == customId) &&
            (identical(other.migrationMatsPersonId, migrationMatsPersonId) ||
                other.migrationMatsPersonId == migrationMatsPersonId) &&
            (identical(other.migrationMatsCompanyId, migrationMatsCompanyId) ||
                other.migrationMatsCompanyId == migrationMatsCompanyId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, general, address, communication,
      customer, meta, customId, migrationMatsPersonId, migrationMatsCompanyId);

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      __$$ContactImplCopyWithImpl<_$ContactImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactImplToJson(
      this,
    );
  }
}

abstract class _Contact extends Contact {
  const factory _Contact(
      {required final ContactGeneral general,
      required final ContactAddress address,
      required final ContactCommunication communication,
      required final Customer? customer,
      required final DataMeta meta,
      required final int? customId,
      required final int? migrationMatsPersonId,
      required final int? migrationMatsCompanyId}) = _$ContactImpl;
  const _Contact._() : super._();

  factory _Contact.fromJson(Map<String, dynamic> json) = _$ContactImpl.fromJson;

  @override
  ContactGeneral get general;
  @override
  ContactAddress get address;
  @override
  ContactCommunication get communication;
  @override
  Customer? get customer;
  @override
  DataMeta get meta;
  @override
  int? get customId;
  @override
  int? get migrationMatsPersonId;
  @override
  int? get migrationMatsCompanyId;

  /// Create a copy of Contact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactImplCopyWith<_$ContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactGeneral _$ContactGeneralFromJson(Map<String, dynamic> json) {
  return _ContactGeneral.fromJson(json);
}

/// @nodoc
mixin _$ContactGeneral {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get initials => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  LanguageCode? get languageCode => throw _privateConstructorUsedError;
  ContactType? get type => throw _privateConstructorUsedError;
  SalutationCode? get salutationCode => throw _privateConstructorUsedError;
  String get importantNote => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;

  /// Serializes this ContactGeneral to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactGeneralCopyWith<ContactGeneral> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactGeneralCopyWith<$Res> {
  factory $ContactGeneralCopyWith(
          ContactGeneral value, $Res Function(ContactGeneral) then) =
      _$ContactGeneralCopyWithImpl<$Res, ContactGeneral>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String initials,
      String name,
      LanguageCode? languageCode,
      ContactType? type,
      SalutationCode? salutationCode,
      String importantNote,
      DateTime? birthDate});

  $LanguageCodeCopyWith<$Res>? get languageCode;
  $SalutationCodeCopyWith<$Res>? get salutationCode;
}

/// @nodoc
class _$ContactGeneralCopyWithImpl<$Res, $Val extends ContactGeneral>
    implements $ContactGeneralCopyWith<$Res> {
  _$ContactGeneralCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? initials = null,
    Object? name = null,
    Object? languageCode = freezed,
    Object? type = freezed,
    Object? salutationCode = freezed,
    Object? importantNote = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageCode?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContactType?,
      salutationCode: freezed == salutationCode
          ? _value.salutationCode
          : salutationCode // ignore: cast_nullable_to_non_nullable
              as SalutationCode?,
      importantNote: null == importantNote
          ? _value.importantNote
          : importantNote // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ContactGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LanguageCodeCopyWith<$Res>? get languageCode {
    if (_value.languageCode == null) {
      return null;
    }

    return $LanguageCodeCopyWith<$Res>(_value.languageCode!, (value) {
      return _then(_value.copyWith(languageCode: value) as $Val);
    });
  }

  /// Create a copy of ContactGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalutationCodeCopyWith<$Res>? get salutationCode {
    if (_value.salutationCode == null) {
      return null;
    }

    return $SalutationCodeCopyWith<$Res>(_value.salutationCode!, (value) {
      return _then(_value.copyWith(salutationCode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContactGeneralImplCopyWith<$Res>
    implements $ContactGeneralCopyWith<$Res> {
  factory _$$ContactGeneralImplCopyWith(_$ContactGeneralImpl value,
          $Res Function(_$ContactGeneralImpl) then) =
      __$$ContactGeneralImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String initials,
      String name,
      LanguageCode? languageCode,
      ContactType? type,
      SalutationCode? salutationCode,
      String importantNote,
      DateTime? birthDate});

  @override
  $LanguageCodeCopyWith<$Res>? get languageCode;
  @override
  $SalutationCodeCopyWith<$Res>? get salutationCode;
}

/// @nodoc
class __$$ContactGeneralImplCopyWithImpl<$Res>
    extends _$ContactGeneralCopyWithImpl<$Res, _$ContactGeneralImpl>
    implements _$$ContactGeneralImplCopyWith<$Res> {
  __$$ContactGeneralImplCopyWithImpl(
      _$ContactGeneralImpl _value, $Res Function(_$ContactGeneralImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactGeneral
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? initials = null,
    Object? name = null,
    Object? languageCode = freezed,
    Object? type = freezed,
    Object? salutationCode = freezed,
    Object? importantNote = null,
    Object? birthDate = freezed,
  }) {
    return _then(_$ContactGeneralImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      languageCode: freezed == languageCode
          ? _value.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as LanguageCode?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContactType?,
      salutationCode: freezed == salutationCode
          ? _value.salutationCode
          : salutationCode // ignore: cast_nullable_to_non_nullable
              as SalutationCode?,
      importantNote: null == importantNote
          ? _value.importantNote
          : importantNote // ignore: cast_nullable_to_non_nullable
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
class _$ContactGeneralImpl extends _ContactGeneral {
  const _$ContactGeneralImpl(
      {required this.firstName,
      required this.lastName,
      required this.initials,
      required this.name,
      required this.languageCode,
      required this.type,
      required this.salutationCode,
      required this.importantNote,
      this.birthDate})
      : super._();

  factory _$ContactGeneralImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactGeneralImplFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String initials;
  @override
  final String name;
  @override
  final LanguageCode? languageCode;
  @override
  final ContactType? type;
  @override
  final SalutationCode? salutationCode;
  @override
  final String importantNote;
  @override
  final DateTime? birthDate;

  @override
  String toString() {
    return 'ContactGeneral(firstName: $firstName, lastName: $lastName, initials: $initials, name: $name, languageCode: $languageCode, type: $type, salutationCode: $salutationCode, importantNote: $importantNote, birthDate: $birthDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactGeneralImpl &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.initials, initials) ||
                other.initials == initials) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.salutationCode, salutationCode) ||
                other.salutationCode == salutationCode) &&
            (identical(other.importantNote, importantNote) ||
                other.importantNote == importantNote) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, initials,
      name, languageCode, type, salutationCode, importantNote, birthDate);

  /// Create a copy of ContactGeneral
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactGeneralImplCopyWith<_$ContactGeneralImpl> get copyWith =>
      __$$ContactGeneralImplCopyWithImpl<_$ContactGeneralImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactGeneralImplToJson(
      this,
    );
  }
}

abstract class _ContactGeneral extends ContactGeneral {
  const factory _ContactGeneral(
      {required final String firstName,
      required final String lastName,
      required final String initials,
      required final String name,
      required final LanguageCode? languageCode,
      required final ContactType? type,
      required final SalutationCode? salutationCode,
      required final String importantNote,
      final DateTime? birthDate}) = _$ContactGeneralImpl;
  const _ContactGeneral._() : super._();

  factory _ContactGeneral.fromJson(Map<String, dynamic> json) =
      _$ContactGeneralImpl.fromJson;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get initials;
  @override
  String get name;
  @override
  LanguageCode? get languageCode;
  @override
  ContactType? get type;
  @override
  SalutationCode? get salutationCode;
  @override
  String get importantNote;
  @override
  DateTime? get birthDate;

  /// Create a copy of ContactGeneral
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactGeneralImplCopyWith<_$ContactGeneralImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContactCommunication _$ContactCommunicationFromJson(Map<String, dynamic> json) {
  return _ContactCommunication.fromJson(json);
}

/// @nodoc
mixin _$ContactCommunication {
  String get phone => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get website => throw _privateConstructorUsedError;

  /// Serializes this ContactCommunication to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactCommunication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactCommunicationCopyWith<ContactCommunication> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactCommunicationCopyWith<$Res> {
  factory $ContactCommunicationCopyWith(ContactCommunication value,
          $Res Function(ContactCommunication) then) =
      _$ContactCommunicationCopyWithImpl<$Res, ContactCommunication>;
  @useResult
  $Res call({String phone, String mobile, String email, String website});
}

/// @nodoc
class _$ContactCommunicationCopyWithImpl<$Res,
        $Val extends ContactCommunication>
    implements $ContactCommunicationCopyWith<$Res> {
  _$ContactCommunicationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactCommunication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? mobile = null,
    Object? email = null,
    Object? website = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContactCommunicationImplCopyWith<$Res>
    implements $ContactCommunicationCopyWith<$Res> {
  factory _$$ContactCommunicationImplCopyWith(_$ContactCommunicationImpl value,
          $Res Function(_$ContactCommunicationImpl) then) =
      __$$ContactCommunicationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String phone, String mobile, String email, String website});
}

/// @nodoc
class __$$ContactCommunicationImplCopyWithImpl<$Res>
    extends _$ContactCommunicationCopyWithImpl<$Res, _$ContactCommunicationImpl>
    implements _$$ContactCommunicationImplCopyWith<$Res> {
  __$$ContactCommunicationImplCopyWithImpl(_$ContactCommunicationImpl _value,
      $Res Function(_$ContactCommunicationImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactCommunication
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phone = null,
    Object? mobile = null,
    Object? email = null,
    Object? website = null,
  }) {
    return _then(_$ContactCommunicationImpl(
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContactCommunicationImpl extends _ContactCommunication {
  const _$ContactCommunicationImpl(
      {required this.phone,
      required this.mobile,
      required this.email,
      required this.website})
      : super._();

  factory _$ContactCommunicationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactCommunicationImplFromJson(json);

  @override
  final String phone;
  @override
  final String mobile;
  @override
  final String email;
  @override
  final String website;

  @override
  String toString() {
    return 'ContactCommunication(phone: $phone, mobile: $mobile, email: $email, website: $website)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactCommunicationImpl &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.website, website) || other.website == website));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, phone, mobile, email, website);

  /// Create a copy of ContactCommunication
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactCommunicationImplCopyWith<_$ContactCommunicationImpl>
      get copyWith =>
          __$$ContactCommunicationImplCopyWithImpl<_$ContactCommunicationImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactCommunicationImplToJson(
      this,
    );
  }
}

abstract class _ContactCommunication extends ContactCommunication {
  const factory _ContactCommunication(
      {required final String phone,
      required final String mobile,
      required final String email,
      required final String website}) = _$ContactCommunicationImpl;
  const _ContactCommunication._() : super._();

  factory _ContactCommunication.fromJson(Map<String, dynamic> json) =
      _$ContactCommunicationImpl.fromJson;

  @override
  String get phone;
  @override
  String get mobile;
  @override
  String get email;
  @override
  String get website;

  /// Create a copy of ContactCommunication
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactCommunicationImplCopyWith<_$ContactCommunicationImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ContactAddress _$ContactAddressFromJson(Map<String, dynamic> json) {
  return _ContactAddress.fromJson(json);
}

/// @nodoc
mixin _$ContactAddress {
  String get address => throw _privateConstructorUsedError;
  String get address2 => throw _privateConstructorUsedError;
  String get address3 => throw _privateConstructorUsedError;
  String get postCode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  CountryCode? get countryCode => throw _privateConstructorUsedError;

  /// Serializes this ContactAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContactAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContactAddressCopyWith<ContactAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContactAddressCopyWith<$Res> {
  factory $ContactAddressCopyWith(
          ContactAddress value, $Res Function(ContactAddress) then) =
      _$ContactAddressCopyWithImpl<$Res, ContactAddress>;
  @useResult
  $Res call(
      {String address,
      String address2,
      String address3,
      String postCode,
      String city,
      String state,
      CountryCode? countryCode});

  $CountryCodeCopyWith<$Res>? get countryCode;
}

/// @nodoc
class _$ContactAddressCopyWithImpl<$Res, $Val extends ContactAddress>
    implements $ContactAddressCopyWith<$Res> {
  _$ContactAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContactAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? address2 = null,
    Object? address3 = null,
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
      address3: null == address3
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of ContactAddress
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
abstract class _$$ContactAddressImplCopyWith<$Res>
    implements $ContactAddressCopyWith<$Res> {
  factory _$$ContactAddressImplCopyWith(_$ContactAddressImpl value,
          $Res Function(_$ContactAddressImpl) then) =
      __$$ContactAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String address2,
      String address3,
      String postCode,
      String city,
      String state,
      CountryCode? countryCode});

  @override
  $CountryCodeCopyWith<$Res>? get countryCode;
}

/// @nodoc
class __$$ContactAddressImplCopyWithImpl<$Res>
    extends _$ContactAddressCopyWithImpl<$Res, _$ContactAddressImpl>
    implements _$$ContactAddressImplCopyWith<$Res> {
  __$$ContactAddressImplCopyWithImpl(
      _$ContactAddressImpl _value, $Res Function(_$ContactAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContactAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? address2 = null,
    Object? address3 = null,
    Object? postCode = null,
    Object? city = null,
    Object? state = null,
    Object? countryCode = freezed,
  }) {
    return _then(_$ContactAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      address2: null == address2
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String,
      address3: null == address3
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
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
class _$ContactAddressImpl extends _ContactAddress {
  const _$ContactAddressImpl(
      {required this.address,
      required this.address2,
      required this.address3,
      required this.postCode,
      required this.city,
      required this.state,
      required this.countryCode})
      : super._();

  factory _$ContactAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContactAddressImplFromJson(json);

  @override
  final String address;
  @override
  final String address2;
  @override
  final String address3;
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
    return 'ContactAddress(address: $address, address2: $address2, address3: $address3, postCode: $postCode, city: $city, state: $state, countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContactAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.address3, address3) ||
                other.address3 == address3) &&
            (identical(other.postCode, postCode) ||
                other.postCode == postCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, address2, address3,
      postCode, city, state, countryCode);

  /// Create a copy of ContactAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContactAddressImplCopyWith<_$ContactAddressImpl> get copyWith =>
      __$$ContactAddressImplCopyWithImpl<_$ContactAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContactAddressImplToJson(
      this,
    );
  }
}

abstract class _ContactAddress extends ContactAddress {
  const factory _ContactAddress(
      {required final String address,
      required final String address2,
      required final String address3,
      required final String postCode,
      required final String city,
      required final String state,
      required final CountryCode? countryCode}) = _$ContactAddressImpl;
  const _ContactAddress._() : super._();

  factory _ContactAddress.fromJson(Map<String, dynamic> json) =
      _$ContactAddressImpl.fromJson;

  @override
  String get address;
  @override
  String get address2;
  @override
  String get address3;
  @override
  String get postCode;
  @override
  String get city;
  @override
  String get state;
  @override
  CountryCode? get countryCode;

  /// Create a copy of ContactAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContactAddressImplCopyWith<_$ContactAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
