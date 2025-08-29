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
import '../../../../modules/crm/crm_event/models/crm_event.dart' as _i2;
import '../../../../modules/crm/contact/models/contact.dart' as _i3;

abstract class CrmEventContactJT implements _i1.SerializableModel {
  CrmEventContactJT._({
    this.id,
    required this.crmEventId,
    this.crmEvent,
    required this.contactId,
    this.contact,
    this.deletedAt,
  });

  factory CrmEventContactJT({
    int? id,
    required int crmEventId,
    _i2.CrmEventDTO? crmEvent,
    required int contactId,
    _i3.ContactDTO? contact,
    DateTime? deletedAt,
  }) = _CrmEventContactJTImpl;

  factory CrmEventContactJT.fromJson(Map<String, dynamic> jsonSerialization) {
    return CrmEventContactJT(
      id: jsonSerialization['id'] as int?,
      crmEventId: jsonSerialization['crmEventId'] as int,
      crmEvent: jsonSerialization['crmEvent'] == null
          ? null
          : _i2.CrmEventDTO.fromJson(
              (jsonSerialization['crmEvent'] as Map<String, dynamic>)),
      contactId: jsonSerialization['contactId'] as int,
      contact: jsonSerialization['contact'] == null
          ? null
          : _i3.ContactDTO.fromJson(
              (jsonSerialization['contact'] as Map<String, dynamic>)),
      deletedAt: jsonSerialization['deletedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['deletedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int crmEventId;

  _i2.CrmEventDTO? crmEvent;

  int contactId;

  _i3.ContactDTO? contact;

  DateTime? deletedAt;

  /// Returns a shallow copy of this [CrmEventContactJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  CrmEventContactJT copyWith({
    int? id,
    int? crmEventId,
    _i2.CrmEventDTO? crmEvent,
    int? contactId,
    _i3.ContactDTO? contact,
    DateTime? deletedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'crmEventId': crmEventId,
      if (crmEvent != null) 'crmEvent': crmEvent?.toJson(),
      'contactId': contactId,
      if (contact != null) 'contact': contact?.toJson(),
      if (deletedAt != null) 'deletedAt': deletedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CrmEventContactJTImpl extends CrmEventContactJT {
  _CrmEventContactJTImpl({
    int? id,
    required int crmEventId,
    _i2.CrmEventDTO? crmEvent,
    required int contactId,
    _i3.ContactDTO? contact,
    DateTime? deletedAt,
  }) : super._(
          id: id,
          crmEventId: crmEventId,
          crmEvent: crmEvent,
          contactId: contactId,
          contact: contact,
          deletedAt: deletedAt,
        );

  /// Returns a shallow copy of this [CrmEventContactJT]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  CrmEventContactJT copyWith({
    Object? id = _Undefined,
    int? crmEventId,
    Object? crmEvent = _Undefined,
    int? contactId,
    Object? contact = _Undefined,
    Object? deletedAt = _Undefined,
  }) {
    return CrmEventContactJT(
      id: id is int? ? id : this.id,
      crmEventId: crmEventId ?? this.crmEventId,
      crmEvent:
          crmEvent is _i2.CrmEventDTO? ? crmEvent : this.crmEvent?.copyWith(),
      contactId: contactId ?? this.contactId,
      contact: contact is _i3.ContactDTO? ? contact : this.contact?.copyWith(),
      deletedAt: deletedAt is DateTime? ? deletedAt : this.deletedAt,
    );
  }
}
