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

enum TableType implements _i1.SerializableModel {
  contact,
  contactPerson,
  contactCompany,
  customer,
  customerContact,
  address,
  customerContacts,
  companyEmployee,
  companyDepartment,
  departmentCode,
  shippingMethod,
  crmEvent,
  salesOrder,
  salesOrderByCustomer,
  salesOrderStatus,
  salesOrderItem,
  soiPrepareArtwork,
  soiStepAndRepeat,
  soiConsulting,
  soiRequestArtworkApproval,
  soiEinzelformaufbau,
  appUser,
  serviceUser,
  bearer,
  printLayout,
  prepressColorPalette,
  customerColorSpec,
  drucklayout,
  drucklayoutPreSelection,
  drucklayoutSelection,
  artwork,
  artworkMaster,
  artworkTemplate,
  artworkTemplatePreSelection,
  artworkTemplateSelection,
  artworkQuarantine,
  artworkQuarantineGroup,
  artworkLayer,
  artworkColor,
  artworkLog,
  product,
  productMaster,
  entityLog,
  entityLock,
  countryCode,
  languageCode,
  paymentCode,
  salutationCode,
  appClient,
  jsonTemplate,
  globalSettings,
  migrationMatsPerson,
  migrationMatsCompany,
  serverpodLog,
  flutterLog;

  static TableType fromJson(String name) {
    switch (name) {
      case 'contact':
        return TableType.contact;
      case 'contactPerson':
        return TableType.contactPerson;
      case 'contactCompany':
        return TableType.contactCompany;
      case 'customer':
        return TableType.customer;
      case 'customerContact':
        return TableType.customerContact;
      case 'address':
        return TableType.address;
      case 'customerContacts':
        return TableType.customerContacts;
      case 'companyEmployee':
        return TableType.companyEmployee;
      case 'companyDepartment':
        return TableType.companyDepartment;
      case 'departmentCode':
        return TableType.departmentCode;
      case 'shippingMethod':
        return TableType.shippingMethod;
      case 'crmEvent':
        return TableType.crmEvent;
      case 'salesOrder':
        return TableType.salesOrder;
      case 'salesOrderByCustomer':
        return TableType.salesOrderByCustomer;
      case 'salesOrderStatus':
        return TableType.salesOrderStatus;
      case 'salesOrderItem':
        return TableType.salesOrderItem;
      case 'soiPrepareArtwork':
        return TableType.soiPrepareArtwork;
      case 'soiStepAndRepeat':
        return TableType.soiStepAndRepeat;
      case 'soiConsulting':
        return TableType.soiConsulting;
      case 'soiRequestArtworkApproval':
        return TableType.soiRequestArtworkApproval;
      case 'soiEinzelformaufbau':
        return TableType.soiEinzelformaufbau;
      case 'appUser':
        return TableType.appUser;
      case 'serviceUser':
        return TableType.serviceUser;
      case 'bearer':
        return TableType.bearer;
      case 'printLayout':
        return TableType.printLayout;
      case 'prepressColorPalette':
        return TableType.prepressColorPalette;
      case 'customerColorSpec':
        return TableType.customerColorSpec;
      case 'drucklayout':
        return TableType.drucklayout;
      case 'drucklayoutPreSelection':
        return TableType.drucklayoutPreSelection;
      case 'drucklayoutSelection':
        return TableType.drucklayoutSelection;
      case 'artwork':
        return TableType.artwork;
      case 'artworkMaster':
        return TableType.artworkMaster;
      case 'artworkTemplate':
        return TableType.artworkTemplate;
      case 'artworkTemplatePreSelection':
        return TableType.artworkTemplatePreSelection;
      case 'artworkTemplateSelection':
        return TableType.artworkTemplateSelection;
      case 'artworkQuarantine':
        return TableType.artworkQuarantine;
      case 'artworkQuarantineGroup':
        return TableType.artworkQuarantineGroup;
      case 'artworkLayer':
        return TableType.artworkLayer;
      case 'artworkColor':
        return TableType.artworkColor;
      case 'artworkLog':
        return TableType.artworkLog;
      case 'product':
        return TableType.product;
      case 'productMaster':
        return TableType.productMaster;
      case 'entityLog':
        return TableType.entityLog;
      case 'entityLock':
        return TableType.entityLock;
      case 'countryCode':
        return TableType.countryCode;
      case 'languageCode':
        return TableType.languageCode;
      case 'paymentCode':
        return TableType.paymentCode;
      case 'salutationCode':
        return TableType.salutationCode;
      case 'appClient':
        return TableType.appClient;
      case 'jsonTemplate':
        return TableType.jsonTemplate;
      case 'globalSettings':
        return TableType.globalSettings;
      case 'migrationMatsPerson':
        return TableType.migrationMatsPerson;
      case 'migrationMatsCompany':
        return TableType.migrationMatsCompany;
      case 'serverpodLog':
        return TableType.serverpodLog;
      case 'flutterLog':
        return TableType.flutterLog;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "TableType"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
