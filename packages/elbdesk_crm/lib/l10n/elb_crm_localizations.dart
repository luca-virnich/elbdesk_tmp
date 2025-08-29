import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'elb_crm_localizations_de.dart';
import 'elb_crm_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ElbCrmLocalizations
/// returned by `ElbCrmLocalizations.of(context)`.
///
/// Applications need to include `ElbCrmLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/elb_crm_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ElbCrmLocalizations.localizationsDelegates,
///   supportedLocales: ElbCrmLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the ElbCrmLocalizations.supportedLocales
/// property.
abstract class ElbCrmLocalizations {
  ElbCrmLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ElbCrmLocalizations of(BuildContext context) {
    return Localizations.of<ElbCrmLocalizations>(context, ElbCrmLocalizations)!;
  }

  static const LocalizationsDelegate<ElbCrmLocalizations> delegate =
      _ElbCrmLocalizationsDelegate();

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

  /// No description provided for @app_client_plural.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get app_client_plural;

  /// No description provided for @app_client_singular.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get app_client_singular;

  /// No description provided for @assigned_employee.
  ///
  /// In en, this message translates to:
  /// **'Assigned Employee'**
  String get assigned_employee;

  /// No description provided for @automation_engine.
  ///
  /// In en, this message translates to:
  /// **'Automation Engine'**
  String get automation_engine;

  /// No description provided for @automation_engine_short.
  ///
  /// In en, this message translates to:
  /// **'AE'**
  String get automation_engine_short;

  /// No description provided for @billing_address.
  ///
  /// In en, this message translates to:
  /// **'Billing address'**
  String get billing_address;

  /// No description provided for @communication.
  ///
  /// In en, this message translates to:
  /// **'Communication'**
  String get communication;

  /// No description provided for @company_department_plural.
  ///
  /// In en, this message translates to:
  /// **'Departments'**
  String get company_department_plural;

  /// No description provided for @company_department_singular.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get company_department_singular;

  /// No description provided for @company_employee.
  ///
  /// In en, this message translates to:
  /// **'Company Employee'**
  String get company_employee;

  /// No description provided for @company_employee_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get company_employee_active;

  /// No description provided for @company_employee_already_assigned_to_department.
  ///
  /// In en, this message translates to:
  /// **'Employee already assigned to this department'**
  String get company_employee_already_assigned_to_department;

  /// No description provided for @company_employee_assigned_companies.
  ///
  /// In en, this message translates to:
  /// **'Assigned Companies'**
  String get company_employee_assigned_companies;

  /// No description provided for @company_employee_assigned_employees.
  ///
  /// In en, this message translates to:
  /// **'Assigned Employees'**
  String get company_employee_assigned_employees;

  /// No description provided for @company_employee_department.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get company_employee_department;

  /// No description provided for @company_employee_employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get company_employee_employee;

  /// No description provided for @company_employee_go_to_card.
  ///
  /// In en, this message translates to:
  /// **'Open Employee Card'**
  String get company_employee_go_to_card;

  /// No description provided for @company_employee_go_to_customer.
  ///
  /// In en, this message translates to:
  /// **'Open Customer'**
  String get company_employee_go_to_customer;

  /// No description provided for @company_employee_inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get company_employee_inactive;

  /// No description provided for @company_employee_job_title.
  ///
  /// In en, this message translates to:
  /// **'Job Title'**
  String get company_employee_job_title;

  /// No description provided for @company_employee_no_assigned_companies.
  ///
  /// In en, this message translates to:
  /// **'No assigned Companies'**
  String get company_employee_no_assigned_companies;

  /// No description provided for @company_employee_no_assigned_employees.
  ///
  /// In en, this message translates to:
  /// **'No assigned employees'**
  String get company_employee_no_assigned_employees;

  /// No description provided for @company_employee_note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get company_employee_note;

  /// No description provided for @company_employee_plural.
  ///
  /// In en, this message translates to:
  /// **'Company Employees'**
  String get company_employee_plural;

  /// No description provided for @company_employee_removed_successfully.
  ///
  /// In en, this message translates to:
  /// **'Employee successfully removed'**
  String get company_employee_removed_successfully;

  /// No description provided for @company_employee_select_department.
  ///
  /// In en, this message translates to:
  /// **'Select department'**
  String get company_employee_select_department;

  /// No description provided for @company_employee_select_employee.
  ///
  /// In en, this message translates to:
  /// **'Select employee'**
  String get company_employee_select_employee;

  /// No description provided for @company_employee_singular.
  ///
  /// In en, this message translates to:
  /// **'Company Employee'**
  String get company_employee_singular;

  /// No description provided for @company_employee_title.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company_employee_title;

  /// No description provided for @company_plural.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get company_plural;

  /// No description provided for @company_select.
  ///
  /// In en, this message translates to:
  /// **'Select company'**
  String get company_select;

  /// No description provided for @company_singluar.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company_singluar;

  /// No description provided for @contact_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get contact_address;

  /// No description provided for @contact_address2.
  ///
  /// In en, this message translates to:
  /// **'Address 2'**
  String get contact_address2;

  /// No description provided for @contact_address3.
  ///
  /// In en, this message translates to:
  /// **'Address 3'**
  String get contact_address3;

  /// No description provided for @contact_address_plural.
  ///
  /// In en, this message translates to:
  /// **'Addresses'**
  String get contact_address_plural;

  /// No description provided for @contact_address_singular.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get contact_address_singular;

  /// No description provided for @contact_already_customer.
  ///
  /// In en, this message translates to:
  /// **'Contact is already assigned to a customer.'**
  String get contact_already_customer;

  /// No description provided for @contact_birthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday'**
  String get contact_birthday;

  /// No description provided for @contact_birthday_new.
  ///
  /// In en, this message translates to:
  /// **'New Birthday'**
  String get contact_birthday_new;

  /// No description provided for @contact_city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get contact_city;

  /// No description provided for @contact_company_table.
  ///
  /// In en, this message translates to:
  /// **'Company table'**
  String get contact_company_table;

  /// No description provided for @contact_create_as_customer.
  ///
  /// In en, this message translates to:
  /// **'Create as customer'**
  String get contact_create_as_customer;

  /// No description provided for @contact_create_as_employee.
  ///
  /// In en, this message translates to:
  /// **'Create as employee'**
  String get contact_create_as_employee;

  /// No description provided for @contact_create_customer_no_company_error.
  ///
  /// In en, this message translates to:
  /// **'Only company contacts can be created as customers.'**
  String get contact_create_customer_no_company_error;

  /// No description provided for @contact_create_customer_no_company_on_server_error.
  ///
  /// In en, this message translates to:
  /// **'Saved contact is not a company contact, do you have unsaved changes?'**
  String get contact_create_customer_no_company_on_server_error;

  /// No description provided for @contact_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contact_email;

  /// No description provided for @contact_first_name.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get contact_first_name;

  /// No description provided for @contact_general_contact_information.
  ///
  /// In en, this message translates to:
  /// **'General Contact Information'**
  String get contact_general_contact_information;

  /// No description provided for @contact_go_to_customer.
  ///
  /// In en, this message translates to:
  /// **'Open customer'**
  String get contact_go_to_customer;

  /// No description provided for @contact_id_and_fullname.
  ///
  /// In en, this message translates to:
  /// **'ID / Full Name'**
  String get contact_id_and_fullname;

  /// No description provided for @contact_inactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get contact_inactive;

  /// No description provided for @contact_last_name.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get contact_last_name;

  /// No description provided for @contact_mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile Phone No.'**
  String get contact_mobile;

  /// No description provided for @contact_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get contact_name;

  /// No description provided for @contact_new.
  ///
  /// In en, this message translates to:
  /// **'New Contact'**
  String get contact_new;

  /// No description provided for @contact_person_table.
  ///
  /// In en, this message translates to:
  /// **'Persons table'**
  String get contact_person_table;

  /// No description provided for @contact_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone No.'**
  String get contact_phone;

  /// No description provided for @contact_plural.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contact_plural;

  /// No description provided for @contact_singular.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact_singular;

  /// No description provided for @contact_state.
  ///
  /// In en, this message translates to:
  /// **'State'**
  String get contact_state;

  /// No description provided for @contact_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get contact_type;

  /// No description provided for @contact_type_company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get contact_type_company;

  /// No description provided for @contact_type_person.
  ///
  /// In en, this message translates to:
  /// **'Person'**
  String get contact_type_person;

  /// No description provided for @contact_website.
  ///
  /// In en, this message translates to:
  /// **'Website'**
  String get contact_website;

  /// No description provided for @contact_zip.
  ///
  /// In en, this message translates to:
  /// **'Post Code'**
  String get contact_zip;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @contacts_companies.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get contacts_companies;

  /// No description provided for @contacts_persons.
  ///
  /// In en, this message translates to:
  /// **'Persons'**
  String get contacts_persons;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @country_code_address_format.
  ///
  /// In en, this message translates to:
  /// **'Address Format'**
  String get country_code_address_format;

  /// No description provided for @country_code_address_format_blank_postCode_city.
  ///
  /// In en, this message translates to:
  /// **'Blank Line + Post Code + City'**
  String get country_code_address_format_blank_postCode_city;

  /// No description provided for @country_code_address_format_city_country_postCode.
  ///
  /// In en, this message translates to:
  /// **'City + Country + Post Code'**
  String get country_code_address_format_city_country_postCode;

  /// No description provided for @country_code_address_format_city_postcode.
  ///
  /// In en, this message translates to:
  /// **'City + Post Code'**
  String get country_code_address_format_city_postcode;

  /// No description provided for @country_code_address_format_postcode_city.
  ///
  /// In en, this message translates to:
  /// **'Post Code + City'**
  String get country_code_address_format_postcode_city;

  /// No description provided for @country_code_code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get country_code_code;

  /// No description provided for @country_code_contact_address_format.
  ///
  /// In en, this message translates to:
  /// **'Contact Address Format'**
  String get country_code_contact_address_format;

  /// No description provided for @country_code_contact_address_format_after_company_name.
  ///
  /// In en, this message translates to:
  /// **'After Company Name'**
  String get country_code_contact_address_format_after_company_name;

  /// No description provided for @country_code_contact_address_format_first.
  ///
  /// In en, this message translates to:
  /// **'First'**
  String get country_code_contact_address_format_first;

  /// No description provided for @country_code_contact_address_format_last.
  ///
  /// In en, this message translates to:
  /// **'Last'**
  String get country_code_contact_address_format_last;

  /// No description provided for @country_code_eu_code.
  ///
  /// In en, this message translates to:
  /// **'EU Country/Region-Code'**
  String get country_code_eu_code;

  /// No description provided for @country_code_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get country_code_id;

  /// No description provided for @country_code_intrastat_code.
  ///
  /// In en, this message translates to:
  /// **'Intrastat Code'**
  String get country_code_intrastat_code;

  /// No description provided for @country_code_iso_code.
  ///
  /// In en, this message translates to:
  /// **'ISO Code'**
  String get country_code_iso_code;

  /// No description provided for @country_code_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get country_code_name;

  /// No description provided for @country_code_numeric_iso_code.
  ///
  /// In en, this message translates to:
  /// **'ISO Numeric Code'**
  String get country_code_numeric_iso_code;

  /// No description provided for @country_code_plural.
  ///
  /// In en, this message translates to:
  /// **'Countries/Regions'**
  String get country_code_plural;

  /// No description provided for @country_code_primary.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get country_code_primary;

  /// No description provided for @country_code_region.
  ///
  /// In en, this message translates to:
  /// **'Country Name'**
  String get country_code_region;

  /// No description provided for @country_code_show_state.
  ///
  /// In en, this message translates to:
  /// **'Show State'**
  String get country_code_show_state;

  /// No description provided for @country_code_singular.
  ///
  /// In en, this message translates to:
  /// **'Country/Region'**
  String get country_code_singular;

  /// No description provided for @country_code_tax_scheme.
  ///
  /// In en, this message translates to:
  /// **'VAT Scheme'**
  String get country_code_tax_scheme;

  /// No description provided for @create_customer_question.
  ///
  /// In en, this message translates to:
  /// **'How do you want to create a new customer?'**
  String get create_customer_question;

  /// No description provided for @create_customer_question_from_contact.
  ///
  /// In en, this message translates to:
  /// **'From contact'**
  String get create_customer_question_from_contact;

  /// No description provided for @create_customer_question_new.
  ///
  /// In en, this message translates to:
  /// **'New customer'**
  String get create_customer_question_new;

  /// No description provided for @crm.
  ///
  /// In en, this message translates to:
  /// **'CRM'**
  String get crm;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @customer_and_customer_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer / Customer\'s Customers'**
  String get customer_and_customer_customer;

  /// No description provided for @customer_billing_address.
  ///
  /// In en, this message translates to:
  /// **'Billing Address'**
  String get customer_billing_address;

  /// No description provided for @customer_billing_addresses.
  ///
  /// In en, this message translates to:
  /// **'Billing Addresses'**
  String get customer_billing_addresses;

  /// No description provided for @customer_billing_select_address.
  ///
  /// In en, this message translates to:
  /// **'Select billing address'**
  String get customer_billing_select_address;

  /// No description provided for @customer_company_delete_dialog_text.
  ///
  /// In en, this message translates to:
  /// **'Should the company {name} really be removed?'**
  String customer_company_delete_dialog_text(Object name);

  /// No description provided for @customer_contact_person.
  ///
  /// In en, this message translates to:
  /// **'Contact Person'**
  String get customer_contact_person;

  /// No description provided for @customer_contract.
  ///
  /// In en, this message translates to:
  /// **'Contract Sovereignty'**
  String get customer_contract;

  /// No description provided for @customer_customer.
  ///
  /// In en, this message translates to:
  /// **'Customer\'s Customer'**
  String get customer_customer;

  /// No description provided for @customer_customer_client_delete_dialog_text.
  ///
  /// In en, this message translates to:
  /// **'Should the customer client {name} really be removed?'**
  String customer_customer_client_delete_dialog_text(Object name);

  /// No description provided for @customer_customer_clients.
  ///
  /// In en, this message translates to:
  /// **'Customer clients'**
  String get customer_customer_clients;

  /// No description provided for @customer_customer_contact_person.
  ///
  /// In en, this message translates to:
  /// **'Contact person customer customer'**
  String get customer_customer_contact_person;

  /// No description provided for @customer_department_delete_dialog_text.
  ///
  /// In en, this message translates to:
  /// **'Should the department {name} really be removed?'**
  String customer_department_delete_dialog_text(Object name);

  /// No description provided for @customer_employee_delete_dialog_text.
  ///
  /// In en, this message translates to:
  /// **'Should the employee {name} really be removed?'**
  String customer_employee_delete_dialog_text(Object name);

  /// No description provided for @customer_ftp.
  ///
  /// In en, this message translates to:
  /// **'FTP'**
  String get customer_ftp;

  /// No description provided for @customer_ftp_confirmation_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get customer_ftp_confirmation_email;

  /// No description provided for @customer_ftp_confirmation_message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get customer_ftp_confirmation_message;

  /// No description provided for @customer_ftp_confirmation_recepient_coe.
  ///
  /// In en, this message translates to:
  /// **'Confirmation recepient: COE'**
  String get customer_ftp_confirmation_recepient_coe;

  /// No description provided for @customer_ftp_confirmation_recepient_customer.
  ///
  /// In en, this message translates to:
  /// **'Confirmation recepient: Customer'**
  String get customer_ftp_confirmation_recepient_customer;

  /// No description provided for @customer_ftp_confirmation_recepient_type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get customer_ftp_confirmation_recepient_type;

  /// No description provided for @customer_ftp_confirmation_subject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get customer_ftp_confirmation_subject;

  /// No description provided for @customer_ftp_connection.
  ///
  /// In en, this message translates to:
  /// **'FTP-Connection'**
  String get customer_ftp_connection;

  /// No description provided for @customer_ftp_data_input.
  ///
  /// In en, this message translates to:
  /// **'Data input'**
  String get customer_ftp_data_input;

  /// No description provided for @customer_ftp_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get customer_ftp_description;

  /// No description provided for @customer_ftp_host.
  ///
  /// In en, this message translates to:
  /// **'Host'**
  String get customer_ftp_host;

  /// No description provided for @customer_ftp_master_data.
  ///
  /// In en, this message translates to:
  /// **'Master data'**
  String get customer_ftp_master_data;

  /// No description provided for @customer_ftp_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get customer_ftp_password;

  /// No description provided for @customer_ftp_port.
  ///
  /// In en, this message translates to:
  /// **'Port'**
  String get customer_ftp_port;

  /// No description provided for @customer_ftp_user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get customer_ftp_user;

  /// No description provided for @customer_ftp_workflow_start.
  ///
  /// In en, this message translates to:
  /// **'Workflow Start'**
  String get customer_ftp_workflow_start;

  /// No description provided for @customer_id.
  ///
  /// In en, this message translates to:
  /// **'Customer ID'**
  String get customer_id;

  /// No description provided for @customer_invoice_delivery.
  ///
  /// In en, this message translates to:
  /// **'Invoice delivery'**
  String get customer_invoice_delivery;

  /// No description provided for @customer_invoice_delivery_method.
  ///
  /// In en, this message translates to:
  /// **'Delivery of invoices'**
  String get customer_invoice_delivery_method;

  /// No description provided for @customer_invoice_email.
  ///
  /// In en, this message translates to:
  /// **'Email for invoices'**
  String get customer_invoice_email;

  /// No description provided for @customer_invoice_method_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get customer_invoice_method_email;

  /// No description provided for @customer_invoice_method_post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get customer_invoice_method_post;

  /// No description provided for @customer_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get customer_name;

  /// No description provided for @customer_new.
  ///
  /// In en, this message translates to:
  /// **'New Customer'**
  String get customer_new;

  /// No description provided for @customer_no_billing_addresses_added.
  ///
  /// In en, this message translates to:
  /// **'No additional billing addresses added yet.'**
  String get customer_no_billing_addresses_added;

  /// No description provided for @customer_no_customer_clients.
  ///
  /// In en, this message translates to:
  /// **'No customer clients added yet.'**
  String get customer_no_customer_clients;

  /// No description provided for @customer_no_shipping_addresses_added.
  ///
  /// In en, this message translates to:
  /// **'No additional delivery addresses added yet.'**
  String get customer_no_shipping_addresses_added;

  /// No description provided for @customer_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get customer_payment;

  /// No description provided for @customer_payment_address_delete_dialog_text.
  ///
  /// In en, this message translates to:
  /// **'Should the billing address {name} really be removed?'**
  String customer_payment_address_delete_dialog_text(Object name);

  /// No description provided for @customer_payment_code.
  ///
  /// In en, this message translates to:
  /// **'Payment code'**
  String get customer_payment_code;

  /// No description provided for @customer_payment_terms.
  ///
  /// In en, this message translates to:
  /// **'Payment terms'**
  String get customer_payment_terms;

  /// No description provided for @customer_payments.
  ///
  /// In en, this message translates to:
  /// **'Payments'**
  String get customer_payments;

  /// No description provided for @customer_plural.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customer_plural;

  /// No description provided for @customer_sales_order_contact_person.
  ///
  /// In en, this message translates to:
  /// **'Contact person'**
  String get customer_sales_order_contact_person;

  /// No description provided for @customer_sales_order_field_hints.
  ///
  /// In en, this message translates to:
  /// **'Sales Order hints'**
  String get customer_sales_order_field_hints;

  /// No description provided for @customer_sales_order_first_ref.
  ///
  /// In en, this message translates to:
  /// **'1. Reference'**
  String get customer_sales_order_first_ref;

  /// No description provided for @customer_sales_order_keywords.
  ///
  /// In en, this message translates to:
  /// **'Keywords'**
  String get customer_sales_order_keywords;

  /// No description provided for @customer_sales_order_plural.
  ///
  /// In en, this message translates to:
  /// **'Sales Orders'**
  String get customer_sales_order_plural;

  /// No description provided for @customer_sales_order_second_ref.
  ///
  /// In en, this message translates to:
  /// **'2. Reference'**
  String get customer_sales_order_second_ref;

  /// No description provided for @customer_select_customer_clients.
  ///
  /// In en, this message translates to:
  /// **'Select customer clients'**
  String get customer_select_customer_clients;

  /// No description provided for @customer_shipping.
  ///
  /// In en, this message translates to:
  /// **'Shipping'**
  String get customer_shipping;

  /// No description provided for @customer_shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get customer_shipping_address;

  /// No description provided for @customer_shipping_address_already_added.
  ///
  /// In en, this message translates to:
  /// **'This shipping method was already added as delivery address'**
  String get customer_shipping_address_already_added;

  /// No description provided for @customer_shipping_address_delete_dialog_text.
  ///
  /// In en, this message translates to:
  /// **'Should the delivery address {name} really be removed?'**
  String customer_shipping_address_delete_dialog_text(Object name);

  /// No description provided for @customer_shipping_addresses.
  ///
  /// In en, this message translates to:
  /// **'Shipping Addresses'**
  String get customer_shipping_addresses;

  /// No description provided for @customer_shipping_select_address.
  ///
  /// In en, this message translates to:
  /// **'Select shipping address'**
  String get customer_shipping_select_address;

  /// No description provided for @customer_singular.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer_singular;

  /// No description provided for @customer_supervisor.
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get customer_supervisor;

  /// No description provided for @customer_table.
  ///
  /// In en, this message translates to:
  /// **'Customer table'**
  String get customer_table;

  /// No description provided for @customer_title.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer_title;

  /// No description provided for @customer_vat_id.
  ///
  /// In en, this message translates to:
  /// **'VAT ID'**
  String get customer_vat_id;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Customers'**
  String get customers;

  /// No description provided for @department_code_code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get department_code_code;

  /// No description provided for @department_code_description.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get department_code_description;

  /// No description provided for @department_code_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get department_code_id;

  /// No description provided for @department_code_plural.
  ///
  /// In en, this message translates to:
  /// **'Department codes'**
  String get department_code_plural;

  /// No description provided for @department_code_singular.
  ///
  /// In en, this message translates to:
  /// **'Department'**
  String get department_code_singular;

  /// No description provided for @employee.
  ///
  /// In en, this message translates to:
  /// **'Employee'**
  String get employee;

  /// No description provided for @employees.
  ///
  /// In en, this message translates to:
  /// **'Employees'**
  String get employees;

  /// No description provided for @event_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get event_description;

  /// No description provided for @event_end_date.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get event_end_date;

  /// No description provided for @event_execution_date.
  ///
  /// In en, this message translates to:
  /// **'Execution Date'**
  String get event_execution_date;

  /// No description provided for @event_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get event_name;

  /// No description provided for @event_plural.
  ///
  /// In en, this message translates to:
  /// **'Events'**
  String get event_plural;

  /// No description provided for @event_remove_contact.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get event_remove_contact;

  /// No description provided for @event_singular.
  ///
  /// In en, this message translates to:
  /// **'Event'**
  String get event_singular;

  /// No description provided for @event_start_date.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get event_start_date;

  /// No description provided for @event_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get event_status;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @initials.
  ///
  /// In en, this message translates to:
  /// **'Initials'**
  String get initials;

  /// No description provided for @langauge_code_code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get langauge_code_code;

  /// No description provided for @langauge_code_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get langauge_code_name;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @language_code_code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get language_code_code;

  /// No description provided for @language_code_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get language_code_id;

  /// No description provided for @language_code_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get language_code_name;

  /// No description provided for @language_code_plural.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get language_code_plural;

  /// No description provided for @language_code_primary.
  ///
  /// In en, this message translates to:
  /// **'Standard'**
  String get language_code_primary;

  /// No description provided for @language_code_singular.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language_code_singular;

  /// No description provided for @middle_name.
  ///
  /// In en, this message translates to:
  /// **'Middle Name'**
  String get middle_name;

  /// No description provided for @new_customer.
  ///
  /// In en, this message translates to:
  /// **'New Customer'**
  String get new_customer;

  /// No description provided for @payment_and_delivery_address.
  ///
  /// In en, this message translates to:
  /// **'Payment and Delivery Address'**
  String get payment_and_delivery_address;

  /// No description provided for @payment_code_calculate_discount_on_credit_note.
  ///
  /// In en, this message translates to:
  /// **'Calcluate Discount on Credit Note'**
  String get payment_code_calculate_discount_on_credit_note;

  /// No description provided for @payment_code_code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get payment_code_code;

  /// No description provided for @payment_code_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get payment_code_description;

  /// No description provided for @payment_code_discount_date_calculation.
  ///
  /// In en, this message translates to:
  /// **'Discount Date Calculation'**
  String get payment_code_discount_date_calculation;

  /// No description provided for @payment_code_discount_date_calculation_error_hint.
  ///
  /// In en, this message translates to:
  /// **'Please enter a number followed by \'D\', \'WD\', \'W\', \'M\', \'Q\', or \'Y\' (e.g., \'7D\').'**
  String get payment_code_discount_date_calculation_error_hint;

  /// No description provided for @payment_code_discount_percentage.
  ///
  /// In en, this message translates to:
  /// **'Discount %'**
  String get payment_code_discount_percentage;

  /// No description provided for @payment_code_due_date_calculation.
  ///
  /// In en, this message translates to:
  /// **'Due Date Calculation'**
  String get payment_code_due_date_calculation;

  /// No description provided for @payment_code_due_date_calculation_error_hint.
  ///
  /// In en, this message translates to:
  /// **'Please enter a number followed by \'D\', \'WD\', \'W\', \'M\', \'Q\', or \'Y\' (e.g., \'7D\').'**
  String get payment_code_due_date_calculation_error_hint;

  /// No description provided for @payment_code_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get payment_code_id;

  /// No description provided for @payment_code_plural.
  ///
  /// In en, this message translates to:
  /// **'Payment Terms'**
  String get payment_code_plural;

  /// No description provided for @payment_code_singular.
  ///
  /// In en, this message translates to:
  /// **'Payment Term'**
  String get payment_code_singular;

  /// No description provided for @salutation_code_code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get salutation_code_code;

  /// No description provided for @salutation_code_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get salutation_code_description;

  /// No description provided for @salutation_code_id.
  ///
  /// In en, this message translates to:
  /// **'ID'**
  String get salutation_code_id;

  /// No description provided for @salutation_code_plural.
  ///
  /// In en, this message translates to:
  /// **'Salutations'**
  String get salutation_code_plural;

  /// No description provided for @salutation_code_primary_company.
  ///
  /// In en, this message translates to:
  /// **'Standard for companies'**
  String get salutation_code_primary_company;

  /// No description provided for @salutation_code_primary_person.
  ///
  /// In en, this message translates to:
  /// **'Standard for persons'**
  String get salutation_code_primary_person;

  /// No description provided for @salutation_code_singular.
  ///
  /// In en, this message translates to:
  /// **'Salutation'**
  String get salutation_code_singular;

  /// No description provided for @shipping_address.
  ///
  /// In en, this message translates to:
  /// **'Shipping address'**
  String get shipping_address;

  /// No description provided for @shipping_method_code.
  ///
  /// In en, this message translates to:
  /// **'Shipping code'**
  String get shipping_method_code;

  /// No description provided for @shipping_method_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get shipping_method_description;

  /// No description provided for @shipping_method_id.
  ///
  /// In en, this message translates to:
  /// **'Id'**
  String get shipping_method_id;

  /// No description provided for @shipping_method_is_activated.
  ///
  /// In en, this message translates to:
  /// **'Activated'**
  String get shipping_method_is_activated;

  /// No description provided for @shipping_method_plural.
  ///
  /// In en, this message translates to:
  /// **'Shipping methods'**
  String get shipping_method_plural;

  /// No description provided for @shipping_method_singular.
  ///
  /// In en, this message translates to:
  /// **'Shipping method'**
  String get shipping_method_singular;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;
}

class _ElbCrmLocalizationsDelegate
    extends LocalizationsDelegate<ElbCrmLocalizations> {
  const _ElbCrmLocalizationsDelegate();

  @override
  Future<ElbCrmLocalizations> load(Locale locale) {
    return SynchronousFuture<ElbCrmLocalizations>(
        lookupElbCrmLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ElbCrmLocalizationsDelegate old) => false;
}

ElbCrmLocalizations lookupElbCrmLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return ElbCrmLocalizationsDe();
    case 'en':
      return ElbCrmLocalizationsEn();
  }

  throw FlutterError(
      'ElbCrmLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
