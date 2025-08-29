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

enum ElbExceptionMessage implements _i1.SerializableModel {
  invalidSessionId,
  entityNotFound,
  modifiedByAnotherUser,
  alreadyDeleted,
  userNotAuthenticated,
  noPermissions,
  appUserFirstNameAndLastNameCannotBeEmpty,
  appUserInitialsAlreadyExists,
  appUserEmailAlreadyExists,
  appUserNameAlreadyExists,
  serviceUserServiceNameCannotBeEmpty,
  serviceUserServiceDescriptionCannotBeEmpty,
  serviceUserNameAlreadyExists,
  companyEmployeeAlreadyAssigned,
  contactAlreadyAssignedAsShippingAddress,
  customerAlreadyAssignedAsBillingAddress,
  customerOrContactNotFound,
  customerCustomerAlreadyAssigned,
  artworkAlreadyInSoiPrepareArtwork,
  prepareArtworkAlreadyAdded,
  artworkAlreadyInAnotherSalesOrder,
  artworkApprovalAlreadyAdded,
  dataImportAttachmentRemovalFailed,
  dataImportMultipleAttachmentsNotAllowed,
  dataImportFileProcessingFailed,
  dataImportFileCleanupFailed,
  dataImportFileAnalysisFailed,
  dataImportNoFileAccess,
  dataImportNoPermissionOutputFolder,
  invalidFileTypeOnlyPdfAndZip,
  invalidFileTypeOnlyZip,
  invalidFileTypeOnlyPdf,
  filePathAccess,
  fileOperationException,
  migrationAborted,
  serienIndexNotAvailable,
  artworkTemplateNotFound,
  productNotFound,
  productMasterNotFound,
  productMasterAlreadyInSalesOrder,
  artworkQuarantineNotFound,
  unfinishedArtworksFromProductInOtherSalesOrder;

  static ElbExceptionMessage fromJson(String name) {
    switch (name) {
      case 'invalidSessionId':
        return ElbExceptionMessage.invalidSessionId;
      case 'entityNotFound':
        return ElbExceptionMessage.entityNotFound;
      case 'modifiedByAnotherUser':
        return ElbExceptionMessage.modifiedByAnotherUser;
      case 'alreadyDeleted':
        return ElbExceptionMessage.alreadyDeleted;
      case 'userNotAuthenticated':
        return ElbExceptionMessage.userNotAuthenticated;
      case 'noPermissions':
        return ElbExceptionMessage.noPermissions;
      case 'appUserFirstNameAndLastNameCannotBeEmpty':
        return ElbExceptionMessage.appUserFirstNameAndLastNameCannotBeEmpty;
      case 'appUserInitialsAlreadyExists':
        return ElbExceptionMessage.appUserInitialsAlreadyExists;
      case 'appUserEmailAlreadyExists':
        return ElbExceptionMessage.appUserEmailAlreadyExists;
      case 'appUserNameAlreadyExists':
        return ElbExceptionMessage.appUserNameAlreadyExists;
      case 'serviceUserServiceNameCannotBeEmpty':
        return ElbExceptionMessage.serviceUserServiceNameCannotBeEmpty;
      case 'serviceUserServiceDescriptionCannotBeEmpty':
        return ElbExceptionMessage.serviceUserServiceDescriptionCannotBeEmpty;
      case 'serviceUserNameAlreadyExists':
        return ElbExceptionMessage.serviceUserNameAlreadyExists;
      case 'companyEmployeeAlreadyAssigned':
        return ElbExceptionMessage.companyEmployeeAlreadyAssigned;
      case 'contactAlreadyAssignedAsShippingAddress':
        return ElbExceptionMessage.contactAlreadyAssignedAsShippingAddress;
      case 'customerAlreadyAssignedAsBillingAddress':
        return ElbExceptionMessage.customerAlreadyAssignedAsBillingAddress;
      case 'customerOrContactNotFound':
        return ElbExceptionMessage.customerOrContactNotFound;
      case 'customerCustomerAlreadyAssigned':
        return ElbExceptionMessage.customerCustomerAlreadyAssigned;
      case 'artworkAlreadyInSoiPrepareArtwork':
        return ElbExceptionMessage.artworkAlreadyInSoiPrepareArtwork;
      case 'prepareArtworkAlreadyAdded':
        return ElbExceptionMessage.prepareArtworkAlreadyAdded;
      case 'artworkAlreadyInAnotherSalesOrder':
        return ElbExceptionMessage.artworkAlreadyInAnotherSalesOrder;
      case 'artworkApprovalAlreadyAdded':
        return ElbExceptionMessage.artworkApprovalAlreadyAdded;
      case 'dataImportAttachmentRemovalFailed':
        return ElbExceptionMessage.dataImportAttachmentRemovalFailed;
      case 'dataImportMultipleAttachmentsNotAllowed':
        return ElbExceptionMessage.dataImportMultipleAttachmentsNotAllowed;
      case 'dataImportFileProcessingFailed':
        return ElbExceptionMessage.dataImportFileProcessingFailed;
      case 'dataImportFileCleanupFailed':
        return ElbExceptionMessage.dataImportFileCleanupFailed;
      case 'dataImportFileAnalysisFailed':
        return ElbExceptionMessage.dataImportFileAnalysisFailed;
      case 'dataImportNoFileAccess':
        return ElbExceptionMessage.dataImportNoFileAccess;
      case 'dataImportNoPermissionOutputFolder':
        return ElbExceptionMessage.dataImportNoPermissionOutputFolder;
      case 'invalidFileTypeOnlyPdfAndZip':
        return ElbExceptionMessage.invalidFileTypeOnlyPdfAndZip;
      case 'invalidFileTypeOnlyZip':
        return ElbExceptionMessage.invalidFileTypeOnlyZip;
      case 'invalidFileTypeOnlyPdf':
        return ElbExceptionMessage.invalidFileTypeOnlyPdf;
      case 'filePathAccess':
        return ElbExceptionMessage.filePathAccess;
      case 'fileOperationException':
        return ElbExceptionMessage.fileOperationException;
      case 'migrationAborted':
        return ElbExceptionMessage.migrationAborted;
      case 'serienIndexNotAvailable':
        return ElbExceptionMessage.serienIndexNotAvailable;
      case 'artworkTemplateNotFound':
        return ElbExceptionMessage.artworkTemplateNotFound;
      case 'productNotFound':
        return ElbExceptionMessage.productNotFound;
      case 'productMasterNotFound':
        return ElbExceptionMessage.productMasterNotFound;
      case 'productMasterAlreadyInSalesOrder':
        return ElbExceptionMessage.productMasterAlreadyInSalesOrder;
      case 'artworkQuarantineNotFound':
        return ElbExceptionMessage.artworkQuarantineNotFound;
      case 'unfinishedArtworksFromProductInOtherSalesOrder':
        return ElbExceptionMessage
            .unfinishedArtworksFromProductInOtherSalesOrder;
      default:
        throw ArgumentError(
            'Value "$name" cannot be converted to "ElbExceptionMessage"');
    }
  }

  @override
  String toJson() => name;
  @override
  String toString() => name;
}
