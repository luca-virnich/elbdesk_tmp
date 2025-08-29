import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'migration_mats_company.freezed.dart';
part 'migration_mats_company.g.dart';

/// Migration Mats Company
///
/// Represents a company record imported from MATS system
@freezed
class MigrationMatsCompany with _$MigrationMatsCompany, HasMetaData {
  const factory MigrationMatsCompany({
    required MigrationMatsCompanyData data,
    required bool isMigrated,
    required DataMeta meta,
  }) = _MigrationMatsCompany;

  factory MigrationMatsCompany.fromJson(Map<String, dynamic> json) =>
      _$MigrationMatsCompanyFromJson(json);

  factory MigrationMatsCompany.initial() {
    return MigrationMatsCompany(
      data: MigrationMatsCompanyData.initial(),
      isMigrated: false,
      meta: DataMeta.initial(),
    );
  }

  const MigrationMatsCompany._();

  factory MigrationMatsCompany.fromDTO(MigrationMatsCompanyDTO dto) {
    return MigrationMatsCompany(
      isMigrated: dto.isMigrated,
      data: MigrationMatsCompanyData(
        idAccount: dto.idAccount,
        account: dto.account,
        account2: dto.account2,
        idAramis: dto.idAramis,
        idStaff: dto.idStaff,
        idAvVerantw: dto.idAvVerantw,
        standort: dto.standort,
        shippingStreet1: dto.shippingStreet1,
        shippingStreet2: dto.shippingStreet2,
        shippingPostalCode: dto.shippingPostalCode,
        shippingCity: dto.shippingCity,
        shippingState: dto.shippingState,
        shippingCountry: dto.shippingCountry,
        phone1: dto.phone1,
        phone2: dto.phone2,
        fax: dto.fax,
        email: dto.email,
        website: dto.website,
      ),
      meta: DataMeta.fromDTO(dto),
    );
  }

  MigrationMatsCompanyDTO toDTO() {
    return MigrationMatsCompanyDTO(
      id: meta.id,
      idAccount: data.idAccount,
      account: data.account,
      account2: data.account2,
      idAramis: data.idAramis,
      idStaff: data.idStaff,
      idAvVerantw: data.idAvVerantw,
      standort: data.standort,
      shippingStreet1: data.shippingStreet1,
      shippingStreet2: data.shippingStreet2,
      shippingPostalCode: data.shippingPostalCode,
      shippingCity: data.shippingCity,
      shippingState: data.shippingState,
      shippingCountry: data.shippingCountry,
      phone1: data.phone1,
      phone2: data.phone2,
      fax: data.fax,
      email: data.email,
      website: data.website,
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
class MigrationMatsCompanyData with _$MigrationMatsCompanyData {
  const factory MigrationMatsCompanyData({
    required String? idAccount,
    required String? account,
    required String? account2,
    required String? idAramis,
    required String? idStaff,
    required String? idAvVerantw,
    required String? standort,
    required String? shippingStreet1,
    required String? shippingStreet2,
    required String? shippingPostalCode,
    required String? shippingCity,
    required String? shippingState,
    required String? shippingCountry,
    required String? phone1,
    required String? phone2,
    required String? fax,
    required String? email,
    required String? website,
  }) = _MigrationMatsCompanyData;

  const MigrationMatsCompanyData._();

  factory MigrationMatsCompanyData.fromJson(Map<String, dynamic> json) =>
      _$MigrationMatsCompanyDataFromJson(json);

  factory MigrationMatsCompanyData.initial() {
    return const MigrationMatsCompanyData(
      idAccount: '',
      account: '',
      account2: '',
      idAramis: '',
      idStaff: '',
      idAvVerantw: '',
      standort: '',
      shippingStreet1: '',
      shippingStreet2: '',
      shippingPostalCode: '',
      shippingCity: '',
      shippingState: '',
      shippingCountry: '',
      phone1: '',
      phone2: '',
      fax: '',
      email: '',
      website: '',
    );
  }
}
