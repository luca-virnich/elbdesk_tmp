import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'migration_mats_person.freezed.dart';
part 'migration_mats_person.g.dart';

/// Migration Mats Person
///
/// Represents a person record imported from MATS system
@freezed
class MigrationMatsPerson with _$MigrationMatsPerson, HasMetaData {
  const factory MigrationMatsPerson({
    required MigrationMatsPersonData data,
    required bool isMigrated,
    required DataMeta meta,
  }) = _MigrationMatsPerson;

  factory MigrationMatsPerson.fromJson(Map<String, dynamic> json) =>
      _$MigrationMatsPersonFromJson(json);

  factory MigrationMatsPerson.initial() {
    return MigrationMatsPerson(
      data: MigrationMatsPersonData.initial(),
      isMigrated: false,
      meta: DataMeta.initial(),
    );
  }

  const MigrationMatsPerson._();

  factory MigrationMatsPerson.fromDTO(MigrationMatsPersonDTO dto) {
    return MigrationMatsPerson(
      isMigrated: dto.isMigrated,
      data: MigrationMatsPersonData(
        idContact: dto.idContact,
        nameFirst: dto.nameFirst,
        nameLast: dto.nameLast,
        anrede: dto.anrede,
        titel: dto.titel,
        department: dto.department,
        position: dto.position,
        anredeLang: dto.anredeLang,
        idAccount: dto.idAccount,
        primaryStreet1: dto.primaryStreet1,
        primaryStreet2: dto.primaryStreet2,
        primaryPostalCode: dto.primaryPostalCode,
        primaryCity: dto.primaryCity,
        primaryCountry: dto.primaryCountry,
        primaryState: dto.primaryState,
        telefon1: dto.telefon1,
        telefon2: dto.telefon2,
        mobilTelefon: dto.mobilTelefon,
        fax: dto.fax,
        email: dto.email,
        status: dto.status,
        wK: dto.wK,
        wWf: dto.wWf,
        wFp: dto.wFp,
        contactInfor: dto.contactInfor,
        isPerson: dto.isPerson,
      ),
      meta: DataMeta.fromDTO(dto),
    );
  }

  MigrationMatsPersonDTO toDTO() {
    return MigrationMatsPersonDTO(
      id: meta.id,
      idContact: data.idContact,
      nameFirst: data.nameFirst,
      nameLast: data.nameLast,
      anrede: data.anrede,
      titel: data.titel,
      department: data.department,
      position: data.position,
      anredeLang: data.anredeLang,
      idAccount: data.idAccount,
      primaryStreet1: data.primaryStreet1,
      primaryStreet2: data.primaryStreet2,
      primaryPostalCode: data.primaryPostalCode,
      primaryCity: data.primaryCity,
      primaryCountry: data.primaryCountry,
      primaryState: data.primaryState,
      telefon1: data.telefon1,
      telefon2: data.telefon2,
      mobilTelefon: data.mobilTelefon,
      fax: data.fax,
      email: data.email,
      status: data.status,
      wK: data.wK,
      wWf: data.wWf,
      wFp: data.wFp,
      contactInfor: data.contactInfor,
      isPerson: data.isPerson,
      isMigrated: isMigrated,
      createdAt: meta.createdAt!,
      createdById: meta.createdById,
      lastModifiedAt: meta.lastModifiedAt,
      lastModifiedById: meta.lastModifiedById,
      deletedAt: meta.deletedAt,
      deletedById: meta.deletedById,
      editingById: meta.editingById,
      editingSince: meta.editingSince,
      isDraft: meta.isDraft,
      editingSession: meta.editingSessionId,
    );
  }
}

@freezed
class MigrationMatsPersonData with _$MigrationMatsPersonData {
  const factory MigrationMatsPersonData({
    required String? idContact,
    required String? nameFirst,
    required String? nameLast,
    required String? anrede,
    required String? titel,
    required String? department,
    required String? position,
    required String? anredeLang,
    required String? idAccount,
    required String? primaryStreet1,
    required String? primaryStreet2,
    required String? primaryPostalCode,
    required String? primaryCity,
    required String? primaryCountry,
    required String? primaryState,
    required String? telefon1,
    required String? telefon2,
    required String? mobilTelefon,
    required String? fax,
    required String? email,
    required String? status,
    required String? wK,
    required String? wWf,
    required String? wFp,
    required String? contactInfor,
    required bool isPerson,
  }) = _MigrationMatsPersonData;

  const MigrationMatsPersonData._();

  factory MigrationMatsPersonData.fromJson(Map<String, dynamic> json) =>
      _$MigrationMatsPersonDataFromJson(json);

  factory MigrationMatsPersonData.initial() {
    return const MigrationMatsPersonData(
      idContact: '',
      nameFirst: '',
      nameLast: '',
      anrede: '',
      titel: '',
      department: '',
      position: '',
      anredeLang: '',
      idAccount: '',
      primaryStreet1: '',
      primaryStreet2: '',
      primaryPostalCode: '',
      primaryCity: '',
      primaryCountry: '',
      primaryState: '',
      telefon1: '',
      telefon2: '',
      mobilTelefon: '',
      fax: '',
      email: '',
      status: '',
      wK: '',
      wWf: '',
      wFp: '',
      contactInfor: '',
      isPerson: true,
    );
  }
}
