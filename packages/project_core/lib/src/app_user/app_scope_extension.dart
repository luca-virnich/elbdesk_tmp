import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

extension type AppScopeWrapper(AppScope scope) {
  /// Returns the readable name of the field
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      // Core
      AppScope.superAdmin => l10n.app_scope_super_admin,
      AppScope.admin => l10n.app_scope_admin,
      AppScope.appUser => l10n.app_scope_app_user,
      AppScope.serviceUser => l10n.app_scope_service_user,
      AppScope.entityLog => l10n.app_scope_entity_log,
      AppScope.entityLock => l10n.app_scope_entity_lock,
      AppScope.countryCode => l10n.app_scope_country_code,
      AppScope.languageCode => l10n.app_scope_language_code,
      AppScope.paymentCode => l10n.app_scope_payment_code,
      AppScope.salutationCode => l10n.app_scope_salutation_code,
      AppScope.appClient => l10n.app_scope_app_client,
      AppScope.jsonTemplate => l10n.app_scope_json_template,

      // CRM
      AppScope.crmAdmin => l10n.app_scope_crm_admin,
      AppScope.contact => l10n.app_scope_contact,
      AppScope.contactPerson => l10n.app_scope_contact_person,
      AppScope.contactCompany => l10n.app_scope_contact_company,
      AppScope.customer => l10n.app_scope_customer,
      AppScope.customerContact => l10n.app_scope_customer_contact,
      AppScope.customerContacts => l10n.app_scope_customer_contacts,
      AppScope.address => l10n.app_scope_address,
      AppScope.companyEmployee => l10n.app_scope_company_employee,
      AppScope.departmentCode => l10n.app_scope_department_code,

      // Sales
      AppScope.salesOrder => l10n.app_scope_sales_order,
      AppScope.salesOrderStatus => l10n.app_scope_sales_order_status,
      AppScope.salesOrderItem => l10n.app_scope_sales_order_item,

      // Sales Order Item
      AppScope.soiPrepareArtwork => l10n.app_scope_soi_prepare_artwork,
      AppScope.soiStepAndRepeat => l10n.app_scope_soi_step_and_repeat,

      // Prepress
      AppScope.mopAdmin => l10n.app_scope_mop_admin,
      AppScope.bearer => l10n.app_scope_bearer,
      AppScope.printLayout => l10n.app_scope_print_layout,
      AppScope.prepressColorPalette => l10n.app_scope_prepress_color_palette,
      AppScope.customerColorSpec => l10n.app_scope_customer_color_spec,

      // Artwork
      AppScope.artwork => l10n.app_scope_artwork,
      AppScope.artworkMaster => l10n.app_scope_artwork_master,
      AppScope.artworkTemplate => l10n.app_scope_artwork_template,
      AppScope.artworkTemplatePreSelection =>
        l10n.app_scope_artwork_template_pre_selection,
      AppScope.artworkTemplateSelection =>
        l10n.app_scope_artwork_template_selection,
      AppScope.artworkQuarantine => l10n.app_scope_artwork_quarantine,
      AppScope.artworkLayer => l10n.app_scope_artwork_layer,
      AppScope.artworkColor => l10n.app_scope_artwork_color,
      AppScope.artworkLog => l10n.app_scope_artwork_log,

      // Product
      AppScope.product => l10n.app_scope_product,
      AppScope.productMaster => l10n.app_scope_product_master,
      AppScope.automationEngine => l10n.app_scope_automation_engine,
    };
  }

  /// Returns the description of the field
  String description(ElbCoreLocalizations l10n) {
    return switch (this) {
      // Core
      AppScope.superAdmin => l10n.app_scope_super_admin_description,
      AppScope.admin => l10n.app_scope_admin_description,
      AppScope.appUser => l10n.app_scope_app_user_description,
      AppScope.serviceUser => l10n.app_scope_service_user_description,
      AppScope.entityLog => l10n.app_scope_entity_log_description,
      AppScope.entityLock => l10n.app_scope_entity_lock_description,
      AppScope.countryCode => l10n.app_scope_country_code_description,
      AppScope.languageCode => l10n.app_scope_language_code_description,
      AppScope.paymentCode => l10n.app_scope_payment_code_description,
      AppScope.salutationCode => l10n.app_scope_salutation_code_description,
      AppScope.appClient => l10n.app_scope_app_client_description,
      AppScope.jsonTemplate => l10n.app_scope_json_template_description,

      // CRM
      AppScope.crmAdmin => l10n.app_scope_crm_admin_description,
      AppScope.contact => l10n.app_scope_contact_description,
      AppScope.contactPerson => l10n.app_scope_contact_person_description,
      AppScope.contactCompany => l10n.app_scope_contact_company_description,
      AppScope.customer => l10n.app_scope_customer_description,
      AppScope.customerContact => l10n.app_scope_customer_contact_description,
      AppScope.customerContacts => l10n.app_scope_customer_contacts_description,
      AppScope.address => l10n.app_scope_address_description,
      AppScope.companyEmployee => l10n.app_scope_company_employee_description,
      AppScope.departmentCode => l10n.app_scope_department_code_description,

      // Sales
      AppScope.salesOrder => l10n.app_scope_sales_order_description,
      AppScope.salesOrderStatus =>
        l10n.app_scope_sales_order_status_description,
      AppScope.salesOrderItem => l10n.app_scope_sales_order_item_description,

      // Sales Order Item
      AppScope.soiPrepareArtwork =>
        l10n.app_scope_soi_prepare_artwork_description,
      AppScope.soiStepAndRepeat =>
        l10n.app_scope_soi_step_and_repeat_description,

      // Prepress
      AppScope.mopAdmin => l10n.app_scope_mop_admin_description,
      AppScope.bearer => l10n.app_scope_bearer_description,
      AppScope.printLayout => l10n.app_scope_print_layout_description,
      AppScope.prepressColorPalette =>
        l10n.app_scope_prepress_color_palette_description,
      AppScope.customerColorSpec =>
        l10n.app_scope_customer_color_spec_description,

      // Artwork
      AppScope.artwork => l10n.app_scope_artwork_description,
      AppScope.artworkMaster => l10n.app_scope_artwork_master_description,
      AppScope.artworkTemplate => l10n.app_scope_artwork_template_description,
      AppScope.artworkTemplatePreSelection =>
        l10n.app_scope_artwork_template_pre_selection_description,
      AppScope.artworkTemplateSelection =>
        l10n.app_scope_artwork_template_selection_description,
      AppScope.artworkQuarantine =>
        l10n.app_scope_artwork_quarantine_description,
      AppScope.artworkLayer => l10n.app_scope_artwork_layer_description,
      AppScope.artworkColor => l10n.app_scope_artwork_color_description,
      AppScope.artworkLog => l10n.app_scope_artwork_log_description,

      // Product
      AppScope.product => l10n.app_scope_product_description,
      AppScope.productMaster => l10n.app_scope_product_master_description,
      AppScope.automationEngine => l10n.app_scope_automation_engine_description,
    };
  }
}
