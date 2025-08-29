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

enum AppScope implements _i1.SerializableModel {
  superAdmin,
  admin,
  appUser,
  serviceUser,
  entityLog,
  entityLock,
  countryCode,
  languageCode,
  paymentCode,
  salutationCode,
  appClient,
  jsonTemplate,
  crmAdmin,
  contact,
  contactPerson,
  contactCompany,
  customer,
  customerContact,
  customerContacts,
  address,
  companyEmployee,
  departmentCode,
  salesOrder,
  salesOrderStatus,
  salesOrderItem,
  soiPrepareArtwork,
  soiStepAndRepeat,
  mopAdmin,
  bearer,
  printLayout,
  prepressColorPalette,
  customerColorSpec,
  artwork,
  artworkMaster,
  artworkTemplate,
  artworkTemplatePreSelection,
  artworkTemplateSelection,
  artworkQuarantine,
  artworkLayer,
  artworkColor,
  artworkLog,
  product,
  productMaster,
  automationEngine;

  static AppScope fromJson(String name) {
    switch (name) {
      case 'superAdmin':
        return AppScope.superAdmin;
      case 'admin':
        return AppScope.admin;
      case 'appUser':
        return AppScope.appUser;
      case 'serviceUser':
        return AppScope.serviceUser;
      case 'entityLog':
        return AppScope.entityLog;
      case 'entityLock':
        return AppScope.entityLock;
      case 'countryCode':
        return AppScope.countryCode;
      case 'languageCode':
        return AppScope.languageCode;
      case 'paymentCode':
        return AppScope.paymentCode;
      case 'salutationCode':
        return AppScope.salutationCode;
      case 'appClient':
        return AppScope.appClient;
      case 'jsonTemplate':
        return AppScope.jsonTemplate;
      case 'crmAdmin':
        return AppScope.crmAdmin;
      case 'contact':
        return AppScope.contact;
      case 'contactPerson':
        return AppScope.contactPerson;
      case 'contactCompany':
        return AppScope.contactCompany;
      case 'customer':
        return AppScope.customer;
      case 'customerContact':
        return AppScope.customerContact;
      case 'customerContacts':
        return AppScope.customerContacts;
      case 'address':
        return AppScope.address;
      case 'companyEmployee':
        return AppScope.companyEmployee;
      case 'departmentCode':
        return AppScope.departmentCode;
      case 'salesOrder':
        return AppScope.salesOrder;
      case 'salesOrderStatus':
        return AppScope.salesOrderStatus;
      case 'salesOrderItem':
        return AppScope.salesOrderItem;
      case 'soiPrepareArtwork':
        return AppScope.soiPrepareArtwork;
      case 'soiStepAndRepeat':
        return AppScope.soiStepAndRepeat;
      case 'mopAdmin':
        return AppScope.mopAdmin;
      case 'bearer':
        return AppScope.bearer;
      case 'printLayout':
        return AppScope.printLayout;
      case 'prepressColorPalette':
        return AppScope.prepressColorPalette;
      case 'customerColorSpec':
        return AppScope.customerColorSpec;
      case 'artwork':
        return AppScope.artwork;
      case 'artworkMaster':
        return AppScope.artworkMaster;
      case 'artworkTemplate':
        return AppScope.artworkTemplate;
      case 'artworkTemplatePreSelection':
        return AppScope.artworkTemplatePreSelection;
      case 'artworkTemplateSelection':
        return AppScope.artworkTemplateSelection;
      case 'artworkQuarantine':
        return AppScope.artworkQuarantine;
      case 'artworkLayer':
        return AppScope.artworkLayer;
      case 'artworkColor':
        return AppScope.artworkColor;
      case 'artworkLog':
        return AppScope.artworkLog;
      case 'product':
        return AppScope.product;
      case 'productMaster':
        return AppScope.productMaster;
      case 'automationEngine':
        return AppScope.automationEngine;
      default:
        throw ArgumentError('Value "$name" cannot be converted to "AppScope"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
