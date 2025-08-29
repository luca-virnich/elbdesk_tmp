import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:project_core/l10n/elb_project_localizations.dart';

extension TableTypeExt on TableType {
  String readable(ElbProjectLocalizations l10n) {
    return switch (this) {
      TableType.address => l10n.table_type_address,
      TableType.appClient => l10n.table_type_app_client,
      TableType.appUser => l10n.table_type_app_user,
      TableType.artwork => l10n.table_type_artwork,
      TableType.artworkColor => l10n.table_type_artwork_color,
      TableType.artworkLayer => l10n.table_type_artwork_layer,
      TableType.artworkLog => l10n.table_type_artwork_log,
      TableType.artworkMaster => l10n.table_type_artwork_master,
      TableType.artworkQuarantine => l10n.table_type_artwork_quarantine,
      TableType.artworkQuarantineGroup =>
        l10n.table_type_artwork_quarantine_group,
      TableType.artworkTemplate => l10n.table_type_artwork_template,
      TableType.artworkTemplatePreSelection =>
        l10n.table_type_artwork_template_pre_selection,
      TableType.artworkTemplateSelection =>
        l10n.table_type_artwork_template_selection,
      TableType.bearer => l10n.table_type_bearer,
      TableType.companyDepartment => l10n.table_type_company_department,
      TableType.companyEmployee => l10n.table_type_company_employee,
      TableType.contact => l10n.table_type_contact,
      TableType.contactCompany => l10n.table_type_contact_company,
      TableType.contactPerson => l10n.table_type_contact_person,
      TableType.countryCode => l10n.table_type_country_code,
      TableType.crmEvent => l10n.table_type_crm_event,
      TableType.customer => l10n.table_type_customer,
      TableType.customerColorSpec => l10n.table_type_customer_color_spec,
      TableType.customerContact => l10n.table_type_customer_contact,
      TableType.customerContacts => l10n.table_type_customer_contacts,
      TableType.departmentCode => l10n.table_type_department_code,
      TableType.drucklayout => l10n.table_type_drucklayout,
      TableType.drucklayoutPreSelection =>
        l10n.table_type_drucklayout_pre_selection,
      TableType.drucklayoutSelection => l10n.table_type_drucklayout_selection,
      TableType.entityLock => l10n.table_type_entity_lock,
      TableType.entityLog => l10n.table_type_entity_log,
      TableType.flutterLog => l10n.table_type_flutter_log,
      TableType.globalSettings => l10n.table_type_global_settings,
      TableType.jsonTemplate => l10n.table_type_json_template,
      TableType.languageCode => l10n.table_type_language_code,
      TableType.migrationMatsCompany => l10n.table_type_migration_mats_company,
      TableType.migrationMatsPerson => l10n.table_type_migration_mats_person,
      TableType.paymentCode => l10n.table_type_payment_code,
      TableType.prepressColorPalette => l10n.table_type_prepress_color_palette,
      TableType.printLayout => l10n.table_type_print_layout,
      TableType.product => l10n.table_type_product,
      TableType.productMaster => l10n.table_type_product_master,
      TableType.salutationCode => l10n.table_type_salutation_code,
      TableType.salesOrder => l10n.table_type_sales_order,
      TableType.salesOrderByCustomer => l10n.table_type_sales_order_by_customer,
      TableType.salesOrderItem => l10n.table_type_sales_order_item,
      TableType.salesOrderStatus => l10n.table_type_sales_order_status,
      TableType.serverpodLog => l10n.table_type_serverpod_log,
      TableType.serviceUser => l10n.table_type_service_user,
      TableType.shippingMethod => l10n.table_type_shipping_method,
      TableType.soiConsulting => l10n.table_type_soi_consulting,
      TableType.soiEinzelformaufbau => l10n.table_type_soi_einzelformaufbau,
      TableType.soiPrepareArtwork => l10n.table_type_soi_prepare_artwork,
      TableType.soiRequestArtworkApproval =>
        l10n.table_type_soi_request_artwork_approval,
      TableType.soiStepAndRepeat => l10n.table_type_soi_step_and_repeat,
    };
  }
}
