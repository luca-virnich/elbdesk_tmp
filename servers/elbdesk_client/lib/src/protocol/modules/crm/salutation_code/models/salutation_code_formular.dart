/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../../../../modules/crm/language_code/models/language_code.dart' as _i2;
import '../../../../modules/crm/salutation_code/models/salutation_type.dart'
    as _i3;
import '../../../../modules/crm/contact/models/contact_field.dart' as _i4;

abstract class SalutationCodeFormularDTO implements _i1.SerializableModel {
  SalutationCodeFormularDTO._({
    this.id,
    required this.languageCodeId,
    this.languageCode,
    required this.salutationType,
    required this.salutation,
    required this.name1,
    required this.name2,
    required this.name3,
    required this.name4,
  });

  factory SalutationCodeFormularDTO({
    int? id,
    required int languageCodeId,
    _i2.LanguageCodeDTO? languageCode,
    required _i3.SalutationType salutationType,
    required String salutation,
    required _i4.ContactField name1,
    required _i4.ContactField name2,
    required _i4.ContactField name3,
    required _i4.ContactField name4,
  }) = _SalutationCodeFormularDTOImpl;

  factory SalutationCodeFormularDTO.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SalutationCodeFormularDTO(
      id: jsonSerialization['id'] as int?,
      languageCodeId: jsonSerialization['languageCodeId'] as int,
      languageCode: jsonSerialization['languageCode'] == null
          ? null
          : _i2.LanguageCodeDTO.fromJson(
              (jsonSerialization['languageCode'] as Map<String, dynamic>)),
      salutationType: _i3.SalutationType.fromJson(
          (jsonSerialization['salutationType'] as String)),
      salutation: jsonSerialization['salutation'] as String,
      name1: _i4.ContactField.fromJson((jsonSerialization['name1'] as String)),
      name2: _i4.ContactField.fromJson((jsonSerialization['name2'] as String)),
      name3: _i4.ContactField.fromJson((jsonSerialization['name3'] as String)),
      name4: _i4.ContactField.fromJson((jsonSerialization['name4'] as String)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int languageCodeId;

  _i2.LanguageCodeDTO? languageCode;

  _i3.SalutationType salutationType;

  String salutation;

  _i4.ContactField name1;

  _i4.ContactField name2;

  _i4.ContactField name3;

  _i4.ContactField name4;

  /// Returns a shallow copy of this [SalutationCodeFormularDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SalutationCodeFormularDTO copyWith({
    int? id,
    int? languageCodeId,
    _i2.LanguageCodeDTO? languageCode,
    _i3.SalutationType? salutationType,
    String? salutation,
    _i4.ContactField? name1,
    _i4.ContactField? name2,
    _i4.ContactField? name3,
    _i4.ContactField? name4,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'languageCodeId': languageCodeId,
      if (languageCode != null) 'languageCode': languageCode?.toJson(),
      'salutationType': salutationType.toJson(),
      'salutation': salutation,
      'name1': name1.toJson(),
      'name2': name2.toJson(),
      'name3': name3.toJson(),
      'name4': name4.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _SalutationCodeFormularDTOImpl extends SalutationCodeFormularDTO {
  _SalutationCodeFormularDTOImpl({
    int? id,
    required int languageCodeId,
    _i2.LanguageCodeDTO? languageCode,
    required _i3.SalutationType salutationType,
    required String salutation,
    required _i4.ContactField name1,
    required _i4.ContactField name2,
    required _i4.ContactField name3,
    required _i4.ContactField name4,
  }) : super._(
          id: id,
          languageCodeId: languageCodeId,
          languageCode: languageCode,
          salutationType: salutationType,
          salutation: salutation,
          name1: name1,
          name2: name2,
          name3: name3,
          name4: name4,
        );

  /// Returns a shallow copy of this [SalutationCodeFormularDTO]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SalutationCodeFormularDTO copyWith({
    Object? id = _Undefined,
    int? languageCodeId,
    Object? languageCode = _Undefined,
    _i3.SalutationType? salutationType,
    String? salutation,
    _i4.ContactField? name1,
    _i4.ContactField? name2,
    _i4.ContactField? name3,
    _i4.ContactField? name4,
  }) {
    return SalutationCodeFormularDTO(
      id: id is int? ? id : this.id,
      languageCodeId: languageCodeId ?? this.languageCodeId,
      languageCode: languageCode is _i2.LanguageCodeDTO?
          ? languageCode
          : this.languageCode?.copyWith(),
      salutationType: salutationType ?? this.salutationType,
      salutation: salutation ?? this.salutation,
      name1: name1 ?? this.name1,
      name2: name2 ?? this.name2,
      name3: name3 ?? this.name3,
      name4: name4 ?? this.name4,
    );
  }
}
