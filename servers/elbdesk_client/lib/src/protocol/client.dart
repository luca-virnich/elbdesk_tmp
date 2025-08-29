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
import 'dart:async' as _i2;
import 'package:elbdesk_client/src/protocol/modules/core/admin_migration/models/migration_mats_company.dart'
    as _i3;
import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart'
    as _i4;
import 'package:elbdesk_client/src/protocol/modules/crm/contact/models/contact.dart'
    as _i5;
import 'package:elbdesk_client/src/protocol/modules/crm/customer/models/customer.dart'
    as _i6;
import 'package:elbdesk_client/src/protocol/modules/core/admin_migration/models/migration_mats_person.dart'
    as _i7;
import 'package:elbdesk_client/src/protocol/modules/core/app_user/models/app_user.dart'
    as _i8;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/models/sales_order_item_type.dart'
    as _i9;
import 'package:elbdesk_client/src/protocol/modules/core/table/table_type.dart'
    as _i10;
import 'package:elbdesk_client/src/protocol/modules/core/entity_log/entity_log.dart'
    as _i11;
import 'package:elbdesk_client/src/protocol/modules/core/global_settings/models/global_settings.dart'
    as _i12;
import 'package:elbdesk_client/src/protocol/modules/core/service_user/model/service_user.dart'
    as _i13;
import 'package:elbdesk_client/src/protocol/modules/core/service_user/model/service_user_token.dart'
    as _i14;
import 'package:elbdesk_client/src/protocol/modules/crm/app_client/models/app_client.dart'
    as _i15;
import 'package:elbdesk_client/src/protocol/modules/crm/company_department/models/company_department.dart'
    as _i16;
import 'package:elbdesk_client/src/protocol/modules/crm/company_employee/models/company_employee.dart'
    as _i17;
import 'package:elbdesk_client/src/protocol/modules/crm/company_employee/models/company_employee_department_jt.dart'
    as _i18;
import 'package:elbdesk_client/src/protocol/modules/crm/contact/models/contact_type.dart'
    as _i19;
import 'package:elbdesk_client/src/protocol/modules/core/spotlight/spotlight_item.dart'
    as _i20;
import 'package:elbdesk_client/src/protocol/modules/crm/contact/models/contact_field.dart'
    as _i21;
import 'package:elbdesk_client/src/protocol/modules/crm/country_code/models/country_code.dart'
    as _i22;
import 'package:elbdesk_client/src/protocol/modules/crm/crm_event/models/crm_event.dart'
    as _i23;
import 'package:elbdesk_client/src/protocol/modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart'
    as _i24;
import 'package:elbdesk_client/src/protocol/modules/crm/customer_billing_customers/models/customer_billing_customer.dart'
    as _i25;
import 'package:elbdesk_client/src/protocol/modules/crm/customer/models/shipping_method.dart'
    as _i26;
import 'package:elbdesk_client/src/protocol/modules/crm/customer_customer/models/customer_customer.dart'
    as _i27;
import 'package:elbdesk_client/src/protocol/modules/crm/department_code/models/department_code.dart'
    as _i28;
import 'package:elbdesk_client/src/protocol/modules/crm/language_code/models/language_code.dart'
    as _i29;
import 'package:elbdesk_client/src/protocol/modules/crm/payment_code/models/payment_code.dart'
    as _i30;
import 'package:elbdesk_client/src/protocol/modules/crm/salutation_code/models/salutation_code.dart'
    as _i31;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork.dart'
    as _i32;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork_log.dart'
    as _i33;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork_master.dart'
    as _i34;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i35;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_status.dart'
    as _i36;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i37;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_template/models/artwork_template.dart'
    as _i38;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i39;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i40;
import 'package:elbdesk_client/src/protocol/modules/prepress/color/models/artwork_color.dart'
    as _i41;
import 'package:elbdesk_client/src/protocol/modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i42;
import 'package:elbdesk_client/src/protocol/modules/prepress/drucklayout/models/drucklayout.dart'
    as _i43;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i44;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i45;
import 'package:elbdesk_client/src/protocol/modules/prepress/drucklayout/models/drucklayout_pre_selection.dart'
    as _i46;
import 'package:elbdesk_client/src/protocol/modules/prepress/drucklayout/models/drucklayout_selection.dart'
    as _i47;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_light.dart'
    as _i48;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_light.dart'
    as _i49;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i50;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i51;
import 'package:elbdesk_client/src/protocol/modules/prepress/product/models/product.dart'
    as _i52;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork_type.dart'
    as _i53;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork_print_process_type.dart'
    as _i54;
import 'package:elbdesk_client/src/protocol/modules/prepress/product/models/product_type.dart'
    as _i55;
import 'package:elbdesk_client/src/protocol/protocol.dart' as _i56;
import 'package:elbdesk_client/src/protocol/modules/prepress/product/models/product_log.dart'
    as _i57;
import 'package:elbdesk_client/src/protocol/modules/prepress/product/models/product_master.dart'
    as _i58;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/models/sales_order_item.dart'
    as _i59;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_dto.dart'
    as _i60;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau.dart'
    as _i61;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork.dart'
    as _i62;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval.dart'
    as _i63;
import 'package:elbdesk_client/src/protocol/modules/sales/sales_order/models/sales_order.dart'
    as _i64;
import 'package:elbdesk_client/src/protocol/modules/unsorted/json_designer/json_template.dart'
    as _i65;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i66;
import 'protocol.dart' as _i67;

/// Endpoint for managing migration mats company data
/// {@category Endpoint}
class EndpointMigrationMatsCompany extends _i1.EndpointRef {
  EndpointMigrationMatsCompany(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'migrationMatsCompany';

  /// Creates a new migration mats company
  _i2.Future<_i3.MigrationMatsCompanyDTO> create(
          {required _i3.MigrationMatsCompanyDTO entity}) =>
      caller.callServerEndpoint<_i3.MigrationMatsCompanyDTO>(
        'migrationMatsCompany',
        'create',
        {'entity': entity},
      );

  /// Fetches all migration mats companies with optional sorting and filtering
  _i2.Future<List<_i3.MigrationMatsCompanyDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i3.MigrationMatsCompanyDTO>>(
        'migrationMatsCompany',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetches a migration mats company by ID
  _i2.Future<_i3.MigrationMatsCompanyDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i3.MigrationMatsCompanyDTO?>(
        'migrationMatsCompany',
        'fetchById',
        {'id': id},
      );

  /// Updates a migration mats company
  _i2.Future<_i3.MigrationMatsCompanyDTO> update({
    required _i3.MigrationMatsCompanyDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i3.MigrationMatsCompanyDTO>(
        'migrationMatsCompany',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Deletes a migration mats company
  _i2.Future<void> delete({required _i3.MigrationMatsCompanyDTO entity}) =>
      caller.callServerEndpoint<void>(
        'migrationMatsCompany',
        'delete',
        {'entity': entity},
      );

  /// Stream to watch for migration mats company changes
  _i2.Stream<_i3.MigrationMatsCompanyDTO> watch({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i3.MigrationMatsCompanyDTO>, _i3.MigrationMatsCompanyDTO>(
        'migrationMatsCompany',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
          'releaseOnClose': releaseOnClose,
        },
        {},
      );

  /// Stream to watch for updates to a specific migration mats company
  _i2.Stream<_i3.MigrationMatsCompanyDTO> watchUpdates(
          {required int entityId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i3.MigrationMatsCompanyDTO>, _i3.MigrationMatsCompanyDTO>(
        'migrationMatsCompany',
        'watchUpdates',
        {'entityId': entityId},
        {},
      );

  /// Releases lock on migration mats company
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'migrationMatsCompany',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Find all entity locks for migration mats company
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'migrationMatsCompany',
        'findEntityLocks',
        {},
      );

  /// Imports a batch of migration mats companies
  _i2.Future<void> import(
          {required List<_i3.MigrationMatsCompanyDTO> companies}) =>
      caller.callServerEndpoint<void>(
        'migrationMatsCompany',
        'import',
        {'companies': companies},
      );

  /// Migrates a batch of MigrationMatsCompanies to Contacts
  _i2.Future<List<_i5.ContactDTO>> migrateToContacts({
    required int offset,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_i5.ContactDTO>>(
        'migrationMatsCompany',
        'migrateToContacts',
        {
          'offset': offset,
          'limit': limit,
        },
      );

  /// Gets the count of available migration mats companies
  _i2.Future<int> count({
    _i4.Filter? filter,
    bool? isMigrated,
  }) =>
      caller.callServerEndpoint<int>(
        'migrationMatsCompany',
        'count',
        {
          'filter': filter,
          'isMigrated': isMigrated,
        },
      );

  /// Migrates companies to customers
  _i2.Future<List<_i6.CustomerDTO>> migrateToCustomers({
    required int offset,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_i6.CustomerDTO>>(
        'migrationMatsCompany',
        'migrateToCustomers',
        {
          'offset': offset,
          'limit': limit,
        },
      );

  /// Assigns employees to companies based on matching accountId
  _i2.Future<(int, bool, int)> assignEmployeesToCompanies({
    required int offset,
    required int limit,
  }) =>
      caller.callServerEndpoint<(int, bool, int)>(
        'migrationMatsCompany',
        'assignEmployeesToCompanies',
        {
          'offset': offset,
          'limit': limit,
        },
      );

  /// Creates departments from MigrationMatsPerson entries where isPerson = false
  _i2.Future<(int, bool, int)> createDepartments({
    required int offset,
    required int limit,
  }) =>
      caller.callServerEndpoint<(int, bool, int)>(
        'migrationMatsCompany',
        'createDepartments',
        {
          'offset': offset,
          'limit': limit,
        },
      );

  /// Bool check if there is at least a single contact linked with a mats
  /// company
  /// contact has a relation migrationMatsCompany with migrationMatsCompanyId
  /// that we can check for that
  _i2.Future<bool> hasGeneratedContacts() => caller.callServerEndpoint<bool>(
        'migrationMatsCompany',
        'hasGeneratedContacts',
        {},
      );

  /// Bool check if there is at least a single contact linked with a mats
  /// company *and* a person
  /// contact has a relation migrationMatsCompany with migrationMatsCompanyId
  /// and a relation migrationMatsPerson with migrationMatsPersonId
  /// that we can check for that
  _i2.Future<bool> hasGeneratedContactsAndPerson() =>
      caller.callServerEndpoint<bool>(
        'migrationMatsCompany',
        'hasGeneratedContactsAndPerson',
        {},
      );
}

/// Endpoint for managing migration mats person data
/// {@category Endpoint}
class EndpointMigrationMatsPerson extends _i1.EndpointRef {
  EndpointMigrationMatsPerson(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'migrationMatsPerson';

  /// Creates a new migration mats person
  _i2.Future<_i7.MigrationMatsPersonDTO> create(
          {required _i7.MigrationMatsPersonDTO entity}) =>
      caller.callServerEndpoint<_i7.MigrationMatsPersonDTO>(
        'migrationMatsPerson',
        'create',
        {'entity': entity},
      );

  /// Fetches all migration mats persons with optional sorting and filtering
  _i2.Future<List<_i7.MigrationMatsPersonDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i7.MigrationMatsPersonDTO>>(
        'migrationMatsPerson',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetches a migration mats person by ID
  _i2.Future<_i7.MigrationMatsPersonDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i7.MigrationMatsPersonDTO?>(
        'migrationMatsPerson',
        'fetchById',
        {'id': id},
      );

  /// Updates a migration mats person
  _i2.Future<_i7.MigrationMatsPersonDTO> update({
    required _i7.MigrationMatsPersonDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i7.MigrationMatsPersonDTO>(
        'migrationMatsPerson',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Deletes a migration mats person
  _i2.Future<void> delete({required _i7.MigrationMatsPersonDTO entity}) =>
      caller.callServerEndpoint<void>(
        'migrationMatsPerson',
        'delete',
        {'entity': entity},
      );

  /// Stream to watch for migration mats person changes
  _i2.Stream<_i7.MigrationMatsPersonDTO> watch({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i7.MigrationMatsPersonDTO>,
          _i7.MigrationMatsPersonDTO>(
        'migrationMatsPerson',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
          'releaseOnClose': releaseOnClose,
        },
        {},
      );

  /// Stream to watch for updates to a specific migration mats person
  _i2.Stream<_i7.MigrationMatsPersonDTO> watchUpdates(
          {required int entityId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i7.MigrationMatsPersonDTO>,
          _i7.MigrationMatsPersonDTO>(
        'migrationMatsPerson',
        'watchUpdates',
        {'entityId': entityId},
        {},
      );

  /// Releases lock on migration mats person
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'migrationMatsPerson',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Find all entity locks for migration mats person
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'migrationMatsPerson',
        'findEntityLocks',
        {},
      );

  /// Imports a batch of migration mats persons
  _i2.Future<void> import(
          {required List<_i7.MigrationMatsPersonDTO> persons}) =>
      caller.callServerEndpoint<void>(
        'migrationMatsPerson',
        'import',
        {'persons': persons},
      );

  /// Migrates a batch of MigrationMatsPersons to Contacts
  _i2.Future<List<_i5.ContactDTO>> migrateToContacts({
    required int offset,
    required int limit,
  }) =>
      caller.callServerEndpoint<List<_i5.ContactDTO>>(
        'migrationMatsPerson',
        'migrateToContacts',
        {
          'offset': offset,
          'limit': limit,
        },
      );

  /// Gets the count of available migration mats persons
  _i2.Future<int> count({
    _i4.Filter? filter,
    bool? isMigrated,
    bool? isPerson,
  }) =>
      caller.callServerEndpoint<int>(
        'migrationMatsPerson',
        'count',
        {
          'filter': filter,
          'isMigrated': isMigrated,
          'isPerson': isPerson,
        },
      );
}

/// {@category Endpoint}
class EndpointAppUserSelf extends _i1.EndpointRef {
  EndpointAppUserSelf(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appUserSelf';

  _i2.Stream<_i8.AppUserDTO> watchSelf() => caller.callStreamingServerEndpoint<
          _i2.Stream<_i8.AppUserDTO>, _i8.AppUserDTO>(
        'appUserSelf',
        'watchSelf',
        {},
        {},
      );

  _i2.Future<_i8.AppUserDTO> fetchSelf() =>
      caller.callServerEndpoint<_i8.AppUserDTO>(
        'appUserSelf',
        'fetchSelf',
        {},
      );
}

/// Endpoint for [AppUserDTO]
/// {@category Endpoint}
class EndpointAppUser extends _i1.EndpointRef {
  EndpointAppUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appUser';

  _i2.Future<bool> promoteToAdmin() => caller.callServerEndpoint<bool>(
        'appUser',
        'promoteToAdmin',
        {},
      );

  _i2.Stream<_i8.AppUserDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i8.AppUserDTO>,
          _i8.AppUserDTO>(
        'appUser',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// Fetch an AppUser by its id
  _i2.Future<_i8.AppUserDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i8.AppUserDTO?>(
        'appUser',
        'fetchById',
        {'id': id},
      );

  /// Find all AppUsers
  _i2.Future<List<_i8.AppUserDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i8.AppUserDTO>>(
        'appUser',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i8.AppUserDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i8.AppUserDTO?>(
        'appUser',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'appUser',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Create a new User with the, optional, given sessionId so it can be
  /// edited by the user on the client
  _i2.Future<_i8.AppUserDTO> create({required String sessionId}) =>
      caller.callServerEndpoint<_i8.AppUserDTO>(
        'appUser',
        'create',
        {'sessionId': sessionId},
      );

  _i2.Future<_i8.AppUserDTO> update({
    required _i8.AppUserDTO appUser,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i8.AppUserDTO>(
        'appUser',
        'update',
        {
          'appUser': appUser,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<bool> delete({
    required int userId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'appUser',
        'delete',
        {
          'userId': userId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'appUser',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointAppUserPublicInsecure extends _i1.EndpointRef {
  EndpointAppUserPublicInsecure(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appUserPublicInsecure';

  _i2.Future<bool> hasUsers() => caller.callServerEndpoint<bool>(
        'appUserPublicInsecure',
        'hasUsers',
        {},
      );

  _i2.Future<_i8.AppUserDTO> createInitialAdminAppUser({
    required String email,
    required String fullName,
  }) =>
      caller.callServerEndpoint<_i8.AppUserDTO>(
        'appUserPublicInsecure',
        'createInitialAdminAppUser',
        {
          'email': email,
          'fullName': fullName,
        },
      );
}

/// {@category Endpoint}
class EndpointDeeplink extends _i1.EndpointRef {
  EndpointDeeplink(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'deeplink';

  _i2.Future<String?> getContactType({required int contactId}) =>
      caller.callServerEndpoint<String?>(
        'deeplink',
        'getContactType',
        {'contactId': contactId},
      );

  _i2.Future<int?> getArtworkCustomerId({required int artworkId}) =>
      caller.callServerEndpoint<int?>(
        'deeplink',
        'getArtworkCustomerId',
        {'artworkId': artworkId},
      );

  _i2.Future<int?> getSalesOrderCustomerId({required int salesOrderId}) =>
      caller.callServerEndpoint<int?>(
        'deeplink',
        'getSalesOrderCustomerId',
        {'salesOrderId': salesOrderId},
      );

  _i2.Future<(int?, int?)> getSoiCustomerIdAndSalesOrderId({
    required int soiTypePrimaryKey,
    required _i9.SalesOrderItemType soiType,
  }) =>
      caller.callServerEndpoint<(int?, int?)>(
        'deeplink',
        'getSoiCustomerIdAndSalesOrderId',
        {
          'soiTypePrimaryKey': soiTypePrimaryKey,
          'soiType': soiType,
        },
      );
}

/// {@category Endpoint}
class EndpointEntityAssignments extends _i1.EndpointRef {
  EndpointEntityAssignments(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'entityAssignments';

  _i2.Future<List<_i4.EntityAssignmentDTO>> fetchEntityAssignments() =>
      caller.callServerEndpoint<List<_i4.EntityAssignmentDTO>>(
        'entityAssignments',
        'fetchEntityAssignments',
        {},
      );
}

/// Data Lock Endpoint
///
/// Manages the locked state of other objects
/// {@category Endpoint}
class EndpointEntityLock extends _i1.EndpointRef {
  EndpointEntityLock(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'entityLock';

  /// Release Entity Lock
  _i2.Future<void> releaseEntityLock(
    String entityType,
    int id,
  ) =>
      caller.callServerEndpoint<void>(
        'entityLock',
        'releaseEntityLock',
        {
          'entityType': entityType,
          'id': id,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocksByTableType(
          {required _i10.TableType tableType}) =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'entityLock',
        'findEntityLocksByTableType',
        {'tableType': tableType},
      );

  /// Find All Entity Locks
  ///
  /// Returns all entity locks from the database
  _i2.Future<List<_i4.EntityLockDTO>> findAllEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'entityLock',
        'findAllEntityLocks',
        {},
      );
}

/// Entity Log Endpoint
///
/// Entity logs are used to track changes to entities
/// {@category Endpoint}
class EndpointEntityLog extends _i1.EndpointRef {
  EndpointEntityLog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'entityLog';

  /// Fetch Entity Logs
  ///
  /// Fetches all entity logs for a given entity and table type
  _i2.Future<List<_i11.EntityLogDTO>> fetchEntityLogs({
    required int entityId,
    required _i10.TableType tableType,
  }) =>
      caller.callServerEndpoint<List<_i11.EntityLogDTO>>(
        'entityLog',
        'fetchEntityLogs',
        {
          'entityId': entityId,
          'tableType': tableType,
        },
      );
}

/// {@category Endpoint}
class EndpointFieldSuggestion extends _i1.EndpointRef {
  EndpointFieldSuggestion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'fieldSuggestion';

  _i2.Future<List<String>> find({
    required String tableType,
    required String fieldKey,
    required String searchTerm,
  }) =>
      caller.callServerEndpoint<List<String>>(
        'fieldSuggestion',
        'find',
        {
          'tableType': tableType,
          'fieldKey': fieldKey,
          'searchTerm': searchTerm,
        },
      );
}

/// Endpoint for managing application-wide global settings
/// {@category Endpoint}
class EndpointGlobalSettings extends _i1.EndpointRef {
  EndpointGlobalSettings(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'globalSettings';

  /// Stream to watch for global settings changes
  _i2.Stream<_i12.GlobalSettingsDTO> watchEntity({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i12.GlobalSettingsDTO>,
          _i12.GlobalSettingsDTO>(
        'globalSettings',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
          'releaseOnClose': releaseOnClose,
        },
        {},
      );

  _i2.Stream<_i12.GlobalSettingsDTO> watch() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i12.GlobalSettingsDTO>,
          _i12.GlobalSettingsDTO>(
        'globalSettings',
        'watch',
        {},
        {},
      );

  /// Fetches the first global settings directly from the database
  _i2.Future<_i12.GlobalSettingsDTO?> fetchSettings() =>
      caller.callServerEndpoint<_i12.GlobalSettingsDTO?>(
        'globalSettings',
        'fetchSettings',
        {},
      );

  /// Fetch by id
  _i2.Future<_i12.GlobalSettingsDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i12.GlobalSettingsDTO?>(
        'globalSettings',
        'fetchById',
        {'id': id},
      );

  /// Fetch and lock global settings for editing
  _i2.Future<_i12.GlobalSettingsDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i12.GlobalSettingsDTO?>(
        'globalSettings',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// Release lock on global settings
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'globalSettings',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Updates the global settings and notifies all clients
  _i2.Future<_i12.GlobalSettingsDTO> update({
    required _i12.GlobalSettingsDTO settings,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i12.GlobalSettingsDTO>(
        'globalSettings',
        'update',
        {
          'settings': settings,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Find all entity locks for global settings
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'globalSettings',
        'findEntityLocks',
        {},
      );
}

/// Endpoint for [ServiceUserDTO]
/// {@category Endpoint}
class EndpointServiceUser extends _i1.EndpointRef {
  EndpointServiceUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'serviceUser';

  _i2.Stream<_i13.ServiceUserDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i13.ServiceUserDTO>,
          _i13.ServiceUserDTO>(
        'serviceUser',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// Fetch an ServiceUser by its id
  _i2.Future<_i13.ServiceUserDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i13.ServiceUserDTO?>(
        'serviceUser',
        'fetchById',
        {'id': id},
      );

  /// Find all ServiceUsers
  _i2.Future<List<_i13.ServiceUserDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i13.ServiceUserDTO>>(
        'serviceUser',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i13.ServiceUserDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i13.ServiceUserDTO?>(
        'serviceUser',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'serviceUser',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Create a new User with the, optional, given sessionId so it can be
  /// edited by the user on the client
  _i2.Future<_i13.ServiceUserDTO> create({required String sessionId}) =>
      caller.callServerEndpoint<_i13.ServiceUserDTO>(
        'serviceUser',
        'create',
        {'sessionId': sessionId},
      );

  _i2.Future<_i13.ServiceUserDTO> update({
    required _i13.ServiceUserDTO serviceUser,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i13.ServiceUserDTO>(
        'serviceUser',
        'update',
        {
          'serviceUser': serviceUser,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<bool> delete({
    required int userId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'serviceUser',
        'delete',
        {
          'userId': userId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'serviceUser',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointServiceUserToken extends _i1.EndpointRef {
  EndpointServiceUserToken(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'serviceUserToken';

  /// Find all ServiceUserTokens for a specific service user
  _i2.Future<List<_i14.ServiceUserTokenDTO>> find(
          {required int serviceUserId}) =>
      caller.callServerEndpoint<List<_i14.ServiceUserTokenDTO>>(
        'serviceUserToken',
        'find',
        {'serviceUserId': serviceUserId},
      );

  /// Create a new ServiceUserToken for a specific service user
  _i2.Future<_i14.ServiceUserTokenDTO> create({
    required int serviceUserId,
    required String tokenDescription,
  }) =>
      caller.callServerEndpoint<_i14.ServiceUserTokenDTO>(
        'serviceUserToken',
        'create',
        {
          'serviceUserId': serviceUserId,
          'tokenDescription': tokenDescription,
        },
      );

  /// Delete a ServiceUserToken
  _i2.Future<bool> delete({required int serviceUserTokenId}) =>
      caller.callServerEndpoint<bool>(
        'serviceUserToken',
        'delete',
        {'serviceUserTokenId': serviceUserTokenId},
      );
}

/// {@category Endpoint}
class EndpointAppClient extends _i1.EndpointRef {
  EndpointAppClient(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'appClient';

  _i2.Stream<_i15.AppClientDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i15.AppClientDTO>,
          _i15.AppClientDTO>(
        'appClient',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i15.AppClientDTO> watchAll() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i15.AppClientDTO>,
          _i15.AppClientDTO>(
        'appClient',
        'watchAll',
        {},
        {},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'appClient',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i15.AppClientDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i15.AppClientDTO?>(
        'appClient',
        'fetchById',
        {'id': id},
      );

  _i2.Future<_i15.AppClientDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i15.AppClientDTO?>(
        'appClient',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i15.AppClientDTO> create({required String sessionId}) =>
      caller.callServerEndpoint<_i15.AppClientDTO>(
        'appClient',
        'create',
        {'sessionId': sessionId},
      );

  _i2.Future<_i15.AppClientDTO> update({
    required _i15.AppClientDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i15.AppClientDTO>(
        'appClient',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i15.AppClientDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i15.AppClientDTO>>(
        'appClient',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i15.AppClientDTO>> fetchAll(_i4.Sort? sort) =>
      caller.callServerEndpoint<List<_i15.AppClientDTO>>(
        'appClient',
        'fetchAll',
        {'sort': sort},
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'appClient',
        'findEntityLocks',
        {},
      );
}

/// Endpoint for [CompanyDepartmentDTO]
///
/// This exposes the endpoints for CompanyDepartment
///
/// Used by the corresponding repository in the clients frontend
///
/// {@category Endpoint}
class EndpointCompanyDepartment extends _i1.EndpointRef {
  EndpointCompanyDepartment(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'companyDepartment';

  /// * General CRUD *
  /// Creates a new CompanyDepartment
  _i2.Future<_i16.CompanyDepartmentDTO> create({required int companyId}) =>
      caller.callServerEndpoint<_i16.CompanyDepartmentDTO>(
        'companyDepartment',
        'create',
        {'companyId': companyId},
      );

  /// Updates a CompanyDepartment
  _i2.Future<_i16.CompanyDepartmentDTO> update({
    required _i16.CompanyDepartmentDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i16.CompanyDepartmentDTO>(
        'companyDepartment',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Deletes a CompanyDepartment
  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'companyDepartment',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// * Fetching *
  /// Fetches a single CompanyDepartment by id
  _i2.Future<_i16.CompanyDepartmentDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i16.CompanyDepartmentDTO?>(
        'companyDepartment',
        'fetchById',
        {'id': id},
      );

  /// Finds all CompanyDepartment entities
  ///
  /// Filtered and sorted by the given parameters
  /// These are usually defined through table settings in the client
  _i2.Future<List<_i16.CompanyDepartmentDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i16.CompanyDepartmentDTO>>(
        'companyDepartment',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetches and locks a single CompanyDepartment by id
  _i2.Future<_i16.CompanyDepartmentDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i16.CompanyDepartmentDTO?>(
        'companyDepartment',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// * Streams *
  /// Watches updates for a single CompanyDepartment
  /// Watch changes to a specific company_department
  _i2.Stream<_i16.CompanyDepartmentDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i16.CompanyDepartmentDTO>,
          _i16.CompanyDepartmentDTO>(
        'companyDepartment',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// * Other *
  /// Releases a CompanyDepartment
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'companyDepartment',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Finds all locked entities for CompanyDepartment
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'companyDepartment',
        'findEntityLocks',
        {},
      );

  /// Fetches departments by company
  _i2.Future<List<_i16.CompanyDepartmentDTO>> fetchDepartmentsByCompany({
    required int companyId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i16.CompanyDepartmentDTO>>(
        'companyDepartment',
        'fetchDepartmentsByCompany',
        {
          'companyId': companyId,
          'sort': sort,
          'filter': filter,
        },
      );

  /// Watches departments by company updates
  _i2.Stream<_i16.CompanyDepartmentDTO> watchDepartmentsByCompany(
          {required int companyId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i16.CompanyDepartmentDTO>,
          _i16.CompanyDepartmentDTO>(
        'companyDepartment',
        'watchDepartmentsByCompany',
        {'companyId': companyId},
        {},
      );

  /// Fetches departments by employee
  _i2.Future<List<_i16.CompanyDepartmentDTO>> fetchDepartmentsByEmployee(
          {required int employeeId}) =>
      caller.callServerEndpoint<List<_i16.CompanyDepartmentDTO>>(
        'companyDepartment',
        'fetchDepartmentsByEmployee',
        {'employeeId': employeeId},
      );

  /// Watches departments by employee updates
  _i2.Stream<_i16.CompanyDepartmentDTO> watchDepartmentsByEmployee(
          {required int employeeId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i16.CompanyDepartmentDTO>,
          _i16.CompanyDepartmentDTO>(
        'companyDepartment',
        'watchDepartmentsByEmployee',
        {'employeeId': employeeId},
        {},
      );
}

/// Company Employee Endpoint
///
/// This endpoint is used to manage company employees.
///
/// See [CompanyEmployeeDTO] for more information on how this is used
///
/// {@category Endpoint}
class EndpointCompanyEmployee extends _i1.EndpointRef {
  EndpointCompanyEmployee(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'companyEmployee';

  /// Watch an entity
  ///
  /// This is used to watch an entity for changes, which will be streamed to
  /// the client
  ///
  _i2.Stream<_i17.CompanyEmployeeDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i17.CompanyEmployeeDTO>,
          _i17.CompanyEmployeeDTO>(
        'companyEmployee',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// Watch employees by company
  ///
  /// This is used to watch employees for a specific company
  ///
  _i2.Stream<_i17.CompanyEmployeeDTO> watchEmployessByCompany(
          {required int companyId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i17.CompanyEmployeeDTO>,
          _i17.CompanyEmployeeDTO>(
        'companyEmployee',
        'watchEmployessByCompany',
        {'companyId': companyId},
        {},
      );

  /// Watch employee updates for a company with filter matching
  /// Streams a record: (removedId, employee)
  /// - If employee matches filter: (null, employee) - add/update in frontend
  /// - If employee doesn't match or deleted: (id, null) - remove from frontend
  _i2.Stream<(int?, _i17.CompanyEmployeeDTO?)> watchEmployeeByCompanyUpdates({
    required int companyId,
    _i4.Filter? filter,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<(int?, _i17.CompanyEmployeeDTO?)>,
          (int?, _i17.CompanyEmployeeDTO?)>(
        'companyEmployee',
        'watchEmployeeByCompanyUpdates',
        {
          'companyId': companyId,
          'filter': filter,
        },
        {},
      );

  /// Watch companies by employee
  ///
  /// This is used to watch companies for a specific employee
  ///
  _i2.Stream<_i17.CompanyEmployeeDTO> watchCompaniesByEmployee(
          {required int employeeId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i17.CompanyEmployeeDTO>,
          _i17.CompanyEmployeeDTO>(
        'companyEmployee',
        'watchCompaniesByEmployee',
        {'employeeId': employeeId},
        {},
      );

  /// Watch employees by company and department
  ///
  /// This is used to watch employees for a specific company and department
  ///
  _i2.Stream<_i17.CompanyEmployeeDTO> watchEmployeesByCompanyAndDepartment({
    required int companyId,
    required int departmentId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i17.CompanyEmployeeDTO>,
          _i17.CompanyEmployeeDTO>(
        'companyEmployee',
        'watchEmployeesByCompanyAndDepartment',
        {
          'companyId': companyId,
          'departmentId': departmentId,
        },
        {},
      );

  /// Watch employees by department deletion
  ///
  /// It returns the id of the employee that was removed from the department
  ///
  _i2.Stream<int> watchEmployeesByDepartmentDeletion(
          {required int departmentId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'companyEmployee',
        'watchEmployeesByDepartmentDeletion',
        {'departmentId': departmentId},
        {},
      );

  /// Watch employee removals from any department
  ///
  /// It returns the id of the department that the employee was removed from
  ///
  _i2.Stream<int> watchEmployeeRemovalsFromAnyDepartment(
          {required int employeeId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'companyEmployee',
        'watchEmployeeRemovalsFromAnyDepartment',
        {'employeeId': employeeId},
        {},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'companyEmployee',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Tries to create a new Company Employee entity and checks if the employee
  /// is already assigned to the company
  ///
  _i2.Future<_i17.CompanyEmployeeDTO> create({
    required int companyId,
    required int employeeId,
  }) =>
      caller.callServerEndpoint<_i17.CompanyEmployeeDTO>(
        'companyEmployee',
        'create',
        {
          'companyId': companyId,
          'employeeId': employeeId,
        },
      );

  /// Update a Company Employee
  ///
  /// See [GenericCrud] for more information on how this is done
  ///
  ///
  ///
  _i2.Future<_i17.CompanyEmployeeDTO> update({
    required _i17.CompanyEmployeeDTO companyEmployee,
    required bool release,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<_i17.CompanyEmployeeDTO>(
        'companyEmployee',
        'update',
        {
          'companyEmployee': companyEmployee,
          'release': release,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i17.CompanyEmployeeDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i17.CompanyEmployeeDTO?>(
        'companyEmployee',
        'fetchById',
        {'id': id},
      );

  /// Fetch and lock a Company Employee
  ///
  /// See [GenericCrud] for more information on how this is done
  ///
  _i2.Future<_i17.CompanyEmployeeDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i17.CompanyEmployeeDTO?>(
        'companyEmployee',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// Fetch list of employees for a specific company
  ///
  _i2.Future<List<_i17.CompanyEmployeeDTO>> fetchEmployeesByCompany({
    required int companyId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i17.CompanyEmployeeDTO>>(
        'companyEmployee',
        'fetchEmployeesByCompany',
        {
          'companyId': companyId,
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetch list of companies for a specific employee
  ///
  _i2.Future<List<_i17.CompanyEmployeeDTO>> fetchCompaniesByEmployee({
    required int employeeId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i17.CompanyEmployeeDTO>>(
        'companyEmployee',
        'fetchCompaniesByEmployee',
        {
          'employeeId': employeeId,
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetch list of employees for a specific company and department
  ///
  _i2.Future<List<_i17.CompanyEmployeeDTO>>
      fetchEmployeesByCompanyAndDepartment({
    required int companyId,
    required int departmentId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
          caller.callServerEndpoint<List<_i17.CompanyEmployeeDTO>>(
            'companyEmployee',
            'fetchEmployeesByCompanyAndDepartment',
            {
              'companyId': companyId,
              'departmentId': departmentId,
              'sort': sort,
              'filter': filter,
            },
          );

  /// Add an employee to a department
  ///
  /// Creates a junction table entry linking the employee to the department
  ///
  _i2.Future<_i18.CompanyEmployeeDepartmentJT> addEmployeeToDepartment({
    required int companyEmployeeId,
    required int departmentId,
  }) =>
      caller.callServerEndpoint<_i18.CompanyEmployeeDepartmentJT>(
        'companyEmployee',
        'addEmployeeToDepartment',
        {
          'companyEmployeeId': companyEmployeeId,
          'departmentId': departmentId,
        },
      );

  /// Remove an employee from a department
  ///
  /// Deletes the junction table entry linking the employee to the department
  ///
  _i2.Future<bool> removeEmployeeFromDepartment({
    required int companyEmployeeId,
    required int departmentId,
  }) =>
      caller.callServerEndpoint<bool>(
        'companyEmployee',
        'removeEmployeeFromDepartment',
        {
          'companyEmployeeId': companyEmployeeId,
          'departmentId': departmentId,
        },
      );

  /// Delete a Company Employee
  ///
  /// See [GenericCrud] for more information on how this is done
  ///
  /// This only soft deletes the entity, it does not actually delete the entity
  /// from the database. A soft deleted entity will not be fetched by default
  ///
  _i2.Future<bool> delete({
    required int companyEmployeeId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'companyEmployee',
        'delete',
        {
          'companyEmployeeId': companyEmployeeId,
          'sessionId': sessionId,
        },
      );

  /// Find all entity locks for the Company Employee entity
  ///
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'companyEmployee',
        'findEntityLocks',
        {},
      );
}

/// Endpoint for [ContactDTO]
/// {@category Endpoint}
class EndpointContact extends _i1.EndpointRef {
  EndpointContact(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'contact';

  _i2.Stream<_i5.ContactDTO> watcEntityCard({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i5.ContactDTO>,
          _i5.ContactDTO>(
        'contact',
        'watcEntityCard',
        {
          'sessionId': sessionId,
          'entityId': entityId,
          'releaseOnClose': releaseOnClose,
        },
        {},
      );

  _i2.Stream<_i5.ContactDTO> watchUpdates({required int entityId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i5.ContactDTO>,
          _i5.ContactDTO>(
        'contact',
        'watchUpdates',
        {'entityId': entityId},
        {},
      );

  _i2.Future<_i5.ContactDTO> create({
    required String sessionId,
    required _i19.ContactType type,
  }) =>
      caller.callServerEndpoint<_i5.ContactDTO>(
        'contact',
        'create',
        {
          'sessionId': sessionId,
          'type': type,
        },
      );

  _i2.Future<_i5.ContactDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i5.ContactDTO?>(
        'contact',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i20.SpotlightItem>> findSpotlight({required String query}) =>
      caller.callServerEndpoint<List<_i20.SpotlightItem>>(
        'contact',
        'findSpotlight',
        {'query': query},
      );

  /// Fetch all unique string values for a given contact property
  ///
  /// This method retrieves contacts and extracts the values of the specified
  /// [field]
  /// It performs an optimized database query to only fetch non-deleted contacts
  /// where the specified field is non-null and, for string types, non-empty
  /// Returns a list of unique, non-empty string values for that property
  ///
  /// For fields where such an optimized query cannot be built (e.g., complex
  /// types or unhandled fields), an empty list is returned
  _i2.Future<List<String>> findContactPropertyValues(
    _i21.ContactField field,
    String searchTerm,
  ) =>
      caller.callServerEndpoint<List<String>>(
        'contact',
        'findContactPropertyValues',
        {
          'field': field,
          'searchTerm': searchTerm,
        },
      );

  _i2.Future<List<_i5.ContactDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i5.ContactDTO>>(
        'contact',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i5.ContactDTO>> findCompanies({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i5.ContactDTO>>(
        'contact',
        'findCompanies',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i5.ContactDTO>> findPersons({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i5.ContactDTO>>(
        'contact',
        'findPersons',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// The update happens inside of the unsafeQuery method
  _i2.Future<_i5.ContactDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i5.ContactDTO?>(
        'contact',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i5.ContactDTO> update({
    required _i5.ContactDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i5.ContactDTO>(
        'contact',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'contact',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'contact',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'contact',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointCountryCode extends _i1.EndpointRef {
  EndpointCountryCode(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'countryCode';

  _i2.Stream<_i22.CountryCodeDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i22.CountryCodeDTO>,
          _i22.CountryCodeDTO>(
        'countryCode',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i22.CountryCodeDTO> watchAll() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i22.CountryCodeDTO>,
          _i22.CountryCodeDTO>(
        'countryCode',
        'watchAll',
        {},
        {},
      );

  _i2.Future<_i22.CountryCodeDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i22.CountryCodeDTO?>(
        'countryCode',
        'fetchById',
        {'id': id},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'countryCode',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i22.CountryCodeDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i22.CountryCodeDTO?>(
        'countryCode',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i22.CountryCodeDTO> create({
    required _i22.CountryCodeDTO countryCode,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i22.CountryCodeDTO>(
        'countryCode',
        'create',
        {
          'countryCode': countryCode,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i22.CountryCodeDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i22.CountryCodeDTO>>(
        'countryCode',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i22.CountryCodeDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
    int? id,
  }) =>
      caller.callServerEndpoint<List<_i22.CountryCodeDTO>>(
        'countryCode',
        'find',
        {
          'sort': sort,
          'filter': filter,
          'id': id,
        },
      );

  _i2.Future<_i22.CountryCodeDTO> update({
    required _i22.CountryCodeDTO countryCode,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i22.CountryCodeDTO>(
        'countryCode',
        'update',
        {
          'countryCode': countryCode,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'countryCode',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointCrmEvent extends _i1.EndpointRef {
  EndpointCrmEvent(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'crmEvent';

  _i2.Stream<_i23.CrmEventDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i23.CrmEventDTO>,
          _i23.CrmEventDTO>(
        'crmEvent',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<int> watchContactDeletions({required int eventId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'crmEvent',
        'watchContactDeletions',
        {'eventId': eventId},
        {},
      );

  /// Watches all contacts that are assigned to the event and filters
  /// them according to the provided table filter
  _i2.Stream<_i5.ContactDTO?> watchEventContactsWithFilter({
    required int entityId,
    required _i4.Filter? filter,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i5.ContactDTO?>,
          _i5.ContactDTO?>(
        'crmEvent',
        'watchEventContactsWithFilter',
        {
          'entityId': entityId,
          'filter': filter,
        },
        {},
      );

  /// Validates the contact filter and returns the contact if it is found
  _i2.Future<_i5.ContactDTO?> validateEventContactFilter({
    required int contactId,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<_i5.ContactDTO?>(
        'crmEvent',
        'validateEventContactFilter',
        {
          'contactId': contactId,
          'filter': filter,
        },
      );

  /// Fetches all contacts that are assigned to the event
  /// and filters them according to the provided table filter
  _i2.Future<List<_i5.ContactDTO>> fetchContactsInEvent({
    required int eventId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i5.ContactDTO>>(
        'crmEvent',
        'fetchContactsInEvent',
        {
          'eventId': eventId,
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetches all contacts that are not yet assigned to the event
  /// and filters them according to the provided table filter
  _i2.Future<List<_i5.ContactDTO>> fetchContactsNotInEvent({
    required int eventId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i5.ContactDTO>>(
        'crmEvent',
        'fetchContactsNotInEvent',
        {
          'eventId': eventId,
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Stream<_i23.CrmEventDTO> watchAll() => caller.callStreamingServerEndpoint<
          _i2.Stream<_i23.CrmEventDTO>, _i23.CrmEventDTO>(
        'crmEvent',
        'watchAll',
        {},
        {},
      );

  _i2.Future<_i23.CrmEventDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i23.CrmEventDTO?>(
        'crmEvent',
        'fetchById',
        {'id': id},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'crmEvent',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i23.CrmEventDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i23.CrmEventDTO?>(
        'crmEvent',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i23.CrmEventDTO> create({
    required _i23.CrmEventDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i23.CrmEventDTO>(
        'crmEvent',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Adds contacts to a CRM event through the junction table
  _i2.Future<void> addContactsToEvent({
    required int eventId,
    required List<int> contactIds,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'crmEvent',
        'addContactsToEvent',
        {
          'eventId': eventId,
          'contactIds': contactIds,
          'sessionId': sessionId,
        },
      );

  /// Deletes a contact from a CRM event through the junction table
  /// Updates the JT entry with a deletedAt timestamp
  /// and adds the updated JT entry to the stream
  _i2.Future<void> deleteContactFromEvent({
    required int eventId,
    required int contactId,
  }) =>
      caller.callServerEndpoint<void>(
        'crmEvent',
        'deleteContactFromEvent',
        {
          'eventId': eventId,
          'contactId': contactId,
        },
      );

  _i2.Future<List<_i23.CrmEventDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i23.CrmEventDTO>>(
        'crmEvent',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i23.CrmEventDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i23.CrmEventDTO>>(
        'crmEvent',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i23.CrmEventDTO> update({
    required _i23.CrmEventDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i23.CrmEventDTO>(
        'crmEvent',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'crmEvent',
        'findEntityLocks',
        {},
      );

  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'crmEvent',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );
}

/// {@category Endpoint}
class EndpointCustomer extends _i1.EndpointRef {
  EndpointCustomer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'customer';

  _i2.Stream<_i6.CustomerDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i6.CustomerDTO>,
          _i6.CustomerDTO>(
        'customer',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Future<_i6.CustomerDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i6.CustomerDTO?>(
        'customer',
        'fetchById',
        {'id': id},
      );

  /// Returns the first customer based on the provided filter and sort
  _i2.Future<List<_i6.CustomerDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i6.CustomerDTO>>(
        'customer',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'customer',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i20.SpotlightItem>> findSpotlight({required String query}) =>
      caller.callServerEndpoint<List<_i20.SpotlightItem>>(
        'customer',
        'findSpotlight',
        {'query': query},
      );

  /// Find a List of Customers based on the filter and sort
  _i2.Future<_i6.CustomerDTO> create(_i5.ContactDTO contact) =>
      caller.callServerEndpoint<_i6.CustomerDTO>(
        'customer',
        'create',
        {'contact': contact},
      );

  /// Delete Customer based on the provided customerId and sessionId
  _i2.Future<bool> delete({
    required int customerId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'customer',
        'delete',
        {
          'customerId': customerId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i6.CustomerDTO?> fetchAndLock({
    required int id,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<_i6.CustomerDTO?>(
        'customer',
        'fetchAndLock',
        {
          'id': id,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i6.CustomerDTO?> update({
    required _i6.CustomerDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i6.CustomerDTO?>(
        'customer',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> addShippingAddress({
    required int customerId,
    required int contactId,
  }) =>
      caller.callServerEndpoint<void>(
        'customer',
        'addShippingAddress',
        {
          'customerId': customerId,
          'contactId': contactId,
        },
      );

  _i2.Future<void> deleteShippingAddress(
          {required _i24.CustomerShippingContactDTO customerShippingContact}) =>
      caller.callServerEndpoint<void>(
        'customer',
        'deleteShippingAddress',
        {'customerShippingContact': customerShippingContact},
      );

  ///
  /// Customer Billing Addresses
  ///
  _i2.Future<List<_i25.CustomerBillingCustomerDTO>> fetchBillingAddresses({
    required int customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i25.CustomerBillingCustomerDTO>>(
        'customer',
        'fetchBillingAddresses',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<void> addBillingAddress({
    required int customerId,
    required int customerCustomerId,
    required bool isPrimary,
  }) =>
      caller.callServerEndpoint<void>(
        'customer',
        'addBillingAddress',
        {
          'customerId': customerId,
          'customerCustomerId': customerCustomerId,
          'isPrimary': isPrimary,
        },
      );

  _i2.Future<void> deleteBillingAddress(
          {required _i25.CustomerBillingCustomerDTO customerBillingCustomer}) =>
      caller.callServerEndpoint<void>(
        'customer',
        'deleteBillingAddress',
        {'customerBillingCustomer': customerBillingCustomer},
      );

  ///
  /// Customer Customers
  ///
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'customer',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointShippingMethod extends _i1.EndpointRef {
  EndpointShippingMethod(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'shippingMethod';

  _i2.Stream<_i26.ShippingMethodDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i26.ShippingMethodDTO>,
          _i26.ShippingMethodDTO>(
        'shippingMethod',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i26.ShippingMethodDTO> watchAll() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i26.ShippingMethodDTO>,
          _i26.ShippingMethodDTO>(
        'shippingMethod',
        'watchAll',
        {},
        {},
      );

  _i2.Future<_i26.ShippingMethodDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i26.ShippingMethodDTO?>(
        'shippingMethod',
        'fetchById',
        {'id': id},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'shippingMethod',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i26.ShippingMethodDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i26.ShippingMethodDTO?>(
        'shippingMethod',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i26.ShippingMethodDTO> create({
    required _i26.ShippingMethodDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i26.ShippingMethodDTO>(
        'shippingMethod',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i26.ShippingMethodDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i26.ShippingMethodDTO>>(
        'shippingMethod',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i26.ShippingMethodDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
    int? id,
  }) =>
      caller.callServerEndpoint<List<_i26.ShippingMethodDTO>>(
        'shippingMethod',
        'find',
        {
          'sort': sort,
          'filter': filter,
          'id': id,
        },
      );

  _i2.Future<_i26.ShippingMethodDTO> update({
    required _i26.ShippingMethodDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i26.ShippingMethodDTO>(
        'shippingMethod',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'shippingMethod',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointCustomerBillingCustomer extends _i1.EndpointRef {
  EndpointCustomerBillingCustomer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'customerBillingCustomer';

  _i2.Stream<_i25.CustomerBillingCustomerDTO> watchByCustomer(
          {required int customerId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i25.CustomerBillingCustomerDTO>,
          _i25.CustomerBillingCustomerDTO>(
        'customerBillingCustomer',
        'watchByCustomer',
        {'customerId': customerId},
        {},
      );

  _i2.Stream<int> watchDeletionsByCustomer() =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'customerBillingCustomer',
        'watchDeletionsByCustomer',
        {},
        {},
      );

  _i2.Future<void> markAsPrimary(
          {required _i25.CustomerBillingCustomerDTO customerBillingCustomer}) =>
      caller.callServerEndpoint<void>(
        'customerBillingCustomer',
        'markAsPrimary',
        {'customerBillingCustomer': customerBillingCustomer},
      );

  _i2.Future<void> removeAsPrimary({required int customerId}) =>
      caller.callServerEndpoint<void>(
        'customerBillingCustomer',
        'removeAsPrimary',
        {'customerId': customerId},
      );

  _i2.Future<List<_i25.CustomerBillingCustomerDTO>> fetchBillingCustomers({
    required int customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i25.CustomerBillingCustomerDTO>>(
        'customerBillingCustomer',
        'fetchBillingCustomers',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i25.CustomerBillingCustomerDTO?> fetch(
          int customerBillingCustomerId) =>
      caller.callServerEndpoint<_i25.CustomerBillingCustomerDTO?>(
        'customerBillingCustomer',
        'fetch',
        {'customerBillingCustomerId': customerBillingCustomerId},
      );

  _i2.Future<void> deleteBillingAddress(
          {required int customerBillingCustomerId}) =>
      caller.callServerEndpoint<void>(
        'customerBillingCustomer',
        'deleteBillingAddress',
        {'customerBillingCustomerId': customerBillingCustomerId},
      );

  _i2.Future<bool> isBillingAddressAssigned({
    required int customerId,
    required int billingCustomerId,
  }) =>
      caller.callServerEndpoint<bool>(
        'customerBillingCustomer',
        'isBillingAddressAssigned',
        {
          'customerId': customerId,
          'billingCustomerId': billingCustomerId,
        },
      );
}

/// {@category Endpoint}
class EndpointCustomerCustomer extends _i1.EndpointRef {
  EndpointCustomerCustomer(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'customerCustomer';

  _i2.Future<_i27.CustomerCustomerDTO> create({
    required _i6.CustomerDTO customer,
    required _i5.ContactDTO customerCustomerContact,
    required bool isPrimary,
  }) =>
      caller.callServerEndpoint<_i27.CustomerCustomerDTO>(
        'customerCustomer',
        'create',
        {
          'customer': customer,
          'customerCustomerContact': customerCustomerContact,
          'isPrimary': isPrimary,
        },
      );

  _i2.Stream<_i27.CustomerCustomerDTO> watchForCustomerList(
          {required int customerId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i27.CustomerCustomerDTO>,
          _i27.CustomerCustomerDTO>(
        'customerCustomer',
        'watchForCustomerList',
        {'customerId': customerId},
        {},
      );

  _i2.Future<List<_i27.CustomerCustomerDTO>> fetchCustomerCustomers({
    required int customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i27.CustomerCustomerDTO>>(
        'customerCustomer',
        'fetchCustomerCustomers',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i27.CustomerCustomerDTO?> findById(
          {required int customerCustomerId}) =>
      caller.callServerEndpoint<_i27.CustomerCustomerDTO?>(
        'customerCustomer',
        'findById',
        {'customerCustomerId': customerCustomerId},
      );

  _i2.Future<void> deleteCustomerCustomer({required int customerCustomerId}) =>
      caller.callServerEndpoint<void>(
        'customerCustomer',
        'deleteCustomerCustomer',
        {'customerCustomerId': customerCustomerId},
      );

  _i2.Future<void> addCustomerCustomer({
    required int customerId,
    required int customerCustomerContactId,
  }) =>
      caller.callServerEndpoint<void>(
        'customerCustomer',
        'addCustomerCustomer',
        {
          'customerId': customerId,
          'customerCustomerContactId': customerCustomerContactId,
        },
      );
}

/// {@category Endpoint}
class EndpointCustomerShippingContacts extends _i1.EndpointRef {
  EndpointCustomerShippingContacts(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'customerShippingContacts';

  _i2.Stream<_i24.CustomerShippingContactDTO> watchByCustomer(
          {required int customerId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i24.CustomerShippingContactDTO>,
          _i24.CustomerShippingContactDTO>(
        'customerShippingContacts',
        'watchByCustomer',
        {'customerId': customerId},
        {},
      );

  _i2.Stream<int> watchDeletionsByCustomer() =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'customerShippingContacts',
        'watchDeletionsByCustomer',
        {},
        {},
      );

  _i2.Future<_i24.CustomerShippingContactDTO?> fetch(
          int customerShippingContactId) =>
      caller.callServerEndpoint<_i24.CustomerShippingContactDTO?>(
        'customerShippingContacts',
        'fetch',
        {'customerShippingContactId': customerShippingContactId},
      );

  _i2.Future<List<_i24.CustomerShippingContactDTO>> fetchShippingContacts({
    required int customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i24.CustomerShippingContactDTO>>(
        'customerShippingContacts',
        'fetchShippingContacts',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<void> markAsPrimary(
          {required _i24.CustomerShippingContactDTO customerShippingContact}) =>
      caller.callServerEndpoint<void>(
        'customerShippingContacts',
        'markAsPrimary',
        {'customerShippingContact': customerShippingContact},
      );

  _i2.Future<void> removeAsPrimary({required int customerId}) =>
      caller.callServerEndpoint<void>(
        'customerShippingContacts',
        'removeAsPrimary',
        {'customerId': customerId},
      );

  _i2.Future<void> deleteShippingAddress(
          {required int customerShippingContactId}) =>
      caller.callServerEndpoint<void>(
        'customerShippingContacts',
        'deleteShippingAddress',
        {'customerShippingContactId': customerShippingContactId},
      );
}

/// {@category Endpoint}
class EndpointDepartmentCode extends _i1.EndpointRef {
  EndpointDepartmentCode(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'departmentCode';

  _i2.Stream<_i28.DepartmentCodeDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i28.DepartmentCodeDTO>,
          _i28.DepartmentCodeDTO>(
        'departmentCode',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Future<_i28.DepartmentCodeDTO> create({
    required _i28.DepartmentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i28.DepartmentCodeDTO>(
        'departmentCode',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'departmentCode',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i28.DepartmentCodeDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i28.DepartmentCodeDTO?>(
        'departmentCode',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i28.DepartmentCodeDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i28.DepartmentCodeDTO>>(
        'departmentCode',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i28.DepartmentCodeDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i28.DepartmentCodeDTO>>(
        'departmentCode',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i28.DepartmentCodeDTO> update({
    required _i28.DepartmentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i28.DepartmentCodeDTO>(
        'departmentCode',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<_i28.DepartmentCodeDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i28.DepartmentCodeDTO?>(
        'departmentCode',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'departmentCode',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointLanguageCode extends _i1.EndpointRef {
  EndpointLanguageCode(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'languageCode';

  _i2.Stream<_i29.LanguageCodeDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i29.LanguageCodeDTO>,
          _i29.LanguageCodeDTO>(
        'languageCode',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i29.LanguageCodeDTO> watchAll() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i29.LanguageCodeDTO>,
          _i29.LanguageCodeDTO>(
        'languageCode',
        'watchAll',
        {},
        {},
      );

  _i2.Future<_i29.LanguageCodeDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i29.LanguageCodeDTO?>(
        'languageCode',
        'fetchById',
        {'id': id},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'languageCode',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i29.LanguageCodeDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i29.LanguageCodeDTO?>(
        'languageCode',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i29.LanguageCodeDTO> create({
    required _i29.LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i29.LanguageCodeDTO>(
        'languageCode',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i29.LanguageCodeDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i29.LanguageCodeDTO>>(
        'languageCode',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i29.LanguageCodeDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i29.LanguageCodeDTO>>(
        'languageCode',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i29.LanguageCodeDTO> update({
    required _i29.LanguageCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i29.LanguageCodeDTO>(
        'languageCode',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'languageCode',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointPaymentCode extends _i1.EndpointRef {
  EndpointPaymentCode(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'paymentCode';

  _i2.Stream<_i30.PaymentCodeDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i30.PaymentCodeDTO>,
          _i30.PaymentCodeDTO>(
        'paymentCode',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i30.PaymentCodeDTO> watchAll() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i30.PaymentCodeDTO>,
          _i30.PaymentCodeDTO>(
        'paymentCode',
        'watchAll',
        {},
        {},
      );

  _i2.Future<_i30.PaymentCodeDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i30.PaymentCodeDTO?>(
        'paymentCode',
        'fetchById',
        {'id': id},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'paymentCode',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i30.PaymentCodeDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i30.PaymentCodeDTO?>(
        'paymentCode',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i30.PaymentCodeDTO> create({
    required _i30.PaymentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i30.PaymentCodeDTO>(
        'paymentCode',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i30.PaymentCodeDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i30.PaymentCodeDTO>>(
        'paymentCode',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i30.PaymentCodeDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
    int? id,
  }) =>
      caller.callServerEndpoint<List<_i30.PaymentCodeDTO>>(
        'paymentCode',
        'find',
        {
          'sort': sort,
          'filter': filter,
          'id': id,
        },
      );

  _i2.Future<_i30.PaymentCodeDTO> update({
    required _i30.PaymentCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i30.PaymentCodeDTO>(
        'paymentCode',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'paymentCode',
        'findEntityLocks',
        {},
      );
}

/// Endpoint for [SalutationCodeDTO]
/// {@category Endpoint}
class EndpointSalutationCode extends _i1.EndpointRef {
  EndpointSalutationCode(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'salutationCode';

  _i2.Stream<_i31.SalutationCodeDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i31.SalutationCodeDTO>,
          _i31.SalutationCodeDTO>(
        'salutationCode',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i31.SalutationCodeDTO> watchAll() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i31.SalutationCodeDTO>,
          _i31.SalutationCodeDTO>(
        'salutationCode',
        'watchAll',
        {},
        {},
      );

  _i2.Future<_i31.SalutationCodeDTO> create({
    required _i31.SalutationCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i31.SalutationCodeDTO>(
        'salutationCode',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'salutationCode',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i31.SalutationCodeDTO?> fetchById(int entityId) =>
      caller.callServerEndpoint<_i31.SalutationCodeDTO?>(
        'salutationCode',
        'fetchById',
        {'entityId': entityId},
      );

  _i2.Future<List<_i31.SalutationCodeDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i31.SalutationCodeDTO>>(
        'salutationCode',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i31.SalutationCodeDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i31.SalutationCodeDTO>>(
        'salutationCode',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i31.SalutationCodeDTO> update({
    required _i31.SalutationCodeDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i31.SalutationCodeDTO>(
        'salutationCode',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<_i31.SalutationCodeDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i31.SalutationCodeDTO?>(
        'salutationCode',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'salutationCode',
        'findEntityLocks',
        {},
      );
}

/// Artwork Endpoint
///
/// A endpoint for the Artwork entity
/// {@category Endpoint}
class EndpointArtwork extends _i1.EndpointRef {
  EndpointArtwork(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artwork';

  /// Watch a signle Artwork Entity
  _i2.Stream<_i32.ArtworkDTO> watchEntity({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i32.ArtworkDTO>,
          _i32.ArtworkDTO>(
        'artwork',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
          'releaseOnClose': releaseOnClose,
        },
        {},
      );

  /// Watch an Artwork by Sales Order ID
  _i2.Stream<_i32.ArtworkDTO> watchForSalesOrder({required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i32.ArtworkDTO>,
          _i32.ArtworkDTO>(
        'artwork',
        'watchForSalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  /// Watch Deletions For Sales Order
  ///
  /// A stream controller to watch the deletions for a sales order
  _i2.Stream<int> watchDeletionsForSalesOrder({required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'artwork',
        'watchDeletionsForSalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  ///
  /// * Fetch & Find
  ///
  /// Fetch a single Artwork By ID
  _i2.Future<_i32.ArtworkDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i32.ArtworkDTO?>(
        'artwork',
        'fetchById',
        {'id': id},
      );

  _i2.Future<int> fetchCustomerId(int id) => caller.callServerEndpoint<int>(
        'artwork',
        'fetchCustomerId',
        {'id': id},
      );

  /// Fetch Artwork in read only mode
  _i2.Future<_i32.ArtworkDTO?> fetchReadOnly(int id) =>
      caller.callServerEndpoint<_i32.ArtworkDTO?>(
        'artwork',
        'fetchReadOnly',
        {'id': id},
      );

  /// Fetch List of Artworks By Sales Order ID
  _i2.Future<List<_i32.ArtworkDTO>> fetchBySalesOrderId(int salesOrderId) =>
      caller.callServerEndpoint<List<_i32.ArtworkDTO>>(
        'artwork',
        'fetchBySalesOrderId',
        {'salesOrderId': salesOrderId},
      );

  /// Fetch History of Artwork by Master ID
  _i2.Future<List<_i32.ArtworkDTO>> fetchHistory(int artworkMasterId) =>
      caller.callServerEndpoint<List<_i32.ArtworkDTO>>(
        'artwork',
        'fetchHistory',
        {'artworkMasterId': artworkMasterId},
      );

  /// Fetch and Lock Artwork
  ///
  /// The update happens inside of the unsafeQuery method
  _i2.Future<_i32.ArtworkDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i32.ArtworkDTO?>(
        'artwork',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// Update Artwork
  _i2.Future<_i32.ArtworkDTO> update({
    required _i32.ArtworkDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i32.ArtworkDTO>(
        'artwork',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Release Artwork for editing
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artwork',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<String>> fetchArtworkLayerNames() =>
      caller.callServerEndpoint<List<String>>(
        'artwork',
        'fetchArtworkLayerNames',
        {},
      );

  /// Find Artwork
  /// Fetch All Artworks from a specific Customer
  _i2.Future<List<_i32.ArtworkDTO>> fetchAllArtworksFromCustomer(
          int customerId) =>
      caller.callServerEndpoint<List<_i32.ArtworkDTO>>(
        'artwork',
        'fetchAllArtworksFromCustomer',
        {'customerId': customerId},
      );

  /// Find Entity Locks
  /// -> Returns a list of locked entities for the Artwork table
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artwork',
        'findEntityLocks',
        {},
      );
}

/// Artwork Log Endpoint
///
/// A endpoint for the Artwork Log entity
/// {@category Endpoint}
class EndpointArtworkLog extends _i1.EndpointRef {
  EndpointArtworkLog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artworkLog';

  /// Fetch Artwork Logs
  _i2.Future<List<_i33.ArtworkLogDTO>> fetchArtworkLogs({
    required int entityId,
    required _i10.TableType tableType,
  }) =>
      caller.callServerEndpoint<List<_i33.ArtworkLogDTO>>(
        'artworkLog',
        'fetchArtworkLogs',
        {
          'entityId': entityId,
          'tableType': tableType,
        },
      );
}

/// Artwork Master Endpoint
/// {@category Endpoint}
class EndpointArtworkMaster extends _i1.EndpointRef {
  EndpointArtworkMaster(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artworkMaster';

  /// Fetch a single Artwork Master By ID
  _i2.Future<_i34.ArtworkMasterDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i34.ArtworkMasterDTO?>(
        'artworkMaster',
        'fetchById',
        {'id': id},
      );

  /// Fetch a single Artwork Master by id
  _i2.Future<_i34.ArtworkMasterDTO?> fetchForCreation(int id) =>
      caller.callServerEndpoint<_i34.ArtworkMasterDTO?>(
        'artworkMaster',
        'fetchForCreation',
        {'id': id},
      );

  _i2.Future<List<_i34.ArtworkMasterDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i34.ArtworkMasterDTO>>(
        'artworkMaster',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i34.ArtworkMasterDTO>> findByCustomer({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i34.ArtworkMasterDTO>>(
        'artworkMaster',
        'findByCustomer',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i34.ArtworkMasterDTO>> fetchAllArtworksFromCustomer(
          int customerId) =>
      caller.callServerEndpoint<List<_i34.ArtworkMasterDTO>>(
        'artworkMaster',
        'fetchAllArtworksFromCustomer',
        {'customerId': customerId},
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artworkMaster',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointArtworkQuarantine extends _i1.EndpointRef {
  EndpointArtworkQuarantine(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artworkQuarantine';

  /// Watch a single Artwork Quarantine Entity
  _i2.Stream<_i35.ArtworkQuarantineDTO> watchEntity({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i35.ArtworkQuarantineDTO>,
          _i35.ArtworkQuarantineDTO>(
        'artworkQuarantine',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
          'releaseOnClose': releaseOnClose,
        },
        {},
      );

  _i2.Future<List<_i35.ArtworkQuarantineDTO>> fetchByGroupId(int groupId) =>
      caller.callServerEndpoint<List<_i35.ArtworkQuarantineDTO>>(
        'artworkQuarantine',
        'fetchByGroupId',
        {'groupId': groupId},
      );

  _i2.Future<List<_i35.ArtworkQuarantineDTO>> fetchByGroupIdAndStatus(
    int groupId,
    _i36.ArtworkQuarantineGroupStatus status,
  ) =>
      caller.callServerEndpoint<List<_i35.ArtworkQuarantineDTO>>(
        'artworkQuarantine',
        'fetchByGroupIdAndStatus',
        {
          'groupId': groupId,
          'status': status,
        },
      );

  _i2.Stream<_i35.ArtworkQuarantineDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i35.ArtworkQuarantineDTO>,
          _i35.ArtworkQuarantineDTO>(
        'artworkQuarantine',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<int> watchDeleted() =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'artworkQuarantine',
        'watchDeleted',
        {},
        {},
      );

  _i2.Stream<_i35.ArtworkQuarantineDTO> watchCustomerQuarantines(
          {required int customerId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i35.ArtworkQuarantineDTO>,
          _i35.ArtworkQuarantineDTO>(
        'artworkQuarantine',
        'watchCustomerQuarantines',
        {'customerId': customerId},
        {},
      );

  _i2.Stream<_i35.ArtworkQuarantineDTO> watchAllQuarantines() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i35.ArtworkQuarantineDTO>,
          _i35.ArtworkQuarantineDTO>(
        'artworkQuarantine',
        'watchAllQuarantines',
        {},
        {},
      );

  /// Fetch a single Artwork Quarantine By ID
  _i2.Future<_i35.ArtworkQuarantineDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i35.ArtworkQuarantineDTO?>(
        'artworkQuarantine',
        'fetchById',
        {'id': id},
      );

  /// Fetch and Lock Artwork Quarantine
  ///
  /// The update happens inside of the unsafeQuery method
  _i2.Future<_i35.ArtworkQuarantineDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i35.ArtworkQuarantineDTO?>(
        'artworkQuarantine',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// Update Artwork Quarantine
  _i2.Future<_i35.ArtworkQuarantineDTO> update({
    required _i35.ArtworkQuarantineDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i35.ArtworkQuarantineDTO>(
        'artworkQuarantine',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Release Artwork Quarantine for editing
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkQuarantine',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i35.ArtworkQuarantineDTO> createFromDateneingang({
    required int customerId,
    required _i35.ArtworkQuarantineDTO artworkQuarantine,
  }) =>
      caller.callServerEndpoint<_i35.ArtworkQuarantineDTO>(
        'artworkQuarantine',
        'createFromDateneingang',
        {
          'customerId': customerId,
          'artworkQuarantine': artworkQuarantine,
        },
      );

  _i2.Future<List<_i35.ArtworkQuarantineDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i35.ArtworkQuarantineDTO>>(
        'artworkQuarantine',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i35.ArtworkQuarantineDTO>> fetchByCustomerId(
          int customerId) =>
      caller.callServerEndpoint<List<_i35.ArtworkQuarantineDTO>>(
        'artworkQuarantine',
        'fetchByCustomerId',
        {'customerId': customerId},
      );

  _i2.Future<void> deleteFromArtworkCreation(int artworkQuarantineId) =>
      caller.callServerEndpoint<void>(
        'artworkQuarantine',
        'deleteFromArtworkCreation',
        {'artworkQuarantineId': artworkQuarantineId},
      );

  _i2.Future<void> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkQuarantine',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Find Entity Locks
  /// -> Returns a list of locked entities for the Artwork Quarantine table
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artworkQuarantine',
        'findEntityLocks',
        {},
      );

  /// Updates artwork quarantine with XML analysis from a file path
  ///
  /// This method is used to mock the AE Webhook call with a local file
  /// from the client
  _i2.Future<void> mockAEwebhookWithQuarantineXml(String xmlContent) =>
      caller.callServerEndpoint<void>(
        'artworkQuarantine',
        'mockAEwebhookWithQuarantineXml',
        {'xmlContent': xmlContent},
      );
}

/// {@category Endpoint}
class EndpointArtworkQuarantineGroup extends _i1.EndpointRef {
  EndpointArtworkQuarantineGroup(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artworkQuarantineGroup';

  /// Watch changes to a specific quarantine group
  _i2.Stream<_i37.ArtworkQuarantineGroupDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i37.ArtworkQuarantineGroupDTO>,
          _i37.ArtworkQuarantineGroupDTO>(
        'artworkQuarantineGroup',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// Watch all quarantine groups
  _i2.Stream<_i37.ArtworkQuarantineGroupDTO> watchAllGroups() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i37.ArtworkQuarantineGroupDTO>,
          _i37.ArtworkQuarantineGroupDTO>(
        'artworkQuarantineGroup',
        'watchAllGroups',
        {},
        {},
      );

  /// Watch quarantine groups for a specific customer
  _i2.Stream<_i37.ArtworkQuarantineGroupDTO> watchCustomerGroups(
          {required int customerId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i37.ArtworkQuarantineGroupDTO>,
          _i37.ArtworkQuarantineGroupDTO>(
        'artworkQuarantineGroup',
        'watchCustomerGroups',
        {'customerId': customerId},
        {},
      );

  /// Watch quarantine groups by status
  _i2.Stream<_i37.ArtworkQuarantineGroupDTO> watchGroupsByStatus(
          {required _i36.ArtworkQuarantineGroupStatus status}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i37.ArtworkQuarantineGroupDTO>,
          _i37.ArtworkQuarantineGroupDTO>(
        'artworkQuarantineGroup',
        'watchGroupsByStatus',
        {'status': status},
        {},
      );

  /// Create a new quarantine group
  _i2.Future<_i37.ArtworkQuarantineGroupDTO> create({
    required String sessionId,
    required int? customerId,
  }) =>
      caller.callServerEndpoint<_i37.ArtworkQuarantineGroupDTO>(
        'artworkQuarantineGroup',
        'create',
        {
          'sessionId': sessionId,
          'customerId': customerId,
        },
      );

  /// Fetch a group by ID
  _i2.Future<_i37.ArtworkQuarantineGroupDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i37.ArtworkQuarantineGroupDTO?>(
        'artworkQuarantineGroup',
        'fetchById',
        {'id': id},
      );

  /// Fetch and lock a single quarantine group by ID
  ///
  /// [id] The ID of the quarantine group to fetch and lock
  /// [editingSessionId] The ID of the editing session of the window
  _i2.Future<_i37.ArtworkQuarantineGroupDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i37.ArtworkQuarantineGroupDTO?>(
        'artworkQuarantineGroup',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// Update an existing quarantine group
  ///
  /// [group] The group with the updated values
  /// [sessionId] The session ID of the current user window
  /// [release] Whether to release the group after updating
  _i2.Future<_i37.ArtworkQuarantineGroupDTO> update({
    required _i37.ArtworkQuarantineGroupDTO group,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i37.ArtworkQuarantineGroupDTO>(
        'artworkQuarantineGroup',
        'update',
        {
          'group': group,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Release editing lock on a group
  ///
  /// [entityId] The ID of the group to release
  /// [sessionId] The session ID of the current user window
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkQuarantineGroup',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Delete a quarantine group
  ///
  /// [entityId] The ID of the group to delete
  /// [sessionId] The session ID of the current user window
  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'artworkQuarantineGroup',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Fetch groups by customer ID
  _i2.Future<List<_i37.ArtworkQuarantineGroupDTO>> fetchByCustomerId(
          int customerId) =>
      caller.callServerEndpoint<List<_i37.ArtworkQuarantineGroupDTO>>(
        'artworkQuarantineGroup',
        'fetchByCustomerId',
        {'customerId': customerId},
      );

  /// Fetch groups by status
  _i2.Future<List<_i37.ArtworkQuarantineGroupDTO>> fetchByStatus(
          _i36.ArtworkQuarantineGroupStatus status) =>
      caller.callServerEndpoint<List<_i37.ArtworkQuarantineGroupDTO>>(
        'artworkQuarantineGroup',
        'fetchByStatus',
        {'status': status},
      );

  /// Fetch groups by customer ID and status
  _i2.Future<List<_i37.ArtworkQuarantineGroupDTO>>
      fetchGroupsByCustomerIdAndStatus({
    required int customerId,
    required _i36.ArtworkQuarantineGroupStatus status,
  }) =>
          caller.callServerEndpoint<List<_i37.ArtworkQuarantineGroupDTO>>(
            'artworkQuarantineGroup',
            'fetchGroupsByCustomerIdAndStatus',
            {
              'customerId': customerId,
              'status': status,
            },
          );

  /// Fetch artwork quarantines by customer ID and group status
  _i2.Future<List<_i35.ArtworkQuarantineDTO>>
      fetchQuarantinesByCustomerIdAndStatus({
    required int customerId,
    required _i36.ArtworkQuarantineGroupStatus status,
  }) =>
          caller.callServerEndpoint<List<_i35.ArtworkQuarantineDTO>>(
            'artworkQuarantineGroup',
            'fetchQuarantinesByCustomerIdAndStatus',
            {
              'customerId': customerId,
              'status': status,
            },
          );

  /// Find groups with optional sorting and filtering
  _i2.Future<List<_i37.ArtworkQuarantineGroupDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i37.ArtworkQuarantineGroupDTO>>(
        'artworkQuarantineGroup',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// Mark a group as deleted
  _i2.Future<void> setDeleted(_i37.ArtworkQuarantineGroupDTO entity) =>
      caller.callServerEndpoint<void>(
        'artworkQuarantineGroup',
        'setDeleted',
        {'entity': entity},
      );

  /// Find all entity locks for quarantine groups
  /// Means all groups that are currently being edited by another user or
  /// were left in that state through app errors or crashes
  ///
  /// [session] The session to find the entity locks for
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artworkQuarantineGroup',
        'findEntityLocks',
        {},
      );
}

/// Artwork Template Endpoint
///
/// Used to manage artwork templates
///
/// See [ArtworkTemplateDTO] for more information
///
/// {@category Endpoint}
class EndpointArtworkTemplate extends _i1.EndpointRef {
  EndpointArtworkTemplate(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artworkTemplate';

  _i2.Stream<_i38.ArtworkTemplateDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i38.ArtworkTemplateDTO>,
          _i38.ArtworkTemplateDTO>(
        'artworkTemplate',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i38.ArtworkTemplateDTO> watchCustomerUpdates(
    _i2.Stream<_i38.ArtworkTemplateDTO> stream, {
    required int customerId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i38.ArtworkTemplateDTO>,
          _i38.ArtworkTemplateDTO>(
        'artworkTemplate',
        'watchCustomerUpdates',
        {'customerId': customerId},
        {'stream': stream},
      );

  _i2.Future<_i38.ArtworkTemplateDTO> create({
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<_i38.ArtworkTemplateDTO>(
        'artworkTemplate',
        'create',
        {
          'customerId': customerId,
          'preSelectionId': preSelectionId,
          'selectionId': selectionId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i38.ArtworkTemplateDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i38.ArtworkTemplateDTO?>(
        'artworkTemplate',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i38.ArtworkTemplateDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i38.ArtworkTemplateDTO>>(
        'artworkTemplate',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i38.ArtworkTemplateDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i38.ArtworkTemplateDTO>>(
        'artworkTemplate',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i38.ArtworkTemplateDTO>> findByCustomer({
    int? customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
    required bool includeGeneralTemplates,
  }) =>
      caller.callServerEndpoint<List<_i38.ArtworkTemplateDTO>>(
        'artworkTemplate',
        'findByCustomer',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
          'includeGeneralTemplates': includeGeneralTemplates,
        },
      );

  _i2.Future<_i38.ArtworkTemplateDTO> update({
    required _i38.ArtworkTemplateDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i38.ArtworkTemplateDTO>(
        'artworkTemplate',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkTemplate',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i38.ArtworkTemplateDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i38.ArtworkTemplateDTO?>(
        'artworkTemplate',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artworkTemplate',
        'findEntityLocks',
        {},
      );
}

/// Artwork Template Pre Selection Endpoint
///
/// Used to manage the artwork template pre selection category
///
/// See [ArtworkTemplatePreSelectionDTO] for more information
///
/// {@category Endpoint}
class EndpointArtworkTemplatePreSelection extends _i1.EndpointRef {
  EndpointArtworkTemplatePreSelection(_i1.EndpointCaller caller)
      : super(caller);

  @override
  String get name => 'artworkTemplatePreSelection';

  _i2.Stream<_i39.ArtworkTemplatePreSelectionDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i39.ArtworkTemplatePreSelectionDTO>,
          _i39.ArtworkTemplatePreSelectionDTO>(
        'artworkTemplatePreSelection',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i39.ArtworkTemplatePreSelectionDTO> watchPreSelection(
          {required int? customerId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i39.ArtworkTemplatePreSelectionDTO>,
          _i39.ArtworkTemplatePreSelectionDTO>(
        'artworkTemplatePreSelection',
        'watchPreSelection',
        {'customerId': customerId},
        {},
      );

  _i2.Future<_i39.ArtworkTemplatePreSelectionDTO> create({
    required _i39.ArtworkTemplatePreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i39.ArtworkTemplatePreSelectionDTO>(
        'artworkTemplatePreSelection',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<_i39.ArtworkTemplatePreSelectionDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i39.ArtworkTemplatePreSelectionDTO?>(
        'artworkTemplatePreSelection',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i39.ArtworkTemplatePreSelectionDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i39.ArtworkTemplatePreSelectionDTO>>(
        'artworkTemplatePreSelection',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i39.ArtworkTemplatePreSelectionDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i39.ArtworkTemplatePreSelectionDTO>>(
        'artworkTemplatePreSelection',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i39.ArtworkTemplatePreSelectionDTO> update({
    required _i39.ArtworkTemplatePreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i39.ArtworkTemplatePreSelectionDTO>(
        'artworkTemplatePreSelection',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkTemplatePreSelection',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i39.ArtworkTemplatePreSelectionDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i39.ArtworkTemplatePreSelectionDTO?>(
        'artworkTemplatePreSelection',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<List<_i39.ArtworkTemplatePreSelectionDTO>> fetchByCustomerId(
          int customerId) =>
      caller.callServerEndpoint<List<_i39.ArtworkTemplatePreSelectionDTO>>(
        'artworkTemplatePreSelection',
        'fetchByCustomerId',
        {'customerId': customerId},
      );

  _i2.Future<List<_i39.ArtworkTemplatePreSelectionDTO>> fetchGlobal() =>
      caller.callServerEndpoint<List<_i39.ArtworkTemplatePreSelectionDTO>>(
        'artworkTemplatePreSelection',
        'fetchGlobal',
        {},
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artworkTemplatePreSelection',
        'findEntityLocks',
        {},
      );
}

/// Artwork Template Selection Endpoint
///
/// Used to manage the artwork template selection category
///
/// See [ArtworkTemplateSelectionDTO] for more information
///
/// {@category Endpoint}
class EndpointArtworkTemplateSelection extends _i1.EndpointRef {
  EndpointArtworkTemplateSelection(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artworkTemplateSelection';

  _i2.Stream<_i40.ArtworkTemplateSelectionDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i40.ArtworkTemplateSelectionDTO>,
          _i40.ArtworkTemplateSelectionDTO>(
        'artworkTemplateSelection',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i40.ArtworkTemplateSelectionDTO> watchSelection(
          {required int preSelectionId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i40.ArtworkTemplateSelectionDTO>,
          _i40.ArtworkTemplateSelectionDTO>(
        'artworkTemplateSelection',
        'watchSelection',
        {'preSelectionId': preSelectionId},
        {},
      );

  _i2.Future<_i40.ArtworkTemplateSelectionDTO> create({
    required _i40.ArtworkTemplateSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i40.ArtworkTemplateSelectionDTO>(
        'artworkTemplateSelection',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<_i40.ArtworkTemplateSelectionDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i40.ArtworkTemplateSelectionDTO?>(
        'artworkTemplateSelection',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i40.ArtworkTemplateSelectionDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i40.ArtworkTemplateSelectionDTO>>(
        'artworkTemplateSelection',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i40.ArtworkTemplateSelectionDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i40.ArtworkTemplateSelectionDTO>>(
        'artworkTemplateSelection',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i40.ArtworkTemplateSelectionDTO> update({
    required _i40.ArtworkTemplateSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i40.ArtworkTemplateSelectionDTO>(
        'artworkTemplateSelection',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkTemplateSelection',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i40.ArtworkTemplateSelectionDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i40.ArtworkTemplateSelectionDTO?>(
        'artworkTemplateSelection',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<List<_i40.ArtworkTemplateSelectionDTO>> fetchFromPreSelection(
          int preSelectionId) =>
      caller.callServerEndpoint<List<_i40.ArtworkTemplateSelectionDTO>>(
        'artworkTemplateSelection',
        'fetchFromPreSelection',
        {'preSelectionId': preSelectionId},
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artworkTemplateSelection',
        'findEntityLocks',
        {},
      );
}

/// Artwork Color Endpoint
///
/// Used to manage the ArtworkColor Table of the database
/// {@category Endpoint}
class EndpointArtworkColor extends _i1.EndpointRef {
  EndpointArtworkColor(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artworkColor';

  _i2.Stream<_i41.ArtworkColorDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i41.ArtworkColorDTO>,
          _i41.ArtworkColorDTO>(
        'artworkColor',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Future<_i41.ArtworkColorDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i41.ArtworkColorDTO?>(
        'artworkColor',
        'fetchById',
        {'id': id},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkColor',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i41.ArtworkColorDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i41.ArtworkColorDTO?>(
        'artworkColor',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i41.ArtworkColorDTO> create({
    required String sessionId,
    required int colorPaletteId,
  }) =>
      caller.callServerEndpoint<_i41.ArtworkColorDTO>(
        'artworkColor',
        'create',
        {
          'sessionId': sessionId,
          'colorPaletteId': colorPaletteId,
        },
      );

  _i2.Future<_i41.ArtworkColorDTO> createFromCsv(
          {required _i41.ArtworkColorDTO artworkColor}) =>
      caller.callServerEndpoint<_i41.ArtworkColorDTO>(
        'artworkColor',
        'createFromCsv',
        {'artworkColor': artworkColor},
      );

  _i2.Future<void> importColors({
    required List<_i41.ArtworkColorDTO> artworkColors,
    required String paletteName,
    int? customerId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkColor',
        'importColors',
        {
          'artworkColors': artworkColors,
          'paletteName': paletteName,
          'customerId': customerId,
        },
      );

  _i2.Future<void> addColorsToPalette({
    required List<_i41.ArtworkColorDTO> artworkColors,
    required int paletteId,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkColor',
        'addColorsToPalette',
        {
          'artworkColors': artworkColors,
          'paletteId': paletteId,
        },
      );

  _i2.Future<List<_i41.ArtworkColorDTO>> findByShortName({
    required int customerId,
    required String shortName,
  }) =>
      caller.callServerEndpoint<List<_i41.ArtworkColorDTO>>(
        'artworkColor',
        'findByShortName',
        {
          'customerId': customerId,
          'shortName': shortName,
        },
      );

  /// Updates the short name of an ArtworkColor by its entity ID.
  ///
  /// This method ignores session IDs and other context-specific information,
  /// focusing solely on updating the short name of the ArtworkColor with the
  /// specified entity ID.
  ///
  /// [entityId] The entity ID of the ArtworkColor to update.
  /// [shortName] The new short name to assign to the ArtworkColor.
  _i2.Future<void> updateShortName({
    int? entityId,
    String? shortName,
  }) =>
      caller.callServerEndpoint<void>(
        'artworkColor',
        'updateShortName',
        {
          'entityId': entityId,
          'shortName': shortName,
        },
      );

  _i2.Future<List<_i41.ArtworkColorDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i41.ArtworkColorDTO>>(
        'artworkColor',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i41.ArtworkColorDTO>> findAllByCustomerId({
    required int customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i41.ArtworkColorDTO>>(
        'artworkColor',
        'findAllByCustomerId',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i41.ArtworkColorDTO>> fetchColorPaletteColors(
          {required int colorPaletteId}) =>
      caller.callServerEndpoint<List<_i41.ArtworkColorDTO>>(
        'artworkColor',
        'fetchColorPaletteColors',
        {'colorPaletteId': colorPaletteId},
      );

  _i2.Future<_i41.ArtworkColorDTO> update({
    required _i41.ArtworkColorDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i41.ArtworkColorDTO>(
        'artworkColor',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'artworkColor',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'artworkColor',
        'findEntityLocks',
        {},
      );
}

/// ColorBook Endpoint
///
/// Used to manage the ColorBook Table of the database
/// {@category Endpoint}
class EndpointPrepressColorPalette extends _i1.EndpointRef {
  EndpointPrepressColorPalette(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'prepressColorPalette';

  _i2.Stream<_i42.PrepressColorPaletteDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i42.PrepressColorPaletteDTO>,
          _i42.PrepressColorPaletteDTO>(
        'prepressColorPalette',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Future<_i42.PrepressColorPaletteDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i42.PrepressColorPaletteDTO?>(
        'prepressColorPalette',
        'fetchById',
        {'id': id},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'prepressColorPalette',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i42.PrepressColorPaletteDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i42.PrepressColorPaletteDTO?>(
        'prepressColorPalette',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i42.PrepressColorPaletteDTO> create({
    required String sessionId,
    required int? customerId,
  }) =>
      caller.callServerEndpoint<_i42.PrepressColorPaletteDTO>(
        'prepressColorPalette',
        'create',
        {
          'sessionId': sessionId,
          'customerId': customerId,
        },
      );

  _i2.Future<List<_i42.PrepressColorPaletteDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i42.PrepressColorPaletteDTO>>(
        'prepressColorPalette',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i42.PrepressColorPaletteDTO>>
      fetchGlobalAndCustomerColorBooks({required int customerId}) =>
          caller.callServerEndpoint<List<_i42.PrepressColorPaletteDTO>>(
            'prepressColorPalette',
            'fetchGlobalAndCustomerColorBooks',
            {'customerId': customerId},
          );

  _i2.Future<_i42.PrepressColorPaletteDTO> update({
    required _i42.PrepressColorPaletteDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i42.PrepressColorPaletteDTO>(
        'prepressColorPalette',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<bool> colorBookExists({required String paletteName}) =>
      caller.callServerEndpoint<bool>(
        'prepressColorPalette',
        'colorBookExists',
        {'paletteName': paletteName},
      );

  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'prepressColorPalette',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'prepressColorPalette',
        'findEntityLocks',
        {},
      );
}

/// Endpoint for [DrucklayoutDTO]
///
/// This exposes the endpoints for Drucklayout
///
/// Used by the corresponding repository in the clients frontend
///
/// {@category Endpoint}
class EndpointDrucklayout extends _i1.EndpointRef {
  EndpointDrucklayout(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'drucklayout';

  /// * General CRUD *
  /// Creates a new Drucklayout
  _i2.Future<_i43.DrucklayoutDTO> create({
    required String sessionId,
    required bool release,
    required int? salesOrderId,
    required int? customerId,
    required int preSelectionId,
    required int selectionId,
  }) =>
      caller.callServerEndpoint<_i43.DrucklayoutDTO>(
        'drucklayout',
        'create',
        {
          'sessionId': sessionId,
          'release': release,
          'salesOrderId': salesOrderId,
          'customerId': customerId,
          'preSelectionId': preSelectionId,
          'selectionId': selectionId,
        },
      );

  /// Updates a Drucklayout
  _i2.Future<_i43.DrucklayoutDTO> update({
    required _i43.DrucklayoutDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i43.DrucklayoutDTO>(
        'drucklayout',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Deletes a Drucklayout
  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'drucklayout',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// * Fetching *
  /// Fetches a single Drucklayout by id
  _i2.Future<_i43.DrucklayoutDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i43.DrucklayoutDTO?>(
        'drucklayout',
        'fetchById',
        {'id': id},
      );

  /// Finds all Drucklayout entities
  ///
  /// Filtered and sorted by the given parameters
  /// These are usually defined through table settings in the client
  _i2.Future<List<_i43.DrucklayoutDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i43.DrucklayoutDTO>>(
        'drucklayout',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetches and locks a single Drucklayout by id
  _i2.Future<_i43.DrucklayoutDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i43.DrucklayoutDTO?>(
        'drucklayout',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// Finds all Drucklayout entities by Sales Order
  _i2.Future<List<_i43.DrucklayoutDTO>> fetchBySalesOrder(int salesOrderId) =>
      caller.callServerEndpoint<List<_i43.DrucklayoutDTO>>(
        'drucklayout',
        'fetchBySalesOrder',
        {'salesOrderId': salesOrderId},
      );

  /// Finds all Drucklayout entities by Customer with sorting and filtering
  _i2.Future<List<_i43.DrucklayoutDTO>> findDrucklayoutsByCustomer({
    required int customerId,
    required String sessionId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i43.DrucklayoutDTO>>(
        'drucklayout',
        'findDrucklayoutsByCustomer',
        {
          'customerId': customerId,
          'sessionId': sessionId,
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetches Drucklayouts associated with a specific artwork in a sales order
  _i2.Future<List<_i43.DrucklayoutDTO>> fetchByArtworkAndSalesOrder({
    required int salesOrderId,
    required int artworkId,
  }) =>
      caller.callServerEndpoint<List<_i43.DrucklayoutDTO>>(
        'drucklayout',
        'fetchByArtworkAndSalesOrder',
        {
          'salesOrderId': salesOrderId,
          'artworkId': artworkId,
        },
      );

  /// * Streams *
  /// Watches updates for a single Drucklayout
  /// Watch changes to a specific drucklayout
  _i2.Stream<_i43.DrucklayoutDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i43.DrucklayoutDTO>,
          _i43.DrucklayoutDTO>(
        'drucklayout',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// Watches Drucklayouts by Sales Order
  _i2.Stream<_i43.DrucklayoutDTO> watchBySalesOrder(
          {required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i43.DrucklayoutDTO>,
          _i43.DrucklayoutDTO>(
        'drucklayout',
        'watchBySalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  /// Watches Drucklayouts by Customer
  _i2.Stream<_i43.DrucklayoutDTO> watchByCustomer({required int customerId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i43.DrucklayoutDTO>,
          _i43.DrucklayoutDTO>(
        'drucklayout',
        'watchByCustomer',
        {'customerId': customerId},
        {},
      );

  /// * Other *
  /// Releases a Drucklayout
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'drucklayout',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Finds all locked entities for Drucklayout
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'drucklayout',
        'findEntityLocks',
        {},
      );

  /// Assigns Nutzenlayouts to a Drucklayout in a Sales Order
  _i2.Future<void> assignNutzenlayouts({
    required String sessionId,
    required int drucklayoutId,
    required int salesOrderId,
    required Set<int> nutzenlayoutIds,
  }) =>
      caller.callServerEndpoint<void>(
        'drucklayout',
        'assignNutzenlayouts',
        {
          'sessionId': sessionId,
          'drucklayoutId': drucklayoutId,
          'salesOrderId': salesOrderId,
          'nutzenlayoutIds': nutzenlayoutIds,
        },
      );

  /// Fetches all Nutzenlayouts assigned to a Drucklayout in a Sales Order
  _i2.Future<
      ({
        List<_i44.SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
        List<_i45.SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts
      })> fetchAssignedNutzenlayouts({
    required int drucklayoutId,
    required int salesOrderId,
  }) =>
      caller.callServerEndpoint<
          ({
            List<_i44.SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
            List<_i45.SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts
          })>(
        'drucklayout',
        'fetchAssignedNutzenlayouts',
        {
          'drucklayoutId': drucklayoutId,
          'salesOrderId': salesOrderId,
        },
      );
}

/// Drucklayout Pre Selection Endpoint
///
/// Used to manage the drucklayout pre selection category
///
/// See [DrucklayoutPreSelectionDTO] for more information
///
/// {@category Endpoint}
class EndpointDrucklayoutPreSelection extends _i1.EndpointRef {
  EndpointDrucklayoutPreSelection(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'drucklayoutPreSelection';

  _i2.Stream<_i46.DrucklayoutPreSelectionDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i46.DrucklayoutPreSelectionDTO>,
          _i46.DrucklayoutPreSelectionDTO>(
        'drucklayoutPreSelection',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i46.DrucklayoutPreSelectionDTO> watchPreSelection(
          {required int? customerId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i46.DrucklayoutPreSelectionDTO>,
          _i46.DrucklayoutPreSelectionDTO>(
        'drucklayoutPreSelection',
        'watchPreSelection',
        {'customerId': customerId},
        {},
      );

  _i2.Future<_i46.DrucklayoutPreSelectionDTO> create({
    required _i46.DrucklayoutPreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i46.DrucklayoutPreSelectionDTO>(
        'drucklayoutPreSelection',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<_i46.DrucklayoutPreSelectionDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i46.DrucklayoutPreSelectionDTO?>(
        'drucklayoutPreSelection',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i46.DrucklayoutPreSelectionDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i46.DrucklayoutPreSelectionDTO>>(
        'drucklayoutPreSelection',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i46.DrucklayoutPreSelectionDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i46.DrucklayoutPreSelectionDTO>>(
        'drucklayoutPreSelection',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i46.DrucklayoutPreSelectionDTO> update({
    required _i46.DrucklayoutPreSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i46.DrucklayoutPreSelectionDTO>(
        'drucklayoutPreSelection',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'drucklayoutPreSelection',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i46.DrucklayoutPreSelectionDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i46.DrucklayoutPreSelectionDTO?>(
        'drucklayoutPreSelection',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<List<_i46.DrucklayoutPreSelectionDTO>> fetchByCustomerId(
          int customerId) =>
      caller.callServerEndpoint<List<_i46.DrucklayoutPreSelectionDTO>>(
        'drucklayoutPreSelection',
        'fetchByCustomerId',
        {'customerId': customerId},
      );

  _i2.Future<List<_i46.DrucklayoutPreSelectionDTO>> fetchGlobal() =>
      caller.callServerEndpoint<List<_i46.DrucklayoutPreSelectionDTO>>(
        'drucklayoutPreSelection',
        'fetchGlobal',
        {},
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'drucklayoutPreSelection',
        'findEntityLocks',
        {},
      );
}

/// Drucklayout Selection Endpoint
///
/// Used to manage the drucklayout selection category
///
/// See [DrucklayoutSelectionDTO] for more information
///
/// {@category Endpoint}
class EndpointDrucklayoutSelection extends _i1.EndpointRef {
  EndpointDrucklayoutSelection(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'drucklayoutSelection';

  _i2.Stream<_i47.DrucklayoutSelectionDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i47.DrucklayoutSelectionDTO>,
          _i47.DrucklayoutSelectionDTO>(
        'drucklayoutSelection',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i47.DrucklayoutSelectionDTO> watchSelection(
          {required int preSelectionId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i47.DrucklayoutSelectionDTO>,
          _i47.DrucklayoutSelectionDTO>(
        'drucklayoutSelection',
        'watchSelection',
        {'preSelectionId': preSelectionId},
        {},
      );

  _i2.Future<_i47.DrucklayoutSelectionDTO> create({
    required _i47.DrucklayoutSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i47.DrucklayoutSelectionDTO>(
        'drucklayoutSelection',
        'create',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<_i47.DrucklayoutSelectionDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i47.DrucklayoutSelectionDTO?>(
        'drucklayoutSelection',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i47.DrucklayoutSelectionDTO>> fetchAll() =>
      caller.callServerEndpoint<List<_i47.DrucklayoutSelectionDTO>>(
        'drucklayoutSelection',
        'fetchAll',
        {},
      );

  _i2.Future<List<_i47.DrucklayoutSelectionDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i47.DrucklayoutSelectionDTO>>(
        'drucklayoutSelection',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<_i47.DrucklayoutSelectionDTO> update({
    required _i47.DrucklayoutSelectionDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i47.DrucklayoutSelectionDTO>(
        'drucklayoutSelection',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'drucklayoutSelection',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i47.DrucklayoutSelectionDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i47.DrucklayoutSelectionDTO?>(
        'drucklayoutSelection',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<List<_i47.DrucklayoutSelectionDTO>> fetchFromPreSelection(
          int preSelectionId) =>
      caller.callServerEndpoint<List<_i47.DrucklayoutSelectionDTO>>(
        'drucklayoutSelection',
        'fetchFromPreSelection',
        {'preSelectionId': preSelectionId},
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'drucklayoutSelection',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointNutzenLayout extends _i1.EndpointRef {
  EndpointNutzenLayout(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'nutzenLayout';

  _i2.Stream<_i48.SalesOrderSingleNutzenlayoutLightDTO>
      watchSalesOrderSingleNutzenlayoutsLight({required int salesOrderId}) =>
          caller.callStreamingServerEndpoint<
              _i2.Stream<_i48.SalesOrderSingleNutzenlayoutLightDTO>,
              _i48.SalesOrderSingleNutzenlayoutLightDTO>(
            'nutzenLayout',
            'watchSalesOrderSingleNutzenlayoutsLight',
            {'salesOrderId': salesOrderId},
            {},
          );

  _i2.Stream<_i49.SalesOrderMultiNutzenlayoutLightDTO>
      watchSalesOrderMultiNutzenlayoutsLight({required int salesOrderId}) =>
          caller.callStreamingServerEndpoint<
              _i2.Stream<_i49.SalesOrderMultiNutzenlayoutLightDTO>,
              _i49.SalesOrderMultiNutzenlayoutLightDTO>(
            'nutzenLayout',
            'watchSalesOrderMultiNutzenlayoutsLight',
            {'salesOrderId': salesOrderId},
            {},
          );

  _i2.Future<_i50.NutzenlayoutDTO> fetchById({required int nutzenlayoutId}) =>
      caller.callServerEndpoint<_i50.NutzenlayoutDTO>(
        'nutzenLayout',
        'fetchById',
        {'nutzenlayoutId': nutzenlayoutId},
      );

  _i2.Future<List<_i45.SalesOrderSingleNutzenlayoutDTO>>
      fetchSingleBySalesOrderId({required int salesOrderId}) =>
          caller.callServerEndpoint<List<_i45.SalesOrderSingleNutzenlayoutDTO>>(
            'nutzenLayout',
            'fetchSingleBySalesOrderId',
            {'salesOrderId': salesOrderId},
          );

  _i2.Future<List<_i44.SalesOrderMultiNutzenlayoutDTO>>
      fetchMultiBySalesOrderId({required int salesOrderId}) =>
          caller.callServerEndpoint<List<_i44.SalesOrderMultiNutzenlayoutDTO>>(
            'nutzenLayout',
            'fetchMultiBySalesOrderId',
            {'salesOrderId': salesOrderId},
          );

  _i2.Future<List<_i48.SalesOrderSingleNutzenlayoutLightDTO>>
      fetchSingleWithArtworkIds({required int salesOrderId}) =>
          caller.callServerEndpoint<
              List<_i48.SalesOrderSingleNutzenlayoutLightDTO>>(
            'nutzenLayout',
            'fetchSingleWithArtworkIds',
            {'salesOrderId': salesOrderId},
          );

  _i2.Future<
      List<_i49.SalesOrderMultiNutzenlayoutLightDTO>> fetchMultiWithArtworkIds(
          {required int salesOrderId}) =>
      caller.callServerEndpoint<List<_i49.SalesOrderMultiNutzenlayoutLightDTO>>(
        'nutzenLayout',
        'fetchMultiWithArtworkIds',
        {'salesOrderId': salesOrderId},
      );

  _i2.Future<List<_i50.NutzenlayoutDTO>> fetchByCustomerWithDimensions({
    required int customerId,
    required List<_i51.NutzenlayoutArtworkDimensions> dimensions,
  }) =>
      caller.callServerEndpoint<List<_i50.NutzenlayoutDTO>>(
        'nutzenLayout',
        'fetchByCustomerWithDimensions',
        {
          'customerId': customerId,
          'dimensions': dimensions,
        },
      );

  _i2.Future<List<_i50.NutzenlayoutDTO>> fetchMultiByCustomerWithDimensions({
    required int customerId,
    required List<_i51.NutzenlayoutArtworkDimensions> dimensions,
  }) =>
      caller.callServerEndpoint<List<_i50.NutzenlayoutDTO>>(
        'nutzenLayout',
        'fetchMultiByCustomerWithDimensions',
        {
          'customerId': customerId,
          'dimensions': dimensions,
        },
      );

  _i2.Future<List<int>> getNutzelayoutsByMasterId(
          {required Set<int> masterIds}) =>
      caller.callServerEndpoint<List<int>>(
        'nutzenLayout',
        'getNutzelayoutsByMasterId',
        {'masterIds': masterIds},
      );

  _i2.Future<void> createSingleNutzenlayoutWithArtworks({
    required _i50.NutzenlayoutDTO dto,
    required Set<int> artworkIds,
    required int salesOrderId,
  }) =>
      caller.callServerEndpoint<void>(
        'nutzenLayout',
        'createSingleNutzenlayoutWithArtworks',
        {
          'dto': dto,
          'artworkIds': artworkIds,
          'salesOrderId': salesOrderId,
        },
      );

  _i2.Future<void> createMultiNutzenlayoutWithArtworks({
    required _i50.NutzenlayoutDTO dto,
    required Set<int> artworkIds,
    required int salesOrderId,
    required Set<_i51.NutzenlayoutArtworkDimensions> dimensions,
    required bool isExistingNutzenlayout,
  }) =>
      caller.callServerEndpoint<void>(
        'nutzenLayout',
        'createMultiNutzenlayoutWithArtworks',
        {
          'dto': dto,
          'artworkIds': artworkIds,
          'salesOrderId': salesOrderId,
          'dimensions': dimensions,
          'isExistingNutzenlayout': isExistingNutzenlayout,
        },
      );

  _i2.Future<void> addArtworksToNutzenlayout({
    required _i50.NutzenlayoutDTO nutzenlayoutDTO,
    required Set<int> artworkIds,
    required int salesOrderId,
  }) =>
      caller.callServerEndpoint<void>(
        'nutzenLayout',
        'addArtworksToNutzenlayout',
        {
          'nutzenlayoutDTO': nutzenlayoutDTO,
          'artworkIds': artworkIds,
          'salesOrderId': salesOrderId,
        },
      );

  _i2.Future<void> detachArtworksFromSalesOrderNutzenlayout({
    required int salesOrderId,
    required int nutzenlayoutId,
    required Set<int> artworkIds,
  }) =>
      caller.callServerEndpoint<void>(
        'nutzenLayout',
        'detachArtworksFromSalesOrderNutzenlayout',
        {
          'salesOrderId': salesOrderId,
          'nutzenlayoutId': nutzenlayoutId,
          'artworkIds': artworkIds,
        },
      );
}

/// Product Endpoint
///
/// This endpoint is used to create, read, update and delete products
///
/// Products are used to bundle ProductParts and the underlying Artworks
///
/// See [ProductDTO] for more details
///
/// {@category Endpoint}
class EndpointProduct extends _i1.EndpointRef {
  EndpointProduct(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'product';

  _i2.Stream<_i52.ProductDTO> watchEntity({
    required String sessionId,
    required int entityId,
    required bool releaseOnClose,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i52.ProductDTO>,
          _i52.ProductDTO>(
        'product',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
          'releaseOnClose': releaseOnClose,
        },
        {},
      );

  _i2.Stream<_i52.ProductDTO> watchBySalesOrder({required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i52.ProductDTO>,
          _i52.ProductDTO>(
        'product',
        'watchBySalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Future<_i52.ProductDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i52.ProductDTO?>(
        'product',
        'fetchById',
        {'id': id},
      );

  _i2.Future<_i52.ProductDTO?> fetchByIdWithoutRelations(int id) =>
      caller.callServerEndpoint<_i52.ProductDTO?>(
        'product',
        'fetchByIdWithoutRelations',
        {'id': id},
      );

  _i2.Future<_i52.ProductDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i52.ProductDTO?>(
        'product',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i52.ProductDTO?> update({
    required _i52.ProductDTO entity,
    required bool release,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<_i52.ProductDTO?>(
        'product',
        'update',
        {
          'entity': entity,
          'release': release,
          'sessionId': sessionId,
        },
      );

  /// Create a new product from an artwork quarantine and an artwork template
  ///
  /// The template is used to create the Artwork with specific print process
  /// settings and/or colors
  ///
  /// The product will bundle the artwork:
  /// Product -> ProductPart -> Artwork
  ///
  /// The Quarantine artwork will be used to create an Artwork Master
  /// This will always be the master from which new actual Artworks that are
  /// used inside of SalesOrders are created from
  ///
  _i2.Future<_i52.ProductDTO?>
      createProductFromArtworkQuarantineAndArtworkTemplate({
    required int artworkQuarantineId,
    required int? serienId,
    required int artworkTemplateId,
    required int customerId,
    required int layerId,
    required int salesOrderId,
    required int serienIndex,
    required List<_i9.SalesOrderItemType> salesOrderItemTypes,
    required _i53.ArtworkType artworkType,
    required _i54.ArtworkPrintProcessType printProcessType,
    required _i55.ProductType productType,
  }) =>
          caller.callServerEndpoint<_i52.ProductDTO?>(
            'product',
            'createProductFromArtworkQuarantineAndArtworkTemplate',
            {
              'artworkQuarantineId': artworkQuarantineId,
              'serienId': serienId,
              'artworkTemplateId': artworkTemplateId,
              'customerId': customerId,
              'layerId': layerId,
              'salesOrderId': salesOrderId,
              'serienIndex': serienIndex,
              'salesOrderItemTypes': salesOrderItemTypes,
              'artworkType': artworkType,
              'printProcessType': printProcessType,
              'productType': productType,
            },
          );

  /// Create multiple products from artwork quarantines and an artwork template
  /// in a single transaction
  ///
  /// This method creates multiple products and artworks from the provided
  /// artwork quarantines using the same artwork template and settings.
  /// All operations are performed within a single database transaction.
  ///
  _i2.Future<List<_i52.ProductDTO>>
      createBulkProductFromArtworkQuarantineAndArtworkTemplate({
    required int customerId,
    required int artworkTemplateId,
    required int salesOrderId,
    required List<_i9.SalesOrderItemType> salesOrderItemTypes,
    required _i53.ArtworkType artworkType,
    required int layerId,
    required _i54.ArtworkPrintProcessType printProcessType,
    required _i55.ProductType productType,
    required int? serienId,
    required List<({int artworkQuarantineId, int serienIndex})>
        quarantinesWithIndices,
  }) =>
          caller.callServerEndpoint<List<_i52.ProductDTO>>(
            'product',
            'createBulkProductFromArtworkQuarantineAndArtworkTemplate',
            {
              'customerId': customerId,
              'artworkTemplateId': artworkTemplateId,
              'salesOrderId': salesOrderId,
              'salesOrderItemTypes': salesOrderItemTypes,
              'artworkType': artworkType,
              'layerId': layerId,
              'printProcessType': printProcessType,
              'productType': productType,
              'serienId': serienId,
              'quarantinesWithIndices': _i56
                  .mapRecordContainingContainerToJson(quarantinesWithIndices),
            },
          );

  /// Create a new product part from an artwork quarantine and an artwork
  /// template
  ///
  /// The template is used to create the Artwork with specific print process
  /// settings and/or colors
  ///
  /// The product will bundle the artwork:
  /// Product -> ProductPart -> Artwork
  ///
  /// The Quarantine artwork will be used to create an Artwork Master
  /// This will always be the master from which new actual Artworks that are
  /// used inside of SalesOrders are created from
  ///
  _i2.Future<_i52.ProductDTO?>
      createProductPartFromArtworkQuarantineAndTemplate({
    required int artworkQuarantineId,
    required int artworkTemplateId,
    required int customerId,
    required int salesOrderId,
    required List<_i9.SalesOrderItemType> salesOrderItemTypes,
    required int productId,
    required _i53.ArtworkType artworkType,
    required _i54.ArtworkPrintProcessType printProcessType,
    required int layerId,
    required int serienIndex,
  }) =>
          caller.callServerEndpoint<_i52.ProductDTO?>(
            'product',
            'createProductPartFromArtworkQuarantineAndTemplate',
            {
              'artworkQuarantineId': artworkQuarantineId,
              'artworkTemplateId': artworkTemplateId,
              'customerId': customerId,
              'salesOrderId': salesOrderId,
              'salesOrderItemTypes': salesOrderItemTypes,
              'productId': productId,
              'artworkType': artworkType,
              'printProcessType': printProcessType,
              'layerId': layerId,
              'serienIndex': serienIndex,
            },
          );

  /// Create multiple product parts from artwork quarantines and an artwork template
  /// in a single transaction
  ///
  /// This method creates multiple product parts and artworks from the provided
  /// artwork quarantines using the same artwork template and settings.
  /// All operations are performed within a single database transaction.
  ///
  _i2.Future<List<_i52.ProductDTO>>
      createBulkProductPartFromArtworkQuarantineAndTemplate({
    required int customerId,
    required int artworkTemplateId,
    required int salesOrderId,
    required List<_i9.SalesOrderItemType> salesOrderItemTypes,
    required int productId,
    required _i53.ArtworkType artworkType,
    required int layerId,
    required _i54.ArtworkPrintProcessType printProcessType,
    required List<({int artworkQuarantineId, int serienIndex})>
        quarantinesWithIndices,
  }) =>
          caller.callServerEndpoint<List<_i52.ProductDTO>>(
            'product',
            'createBulkProductPartFromArtworkQuarantineAndTemplate',
            {
              'customerId': customerId,
              'artworkTemplateId': artworkTemplateId,
              'salesOrderId': salesOrderId,
              'salesOrderItemTypes': salesOrderItemTypes,
              'productId': productId,
              'artworkType': artworkType,
              'layerId': layerId,
              'printProcessType': printProcessType,
              'quarantinesWithIndices': _i56
                  .mapRecordContainingContainerToJson(quarantinesWithIndices),
            },
          );

  _i2.Future<void> addExistingProductToSalesOrder({
    required int productMasterId,
    required int salesOrderId,
  }) =>
      caller.callServerEndpoint<void>(
        'product',
        'addExistingProductToSalesOrder',
        {
          'productMasterId': productMasterId,
          'salesOrderId': salesOrderId,
        },
      );

  _i2.Future<_i52.ProductDTO?> fetchForSalesOrderListStream(int productId) =>
      caller.callServerEndpoint<_i52.ProductDTO?>(
        'product',
        'fetchForSalesOrderListStream',
        {'productId': productId},
      );

  _i2.Future<List<_i52.ProductDTO>> fetchBySalesOrder(int salesOrderId) =>
      caller.callServerEndpoint<List<_i52.ProductDTO>>(
        'product',
        'fetchBySalesOrder',
        {'salesOrderId': salesOrderId},
      );

  _i2.Future<_i52.ProductDTO?> fetchByIdForRelease(int entityId) =>
      caller.callServerEndpoint<_i52.ProductDTO?>(
        'product',
        'fetchByIdForRelease',
        {'entityId': entityId},
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'product',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'product',
        'findEntityLocks',
        {},
      );

  /// Fetch History of Product by Master ID
  _i2.Future<List<_i52.ProductDTO>> fetchHistory(
          {required int productMasterId}) =>
      caller.callServerEndpoint<List<_i52.ProductDTO>>(
        'product',
        'fetchHistory',
        {'productMasterId': productMasterId},
      );

  /// Create a new product manually without requiring artwork quarantines
  ///
  /// This method creates a product with user defined settings
  ///
  /// Product -> ProductPart -> Artwork
  ///
  _i2.Future<_i52.ProductDTO> createManually({
    required int salesOrderId,
    required int customerId,
    required _i55.ProductType productType,
    required int? serienId,
    required int serienIndex,
    required _i53.ArtworkType artworkType,
    required _i54.ArtworkPrintProcessType printProcessType,
    required int layerId,
    required int artworkTemplateId,
  }) =>
      caller.callServerEndpoint<_i52.ProductDTO>(
        'product',
        'createManually',
        {
          'salesOrderId': salesOrderId,
          'customerId': customerId,
          'productType': productType,
          'serienId': serienId,
          'serienIndex': serienIndex,
          'artworkType': artworkType,
          'printProcessType': printProcessType,
          'layerId': layerId,
          'artworkTemplateId': artworkTemplateId,
        },
      );
}

/// Product Log Endpoint
///
/// An endpoint for the Product Log entity
/// {@category Endpoint}
class EndpointProductLog extends _i1.EndpointRef {
  EndpointProductLog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'productLog';

  /// Fetch Product Logs
  _i2.Future<List<_i57.ProductLogDTO>> fetchProductLogs({
    required int entityId,
    required _i10.TableType tableType,
  }) =>
      caller.callServerEndpoint<List<_i57.ProductLogDTO>>(
        'productLog',
        'fetchProductLogs',
        {
          'entityId': entityId,
          'tableType': tableType,
        },
      );
}

/// {@category Endpoint}
class EndpointProductMaster extends _i1.EndpointRef {
  EndpointProductMaster(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'productMaster';

  _i2.Future<List<_i58.ProductMasterDTO>> findByCustomer({
    required int customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i58.ProductMasterDTO>>(
        'productMaster',
        'findByCustomer',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i58.ProductMasterDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i58.ProductMasterDTO>>(
        'productMaster',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetch a single Product Master By ID
  _i2.Future<_i58.ProductMasterDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i58.ProductMasterDTO?>(
        'productMaster',
        'fetchById',
        {'id': id},
      );

  _i2.Future<int> fetchNextSerienIndex(int serienId) =>
      caller.callServerEndpoint<int>(
        'productMaster',
        'fetchNextSerienIndex',
        {'serienId': serienId},
      );

  _i2.Future<bool> checkIfSerienIndexIsAvailable(
    int serienId,
    int serienIndex,
  ) =>
      caller.callServerEndpoint<bool>(
        'productMaster',
        'checkIfSerienIndexIsAvailable',
        {
          'serienId': serienId,
          'serienIndex': serienIndex,
        },
      );

  _i2.Future<_i58.ProductMasterDTO?> fetchByIdForNewSalesOrderProduct(
          int entityId) =>
      caller.callServerEndpoint<_i58.ProductMasterDTO?>(
        'productMaster',
        'fetchByIdForNewSalesOrderProduct',
        {'entityId': entityId},
      );

  _i2.Future<_i58.ProductMasterDTO?> fetchByIdForRelease(int entityId) =>
      caller.callServerEndpoint<_i58.ProductMasterDTO?>(
        'productMaster',
        'fetchByIdForRelease',
        {'entityId': entityId},
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'productMaster',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointSalesOrderItem extends _i1.EndpointRef {
  EndpointSalesOrderItem(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'salesOrderItem';

  _i2.Stream<_i59.SalesOrderItemDTO> watchForSalesOrder(
          {required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i59.SalesOrderItemDTO>,
          _i59.SalesOrderItemDTO>(
        'salesOrderItem',
        'watchForSalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Stream<_i59.SalesOrderItemDTO> watchByCustomerList(
          {required int customerId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i59.SalesOrderItemDTO>,
          _i59.SalesOrderItemDTO>(
        'salesOrderItem',
        'watchByCustomerList',
        {'customerId': customerId},
        {},
      );

  _i2.Future<List<_i59.SalesOrderItemDTO>> findBySalesOrder(
          {required int salesOrderId}) =>
      caller.callServerEndpoint<List<_i59.SalesOrderItemDTO>>(
        'salesOrderItem',
        'findBySalesOrder',
        {'salesOrderId': salesOrderId},
      );

  _i2.Future<List<_i59.SalesOrderItemDTO>> fetchByArtworkId(
          {required int artworkId}) =>
      caller.callServerEndpoint<List<_i59.SalesOrderItemDTO>>(
        'salesOrderItem',
        'fetchByArtworkId',
        {'artworkId': artworkId},
      );

  _i2.Future<_i59.SalesOrderItemDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i59.SalesOrderItemDTO?>(
        'salesOrderItem',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i59.SalesOrderItemDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i59.SalesOrderItemDTO>>(
        'salesOrderItem',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  /// Deletes a SalesOrderItem by marking it as deleted
  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'salesOrderItem',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );
}

/// {@category Endpoint}
class EndpointSoiConsulting extends _i1.EndpointRef {
  EndpointSoiConsulting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'soiConsulting';

  _i2.Stream<_i60.SoiConsultingDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i60.SoiConsultingDTO>,
          _i60.SoiConsultingDTO>(
        'soiConsulting',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i60.SoiConsultingDTO> watchBySalesOrder(
          {required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i60.SoiConsultingDTO>,
          _i60.SoiConsultingDTO>(
        'soiConsulting',
        'watchBySalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Stream<int> watchDeletionsForSalesOrder({required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'soiConsulting',
        'watchDeletionsForSalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Future<_i60.SoiConsultingDTO?> fetchForTable(int id) =>
      caller.callServerEndpoint<_i60.SoiConsultingDTO?>(
        'soiConsulting',
        'fetchForTable',
        {'id': id},
      );

  _i2.Future<_i60.SoiConsultingDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i60.SoiConsultingDTO?>(
        'soiConsulting',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i60.SoiConsultingDTO>> fetchForSalesOrder(
          int salesOrderId) =>
      caller.callServerEndpoint<List<_i60.SoiConsultingDTO>>(
        'soiConsulting',
        'fetchForSalesOrder',
        {'salesOrderId': salesOrderId},
      );

  /// The update happens inside of the unsafeQuery method
  _i2.Future<_i60.SoiConsultingDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i60.SoiConsultingDTO?>(
        'soiConsulting',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<_i60.SoiConsultingDTO> update({
    required _i60.SoiConsultingDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i60.SoiConsultingDTO>(
        'soiConsulting',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'soiConsulting',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<int> createFromSalesOrder({
    required int salesOrderId,
    required int customerId,
  }) =>
      caller.callServerEndpoint<int>(
        'soiConsulting',
        'createFromSalesOrder',
        {
          'salesOrderId': salesOrderId,
          'customerId': customerId,
        },
      );

  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'soiConsulting',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<List<_i60.SoiConsultingDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i60.SoiConsultingDTO>>(
        'soiConsulting',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'soiConsulting',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointSoiEinzelformaufbau extends _i1.EndpointRef {
  EndpointSoiEinzelformaufbau(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'soiEinzelformaufbau';

  _i2.Stream<_i61.SoiEinzelformaufbauDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i61.SoiEinzelformaufbauDTO>, _i61.SoiEinzelformaufbauDTO>(
        'soiEinzelformaufbau',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i61.SoiEinzelformaufbauDTO> watchByArtwork(
          {required int artworkId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i61.SoiEinzelformaufbauDTO>, _i61.SoiEinzelformaufbauDTO>(
        'soiEinzelformaufbau',
        'watchByArtwork',
        {'artworkId': artworkId},
        {},
      );

  _i2.Stream<_i61.SoiEinzelformaufbauDTO> watchBySalesOrder(
          {required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i61.SoiEinzelformaufbauDTO>, _i61.SoiEinzelformaufbauDTO>(
        'soiEinzelformaufbau',
        'watchBySalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Future<void> createFromSalesOrderArtwork({
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required int customerId,
  }) =>
      caller.callServerEndpoint<void>(
        'soiEinzelformaufbau',
        'createFromSalesOrderArtwork',
        {
          'salesOrderId': salesOrderId,
          'artworkId': artworkId,
          'artworkMasterId': artworkMasterId,
          'customerId': customerId,
        },
      );

  _i2.Future<_i61.SoiEinzelformaufbauDTO?> fetchForTable(int id) =>
      caller.callServerEndpoint<_i61.SoiEinzelformaufbauDTO?>(
        'soiEinzelformaufbau',
        'fetchForTable',
        {'id': id},
      );

  _i2.Future<_i61.SoiEinzelformaufbauDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i61.SoiEinzelformaufbauDTO?>(
        'soiEinzelformaufbau',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i61.SoiEinzelformaufbauDTO>> fetchForSalesOrder(
          int salesOrderId) =>
      caller.callServerEndpoint<List<_i61.SoiEinzelformaufbauDTO>>(
        'soiEinzelformaufbau',
        'fetchForSalesOrder',
        {'salesOrderId': salesOrderId},
      );

  /// The update happens inside of the unsafeQuery method
  _i2.Future<_i61.SoiEinzelformaufbauDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i61.SoiEinzelformaufbauDTO?>(
        'soiEinzelformaufbau',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'soiEinzelformaufbau',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i61.SoiEinzelformaufbauDTO> update({
    required _i61.SoiEinzelformaufbauDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i61.SoiEinzelformaufbauDTO>(
        'soiEinzelformaufbau',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i61.SoiEinzelformaufbauDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i61.SoiEinzelformaufbauDTO>>(
        'soiEinzelformaufbau',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'soiEinzelformaufbau',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointSoiPrepareArtwork extends _i1.EndpointRef {
  EndpointSoiPrepareArtwork(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'soiPrepareArtwork';

  _i2.Stream<_i62.SoiPrepareArtworkDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i62.SoiPrepareArtworkDTO>,
          _i62.SoiPrepareArtworkDTO>(
        'soiPrepareArtwork',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// we want to watch for changes to the SoiPrepareArtworkDTO with the
  /// specified artworkId, so we can see if the artwork has a S
  /// SoiPrepareArtwork with the correct status
  _i2.Stream<_i62.SoiPrepareArtworkDTO> watchByArtwork(
          {required int artworkId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i62.SoiPrepareArtworkDTO>,
          _i62.SoiPrepareArtworkDTO>(
        'soiPrepareArtwork',
        'watchByArtwork',
        {'artworkId': artworkId},
        {},
      );

  _i2.Stream<_i62.SoiPrepareArtworkDTO> watchBySalesOrder(
          {required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i62.SoiPrepareArtworkDTO>,
          _i62.SoiPrepareArtworkDTO>(
        'soiPrepareArtwork',
        'watchBySalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Stream<int> watchDeletionsForSalesOrder({required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'soiPrepareArtwork',
        'watchDeletionsForSalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Future<void> createFromSalesOrderArtwork({
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required int customerId,
  }) =>
      caller.callServerEndpoint<void>(
        'soiPrepareArtwork',
        'createFromSalesOrderArtwork',
        {
          'salesOrderId': salesOrderId,
          'artworkId': artworkId,
          'artworkMasterId': artworkMasterId,
          'customerId': customerId,
        },
      );

  _i2.Future<_i62.SoiPrepareArtworkDTO?> fetchForTable(int id) =>
      caller.callServerEndpoint<_i62.SoiPrepareArtworkDTO?>(
        'soiPrepareArtwork',
        'fetchForTable',
        {'id': id},
      );

  _i2.Future<bool> isArtworkInSoiPrepareArtwork({required int artworkId}) =>
      caller.callServerEndpoint<bool>(
        'soiPrepareArtwork',
        'isArtworkInSoiPrepareArtwork',
        {'artworkId': artworkId},
      );

  _i2.Future<_i62.SoiPrepareArtworkDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i62.SoiPrepareArtworkDTO?>(
        'soiPrepareArtwork',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i62.SoiPrepareArtworkDTO>> fetchForSalesOrder(
          int salesOrderId) =>
      caller.callServerEndpoint<List<_i62.SoiPrepareArtworkDTO>>(
        'soiPrepareArtwork',
        'fetchForSalesOrder',
        {'salesOrderId': salesOrderId},
      );

  /// The update happens inside of the unsafeQuery method
  _i2.Future<_i62.SoiPrepareArtworkDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i62.SoiPrepareArtworkDTO?>(
        'soiPrepareArtwork',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'soiPrepareArtwork',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i62.SoiPrepareArtworkDTO> update({
    required _i62.SoiPrepareArtworkDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i62.SoiPrepareArtworkDTO>(
        'soiPrepareArtwork',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i62.SoiPrepareArtworkDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i62.SoiPrepareArtworkDTO>>(
        'soiPrepareArtwork',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'soiPrepareArtwork',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointSoiRequestArtworkApproval extends _i1.EndpointRef {
  EndpointSoiRequestArtworkApproval(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'soiRequestArtworkApproval';

  _i2.Stream<_i63.SoiRequestArtworkApprovalDTO> watchEntity({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i63.SoiRequestArtworkApprovalDTO>,
          _i63.SoiRequestArtworkApprovalDTO>(
        'soiRequestArtworkApproval',
        'watchEntity',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  _i2.Stream<_i63.SoiRequestArtworkApprovalDTO> watchByArtwork(
          {required int artworkId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i63.SoiRequestArtworkApprovalDTO>,
          _i63.SoiRequestArtworkApprovalDTO>(
        'soiRequestArtworkApproval',
        'watchByArtwork',
        {'artworkId': artworkId},
        {},
      );

  _i2.Stream<_i63.SoiRequestArtworkApprovalDTO> watchBySalesOrder(
          {required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i63.SoiRequestArtworkApprovalDTO>,
          _i63.SoiRequestArtworkApprovalDTO>(
        'soiRequestArtworkApproval',
        'watchBySalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Stream<int> watchDeletionsForSalesOrder({required int salesOrderId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<int>, int>(
        'soiRequestArtworkApproval',
        'watchDeletionsForSalesOrder',
        {'salesOrderId': salesOrderId},
        {},
      );

  _i2.Future<void> createFromSalesOrderArtwork({
    required int salesOrderId,
    required int artworkId,
    required int artworkMasterId,
    required int customerId,
  }) =>
      caller.callServerEndpoint<void>(
        'soiRequestArtworkApproval',
        'createFromSalesOrderArtwork',
        {
          'salesOrderId': salesOrderId,
          'artworkId': artworkId,
          'artworkMasterId': artworkMasterId,
          'customerId': customerId,
        },
      );

  _i2.Future<_i63.SoiRequestArtworkApprovalDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i63.SoiRequestArtworkApprovalDTO?>(
        'soiRequestArtworkApproval',
        'fetchById',
        {'id': id},
      );

  _i2.Future<List<_i63.SoiRequestArtworkApprovalDTO>> fetchForSalesOrder(
          int salesOrderId) =>
      caller.callServerEndpoint<List<_i63.SoiRequestArtworkApprovalDTO>>(
        'soiRequestArtworkApproval',
        'fetchForSalesOrder',
        {'salesOrderId': salesOrderId},
      );

  /// The update happens inside of the unsafeQuery method
  _i2.Future<_i63.SoiRequestArtworkApprovalDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i63.SoiRequestArtworkApprovalDTO?>(
        'soiRequestArtworkApproval',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'soiRequestArtworkApproval',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  _i2.Future<_i63.SoiRequestArtworkApprovalDTO> update({
    required _i63.SoiRequestArtworkApprovalDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i63.SoiRequestArtworkApprovalDTO>(
        'soiRequestArtworkApproval',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  _i2.Future<List<_i63.SoiRequestArtworkApprovalDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i63.SoiRequestArtworkApprovalDTO>>(
        'soiRequestArtworkApproval',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'soiRequestArtworkApproval',
        'findEntityLocks',
        {},
      );
}

/// Sales Order Endpoint
///
/// Handles all the endpoint methods for the Sales Order entity
/// {@category Endpoint}
class EndpointSalesOrder extends _i1.EndpointRef {
  EndpointSalesOrder(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'salesOrder';

  _i2.Stream<_i64.SalesOrderDTO> watch({
    required String sessionId,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i64.SalesOrderDTO>,
          _i64.SalesOrderDTO>(
        'salesOrder',
        'watch',
        {
          'sessionId': sessionId,
          'entityId': entityId,
        },
        {},
      );

  /// Create a new sales order
  ///
  /// Creates a new sales order with the given customer ID
  ///
  /// [sessionId] The session ID of the current user window
  /// [customerId] The ID of the customer to create the sales order for
  _i2.Future<_i64.SalesOrderDTO> create({
    required String? sessionId,
    required int? customerId,
  }) =>
      caller.callServerEndpoint<_i64.SalesOrderDTO>(
        'salesOrder',
        'create',
        {
          'sessionId': sessionId,
          'customerId': customerId,
        },
      );

  /// Fetch a single sales order by ID
  _i2.Future<_i64.SalesOrderDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i64.SalesOrderDTO?>(
        'salesOrder',
        'fetchById',
        {'id': id},
      );

  /// Find a list of SalesOrders for Spotlight search
  /// Items will be returned wrapped as a SpotlightItem
  ///
  /// It checks the query for a valid Sales Order ID first
  /// If no valid Sales Order ID is found it will also check if the query
  /// contains a valid Customer Name
  /// -> It then returns SalesOrder related to this Customer
  _i2.Future<List<_i20.SpotlightItem>> findSpotlight({required String query}) =>
      caller.callServerEndpoint<List<_i20.SpotlightItem>>(
        'salesOrder',
        'findSpotlight',
        {'query': query},
      );

  /// Find a list of SalesOrders for a given filter
  ///
  /// It will also handle the sorting and filtering of the SalesOrders
  ///
  /// [sort] The sorting of the SalesOrders
  /// [filter] The filter of the SalesOrders
  _i2.Future<List<_i64.SalesOrderDTO>> find({
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i64.SalesOrderDTO>>(
        'salesOrder',
        'find',
        {
          'sort': sort,
          'filter': filter,
        },
      );

  _i2.Future<List<_i64.SalesOrderDTO>> findByCustomerId({
    required int customerId,
    _i4.Sort? sort,
    _i4.Filter? filter,
  }) =>
      caller.callServerEndpoint<List<_i64.SalesOrderDTO>>(
        'salesOrder',
        'findByCustomerId',
        {
          'customerId': customerId,
          'sort': sort,
          'filter': filter,
        },
      );

  /// Fetch and lock a single sales order by ID
  ///
  /// [id] The ID of the sales order to fetch and lock
  /// [editingSessionId] The ID of the editing session of the window
  _i2.Future<_i64.SalesOrderDTO?> fetchAndLock({
    required int id,
    required String editingSessionId,
  }) =>
      caller.callServerEndpoint<_i64.SalesOrderDTO?>(
        'salesOrder',
        'fetchAndLock',
        {
          'id': id,
          'editingSessionId': editingSessionId,
        },
      );

  /// Update a sales order
  ///
  /// [entity] The sales order with the updated values
  /// [sessionId] The session ID of the current user window
  /// [release] Whether to release the sales order after updating
  _i2.Future<_i64.SalesOrderDTO> update({
    required _i64.SalesOrderDTO entity,
    required String sessionId,
    required bool release,
  }) =>
      caller.callServerEndpoint<_i64.SalesOrderDTO>(
        'salesOrder',
        'update',
        {
          'entity': entity,
          'sessionId': sessionId,
          'release': release,
        },
      );

  /// Release a sales order for editing
  ///
  /// [entityId] The ID of the sales order to release
  /// [sessionId] The session ID of the current user window
  _i2.Future<void> release({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<void>(
        'salesOrder',
        'release',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Delete a sales order
  ///
  /// [entityId] The ID of the sales order to delete
  /// [sessionId] The session ID of the current user window
  _i2.Future<bool> delete({
    required int entityId,
    required String sessionId,
  }) =>
      caller.callServerEndpoint<bool>(
        'salesOrder',
        'delete',
        {
          'entityId': entityId,
          'sessionId': sessionId,
        },
      );

  /// Find all entity locks for a sales order
  /// Means all SalesOrders that are currently being edited by another user or
  /// were left in that state through app errors or crashes
  ///
  /// [session] The session to find the entity locks for
  _i2.Future<List<_i4.EntityLockDTO>> findEntityLocks() =>
      caller.callServerEndpoint<List<_i4.EntityLockDTO>>(
        'salesOrder',
        'findEntityLocks',
        {},
      );
}

/// {@category Endpoint}
class EndpointAhoiFileStorage extends _i1.EndpointRef {
  EndpointAhoiFileStorage(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'ahoiFileStorage';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'ahoiFileStorage',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'ahoiFileStorage',
        'verifyUpload',
        {'path': path},
      );

  _i2.Future<bool> deleteFile(String path) => caller.callServerEndpoint<bool>(
        'ahoiFileStorage',
        'deleteFile',
        {'path': path},
      );

  _i2.Future<String?> getDownloadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'ahoiFileStorage',
        'getDownloadDescription',
        {'path': path},
      );

  _i2.Future<String> getDownloadUrl(String path) =>
      caller.callServerEndpoint<String>(
        'ahoiFileStorage',
        'getDownloadUrl',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointJsonDesigner extends _i1.EndpointRef {
  EndpointJsonDesigner(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jsonDesigner';

  _i2.Future<_i65.JsonTemplateDTO?> createTemplate(
          _i65.JsonTemplateDTO jsonTemplate) =>
      caller.callServerEndpoint<_i65.JsonTemplateDTO?>(
        'jsonDesigner',
        'createTemplate',
        {'jsonTemplate': jsonTemplate},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i66.Caller(client);
    core = _i4.Caller(client);
  }

  late final _i66.Caller auth;

  late final _i4.Caller core;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i67.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    migrationMatsCompany = EndpointMigrationMatsCompany(this);
    migrationMatsPerson = EndpointMigrationMatsPerson(this);
    appUserSelf = EndpointAppUserSelf(this);
    appUser = EndpointAppUser(this);
    appUserPublicInsecure = EndpointAppUserPublicInsecure(this);
    deeplink = EndpointDeeplink(this);
    entityAssignments = EndpointEntityAssignments(this);
    entityLock = EndpointEntityLock(this);
    entityLog = EndpointEntityLog(this);
    fieldSuggestion = EndpointFieldSuggestion(this);
    globalSettings = EndpointGlobalSettings(this);
    serviceUser = EndpointServiceUser(this);
    serviceUserToken = EndpointServiceUserToken(this);
    appClient = EndpointAppClient(this);
    companyDepartment = EndpointCompanyDepartment(this);
    companyEmployee = EndpointCompanyEmployee(this);
    contact = EndpointContact(this);
    countryCode = EndpointCountryCode(this);
    crmEvent = EndpointCrmEvent(this);
    customer = EndpointCustomer(this);
    shippingMethod = EndpointShippingMethod(this);
    customerBillingCustomer = EndpointCustomerBillingCustomer(this);
    customerCustomer = EndpointCustomerCustomer(this);
    customerShippingContacts = EndpointCustomerShippingContacts(this);
    departmentCode = EndpointDepartmentCode(this);
    languageCode = EndpointLanguageCode(this);
    paymentCode = EndpointPaymentCode(this);
    salutationCode = EndpointSalutationCode(this);
    artwork = EndpointArtwork(this);
    artworkLog = EndpointArtworkLog(this);
    artworkMaster = EndpointArtworkMaster(this);
    artworkQuarantine = EndpointArtworkQuarantine(this);
    artworkQuarantineGroup = EndpointArtworkQuarantineGroup(this);
    artworkTemplate = EndpointArtworkTemplate(this);
    artworkTemplatePreSelection = EndpointArtworkTemplatePreSelection(this);
    artworkTemplateSelection = EndpointArtworkTemplateSelection(this);
    artworkColor = EndpointArtworkColor(this);
    prepressColorPalette = EndpointPrepressColorPalette(this);
    drucklayout = EndpointDrucklayout(this);
    drucklayoutPreSelection = EndpointDrucklayoutPreSelection(this);
    drucklayoutSelection = EndpointDrucklayoutSelection(this);
    nutzenLayout = EndpointNutzenLayout(this);
    product = EndpointProduct(this);
    productLog = EndpointProductLog(this);
    productMaster = EndpointProductMaster(this);
    salesOrderItem = EndpointSalesOrderItem(this);
    soiConsulting = EndpointSoiConsulting(this);
    soiEinzelformaufbau = EndpointSoiEinzelformaufbau(this);
    soiPrepareArtwork = EndpointSoiPrepareArtwork(this);
    soiRequestArtworkApproval = EndpointSoiRequestArtworkApproval(this);
    salesOrder = EndpointSalesOrder(this);
    ahoiFileStorage = EndpointAhoiFileStorage(this);
    jsonDesigner = EndpointJsonDesigner(this);
    modules = Modules(this);
  }

  late final EndpointMigrationMatsCompany migrationMatsCompany;

  late final EndpointMigrationMatsPerson migrationMatsPerson;

  late final EndpointAppUserSelf appUserSelf;

  late final EndpointAppUser appUser;

  late final EndpointAppUserPublicInsecure appUserPublicInsecure;

  late final EndpointDeeplink deeplink;

  late final EndpointEntityAssignments entityAssignments;

  late final EndpointEntityLock entityLock;

  late final EndpointEntityLog entityLog;

  late final EndpointFieldSuggestion fieldSuggestion;

  late final EndpointGlobalSettings globalSettings;

  late final EndpointServiceUser serviceUser;

  late final EndpointServiceUserToken serviceUserToken;

  late final EndpointAppClient appClient;

  late final EndpointCompanyDepartment companyDepartment;

  late final EndpointCompanyEmployee companyEmployee;

  late final EndpointContact contact;

  late final EndpointCountryCode countryCode;

  late final EndpointCrmEvent crmEvent;

  late final EndpointCustomer customer;

  late final EndpointShippingMethod shippingMethod;

  late final EndpointCustomerBillingCustomer customerBillingCustomer;

  late final EndpointCustomerCustomer customerCustomer;

  late final EndpointCustomerShippingContacts customerShippingContacts;

  late final EndpointDepartmentCode departmentCode;

  late final EndpointLanguageCode languageCode;

  late final EndpointPaymentCode paymentCode;

  late final EndpointSalutationCode salutationCode;

  late final EndpointArtwork artwork;

  late final EndpointArtworkLog artworkLog;

  late final EndpointArtworkMaster artworkMaster;

  late final EndpointArtworkQuarantine artworkQuarantine;

  late final EndpointArtworkQuarantineGroup artworkQuarantineGroup;

  late final EndpointArtworkTemplate artworkTemplate;

  late final EndpointArtworkTemplatePreSelection artworkTemplatePreSelection;

  late final EndpointArtworkTemplateSelection artworkTemplateSelection;

  late final EndpointArtworkColor artworkColor;

  late final EndpointPrepressColorPalette prepressColorPalette;

  late final EndpointDrucklayout drucklayout;

  late final EndpointDrucklayoutPreSelection drucklayoutPreSelection;

  late final EndpointDrucklayoutSelection drucklayoutSelection;

  late final EndpointNutzenLayout nutzenLayout;

  late final EndpointProduct product;

  late final EndpointProductLog productLog;

  late final EndpointProductMaster productMaster;

  late final EndpointSalesOrderItem salesOrderItem;

  late final EndpointSoiConsulting soiConsulting;

  late final EndpointSoiEinzelformaufbau soiEinzelformaufbau;

  late final EndpointSoiPrepareArtwork soiPrepareArtwork;

  late final EndpointSoiRequestArtworkApproval soiRequestArtworkApproval;

  late final EndpointSalesOrder salesOrder;

  late final EndpointAhoiFileStorage ahoiFileStorage;

  late final EndpointJsonDesigner jsonDesigner;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'migrationMatsCompany': migrationMatsCompany,
        'migrationMatsPerson': migrationMatsPerson,
        'appUserSelf': appUserSelf,
        'appUser': appUser,
        'appUserPublicInsecure': appUserPublicInsecure,
        'deeplink': deeplink,
        'entityAssignments': entityAssignments,
        'entityLock': entityLock,
        'entityLog': entityLog,
        'fieldSuggestion': fieldSuggestion,
        'globalSettings': globalSettings,
        'serviceUser': serviceUser,
        'serviceUserToken': serviceUserToken,
        'appClient': appClient,
        'companyDepartment': companyDepartment,
        'companyEmployee': companyEmployee,
        'contact': contact,
        'countryCode': countryCode,
        'crmEvent': crmEvent,
        'customer': customer,
        'shippingMethod': shippingMethod,
        'customerBillingCustomer': customerBillingCustomer,
        'customerCustomer': customerCustomer,
        'customerShippingContacts': customerShippingContacts,
        'departmentCode': departmentCode,
        'languageCode': languageCode,
        'paymentCode': paymentCode,
        'salutationCode': salutationCode,
        'artwork': artwork,
        'artworkLog': artworkLog,
        'artworkMaster': artworkMaster,
        'artworkQuarantine': artworkQuarantine,
        'artworkQuarantineGroup': artworkQuarantineGroup,
        'artworkTemplate': artworkTemplate,
        'artworkTemplatePreSelection': artworkTemplatePreSelection,
        'artworkTemplateSelection': artworkTemplateSelection,
        'artworkColor': artworkColor,
        'prepressColorPalette': prepressColorPalette,
        'drucklayout': drucklayout,
        'drucklayoutPreSelection': drucklayoutPreSelection,
        'drucklayoutSelection': drucklayoutSelection,
        'nutzenLayout': nutzenLayout,
        'product': product,
        'productLog': productLog,
        'productMaster': productMaster,
        'salesOrderItem': salesOrderItem,
        'soiConsulting': soiConsulting,
        'soiEinzelformaufbau': soiEinzelformaufbau,
        'soiPrepareArtwork': soiPrepareArtwork,
        'soiRequestArtworkApproval': soiRequestArtworkApproval,
        'salesOrder': salesOrder,
        'ahoiFileStorage': ahoiFileStorage,
        'jsonDesigner': jsonDesigner,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {
        'auth': modules.auth,
        'core': modules.core,
      };
}
