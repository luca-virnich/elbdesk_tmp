import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'elb_project_localizations_de.dart';
import 'elb_project_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ElbProjectLocalizations
/// returned by `ElbProjectLocalizations.of(context)`.
///
/// Applications need to include `ElbProjectLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/elb_project_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ElbProjectLocalizations.localizationsDelegates,
///   supportedLocales: ElbProjectLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ElbProjectLocalizations.supportedLocales
/// property.
abstract class ElbProjectLocalizations {
  ElbProjectLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ElbProjectLocalizations of(BuildContext context) {
    return Localizations.of<ElbProjectLocalizations>(
        context, ElbProjectLocalizations)!;
  }

  static const LocalizationsDelegate<ElbProjectLocalizations> delegate =
      _ElbProjectLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @floating_window_prefix_admin_service_users_table.
  ///
  /// In en, this message translates to:
  /// **'Service Accounts'**
  String get floating_window_prefix_admin_service_users_table;

  /// No description provided for @floating_window_prefix_admin_settings.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get floating_window_prefix_admin_settings;

  /// No description provided for @floating_window_prefix_admin_user_table.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get floating_window_prefix_admin_user_table;

  /// No description provided for @floating_window_prefix_all_soi_from_sales_order.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Items'**
  String get floating_window_prefix_all_soi_from_sales_order;

  /// No description provided for @floating_window_prefix_app_client.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get floating_window_prefix_app_client;

  /// No description provided for @floating_window_prefix_app_user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get floating_window_prefix_app_user;

  /// No description provided for @floating_window_prefix_artwork.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get floating_window_prefix_artwork;

  /// No description provided for @floating_window_prefix_artwork_quarantine.
  ///
  /// In en, this message translates to:
  /// **'Artwork Quarantine'**
  String get floating_window_prefix_artwork_quarantine;

  /// No description provided for @floating_window_prefix_artwork_quarantine_group.
  ///
  /// In en, this message translates to:
  /// **'Data Entry'**
  String get floating_window_prefix_artwork_quarantine_group;

  /// No description provided for @floating_window_prefix_artwork_quarantine_group_table.
  ///
  /// In en, this message translates to:
  /// **'Data Entries'**
  String get floating_window_prefix_artwork_quarantine_group_table;

  /// No description provided for @floating_window_prefix_artwork_template.
  ///
  /// In en, this message translates to:
  /// **'Artwork Template'**
  String get floating_window_prefix_artwork_template;

  /// No description provided for @floating_window_prefix_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get floating_window_prefix_color;

  /// No description provided for @floating_window_prefix_color_palette.
  ///
  /// In en, this message translates to:
  /// **'Color Palette'**
  String get floating_window_prefix_color_palette;

  /// No description provided for @floating_window_prefix_company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get floating_window_prefix_company;

  /// No description provided for @floating_window_prefix_company_department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get floating_window_prefix_company_department;

  /// No description provided for @floating_window_prefix_company_employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get floating_window_prefix_company_employee;

  /// No description provided for @floating_window_prefix_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get floating_window_prefix_contact;

  /// No description provided for @floating_window_prefix_contact_company_table.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get floating_window_prefix_contact_company_table;

  /// No description provided for @floating_window_prefix_contact_person_table.
  ///
  /// In en, this message translates to:
  /// **'Persons'**
  String get floating_window_prefix_contact_person_table;

  /// No description provided for @floating_window_prefix_crm_admin.
  ///
  /// In en, this message translates to:
  /// **'CRM Admin'**
  String get floating_window_prefix_crm_admin;

  /// No description provided for @floating_window_prefix_crm_event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get floating_window_prefix_crm_event;

  /// No description provided for @floating_window_prefix_crm_event_table.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get floating_window_prefix_crm_event_table;

  /// No description provided for @floating_window_prefix_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get floating_window_prefix_customer;

  /// No description provided for @floating_window_prefix_customer_table.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get floating_window_prefix_customer_table;

  /// No description provided for @floating_window_prefix_einzelformaufbau.
  ///
  /// In en, this message translates to:
  /// **'Single mold'**
  String get floating_window_prefix_einzelformaufbau;

  /// No description provided for @floating_window_prefix_entity_lock_table.
  ///
  /// In en, this message translates to:
  /// **'Locked Entities'**
  String get floating_window_prefix_entity_lock_table;

  /// No description provided for @floating_window_prefix_mop_admin.
  ///
  /// In en, this message translates to:
  /// **'MOP Admin'**
  String get floating_window_prefix_mop_admin;

  /// No description provided for @floating_window_prefix_person.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get floating_window_prefix_person;

  /// No description provided for @floating_window_prefix_print_layout.
  ///
  /// In en, this message translates to:
  /// **'Print Layout'**
  String get floating_window_prefix_print_layout;

  /// No description provided for @floating_window_prefix_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get floating_window_prefix_product;

  /// No description provided for @floating_window_prefix_product_master.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get floating_window_prefix_product_master;

  /// No description provided for @floating_window_prefix_product_table.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get floating_window_prefix_product_table;

  /// No description provided for @floating_window_prefix_sales_order.
  ///
  /// In en, this message translates to:
  /// **'Sales Order'**
  String get floating_window_prefix_sales_order;

  /// No description provided for @floating_window_prefix_sales_order_item_table.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Items'**
  String get floating_window_prefix_sales_order_item_table;

  /// No description provided for @floating_window_prefix_sales_order_table.
  ///
  /// In en, this message translates to:
  /// **'Sales Orders'**
  String get floating_window_prefix_sales_order_table;

  /// No description provided for @floating_window_prefix_service_user.
  ///
  /// In en, this message translates to:
  /// **'Service Account'**
  String get floating_window_prefix_service_user;

  /// No description provided for @floating_window_prefix_soi_consulting.
  ///
  /// In en, this message translates to:
  /// **'Consulting'**
  String get floating_window_prefix_soi_consulting;

  /// No description provided for @floating_window_prefix_soi_einzelformaufbau.
  ///
  /// In en, this message translates to:
  /// **'Single mold'**
  String get floating_window_prefix_soi_einzelformaufbau;

  /// No description provided for @floating_window_prefix_soi_prepare_artwork.
  ///
  /// In en, this message translates to:
  /// **'Prepare Artwork'**
  String get floating_window_prefix_soi_prepare_artwork;

  /// No description provided for @floating_window_prefix_soi_request_artwork_approval.
  ///
  /// In en, this message translates to:
  /// **'Artwork Approval'**
  String get floating_window_prefix_soi_request_artwork_approval;

  /// No description provided for @recent_window_app_user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get recent_window_app_user;

  /// No description provided for @recent_window_artwork.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get recent_window_artwork;

  /// No description provided for @recent_window_artwork_quarantine_group.
  ///
  /// In en, this message translates to:
  /// **'Data Entry'**
  String get recent_window_artwork_quarantine_group;

  /// No description provided for @recent_window_artwork_quarantine_group_table.
  ///
  /// In en, this message translates to:
  /// **'Data Entries'**
  String get recent_window_artwork_quarantine_group_table;

  /// No description provided for @recent_window_artwork_template.
  ///
  /// In en, this message translates to:
  /// **'Artwork Template'**
  String get recent_window_artwork_template;

  /// No description provided for @recent_window_company_department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get recent_window_company_department;

  /// No description provided for @recent_window_company_employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get recent_window_company_employee;

  /// No description provided for @recent_window_contact_company_table.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get recent_window_contact_company_table;

  /// No description provided for @recent_window_contact_person_table.
  ///
  /// In en, this message translates to:
  /// **'Persons'**
  String get recent_window_contact_person_table;

  /// No description provided for @recent_window_crm_event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get recent_window_crm_event;

  /// No description provided for @recent_window_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get recent_window_customer;

  /// No description provided for @recent_window_customer_table.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get recent_window_customer_table;

  /// No description provided for @recent_window_drucklayout.
  ///
  /// In en, this message translates to:
  /// **'Print Layout'**
  String get recent_window_drucklayout;

  /// No description provided for @recent_window_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get recent_window_product;

  /// No description provided for @recent_window_product_table.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get recent_window_product_table;

  /// No description provided for @recent_window_sales_order.
  ///
  /// In en, this message translates to:
  /// **'Sales Order'**
  String get recent_window_sales_order;

  /// No description provided for @recent_window_sales_order_item_table.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Items'**
  String get recent_window_sales_order_item_table;

  /// No description provided for @recent_window_sales_order_table.
  ///
  /// In en, this message translates to:
  /// **'Sales Orders'**
  String get recent_window_sales_order_table;

  /// No description provided for @recent_window_service_user.
  ///
  /// In en, this message translates to:
  /// **'Service Accounts'**
  String get recent_window_service_user;

  /// No description provided for @recent_window_soi_consulting.
  ///
  /// In en, this message translates to:
  /// **'Consulting'**
  String get recent_window_soi_consulting;

  /// No description provided for @recent_window_soi_prepare_artwork.
  ///
  /// In en, this message translates to:
  /// **'Prepare Artwork'**
  String get recent_window_soi_prepare_artwork;

  /// No description provided for @recent_window_soi_request_artwork_approval.
  ///
  /// In en, this message translates to:
  /// **'Artwork Approval'**
  String get recent_window_soi_request_artwork_approval;

  /// No description provided for @table_type_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get table_type_address;

  /// No description provided for @table_type_app_client.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get table_type_app_client;

  /// No description provided for @table_type_app_user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get table_type_app_user;

  /// No description provided for @table_type_artwork.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get table_type_artwork;

  /// No description provided for @table_type_artwork_color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get table_type_artwork_color;

  /// No description provided for @table_type_artwork_layer.
  ///
  /// In en, this message translates to:
  /// **'Artwork Layer'**
  String get table_type_artwork_layer;

  /// No description provided for @table_type_artwork_log.
  ///
  /// In en, this message translates to:
  /// **'Artwork Log'**
  String get table_type_artwork_log;

  /// No description provided for @table_type_artwork_master.
  ///
  /// In en, this message translates to:
  /// **'Artwork Master'**
  String get table_type_artwork_master;

  /// No description provided for @table_type_artwork_quarantine.
  ///
  /// In en, this message translates to:
  /// **'Artwork Quarantine'**
  String get table_type_artwork_quarantine;

  /// No description provided for @table_type_artwork_quarantine_group.
  ///
  /// In en, this message translates to:
  /// **'Data Entry'**
  String get table_type_artwork_quarantine_group;

  /// No description provided for @table_type_artwork_template.
  ///
  /// In en, this message translates to:
  /// **'Artwork Template'**
  String get table_type_artwork_template;

  /// No description provided for @table_type_artwork_template_pre_selection.
  ///
  /// In en, this message translates to:
  /// **'Artwork Template Pre-Selection'**
  String get table_type_artwork_template_pre_selection;

  /// No description provided for @table_type_artwork_template_selection.
  ///
  /// In en, this message translates to:
  /// **'Artwork Template Selection'**
  String get table_type_artwork_template_selection;

  /// No description provided for @table_type_bearer.
  ///
  /// In en, this message translates to:
  /// **'Bearer'**
  String get table_type_bearer;

  /// No description provided for @table_type_company_department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get table_type_company_department;

  /// No description provided for @table_type_company_employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get table_type_company_employee;

  /// No description provided for @table_type_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get table_type_contact;

  /// No description provided for @table_type_contact_company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get table_type_contact_company;

  /// No description provided for @table_type_contact_person.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get table_type_contact_person;

  /// No description provided for @table_type_country_code.
  ///
  /// In en, this message translates to:
  /// **'Country Code'**
  String get table_type_country_code;

  /// No description provided for @table_type_crm_event.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get table_type_crm_event;

  /// No description provided for @table_type_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get table_type_customer;

  /// No description provided for @table_type_customer_color_spec.
  ///
  /// In en, this message translates to:
  /// **'Color-Spec'**
  String get table_type_customer_color_spec;

  /// No description provided for @table_type_customer_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get table_type_customer_contact;

  /// No description provided for @table_type_customer_contacts.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get table_type_customer_contacts;

  /// No description provided for @table_type_department_code.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get table_type_department_code;

  /// No description provided for @table_type_drucklayout.
  ///
  /// In en, this message translates to:
  /// **'Print Layout'**
  String get table_type_drucklayout;

  /// No description provided for @table_type_drucklayout_pre_selection.
  ///
  /// In en, this message translates to:
  /// **'Print Layout Pre-Selection'**
  String get table_type_drucklayout_pre_selection;

  /// No description provided for @table_type_drucklayout_selection.
  ///
  /// In en, this message translates to:
  /// **'Print Layout Selection'**
  String get table_type_drucklayout_selection;

  /// No description provided for @table_type_entity_lock.
  ///
  /// In en, this message translates to:
  /// **'Entity Lock'**
  String get table_type_entity_lock;

  /// No description provided for @table_type_entity_log.
  ///
  /// In en, this message translates to:
  /// **'Log'**
  String get table_type_entity_log;

  /// No description provided for @table_type_flutter_log.
  ///
  /// In en, this message translates to:
  /// **'Flutter Log'**
  String get table_type_flutter_log;

  /// No description provided for @table_type_global_settings.
  ///
  /// In en, this message translates to:
  /// **'Global Settings'**
  String get table_type_global_settings;

  /// No description provided for @table_type_json_template.
  ///
  /// In en, this message translates to:
  /// **'Json Template'**
  String get table_type_json_template;

  /// No description provided for @table_type_language_code.
  ///
  /// In en, this message translates to:
  /// **'Language Code'**
  String get table_type_language_code;

  /// No description provided for @table_type_migration_mats_company.
  ///
  /// In en, this message translates to:
  /// **'Mats-Companies'**
  String get table_type_migration_mats_company;

  /// No description provided for @table_type_migration_mats_person.
  ///
  /// In en, this message translates to:
  /// **'Mats-Person'**
  String get table_type_migration_mats_person;

  /// No description provided for @table_type_payment_code.
  ///
  /// In en, this message translates to:
  /// **'Payment-Code'**
  String get table_type_payment_code;

  /// No description provided for @table_type_prepress_color_palette.
  ///
  /// In en, this message translates to:
  /// **'Color Palette'**
  String get table_type_prepress_color_palette;

  /// No description provided for @table_type_print_layout.
  ///
  /// In en, this message translates to:
  /// **'Print-Layout'**
  String get table_type_print_layout;

  /// No description provided for @table_type_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get table_type_product;

  /// No description provided for @table_type_product_master.
  ///
  /// In en, this message translates to:
  /// **'Product Master'**
  String get table_type_product_master;

  /// No description provided for @table_type_sales_order.
  ///
  /// In en, this message translates to:
  /// **'Sales Order'**
  String get table_type_sales_order;

  /// No description provided for @table_type_sales_order_by_customer.
  ///
  /// In en, this message translates to:
  /// **'Sales Order/Customer'**
  String get table_type_sales_order_by_customer;

  /// No description provided for @table_type_sales_order_item.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Item'**
  String get table_type_sales_order_item;

  /// No description provided for @table_type_sales_order_status.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Status'**
  String get table_type_sales_order_status;

  /// No description provided for @table_type_salutation_code.
  ///
  /// In en, this message translates to:
  /// **'Salutation Code'**
  String get table_type_salutation_code;

  /// No description provided for @table_type_serverpod_log.
  ///
  /// In en, this message translates to:
  /// **'Server Log'**
  String get table_type_serverpod_log;

  /// No description provided for @table_type_service_user.
  ///
  /// In en, this message translates to:
  /// **'Service Account'**
  String get table_type_service_user;

  /// No description provided for @table_type_shipping_method.
  ///
  /// In en, this message translates to:
  /// **'Shipping Method'**
  String get table_type_shipping_method;

  /// No description provided for @table_type_soi_consulting.
  ///
  /// In en, this message translates to:
  /// **'SOI Consulting'**
  String get table_type_soi_consulting;

  /// No description provided for @table_type_soi_einzelformaufbau.
  ///
  /// In en, this message translates to:
  /// **'SOI Single mold'**
  String get table_type_soi_einzelformaufbau;

  /// No description provided for @table_type_soi_prepare_artwork.
  ///
  /// In en, this message translates to:
  /// **'SOI Prepare Artwork'**
  String get table_type_soi_prepare_artwork;

  /// No description provided for @table_type_soi_request_artwork_approval.
  ///
  /// In en, this message translates to:
  /// **'SOI Artwork Approval'**
  String get table_type_soi_request_artwork_approval;

  /// No description provided for @table_type_soi_step_and_repeat.
  ///
  /// In en, this message translates to:
  /// **'SOI Step & Repeat'**
  String get table_type_soi_step_and_repeat;
}

class _ElbProjectLocalizationsDelegate
    extends LocalizationsDelegate<ElbProjectLocalizations> {
  const _ElbProjectLocalizationsDelegate();

  @override
  Future<ElbProjectLocalizations> load(Locale locale) {
    return SynchronousFuture<ElbProjectLocalizations>(
        lookupElbProjectLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ElbProjectLocalizationsDelegate old) => false;
}

ElbProjectLocalizations lookupElbProjectLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return ElbProjectLocalizationsDe();
    case 'en':
      return ElbProjectLocalizationsEn();
  }

  throw FlutterError(
      'ElbProjectLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
