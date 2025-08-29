import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'elb_prepress_localizations_de.dart';
import 'elb_prepress_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ElbPrepressLocalizations
/// returned by `ElbPrepressLocalizations.of(context)`.
///
/// Applications need to include `ElbPrepressLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/elb_prepress_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ElbPrepressLocalizations.localizationsDelegates,
///   supportedLocales: ElbPrepressLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ElbPrepressLocalizations.supportedLocales
/// property.
abstract class ElbPrepressLocalizations {
  ElbPrepressLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ElbPrepressLocalizations of(BuildContext context) {
    return Localizations.of<ElbPrepressLocalizations>(
        context, ElbPrepressLocalizations)!;
  }

  static const LocalizationsDelegate<ElbPrepressLocalizations> delegate =
      _ElbPrepressLocalizationsDelegate();

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

  /// No description provided for @artwork.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get artwork;

  /// No description provided for @artwork_actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get artwork_actions;

  /// No description provided for @artwork_add.
  ///
  /// In en, this message translates to:
  /// **'Add Artwork'**
  String get artwork_add;

  /// No description provided for @artwork_add_color.
  ///
  /// In en, this message translates to:
  /// **'Add Color'**
  String get artwork_add_color;

  /// No description provided for @artwork_add_layer.
  ///
  /// In en, this message translates to:
  /// **'Add layer'**
  String get artwork_add_layer;

  /// No description provided for @artwork_add_to_product.
  ///
  /// In en, this message translates to:
  /// **'Assign to product'**
  String get artwork_add_to_product;

  /// No description provided for @artwork_approval_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get artwork_approval_type;

  /// No description provided for @artwork_approval_type_digital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get artwork_approval_type_digital;

  /// No description provided for @artwork_approval_type_proof.
  ///
  /// In en, this message translates to:
  /// **'Proof/Analogue'**
  String get artwork_approval_type_proof;

  /// No description provided for @artwork_assigned_artworks.
  ///
  /// In en, this message translates to:
  /// **'Assigned Artworks'**
  String get artwork_assigned_artworks;

  /// No description provided for @artwork_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get artwork_back;

  /// No description provided for @artwork_bleed.
  ///
  /// In en, this message translates to:
  /// **'Bleed'**
  String get artwork_bleed;

  /// No description provided for @artwork_boost.
  ///
  /// In en, this message translates to:
  /// **'Boost'**
  String get artwork_boost;

  /// No description provided for @artwork_code_2of5.
  ///
  /// In en, this message translates to:
  /// **'2OF5 Code'**
  String get artwork_code_2of5;

  /// No description provided for @artwork_code_add.
  ///
  /// In en, this message translates to:
  /// **'Add Code'**
  String get artwork_code_add;

  /// No description provided for @artwork_code_aspect_ratio.
  ///
  /// In en, this message translates to:
  /// **'Aspect Ratio'**
  String get artwork_code_aspect_ratio;

  /// No description provided for @artwork_code_aztec.
  ///
  /// In en, this message translates to:
  /// **'Aztec Code'**
  String get artwork_code_aztec;

  /// No description provided for @artwork_code_bar_width_reduction.
  ///
  /// In en, this message translates to:
  /// **'Bar Width Reduction'**
  String get artwork_code_bar_width_reduction;

  /// No description provided for @artwork_code_cell_size.
  ///
  /// In en, this message translates to:
  /// **'Cell Size'**
  String get artwork_code_cell_size;

  /// No description provided for @artwork_code_code_size.
  ///
  /// In en, this message translates to:
  /// **'Code Size'**
  String get artwork_code_code_size;

  /// No description provided for @artwork_code_device_compensation.
  ///
  /// In en, this message translates to:
  /// **'Device Compensation'**
  String get artwork_code_device_compensation;

  /// No description provided for @artwork_code_error_correction.
  ///
  /// In en, this message translates to:
  /// **'Error Correction'**
  String get artwork_code_error_correction;

  /// No description provided for @artwork_code_magnification.
  ///
  /// In en, this message translates to:
  /// **'Magnification'**
  String get artwork_code_magnification;

  /// No description provided for @artwork_code_narrow_bar_width.
  ///
  /// In en, this message translates to:
  /// **'Narrow Bar Width'**
  String get artwork_code_narrow_bar_width;

  /// No description provided for @artwork_code_no_codes_added.
  ///
  /// In en, this message translates to:
  /// **'No codes added yet'**
  String get artwork_code_no_codes_added;

  /// No description provided for @artwork_code_output_resolution.
  ///
  /// In en, this message translates to:
  /// **'Output Resolution'**
  String get artwork_code_output_resolution;

  /// No description provided for @artwork_code_plural.
  ///
  /// In en, this message translates to:
  /// **'Codes'**
  String get artwork_code_plural;

  /// No description provided for @artwork_code_singular.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get artwork_code_singular;

  /// No description provided for @artwork_code_symbol_size.
  ///
  /// In en, this message translates to:
  /// **'Symbol Size'**
  String get artwork_code_symbol_size;

  /// No description provided for @artwork_code_template.
  ///
  /// In en, this message translates to:
  /// **'Template Code'**
  String get artwork_code_template;

  /// No description provided for @artwork_codes.
  ///
  /// In en, this message translates to:
  /// **'Codes'**
  String get artwork_codes;

  /// No description provided for @artwork_color_spec_type.
  ///
  /// In en, this message translates to:
  /// **'Color spec type'**
  String get artwork_color_spec_type;

  /// No description provided for @artwork_color_spec_type_short.
  ///
  /// In en, this message translates to:
  /// **'FarbSpecType'**
  String get artwork_color_spec_type_short;

  /// No description provided for @artwork_colors.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get artwork_colors;

  /// No description provided for @artwork_corner_radius.
  ///
  /// In en, this message translates to:
  /// **'Corner radius'**
  String get artwork_corner_radius;

  /// No description provided for @artwork_created_by.
  ///
  /// In en, this message translates to:
  /// **'Created by'**
  String get artwork_created_by;

  /// No description provided for @artwork_custom_text.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get artwork_custom_text;

  /// No description provided for @artwork_deduction.
  ///
  /// In en, this message translates to:
  /// **'Deduction'**
  String get artwork_deduction;

  /// No description provided for @artwork_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete Artwork'**
  String get artwork_delete;

  /// No description provided for @artwork_delete_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete this artwork?'**
  String get artwork_delete_confirmation;

  /// No description provided for @artwork_die_cutter_type_circle.
  ///
  /// In en, this message translates to:
  /// **'Circle'**
  String get artwork_die_cutter_type_circle;

  /// No description provided for @artwork_die_cutter_type_custom.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get artwork_die_cutter_type_custom;

  /// No description provided for @artwork_die_cutter_type_square.
  ///
  /// In en, this message translates to:
  /// **'Square'**
  String get artwork_die_cutter_type_square;

  /// No description provided for @artwork_dimensions.
  ///
  /// In en, this message translates to:
  /// **'Width x Height'**
  String get artwork_dimensions;

  /// No description provided for @artwork_edit_color.
  ///
  /// In en, this message translates to:
  /// **'Edit Color'**
  String get artwork_edit_color;

  /// No description provided for @artwork_edited_artwork.
  ///
  /// In en, this message translates to:
  /// **'Edited Artwork'**
  String get artwork_edited_artwork;

  /// No description provided for @artwork_file_path_plural.
  ///
  /// In en, this message translates to:
  /// **'File Paths'**
  String get artwork_file_path_plural;

  /// No description provided for @artwork_front.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get artwork_front;

  /// No description provided for @artwork_front_back.
  ///
  /// In en, this message translates to:
  /// **'Front / Back'**
  String get artwork_front_back;

  /// No description provided for @artwork_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get artwork_general;

  /// No description provided for @artwork_group_type_multilayer.
  ///
  /// In en, this message translates to:
  /// **'Multilayer'**
  String get artwork_group_type_multilayer;

  /// No description provided for @artwork_group_type_single.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get artwork_group_type_single;

  /// No description provided for @artwork_height.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get artwork_height;

  /// No description provided for @artwork_horizontal_margins.
  ///
  /// In en, this message translates to:
  /// **'Horizontal Margins'**
  String get artwork_horizontal_margins;

  /// No description provided for @artwork_horizontal_margins_left.
  ///
  /// In en, this message translates to:
  /// **'Left'**
  String get artwork_horizontal_margins_left;

  /// No description provided for @artwork_horizontal_margins_right.
  ///
  /// In en, this message translates to:
  /// **'Right'**
  String get artwork_horizontal_margins_right;

  /// No description provided for @artwork_last_modified_by.
  ///
  /// In en, this message translates to:
  /// **'Last modified by'**
  String get artwork_last_modified_by;

  /// No description provided for @artwork_layer.
  ///
  /// In en, this message translates to:
  /// **'Artwork Layer'**
  String get artwork_layer;

  /// No description provided for @artwork_layer_id.
  ///
  /// In en, this message translates to:
  /// **'Layer ID'**
  String get artwork_layer_id;

  /// No description provided for @artwork_layer_plural.
  ///
  /// In en, this message translates to:
  /// **'Artwork Layers'**
  String get artwork_layer_plural;

  /// No description provided for @artwork_layer_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork Layer'**
  String get artwork_layer_singular;

  /// No description provided for @artwork_listview_soi.
  ///
  /// In en, this message translates to:
  /// **'Listview artwork-soi'**
  String get artwork_listview_soi;

  /// No description provided for @artwork_locked_message.
  ///
  /// In en, this message translates to:
  /// **'This artwork has none, or only a finished Sales Order Item and therefor can\'t be edited.'**
  String get artwork_locked_message;

  /// No description provided for @artwork_log.
  ///
  /// In en, this message translates to:
  /// **'Artwork Log'**
  String get artwork_log;

  /// No description provided for @artwork_log_plural.
  ///
  /// In en, this message translates to:
  /// **'Artwork Logs'**
  String get artwork_log_plural;

  /// No description provided for @artwork_log_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork Log'**
  String get artwork_log_singular;

  /// No description provided for @artwork_master.
  ///
  /// In en, this message translates to:
  /// **'Master'**
  String get artwork_master;

  /// No description provided for @artwork_master_plural.
  ///
  /// In en, this message translates to:
  /// **'Artwork Masters'**
  String get artwork_master_plural;

  /// No description provided for @artwork_master_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork Master'**
  String get artwork_master_singular;

  /// No description provided for @artwork_moved_file_path.
  ///
  /// In en, this message translates to:
  /// **'Moved Path'**
  String get artwork_moved_file_path;

  /// No description provided for @artwork_no_thumbnail.
  ///
  /// In en, this message translates to:
  /// **'No thumbnail'**
  String get artwork_no_thumbnail;

  /// No description provided for @artwork_original_file_path.
  ///
  /// In en, this message translates to:
  /// **'Original Path'**
  String get artwork_original_file_path;

  /// No description provided for @artwork_plural.
  ///
  /// In en, this message translates to:
  /// **'Artworks'**
  String get artwork_plural;

  /// No description provided for @artwork_print_process.
  ///
  /// In en, this message translates to:
  /// **'Print Process'**
  String get artwork_print_process;

  /// No description provided for @artwork_quarantine_add_to_product.
  ///
  /// In en, this message translates to:
  /// **'Add Artwork Quarantine to Product'**
  String get artwork_quarantine_add_to_product;

  /// No description provided for @artwork_quarantine_artwork.
  ///
  /// In en, this message translates to:
  /// **'Quarantine Artwork'**
  String get artwork_quarantine_artwork;

  /// No description provided for @artwork_quarantine_colors.
  ///
  /// In en, this message translates to:
  /// **'Quarantine Colors'**
  String get artwork_quarantine_colors;

  /// No description provided for @artwork_quarantine_create.
  ///
  /// In en, this message translates to:
  /// **'Create quarantine artwork'**
  String get artwork_quarantine_create;

  /// No description provided for @artwork_quarantine_create_artwork.
  ///
  /// In en, this message translates to:
  /// **'Create Artwork'**
  String get artwork_quarantine_create_artwork;

  /// No description provided for @artwork_quarantine_create_product.
  ///
  /// In en, this message translates to:
  /// **'Create Product from Artwork Quarantine'**
  String get artwork_quarantine_create_product;

  /// No description provided for @artwork_quarantine_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get artwork_quarantine_customer;

  /// No description provided for @artwork_quarantine_customer_id.
  ///
  /// In en, this message translates to:
  /// **'Customer ID'**
  String get artwork_quarantine_customer_id;

  /// No description provided for @artwork_quarantine_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete Artwork'**
  String get artwork_quarantine_delete;

  /// No description provided for @artwork_quarantine_delete_dialog_content.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to delete the entry?'**
  String get artwork_quarantine_delete_dialog_content;

  /// No description provided for @artwork_quarantine_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get artwork_quarantine_description;

  /// No description provided for @artwork_quarantine_group_apply_settings_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to apply the group settings to {count} open artworks? This action cannot be undone.'**
  String artwork_quarantine_group_apply_settings_confirmation_message(
      Object count);

  /// No description provided for @artwork_quarantine_group_apply_settings_confirmation_title.
  ///
  /// In en, this message translates to:
  /// **'Apply Group Settings'**
  String get artwork_quarantine_group_apply_settings_confirmation_title;

  /// No description provided for @artwork_quarantine_group_attachments.
  ///
  /// In en, this message translates to:
  /// **'Attachments'**
  String get artwork_quarantine_group_attachments;

  /// No description provided for @artwork_quarantine_group_cancel_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to cancel this Data Import? This action cannot be undone.'**
  String get artwork_quarantine_group_cancel_confirmation_message;

  /// No description provided for @artwork_quarantine_group_cancel_confirmation_title.
  ///
  /// In en, this message translates to:
  /// **'Cancel Data Import'**
  String get artwork_quarantine_group_cancel_confirmation_title;

  /// No description provided for @artwork_quarantine_group_customer_id.
  ///
  /// In en, this message translates to:
  /// **'Customer ID'**
  String get artwork_quarantine_group_customer_id;

  /// No description provided for @artwork_quarantine_group_output_path.
  ///
  /// In en, this message translates to:
  /// **'Output path'**
  String get artwork_quarantine_group_output_path;

  /// No description provided for @artwork_quarantine_group_plural.
  ///
  /// In en, this message translates to:
  /// **'Data Imports'**
  String get artwork_quarantine_group_plural;

  /// No description provided for @artwork_quarantine_group_save_trimmed_content.
  ///
  /// In en, this message translates to:
  /// **'All artworks in this group are marked as trimmed. How would you like to save the group status?'**
  String get artwork_quarantine_group_save_trimmed_content;

  /// No description provided for @artwork_quarantine_group_save_trimmed_save_current.
  ///
  /// In en, this message translates to:
  /// **'Save current status'**
  String get artwork_quarantine_group_save_trimmed_save_current;

  /// No description provided for @artwork_quarantine_group_save_trimmed_save_trimmed.
  ///
  /// In en, this message translates to:
  /// **'Save as Trimmed'**
  String get artwork_quarantine_group_save_trimmed_save_trimmed;

  /// No description provided for @artwork_quarantine_group_save_trimmed_title.
  ///
  /// In en, this message translates to:
  /// **'Save Group Status'**
  String get artwork_quarantine_group_save_trimmed_title;

  /// No description provided for @artwork_quarantine_group_selected_product_series.
  ///
  /// In en, this message translates to:
  /// **'Product Series'**
  String get artwork_quarantine_group_selected_product_series;

  /// No description provided for @artwork_quarantine_group_send_to_ae.
  ///
  /// In en, this message translates to:
  /// **'Analyse Dataimport'**
  String get artwork_quarantine_group_send_to_ae;

  /// No description provided for @artwork_quarantine_group_singular.
  ///
  /// In en, this message translates to:
  /// **'Data Import'**
  String get artwork_quarantine_group_singular;

  /// No description provided for @artwork_quarantine_group_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get artwork_quarantine_group_status;

  /// No description provided for @artwork_quarantine_group_submit_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'Do you really want to submit this Data Import to the AE? This will set the status to TODO and start a Workflow.'**
  String get artwork_quarantine_group_submit_confirmation_message;

  /// No description provided for @artwork_quarantine_group_submit_confirmation_title.
  ///
  /// In en, this message translates to:
  /// **'Submit Data Import to AE'**
  String get artwork_quarantine_group_submit_confirmation_title;

  /// No description provided for @artwork_quarantine_group_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get artwork_quarantine_group_type;

  /// No description provided for @artwork_quarantine_group_validator_single_artworks.
  ///
  /// In en, this message translates to:
  /// **'Group with multiple artworks can\'t be of type \'Single\'.'**
  String get artwork_quarantine_group_validator_single_artworks;

  /// No description provided for @artwork_quarantine_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get artwork_quarantine_id;

  /// No description provided for @artwork_quarantine_keywords.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get artwork_quarantine_keywords;

  /// No description provided for @artwork_quarantine_plural.
  ///
  /// In en, this message translates to:
  /// **'Quarantine artworks'**
  String get artwork_quarantine_plural;

  /// No description provided for @artwork_quarantine_routing_all_quarantine_artworks.
  ///
  /// In en, this message translates to:
  /// **'All quarantine artworks'**
  String get artwork_quarantine_routing_all_quarantine_artworks;

  /// No description provided for @artwork_quarantine_routing_home.
  ///
  /// In en, this message translates to:
  /// **'Create quarantine artwork'**
  String get artwork_quarantine_routing_home;

  /// No description provided for @artwork_quarantine_singular.
  ///
  /// In en, this message translates to:
  /// **'Quarantine Artwork'**
  String get artwork_quarantine_singular;

  /// No description provided for @artwork_quarantine_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get artwork_quarantine_status;

  /// No description provided for @artwork_quarantine_table_actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get artwork_quarantine_table_actions;

  /// No description provided for @artwork_quarantine_vmop_note.
  ///
  /// In en, this message translates to:
  /// **'VMOP Note'**
  String get artwork_quarantine_vmop_note;

  /// No description provided for @artwork_reader_spread.
  ///
  /// In en, this message translates to:
  /// **'Reader Spread'**
  String get artwork_reader_spread;

  /// No description provided for @artwork_reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get artwork_reference;

  /// No description provided for @artwork_remove_from_table.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get artwork_remove_from_table;

  /// No description provided for @artwork_sales_order.
  ///
  /// In en, this message translates to:
  /// **'Sales Order'**
  String get artwork_sales_order;

  /// No description provided for @artwork_short_description.
  ///
  /// In en, this message translates to:
  /// **'Short description'**
  String get artwork_short_description;

  /// No description provided for @artwork_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork'**
  String get artwork_singular;

  /// No description provided for @artwork_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get artwork_status;

  /// No description provided for @artwork_status_approved_by_customer.
  ///
  /// In en, this message translates to:
  /// **'Approved by customer'**
  String get artwork_status_approved_by_customer;

  /// No description provided for @artwork_status_data_entry.
  ///
  /// In en, this message translates to:
  /// **'Data entry'**
  String get artwork_status_data_entry;

  /// No description provided for @artwork_status_in_preparation.
  ///
  /// In en, this message translates to:
  /// **'In preparation'**
  String get artwork_status_in_preparation;

  /// No description provided for @artwork_status_ready_for_approval.
  ///
  /// In en, this message translates to:
  /// **'Ready for approval'**
  String get artwork_status_ready_for_approval;

  /// No description provided for @artwork_status_step_and_repeat_created.
  ///
  /// In en, this message translates to:
  /// **'Step & Repeat created'**
  String get artwork_status_step_and_repeat_created;

  /// No description provided for @artwork_status_waiting_for_step_and_repeat.
  ///
  /// In en, this message translates to:
  /// **'Waiting for Step & Repeat'**
  String get artwork_status_waiting_for_step_and_repeat;

  /// No description provided for @artwork_template_global.
  ///
  /// In en, this message translates to:
  /// **'Global Artwork-Vorlagen'**
  String get artwork_template_global;

  /// No description provided for @artwork_template_plural.
  ///
  /// In en, this message translates to:
  /// **'Artwork Templates'**
  String get artwork_template_plural;

  /// No description provided for @artwork_template_preselection.
  ///
  /// In en, this message translates to:
  /// **'Preselection'**
  String get artwork_template_preselection;

  /// No description provided for @artwork_template_preselection_plural.
  ///
  /// In en, this message translates to:
  /// **'Preselections'**
  String get artwork_template_preselection_plural;

  /// No description provided for @artwork_template_preselection_singular.
  ///
  /// In en, this message translates to:
  /// **'Preselection'**
  String get artwork_template_preselection_singular;

  /// No description provided for @artwork_template_select.
  ///
  /// In en, this message translates to:
  /// **'Select artwork template'**
  String get artwork_template_select;

  /// No description provided for @artwork_template_selection.
  ///
  /// In en, this message translates to:
  /// **'Selection'**
  String get artwork_template_selection;

  /// No description provided for @artwork_template_selection_plural.
  ///
  /// In en, this message translates to:
  /// **'Selections'**
  String get artwork_template_selection_plural;

  /// No description provided for @artwork_template_selection_singular.
  ///
  /// In en, this message translates to:
  /// **'Selection'**
  String get artwork_template_selection_singular;

  /// No description provided for @artwork_template_singular.
  ///
  /// In en, this message translates to:
  /// **'Artwork Template'**
  String get artwork_template_singular;

  /// No description provided for @artwork_templates.
  ///
  /// In en, this message translates to:
  /// **'Artwork templates'**
  String get artwork_templates;

  /// No description provided for @artwork_thumbnail_not_found.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail not found'**
  String get artwork_thumbnail_not_found;

  /// No description provided for @artwork_thumbnail_path.
  ///
  /// In en, this message translates to:
  /// **'Thumbnail Path'**
  String get artwork_thumbnail_path;

  /// No description provided for @artwork_trapping_and_deduction.
  ///
  /// In en, this message translates to:
  /// **'Trapping and Deduction'**
  String get artwork_trapping_and_deduction;

  /// No description provided for @artwork_trapping_black.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get artwork_trapping_black;

  /// No description provided for @artwork_trapping_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get artwork_trapping_normal;

  /// No description provided for @artwork_trapping_pictures.
  ///
  /// In en, this message translates to:
  /// **'Pictures'**
  String get artwork_trapping_pictures;

  /// No description provided for @artwork_trapping_pullback.
  ///
  /// In en, this message translates to:
  /// **'Pullback'**
  String get artwork_trapping_pullback;

  /// No description provided for @artwork_trapping_special_colors.
  ///
  /// In en, this message translates to:
  /// **'Special Colors'**
  String get artwork_trapping_special_colors;

  /// No description provided for @artwork_type.
  ///
  /// In en, this message translates to:
  /// **'Artwork Type'**
  String get artwork_type;

  /// No description provided for @artwork_v_layer.
  ///
  /// In en, this message translates to:
  /// **'V-Layer'**
  String get artwork_v_layer;

  /// No description provided for @artwork_version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get artwork_version;

  /// No description provided for @artwork_version_deducation.
  ///
  /// In en, this message translates to:
  /// **'Version / Deduction'**
  String get artwork_version_deducation;

  /// No description provided for @artwork_vertical_margins.
  ///
  /// In en, this message translates to:
  /// **'Vertical Margins'**
  String get artwork_vertical_margins;

  /// No description provided for @artwork_vertical_margins_bottom.
  ///
  /// In en, this message translates to:
  /// **'Bottom'**
  String get artwork_vertical_margins_bottom;

  /// No description provided for @artwork_vertical_margins_top.
  ///
  /// In en, this message translates to:
  /// **'Top'**
  String get artwork_vertical_margins_top;

  /// No description provided for @artwork_width.
  ///
  /// In en, this message translates to:
  /// **'Width'**
  String get artwork_width;

  /// No description provided for @artwork_xml_path.
  ///
  /// In en, this message translates to:
  /// **'Xml Path'**
  String get artwork_xml_path;

  /// No description provided for @artworks.
  ///
  /// In en, this message translates to:
  /// **'Artworks'**
  String get artworks;

  /// No description provided for @bleed.
  ///
  /// In en, this message translates to:
  /// **'Bleed'**
  String get bleed;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @color_a.
  ///
  /// In en, this message translates to:
  /// **'a'**
  String get color_a;

  /// No description provided for @color_b.
  ///
  /// In en, this message translates to:
  /// **'b'**
  String get color_b;

  /// No description provided for @color_books.
  ///
  /// In en, this message translates to:
  /// **'Color books'**
  String get color_books;

  /// No description provided for @color_change_short_name.
  ///
  /// In en, this message translates to:
  /// **'Change short name'**
  String get color_change_short_name;

  /// No description provided for @color_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get color_general;

  /// No description provided for @color_hex_code.
  ///
  /// In en, this message translates to:
  /// **'Hex code'**
  String get color_hex_code;

  /// No description provided for @color_import_success_message.
  ///
  /// In en, this message translates to:
  /// **'Colors imported successfully'**
  String get color_import_success_message;

  /// No description provided for @color_l.
  ///
  /// In en, this message translates to:
  /// **'L'**
  String get color_l;

  /// No description provided for @color_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get color_name;

  /// No description provided for @color_new.
  ///
  /// In en, this message translates to:
  /// **'New color'**
  String get color_new;

  /// No description provided for @color_palette_already_exists.
  ///
  /// In en, this message translates to:
  /// **'This color palette already exists.'**
  String get color_palette_already_exists;

  /// No description provided for @color_palette_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get color_palette_description;

  /// No description provided for @color_palette_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get color_palette_general;

  /// No description provided for @color_palette_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get color_palette_name;

  /// No description provided for @color_palette_plural.
  ///
  /// In en, this message translates to:
  /// **'Color books'**
  String get color_palette_plural;

  /// No description provided for @color_palette_singular.
  ///
  /// In en, this message translates to:
  /// **'Color book'**
  String get color_palette_singular;

  /// No description provided for @color_plural.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get color_plural;

  /// No description provided for @color_select_cxf.
  ///
  /// In en, this message translates to:
  /// **'Select .cxf File'**
  String get color_select_cxf;

  /// No description provided for @color_short_name.
  ///
  /// In en, this message translates to:
  /// **'Short name'**
  String get color_short_name;

  /// No description provided for @color_singular.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color_singular;

  /// No description provided for @color_spec_type_kodak.
  ///
  /// In en, this message translates to:
  /// **'Kodak'**
  String get color_spec_type_kodak;

  /// No description provided for @color_spec_type_processing_step.
  ///
  /// In en, this message translates to:
  /// **'Processing Step'**
  String get color_spec_type_processing_step;

  /// No description provided for @color_spec_type_quartz.
  ///
  /// In en, this message translates to:
  /// **'Quartz'**
  String get color_spec_type_quartz;

  /// No description provided for @color_spec_type_standard.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get color_spec_type_standard;

  /// No description provided for @color_type.
  ///
  /// In en, this message translates to:
  /// **'Color type'**
  String get color_type;

  /// No description provided for @color_type_non_printing.
  ///
  /// In en, this message translates to:
  /// **'Non-printing'**
  String get color_type_non_printing;

  /// No description provided for @color_type_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get color_type_normal;

  /// No description provided for @color_type_opak.
  ///
  /// In en, this message translates to:
  /// **'Opaque'**
  String get color_type_opak;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @customer_color_spec_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get customer_color_spec_general;

  /// No description provided for @customer_color_spec_new.
  ///
  /// In en, this message translates to:
  /// **'New Customer Color Spec'**
  String get customer_color_spec_new;

  /// No description provided for @customer_color_spec_plural.
  ///
  /// In en, this message translates to:
  /// **'Color specs'**
  String get customer_color_spec_plural;

  /// No description provided for @customer_color_spec_singular.
  ///
  /// In en, this message translates to:
  /// **'Color spec'**
  String get customer_color_spec_singular;

  /// No description provided for @customer_id.
  ///
  /// In en, this message translates to:
  /// **'Customer ID'**
  String get customer_id;

  /// No description provided for @drucklayout_choose_existing.
  ///
  /// In en, this message translates to:
  /// **'Choose an existing Printlayout'**
  String get drucklayout_choose_existing;

  /// No description provided for @drucklayout_choose_nutzenlayout.
  ///
  /// In en, this message translates to:
  /// **'Choose the Nutzenlayout, that you want to assign to the Printlayout'**
  String get drucklayout_choose_nutzenlayout;

  /// No description provided for @drucklayout_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get drucklayout_description;

  /// No description provided for @drucklayout_existing.
  ///
  /// In en, this message translates to:
  /// **'Existing Printlayouts:'**
  String get drucklayout_existing;

  /// No description provided for @drucklayout_none_existing.
  ///
  /// In en, this message translates to:
  /// **'No Printlayouts found for this customer'**
  String get drucklayout_none_existing;

  /// No description provided for @drucklayout_plural.
  ///
  /// In en, this message translates to:
  /// **'Print Layouts'**
  String get drucklayout_plural;

  /// No description provided for @drucklayout_preselection_plural.
  ///
  /// In en, this message translates to:
  /// **'Preselections'**
  String get drucklayout_preselection_plural;

  /// No description provided for @drucklayout_preselection_singular.
  ///
  /// In en, this message translates to:
  /// **'Preselection'**
  String get drucklayout_preselection_singular;

  /// No description provided for @drucklayout_selection_plural.
  ///
  /// In en, this message translates to:
  /// **'Selections'**
  String get drucklayout_selection_plural;

  /// No description provided for @drucklayout_selection_singular.
  ///
  /// In en, this message translates to:
  /// **'Selection'**
  String get drucklayout_selection_singular;

  /// No description provided for @drucklayout_singular.
  ///
  /// In en, this message translates to:
  /// **'Print Layout'**
  String get drucklayout_singular;

  /// No description provided for @drucklayout_title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get drucklayout_title;

  /// No description provided for @global_artwork_template.
  ///
  /// In en, this message translates to:
  /// **'Global artwork templates'**
  String get global_artwork_template;

  /// No description provided for @import_colors.
  ///
  /// In en, this message translates to:
  /// **'Import colors'**
  String get import_colors;

  /// No description provided for @layer.
  ///
  /// In en, this message translates to:
  /// **'Layer'**
  String get layer;

  /// No description provided for @layer_locked.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get layer_locked;

  /// No description provided for @layer_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get layer_name;

  /// No description provided for @layer_new.
  ///
  /// In en, this message translates to:
  /// **'New Layer'**
  String get layer_new;

  /// No description provided for @layer_printable.
  ///
  /// In en, this message translates to:
  /// **'Printable'**
  String get layer_printable;

  /// No description provided for @layer_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get layer_type;

  /// No description provided for @layer_type_die_cutter.
  ///
  /// In en, this message translates to:
  /// **'Die Cutter'**
  String get layer_type_die_cutter;

  /// No description provided for @layer_type_dimensions.
  ///
  /// In en, this message translates to:
  /// **'Dimensions'**
  String get layer_type_dimensions;

  /// No description provided for @layer_type_none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get layer_type_none;

  /// No description provided for @layer_type_opaque_white.
  ///
  /// In en, this message translates to:
  /// **'Opaque White'**
  String get layer_type_opaque_white;

  /// No description provided for @layer_type_varnish.
  ///
  /// In en, this message translates to:
  /// **'Varnish'**
  String get layer_type_varnish;

  /// No description provided for @layers.
  ///
  /// In en, this message translates to:
  /// **'Layers'**
  String get layers;

  /// No description provided for @layout_einzelform.
  ///
  /// In en, this message translates to:
  /// **'Single form'**
  String get layout_einzelform;

  /// No description provided for @layout_einzelform_short.
  ///
  /// In en, this message translates to:
  /// **'Single'**
  String get layout_einzelform_short;

  /// No description provided for @layout_sammelform.
  ///
  /// In en, this message translates to:
  /// **'Multi form'**
  String get layout_sammelform;

  /// No description provided for @layout_sammelform_short.
  ///
  /// In en, this message translates to:
  /// **'Multi'**
  String get layout_sammelform_short;

  /// No description provided for @main_print_process.
  ///
  /// In en, this message translates to:
  /// **'Main Print Process'**
  String get main_print_process;

  /// No description provided for @none_for_sales_order.
  ///
  /// In en, this message translates to:
  /// **'No {type} for this SalesOrder'**
  String none_for_sales_order(Object type);

  /// No description provided for @nutzenlayout_added_to_drucklayout.
  ///
  /// In en, this message translates to:
  /// **'Nutzenlayout was added to Drucklayout'**
  String get nutzenlayout_added_to_drucklayout;

  /// No description provided for @please_choose_min_drucklayout.
  ///
  /// In en, this message translates to:
  /// **'Please choose minimum one Nutzenlayout'**
  String get please_choose_min_drucklayout;

  /// No description provided for @prepare_artwork.
  ///
  /// In en, this message translates to:
  /// **'Prepare Artwork'**
  String get prepare_artwork;

  /// No description provided for @prepare_artwork_short.
  ///
  /// In en, this message translates to:
  /// **'Prepare'**
  String get prepare_artwork_short;

  /// No description provided for @print_layout_add_product_part.
  ///
  /// In en, this message translates to:
  /// **'Add Product Parts'**
  String get print_layout_add_product_part;

  /// No description provided for @print_layout_count_x.
  ///
  /// In en, this message translates to:
  /// **'Count X'**
  String get print_layout_count_x;

  /// No description provided for @print_layout_count_y.
  ///
  /// In en, this message translates to:
  /// **'Count Y'**
  String get print_layout_count_y;

  /// No description provided for @print_layout_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get print_layout_description;

  /// No description provided for @print_layout_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get print_layout_general;

  /// No description provided for @print_layout_layout.
  ///
  /// In en, this message translates to:
  /// **'Layout'**
  String get print_layout_layout;

  /// No description provided for @print_layout_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get print_layout_name;

  /// No description provided for @print_layout_plural.
  ///
  /// In en, this message translates to:
  /// **'Print Layouts'**
  String get print_layout_plural;

  /// No description provided for @print_layout_product_parts.
  ///
  /// In en, this message translates to:
  /// **'Available Product Parts'**
  String get print_layout_product_parts;

  /// No description provided for @print_layout_singular.
  ///
  /// In en, this message translates to:
  /// **'Print Layout'**
  String get print_layout_singular;

  /// No description provided for @print_process.
  ///
  /// In en, this message translates to:
  /// **'Print process'**
  String get print_process;

  /// No description provided for @print_process_flexo.
  ///
  /// In en, this message translates to:
  /// **'Flexo'**
  String get print_process_flexo;

  /// No description provided for @print_process_flexo_ref.
  ///
  /// In en, this message translates to:
  /// **'Flexo Ref'**
  String get print_process_flexo_ref;

  /// No description provided for @print_process_nicht_druckend.
  ///
  /// In en, this message translates to:
  /// **'Not printed'**
  String get print_process_nicht_druckend;

  /// No description provided for @print_process_type_digital.
  ///
  /// In en, this message translates to:
  /// **'Digital printing'**
  String get print_process_type_digital;

  /// No description provided for @print_process_type_flexo.
  ///
  /// In en, this message translates to:
  /// **'Flexo printing'**
  String get print_process_type_flexo;

  /// No description provided for @print_process_type_letterpress.
  ///
  /// In en, this message translates to:
  /// **'Letterpress printing'**
  String get print_process_type_letterpress;

  /// No description provided for @print_process_type_offset.
  ///
  /// In en, this message translates to:
  /// **'Offset printing'**
  String get print_process_type_offset;

  /// No description provided for @print_process_type_screen.
  ///
  /// In en, this message translates to:
  /// **'Screen printing'**
  String get print_process_type_screen;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @product_create.
  ///
  /// In en, this message translates to:
  /// **'Create Product'**
  String get product_create;

  /// No description provided for @product_customer_ref.
  ///
  /// In en, this message translates to:
  /// **'Customer reference'**
  String get product_customer_ref;

  /// No description provided for @product_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get product_description;

  /// No description provided for @product_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get product_general;

  /// No description provided for @product_id.
  ///
  /// In en, this message translates to:
  /// **'Product ID'**
  String get product_id;

  /// No description provided for @product_image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get product_image;

  /// No description provided for @product_index.
  ///
  /// In en, this message translates to:
  /// **'Index'**
  String get product_index;

  /// No description provided for @product_index_number.
  ///
  /// In en, this message translates to:
  /// **'Index number'**
  String get product_index_number;

  /// No description provided for @product_keywords.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get product_keywords;

  /// No description provided for @product_master.
  ///
  /// In en, this message translates to:
  /// **'Product Master'**
  String get product_master;

  /// No description provided for @product_master_plural.
  ///
  /// In en, this message translates to:
  /// **'Product Masters'**
  String get product_master_plural;

  /// No description provided for @product_master_singular.
  ///
  /// In en, this message translates to:
  /// **'Product Master'**
  String get product_master_singular;

  /// No description provided for @product_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get product_name;

  /// No description provided for @product_new.
  ///
  /// In en, this message translates to:
  /// **'New Product'**
  String get product_new;

  /// No description provided for @product_new_series.
  ///
  /// In en, this message translates to:
  /// **'New Series'**
  String get product_new_series;

  /// No description provided for @product_part.
  ///
  /// In en, this message translates to:
  /// **'Product Part'**
  String get product_part;

  /// No description provided for @product_part_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get product_part_description;

  /// No description provided for @product_part_general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get product_part_general;

  /// No description provided for @product_part_id.
  ///
  /// In en, this message translates to:
  /// **'Product Part ID'**
  String get product_part_id;

  /// No description provided for @product_part_image.
  ///
  /// In en, this message translates to:
  /// **'Image'**
  String get product_part_image;

  /// No description provided for @product_part_image_url.
  ///
  /// In en, this message translates to:
  /// **'Image Url'**
  String get product_part_image_url;

  /// No description provided for @product_part_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get product_part_name;

  /// No description provided for @product_part_new.
  ///
  /// In en, this message translates to:
  /// **'New Product Part'**
  String get product_part_new;

  /// No description provided for @product_part_plural.
  ///
  /// In en, this message translates to:
  /// **'Product Parts'**
  String get product_part_plural;

  /// No description provided for @product_part_product_id.
  ///
  /// In en, this message translates to:
  /// **'Product ID'**
  String get product_part_product_id;

  /// No description provided for @product_part_singular.
  ///
  /// In en, this message translates to:
  /// **'Product Part'**
  String get product_part_singular;

  /// No description provided for @product_part_type.
  ///
  /// In en, this message translates to:
  /// **'Product part type'**
  String get product_part_type;

  /// No description provided for @product_part_type_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get product_part_type_back;

  /// No description provided for @product_part_type_front.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get product_part_type_front;

  /// No description provided for @product_part_type_none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get product_part_type_none;

  /// No description provided for @product_part_work_instructions.
  ///
  /// In en, this message translates to:
  /// **'Working instructions'**
  String get product_part_work_instructions;

  /// No description provided for @product_plural.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get product_plural;

  /// No description provided for @product_position_type.
  ///
  /// In en, this message translates to:
  /// **'Position Type'**
  String get product_position_type;

  /// No description provided for @product_position_type_banderole.
  ///
  /// In en, this message translates to:
  /// **'Banderole'**
  String get product_position_type_banderole;

  /// No description provided for @product_position_type_bottom.
  ///
  /// In en, this message translates to:
  /// **'Bottom'**
  String get product_position_type_bottom;

  /// No description provided for @product_position_type_face.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get product_position_type_face;

  /// No description provided for @product_position_type_lid.
  ///
  /// In en, this message translates to:
  /// **'Lid'**
  String get product_position_type_lid;

  /// No description provided for @product_position_type_none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get product_position_type_none;

  /// No description provided for @product_position_type_rear.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get product_position_type_rear;

  /// No description provided for @product_product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product_product;

  /// No description provided for @product_product_parts.
  ///
  /// In en, this message translates to:
  /// **'Product Parts'**
  String get product_product_parts;

  /// No description provided for @product_select.
  ///
  /// In en, this message translates to:
  /// **'Select product'**
  String get product_select;

  /// No description provided for @product_serial_number.
  ///
  /// In en, this message translates to:
  /// **'Serial number'**
  String get product_serial_number;

  /// No description provided for @product_series.
  ///
  /// In en, this message translates to:
  /// **'Series'**
  String get product_series;

  /// No description provided for @product_series_change.
  ///
  /// In en, this message translates to:
  /// **'Change series'**
  String get product_series_change;

  /// No description provided for @product_series_select.
  ///
  /// In en, this message translates to:
  /// **'Choose series'**
  String get product_series_select;

  /// No description provided for @product_singular.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product_singular;

  /// No description provided for @product_title.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product_title;

  /// No description provided for @product_type.
  ///
  /// In en, this message translates to:
  /// **'Product Type'**
  String get product_type;

  /// No description provided for @product_type_back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get product_type_back;

  /// No description provided for @product_type_back_short.
  ///
  /// In en, this message translates to:
  /// **'RS'**
  String get product_type_back_short;

  /// No description provided for @product_type_bag.
  ///
  /// In en, this message translates to:
  /// **'Bag'**
  String get product_type_bag;

  /// No description provided for @product_type_banderole.
  ///
  /// In en, this message translates to:
  /// **'Banderole'**
  String get product_type_banderole;

  /// No description provided for @product_type_banderole_short.
  ///
  /// In en, this message translates to:
  /// **'BA'**
  String get product_type_banderole_short;

  /// No description provided for @product_type_blister.
  ///
  /// In en, this message translates to:
  /// **'Blister'**
  String get product_type_blister;

  /// No description provided for @product_type_bottom.
  ///
  /// In en, this message translates to:
  /// **'Bottom'**
  String get product_type_bottom;

  /// No description provided for @product_type_bottom_short.
  ///
  /// In en, this message translates to:
  /// **'BO'**
  String get product_type_bottom_short;

  /// No description provided for @product_type_cup.
  ///
  /// In en, this message translates to:
  /// **'Cup'**
  String get product_type_cup;

  /// No description provided for @product_type_curved.
  ///
  /// In en, this message translates to:
  /// **'Label - curved'**
  String get product_type_curved;

  /// No description provided for @product_type_foil.
  ///
  /// In en, this message translates to:
  /// **'Foil'**
  String get product_type_foil;

  /// No description provided for @product_type_front.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get product_type_front;

  /// No description provided for @product_type_front_short.
  ///
  /// In en, this message translates to:
  /// **'VS'**
  String get product_type_front_short;

  /// No description provided for @product_type_kit.
  ///
  /// In en, this message translates to:
  /// **'Kit'**
  String get product_type_kit;

  /// No description provided for @product_type_lid.
  ///
  /// In en, this message translates to:
  /// **'Lid'**
  String get product_type_lid;

  /// No description provided for @product_type_lid_short.
  ///
  /// In en, this message translates to:
  /// **'DE'**
  String get product_type_lid_short;

  /// No description provided for @product_type_monolayer.
  ///
  /// In en, this message translates to:
  /// **'Label - Monolayer'**
  String get product_type_monolayer;

  /// No description provided for @product_type_monolayer_one_sided.
  ///
  /// In en, this message translates to:
  /// **'Label - Monolayer one-sided'**
  String get product_type_monolayer_one_sided;

  /// No description provided for @product_type_monolayer_two_sided.
  ///
  /// In en, this message translates to:
  /// **'Label - Monolayer two-sided'**
  String get product_type_monolayer_two_sided;

  /// No description provided for @product_type_multilayer.
  ///
  /// In en, this message translates to:
  /// **'Multilayer'**
  String get product_type_multilayer;

  /// No description provided for @product_type_multilayer_short.
  ///
  /// In en, this message translates to:
  /// **'ML'**
  String get product_type_multilayer_short;

  /// No description provided for @product_type_none.
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get product_type_none;

  /// No description provided for @product_type_template_digital.
  ///
  /// In en, this message translates to:
  /// **'Template digital print'**
  String get product_type_template_digital;

  /// No description provided for @product_type_tissue.
  ///
  /// In en, this message translates to:
  /// **'Tissues'**
  String get product_type_tissue;

  /// No description provided for @quarantine_group_status_ae.
  ///
  /// In en, this message translates to:
  /// **'AE'**
  String get quarantine_group_status_ae;

  /// No description provided for @quarantine_group_status_canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get quarantine_group_status_canceled;

  /// No description provided for @quarantine_group_status_done.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get quarantine_group_status_done;

  /// No description provided for @quarantine_group_status_in_use.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get quarantine_group_status_in_use;

  /// No description provided for @quarantine_group_status_open.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get quarantine_group_status_open;

  /// No description provided for @sales_order_item_short.
  ///
  /// In en, this message translates to:
  /// **'SOI'**
  String get sales_order_item_short;

  /// No description provided for @sales_sales_order_singular.
  ///
  /// In en, this message translates to:
  /// **'Sales Orders'**
  String get sales_sales_order_singular;

  /// No description provided for @screen_angle.
  ///
  /// In en, this message translates to:
  /// **'Screen angle'**
  String get screen_angle;

  /// No description provided for @screen_angle_short.
  ///
  /// In en, this message translates to:
  /// **'Angle'**
  String get screen_angle_short;

  /// No description provided for @screen_lineature.
  ///
  /// In en, this message translates to:
  /// **'Screen Lineature'**
  String get screen_lineature;

  /// No description provided for @screen_lineature_short.
  ///
  /// In en, this message translates to:
  /// **'Lineature'**
  String get screen_lineature_short;

  /// No description provided for @screen_point_form.
  ///
  /// In en, this message translates to:
  /// **'Screen point form'**
  String get screen_point_form;

  /// No description provided for @screen_point_form_short.
  ///
  /// In en, this message translates to:
  /// **'Point form'**
  String get screen_point_form_short;

  /// No description provided for @soi_artwork_approval_error_already_added.
  ///
  /// In en, this message translates to:
  /// **'Artwork Approval already added'**
  String get soi_artwork_approval_error_already_added;

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

  /// No description provided for @soi_prepare_artwork.
  ///
  /// In en, this message translates to:
  /// **'Prepare SOI Artwork'**
  String get soi_prepare_artwork;

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

  /// No description provided for @step_and_repeat.
  ///
  /// In en, this message translates to:
  /// **'Step & Repeat'**
  String get step_and_repeat;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @trapping.
  ///
  /// In en, this message translates to:
  /// **'Trapping'**
  String get trapping;

  /// No description provided for @trapping_and_bleed.
  ///
  /// In en, this message translates to:
  /// **'Trapping and Bleed'**
  String get trapping_and_bleed;

  /// No description provided for @trapping_black.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get trapping_black;

  /// No description provided for @trapping_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get trapping_normal;

  /// No description provided for @trapping_picture.
  ///
  /// In en, this message translates to:
  /// **'Pictures'**
  String get trapping_picture;

  /// No description provided for @trapping_pullback.
  ///
  /// In en, this message translates to:
  /// **'Pullback'**
  String get trapping_pullback;

  /// No description provided for @trapping_special_colors.
  ///
  /// In en, this message translates to:
  /// **'Special Colors'**
  String get trapping_special_colors;
}

class _ElbPrepressLocalizationsDelegate
    extends LocalizationsDelegate<ElbPrepressLocalizations> {
  const _ElbPrepressLocalizationsDelegate();

  @override
  Future<ElbPrepressLocalizations> load(Locale locale) {
    return SynchronousFuture<ElbPrepressLocalizations>(
        lookupElbPrepressLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ElbPrepressLocalizationsDelegate old) => false;
}

ElbPrepressLocalizations lookupElbPrepressLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return ElbPrepressLocalizationsDe();
    case 'en':
      return ElbPrepressLocalizationsEn();
  }

  throw FlutterError(
      'ElbPrepressLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
