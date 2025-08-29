import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_code.freezed.dart';
part 'country_code.g.dart';

@freezed
class CountryCode with _$CountryCode, HasMetaData {
  const factory CountryCode({
    required String code,
    required String name,
    required String isoCode,
    required int? numericIsoCode,
    required CountryCodeAddressFormat? addressFormat,
    required CountryCodeContactAddressFormat? contactAddressFormat,
    required bool showState,
    required bool isPrimary,
    required DataMeta meta,
    int? id,
    String? federalRegion,
    String? euCode,
    String? intrastatCode,
    String? taxScheme,
  }) = _CountryCode;

  const CountryCode._();

  factory CountryCode.fromJson(Map<String, Object?> json) =>
      _$CountryCodeFromJson(json);

  /// Creates a [CountryCode] from a [CountryCodeDTO]
  factory CountryCode.fromDTO(CountryCodeDTO dto) {
    final dataMeta = DataMeta.fromDTO(dto);
    return CountryCode(
      meta: dataMeta,
      id: dto.id,
      code: dto.code,
      name: dto.countryRegionName,
      isoCode: dto.isoCode,
      numericIsoCode: dto.numericCode,
      addressFormat: dto.addressFormat,
      contactAddressFormat: dto.contactAddressFormat,
      federalRegion: dto.federalRegion,
      euCode: dto.euCode,
      isPrimary: dto.isPrimary,
      intrastatCode: dto.intrastatCode,
      taxScheme: dto.taxScheme,
      showState: dto.showState,
    );
  }

  factory CountryCode.initial() => CountryCode(
        meta: DataMeta.initial(),
        code: '',
        name: '',
        isoCode: '',
        numericIsoCode: null,
        addressFormat: null,
        contactAddressFormat: null,
        showState: false,
        isPrimary: false,
      );

  CountryCodeDTO toDTO() => CountryCodeDTO(
        isPrimary: isPrimary,
        isDraft: meta.isDraft,
        showState: showState,
        code: code,
        countryRegionName: name,
        id: id,
        isoCode: isoCode,
        numericCode: numericIsoCode!,
        addressFormat: addressFormat!,
        contactAddressFormat: contactAddressFormat!,
        federalRegion: federalRegion,
        euCode: euCode,
        intrastatCode: intrastatCode,
        taxScheme: taxScheme,
        createdAt: meta.createdAt!,
      );
}
