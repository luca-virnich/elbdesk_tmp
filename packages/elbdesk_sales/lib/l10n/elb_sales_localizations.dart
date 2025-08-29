import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'elb_sales_localizations_de.dart';
import 'elb_sales_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ElbSalesLocalizations
/// returned by `ElbSalesLocalizations.of(context)`.
///
/// Applications need to include `ElbSalesLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/elb_sales_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ElbSalesLocalizations.localizationsDelegates,
///   supportedLocales: ElbSalesLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ElbSalesLocalizations.supportedLocales
/// property.
abstract class ElbSalesLocalizations {
  ElbSalesLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ElbSalesLocalizations of(BuildContext context) {
    return Localizations.of<ElbSalesLocalizations>(
        context, ElbSalesLocalizations)!;
  }

  static const LocalizationsDelegate<ElbSalesLocalizations> delegate =
      _ElbSalesLocalizationsDelegate();

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

  /// No description provided for @assigned_employee.
  ///
  /// In en, this message translates to:
  /// **'Assigned Employee'**
  String get assigned_employee;

  /// No description provided for @crm_customer_contact_person.
  ///
  /// In en, this message translates to:
  /// **'Contact Person'**
  String get crm_customer_contact_person;

  /// No description provided for @crm_customer_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer\'s Customer'**
  String get crm_customer_customer;

  /// No description provided for @crm_customer_customer_contact_person.
  ///
  /// In en, this message translates to:
  /// **'Contact person customer customer'**
  String get crm_customer_customer_contact_person;

  /// No description provided for @crm_customer_shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get crm_customer_shipping_address;

  /// No description provided for @customer_id.
  ///
  /// In en, this message translates to:
  /// **'Customer ID'**
  String get customer_id;

  /// No description provided for @customer_sales_order_first_ref.
  ///
  /// In en, this message translates to:
  /// **'1. Reference'**
  String get customer_sales_order_first_ref;

  /// No description provided for @customer_sales_order_second_ref.
  ///
  /// In en, this message translates to:
  /// **'2. Reference'**
  String get customer_sales_order_second_ref;

  /// No description provided for @customer_singular.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer_singular;

  /// No description provided for @prepress_artwork_approval_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get prepress_artwork_approval_type;

  /// No description provided for @prepress_artwork_approval_type_digital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get prepress_artwork_approval_type_digital;

  /// No description provided for @prepress_artwork_approval_type_proof.
  ///
  /// In en, this message translates to:
  /// **'Proof/Analog'**
  String get prepress_artwork_approval_type_proof;

  /// No description provided for @prepress_artwork_listview_soi.
  ///
  /// In en, this message translates to:
  /// **'Listview artwork-soi'**
  String get prepress_artwork_listview_soi;

  /// No description provided for @prepress_artwork_plural.
  ///
  /// In en, this message translates to:
  /// **'Artworks'**
  String get prepress_artwork_plural;

  /// No description provided for @prepress_artwork_quarantine_group_plural.
  ///
  /// In en, this message translates to:
  /// **'Data Imports'**
  String get prepress_artwork_quarantine_group_plural;

  /// No description provided for @prepress_artwork_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get prepress_artwork_singular;

  /// No description provided for @prepress_drucklayout_choose_existing.
  ///
  /// In en, this message translates to:
  /// **'Choose an existing Printlayout'**
  String get prepress_drucklayout_choose_existing;

  /// No description provided for @prepress_drucklayout_none_existing.
  ///
  /// In en, this message translates to:
  /// **'No Printlayouts found for this customer'**
  String get prepress_drucklayout_none_existing;

  /// No description provided for @prepress_prepare_artwork.
  ///
  /// In en, this message translates to:
  /// **'Prepare Artwork'**
  String get prepress_prepare_artwork;

  /// No description provided for @prepress_prepare_artwork_short.
  ///
  /// In en, this message translates to:
  /// **'Prepare'**
  String get prepress_prepare_artwork_short;

  /// No description provided for @prepress_product_keywords.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get prepress_product_keywords;

  /// No description provided for @sales_associated_products.
  ///
  /// In en, this message translates to:
  /// **'Associated Products'**
  String get sales_associated_products;

  /// No description provided for @sales_order_add_customer.
  ///
  /// In en, this message translates to:
  /// **'Add Customer'**
  String get sales_order_add_customer;

  /// No description provided for @sales_order_assigned_user.
  ///
  /// In en, this message translates to:
  /// **'Assigned Employee'**
  String get sales_order_assigned_user;

  /// No description provided for @sales_order_assigned_user_id.
  ///
  /// In en, this message translates to:
  /// **'Employee ID'**
  String get sales_order_assigned_user_id;

  /// No description provided for @sales_order_billing_address.
  ///
  /// In en, this message translates to:
  /// **'Billing address'**
  String get sales_order_billing_address;

  /// No description provided for @sales_order_create_soi.
  ///
  /// In en, this message translates to:
  /// **'Create soi'**
  String get sales_order_create_soi;

  /// No description provided for @sales_order_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get sales_order_customer;

  /// No description provided for @sales_order_customer_customer_ref.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get sales_order_customer_customer_ref;

  /// No description provided for @sales_order_customer_id.
  ///
  /// In en, this message translates to:
  /// **'Customer ID'**
  String get sales_order_customer_id;

  /// No description provided for @sales_order_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get sales_order_description;

  /// No description provided for @sales_order_general_sois.
  ///
  /// In en, this message translates to:
  /// **'General sales order items'**
  String get sales_order_general_sois;

  /// No description provided for @sales_order_hints.
  ///
  /// In en, this message translates to:
  /// **'Sales Order hints'**
  String get sales_order_hints;

  /// No description provided for @sales_order_id_and_description.
  ///
  /// In en, this message translates to:
  /// **'ID / Description'**
  String get sales_order_id_and_description;

  /// No description provided for @sales_order_item_assets.
  ///
  /// In en, this message translates to:
  /// **'Assets'**
  String get sales_order_item_assets;

  /// No description provided for @sales_order_item_assigned_user.
  ///
  /// In en, this message translates to:
  /// **'Assigned Employee'**
  String get sales_order_item_assigned_user;

  /// No description provided for @sales_order_item_deadline.
  ///
  /// In en, this message translates to:
  /// **'Deadline'**
  String get sales_order_item_deadline;

  /// No description provided for @sales_order_item_eye_c.
  ///
  /// In en, this message translates to:
  /// **'EyeC'**
  String get sales_order_item_eye_c;

  /// No description provided for @sales_order_item_eye_c_state_done.
  ///
  /// In en, this message translates to:
  /// **'EyeC done'**
  String get sales_order_item_eye_c_state_done;

  /// No description provided for @sales_order_item_eye_c_state_needed.
  ///
  /// In en, this message translates to:
  /// **'EyeC needed'**
  String get sales_order_item_eye_c_state_needed;

  /// No description provided for @sales_order_item_eye_c_state_none.
  ///
  /// In en, this message translates to:
  /// **'EyeC not needed'**
  String get sales_order_item_eye_c_state_none;

  /// No description provided for @sales_order_item_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sales_order_item_name;

  /// No description provided for @sales_order_item_new.
  ///
  /// In en, this message translates to:
  /// **'New Sales Order Item'**
  String get sales_order_item_new;

  /// No description provided for @sales_order_item_open_parent.
  ///
  /// In en, this message translates to:
  /// **'Open related SalesOrder'**
  String get sales_order_item_open_parent;

  /// No description provided for @sales_order_item_parent_of.
  ///
  /// In en, this message translates to:
  /// **'of'**
  String get sales_order_item_parent_of;

  /// No description provided for @sales_order_item_planned_date.
  ///
  /// In en, this message translates to:
  /// **'Goal date'**
  String get sales_order_item_planned_date;

  /// No description provided for @sales_order_item_planned_time.
  ///
  /// In en, this message translates to:
  /// **'Planned Time'**
  String get sales_order_item_planned_time;

  /// No description provided for @sales_order_item_plural.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Items'**
  String get sales_order_item_plural;

  /// No description provided for @sales_order_item_product_parts.
  ///
  /// In en, this message translates to:
  /// **'Product Parts'**
  String get sales_order_item_product_parts;

  /// No description provided for @sales_order_item_sales_order_id.
  ///
  /// In en, this message translates to:
  /// **'Sales Order ID'**
  String get sales_order_item_sales_order_id;

  /// No description provided for @sales_order_item_singular.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Item'**
  String get sales_order_item_singular;

  /// No description provided for @sales_order_item_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get sales_order_item_status;

  /// No description provided for @sales_order_item_table.
  ///
  /// In en, this message translates to:
  /// **'Sales Order Item table'**
  String get sales_order_item_table;

  /// No description provided for @sales_order_item_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get sales_order_item_type;

  /// No description provided for @sales_order_item_type_artwork.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get sales_order_item_type_artwork;

  /// No description provided for @sales_order_item_type_cliche_production.
  ///
  /// In en, this message translates to:
  /// **'Cliche Production'**
  String get sales_order_item_type_cliche_production;

  /// No description provided for @sales_order_item_type_file_prep.
  ///
  /// In en, this message translates to:
  /// **'File Preparation'**
  String get sales_order_item_type_file_prep;

  /// No description provided for @sales_order_item_type_none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get sales_order_item_type_none;

  /// No description provided for @sales_order_item_type_proof_creation.
  ///
  /// In en, this message translates to:
  /// **'Proof Creation'**
  String get sales_order_item_type_proof_creation;

  /// No description provided for @sales_order_item_work_instructions.
  ///
  /// In en, this message translates to:
  /// **'Work instructions'**
  String get sales_order_item_work_instructions;

  /// No description provided for @sales_order_keyword.
  ///
  /// In en, this message translates to:
  /// **'Keyword'**
  String get sales_order_keyword;

  /// No description provided for @sales_order_keywords.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get sales_order_keywords;

  /// No description provided for @sales_order_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get sales_order_name;

  /// No description provided for @sales_order_new.
  ///
  /// In en, this message translates to:
  /// **'New Sales Order'**
  String get sales_order_new;

  /// No description provided for @sales_order_order_date.
  ///
  /// In en, this message translates to:
  /// **'Order Date'**
  String get sales_order_order_date;

  /// No description provided for @sales_order_order_number.
  ///
  /// In en, this message translates to:
  /// **'Order number'**
  String get sales_order_order_number;

  /// No description provided for @sales_order_order_number_coe.
  ///
  /// In en, this message translates to:
  /// **'Order number (coe)'**
  String get sales_order_order_number_coe;

  /// No description provided for @sales_order_order_number_customer.
  ///
  /// In en, this message translates to:
  /// **'Order number (customer)'**
  String get sales_order_order_number_customer;

  /// No description provided for @sales_order_plural.
  ///
  /// In en, this message translates to:
  /// **'Sales Orders'**
  String get sales_order_plural;

  /// No description provided for @sales_order_product_plural.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get sales_order_product_plural;

  /// No description provided for @sales_order_singular.
  ///
  /// In en, this message translates to:
  /// **'Sales Order'**
  String get sales_order_singular;

  /// No description provided for @sales_order_soi_already_created.
  ///
  /// In en, this message translates to:
  /// **'Sales order item already created'**
  String get sales_order_soi_already_created;

  /// No description provided for @sales_order_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get sales_order_status;

  /// No description provided for @sales_order_status_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get sales_order_status_description;

  /// No description provided for @sales_order_status_plural.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get sales_order_status_plural;

  /// No description provided for @sales_order_status_singular.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get sales_order_status_singular;

  /// No description provided for @sales_order_table.
  ///
  /// In en, this message translates to:
  /// **'Sales Order table'**
  String get sales_order_table;

  /// No description provided for @sales_prepare_artwork_status_canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get sales_prepare_artwork_status_canceled;

  /// No description provided for @sales_prepare_artwork_status_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get sales_prepare_artwork_status_completed;

  /// No description provided for @sales_prepare_artwork_status_data_entry.
  ///
  /// In en, this message translates to:
  /// **'Data Entry'**
  String get sales_prepare_artwork_status_data_entry;

  /// No description provided for @sales_prepare_artwork_status_in_progress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get sales_prepare_artwork_status_in_progress;

  /// No description provided for @sales_prepare_artwork_status_in_review.
  ///
  /// In en, this message translates to:
  /// **'In Review'**
  String get sales_prepare_artwork_status_in_review;

  /// No description provided for @sales_prepare_artwork_status_ready_for_review.
  ///
  /// In en, this message translates to:
  /// **'Ready for Review'**
  String get sales_prepare_artwork_status_ready_for_review;

  /// No description provided for @sales_step_and_repeat_soi_id.
  ///
  /// In en, this message translates to:
  /// **'SOI ID'**
  String get sales_step_and_repeat_soi_id;

  /// No description provided for @sales_step_and_repeat_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get sales_step_and_repeat_status;

  /// No description provided for @sales_title.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get sales_title;

  /// No description provided for @soi_artwork_approval_error_already_added.
  ///
  /// In en, this message translates to:
  /// **'Artwork Approval already added'**
  String get soi_artwork_approval_error_already_added;

  /// No description provided for @soi_artwork_new.
  ///
  /// In en, this message translates to:
  /// **'New Artwork'**
  String get soi_artwork_new;

  /// No description provided for @soi_artwork_pre_selection_type.
  ///
  /// In en, this message translates to:
  /// **'Preselection'**
  String get soi_artwork_pre_selection_type;

  /// No description provided for @soi_artwork_screening_lineature.
  ///
  /// In en, this message translates to:
  /// **'Screening Lineature'**
  String get soi_artwork_screening_lineature;

  /// No description provided for @soi_artwork_selection.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get soi_artwork_selection;

  /// No description provided for @soi_artwork_selection_type.
  ///
  /// In en, this message translates to:
  /// **'Selection'**
  String get soi_artwork_selection_type;

  /// No description provided for @soi_artwork_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get soi_artwork_singular;

  /// No description provided for @soi_consulting_order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get soi_consulting_order;

  /// No description provided for @soi_consulting_plural.
  ///
  /// In en, this message translates to:
  /// **'Consulting'**
  String get soi_consulting_plural;

  /// No description provided for @soi_consulting_singular.
  ///
  /// In en, this message translates to:
  /// **'Consulting'**
  String get soi_consulting_singular;

  /// No description provided for @soi_consulting_text.
  ///
  /// In en, this message translates to:
  /// **'Text'**
  String get soi_consulting_text;

  /// No description provided for @soi_einzelformaufbau_plural.
  ///
  /// In en, this message translates to:
  /// **'Preparation single forms'**
  String get soi_einzelformaufbau_plural;

  /// No description provided for @soi_einzelformaufbau_singular.
  ///
  /// In en, this message translates to:
  /// **'Preparation single form'**
  String get soi_einzelformaufbau_singular;

  /// No description provided for @soi_einzelformaufbau_singular_short.
  ///
  /// In en, this message translates to:
  /// **'Single form'**
  String get soi_einzelformaufbau_singular_short;

  /// No description provided for @soi_einzelformaufbau_version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get soi_einzelformaufbau_version;

  /// No description provided for @soi_prepare_artwork.
  ///
  /// In en, this message translates to:
  /// **'Prepare SOI Artwork'**
  String get soi_prepare_artwork;

  /// No description provided for @soi_prepare_artwork_difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get soi_prepare_artwork_difficulty;

  /// No description provided for @soi_prepare_artwork_error_already_added.
  ///
  /// In en, this message translates to:
  /// **'Prepare Artwork already added'**
  String get soi_prepare_artwork_error_already_added;

  /// No description provided for @soi_prepare_artwork_error_already_in_another.
  ///
  /// In en, this message translates to:
  /// **'Artwork is already being edited in another Sales Order'**
  String get soi_prepare_artwork_error_already_in_another;

  /// No description provided for @soi_request_artwork_approval_plural.
  ///
  /// In en, this message translates to:
  /// **'Artwork Approvals'**
  String get soi_request_artwork_approval_plural;

  /// No description provided for @soi_request_artwork_approval_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork Approval'**
  String get soi_request_artwork_approval_singular;

  /// No description provided for @soi_request_artwork_approval_singular_short.
  ///
  /// In en, this message translates to:
  /// **'Approval'**
  String get soi_request_artwork_approval_singular_short;

  /// No description provided for @soi_sammelformaufbau_plural.
  ///
  /// In en, this message translates to:
  /// **'Preparation multi forms'**
  String get soi_sammelformaufbau_plural;

  /// No description provided for @soi_sammelformaufbau_singular.
  ///
  /// In en, this message translates to:
  /// **'Preparation multi form'**
  String get soi_sammelformaufbau_singular;

  /// No description provided for @soi_sammelformaufbau_singular_short.
  ///
  /// In en, this message translates to:
  /// **'Multi form'**
  String get soi_sammelformaufbau_singular_short;

  /// No description provided for @soi_step_and_repeat.
  ///
  /// In en, this message translates to:
  /// **'Prepare Step & Repeat'**
  String get soi_step_and_repeat;
}

class _ElbSalesLocalizationsDelegate
    extends LocalizationsDelegate<ElbSalesLocalizations> {
  const _ElbSalesLocalizationsDelegate();

  @override
  Future<ElbSalesLocalizations> load(Locale locale) {
    return SynchronousFuture<ElbSalesLocalizations>(
        lookupElbSalesLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ElbSalesLocalizationsDelegate old) => false;
}

ElbSalesLocalizations lookupElbSalesLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return ElbSalesLocalizationsDe();
    case 'en':
      return ElbSalesLocalizationsEn();
  }

  throw FlutterError(
      'ElbSalesLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
