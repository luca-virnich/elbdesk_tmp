import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/l10n/elb_project_localizations.dart';

enum FloatingWindowType {
  adminEntityLockTable(isTable: true, icon: AppIcons.entity_lock),
  adminLog(isTable: false, icon: AppIcons.admin_log),
  adminMigration(isTable: false, icon: AppIcons.admin_migration),
  adminServiceUsersTable(isTable: true, icon: Icons.person),
  adminSettings(
    isTable: false,
    icon: AppIcons.admin_settings,
  ),
  adminUsersTable(isTable: true, icon: AppIcons.appUser),
  allSoiFromSalesOrder(isTable: false, icon: AppIcons.salesOrderItem),
  appClient(isTable: false, icon: AppIcons.appClient),
  appUser(isTable: false, icon: AppIcons.appUser),
  artwork(isTable: false, icon: AppIcons.artwork),
  artworkQuarantineGroup(isTable: false, icon: AppIcons.artworkQuarantineGroup),
  artworkQuarantineGroupTable(isTable: true, icon: Icons.person),
  artworkTemplate(isTable: false, icon: AppIcons.artwork),
  color(isTable: false, icon: AppIcons.color),
  colorPalette(isTable: false, icon: AppIcons.color_palette),
  companyDepartment(isTable: false, icon: AppIcons.companyDepartment),
  companyEmployee(isTable: false, icon: AppIcons.employee),
  contactCompany(isTable: false, icon: AppIcons.company),
  contactCompanyTable(isTable: true, icon: AppIcons.company),
  contactPerson(isTable: false, icon: Icons.person),
  contactPersonTable(isTable: true, icon: AppIcons.group),
  crmAdmin(isTable: false, icon: AppIcons.crm_admin),
  crmEvent(isTable: false, icon: AppIcons.crm_event),
  customer(isTable: false, icon: AppIcons.customer),
  customerTable(isTable: true, icon: AppIcons.customer),
  developerOptions(isTable: false, icon: AppIcons.developer_options),
  drucklayout(isTable: false, icon: AppIcons.drucklayout),
  flutterLog(isTable: false, icon: AppIcons.flutter_log),
  mopAdmin(isTable: false, icon: AppIcons.mop_admin),
  product(isTable: false, icon: AppIcons.product),
  productMaster(isTable: false, icon: AppIcons.product),
  productTable(isTable: true, icon: AppIcons.product),
  salesOrder(isTable: false, icon: AppIcons.salesOrder),
  salesOrderItemTable(isTable: true, icon: AppIcons.salesOrderItem),
  salesOrderTable(isTable: true, icon: AppIcons.salesOrder),
  serverpodLog(isTable: false, icon: AppIcons.serverpod_log),
  serviceUser(isTable: false, icon: AppIcons.serviceUser),
  soiConsulting(isTable: false, icon: AppIcons.soiConsulting),
  soiEinzelformaufbau(isTable: false, icon: AppIcons.soiEinzelformaufbau),
  soiPrepareArtwork(isTable: false, icon: AppIcons.soiPrepareArtwork),
  soiRequestArtworkApproval(
      isTable: false, icon: AppIcons.soiRequestArtworkApproval);

  const FloatingWindowType({
    required this.isTable,
    required this.icon,
  });

  final bool isTable;
  final IconData icon;
}

extension FloatingWindowTypeExtension on FloatingWindowType {
  String recentWindowFilterReadable(ElbProjectLocalizations l10n) {
    return switch (this) {
      FloatingWindowType.contactPersonTable =>
        l10n.recent_window_contact_person_table,
      FloatingWindowType.contactCompanyTable =>
        l10n.recent_window_contact_company_table,
      FloatingWindowType.companyDepartment =>
        l10n.recent_window_company_department,
      FloatingWindowType.customer => l10n.recent_window_customer,
      FloatingWindowType.artworkTemplate => l10n.recent_window_artwork_template,
      FloatingWindowType.customerTable => l10n.recent_window_customer_table,
      FloatingWindowType.salesOrder => l10n.recent_window_sales_order,
      FloatingWindowType.companyEmployee => l10n.recent_window_company_employee,
      FloatingWindowType.artwork => l10n.recent_window_artwork,
      FloatingWindowType.artworkQuarantineGroup =>
        l10n.recent_window_artwork_quarantine_group,
      FloatingWindowType.artworkQuarantineGroupTable =>
        l10n.recent_window_artwork_quarantine_group_table,
      FloatingWindowType.drucklayout => l10n.recent_window_drucklayout,
      FloatingWindowType.product => l10n.recent_window_product,
      FloatingWindowType.productTable => l10n.recent_window_product_table,
      FloatingWindowType.appUser => l10n.recent_window_app_user,
      FloatingWindowType.serviceUser => l10n.recent_window_service_user,
      FloatingWindowType.salesOrderTable =>
        l10n.recent_window_sales_order_table,
      FloatingWindowType.salesOrderItemTable =>
        l10n.recent_window_sales_order_item_table,
      FloatingWindowType.soiPrepareArtwork =>
        l10n.recent_window_soi_prepare_artwork,
      FloatingWindowType.soiRequestArtworkApproval =>
        l10n.recent_window_soi_request_artwork_approval,
      FloatingWindowType.soiConsulting => l10n.recent_window_soi_consulting,
      FloatingWindowType.crmEvent => l10n.recent_window_crm_event,
      _ => '',
    };
  }

  String title(ElbProjectLocalizations l10n) {
    return switch (this) {
      // FloatingWindowType.contact => l10n.floating_window_prefix_contact,
      FloatingWindowType.contactPersonTable =>
        l10n.floating_window_prefix_contact_person_table,
      FloatingWindowType.contactCompanyTable =>
        l10n.floating_window_prefix_contact_company_table,
      FloatingWindowType.customer => l10n.floating_window_prefix_customer,
      FloatingWindowType.artworkTemplate =>
        l10n.floating_window_prefix_artwork_template,
      FloatingWindowType.customerTable =>
        l10n.floating_window_prefix_customer_table,
      FloatingWindowType.salesOrder => l10n.floating_window_prefix_sales_order,
      FloatingWindowType.companyEmployee =>
        l10n.floating_window_prefix_company_employee,
      FloatingWindowType.companyDepartment =>
        l10n.floating_window_prefix_company_department,
      FloatingWindowType.artwork => l10n.floating_window_prefix_artwork,
      FloatingWindowType.artworkQuarantineGroup =>
        l10n.floating_window_prefix_artwork_quarantine_group,
      FloatingWindowType.drucklayout =>
        l10n.floating_window_prefix_print_layout,
      FloatingWindowType.product => l10n.floating_window_prefix_product,
      FloatingWindowType.appUser => l10n.floating_window_prefix_app_user,
      FloatingWindowType.salesOrderTable =>
        l10n.floating_window_prefix_sales_order_table,
      FloatingWindowType.salesOrderItemTable =>
        l10n.floating_window_prefix_sales_order_item_table,
      FloatingWindowType.soiPrepareArtwork =>
        l10n.floating_window_prefix_soi_prepare_artwork,
      FloatingWindowType.soiRequestArtworkApproval =>
        l10n.floating_window_prefix_soi_request_artwork_approval,
      FloatingWindowType.soiEinzelformaufbau =>
        l10n.floating_window_prefix_soi_einzelformaufbau,
      FloatingWindowType.soiConsulting =>
        l10n.floating_window_prefix_soi_consulting,
      FloatingWindowType.crmEvent => l10n.floating_window_prefix_crm_event,
      FloatingWindowType.allSoiFromSalesOrder =>
        l10n.floating_window_prefix_all_soi_from_sales_order,
      FloatingWindowType.productMaster =>
        l10n.floating_window_prefix_product_master,
      FloatingWindowType.productTable =>
        l10n.floating_window_prefix_product_table,
      FloatingWindowType.mopAdmin => l10n.floating_window_prefix_mop_admin,
      FloatingWindowType.crmAdmin => l10n.floating_window_prefix_crm_admin,
      FloatingWindowType.color => l10n.floating_window_prefix_color,
      FloatingWindowType.colorPalette =>
        l10n.floating_window_prefix_color_palette,
      FloatingWindowType.artworkQuarantineGroupTable =>
        l10n.floating_window_prefix_artwork_quarantine_group_table,
      FloatingWindowType.appClient => l10n.floating_window_prefix_app_client,
      FloatingWindowType.adminSettings =>
        l10n.floating_window_prefix_admin_settings,
      FloatingWindowType.adminLog => 'Admin Log',
      FloatingWindowType.flutterLog => 'Flutter Log',
      FloatingWindowType.serverpodLog => 'Serverpod Log',
      FloatingWindowType.adminUsersTable =>
        l10n.floating_window_prefix_admin_user_table,
      FloatingWindowType.adminServiceUsersTable =>
        l10n.floating_window_prefix_admin_service_users_table,
      FloatingWindowType.adminEntityLockTable =>
        l10n.floating_window_prefix_entity_lock_table,
      FloatingWindowType.adminMigration => 'Migration',
      FloatingWindowType.developerOptions => 'Developer Options',
      FloatingWindowType.serviceUser =>
        l10n.floating_window_prefix_service_user,
      FloatingWindowType.contactPerson => l10n.floating_window_prefix_person,
      FloatingWindowType.contactCompany => l10n.floating_window_prefix_company,
    };
  }

  bool get isSupportedForRecentWindows {
    return supportedRecentWindowTypes.contains(this);
  }

  static List<FloatingWindowType> get supportedRecentWindowTypes => [
        ..._recentCrmWindowTypes,
        ..._recentPrepressWindowTypes,
        ..._recentSalesWindowTypes,
        ..._recentAdminWindowTypes,
        ..._superAdminWindowTypes,
      ];

  static List<FloatingWindowType> get recentCrmWindowTypes =>
      _recentCrmWindowTypes;
  static List<FloatingWindowType> get recentPrepressWindowTypes =>
      _recentPrepressWindowTypes;
  static List<FloatingWindowType> get recentSalesWindowTypes =>
      _recentSalesWindowTypes;
  static List<FloatingWindowType> get recentAdminWindowTypes =>
      _recentAdminWindowTypes;
  static List<FloatingWindowType> get superAdminWindowTypes =>
      _superAdminWindowTypes;

  static final List<FloatingWindowType> _recentCrmWindowTypes = [
    FloatingWindowType.contactPerson,
    FloatingWindowType.contactPersonTable,
    FloatingWindowType.contactCompany,
    FloatingWindowType.contactCompanyTable,
    FloatingWindowType.customer,
    FloatingWindowType.customerTable,
    FloatingWindowType.companyDepartment,
    FloatingWindowType.companyEmployee,
    FloatingWindowType.crmEvent,
  ];

  static final List<FloatingWindowType> _recentPrepressWindowTypes = [
    FloatingWindowType.artwork,
    FloatingWindowType.artworkTemplate,
    FloatingWindowType.product,
    FloatingWindowType.productTable,
    FloatingWindowType.artworkQuarantineGroup,
    FloatingWindowType.artworkQuarantineGroupTable,
    FloatingWindowType.drucklayout,
    FloatingWindowType.soiPrepareArtwork,
    FloatingWindowType.soiRequestArtworkApproval,
    FloatingWindowType.soiConsulting,
  ];

  static final List<FloatingWindowType> _recentSalesWindowTypes = [
    FloatingWindowType.salesOrder,
    FloatingWindowType.salesOrderTable,
    FloatingWindowType.salesOrderItemTable,
  ];

  static const List<FloatingWindowType> _recentAdminWindowTypes = [
    FloatingWindowType.appUser,
  ];
  static const List<FloatingWindowType> _superAdminWindowTypes = [
    FloatingWindowType.serviceUser,
  ];
}
