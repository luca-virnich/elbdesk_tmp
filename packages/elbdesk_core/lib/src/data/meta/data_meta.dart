// ignore_for_file: avoid_dynamic_calls, constructor_docs

import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_meta.freezed.dart';
part 'data_meta.g.dart';

/// Data Meta
///
/// The Data Meta model is used to store metadata information about a database
/// object. This includes information about the creation, modification, and
/// deletion of the object. Mainly timestamps and userIds
///
/// The Data Meta model is used in all models that are stored in the database
///
@freezed
class DataMeta with _$DataMeta {
  /// Data Meta constructor
  const factory DataMeta({
    required int? id,
    required DateTime? createdAt,
    required DateTime? lastModifiedAt,
    required int? lastModifiedById,
    required bool isDraft,
    required String? editingSessionId,
    required int? createdById,
    required DateTime? editingSince,
    required int? editingById,
    required int? deletedById,
    required DateTime? deletedAt,

    // add user relation
  }) = _DataMeta;

  const DataMeta._();

  factory DataMeta.fromJson(Map<String, Object?> json) =>
      _$DataMetaFromJson(json);

  factory DataMeta.initial({bool isDraft = false}) => DataMeta(
        id: null,
        createdAt: DateTime.now(),
        isDraft: isDraft,
        lastModifiedAt: null,
        lastModifiedById: null,
        editingSessionId: null,
        createdById: null,
        editingSince: null,
        editingById: null,
        deletedById: null,
        deletedAt: null,
      );

  factory DataMeta.fromDTO(dynamic dto) {
    return DataMeta(
      id: dto.id! as int,
      createdAt: (dto.createdAt as DateTime?)?.toLocal(),
      isDraft: (dto.isDraft as bool?) ?? false,
      editingSessionId: dto.editingSession as String?,
      createdById: dto.createdById as int?,
      lastModifiedById: dto.lastModifiedById as int?,
      editingSince: (dto.editingSince as DateTime?)?.toLocal(),
      editingById: dto.editingById as int?,
      deletedById: dto.deletedById as int?,
      deletedAt: (dto.deletedAt as DateTime?)?.toLocal(),
      lastModifiedAt: (dto.lastModifiedAt as DateTime?)?.toLocal(),
    );
  }

  // Edit this to configure how the user Name is displayed inside of the
  // application

  /// Creator Name
  // String get createdByName => createdBy?.fullName ?? '';

  // /// Editor Name
  // String get editinyByName => editingBy?.fullName ?? '';

  // String get lastModifiedByName => lastModifiedBy?.fullName ?? '';

  /// Returns true if the object is blocked by another user
  /// This can also be the current user
  bool get isBlocked => editingSessionId != null;
}
