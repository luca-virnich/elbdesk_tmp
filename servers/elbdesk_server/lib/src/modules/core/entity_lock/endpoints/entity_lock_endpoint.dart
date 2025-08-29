import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/app_user/endpoints/app_user_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/global_settings/endpoints/global_settings_endpoint.dart';
import 'package:elbdesk_server/src/modules/core/service_user/endpoints/service_user_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/app_client/app_client_handler.dart';
import 'package:elbdesk_server/src/modules/crm/app_client/endpoints/app_client_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/company_department/company_department_handler.dart';
import 'package:elbdesk_server/src/modules/crm/company_department/endpoints/company_department_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/company_employee/company_employee_handler.dart';
import 'package:elbdesk_server/src/modules/crm/company_employee/endpoints/company_employee_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/contact/endpoints/contact_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/country_code/endpoints/country_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/crm_event/crm_event_handler.dart';
import 'package:elbdesk_server/src/modules/crm/crm_event/endpoints/crm_event_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/customer/customer_handler.dart';
import 'package:elbdesk_server/src/modules/crm/customer/endpoints/customer_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/customer/endpoints/shipping_method_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/customer/shipping_method_handler.dart';
import 'package:elbdesk_server/src/modules/crm/department_code/department_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/department_code/endpoints/department_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/language_code/endpoints/language_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/language_code/language_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/payment_code/endpoints/payment_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/payment_code/payment_code_handler.dart';
import 'package:elbdesk_server/src/modules/crm/salutation_code/endpoints/salutation_code_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/salutation_code/salutation_code_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/endpoints/artwork_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork/endpoints/artwork_master_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine/endpoints/artwork_quarantine_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_quarantine_group/endpoints/artwork_quarantine_group_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_pre_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/artwork_template_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/endpoints/artwork_template_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/endpoints/artwork_template_pre_selection_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/artwork_template/endpoints/artwork_template_selection_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/color/endpoints/artwork_color_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/color_palette/endpoints/prepress_color_palette_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_pre_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/drucklayout_selection_handler.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/endpoints/drucklayout_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/endpoints/drucklayout_pre_selection_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/drucklayout/endpoints/drucklayout_selection_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/product/endpoints/product_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/product/endpoints/product_master_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_consulting/endpoints/soi_consulting_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_einzelformaufbau/endpoints/soi_einzelnutzenaufbau_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_prepare_artwork/endpoints/soi_prepare_artwork_endpoint.dart';
import 'package:elbdesk_server/src/modules/prepress/sales_order_item/soi_request_artwork_approval/endpoints/soi_request_artwork_approval_endpoint.dart';
import 'package:elbdesk_server/src/modules/sales/sales_order/endpoints/sales_order_endpoint.dart';
import 'package:serverpod/serverpod.dart';

/// Data Lock Endpoint
///
/// Manages the locked state of other objects
class EntityLockEndpoint extends Endpoint {
  // ensure that the user is logged in (serverpod functionality)
  @override
  bool get requireLogin => true;

  /// Release Entity Lock
  Future<void> releaseEntityLock(
    Session session,
    String entityType,
    int id,
  ) async {
    const hardReleaseId = 'hard-release';
    final tableType = TableType.values.byName(entityType);

    switch (tableType) {
      //CRM

      case TableType.contact:
        await ContactEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.contactPerson:
        return;
      case TableType.shippingMethod:
        await ShippingMethodHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.contactCompany:
        return;
      case TableType.customer:
        await CustomerHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );

      case TableType.companyEmployee:
        await CompanyEmployeeHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.companyDepartment:
        await CompanyDepartmentHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.departmentCode:
        await DepartmentCodeHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.crmEvent:
        await CrmEventHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );

      // Sales
      case TableType.salesOrder:
        await SalesOrderEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);

      // Sales Order Item
      case TableType.soiPrepareArtwork:
        await SoiPrepareArtworkEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.soiRequestArtworkApproval:
        await SoiRequestArtworkApprovalEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.soiEinzelformaufbau:
        await SoiEinzelformaufbauEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.soiStepAndRepeat:
        return;
      case TableType.soiConsulting:
        await SoiConsultingEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      // Product
      case TableType.artworkLog:
        return;
      case TableType.product:
        return ProductEndpoint().release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      // Users
      case TableType.appUser:
        await AppUserEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.serviceUser:
        await ServiceUserEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);

      // Prepress
      case TableType.bearer:
        return;
      case TableType.printLayout:
        return;
      case TableType.drucklayout:
        await DrucklayoutEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.drucklayoutPreSelection:
        await DrucklayoutPreSelectionHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.drucklayoutSelection:
        await DrucklayoutSelectionHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.artworkColor:
        await ArtworkColorEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.prepressColorPalette:
        await PrepressColorPaletteEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.productMaster:
        return;

      // Artwork
      case TableType.artwork:
        await ArtworkEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);

      case TableType.artworkTemplate:
        await ArtworkTemplateEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.artworkTemplatePreSelection:
        await ArtworkTemplatePreSelectionHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.artworkTemplateSelection:
        await ArtworkTemplateSelectionHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.artworkQuarantine:
        await ArtworkQuarantineEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.artworkQuarantineGroup:
        await ArtworkQuarantineGroupEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      // Core
      case TableType.migrationMatsPerson:
        return;
      case TableType.migrationMatsCompany:
        return;
      case TableType.serverpodLog:
        return;
      case TableType.flutterLog:
        return;
      case TableType.countryCode:
        await CountryCodeEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.languageCode:
        await LanguageCodeHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.paymentCode:
        await PaymentCodeHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.salutationCode:
        await SalutationCodeHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.appClient:
        await AppClientHandler.release(
          session,
          entityId: id,
          sessionId: hardReleaseId,
        );
      case TableType.jsonTemplate:
      case TableType.globalSettings:
        await GlobalSettingsEndpoint()
            .release(session, entityId: id, sessionId: hardReleaseId);
      case TableType.entityLog:
      case TableType.entityLock:
      // only helper table type
      case TableType.salesOrderByCustomer:
      case TableType.customerContact:
      case TableType.artworkMaster:
      case TableType.address:
      case TableType.customerContacts:
      case TableType.salesOrderStatus:
      case TableType.salesOrderItem:
      case TableType.customerColorSpec:
      case TableType.artworkLayer:
        return;
    }
  }

  Future<List<EntityLockDTO>> findEntityLocksByTableType(
    Session session, {
    required TableType tableType,
  }) async {
    return switch (tableType) {
      // CRM
      TableType.soiRequestArtworkApproval =>
        SoiRequestArtworkApprovalEndpoint().findEntityLocks(session),
      TableType.contact => ContactEndpoint().findEntityLocks(session),
      TableType.contactPerson => Future.value([]),
      TableType.contactCompany => Future.value([]),
      TableType.customer => CustomerEndpoint().findEntityLocks(session),
      TableType.customerContact => Future.value([]),
      TableType.address => Future.value([]),
      TableType.customerContacts => Future.value([]),
      TableType.shippingMethod =>
        ShippingMethodEndpoint().findEntityLocks(session),
      TableType.companyEmployee =>
        CompanyEmployeeEndpoint().findEntityLocks(session),
      TableType.companyDepartment =>
        CompanyDepartmentEndpoint().findEntityLocks(session),
      TableType.departmentCode =>
        DepartmentCodeEndpoint().findEntityLocks(session),
      TableType.crmEvent => CrmEventEndpoint().findEntityLocks(session),

      // Sales
      TableType.salesOrder => SalesOrderEndpoint().findEntityLocks(session),
      TableType.salesOrderStatus => Future.value([]),
      TableType.salesOrderItem => Future.value([]),

      // Sales Order Item
      TableType.soiPrepareArtwork =>
        SoiPrepareArtworkEndpoint().findEntityLocks(session),
      TableType.soiStepAndRepeat => Future.value([]),
      TableType.soiConsulting =>
        SoiConsultingEndpoint().findEntityLocks(session),
      TableType.soiEinzelformaufbau =>
        SoiEinzelformaufbauEndpoint().findEntityLocks(session),

      // Product
      TableType.product => ProductEndpoint().findEntityLocks(session),

      // Users
      TableType.appUser => AppUserEndpoint().findEntityLocks(session),
      TableType.serviceUser => ServiceUserEndpoint().findEntityLocks(session),

      // Prepress
      TableType.bearer => Future.value([]),
      TableType.printLayout => Future.value([]),
      TableType.artworkColor => ArtworkColorEndpoint().findEntityLocks(session),
      TableType.prepressColorPalette =>
        PrepressColorPaletteEndpoint().findEntityLocks(session),
      TableType.customerColorSpec => Future.value([]),
      TableType.productMaster =>
        ProductMasterEndpoint().findEntityLocks(session),
      TableType.drucklayout => DrucklayoutEndpoint().findEntityLocks(session),
      TableType.drucklayoutPreSelection =>
        DrucklayoutPreSelectionEndpoint().findEntityLocks(session),
      TableType.drucklayoutSelection =>
        DrucklayoutSelectionEndpoint().findEntityLocks(session),

      // Artwork
      TableType.artwork => ArtworkEndpoint().findEntityLocks(session),
      TableType.artworkMaster =>
        ArtworkMasterEndpoint().findEntityLocks(session),
      TableType.artworkTemplate =>
        ArtworkTemplateEndpoint().findEntityLocks(session),
      TableType.artworkTemplatePreSelection =>
        ArtworkTemplatePreSelectionEndpoint().findEntityLocks(session),
      TableType.artworkTemplateSelection =>
        ArtworkTemplateSelectionEndpoint().findEntityLocks(session),
      TableType.artworkQuarantine =>
        ArtworkQuarantineEndpoint().findEntityLocks(session),
      TableType.artworkQuarantineGroup =>
        ArtworkQuarantineGroupEndpoint().findEntityLocks(session),
      TableType.artworkLog => Future.value([]),
      TableType.artworkLayer => Future.value([]),

      // Core
      TableType.migrationMatsPerson => Future.value([]),
      TableType.migrationMatsCompany => Future.value([]),
      TableType.serverpodLog => Future.value([]),
      TableType.flutterLog => Future.value([]),
      TableType.entityLog => Future.value([]),
      TableType.entityLock => Future.value([]),
      TableType.countryCode => CountryCodeEndpoint().findEntityLocks(session),
      TableType.languageCode => LanguageCodeEndpoint().findEntityLocks(session),
      TableType.paymentCode => PaymentCodeEndpoint().findEntityLocks(session),
      TableType.salutationCode =>
        SalutationCodeEndpoint().findEntityLocks(session),
      TableType.appClient => AppClientEndpoint().findEntityLocks(session),
      TableType.salesOrderByCustomer => Future.value([]),
      TableType.jsonTemplate => Future.value([]),
      TableType.globalSettings =>
        GlobalSettingsEndpoint().findEntityLocks(session),
    };
  }

  /// Find All Entity Locks
  ///
  /// Returns all entity locks from the database
  Future<List<EntityLockDTO>> findAllEntityLocks(
    Session session,
  ) async {
    final locks = <EntityLockDTO>[];

    for (final tableType in TableType.values) {
      locks.addAll(
        await findEntityLocksByTableType(
          session,
          tableType: tableType,
        ),
      );
    }
    return locks;
  }
}
