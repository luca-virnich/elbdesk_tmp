// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_floating_window_constraints_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SizeConverter _$SizeConverterFromJson(Map<String, dynamic> json) =>
    SizeConverter();

Map<String, dynamic> _$SizeConverterToJson(SizeConverter instance) =>
    <String, dynamic>{};

OffsetConverter _$OffsetConverterFromJson(Map<String, dynamic> json) =>
    OffsetConverter();

Map<String, dynamic> _$OffsetConverterToJson(OffsetConverter instance) =>
    <String, dynamic>{};

_$FloatingWindowConstraintsImpl _$$FloatingWindowConstraintsImplFromJson(
        Map<String, dynamic> json) =>
    _$FloatingWindowConstraintsImpl(
      type: $enumDecode(_$FloatingWindowTypeEnumMap, json['type']),
      size:
          const SizeConverter().fromJson(json['size'] as Map<String, dynamic>),
      position: const OffsetConverter()
          .fromJson(json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FloatingWindowConstraintsImplToJson(
        _$FloatingWindowConstraintsImpl instance) =>
    <String, dynamic>{
      'type': _$FloatingWindowTypeEnumMap[instance.type]!,
      'size': const SizeConverter().toJson(instance.size),
      'position': const OffsetConverter().toJson(instance.position),
    };

const _$FloatingWindowTypeEnumMap = {
  FloatingWindowType.contact: 'contact',
  FloatingWindowType.contactTable: 'contactTable',
  FloatingWindowType.customer: 'customer',
  FloatingWindowType.customerTable: 'customerTable',
  FloatingWindowType.companyEmployee: 'companyEmployee',
  FloatingWindowType.contactPersonTable: 'contactPersonTable',
  FloatingWindowType.contactCompanyTable: 'contactCompanyTable',
  FloatingWindowType.shippingMethodTable: 'shippingMethodTable',
  FloatingWindowType.departmentCodeTable: 'departmentCodeTable',
  FloatingWindowType.companyDepartment: 'companyDepartment',
  FloatingWindowType.crmEventTable: 'crmEventTable',
  FloatingWindowType.crmEvent: 'crmEvent',
  FloatingWindowType.salesOrder: 'salesOrder',
  FloatingWindowType.salesOrderStatusTable: 'salesOrderStatusTable',
  FloatingWindowType.salesOrderTable: 'salesOrderTable',
  FloatingWindowType.salesOrderItem: 'salesOrderItem',
  FloatingWindowType.salesOrderItemTable: 'salesOrderItemTable',
  FloatingWindowType.soiArtwork: 'soiArtwork',
  FloatingWindowType.soiConsulting: 'soiConsulting',
  FloatingWindowType.soiPrepareArtwork: 'soiPrepareArtwork',
  FloatingWindowType.soiRequestArtworkApproval: 'soiRequestArtworkApproval',
  FloatingWindowType.soiEinzelformaufbau: 'soiEinzelformaufbau',
  FloatingWindowType.allSoiFromSalesOrder: 'allSoiFromSalesOrder',
  FloatingWindowType.product: 'product',
  FloatingWindowType.productMaster: 'productMaster',
  FloatingWindowType.productTable: 'productTable',
  FloatingWindowType.productPart: 'productPart',
  FloatingWindowType.mopAdmin: 'mopAdmin',
  FloatingWindowType.crmAdmin: 'crmAdmin',
  FloatingWindowType.bearer: 'bearer',
  FloatingWindowType.printLayout: 'printLayout',
  FloatingWindowType.color: 'color',
  FloatingWindowType.colorPalette: 'colorPalette',
  FloatingWindowType.customerColorSpec: 'customerColorSpec',
  FloatingWindowType.ppLayer: 'ppLayer',
  FloatingWindowType.artwork: 'artwork',
  FloatingWindowType.artworkQuarantine: 'artworkQuarantine',
  FloatingWindowType.artworkQuarantineGroup: 'artworkQuarantineGroup',
  FloatingWindowType.artworkQuarantineGroupTable: 'artworkQuarantineGroupTable',
  FloatingWindowType.artworkTemplate: 'artworkTemplate',
  FloatingWindowType.prepressColorImport: 'prepressColorImport',
  FloatingWindowType.drucklayout: 'drucklayout',
  FloatingWindowType.appUser: 'appUser',
  FloatingWindowType.serviceUser: 'serviceUser',
  FloatingWindowType.countryCodeTable: 'countryCodeTable',
  FloatingWindowType.languageCodeTable: 'languageCodeTable',
  FloatingWindowType.paymentCodeTable: 'paymentCodeTable',
  FloatingWindowType.salutationCodeTable: 'salutationCodeTable',
  FloatingWindowType.appClient: 'appClient',
  FloatingWindowType.appClientTable: 'appClientTable',
  FloatingWindowType.jsonTemplateDesigner: 'jsonTemplateDesigner',
  FloatingWindowType.jsonTemplateTable: 'jsonTemplateTable',
  FloatingWindowType.adminSettings: 'adminSettings',
  FloatingWindowType.adminLog: 'adminLog',
  FloatingWindowType.flutterLog: 'flutterLog',
  FloatingWindowType.serverpodLog: 'serverpodLog',
  FloatingWindowType.adminUsersTable: 'adminUsersTable',
  FloatingWindowType.adminServiceUsersTable: 'adminServiceUsersTable',
  FloatingWindowType.adminEntityLockTable: 'adminEntityLockTable',
  FloatingWindowType.adminMigration: 'adminMigration',
  FloatingWindowType.developerOptions: 'developerOptions',
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cachedFloatingWindowConstraintsStateHash() =>
    r'72e446f75d380aa8ecd8f018cd45680db114bba3';

/// See also [CachedFloatingWindowConstraintsState].
@ProviderFor(CachedFloatingWindowConstraintsState)
final cachedFloatingWindowConstraintsStateProvider =
    AutoDisposeNotifierProvider<CachedFloatingWindowConstraintsState,
        List<FloatingWindowConstraints>>.internal(
  CachedFloatingWindowConstraintsState.new,
  name: r'cachedFloatingWindowConstraintsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cachedFloatingWindowConstraintsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CachedFloatingWindowConstraintsState
    = AutoDisposeNotifier<List<FloatingWindowConstraints>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
