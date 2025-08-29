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

abstract class Deeplink implements _i1.SerializableModel {
  Deeplink._({
    this.id,
    required this.floatingWindowType,
    required this.primaryId,
    this.payload,
    required this.createdAt,
  });

  factory Deeplink({
    int? id,
    required String floatingWindowType,
    required int primaryId,
    String? payload,
    required DateTime createdAt,
  }) = _DeeplinkImpl;

  factory Deeplink.fromJson(Map<String, dynamic> jsonSerialization) {
    return Deeplink(
      id: jsonSerialization['id'] as int?,
      floatingWindowType: jsonSerialization['floatingWindowType'] as String,
      primaryId: jsonSerialization['primaryId'] as int,
      payload: jsonSerialization['payload'] as String?,
      createdAt:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String floatingWindowType;

  int primaryId;

  String? payload;

  DateTime createdAt;

  /// Returns a shallow copy of this [Deeplink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Deeplink copyWith({
    int? id,
    String? floatingWindowType,
    int? primaryId,
    String? payload,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'floatingWindowType': floatingWindowType,
      'primaryId': primaryId,
      if (payload != null) 'payload': payload,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DeeplinkImpl extends Deeplink {
  _DeeplinkImpl({
    int? id,
    required String floatingWindowType,
    required int primaryId,
    String? payload,
    required DateTime createdAt,
  }) : super._(
          id: id,
          floatingWindowType: floatingWindowType,
          primaryId: primaryId,
          payload: payload,
          createdAt: createdAt,
        );

  /// Returns a shallow copy of this [Deeplink]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Deeplink copyWith({
    Object? id = _Undefined,
    String? floatingWindowType,
    int? primaryId,
    Object? payload = _Undefined,
    DateTime? createdAt,
  }) {
    return Deeplink(
      id: id is int? ? id : this.id,
      floatingWindowType: floatingWindowType ?? this.floatingWindowType,
      primaryId: primaryId ?? this.primaryId,
      payload: payload is String? ? payload : this.payload,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
