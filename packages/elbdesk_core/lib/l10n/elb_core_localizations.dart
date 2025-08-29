import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'elb_core_localizations_de.dart';
import 'elb_core_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ElbCoreLocalizations
/// returned by `ElbCoreLocalizations.of(context)`.
///
/// Applications need to include `ElbCoreLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/elb_core_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ElbCoreLocalizations.localizationsDelegates,
///   supportedLocales: ElbCoreLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ElbCoreLocalizations.supportedLocales
/// property.
abstract class ElbCoreLocalizations {
  ElbCoreLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ElbCoreLocalizations? of(BuildContext context) {
    return Localizations.of<ElbCoreLocalizations>(
        context, ElbCoreLocalizations);
  }

  static const LocalizationsDelegate<ElbCoreLocalizations> delegate =
      _ElbCoreLocalizationsDelegate();

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

  /// No description provided for @add_bearer.
  ///
  /// In de, this message translates to:
  /// **'Steg hinzufügen'**
  String get add_bearer;

  /// No description provided for @admin_add_user.
  ///
  /// In de, this message translates to:
  /// **'Benutzer hinzufügen'**
  String get admin_add_user;

  /// No description provided for @admin_app_users_plural.
  ///
  /// In de, this message translates to:
  /// **'Benutzer'**
  String get admin_app_users_plural;

  /// No description provided for @admin_app_users_singular.
  ///
  /// In de, this message translates to:
  /// **'Benutzer'**
  String get admin_app_users_singular;

  /// No description provided for @admin_log_title_plural.
  ///
  /// In de, this message translates to:
  /// **'Admin-Logs'**
  String get admin_log_title_plural;

  /// No description provided for @admin_log_title_singular.
  ///
  /// In de, this message translates to:
  /// **'Admin-Log'**
  String get admin_log_title_singular;

  /// No description provided for @admin_new_user.
  ///
  /// In de, this message translates to:
  /// **'Neuer Benutzer'**
  String get admin_new_user;

  /// No description provided for @admin_service_user_tokens_create_token_button_label.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get admin_service_user_tokens_create_token_button_label;

  /// No description provided for @admin_service_user_tokens_plural.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get admin_service_user_tokens_plural;

  /// No description provided for @admin_service_user_tokens_refresh_tokens_button_label.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get admin_service_user_tokens_refresh_tokens_button_label;

  /// No description provided for @admin_service_user_tokens_singular.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get admin_service_user_tokens_singular;

  /// No description provided for @admin_service_users_create_token_confirmation_button_label.
  ///
  /// In de, this message translates to:
  /// **'Verstanden'**
  String get admin_service_users_create_token_confirmation_button_label;

  /// No description provided for @admin_service_users_create_token_confirmation_message.
  ///
  /// In de, this message translates to:
  /// **'Schreiben Sie das Token auf, es wird nicht möglich sein es erneut anzuzeigen'**
  String get admin_service_users_create_token_confirmation_message;

  /// No description provided for @admin_service_users_create_token_dialog_title.
  ///
  /// In de, this message translates to:
  /// **'Service Benutzer Token'**
  String get admin_service_users_create_token_dialog_title;

  /// No description provided for @admin_service_users_plural.
  ///
  /// In de, this message translates to:
  /// **'Service Benutzer'**
  String get admin_service_users_plural;

  /// No description provided for @admin_service_users_singular.
  ///
  /// In de, this message translates to:
  /// **'Service Benutzer'**
  String get admin_service_users_singular;

  /// No description provided for @admin_service_users_token_field_description.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get admin_service_users_token_field_description;

  /// No description provided for @admin_service_users_token_field_label.
  ///
  /// In de, this message translates to:
  /// **'Token'**
  String get admin_service_users_token_field_label;

  /// No description provided for @admin_title.
  ///
  /// In de, this message translates to:
  /// **'Admin'**
  String get admin_title;

  /// No description provided for @admin_user.
  ///
  /// In de, this message translates to:
  /// **'Benutzer'**
  String get admin_user;

  /// No description provided for @admin_user_blocked.
  ///
  /// In de, this message translates to:
  /// **'Blockiert'**
  String get admin_user_blocked;

  /// No description provided for @admin_user_created.
  ///
  /// In de, this message translates to:
  /// **'Erstellt am'**
  String get admin_user_created;

  /// No description provided for @admin_user_email_private.
  ///
  /// In de, this message translates to:
  /// **'E-Mail (Privat)'**
  String get admin_user_email_private;

  /// No description provided for @admin_user_email_work.
  ///
  /// In de, this message translates to:
  /// **'E-Mail (Arbeit)'**
  String get admin_user_email_work;

  /// No description provided for @admin_user_full_name.
  ///
  /// In de, this message translates to:
  /// **'Vollständiger Name'**
  String get admin_user_full_name;

  /// No description provided for @admin_user_image_url.
  ///
  /// In de, this message translates to:
  /// **'Bild URL'**
  String get admin_user_image_url;

  /// No description provided for @admin_user_info.
  ///
  /// In de, this message translates to:
  /// **'Benutzerinformation'**
  String get admin_user_info;

  /// No description provided for @admin_user_info_full_name.
  ///
  /// In de, this message translates to:
  /// **'Vollständiger Name'**
  String get admin_user_info_full_name;

  /// No description provided for @admin_user_scope_names.
  ///
  /// In de, this message translates to:
  /// **'Bereichsnamen'**
  String get admin_user_scope_names;

  /// No description provided for @admin_user_user_identifier.
  ///
  /// In de, this message translates to:
  /// **'Benutzerkennung'**
  String get admin_user_user_identifier;

  /// No description provided for @admin_user_user_info_id.
  ///
  /// In de, this message translates to:
  /// **'Benutzerinfo-ID'**
  String get admin_user_user_info_id;

  /// No description provided for @admin_user_user_name.
  ///
  /// In de, this message translates to:
  /// **'Nutzername'**
  String get admin_user_user_name;

  /// No description provided for @app_scope_access.
  ///
  /// In de, this message translates to:
  /// **'Zugriff'**
  String get app_scope_access;

  /// No description provided for @app_scope_account_permissions.
  ///
  /// In de, this message translates to:
  /// **'Kontoberechtigungen'**
  String get app_scope_account_permissions;

  /// No description provided for @app_scope_address.
  ///
  /// In de, this message translates to:
  /// **'Adresse'**
  String get app_scope_address;

  /// No description provided for @app_scope_address_description.
  ///
  /// In de, this message translates to:
  /// **'Adressen Berechtigung'**
  String get app_scope_address_description;

  /// No description provided for @app_scope_admin.
  ///
  /// In de, this message translates to:
  /// **'Verwaltung'**
  String get app_scope_admin;

  /// No description provided for @app_scope_admin_description.
  ///
  /// In de, this message translates to:
  /// **'Administratorbereich mit vollem Zugriff auf alle Ressourcen.'**
  String get app_scope_admin_description;

  /// No description provided for @app_scope_app_client.
  ///
  /// In de, this message translates to:
  /// **'Mandant'**
  String get app_scope_app_client;

  /// No description provided for @app_scope_app_client_description.
  ///
  /// In de, this message translates to:
  /// **'Mandanten Berechtigung'**
  String get app_scope_app_client_description;

  /// No description provided for @app_scope_app_user.
  ///
  /// In de, this message translates to:
  /// **'Benutzer'**
  String get app_scope_app_user;

  /// No description provided for @app_scope_app_user_description.
  ///
  /// In de, this message translates to:
  /// **'Benutzer Berechtigung'**
  String get app_scope_app_user_description;

  /// No description provided for @app_scope_artwork.
  ///
  /// In de, this message translates to:
  /// **'Artwork'**
  String get app_scope_artwork;

  /// No description provided for @app_scope_artwork_color.
  ///
  /// In de, this message translates to:
  /// **'Artwork Farbe'**
  String get app_scope_artwork_color;

  /// No description provided for @app_scope_artwork_color_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Farben Berechtigung'**
  String get app_scope_artwork_color_description;

  /// No description provided for @app_scope_artwork_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Berechtigung'**
  String get app_scope_artwork_description;

  /// No description provided for @app_scope_artwork_layer.
  ///
  /// In de, this message translates to:
  /// **'Artwork Ebene'**
  String get app_scope_artwork_layer;

  /// No description provided for @app_scope_artwork_layer_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Ebenen Berechtigung'**
  String get app_scope_artwork_layer_description;

  /// No description provided for @app_scope_artwork_log.
  ///
  /// In de, this message translates to:
  /// **'Artwork Log'**
  String get app_scope_artwork_log;

  /// No description provided for @app_scope_artwork_log_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Log Berechtigung'**
  String get app_scope_artwork_log_description;

  /// No description provided for @app_scope_artwork_master.
  ///
  /// In de, this message translates to:
  /// **'Artwork Master'**
  String get app_scope_artwork_master;

  /// No description provided for @app_scope_artwork_master_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Master Berechtigung'**
  String get app_scope_artwork_master_description;

  /// No description provided for @app_scope_artwork_quarantine.
  ///
  /// In de, this message translates to:
  /// **'Artwork Quarantäne'**
  String get app_scope_artwork_quarantine;

  /// No description provided for @app_scope_artwork_quarantine_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Quarantäne Berechtigung'**
  String get app_scope_artwork_quarantine_description;

  /// No description provided for @app_scope_artwork_template.
  ///
  /// In de, this message translates to:
  /// **'Artwork Vorlage'**
  String get app_scope_artwork_template;

  /// No description provided for @app_scope_artwork_template_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Vorlagen Berechtigung'**
  String get app_scope_artwork_template_description;

  /// No description provided for @app_scope_artwork_template_pre_selection.
  ///
  /// In de, this message translates to:
  /// **'Artwork Vorlagen Vorauswahl'**
  String get app_scope_artwork_template_pre_selection;

  /// No description provided for @app_scope_artwork_template_pre_selection_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Vorlagen Vorauswahl Berechtigung'**
  String get app_scope_artwork_template_pre_selection_description;

  /// No description provided for @app_scope_artwork_template_selection.
  ///
  /// In de, this message translates to:
  /// **'Artwork Vorlagen Auswahl'**
  String get app_scope_artwork_template_selection;

  /// No description provided for @app_scope_artwork_template_selection_description.
  ///
  /// In de, this message translates to:
  /// **'Artwork Vorlagen Auswahl Berechtigung'**
  String get app_scope_artwork_template_selection_description;

  /// No description provided for @app_scope_automation_engine.
  ///
  /// In de, this message translates to:
  /// **'Automation Engine'**
  String get app_scope_automation_engine;

  /// No description provided for @app_scope_automation_engine_description.
  ///
  /// In de, this message translates to:
  /// **'Automation Engine scope'**
  String get app_scope_automation_engine_description;

  /// No description provided for @app_scope_bearer.
  ///
  /// In de, this message translates to:
  /// **'Steg'**
  String get app_scope_bearer;

  /// No description provided for @app_scope_bearer_description.
  ///
  /// In de, this message translates to:
  /// **'Stege Berechtigung'**
  String get app_scope_bearer_description;

  /// No description provided for @app_scope_company_employee.
  ///
  /// In de, this message translates to:
  /// **'Unternehmensmitarbeiter'**
  String get app_scope_company_employee;

  /// No description provided for @app_scope_company_employee_description.
  ///
  /// In de, this message translates to:
  /// **'Unternehmensmitarbeiter Berechtigung'**
  String get app_scope_company_employee_description;

  /// No description provided for @app_scope_contact.
  ///
  /// In de, this message translates to:
  /// **'Kontakt'**
  String get app_scope_contact;

  /// No description provided for @app_scope_contact_company.
  ///
  /// In de, this message translates to:
  /// **'Kontakt Unternehmen'**
  String get app_scope_contact_company;

  /// No description provided for @app_scope_contact_company_description.
  ///
  /// In de, this message translates to:
  /// **'Kontakt Unternehmens Berechtigung'**
  String get app_scope_contact_company_description;

  /// No description provided for @app_scope_contact_description.
  ///
  /// In de, this message translates to:
  /// **'Kontakt Berechtigung'**
  String get app_scope_contact_description;

  /// No description provided for @app_scope_contact_person.
  ///
  /// In de, this message translates to:
  /// **'Kontaktperson'**
  String get app_scope_contact_person;

  /// No description provided for @app_scope_contact_person_description.
  ///
  /// In de, this message translates to:
  /// **'Kontaktperson Berechtigung'**
  String get app_scope_contact_person_description;

  /// No description provided for @app_scope_country_code.
  ///
  /// In de, this message translates to:
  /// **'Ländercode'**
  String get app_scope_country_code;

  /// No description provided for @app_scope_country_code_description.
  ///
  /// In de, this message translates to:
  /// **'Ländercode Berechtigung'**
  String get app_scope_country_code_description;

  /// No description provided for @app_scope_crm_admin.
  ///
  /// In de, this message translates to:
  /// **'CRM Administrator'**
  String get app_scope_crm_admin;

  /// No description provided for @app_scope_crm_admin_description.
  ///
  /// In de, this message translates to:
  /// **'Administratorbereich mit Zugriff auf CRM-Ressourcen und kundenspezifische Daten.'**
  String get app_scope_crm_admin_description;

  /// No description provided for @app_scope_customer.
  ///
  /// In de, this message translates to:
  /// **'Kunde'**
  String get app_scope_customer;

  /// No description provided for @app_scope_customer_color_spec.
  ///
  /// In de, this message translates to:
  /// **'Kundenspezifische Farbangaben'**
  String get app_scope_customer_color_spec;

  /// No description provided for @app_scope_customer_color_spec_description.
  ///
  /// In de, this message translates to:
  /// **'Kundenspezifische Farbangaben Berechtigung'**
  String get app_scope_customer_color_spec_description;

  /// No description provided for @app_scope_customer_contact.
  ///
  /// In de, this message translates to:
  /// **'Kundenkontakt'**
  String get app_scope_customer_contact;

  /// No description provided for @app_scope_customer_contact_description.
  ///
  /// In de, this message translates to:
  /// **'Kundenkontakt Berechtigung'**
  String get app_scope_customer_contact_description;

  /// No description provided for @app_scope_customer_contacts.
  ///
  /// In de, this message translates to:
  /// **'Kundenkontakte'**
  String get app_scope_customer_contacts;

  /// No description provided for @app_scope_customer_contacts_description.
  ///
  /// In de, this message translates to:
  /// **'Kundenkontakte Berechtigung'**
  String get app_scope_customer_contacts_description;

  /// No description provided for @app_scope_customer_description.
  ///
  /// In de, this message translates to:
  /// **'Kunden Berechtigung'**
  String get app_scope_customer_description;

  /// No description provided for @app_scope_department_code.
  ///
  /// In de, this message translates to:
  /// **'Abteilungscode'**
  String get app_scope_department_code;

  /// No description provided for @app_scope_department_code_description.
  ///
  /// In de, this message translates to:
  /// **'Abteilungscode Berechtigung'**
  String get app_scope_department_code_description;

  /// No description provided for @app_scope_editor.
  ///
  /// In de, this message translates to:
  /// **'Editor'**
  String get app_scope_editor;

  /// No description provided for @app_scope_editor_description.
  ///
  /// In de, this message translates to:
  /// **'Editorbereich mit Zugriff zum Bearbeiten von Ressourcen.'**
  String get app_scope_editor_description;

  /// No description provided for @app_scope_entity_lock.
  ///
  /// In de, this message translates to:
  /// **'Entitätssperre'**
  String get app_scope_entity_lock;

  /// No description provided for @app_scope_entity_lock_description.
  ///
  /// In de, this message translates to:
  /// **'Entitätssperre Berechtigung'**
  String get app_scope_entity_lock_description;

  /// No description provided for @app_scope_entity_log.
  ///
  /// In de, this message translates to:
  /// **'Entitätsprotokoll'**
  String get app_scope_entity_log;

  /// No description provided for @app_scope_entity_log_description.
  ///
  /// In de, this message translates to:
  /// **'Entitätsprotokoll Berechtigung'**
  String get app_scope_entity_log_description;

  /// No description provided for @app_scope_guest.
  ///
  /// In de, this message translates to:
  /// **'Gast'**
  String get app_scope_guest;

  /// No description provided for @app_scope_guest_description.
  ///
  /// In de, this message translates to:
  /// **'Gastbereich mit schreibgeschütztem Zugriff auf Ressourcen.'**
  String get app_scope_guest_description;

  /// No description provided for @app_scope_json_template.
  ///
  /// In de, this message translates to:
  /// **'JSON Vorlage'**
  String get app_scope_json_template;

  /// No description provided for @app_scope_json_template_description.
  ///
  /// In de, this message translates to:
  /// **'JSON Vorlagen Berechtigung'**
  String get app_scope_json_template_description;

  /// No description provided for @app_scope_language_code.
  ///
  /// In de, this message translates to:
  /// **'Sprachcode'**
  String get app_scope_language_code;

  /// No description provided for @app_scope_language_code_description.
  ///
  /// In de, this message translates to:
  /// **'Sprachcode Berechtigung'**
  String get app_scope_language_code_description;

  /// No description provided for @app_scope_mop_admin.
  ///
  /// In de, this message translates to:
  /// **'Mop Administrator'**
  String get app_scope_mop_admin;

  /// No description provided for @app_scope_mop_admin_description.
  ///
  /// In de, this message translates to:
  /// **'Administratorbereich mit Zugriff auf Mop-Ressourcen und Prepress-bezogene Daten.'**
  String get app_scope_mop_admin_description;

  /// No description provided for @app_scope_payment_code.
  ///
  /// In de, this message translates to:
  /// **'Zahlungscode'**
  String get app_scope_payment_code;

  /// No description provided for @app_scope_payment_code_description.
  ///
  /// In de, this message translates to:
  /// **'Zahlungscode Berechtigung'**
  String get app_scope_payment_code_description;

  /// No description provided for @app_scope_permission_none.
  ///
  /// In de, this message translates to:
  /// **'Kein Zugriff'**
  String get app_scope_permission_none;

  /// No description provided for @app_scope_permission_read.
  ///
  /// In de, this message translates to:
  /// **'Lesen'**
  String get app_scope_permission_read;

  /// No description provided for @app_scope_permission_rw.
  ///
  /// In de, this message translates to:
  /// **'Lesen/Schreiben'**
  String get app_scope_permission_rw;

  /// No description provided for @app_scope_permission_rwd.
  ///
  /// In de, this message translates to:
  /// **'Lesen/Schreiben/Löschen'**
  String get app_scope_permission_rwd;

  /// No description provided for @app_scope_permissions.
  ///
  /// In de, this message translates to:
  /// **'Berechtigungen'**
  String get app_scope_permissions;

  /// No description provided for @app_scope_prepress_color_palette.
  ///
  /// In de, this message translates to:
  /// **'Prepress Farbpalette'**
  String get app_scope_prepress_color_palette;

  /// No description provided for @app_scope_prepress_color_palette_description.
  ///
  /// In de, this message translates to:
  /// **'Prepress Farbpaletten Berechtigung'**
  String get app_scope_prepress_color_palette_description;

  /// No description provided for @app_scope_print_layout.
  ///
  /// In de, this message translates to:
  /// **'Drucklayout'**
  String get app_scope_print_layout;

  /// No description provided for @app_scope_print_layout_description.
  ///
  /// In de, this message translates to:
  /// **'Drucklayout Berechtigung'**
  String get app_scope_print_layout_description;

  /// No description provided for @app_scope_product.
  ///
  /// In de, this message translates to:
  /// **'Produkt'**
  String get app_scope_product;

  /// No description provided for @app_scope_product_description.
  ///
  /// In de, this message translates to:
  /// **'Produkt Berechtigung'**
  String get app_scope_product_description;

  /// No description provided for @app_scope_product_master.
  ///
  /// In de, this message translates to:
  /// **'Produkt Master'**
  String get app_scope_product_master;

  /// No description provided for @app_scope_product_master_description.
  ///
  /// In de, this message translates to:
  /// **'Produkt Master Berechtigung'**
  String get app_scope_product_master_description;

  /// No description provided for @app_scope_sales_order.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsauftrag'**
  String get app_scope_sales_order;

  /// No description provided for @app_scope_sales_order_description.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsauftrag Berechtigung'**
  String get app_scope_sales_order_description;

  /// No description provided for @app_scope_sales_order_item.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsauftragsposition'**
  String get app_scope_sales_order_item;

  /// No description provided for @app_scope_sales_order_item_description.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsauftragsposition Berechtigung'**
  String get app_scope_sales_order_item_description;

  /// No description provided for @app_scope_sales_order_status.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsauftragsstatus'**
  String get app_scope_sales_order_status;

  /// No description provided for @app_scope_sales_order_status_description.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsauftragsstatus Berechtigung'**
  String get app_scope_sales_order_status_description;

  /// No description provided for @app_scope_salutation_code.
  ///
  /// In de, this message translates to:
  /// **'Anredecode'**
  String get app_scope_salutation_code;

  /// No description provided for @app_scope_salutation_code_description.
  ///
  /// In de, this message translates to:
  /// **'Anredecodes Berechtigung'**
  String get app_scope_salutation_code_description;

  /// No description provided for @app_scope_service_user.
  ///
  /// In de, this message translates to:
  /// **'Service Benutzer'**
  String get app_scope_service_user;

  /// No description provided for @app_scope_service_user_description.
  ///
  /// In de, this message translates to:
  /// **'Service Benutzer Berechtigung'**
  String get app_scope_service_user_description;

  /// No description provided for @app_scope_soi_prepare_artwork.
  ///
  /// In de, this message translates to:
  /// **'SOI Artwork aufbereiten'**
  String get app_scope_soi_prepare_artwork;

  /// No description provided for @app_scope_soi_prepare_artwork_description.
  ///
  /// In de, this message translates to:
  /// **'SOI Artwork aufbereiten Berechtigung'**
  String get app_scope_soi_prepare_artwork_description;

  /// No description provided for @app_scope_soi_step_and_repeat.
  ///
  /// In de, this message translates to:
  /// **'SOI Step & Repeat'**
  String get app_scope_soi_step_and_repeat;

  /// No description provided for @app_scope_soi_step_and_repeat_description.
  ///
  /// In de, this message translates to:
  /// **'SOI Step & Repeat Berechtigung'**
  String get app_scope_soi_step_and_repeat_description;

  /// No description provided for @app_scope_super_admin.
  ///
  /// In de, this message translates to:
  /// **'Super admin'**
  String get app_scope_super_admin;

  /// No description provided for @app_scope_super_admin_description.
  ///
  /// In de, this message translates to:
  /// **'Superadministratorbereich mit vollem Zugriff auf alle Ressourcen.'**
  String get app_scope_super_admin_description;

  /// No description provided for @app_title.
  ///
  /// In de, this message translates to:
  /// **'ElbDesk - Carl Ostermann Erben'**
  String get app_title;

  /// No description provided for @app_user.
  ///
  /// In de, this message translates to:
  /// **'Benutzer'**
  String get app_user;

  /// No description provided for @app_user_add_scopes.
  ///
  /// In de, this message translates to:
  /// **'Bereiche hinzufügen'**
  String get app_user_add_scopes;

  /// No description provided for @app_user_communication.
  ///
  /// In de, this message translates to:
  /// **'Kommunikation'**
  String get app_user_communication;

  /// No description provided for @app_user_cost_center.
  ///
  /// In de, this message translates to:
  /// **'Kostenstelle'**
  String get app_user_cost_center;

  /// No description provided for @app_user_department.
  ///
  /// In de, this message translates to:
  /// **'Abteilung'**
  String get app_user_department;

  /// No description provided for @app_user_employee_information.
  ///
  /// In de, this message translates to:
  /// **'Mitarbeiter Daten'**
  String get app_user_employee_information;

  /// No description provided for @app_user_employee_number.
  ///
  /// In de, this message translates to:
  /// **'Mitarbeiternummer'**
  String get app_user_employee_number;

  /// No description provided for @app_user_entry_date.
  ///
  /// In de, this message translates to:
  /// **'Eintrittsdatum'**
  String get app_user_entry_date;

  /// No description provided for @app_user_is_active.
  ///
  /// In de, this message translates to:
  /// **'Aktiv'**
  String get app_user_is_active;

  /// No description provided for @app_user_position.
  ///
  /// In de, this message translates to:
  /// **'Position'**
  String get app_user_position;

  /// No description provided for @app_user_scopes.
  ///
  /// In de, this message translates to:
  /// **'Bereiche'**
  String get app_user_scopes;

  /// No description provided for @app_user_termination_date.
  ///
  /// In de, this message translates to:
  /// **'Austrittsdatum'**
  String get app_user_termination_date;

  /// No description provided for @artwork_history_die_cutter_and_radius.
  ///
  /// In de, this message translates to:
  /// **'Stanze & Radius'**
  String get artwork_history_die_cutter_and_radius;

  /// No description provided for @artwork_status_trimmed.
  ///
  /// In de, this message translates to:
  /// **'Trimmed'**
  String get artwork_status_trimmed;

  /// No description provided for @auth_check_inbox.
  ///
  /// In de, this message translates to:
  /// **'Bitte prüfen Sie Ihr E-Mail-Postfach.'**
  String get auth_check_inbox;

  /// No description provided for @auth_email.
  ///
  /// In de, this message translates to:
  /// **'E-Mail'**
  String get auth_email;

  /// No description provided for @auth_forgot_password.
  ///
  /// In de, this message translates to:
  /// **'Passwort vergessen?'**
  String get auth_forgot_password;

  /// No description provided for @auth_invalid_credentials.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Anmeldedaten'**
  String get auth_invalid_credentials;

  /// No description provided for @auth_invalid_email.
  ///
  /// In de, this message translates to:
  /// **'Ungültige E-Mail-Adresse'**
  String get auth_invalid_email;

  /// No description provided for @auth_new_password.
  ///
  /// In de, this message translates to:
  /// **'Neues Passwort'**
  String get auth_new_password;

  /// No description provided for @auth_password.
  ///
  /// In de, this message translates to:
  /// **'Passwort'**
  String get auth_password;

  /// No description provided for @auth_reset_password_and_sign_in.
  ///
  /// In de, this message translates to:
  /// **'Passwort zurücksetzen und anmelden'**
  String get auth_reset_password_and_sign_in;

  /// No description provided for @auth_reset_password_hint.
  ///
  /// In de, this message translates to:
  /// **'Bitte geben Sie Ihre E-Mail-Adresse ein, um Ihr Passwort zurückzusetzen.'**
  String get auth_reset_password_hint;

  /// No description provided for @auth_send_reset_mail.
  ///
  /// In de, this message translates to:
  /// **'E-Mail zum Zurücksetzen senden'**
  String get auth_send_reset_mail;

  /// No description provided for @auth_sent_reset_code_hint.
  ///
  /// In de, this message translates to:
  /// **'Bitte prüfen Sie Ihr E-Mail-Postfach. Wir haben Ihnen einen Sicherheitscode zur Bestätigung Ihres Kontos gesendet.'**
  String get auth_sent_reset_code_hint;

  /// No description provided for @auth_sign_in.
  ///
  /// In de, this message translates to:
  /// **'Anmelden'**
  String get auth_sign_in;

  /// No description provided for @auth_sign_out.
  ///
  /// In de, this message translates to:
  /// **'Abmelden'**
  String get auth_sign_out;

  /// No description provided for @auth_sign_up.
  ///
  /// In de, this message translates to:
  /// **'Registrieren'**
  String get auth_sign_up;

  /// No description provided for @auth_sign_up_full_name.
  ///
  /// In de, this message translates to:
  /// **'Vollständiger Name'**
  String get auth_sign_up_full_name;

  /// No description provided for @auth_user_created_sucessfully.
  ///
  /// In de, this message translates to:
  /// **'Benutzer erfolgreich erstellt'**
  String get auth_user_created_sucessfully;

  /// No description provided for @auth_validation_code.
  ///
  /// In de, this message translates to:
  /// **'Sicherheitscode'**
  String get auth_validation_code;

  /// No description provided for @auth_wrong_code.
  ///
  /// In de, this message translates to:
  /// **'Falscher Code'**
  String get auth_wrong_code;

  /// No description provided for @bearer.
  ///
  /// In de, this message translates to:
  /// **'Steg'**
  String get bearer;

  /// No description provided for @bearer_cost_center_code.
  ///
  /// In de, this message translates to:
  /// **'Kostenstellencode'**
  String get bearer_cost_center_code;

  /// No description provided for @bearer_description.
  ///
  /// In de, this message translates to:
  /// **'Beschreibung'**
  String get bearer_description;

  /// No description provided for @bearer_long_text.
  ///
  /// In de, this message translates to:
  /// **'Langtext (Tasche)'**
  String get bearer_long_text;

  /// No description provided for @bearer_margin_left.
  ///
  /// In de, this message translates to:
  /// **'Abstand Links'**
  String get bearer_margin_left;

  /// No description provided for @bearer_margin_right.
  ///
  /// In de, this message translates to:
  /// **'Abstand Rechts'**
  String get bearer_margin_right;

  /// No description provided for @bearer_min_height.
  ///
  /// In de, this message translates to:
  /// **'Min Höhe'**
  String get bearer_min_height;

  /// No description provided for @bearer_min_width.
  ///
  /// In de, this message translates to:
  /// **'Min Breite'**
  String get bearer_min_width;

  /// No description provided for @bearer_name.
  ///
  /// In de, this message translates to:
  /// **'Name'**
  String get bearer_name;

  /// No description provided for @bearer_new.
  ///
  /// In de, this message translates to:
  /// **'Neuer Steg'**
  String get bearer_new;

  /// No description provided for @bearer_plural.
  ///
  /// In de, this message translates to:
  /// **'Stege'**
  String get bearer_plural;

  /// No description provided for @bearer_singular.
  ///
  /// In de, this message translates to:
  /// **'Steg'**
  String get bearer_singular;

  /// No description provided for @bearer_type.
  ///
  /// In de, this message translates to:
  /// **'Stegtyp'**
  String get bearer_type;

  /// No description provided for @bearer_type_flexo_print_multilayer.
  ///
  /// In de, this message translates to:
  /// **'Flexodruck Mehrschichtig'**
  String get bearer_type_flexo_print_multilayer;

  /// No description provided for @bearer_type_none.
  ///
  /// In de, this message translates to:
  /// **'Keiner'**
  String get bearer_type_none;

  /// No description provided for @bearer_type_offset_press_fixed_plate.
  ///
  /// In de, this message translates to:
  /// **'Offsetpresse mit festen Plattengrößen'**
  String get bearer_type_offset_press_fixed_plate;

  /// No description provided for @bearer_type_sheet_fed_press_fixed_plate.
  ///
  /// In de, this message translates to:
  /// **'Bogen-geführt Presse mit fester Plattengröße'**
  String get bearer_type_sheet_fed_press_fixed_plate;

  /// No description provided for @bearer_type_sheet_fed_press_min_plate.
  ///
  /// In de, this message translates to:
  /// **'Bogen-geführt Presse mit minimaler Plattengröße'**
  String get bearer_type_sheet_fed_press_min_plate;

  /// No description provided for @bearer_type_sheet_fed_press_plate_equals_sub.
  ///
  /// In de, this message translates to:
  /// **'Bogen-geführt Presse: Plattengröße entspricht Substratbreite'**
  String get bearer_type_sheet_fed_press_plate_equals_sub;

  /// No description provided for @bearer_type_standard_flexo_print.
  ///
  /// In de, this message translates to:
  /// **'Standard-Flexodruck'**
  String get bearer_type_standard_flexo_print;

  /// No description provided for @bearer_type_type1.
  ///
  /// In de, this message translates to:
  /// **'Steg Typ 1'**
  String get bearer_type_type1;

  /// No description provided for @bearer_type_type2.
  ///
  /// In de, this message translates to:
  /// **'Steg Typ 2'**
  String get bearer_type_type2;

  /// No description provided for @bearers.
  ///
  /// In de, this message translates to:
  /// **'Stege'**
  String get bearers;

  /// No description provided for @calendar_selected_date.
  ///
  /// In de, this message translates to:
  /// **'Ausgewähltes Datum'**
  String get calendar_selected_date;

  /// No description provided for @calendar_today.
  ///
  /// In de, this message translates to:
  /// **'Heute'**
  String get calendar_today;

  /// No description provided for @chat_add_a_note_hint.
  ///
  /// In de, this message translates to:
  /// **'Schreibe eine Notiz...'**
  String get chat_add_a_note_hint;

  /// No description provided for @chat_at.
  ///
  /// In de, this message translates to:
  /// **'um'**
  String get chat_at;

  /// No description provided for @chat_edit_note_hint.
  ///
  /// In de, this message translates to:
  /// **'Notiz bearbeiten...'**
  String get chat_edit_note_hint;

  /// No description provided for @chat_just_now.
  ///
  /// In de, this message translates to:
  /// **'Jetzt'**
  String get chat_just_now;

  /// No description provided for @chat_last_modified.
  ///
  /// In de, this message translates to:
  /// **'Zuletzt bearbeitet'**
  String get chat_last_modified;

  /// No description provided for @chat_mark_as_read.
  ///
  /// In de, this message translates to:
  /// **'Als gelesen markieren'**
  String get chat_mark_as_read;

  /// No description provided for @chat_mark_as_unread.
  ///
  /// In de, this message translates to:
  /// **'Als ungelesen markieren'**
  String get chat_mark_as_unread;

  /// No description provided for @chat_message_deleted_hint.
  ///
  /// In de, this message translates to:
  /// **'Diese Nachricht wurde gelöscht'**
  String get chat_message_deleted_hint;

  /// No description provided for @chat_message_min_ago.
  ///
  /// In de, this message translates to:
  /// **'Vor {min} Min.'**
  String chat_message_min_ago(Object min);

  /// No description provided for @chat_no_notes_hint.
  ///
  /// In de, this message translates to:
  /// **'Noch keine Notiz vorhanden.'**
  String get chat_no_notes_hint;

  /// No description provided for @chat_notes.
  ///
  /// In de, this message translates to:
  /// **'Notizen'**
  String get chat_notes;

  /// No description provided for @chat_notification_edited.
  ///
  /// In de, this message translates to:
  /// **'bearbeitet'**
  String get chat_notification_edited;

  /// No description provided for @chat_notifications.
  ///
  /// In de, this message translates to:
  /// **'Benachrichtigungen'**
  String get chat_notifications;

  /// No description provided for @chat_reply.
  ///
  /// In de, this message translates to:
  /// **'Antworten'**
  String get chat_reply;

  /// No description provided for @chat_reply_plural.
  ///
  /// In de, this message translates to:
  /// **'Antworten'**
  String get chat_reply_plural;

  /// No description provided for @chat_reply_singular.
  ///
  /// In de, this message translates to:
  /// **'Antwort'**
  String get chat_reply_singular;

  /// No description provided for @chat_thread.
  ///
  /// In de, this message translates to:
  /// **'Konversation'**
  String get chat_thread;

  /// No description provided for @chat_today_at.
  ///
  /// In de, this message translates to:
  /// **'Heute um'**
  String get chat_today_at;

  /// No description provided for @chat_undo.
  ///
  /// In de, this message translates to:
  /// **'Wiederherstellen'**
  String get chat_undo;

  /// No description provided for @chat_yesterday_at.
  ///
  /// In de, this message translates to:
  /// **'Gestern um'**
  String get chat_yesterday_at;

  /// No description provided for @connectivity_connected_to_internet.
  ///
  /// In de, this message translates to:
  /// **'Mit dem Internet verbunden'**
  String get connectivity_connected_to_internet;

  /// No description provided for @connectivity_connecting_to_internet.
  ///
  /// In de, this message translates to:
  /// **'Verbindung zum Internet herstellen ...'**
  String get connectivity_connecting_to_internet;

  /// No description provided for @connectivity_error_connecting_to_internet.
  ///
  /// In de, this message translates to:
  /// **'Fehler beim Verbinden mit dem Internet'**
  String get connectivity_error_connecting_to_internet;

  /// No description provided for @connectivity_no_internet_connection.
  ///
  /// In de, this message translates to:
  /// **'Keine Internetverbindung'**
  String get connectivity_no_internet_connection;

  /// No description provided for @dashboard_add_tile.
  ///
  /// In de, this message translates to:
  /// **'Kachel hinzufügen'**
  String get dashboard_add_tile;

  /// No description provided for @dashboard_assigned_to_me.
  ///
  /// In de, this message translates to:
  /// **'Mir zugewiesen'**
  String get dashboard_assigned_to_me;

  /// No description provided for @dashboard_bottom_status_bar_coe.
  ///
  /// In de, this message translates to:
  /// **'coe'**
  String get dashboard_bottom_status_bar_coe;

  /// No description provided for @dashboard_recent_items.
  ///
  /// In de, this message translates to:
  /// **'Kürzlich geöffnet'**
  String get dashboard_recent_items;

  /// No description provided for @dashboard_remove_tile.
  ///
  /// In de, this message translates to:
  /// **'Kachel entfernen'**
  String get dashboard_remove_tile;

  /// No description provided for @dashboard_reset_dashboard.
  ///
  /// In de, this message translates to:
  /// **'Dashboard zurücksetzen'**
  String get dashboard_reset_dashboard;

  /// No description provided for @dashboard_reset_tiles_question.
  ///
  /// In de, this message translates to:
  /// **'Möchten Sie das Dashboard zurücksetzen?'**
  String get dashboard_reset_tiles_question;

  /// No description provided for @dashboard_reset_tiles_warning.
  ///
  /// In de, this message translates to:
  /// **'Dies setzt das Dashboard auf die Standardkonfiguration zurück.'**
  String get dashboard_reset_tiles_warning;

  /// No description provided for @dashboard_tile.
  ///
  /// In de, this message translates to:
  /// **'Kachel'**
  String get dashboard_tile;

  /// No description provided for @data_import.
  ///
  /// In de, this message translates to:
  /// **'Dateneingang'**
  String get data_import;

  /// No description provided for @data_import_ae_endpoint.
  ///
  /// In de, this message translates to:
  /// **'AE Endpunkt Dateneingang Pfad'**
  String get data_import_ae_endpoint;

  /// No description provided for @data_import_ae_endpoint_subtitle.
  ///
  /// In de, this message translates to:
  /// **'URL für den AE-Endpunkt'**
  String get data_import_ae_endpoint_subtitle;

  /// No description provided for @data_import_ae_endpoint_title.
  ///
  /// In de, this message translates to:
  /// **'Endpunkt AE'**
  String get data_import_ae_endpoint_title;

  /// No description provided for @data_import_analyzing.
  ///
  /// In de, this message translates to:
  /// **'Analysieren...'**
  String get data_import_analyzing;

  /// No description provided for @data_import_artworks_as_pdf.
  ///
  /// In de, this message translates to:
  /// **'Artworks als PDF'**
  String get data_import_artworks_as_pdf;

  /// No description provided for @data_import_artworks_or_attachments.
  ///
  /// In de, this message translates to:
  /// **'Artworks oder Anhänge'**
  String get data_import_artworks_or_attachments;

  /// No description provided for @data_import_attachment_email.
  ///
  /// In de, this message translates to:
  /// **'Emails'**
  String get data_import_attachment_email;

  /// No description provided for @data_import_attachment_general.
  ///
  /// In de, this message translates to:
  /// **'Allgemeine Anhänge'**
  String get data_import_attachment_general;

  /// No description provided for @data_import_attachment_order.
  ///
  /// In de, this message translates to:
  /// **'Bestellung'**
  String get data_import_attachment_order;

  /// No description provided for @data_import_attachments.
  ///
  /// In de, this message translates to:
  /// **'Anhänge'**
  String get data_import_attachments;

  /// No description provided for @data_import_color.
  ///
  /// In de, this message translates to:
  /// **'Farbe'**
  String get data_import_color;

  /// No description provided for @data_import_color_angle.
  ///
  /// In de, this message translates to:
  /// **'Winkel'**
  String get data_import_color_angle;

  /// No description provided for @data_import_color_attribute.
  ///
  /// In de, this message translates to:
  /// **'Attribut'**
  String get data_import_color_attribute;

  /// No description provided for @data_import_color_book.
  ///
  /// In de, this message translates to:
  /// **'Buch'**
  String get data_import_color_book;

  /// No description provided for @data_import_color_database_color.
  ///
  /// In de, this message translates to:
  /// **'Datenbankfarbe'**
  String get data_import_color_database_color;

  /// No description provided for @data_import_color_dot_shape.
  ///
  /// In de, this message translates to:
  /// **'Punktform'**
  String get data_import_color_dot_shape;

  /// No description provided for @data_import_color_frequency.
  ///
  /// In de, this message translates to:
  /// **'Frequenz'**
  String get data_import_color_frequency;

  /// No description provided for @data_import_color_name.
  ///
  /// In de, this message translates to:
  /// **'Name'**
  String get data_import_color_name;

  /// No description provided for @data_import_color_not_found_in_database.
  ///
  /// In de, this message translates to:
  /// **'Nicht in der Datenbank gefunden'**
  String get data_import_color_not_found_in_database;

  /// No description provided for @data_import_color_printing_method.
  ///
  /// In de, this message translates to:
  /// **'Druckmethode'**
  String get data_import_color_printing_method;

  /// No description provided for @data_import_color_specification_count.
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =0{Keine Farben gefunden} =1{Eine Farbe gefunden} other{{count} Farben gefunden}}'**
  String data_import_color_specification_count(num count);

  /// No description provided for @data_import_color_specifications.
  ///
  /// In de, this message translates to:
  /// **'Farbspezifikationen'**
  String get data_import_color_specifications;

  /// No description provided for @data_import_color_type.
  ///
  /// In de, this message translates to:
  /// **'Typ'**
  String get data_import_color_type;

  /// No description provided for @data_import_create_date.
  ///
  /// In de, this message translates to:
  /// **'Erstellungsdatum'**
  String get data_import_create_date;

  /// No description provided for @data_import_customer_selection_title.
  ///
  /// In de, this message translates to:
  /// **'Kunden auswählen'**
  String get data_import_customer_selection_title;

  /// No description provided for @data_import_delete_originals.
  ///
  /// In de, this message translates to:
  /// **'Originale löschen'**
  String get data_import_delete_originals;

  /// No description provided for @data_import_document_id.
  ///
  /// In de, this message translates to:
  /// **'Dokument ID'**
  String get data_import_document_id;

  /// No description provided for @data_import_download_error.
  ///
  /// In de, this message translates to:
  /// **'Download abgebrochen'**
  String get data_import_download_error;

  /// No description provided for @data_import_download_success.
  ///
  /// In de, this message translates to:
  /// **'Download erfolgreich'**
  String get data_import_download_success;

  /// No description provided for @data_import_drop_file_here.
  ///
  /// In de, this message translates to:
  /// **'PDF oder XML Datei hier ablegen'**
  String get data_import_drop_file_here;

  /// No description provided for @data_import_drop_pdf_or_xml.
  ///
  /// In de, this message translates to:
  /// **'Bitte legen Sie entweder eine PDF- oder XML-Datei ab'**
  String get data_import_drop_pdf_or_xml;

  /// No description provided for @data_import_error_picking_directory.
  ///
  /// In de, this message translates to:
  /// **'Error setting directory'**
  String get data_import_error_picking_directory;

  /// No description provided for @data_import_error_processing_file.
  ///
  /// In de, this message translates to:
  /// **'Fehler beim Verarbeiten der Datei'**
  String get data_import_error_processing_file;

  /// No description provided for @data_import_error_resetting_directory.
  ///
  /// In de, this message translates to:
  /// **'Error resetting directory'**
  String get data_import_error_resetting_directory;

  /// No description provided for @data_import_file_name.
  ///
  /// In de, this message translates to:
  /// **'Dateiname'**
  String get data_import_file_name;

  /// No description provided for @data_import_format.
  ///
  /// In de, this message translates to:
  /// **'Format'**
  String get data_import_format;

  /// No description provided for @data_import_invalid_file_type.
  ///
  /// In de, this message translates to:
  /// **'Falscher Datentyp'**
  String get data_import_invalid_file_type;

  /// No description provided for @data_import_modify_date.
  ///
  /// In de, this message translates to:
  /// **'Änderungsdatum'**
  String get data_import_modify_date;

  /// No description provided for @data_import_navigation_artworks.
  ///
  /// In de, this message translates to:
  /// **'Artworks'**
  String get data_import_navigation_artworks;

  /// No description provided for @data_import_navigation_home.
  ///
  /// In de, this message translates to:
  /// **'Start'**
  String get data_import_navigation_home;

  /// No description provided for @data_import_navigation_xml_parser.
  ///
  /// In de, this message translates to:
  /// **'XML Parser'**
  String get data_import_navigation_xml_parser;

  /// No description provided for @data_import_no_access.
  ///
  /// In de, this message translates to:
  /// **'Kein Zugriff auf Ausgabe Pfad'**
  String get data_import_no_access;

  /// No description provided for @data_import_no_permission_output_folder.
  ///
  /// In de, this message translates to:
  /// **'Keine Berechtigung für den ausgewählten Ausgabeordner. Überprüfen Sie die Systemeinstellungen oder ändern Sie den Ausgabeordner.'**
  String get data_import_no_permission_output_folder;

  /// No description provided for @data_import_or_click_to_select.
  ///
  /// In de, this message translates to:
  /// **'oder klicken zum Auswählen'**
  String get data_import_or_click_to_select;

  /// No description provided for @data_import_output_path.
  ///
  /// In de, this message translates to:
  /// **'Ausgabepfad'**
  String get data_import_output_path;

  /// No description provided for @data_import_output_path_choose_folder.
  ///
  /// In de, this message translates to:
  /// **'Ordner auswählen'**
  String get data_import_output_path_choose_folder;

  /// No description provided for @data_import_output_path_reset_to_default.
  ///
  /// In de, this message translates to:
  /// **'Auf Standard zurücksetzen'**
  String get data_import_output_path_reset_to_default;

  /// No description provided for @data_import_output_path_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Ordner in dem die Dateien gespeichert werden sollen'**
  String get data_import_output_path_subtitle;

  /// No description provided for @data_import_parsed_xml_data.
  ///
  /// In de, this message translates to:
  /// **'Geparste XML Daten'**
  String get data_import_parsed_xml_data;

  /// No description provided for @data_import_pdf_uploaded_drop_xml.
  ///
  /// In de, this message translates to:
  /// **'PDF hochgeladen. Bitte legen Sie die zugehörige XML-Datei ab.'**
  String get data_import_pdf_uploaded_drop_xml;

  /// No description provided for @data_import_save.
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get data_import_save;

  /// No description provided for @data_import_select_empty_customer_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Wählen Sie einen Kunden aus, bevor Sie Artworks und Anhänge hinzufügen'**
  String get data_import_select_empty_customer_subtitle;

  /// No description provided for @data_import_select_empty_customer_title.
  ///
  /// In de, this message translates to:
  /// **'Kein Kunde ausgewählt'**
  String get data_import_select_empty_customer_title;

  /// No description provided for @data_import_settings.
  ///
  /// In de, this message translates to:
  /// **'Dateneingang Einstellungen'**
  String get data_import_settings;

  /// No description provided for @data_import_title.
  ///
  /// In de, this message translates to:
  /// **'Titel'**
  String get data_import_title;

  /// No description provided for @data_import_unknown_color.
  ///
  /// In de, this message translates to:
  /// **'Unbekannt'**
  String get data_import_unknown_color;

  /// No description provided for @data_import_use_offline_mode.
  ///
  /// In de, this message translates to:
  /// **'Offline-Modus verwenden'**
  String get data_import_use_offline_mode;

  /// No description provided for @date_time_please_choose.
  ///
  /// In de, this message translates to:
  /// **'Bitte wähle ein Datum aus'**
  String get date_time_please_choose;

  /// No description provided for @developer_check_for_updates_label.
  ///
  /// In de, this message translates to:
  /// **'Nach Updates suchen'**
  String get developer_check_for_updates_label;

  /// No description provided for @developer_clear_cached_constraints_label.
  ///
  /// In de, this message translates to:
  /// **'Zwischengespeicherte Fensterbeschränkungen löschen'**
  String get developer_clear_cached_constraints_label;

  /// No description provided for @developer_clear_cached_constraints_tooltip.
  ///
  /// In de, this message translates to:
  /// **'Löscht zwischengespeicherte Fensterbeschränkungen für den aktuellen Benutzer'**
  String get developer_clear_cached_constraints_tooltip;

  /// No description provided for @developer_clear_shared_prefs_label.
  ///
  /// In de, this message translates to:
  /// **'Shared Prefs löschen'**
  String get developer_clear_shared_prefs_label;

  /// No description provided for @developer_flash_taskbar_icon_label.
  ///
  /// In de, this message translates to:
  /// **'Taskleistensymbol blinken lassen'**
  String get developer_flash_taskbar_icon_label;

  /// No description provided for @developer_flash_taskbar_icon_tooltip.
  ///
  /// In de, this message translates to:
  /// **'Taskleistensymbol blinken lassen'**
  String get developer_flash_taskbar_icon_tooltip;

  /// No description provided for @developer_options.
  ///
  /// In de, this message translates to:
  /// **'Entwickleroptionen'**
  String get developer_options;

  /// No description provided for @developer_set_overlay_icon_label.
  ///
  /// In de, this message translates to:
  /// **'Overlay-Symbol setzen'**
  String get developer_set_overlay_icon_label;

  /// No description provided for @developer_set_overlay_icon_tooltip.
  ///
  /// In de, this message translates to:
  /// **'Overlay-Symbol setzen'**
  String get developer_set_overlay_icon_tooltip;

  /// No description provided for @developer_stop_overlay_icon_tooltip.
  ///
  /// In de, this message translates to:
  /// **'Overlay-Symbol stoppen'**
  String get developer_stop_overlay_icon_tooltip;

  /// No description provided for @developer_update_app_label.
  ///
  /// In de, this message translates to:
  /// **'App aktualisieren'**
  String get developer_update_app_label;

  /// No description provided for @entity_delete_lock.
  ///
  /// In de, this message translates to:
  /// **'Freigeben'**
  String get entity_delete_lock;

  /// No description provided for @entity_delete_lock_message.
  ///
  /// In de, this message translates to:
  /// **'Möchten Sie den Datensatz wirklich freigeben?\nDer Datensatz ist seit {lockedSince} Minuten von {lockedBy} gesperrt. Alle ungespeicherten Eingaben gehen dabei verloren.'**
  String entity_delete_lock_message(Object lockedBy, Object lockedSince);

  /// No description provided for @entity_lock_title.
  ///
  /// In de, this message translates to:
  /// **'Gesperrte Datensätze'**
  String get entity_lock_title;

  /// No description provided for @entity_lock_title_plural.
  ///
  /// In de, this message translates to:
  /// **'Gesperrte Datensätze'**
  String get entity_lock_title_plural;

  /// No description provided for @entity_lock_title_singular.
  ///
  /// In de, this message translates to:
  /// **'Gesperrter Datensatz'**
  String get entity_lock_title_singular;

  /// No description provided for @entity_locked_at.
  ///
  /// In de, this message translates to:
  /// **'Gesperrt am'**
  String get entity_locked_at;

  /// No description provided for @entity_locked_by.
  ///
  /// In de, this message translates to:
  /// **'Gesperrt von'**
  String get entity_locked_by;

  /// No description provided for @entity_obj_id.
  ///
  /// In de, this message translates to:
  /// **'Datensatz-ID'**
  String get entity_obj_id;

  /// No description provided for @entity_session_id.
  ///
  /// In de, this message translates to:
  /// **'Session ID'**
  String get entity_session_id;

  /// No description provided for @entity_table.
  ///
  /// In de, this message translates to:
  /// **'Tabelle'**
  String get entity_table;

  /// No description provided for @exception_already_deleted.
  ///
  /// In de, this message translates to:
  /// **'Der Datensatz wurde bereits gelöscht.'**
  String get exception_already_deleted;

  /// No description provided for @exception_invalid_data.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Daten'**
  String get exception_invalid_data;

  /// No description provided for @exception_invalid_input.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Eingabe'**
  String get exception_invalid_input;

  /// No description provided for @exception_no_permission.
  ///
  /// In de, this message translates to:
  /// **'Sie verfügen nicht über die nötigen Berechtigungen, diesen Datensatz zu bearbeiten.'**
  String get exception_no_permission;

  /// No description provided for @exception_record_already_exists.
  ///
  /// In de, this message translates to:
  /// **'Der eingegebene Wert existiert bereits. Bitte überprüfen Sie Ihre Angaben.'**
  String get exception_record_already_exists;

  /// No description provided for @exception_server_error.
  ///
  /// In de, this message translates to:
  /// **'Unerwarteter Fehler.'**
  String get exception_server_error;

  /// No description provided for @exception_unexpected_error.
  ///
  /// In de, this message translates to:
  /// **'Unerwarteter Fehler'**
  String get exception_unexpected_error;

  /// No description provided for @exception_unexpected_retry.
  ///
  /// In de, this message translates to:
  /// **'Ein unerwarteter Fehler ist aufgetreten. Bitte versuchen Sie es erneut.'**
  String get exception_unexpected_retry;

  /// No description provided for @exception_value_company_employee_already_assigned.
  ///
  /// In de, this message translates to:
  /// **'Der Kontakt ist dem Unternehmen als Mitarbeiter bereits zugeordnet'**
  String get exception_value_company_employee_already_assigned;

  /// No description provided for @exception_value_contact_not_found.
  ///
  /// In de, this message translates to:
  /// **'Der Kontakt existiert nicht.'**
  String get exception_value_contact_not_found;

  /// No description provided for @exception_value_customer_billing_customer_already_exists.
  ///
  /// In de, this message translates to:
  /// **'Der Kunde ist bereits als Zahlungsadresse hinterlegt.'**
  String get exception_value_customer_billing_customer_already_exists;

  /// No description provided for @exception_value_customer_not_found.
  ///
  /// In de, this message translates to:
  /// **'Der Kunde existiert nicht.'**
  String get exception_value_customer_not_found;

  /// No description provided for @exception_value_customer_shipping_contact_already_exists.
  ///
  /// In de, this message translates to:
  /// **'Der Kontakt ist bereits als Lieferadresse hinterlegt.'**
  String get exception_value_customer_shipping_contact_already_exists;

  /// No description provided for @exception_value_data_import_attachment_removal_failed.
  ///
  /// In de, this message translates to:
  /// **'Anhang konnte nicht entfernt werden'**
  String get exception_value_data_import_attachment_removal_failed;

  /// No description provided for @exception_value_data_import_file_analysis_failed.
  ///
  /// In de, this message translates to:
  /// **'Dateianalyse fehlgeschlagen'**
  String get exception_value_data_import_file_analysis_failed;

  /// No description provided for @exception_value_data_import_file_cleanup_failed.
  ///
  /// In de, this message translates to:
  /// **'Dateien konnten nicht bereinigt werden'**
  String get exception_value_data_import_file_cleanup_failed;

  /// No description provided for @exception_value_data_import_file_processing_failed.
  ///
  /// In de, this message translates to:
  /// **'Dateien konnten nicht verarbeitet werden'**
  String get exception_value_data_import_file_processing_failed;

  /// No description provided for @exception_value_data_import_multiple_attachments_not_allowed.
  ///
  /// In de, this message translates to:
  /// **'Nur ein Anhang ist erlaubt'**
  String get exception_value_data_import_multiple_attachments_not_allowed;

  /// No description provided for @exception_value_file_operation_exception.
  ///
  /// In de, this message translates to:
  /// **'Dateiverarbeitung fehlgeschlagen. Möglicherweise kein Zugriff auf Pfad.'**
  String get exception_value_file_operation_exception;

  /// No description provided for @exception_value_file_path_access.
  ///
  /// In de, this message translates to:
  /// **'Kein Zugriff auf Dateipfad'**
  String get exception_value_file_path_access;

  /// No description provided for @exception_value_invalid_file_type_pdf.
  ///
  /// In de, this message translates to:
  /// **'Ungültiger Dateityp. Nur .pdf Dateien sind erlaubt'**
  String get exception_value_invalid_file_type_pdf;

  /// No description provided for @exception_value_invalid_file_type_pdf_and_zip.
  ///
  /// In de, this message translates to:
  /// **'Ungültiger Dateityp. Nur .pdf und .zip Dateien sind erlaubt'**
  String get exception_value_invalid_file_type_pdf_and_zip;

  /// No description provided for @exception_value_invalid_file_type_zip.
  ///
  /// In de, this message translates to:
  /// **'Ungültiger Dateityp. Nur .zip Dateien sind erlaubt'**
  String get exception_value_invalid_file_type_zip;

  /// No description provided for @exception_value_invalid_session.
  ///
  /// In de, this message translates to:
  /// **'Sie sind nicht berechtigt, diesen Datensatz zu ändern.'**
  String get exception_value_invalid_session;

  /// No description provided for @exception_value_missing_permissions.
  ///
  /// In de, this message translates to:
  /// **'Fehlende Berechtigungen: {permissons}'**
  String exception_value_missing_permissions(Object permissons);

  /// No description provided for @exception_value_modified_by_other_user.
  ///
  /// In de, this message translates to:
  /// **'Der Datensatz wurde zwischenzeitlich von einem anderen Benutzer geändert.'**
  String get exception_value_modified_by_other_user;

  /// No description provided for @exception_value_no_permissions.
  ///
  /// In de, this message translates to:
  /// **'Sie verfügen nicht über die erforderlichen Berechtigungen für diese Aktion.'**
  String get exception_value_no_permissions;

  /// No description provided for @exception_value_user_already_exists.
  ///
  /// In de, this message translates to:
  /// **'Benutzer mit dieser E-Mail existiert bereits'**
  String get exception_value_user_already_exists;

  /// No description provided for @exception_value_user_not_authenticated.
  ///
  /// In de, this message translates to:
  /// **'Sie sind nicht authentifiziert.'**
  String get exception_value_user_not_authenticated;

  /// No description provided for @file_click_or_drag_and_drop.
  ///
  /// In de, this message translates to:
  /// **'Klicken oder per Drag & Drop'**
  String get file_click_or_drag_and_drop;

  /// No description provided for @file_drop_click_to_upload.
  ///
  /// In de, this message translates to:
  /// **'Zum Hochladen klicken'**
  String get file_drop_click_to_upload;

  /// No description provided for @file_drop_or_drag_and_drop.
  ///
  /// In de, this message translates to:
  /// **'oder per Drag & Drop'**
  String get file_drop_or_drag_and_drop;

  /// No description provided for @filter_between.
  ///
  /// In de, this message translates to:
  /// **'zwischen'**
  String get filter_between;

  /// No description provided for @filter_equal.
  ///
  /// In de, this message translates to:
  /// **'='**
  String get filter_equal;

  /// No description provided for @filter_greater_than.
  ///
  /// In de, this message translates to:
  /// **'>'**
  String get filter_greater_than;

  /// No description provided for @filter_greater_than_or_equal.
  ///
  /// In de, this message translates to:
  /// **'≥'**
  String get filter_greater_than_or_equal;

  /// No description provided for @filter_ilike.
  ///
  /// In de, this message translates to:
  /// **'ähnlich'**
  String get filter_ilike;

  /// No description provided for @filter_in_list.
  ///
  /// In de, this message translates to:
  /// **'in Liste'**
  String get filter_in_list;

  /// No description provided for @filter_in_set.
  ///
  /// In de, this message translates to:
  /// **'in Menge'**
  String get filter_in_set;

  /// No description provided for @filter_less_than.
  ///
  /// In de, this message translates to:
  /// **'<'**
  String get filter_less_than;

  /// No description provided for @filter_less_than_or_equal.
  ///
  /// In de, this message translates to:
  /// **'≤'**
  String get filter_less_than_or_equal;

  /// No description provided for @filter_like.
  ///
  /// In de, this message translates to:
  /// **'ähnlich'**
  String get filter_like;

  /// No description provided for @filter_not_between.
  ///
  /// In de, this message translates to:
  /// **'nicht zwischen'**
  String get filter_not_between;

  /// No description provided for @filter_not_equal.
  ///
  /// In de, this message translates to:
  /// **'≠'**
  String get filter_not_equal;

  /// No description provided for @filter_not_ilike.
  ///
  /// In de, this message translates to:
  /// **'nicht ähnlich'**
  String get filter_not_ilike;

  /// No description provided for @filter_not_in_list.
  ///
  /// In de, this message translates to:
  /// **'nicht in Liste'**
  String get filter_not_in_list;

  /// No description provided for @filter_not_in_set.
  ///
  /// In de, this message translates to:
  /// **'nicht in Menge'**
  String get filter_not_in_set;

  /// No description provided for @filter_not_like.
  ///
  /// In de, this message translates to:
  /// **'nicht ähnlich'**
  String get filter_not_like;

  /// No description provided for @floating_window_maximize.
  ///
  /// In de, this message translates to:
  /// **'Vollbild'**
  String get floating_window_maximize;

  /// No description provided for @floating_window_minimize.
  ///
  /// In de, this message translates to:
  /// **'Minimieren'**
  String get floating_window_minimize;

  /// No description provided for @flutter_log_entry_app_version.
  ///
  /// In de, this message translates to:
  /// **'App-Version'**
  String get flutter_log_entry_app_version;

  /// No description provided for @flutter_log_entry_build_number.
  ///
  /// In de, this message translates to:
  /// **'Build-Nummer'**
  String get flutter_log_entry_build_number;

  /// No description provided for @flutter_log_entry_context.
  ///
  /// In de, this message translates to:
  /// **'Kontext'**
  String get flutter_log_entry_context;

  /// No description provided for @flutter_log_entry_device_id.
  ///
  /// In de, this message translates to:
  /// **'Geräte-ID'**
  String get flutter_log_entry_device_id;

  /// No description provided for @flutter_log_entry_error.
  ///
  /// In de, this message translates to:
  /// **'Fehler'**
  String get flutter_log_entry_error;

  /// No description provided for @flutter_log_entry_information.
  ///
  /// In de, this message translates to:
  /// **'Information'**
  String get flutter_log_entry_information;

  /// No description provided for @flutter_log_entry_library.
  ///
  /// In de, this message translates to:
  /// **'Bibliothek'**
  String get flutter_log_entry_library;

  /// No description provided for @flutter_log_entry_platform.
  ///
  /// In de, this message translates to:
  /// **'Plattform'**
  String get flutter_log_entry_platform;

  /// No description provided for @flutter_log_entry_plural.
  ///
  /// In de, this message translates to:
  /// **'Flutter-Logs'**
  String get flutter_log_entry_plural;

  /// No description provided for @flutter_log_entry_silent.
  ///
  /// In de, this message translates to:
  /// **'Stumm'**
  String get flutter_log_entry_silent;

  /// No description provided for @flutter_log_entry_singular.
  ///
  /// In de, this message translates to:
  /// **'Flutter-Log'**
  String get flutter_log_entry_singular;

  /// No description provided for @flutter_log_entry_stack_trace.
  ///
  /// In de, this message translates to:
  /// **'Stack-Trace'**
  String get flutter_log_entry_stack_trace;

  /// No description provided for @flutter_log_entry_time.
  ///
  /// In de, this message translates to:
  /// **'Zeit'**
  String get flutter_log_entry_time;

  /// No description provided for @flutter_log_entry_user_id.
  ///
  /// In de, this message translates to:
  /// **'Benutzer-ID'**
  String get flutter_log_entry_user_id;

  /// No description provided for @gen_actions.
  ///
  /// In de, this message translates to:
  /// **'Aktionen'**
  String get gen_actions;

  /// No description provided for @gen_add.
  ///
  /// In de, this message translates to:
  /// **'Hinzufügen'**
  String get gen_add;

  /// No description provided for @gen_add_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} hinzufügen'**
  String gen_add_entity(Object entity);

  /// No description provided for @gen_add_entity_multiline.
  ///
  /// In de, this message translates to:
  /// **'Neuer\n{entity}'**
  String gen_add_entity_multiline(Object entity);

  /// No description provided for @gen_already_edited_by.
  ///
  /// In de, this message translates to:
  /// **'Datensatz wird von {userName} bearbeitet.'**
  String gen_already_edited_by(Object userName);

  /// No description provided for @gen_already_edited_by_you.
  ///
  /// In de, this message translates to:
  /// **'Datensatz wird bereits von Ihnen bearbeitet.'**
  String get gen_already_edited_by_you;

  /// No description provided for @gen_apply.
  ///
  /// In de, this message translates to:
  /// **'Anwenden'**
  String get gen_apply;

  /// No description provided for @gen_april_full.
  ///
  /// In de, this message translates to:
  /// **'April'**
  String get gen_april_full;

  /// No description provided for @gen_april_short.
  ///
  /// In de, this message translates to:
  /// **'Apr.'**
  String get gen_april_short;

  /// No description provided for @gen_assign_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} zuweisen'**
  String gen_assign_entity(Object entity);

  /// No description provided for @gen_assign_entity_count.
  ///
  /// In de, this message translates to:
  /// **'{entity} zuweisen ({count})'**
  String gen_assign_entity_count(Object count, Object entity);

  /// No description provided for @gen_attachment_email.
  ///
  /// In de, this message translates to:
  /// **'Email'**
  String get gen_attachment_email;

  /// No description provided for @gen_attachment_general.
  ///
  /// In de, this message translates to:
  /// **'Allgemein'**
  String get gen_attachment_general;

  /// No description provided for @gen_attachment_order.
  ///
  /// In de, this message translates to:
  /// **'Bestellung'**
  String get gen_attachment_order;

  /// No description provided for @gen_attention.
  ///
  /// In de, this message translates to:
  /// **'Warnung'**
  String get gen_attention;

  /// No description provided for @gen_august_full.
  ///
  /// In de, this message translates to:
  /// **'August'**
  String get gen_august_full;

  /// No description provided for @gen_august_short.
  ///
  /// In de, this message translates to:
  /// **'Aug.'**
  String get gen_august_short;

  /// No description provided for @gen_back.
  ///
  /// In de, this message translates to:
  /// **'Zurück'**
  String get gen_back;

  /// No description provided for @gen_call.
  ///
  /// In de, this message translates to:
  /// **'Anrufen'**
  String get gen_call;

  /// No description provided for @gen_cancel.
  ///
  /// In de, this message translates to:
  /// **'Abbrechen'**
  String get gen_cancel;

  /// No description provided for @gen_change_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} ändern'**
  String gen_change_entity(Object entity);

  /// No description provided for @gen_change_log_plural.
  ///
  /// In de, this message translates to:
  /// **'Änderungsprotokolle'**
  String get gen_change_log_plural;

  /// No description provided for @gen_change_log_singular.
  ///
  /// In de, this message translates to:
  /// **'Änderungsprotokoll'**
  String get gen_change_log_singular;

  /// No description provided for @gen_choose_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} auswählen'**
  String gen_choose_entity(Object entity);

  /// No description provided for @gen_chosen_entity.
  ///
  /// In de, this message translates to:
  /// **'Ausgewählte {entity}:'**
  String gen_chosen_entity(Object entity);

  /// No description provided for @gen_close.
  ///
  /// In de, this message translates to:
  /// **'Schließen'**
  String get gen_close;

  /// No description provided for @gen_close_window.
  ///
  /// In de, this message translates to:
  /// **'Fenster schließen'**
  String get gen_close_window;

  /// No description provided for @gen_close_window_without_saving.
  ///
  /// In de, this message translates to:
  /// **'Fenster schließen ohne zu speichern?'**
  String get gen_close_window_without_saving;

  /// No description provided for @gen_collapse.
  ///
  /// In de, this message translates to:
  /// **'Einklappen'**
  String get gen_collapse;

  /// No description provided for @gen_color.
  ///
  /// In de, this message translates to:
  /// **'Farbe'**
  String get gen_color;

  /// No description provided for @gen_copied_to_clipboard.
  ///
  /// In de, this message translates to:
  /// **'In Zwischenablage kopiert'**
  String get gen_copied_to_clipboard;

  /// No description provided for @gen_copy.
  ///
  /// In de, this message translates to:
  /// **'Kopieren'**
  String get gen_copy;

  /// No description provided for @gen_count_more.
  ///
  /// In de, this message translates to:
  /// **'+ {count} mehr'**
  String gen_count_more(Object count);

  /// No description provided for @gen_create.
  ///
  /// In de, this message translates to:
  /// **'Erstellen'**
  String get gen_create;

  /// No description provided for @gen_create_entity.
  ///
  /// In de, this message translates to:
  /// **'Erstelle {entity}'**
  String gen_create_entity(Object entity);

  /// No description provided for @gen_created_at.
  ///
  /// In de, this message translates to:
  /// **'Erstellt am'**
  String get gen_created_at;

  /// No description provided for @gen_created_by.
  ///
  /// In de, this message translates to:
  /// **'Erstellt von'**
  String get gen_created_by;

  /// No description provided for @gen_current_version.
  ///
  /// In de, this message translates to:
  /// **'Aktuelle Version'**
  String get gen_current_version;

  /// No description provided for @gen_cut.
  ///
  /// In de, this message translates to:
  /// **'Ausschneiden'**
  String get gen_cut;

  /// No description provided for @gen_december_full.
  ///
  /// In de, this message translates to:
  /// **'Dezember'**
  String get gen_december_full;

  /// No description provided for @gen_december_short.
  ///
  /// In de, this message translates to:
  /// **'Dez.'**
  String get gen_december_short;

  /// No description provided for @gen_delete.
  ///
  /// In de, this message translates to:
  /// **'Löschen'**
  String get gen_delete;

  /// No description provided for @gen_delete_all.
  ///
  /// In de, this message translates to:
  /// **'Alle löschen'**
  String get gen_delete_all;

  /// No description provided for @gen_delete_file.
  ///
  /// In de, this message translates to:
  /// **'Datei löschen'**
  String get gen_delete_file;

  /// No description provided for @gen_deleted.
  ///
  /// In de, this message translates to:
  /// **'Gelöscht'**
  String get gen_deleted;

  /// No description provided for @gen_deleted_at.
  ///
  /// In de, this message translates to:
  /// **'Gelöscht am'**
  String get gen_deleted_at;

  /// No description provided for @gen_deleted_entity_hint_message.
  ///
  /// In de, this message translates to:
  /// **'Dieser Datensatz wurde gelöscht.'**
  String get gen_deleted_entity_hint_message;

  /// No description provided for @gen_description.
  ///
  /// In de, this message translates to:
  /// **'Beschreibung'**
  String get gen_description;

  /// No description provided for @gen_dialog_close_window.
  ///
  /// In de, this message translates to:
  /// **'Fenster schließen'**
  String get gen_dialog_close_window;

  /// No description provided for @gen_dialog_close_window_unsaved_confirmation_text.
  ///
  /// In de, this message translates to:
  /// **'Möchten Sie das Fenster ohne Speichern schließen?'**
  String get gen_dialog_close_window_unsaved_confirmation_text;

  /// No description provided for @gen_drag_and_drop_here.
  ///
  /// In de, this message translates to:
  /// **'hierher ziehen und ablegen'**
  String get gen_drag_and_drop_here;

  /// No description provided for @gen_edit.
  ///
  /// In de, this message translates to:
  /// **'Bearbeiten'**
  String get gen_edit;

  /// No description provided for @gen_edit_request.
  ///
  /// In de, this message translates to:
  /// **'{createdByName} hat um {time} Uhr eine Bearbeitung des Datensatzes angefragt.'**
  String gen_edit_request(Object createdByName, Object time);

  /// No description provided for @gen_edit_request_failed.
  ///
  /// In de, this message translates to:
  /// **'Senden der Anfrage fehlgeschlagen. Bitte versuchen Sie es später noch einmal.'**
  String get gen_edit_request_failed;

  /// No description provided for @gen_edit_request_send.
  ///
  /// In de, this message translates to:
  /// **'Anfrage gesendet – Sie werden benachrichtigt, sobald die Freigabe erfolgt ist.'**
  String get gen_edit_request_send;

  /// No description provided for @gen_edit_request_send_short.
  ///
  /// In de, this message translates to:
  /// **'Anfrage zum Bearbeiten wurde gesendet!'**
  String get gen_edit_request_send_short;

  /// No description provided for @gen_edited_at.
  ///
  /// In de, this message translates to:
  /// **'Bearbeitet am'**
  String get gen_edited_at;

  /// No description provided for @gen_edited_by.
  ///
  /// In de, this message translates to:
  /// **'Bearbeitet von'**
  String get gen_edited_by;

  /// No description provided for @gen_entity_already_assigned.
  ///
  /// In de, this message translates to:
  /// **'{entity} ist bereits zugeordnet'**
  String gen_entity_already_assigned(Object entity);

  /// No description provided for @gen_entity_not_found.
  ///
  /// In de, this message translates to:
  /// **'Keine {entity} gefunden'**
  String gen_entity_not_found(Object entity);

  /// No description provided for @gen_entity_status_blocked.
  ///
  /// In de, this message translates to:
  /// **'Gesperrt'**
  String get gen_entity_status_blocked;

  /// No description provided for @gen_entity_status_edit.
  ///
  /// In de, this message translates to:
  /// **'Bearbeiten'**
  String get gen_entity_status_edit;

  /// No description provided for @gen_entity_status_view_mode.
  ///
  /// In de, this message translates to:
  /// **'Lesemodus'**
  String get gen_entity_status_view_mode;

  /// No description provided for @gen_error.
  ///
  /// In de, this message translates to:
  /// **'Fehler: {error}'**
  String gen_error(Object error);

  /// No description provided for @gen_error_during.
  ///
  /// In de, this message translates to:
  /// **'Fehler bei'**
  String get gen_error_during;

  /// No description provided for @gen_error_please_enter_data.
  ///
  /// In de, this message translates to:
  /// **'Fehler, Bitte ausfüllen'**
  String get gen_error_please_enter_data;

  /// No description provided for @gen_expand.
  ///
  /// In de, this message translates to:
  /// **'Ausklappen'**
  String get gen_expand;

  /// No description provided for @gen_false.
  ///
  /// In de, this message translates to:
  /// **'Nein'**
  String get gen_false;

  /// No description provided for @gen_february_full.
  ///
  /// In de, this message translates to:
  /// **'Februar'**
  String get gen_february_full;

  /// No description provided for @gen_february_short.
  ///
  /// In de, this message translates to:
  /// **'Feb.'**
  String get gen_february_short;

  /// No description provided for @gen_folder.
  ///
  /// In de, this message translates to:
  /// **'Ordner'**
  String get gen_folder;

  /// No description provided for @gen_friday_short.
  ///
  /// In de, this message translates to:
  /// **'Fr.'**
  String get gen_friday_short;

  /// No description provided for @gen_general.
  ///
  /// In de, this message translates to:
  /// **'Allgemein'**
  String get gen_general;

  /// No description provided for @gen_general_information.
  ///
  /// In de, this message translates to:
  /// **'Allgemeine Informationen'**
  String get gen_general_information;

  /// No description provided for @gen_global.
  ///
  /// In de, this message translates to:
  /// **'Global'**
  String get gen_global;

  /// No description provided for @gen_global_settings.
  ///
  /// In de, this message translates to:
  /// **'Globale Einstellungen'**
  String get gen_global_settings;

  /// No description provided for @gen_hide_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} ausblenden'**
  String gen_hide_entity(Object entity);

  /// No description provided for @gen_history.
  ///
  /// In de, this message translates to:
  /// **'Historie'**
  String get gen_history;

  /// No description provided for @gen_history_complete.
  ///
  /// In de, this message translates to:
  /// **'Logbuch'**
  String get gen_history_complete;

  /// No description provided for @gen_icon_check.
  ///
  /// In de, this message translates to:
  /// **'✓'**
  String get gen_icon_check;

  /// No description provided for @gen_icon_x.
  ///
  /// In de, this message translates to:
  /// **'✕'**
  String get gen_icon_x;

  /// No description provided for @gen_id.
  ///
  /// In de, this message translates to:
  /// **'ID'**
  String get gen_id;

  /// No description provided for @gen_import.
  ///
  /// In de, this message translates to:
  /// **'Importieren'**
  String get gen_import;

  /// No description provided for @gen_important_note.
  ///
  /// In de, this message translates to:
  /// **'Achtung!'**
  String get gen_important_note;

  /// No description provided for @gen_invalid_file_type.
  ///
  /// In de, this message translates to:
  /// **'Falscher Datentyp'**
  String get gen_invalid_file_type;

  /// No description provided for @gen_invalid_form.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Form'**
  String get gen_invalid_form;

  /// No description provided for @gen_invalid_number.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Zahl'**
  String get gen_invalid_number;

  /// No description provided for @gen_is_draft.
  ///
  /// In de, this message translates to:
  /// **'Entwurf'**
  String get gen_is_draft;

  /// No description provided for @gen_is_saved.
  ///
  /// In de, this message translates to:
  /// **'Gespeichert'**
  String get gen_is_saved;

  /// No description provided for @gen_is_saving.
  ///
  /// In de, this message translates to:
  /// **'Wird gespeichert...'**
  String get gen_is_saving;

  /// No description provided for @gen_january_full.
  ///
  /// In de, this message translates to:
  /// **'Januar'**
  String get gen_january_full;

  /// No description provided for @gen_january_short.
  ///
  /// In de, this message translates to:
  /// **'Jan.'**
  String get gen_january_short;

  /// No description provided for @gen_july_full.
  ///
  /// In de, this message translates to:
  /// **'Juli'**
  String get gen_july_full;

  /// No description provided for @gen_july_short.
  ///
  /// In de, this message translates to:
  /// **'Jul.'**
  String get gen_july_short;

  /// No description provided for @gen_june_full.
  ///
  /// In de, this message translates to:
  /// **'Juni'**
  String get gen_june_full;

  /// No description provided for @gen_june_short.
  ///
  /// In de, this message translates to:
  /// **'Jun.'**
  String get gen_june_short;

  /// No description provided for @gen_key_ctrl.
  ///
  /// In de, this message translates to:
  /// **'Strg'**
  String get gen_key_ctrl;

  /// No description provided for @gen_last_modified_at.
  ///
  /// In de, this message translates to:
  /// **'Zuletzt bearbeitet am'**
  String get gen_last_modified_at;

  /// No description provided for @gen_last_modified_by.
  ///
  /// In de, this message translates to:
  /// **'Zuletzt bearbeitet von'**
  String get gen_last_modified_by;

  /// No description provided for @gen_loading.
  ///
  /// In de, this message translates to:
  /// **'Lädt'**
  String get gen_loading;

  /// No description provided for @gen_loading_update_message.
  ///
  /// In de, this message translates to:
  /// **'Update wird geladen...'**
  String get gen_loading_update_message;

  /// No description provided for @gen_lost_connection.
  ///
  /// In de, this message translates to:
  /// **'Die Verbindung zum Server wurde unterbrochen.'**
  String get gen_lost_connection;

  /// No description provided for @gen_march_full.
  ///
  /// In de, this message translates to:
  /// **'März'**
  String get gen_march_full;

  /// No description provided for @gen_march_short.
  ///
  /// In de, this message translates to:
  /// **'Mär.'**
  String get gen_march_short;

  /// No description provided for @gen_master_data.
  ///
  /// In de, this message translates to:
  /// **'Stammdaten'**
  String get gen_master_data;

  /// No description provided for @gen_may_full.
  ///
  /// In de, this message translates to:
  /// **'Mai'**
  String get gen_may_full;

  /// No description provided for @gen_may_short.
  ///
  /// In de, this message translates to:
  /// **'Mai'**
  String get gen_may_short;

  /// No description provided for @gen_me_mode.
  ///
  /// In de, this message translates to:
  /// **'Meine Ansicht'**
  String get gen_me_mode;

  /// No description provided for @gen_minutes_abbreviation.
  ///
  /// In de, this message translates to:
  /// **'{minutes} min'**
  String gen_minutes_abbreviation(Object minutes);

  /// No description provided for @gen_monday_short.
  ///
  /// In de, this message translates to:
  /// **'Mo.'**
  String get gen_monday_short;

  /// No description provided for @gen_month.
  ///
  /// In de, this message translates to:
  /// **'Monat'**
  String get gen_month;

  /// No description provided for @gen_more.
  ///
  /// In de, this message translates to:
  /// **'Mehr'**
  String get gen_more;

  /// No description provided for @gen_name.
  ///
  /// In de, this message translates to:
  /// **'Name'**
  String get gen_name;

  /// No description provided for @gen_next.
  ///
  /// In de, this message translates to:
  /// **'Weiter'**
  String get gen_next;

  /// No description provided for @gen_no.
  ///
  /// In de, this message translates to:
  /// **'Nein'**
  String get gen_no;

  /// No description provided for @gen_no_connection_on_startup.
  ///
  /// In de, this message translates to:
  /// **'Es konnte keine Verbindung zum Server hergestellt werden.'**
  String get gen_no_connection_on_startup;

  /// No description provided for @gen_no_entities_assigned.
  ///
  /// In de, this message translates to:
  /// **'Keine {entity} zugewiesen'**
  String gen_no_entities_assigned(Object entity);

  /// No description provided for @gen_no_suggestions_found.
  ///
  /// In de, this message translates to:
  /// **'Keine Vorschläge gefunden'**
  String get gen_no_suggestions_found;

  /// No description provided for @gen_not_available.
  ///
  /// In de, this message translates to:
  /// **'N/A'**
  String get gen_not_available;

  /// No description provided for @gen_not_in_db.
  ///
  /// In de, this message translates to:
  /// **'Nicht in Datenbank'**
  String get gen_not_in_db;

  /// No description provided for @gen_november_full.
  ///
  /// In de, this message translates to:
  /// **'November'**
  String get gen_november_full;

  /// No description provided for @gen_november_short.
  ///
  /// In de, this message translates to:
  /// **'Nov.'**
  String get gen_november_short;

  /// No description provided for @gen_october_full.
  ///
  /// In de, this message translates to:
  /// **'Oktober'**
  String get gen_october_full;

  /// No description provided for @gen_october_short.
  ///
  /// In de, this message translates to:
  /// **'Okt.'**
  String get gen_october_short;

  /// No description provided for @gen_okay.
  ///
  /// In de, this message translates to:
  /// **'Okay'**
  String get gen_okay;

  /// No description provided for @gen_open.
  ///
  /// In de, this message translates to:
  /// **'Öffnen'**
  String get gen_open;

  /// No description provided for @gen_open_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} öffnen'**
  String gen_open_entity(Object entity);

  /// No description provided for @gen_open_in_new_window.
  ///
  /// In de, this message translates to:
  /// **'In neuem Fenster öffnen'**
  String get gen_open_in_new_window;

  /// No description provided for @gen_open_new_table.
  ///
  /// In de, this message translates to:
  /// **'{tableTypeName} öffnen'**
  String gen_open_new_table(Object tableTypeName);

  /// No description provided for @gen_open_website.
  ///
  /// In de, this message translates to:
  /// **'Website öffnen'**
  String get gen_open_website;

  /// No description provided for @gen_or.
  ///
  /// In de, this message translates to:
  /// **'oder'**
  String get gen_or;

  /// No description provided for @gen_order_position.
  ///
  /// In de, this message translates to:
  /// **'Position'**
  String get gen_order_position;

  /// No description provided for @gen_overview.
  ///
  /// In de, this message translates to:
  /// **'Übersicht'**
  String get gen_overview;

  /// No description provided for @gen_paste.
  ///
  /// In de, this message translates to:
  /// **'Einfügen'**
  String get gen_paste;

  /// No description provided for @gen_please_choose.
  ///
  /// In de, this message translates to:
  /// **'Bitte wählen'**
  String get gen_please_choose;

  /// No description provided for @gen_please_choose_entity.
  ///
  /// In de, this message translates to:
  /// **'Bitte {entity} auswählen'**
  String gen_please_choose_entity(Object entity);

  /// No description provided for @gen_prev_edited_hint.
  ///
  /// In de, this message translates to:
  /// **'Hinweis: Der Datensatz wurde von einer anderen Sitzung bearbeitet und kann jetzt von Ihnen bearbeitet werden.'**
  String get gen_prev_edited_hint;

  /// No description provided for @gen_preview.
  ///
  /// In de, this message translates to:
  /// **'Vorschau'**
  String get gen_preview;

  /// No description provided for @gen_primary_key.
  ///
  /// In de, this message translates to:
  /// **'Datenbank ID'**
  String get gen_primary_key;

  /// No description provided for @gen_refresh.
  ///
  /// In de, this message translates to:
  /// **'Aktualisieren'**
  String get gen_refresh;

  /// No description provided for @gen_reject.
  ///
  /// In de, this message translates to:
  /// **'Ablehnen'**
  String get gen_reject;

  /// No description provided for @gen_reject_edit_request.
  ///
  /// In de, this message translates to:
  /// **'Bearbeitungsanfrage ablehnen'**
  String get gen_reject_edit_request;

  /// No description provided for @gen_reject_edit_request_reason.
  ///
  /// In de, this message translates to:
  /// **'Grund für Ablehnung'**
  String get gen_reject_edit_request_reason;

  /// No description provided for @gen_rejected_edit_request_by.
  ///
  /// In de, this message translates to:
  /// **'Die Bearbeitungsanfrage wurde von {userName} abgelehnt.'**
  String gen_rejected_edit_request_by(Object userName);

  /// No description provided for @gen_release_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} freigeben'**
  String gen_release_entity(Object entity);

  /// No description provided for @gen_remove.
  ///
  /// In de, this message translates to:
  /// **'Entfernen'**
  String get gen_remove;

  /// No description provided for @gen_remove_as_standard.
  ///
  /// In de, this message translates to:
  /// **'Als Standard entfernen'**
  String get gen_remove_as_standard;

  /// No description provided for @gen_request_edit.
  ///
  /// In de, this message translates to:
  /// **'Bearbeitung anfordern'**
  String get gen_request_edit;

  /// No description provided for @gen_reset.
  ///
  /// In de, this message translates to:
  /// **'Zurücksetzen'**
  String get gen_reset;

  /// No description provided for @gen_retry.
  ///
  /// In de, this message translates to:
  /// **'Erneut versuchen'**
  String get gen_retry;

  /// No description provided for @gen_saturday_short.
  ///
  /// In de, this message translates to:
  /// **'Sa.'**
  String get gen_saturday_short;

  /// No description provided for @gen_save.
  ///
  /// In de, this message translates to:
  /// **'Speichern'**
  String get gen_save;

  /// No description provided for @gen_save_and_close.
  ///
  /// In de, this message translates to:
  /// **'Speichern & Schließen'**
  String get gen_save_and_close;

  /// No description provided for @gen_save_and_unlock.
  ///
  /// In de, this message translates to:
  /// **'Speichern & Freigeben'**
  String get gen_save_and_unlock;

  /// No description provided for @gen_saving_error.
  ///
  /// In de, this message translates to:
  /// **'Fehler beim Speichern, bitte überprüfen Sie Ihre Eingaben.'**
  String get gen_saving_error;

  /// No description provided for @gen_saving_success.
  ///
  /// In de, this message translates to:
  /// **'Daten erfolgreich gespeichert.'**
  String get gen_saving_success;

  /// No description provided for @gen_search.
  ///
  /// In de, this message translates to:
  /// **'Suche'**
  String get gen_search;

  /// No description provided for @gen_select.
  ///
  /// In de, this message translates to:
  /// **'{entity} auswählen'**
  String gen_select(Object entity);

  /// No description provided for @gen_send_email.
  ///
  /// In de, this message translates to:
  /// **'E-Mail senden'**
  String get gen_send_email;

  /// No description provided for @gen_september_full.
  ///
  /// In de, this message translates to:
  /// **'September'**
  String get gen_september_full;

  /// No description provided for @gen_september_short.
  ///
  /// In de, this message translates to:
  /// **'Sep.'**
  String get gen_september_short;

  /// No description provided for @gen_set_as_standard.
  ///
  /// In de, this message translates to:
  /// **'Als Standard festlegen'**
  String get gen_set_as_standard;

  /// No description provided for @gen_share.
  ///
  /// In de, this message translates to:
  /// **'Teilen'**
  String get gen_share;

  /// No description provided for @gen_should_be_deleted.
  ///
  /// In de, this message translates to:
  /// **'Soll der Datensatz wirklich unwiderruflich gelöscht werden?'**
  String get gen_should_be_deleted;

  /// No description provided for @gen_show.
  ///
  /// In de, this message translates to:
  /// **'{entity} anzeigen'**
  String gen_show(Object entity);

  /// No description provided for @gen_show_entity.
  ///
  /// In de, this message translates to:
  /// **'{entity} anzeigen'**
  String gen_show_entity(Object entity);

  /// No description provided for @gen_stop.
  ///
  /// In de, this message translates to:
  /// **'Stop'**
  String get gen_stop;

  /// No description provided for @gen_summary.
  ///
  /// In de, this message translates to:
  /// **'Zusammenfassung'**
  String get gen_summary;

  /// No description provided for @gen_sunday_short.
  ///
  /// In de, this message translates to:
  /// **'So.'**
  String get gen_sunday_short;

  /// No description provided for @gen_table_select_entity.
  ///
  /// In de, this message translates to:
  /// **'Auswählen'**
  String get gen_table_select_entity;

  /// No description provided for @gen_table_type.
  ///
  /// In de, this message translates to:
  /// **'Tabellentyp'**
  String get gen_table_type;

  /// No description provided for @gen_thursday_short.
  ///
  /// In de, this message translates to:
  /// **'Do.'**
  String get gen_thursday_short;

  /// No description provided for @gen_true.
  ///
  /// In de, this message translates to:
  /// **'Ja'**
  String get gen_true;

  /// No description provided for @gen_tuesday_short.
  ///
  /// In de, this message translates to:
  /// **'Di.'**
  String get gen_tuesday_short;

  /// No description provided for @gen_type.
  ///
  /// In de, this message translates to:
  /// **'Typ'**
  String get gen_type;

  /// No description provided for @gen_ui_list_view.
  ///
  /// In de, this message translates to:
  /// **'Listenansicht'**
  String get gen_ui_list_view;

  /// No description provided for @gen_ui_table_view.
  ///
  /// In de, this message translates to:
  /// **'Tabellenansicht'**
  String get gen_ui_table_view;

  /// No description provided for @gen_unit_mm.
  ///
  /// In de, this message translates to:
  /// **'mm'**
  String get gen_unit_mm;

  /// No description provided for @gen_update.
  ///
  /// In de, this message translates to:
  /// **'Update'**
  String get gen_update;

  /// No description provided for @gen_update_available.
  ///
  /// In de, this message translates to:
  /// **'Aktualisierungen verfügbar!'**
  String get gen_update_available;

  /// No description provided for @gen_updated_at.
  ///
  /// In de, this message translates to:
  /// **'Aktualisiert am'**
  String get gen_updated_at;

  /// No description provided for @gen_updated_by.
  ///
  /// In de, this message translates to:
  /// **'Aktualisiert von'**
  String get gen_updated_by;

  /// No description provided for @gen_wednesday_short.
  ///
  /// In de, this message translates to:
  /// **'Mi.'**
  String get gen_wednesday_short;

  /// No description provided for @gen_year.
  ///
  /// In de, this message translates to:
  /// **'Jahr'**
  String get gen_year;

  /// No description provided for @gen_yes.
  ///
  /// In de, this message translates to:
  /// **'Ja'**
  String get gen_yes;

  /// No description provided for @greeting_good_afternoon.
  ///
  /// In de, this message translates to:
  /// **'Guten Tag'**
  String get greeting_good_afternoon;

  /// No description provided for @greeting_good_evening.
  ///
  /// In de, this message translates to:
  /// **'Guten Abend'**
  String get greeting_good_evening;

  /// No description provided for @greeting_good_morning.
  ///
  /// In de, this message translates to:
  /// **'Guten Morgen'**
  String get greeting_good_morning;

  /// No description provided for @history_log_field.
  ///
  /// In de, this message translates to:
  /// **'Feld'**
  String get history_log_field;

  /// No description provided for @history_log_new_value.
  ///
  /// In de, this message translates to:
  /// **'Neuer Wert'**
  String get history_log_new_value;

  /// No description provided for @history_log_old_value.
  ///
  /// In de, this message translates to:
  /// **'Alter Wert'**
  String get history_log_old_value;

  /// No description provided for @id.
  ///
  /// In de, this message translates to:
  /// **'ID'**
  String get id;

  /// No description provided for @json_array_readable.
  ///
  /// In de, this message translates to:
  /// **'Liste'**
  String get json_array_readable;

  /// No description provided for @json_boolean_readable.
  ///
  /// In de, this message translates to:
  /// **'Boolean'**
  String get json_boolean_readable;

  /// No description provided for @json_key.
  ///
  /// In de, this message translates to:
  /// **'Key'**
  String get json_key;

  /// No description provided for @json_key_error_hint.
  ///
  /// In de, this message translates to:
  /// **'Bitte verwenden Sie nur Buchstaben, Zahlen, Unterstriche (_) oder Bindestriche (-).'**
  String get json_key_error_hint;

  /// No description provided for @json_number_readable.
  ///
  /// In de, this message translates to:
  /// **'Zahl'**
  String get json_number_readable;

  /// No description provided for @json_object_readable.
  ///
  /// In de, this message translates to:
  /// **'Objekt'**
  String get json_object_readable;

  /// No description provided for @json_string_readable.
  ///
  /// In de, this message translates to:
  /// **'Text'**
  String get json_string_readable;

  /// No description provided for @json_template_no_templates.
  ///
  /// In de, this message translates to:
  /// **'Bisher keine Vorlagen angelegt.'**
  String get json_template_no_templates;

  /// No description provided for @json_template_plural.
  ///
  /// In de, this message translates to:
  /// **'Json Vorlagen'**
  String get json_template_plural;

  /// No description provided for @json_template_singular.
  ///
  /// In de, this message translates to:
  /// **'Json Vorlage'**
  String get json_template_singular;

  /// No description provided for @json_value.
  ///
  /// In de, this message translates to:
  /// **'Wert'**
  String get json_value;

  /// No description provided for @lang_english.
  ///
  /// In de, this message translates to:
  /// **'Englisch'**
  String get lang_english;

  /// No description provided for @lang_german.
  ///
  /// In de, this message translates to:
  /// **'Deutsch'**
  String get lang_german;

  /// No description provided for @language_switch_to_de.
  ///
  /// In de, this message translates to:
  /// **'Zu Deutsch wechseln'**
  String get language_switch_to_de;

  /// No description provided for @language_switch_to_en.
  ///
  /// In de, this message translates to:
  /// **'Zu Englisch wechseln'**
  String get language_switch_to_en;

  /// No description provided for @navigation_error_message.
  ///
  /// In de, this message translates to:
  /// **'Da ist etwas schief gelaufen. Bitte versuche es erneut.'**
  String get navigation_error_message;

  /// No description provided for @navigation_new_notification_title.
  ///
  /// In de, this message translates to:
  /// **'Neue Benachrichtigung'**
  String get navigation_new_notification_title;

  /// No description provided for @navigation_update_notification_title.
  ///
  /// In de, this message translates to:
  /// **'Aktualisiere Benachrichtigung'**
  String get navigation_update_notification_title;

  /// No description provided for @notification_not_implemented_yet.
  ///
  /// In de, this message translates to:
  /// **'Nicht erstellte Benachrichtigung'**
  String get notification_not_implemented_yet;

  /// No description provided for @notification_today.
  ///
  /// In de, this message translates to:
  /// **'Heute'**
  String get notification_today;

  /// No description provided for @notification_yesterday.
  ///
  /// In de, this message translates to:
  /// **'Gestern'**
  String get notification_yesterday;

  /// No description provided for @pick_png_file.
  ///
  /// In de, this message translates to:
  /// **'Wähle eine PNG Datei'**
  String get pick_png_file;

  /// No description provided for @primary_key.
  ///
  /// In de, this message translates to:
  /// **'Datenbank ID'**
  String get primary_key;

  /// No description provided for @select_file_artwork_file.
  ///
  /// In de, this message translates to:
  /// **'Artwork Datei'**
  String get select_file_artwork_file;

  /// No description provided for @select_file_delete_file.
  ///
  /// In de, this message translates to:
  /// **'Datei löschen'**
  String get select_file_delete_file;

  /// No description provided for @select_file_delete_file_error.
  ///
  /// In de, this message translates to:
  /// **'Datei konnte nicht gelöscht werden'**
  String get select_file_delete_file_error;

  /// No description provided for @select_file_drop_artwork.
  ///
  /// In de, this message translates to:
  /// **'Artwork PDF ablegen'**
  String get select_file_drop_artwork;

  /// No description provided for @select_file_drop_attachments.
  ///
  /// In de, this message translates to:
  /// **'Sonstige Daten ablegen'**
  String get select_file_drop_attachments;

  /// No description provided for @select_file_finish.
  ///
  /// In de, this message translates to:
  /// **'Fertig'**
  String get select_file_finish;

  /// No description provided for @select_file_finish_error.
  ///
  /// In de, this message translates to:
  /// **'Vorgang konnte nicht abgeschlossen werden'**
  String get select_file_finish_error;

  /// No description provided for @select_file_finish_process.
  ///
  /// In de, this message translates to:
  /// **'Vorgang abschließen'**
  String get select_file_finish_process;

  /// No description provided for @select_file_finish_success.
  ///
  /// In de, this message translates to:
  /// **'Vorgang erfolgreich abgeschlossen'**
  String get select_file_finish_success;

  /// No description provided for @select_file_no_customer_selected.
  ///
  /// In de, this message translates to:
  /// **'Kein Kunde ausgewählt'**
  String get select_file_no_customer_selected;

  /// No description provided for @select_file_no_files_selected.
  ///
  /// In de, this message translates to:
  /// **'Keine Dateien ausgewählt'**
  String get select_file_no_files_selected;

  /// No description provided for @select_file_other_data.
  ///
  /// In de, this message translates to:
  /// **'Sonstige Daten'**
  String get select_file_other_data;

  /// No description provided for @select_file_select_artwork.
  ///
  /// In de, this message translates to:
  /// **'Artwork auswählen'**
  String get select_file_select_artwork;

  /// No description provided for @select_file_select_attachments.
  ///
  /// In de, this message translates to:
  /// **'Sonstige Daten auswählen'**
  String get select_file_select_attachments;

  /// No description provided for @select_file_select_customer.
  ///
  /// In de, this message translates to:
  /// **'Kunde auswählen'**
  String get select_file_select_customer;

  /// No description provided for @select_file_select_customer_button.
  ///
  /// In de, this message translates to:
  /// **'Kunde auswählen'**
  String get select_file_select_customer_button;

  /// No description provided for @serverpod_log_entry_error.
  ///
  /// In de, this message translates to:
  /// **'Fehler'**
  String get serverpod_log_entry_error;

  /// No description provided for @serverpod_log_entry_level.
  ///
  /// In de, this message translates to:
  /// **'Level'**
  String get serverpod_log_entry_level;

  /// No description provided for @serverpod_log_entry_level_debug.
  ///
  /// In de, this message translates to:
  /// **'Debug'**
  String get serverpod_log_entry_level_debug;

  /// No description provided for @serverpod_log_entry_level_error.
  ///
  /// In de, this message translates to:
  /// **'Fehler'**
  String get serverpod_log_entry_level_error;

  /// No description provided for @serverpod_log_entry_level_fatal.
  ///
  /// In de, this message translates to:
  /// **'Fatal'**
  String get serverpod_log_entry_level_fatal;

  /// No description provided for @serverpod_log_entry_level_info.
  ///
  /// In de, this message translates to:
  /// **'Info'**
  String get serverpod_log_entry_level_info;

  /// No description provided for @serverpod_log_entry_level_unknown.
  ///
  /// In de, this message translates to:
  /// **'Unbekannt'**
  String get serverpod_log_entry_level_unknown;

  /// No description provided for @serverpod_log_entry_level_warning.
  ///
  /// In de, this message translates to:
  /// **'Warnung'**
  String get serverpod_log_entry_level_warning;

  /// No description provided for @serverpod_log_entry_message.
  ///
  /// In de, this message translates to:
  /// **'Nachricht'**
  String get serverpod_log_entry_message;

  /// No description provided for @serverpod_log_entry_message_id.
  ///
  /// In de, this message translates to:
  /// **'Nachrichten-ID'**
  String get serverpod_log_entry_message_id;

  /// No description provided for @serverpod_log_entry_plural.
  ///
  /// In de, this message translates to:
  /// **'Server-Logs'**
  String get serverpod_log_entry_plural;

  /// No description provided for @serverpod_log_entry_reference.
  ///
  /// In de, this message translates to:
  /// **'Referenz'**
  String get serverpod_log_entry_reference;

  /// No description provided for @serverpod_log_entry_server_id.
  ///
  /// In de, this message translates to:
  /// **'Server-ID'**
  String get serverpod_log_entry_server_id;

  /// No description provided for @serverpod_log_entry_session_id.
  ///
  /// In de, this message translates to:
  /// **'Sitzungs-ID'**
  String get serverpod_log_entry_session_id;

  /// No description provided for @serverpod_log_entry_singular.
  ///
  /// In de, this message translates to:
  /// **'Server-Log'**
  String get serverpod_log_entry_singular;

  /// No description provided for @serverpod_log_entry_stack_trace.
  ///
  /// In de, this message translates to:
  /// **'Stack-Trace'**
  String get serverpod_log_entry_stack_trace;

  /// No description provided for @serverpod_log_entry_time.
  ///
  /// In de, this message translates to:
  /// **'Zeit'**
  String get serverpod_log_entry_time;

  /// No description provided for @service_user_blocked.
  ///
  /// In de, this message translates to:
  /// **'Blockiert'**
  String get service_user_blocked;

  /// No description provided for @service_user_created.
  ///
  /// In de, this message translates to:
  /// **'Erstellt'**
  String get service_user_created;

  /// No description provided for @service_user_created_at.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get service_user_created_at;

  /// No description provided for @service_user_created_by.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get service_user_created_by;

  /// No description provided for @service_user_deleted_at.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get service_user_deleted_at;

  /// No description provided for @service_user_is_active.
  ///
  /// In de, this message translates to:
  /// **'Aktiv'**
  String get service_user_is_active;

  /// No description provided for @service_user_last_modified_at.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get service_user_last_modified_at;

  /// No description provided for @service_user_last_modified_by.
  ///
  /// In de, this message translates to:
  /// **'TODO'**
  String get service_user_last_modified_by;

  /// No description provided for @service_user_scope_names.
  ///
  /// In de, this message translates to:
  /// **'Berechtigungsnamen'**
  String get service_user_scope_names;

  /// No description provided for @service_user_service_description.
  ///
  /// In de, this message translates to:
  /// **'Beschreibung'**
  String get service_user_service_description;

  /// No description provided for @service_user_service_name.
  ///
  /// In de, this message translates to:
  /// **'Service Name'**
  String get service_user_service_name;

  /// No description provided for @service_user_user_identifier.
  ///
  /// In de, this message translates to:
  /// **'Nutzerkennung'**
  String get service_user_user_identifier;

  /// No description provided for @service_user_user_info_id.
  ///
  /// In de, this message translates to:
  /// **'UserInfo id'**
  String get service_user_user_info_id;

  /// No description provided for @soi_consulting_order.
  ///
  /// In de, this message translates to:
  /// **'Auftrag'**
  String get soi_consulting_order;

  /// No description provided for @soi_consulting_text.
  ///
  /// In de, this message translates to:
  /// **'Text'**
  String get soi_consulting_text;

  /// No description provided for @soi_einzelformaufbau_version.
  ///
  /// In de, this message translates to:
  /// **'Version'**
  String get soi_einzelformaufbau_version;

  /// No description provided for @soi_prepare_artwork_difficulty.
  ///
  /// In de, this message translates to:
  /// **'Schwierigkeitsgrad'**
  String get soi_prepare_artwork_difficulty;

  /// No description provided for @spotlight_action_new_contact_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Erstellen Sie einen neuen Kontakt'**
  String get spotlight_action_new_contact_subtitle;

  /// No description provided for @spotlight_action_new_contact_title.
  ///
  /// In de, this message translates to:
  /// **'Neuer Kontakt'**
  String get spotlight_action_new_contact_title;

  /// No description provided for @spotlight_action_new_sales_order_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Erstellen Sie einen neuen Verkaufsauftrag'**
  String get spotlight_action_new_sales_order_subtitle;

  /// No description provided for @spotlight_action_new_sales_order_title.
  ///
  /// In de, this message translates to:
  /// **'Neuer Verkaufsauftrag'**
  String get spotlight_action_new_sales_order_title;

  /// No description provided for @spotlight_action_search_contact_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Suchen Sie einen Kontakt'**
  String get spotlight_action_search_contact_subtitle;

  /// No description provided for @spotlight_action_search_contact_title.
  ///
  /// In de, this message translates to:
  /// **'Kontakt suchen'**
  String get spotlight_action_search_contact_title;

  /// No description provided for @spotlight_action_search_customer_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Suchen Sie einen Kunden'**
  String get spotlight_action_search_customer_subtitle;

  /// No description provided for @spotlight_action_search_customer_title.
  ///
  /// In de, this message translates to:
  /// **'Kunde suchen'**
  String get spotlight_action_search_customer_title;

  /// No description provided for @spotlight_action_settings_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen verwalten'**
  String get spotlight_action_settings_subtitle;

  /// No description provided for @spotlight_action_settings_title.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get spotlight_action_settings_title;

  /// No description provided for @spotlight_close.
  ///
  /// In de, this message translates to:
  /// **'Schließen'**
  String get spotlight_close;

  /// No description provided for @spotlight_navigate.
  ///
  /// In de, this message translates to:
  /// **'Navigieren'**
  String get spotlight_navigate;

  /// No description provided for @spotlight_search_mode_actions.
  ///
  /// In de, this message translates to:
  /// **'Aktionen'**
  String get spotlight_search_mode_actions;

  /// No description provided for @spotlight_search_mode_actions_hint.
  ///
  /// In de, this message translates to:
  /// **'Aktionen...'**
  String get spotlight_search_mode_actions_hint;

  /// No description provided for @spotlight_search_mode_contacts.
  ///
  /// In de, this message translates to:
  /// **'Kontakte'**
  String get spotlight_search_mode_contacts;

  /// No description provided for @spotlight_search_mode_contacts_hint.
  ///
  /// In de, this message translates to:
  /// **'Kontakte...'**
  String get spotlight_search_mode_contacts_hint;

  /// No description provided for @spotlight_search_mode_customers.
  ///
  /// In de, this message translates to:
  /// **'Kunden'**
  String get spotlight_search_mode_customers;

  /// No description provided for @spotlight_search_mode_customers_hint.
  ///
  /// In de, this message translates to:
  /// **'Kunden...'**
  String get spotlight_search_mode_customers_hint;

  /// No description provided for @spotlight_search_mode_sales_orders.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsaufträge'**
  String get spotlight_search_mode_sales_orders;

  /// No description provided for @spotlight_search_mode_sales_orders_hint.
  ///
  /// In de, this message translates to:
  /// **'Verkaufsaufträge...'**
  String get spotlight_search_mode_sales_orders_hint;

  /// No description provided for @spotlight_select.
  ///
  /// In de, this message translates to:
  /// **'Auswählen'**
  String get spotlight_select;

  /// No description provided for @spotlight_switch.
  ///
  /// In de, this message translates to:
  /// **'Nächste Aktion'**
  String get spotlight_switch;

  /// No description provided for @status_at_customer.
  ///
  /// In de, this message translates to:
  /// **'Beim Kunden'**
  String get status_at_customer;

  /// No description provided for @status_canceled.
  ///
  /// In de, this message translates to:
  /// **'Abgebrochen'**
  String get status_canceled;

  /// No description provided for @status_certified.
  ///
  /// In de, this message translates to:
  /// **'Zertifiziert'**
  String get status_certified;

  /// No description provided for @status_completed.
  ///
  /// In de, this message translates to:
  /// **'Fertiggestellt'**
  String get status_completed;

  /// No description provided for @status_finished.
  ///
  /// In de, this message translates to:
  /// **'Abgeschlossen'**
  String get status_finished;

  /// No description provided for @status_in_clarification.
  ///
  /// In de, this message translates to:
  /// **'In Klärung'**
  String get status_in_clarification;

  /// No description provided for @status_in_progress.
  ///
  /// In de, this message translates to:
  /// **'In Bearbeitung'**
  String get status_in_progress;

  /// No description provided for @status_invoiced.
  ///
  /// In de, this message translates to:
  /// **'In Rechnung'**
  String get status_invoiced;

  /// No description provided for @status_on_hold.
  ///
  /// In de, this message translates to:
  /// **'Zurückgestellt'**
  String get status_on_hold;

  /// No description provided for @status_ongoing.
  ///
  /// In de, this message translates to:
  /// **'Offen'**
  String get status_ongoing;

  /// No description provided for @status_preparation.
  ///
  /// In de, this message translates to:
  /// **'Vorbereitung'**
  String get status_preparation;

  /// No description provided for @status_ready.
  ///
  /// In de, this message translates to:
  /// **'Bereit'**
  String get status_ready;

  /// No description provided for @status_scheduled.
  ///
  /// In de, this message translates to:
  /// **'In Planung'**
  String get status_scheduled;

  /// No description provided for @status_todo.
  ///
  /// In de, this message translates to:
  /// **'ToDo'**
  String get status_todo;

  /// No description provided for @status_waiting.
  ///
  /// In de, this message translates to:
  /// **'Wartend'**
  String get status_waiting;

  /// No description provided for @status_waiting_for_approval.
  ///
  /// In de, this message translates to:
  /// **'Warten auf Freigabe'**
  String get status_waiting_for_approval;

  /// No description provided for @suggestion_none_found.
  ///
  /// In de, this message translates to:
  /// **'Keine Vorschläge gefunden'**
  String get suggestion_none_found;

  /// No description provided for @suggestion_select.
  ///
  /// In de, this message translates to:
  /// **'Vorschlag auswählen'**
  String get suggestion_select;

  /// No description provided for @table_adjust_columns.
  ///
  /// In de, this message translates to:
  /// **'Spalten anpassen'**
  String get table_adjust_columns;

  /// No description provided for @table_delete_table_view.
  ///
  /// In de, this message translates to:
  /// **'Ansicht löschen'**
  String get table_delete_table_view;

  /// No description provided for @table_filter.
  ///
  /// In de, this message translates to:
  /// **'Filter'**
  String get table_filter;

  /// No description provided for @table_filter_add.
  ///
  /// In de, this message translates to:
  /// **'Filter hinzufügen'**
  String get table_filter_add;

  /// No description provided for @table_filter_and.
  ///
  /// In de, this message translates to:
  /// **'UND'**
  String get table_filter_and;

  /// No description provided for @table_filter_condition.
  ///
  /// In de, this message translates to:
  /// **'Bedingung'**
  String get table_filter_condition;

  /// No description provided for @table_filter_disable_capitalize.
  ///
  /// In de, this message translates to:
  /// **'Großschreibung ignorieren'**
  String get table_filter_disable_capitalize;

  /// No description provided for @table_filter_enable_capitalize.
  ///
  /// In de, this message translates to:
  /// **'Großschreibung beachten'**
  String get table_filter_enable_capitalize;

  /// No description provided for @table_filter_field.
  ///
  /// In de, this message translates to:
  /// **'Feld'**
  String get table_filter_field;

  /// No description provided for @table_filter_none.
  ///
  /// In de, this message translates to:
  /// **'-'**
  String get table_filter_none;

  /// No description provided for @table_filter_operator.
  ///
  /// In de, this message translates to:
  /// **'Operator'**
  String get table_filter_operator;

  /// No description provided for @table_filter_or.
  ///
  /// In de, this message translates to:
  /// **'ODER'**
  String get table_filter_or;

  /// No description provided for @table_filter_validator_condition.
  ///
  /// In de, this message translates to:
  /// **'Bedingung erforderlich.'**
  String get table_filter_validator_condition;

  /// No description provided for @table_filter_validator_field.
  ///
  /// In de, this message translates to:
  /// **'Feld erforderlich.'**
  String get table_filter_validator_field;

  /// No description provided for @table_filter_validator_operator.
  ///
  /// In de, this message translates to:
  /// **'Operator erforderlich.'**
  String get table_filter_validator_operator;

  /// No description provided for @table_filter_validator_value.
  ///
  /// In de, this message translates to:
  /// **'Wert erforderlich.'**
  String get table_filter_validator_value;

  /// No description provided for @table_filter_value.
  ///
  /// In de, this message translates to:
  /// **'Wert'**
  String get table_filter_value;

  /// No description provided for @table_save_view.
  ///
  /// In de, this message translates to:
  /// **'Ansicht speichern'**
  String get table_save_view;

  /// No description provided for @table_set_primary_table_view.
  ///
  /// In de, this message translates to:
  /// **'Ansicht favorisieren'**
  String get table_set_primary_table_view;

  /// No description provided for @table_table_view.
  ///
  /// In de, this message translates to:
  /// **'Tabellenansicht'**
  String get table_table_view;

  /// No description provided for @table_table_views.
  ///
  /// In de, this message translates to:
  /// **'Tabellenansichten'**
  String get table_table_views;

  /// No description provided for @table_unsaved_configuration.
  ///
  /// In de, this message translates to:
  /// **'Nicht gespeicherte Ansicht'**
  String get table_unsaved_configuration;

  /// No description provided for @table_unset_primary_table_view.
  ///
  /// In de, this message translates to:
  /// **'Ansicht defavorisieren'**
  String get table_unset_primary_table_view;

  /// No description provided for @table_update_table_view.
  ///
  /// In de, this message translates to:
  /// **'Ansicht updaten'**
  String get table_update_table_view;

  /// No description provided for @theme_switch_to_dark.
  ///
  /// In de, this message translates to:
  /// **'Zu dunklem Farbschema wechseln'**
  String get theme_switch_to_dark;

  /// No description provided for @theme_switch_to_light.
  ///
  /// In de, this message translates to:
  /// **'Zu hellem Farbschema wechseln'**
  String get theme_switch_to_light;

  /// No description provided for @time_please_choose.
  ///
  /// In de, this message translates to:
  /// **'Bitte wähle eine Uhrzeit aus'**
  String get time_please_choose;

  /// No description provided for @user_activity_status_online.
  ///
  /// In de, this message translates to:
  /// **'Online'**
  String get user_activity_status_online;

  /// No description provided for @user_assignment_error_only_one.
  ///
  /// In de, this message translates to:
  /// **'Nur ein Benutzer kann ausgewählt werden'**
  String get user_assignment_error_only_one;

  /// No description provided for @user_settings.
  ///
  /// In de, this message translates to:
  /// **'Einstellungen'**
  String get user_settings;

  /// No description provided for @user_settings_collapse_sections_reset_confirm.
  ///
  /// In de, this message translates to:
  /// **'Sind Sie sicher, dass Sie alle gespeicherten Ansichts-Zustände zurücksetzen möchten?'**
  String get user_settings_collapse_sections_reset_confirm;

  /// No description provided for @user_settings_collapse_sections_reset_sucess.
  ///
  /// In de, this message translates to:
  /// **'Ansichts-Zustände erfolgreich zurückgesetzt'**
  String get user_settings_collapse_sections_reset_sucess;

  /// No description provided for @user_settings_collapse_sections_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Mit dieser Einstellung legen Sie fest, ob Inhaltsabschnitte standardmäßig ein- oder ausgeklappt angezeigt werden. Über den Reset-Button können alle gespeicherten Zustände zurückgesetzt werden – also, welche Abschnitte Sie zuvor ein- oder ausgeklappt hatten.'**
  String get user_settings_collapse_sections_subtitle;

  /// No description provided for @user_settings_collapse_sections_title.
  ///
  /// In de, this message translates to:
  /// **'Abschnittsansicht'**
  String get user_settings_collapse_sections_title;

  /// No description provided for @user_settings_drag_window_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Diese Einstellung bestimmt, ob Sie Fenster außerhalb des Hauptfensters verschieben können.'**
  String get user_settings_drag_window_subtitle;

  /// No description provided for @user_settings_drag_window_title.
  ///
  /// In de, this message translates to:
  /// **'Fenster außerhalb des Hauptfensters verschieben'**
  String get user_settings_drag_window_title;

  /// No description provided for @user_settings_inactive_floating_overlay_color.
  ///
  /// In de, this message translates to:
  /// **'Inaktive Fensterhintergrundfarbe'**
  String get user_settings_inactive_floating_overlay_color;

  /// No description provided for @user_settings_inactive_floating_overlay_color_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Wählen Sie Ihre bevorzugte Hintergrundfarbe für inaktive Fenster'**
  String get user_settings_inactive_floating_overlay_color_subtitle;

  /// No description provided for @user_settings_locale.
  ///
  /// In de, this message translates to:
  /// **'Sprache'**
  String get user_settings_locale;

  /// No description provided for @user_settings_locale_english.
  ///
  /// In de, this message translates to:
  /// **'Englisch'**
  String get user_settings_locale_english;

  /// No description provided for @user_settings_locale_german.
  ///
  /// In de, this message translates to:
  /// **'Deutsch'**
  String get user_settings_locale_german;

  /// No description provided for @user_settings_locale_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Wählen Sie Ihre bevorzugte Sprache'**
  String get user_settings_locale_subtitle;

  /// No description provided for @user_settings_reduce_motion.
  ///
  /// In de, this message translates to:
  /// **'Bewegung reduzieren'**
  String get user_settings_reduce_motion;

  /// No description provided for @user_settings_reduce_motion_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Reduziert Animationen und visuelle Effekte.'**
  String get user_settings_reduce_motion_subtitle;

  /// No description provided for @user_settings_small_ribbons_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Wenn die Einstellung aktiviert ist, werden kleinere Ribbons angezeigt. Wenn die Einstellung deaktiviert ist, werden größere Ribbons verwendet.'**
  String get user_settings_small_ribbons_subtitle;

  /// No description provided for @user_settings_small_ribbons_title.
  ///
  /// In de, this message translates to:
  /// **'Kompakte Ribbons verwenden'**
  String get user_settings_small_ribbons_title;

  /// No description provided for @user_settings_table_prefix_table_name.
  ///
  /// In de, this message translates to:
  /// **'Kontakt'**
  String get user_settings_table_prefix_table_name;

  /// No description provided for @user_settings_theme_mode.
  ///
  /// In de, this message translates to:
  /// **'Farbschema'**
  String get user_settings_theme_mode;

  /// No description provided for @user_settings_theme_mode_dark.
  ///
  /// In de, this message translates to:
  /// **'Dunkel'**
  String get user_settings_theme_mode_dark;

  /// No description provided for @user_settings_theme_mode_light.
  ///
  /// In de, this message translates to:
  /// **'Hell'**
  String get user_settings_theme_mode_light;

  /// No description provided for @user_settings_theme_mode_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Wählen Sie Ihr bevorzugtes Farbschema'**
  String get user_settings_theme_mode_subtitle;

  /// No description provided for @user_settings_theme_mode_system.
  ///
  /// In de, this message translates to:
  /// **'System'**
  String get user_settings_theme_mode_system;

  /// No description provided for @user_settings_tooltips.
  ///
  /// In de, this message translates to:
  /// **'Tooltips'**
  String get user_settings_tooltips;

  /// No description provided for @user_settings_tooltips_button_label.
  ///
  /// In de, this message translates to:
  /// **'Beispiel Button'**
  String get user_settings_tooltips_button_label;

  /// No description provided for @user_settings_tooltips_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Wählen Sie, ob Button-Tooltips angezeigt werden sollen. Tooltips bieten zusätzliche Informationen zu den Funktionen der Buttons, wenn Sie den Mauszeiger darüber bewegen.'**
  String get user_settings_tooltips_subtitle;

  /// No description provided for @user_settings_tooltips_tooltip_label.
  ///
  /// In de, this message translates to:
  /// **'Tooltip'**
  String get user_settings_tooltips_tooltip_label;

  /// No description provided for @user_settings_window_description.
  ///
  /// In de, this message translates to:
  /// **'Fensterbeschreibung'**
  String get user_settings_window_description;

  /// No description provided for @user_settings_window_description_subtitle.
  ///
  /// In de, this message translates to:
  /// **'Diese Einstellung steuert, ob im Fenstertitel ein Präfix angezeigt wird, der die Art der Tabelle kennzeichnet.'**
  String get user_settings_window_description_subtitle;

  /// No description provided for @validation_address_required.
  ///
  /// In de, this message translates to:
  /// **'Adresse nötig'**
  String get validation_address_required;

  /// No description provided for @validation_app_user_email_already_exists.
  ///
  /// In de, this message translates to:
  /// **'Ein Benutzer mit der E-Mail-Adresse {email} existiert bereits.'**
  String validation_app_user_email_already_exists(Object email);

  /// No description provided for @validation_app_user_initials_already_exists.
  ///
  /// In de, this message translates to:
  /// **'Ein Benutzer mit den Initialen {initials} existiert bereits.'**
  String validation_app_user_initials_already_exists(Object initials);

  /// No description provided for @validation_app_user_name_already_exists.
  ///
  /// In de, this message translates to:
  /// **'Ein Benutzer mit dem Namen {fullName} existiert bereits.'**
  String validation_app_user_name_already_exists(Object fullName);

  /// No description provided for @validation_assigned_user_required.
  ///
  /// In de, this message translates to:
  /// **'Mitarbeiter nötig'**
  String get validation_assigned_user_required;

  /// No description provided for @validation_children_not_valid.
  ///
  /// In de, this message translates to:
  /// **'Untergruppe enthält invalide Felder'**
  String get validation_children_not_valid;

  /// No description provided for @validation_city_required.
  ///
  /// In de, this message translates to:
  /// **'Stadt nötig'**
  String get validation_city_required;

  /// No description provided for @validation_contains_invalid_fields.
  ///
  /// In de, this message translates to:
  /// **'Es sind ungültige Felder vorhanden.'**
  String get validation_contains_invalid_fields;

  /// No description provided for @validation_country_required.
  ///
  /// In de, this message translates to:
  /// **'Land nötig'**
  String get validation_country_required;

  /// No description provided for @validation_description_required.
  ///
  /// In de, this message translates to:
  /// **'Beschreibung nötig'**
  String get validation_description_required;

  /// No description provided for @validation_entity_not_found.
  ///
  /// In de, this message translates to:
  /// **'{entity} nicht gefunden'**
  String validation_entity_not_found(Object entity);

  /// No description provided for @validation_index_number_required.
  ///
  /// In de, this message translates to:
  /// **'Indexnummer nötig'**
  String get validation_index_number_required;

  /// No description provided for @validation_initials_required.
  ///
  /// In de, this message translates to:
  /// **'Initialen nötig'**
  String get validation_initials_required;

  /// No description provided for @validation_invalid_date.
  ///
  /// In de, this message translates to:
  /// **'Ungültiges Datum'**
  String get validation_invalid_date;

  /// No description provided for @validation_invalid_email.
  ///
  /// In de, this message translates to:
  /// **'Ungültige E-Mail-Adresse'**
  String get validation_invalid_email;

  /// No description provided for @validation_invalid_fields.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Felder'**
  String get validation_invalid_fields;

  /// No description provided for @validation_invalid_mobile.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Handynummer'**
  String get validation_invalid_mobile;

  /// No description provided for @validation_invalid_number.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Nummer'**
  String get validation_invalid_number;

  /// No description provided for @validation_invalid_phone.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Telefonnummer'**
  String get validation_invalid_phone;

  /// No description provided for @validation_invalid_selection.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Auswahl'**
  String get validation_invalid_selection;

  /// No description provided for @validation_invalid_website.
  ///
  /// In de, this message translates to:
  /// **'Ungültige Website-Adresse'**
  String get validation_invalid_website;

  /// No description provided for @validation_job_title_required.
  ///
  /// In de, this message translates to:
  /// **'Berufsbezeichnung nötig'**
  String get validation_job_title_required;

  /// No description provided for @validation_keywords_required.
  ///
  /// In de, this message translates to:
  /// **'Stichworte nötig'**
  String get validation_keywords_required;

  /// No description provided for @validation_language_required.
  ///
  /// In de, this message translates to:
  /// **'Sprache nötig'**
  String get validation_language_required;

  /// No description provided for @validation_max_x_characters.
  ///
  /// In de, this message translates to:
  /// **'Maximal {x} Zeichen erlaubt.'**
  String validation_max_x_characters(Object x);

  /// No description provided for @validation_name_required.
  ///
  /// In de, this message translates to:
  /// **'Name nötig'**
  String get validation_name_required;

  /// No description provided for @validation_order_number_required.
  ///
  /// In de, this message translates to:
  /// **'Bestellnummer nötig'**
  String get validation_order_number_required;

  /// No description provided for @validation_planned_time_needed.
  ///
  /// In de, this message translates to:
  /// **'Planzeit nötig'**
  String get validation_planned_time_needed;

  /// No description provided for @validation_please_enter_a_number.
  ///
  /// In de, this message translates to:
  /// **'Bitte geben Sie eine Zahl ein'**
  String get validation_please_enter_a_number;

  /// No description provided for @validation_position_type_required.
  ///
  /// In de, this message translates to:
  /// **'Positionstyp nötig'**
  String get validation_position_type_required;

  /// No description provided for @validation_postcode_required.
  ///
  /// In de, this message translates to:
  /// **'Postleitzahl nötig'**
  String get validation_postcode_required;

  /// No description provided for @validation_required.
  ///
  /// In de, this message translates to:
  /// **'Dieses Feld darf nicht leer sein.'**
  String get validation_required;

  /// No description provided for @validation_serial_number_required.
  ///
  /// In de, this message translates to:
  /// **'Seriennummer nötig'**
  String get validation_serial_number_required;

  /// No description provided for @validation_state_required.
  ///
  /// In de, this message translates to:
  /// **'Bundesland nötig'**
  String get validation_state_required;

  /// No description provided for @validation_status_required.
  ///
  /// In de, this message translates to:
  /// **'Status nötig'**
  String get validation_status_required;

  /// No description provided for @validation_type_required.
  ///
  /// In de, this message translates to:
  /// **'Typ nötig'**
  String get validation_type_required;

  /// No description provided for @validation_user_required.
  ///
  /// In de, this message translates to:
  /// **'Nutzer nötig'**
  String get validation_user_required;

  /// No description provided for @validation_work_instructions_required.
  ///
  /// In de, this message translates to:
  /// **'Arbeitsanweisung nötig'**
  String get validation_work_instructions_required;

  /// No description provided for @window_bottom_status_bar_created.
  ///
  /// In de, this message translates to:
  /// **'Erstellt:'**
  String get window_bottom_status_bar_created;

  /// No description provided for @window_bottom_status_bar_edited.
  ///
  /// In de, this message translates to:
  /// **'Geändert:'**
  String get window_bottom_status_bar_edited;

  /// No description provided for @window_manager.
  ///
  /// In de, this message translates to:
  /// **'Window Manager'**
  String get window_manager;

  /// No description provided for @window_manager_close_all.
  ///
  /// In de, this message translates to:
  /// **'Alle Fenster schließen'**
  String get window_manager_close_all;

  /// No description provided for @window_manager_maximize_all.
  ///
  /// In de, this message translates to:
  /// **'Alle Fenster vergrößern'**
  String get window_manager_maximize_all;

  /// No description provided for @window_manager_minimize_all.
  ///
  /// In de, this message translates to:
  /// **'Alle Fenster minimieren'**
  String get window_manager_minimize_all;
}

class _ElbCoreLocalizationsDelegate
    extends LocalizationsDelegate<ElbCoreLocalizations> {
  const _ElbCoreLocalizationsDelegate();

  @override
  Future<ElbCoreLocalizations> load(Locale locale) {
    return SynchronousFuture<ElbCoreLocalizations>(
        lookupElbCoreLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ElbCoreLocalizationsDelegate old) => false;
}

ElbCoreLocalizations lookupElbCoreLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return ElbCoreLocalizationsDe();
    case 'en':
      return ElbCoreLocalizationsEn();
  }

  throw FlutterError(
      'ElbCoreLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
