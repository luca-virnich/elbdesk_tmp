/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../modules/core/admin_migration/endpoints/migration_mats_company_endpoint.dart'
    as _i2;
import '../modules/core/admin_migration/endpoints/migration_mats_person_endpoint.dart'
    as _i3;
import '../modules/core/app_user/endpoints/app_user_endpoint.dart' as _i4;
import '../modules/core/deeplink/deeplink_endpoint.dart' as _i5;
import '../modules/core/entity_assignments/entity_assignments_endpoint.dart'
    as _i6;
import '../modules/core/entity_lock/endpoints/entity_lock_endpoint.dart' as _i7;
import '../modules/core/entity_log/entity_log_endpoint.dart' as _i8;
import '../modules/core/field_suggestion/field_suggestion_endpoint.dart' as _i9;
import '../modules/core/global_settings/endpoints/global_settings_endpoint.dart'
    as _i10;
import '../modules/core/service_user/endpoints/service_user_endpoint.dart'
    as _i11;
import '../modules/core/service_user/endpoints/service_user_token_endpoint.dart'
    as _i12;
import '../modules/crm/app_client/endpoints/app_client_endpoint.dart' as _i13;
import '../modules/crm/company_department/endpoints/company_department_endpoint.dart'
    as _i14;
import '../modules/crm/company_employee/endpoints/company_employee_endpoint.dart'
    as _i15;
import '../modules/crm/contact/endpoints/contact_endpoint.dart' as _i16;
import '../modules/crm/country_code/endpoints/country_code_endpoint.dart'
    as _i17;
import '../modules/crm/crm_event/endpoints/crm_event_endpoint.dart' as _i18;
import '../modules/crm/customer/endpoints/customer_endpoint.dart' as _i19;
import '../modules/crm/customer/endpoints/shipping_method_endpoint.dart'
    as _i20;
import '../modules/crm/customer_billing_customers/endpoints/customer_billing_customer_endpoint.dart'
    as _i21;
import '../modules/crm/customer_customer/endpoints/customer_customer_endpoint.dart'
    as _i22;
import '../modules/crm/customer_shipping_contact/endpoints/customer_shipping_contacts_endpoint.dart'
    as _i23;
import '../modules/crm/department_code/endpoints/department_code_endpoint.dart'
    as _i24;
import '../modules/crm/language_code/endpoints/language_code_endpoint.dart'
    as _i25;
import '../modules/crm/payment_code/endpoints/payment_code_endpoint.dart'
    as _i26;
import '../modules/crm/salutation_code/endpoints/salutation_code_endpoint.dart'
    as _i27;
import '../modules/prepress/artwork/endpoints/artwork_endpoint.dart' as _i28;
import '../modules/prepress/artwork/endpoints/artwork_log_endpoint.dart'
    as _i29;
import '../modules/prepress/artwork/endpoints/artwork_master_endpoint.dart'
    as _i30;
import '../modules/prepress/artwork_quarantine/endpoints/artwork_quarantine_endpoint.dart'
    as _i31;
import '../modules/prepress/artwork_quarantine_group/endpoints/artwork_quarantine_group_endpoint.dart'
    as _i32;
import '../modules/prepress/artwork_template/endpoints/artwork_template_endpoint.dart'
    as _i33;
import '../modules/prepress/artwork_template/endpoints/artwork_template_pre_selection_endpoint.dart'
    as _i34;
import '../modules/prepress/artwork_template/endpoints/artwork_template_selection_endpoint.dart'
    as _i35;
import '../modules/prepress/color/endpoints/artwork_color_endpoint.dart'
    as _i36;
import '../modules/prepress/color_palette/endpoints/prepress_color_palette_endpoint.dart'
    as _i37;
import '../modules/prepress/drucklayout/endpoints/drucklayout_endpoint.dart'
    as _i38;
import '../modules/prepress/drucklayout/endpoints/drucklayout_pre_selection_endpoint.dart'
    as _i39;
import '../modules/prepress/drucklayout/endpoints/drucklayout_selection_endpoint.dart'
    as _i40;
import '../modules/prepress/nutzenlayout/endpoints/nutzenlayout_endpoint.dart'
    as _i41;
import '../modules/prepress/product/endpoints/product_endpoint.dart' as _i42;
import '../modules/prepress/product/endpoints/product_log_endpoint.dart'
    as _i43;
import '../modules/prepress/product/endpoints/product_master_endpoint.dart'
    as _i44;
import '../modules/prepress/sales_order_item/endpoints/sales_order_item_endpoint.dart'
    as _i45;
import '../modules/prepress/sales_order_item/soi_consulting/endpoints/soi_consulting_endpoint.dart'
    as _i46;
import '../modules/prepress/sales_order_item/soi_einzelformaufbau/endpoints/soi_einzelnutzenaufbau_endpoint.dart'
    as _i47;
import '../modules/prepress/sales_order_item/soi_prepare_artwork/endpoints/soi_prepare_artwork_endpoint.dart'
    as _i48;
import '../modules/prepress/sales_order_item/soi_request_artwork_approval/endpoints/soi_request_artwork_approval_endpoint.dart'
    as _i49;
import '../modules/sales/sales_order/endpoints/sales_order_endpoint.dart'
    as _i50;
import '../modules/unsorted/ahoi_file_storage/ahoi_file_storage_endpoint.dart'
    as _i51;
import '../modules/unsorted/json_designer/json_designer_endpoint.dart' as _i52;
import 'package:elbdesk_server/src/generated/modules/core/admin_migration/models/migration_mats_company.dart'
    as _i53;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as _i54;
import 'package:elbdesk_server/src/generated/protocol.dart' as _i55;
import 'package:elbdesk_server/src/generated/modules/core/admin_migration/models/migration_mats_person.dart'
    as _i56;
import 'package:elbdesk_server/src/generated/modules/core/app_user/models/app_user.dart'
    as _i57;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/models/sales_order_item_type.dart'
    as _i58;
import 'package:elbdesk_server/src/generated/modules/core/table/table_type.dart'
    as _i59;
import 'package:elbdesk_server/src/generated/modules/core/global_settings/models/global_settings.dart'
    as _i60;
import 'package:elbdesk_server/src/generated/modules/core/service_user/model/service_user.dart'
    as _i61;
import 'package:elbdesk_server/src/generated/modules/crm/app_client/models/app_client.dart'
    as _i62;
import 'package:elbdesk_server/src/generated/modules/crm/company_department/models/company_department.dart'
    as _i63;
import 'package:elbdesk_server/src/generated/modules/crm/company_employee/models/company_employee.dart'
    as _i64;
import 'package:elbdesk_server/src/generated/modules/crm/contact/models/contact_type.dart'
    as _i65;
import 'package:elbdesk_server/src/generated/modules/crm/contact/models/contact_field.dart'
    as _i66;
import 'package:elbdesk_server/src/generated/modules/crm/contact/models/contact.dart'
    as _i67;
import 'package:elbdesk_server/src/generated/modules/crm/country_code/models/country_code.dart'
    as _i68;
import 'package:elbdesk_server/src/generated/modules/crm/crm_event/models/crm_event.dart'
    as _i69;
import 'package:elbdesk_server/src/generated/modules/crm/customer/models/customer.dart'
    as _i70;
import 'package:elbdesk_server/src/generated/modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart'
    as _i71;
import 'package:elbdesk_server/src/generated/modules/crm/customer_billing_customers/models/customer_billing_customer.dart'
    as _i72;
import 'package:elbdesk_server/src/generated/modules/crm/customer/models/shipping_method.dart'
    as _i73;
import 'package:elbdesk_server/src/generated/modules/crm/department_code/models/department_code.dart'
    as _i74;
import 'package:elbdesk_server/src/generated/modules/crm/language_code/models/language_code.dart'
    as _i75;
import 'package:elbdesk_server/src/generated/modules/crm/payment_code/models/payment_code.dart'
    as _i76;
import 'package:elbdesk_server/src/generated/modules/crm/salutation_code/models/salutation_code.dart'
    as _i77;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork/models/artwork.dart'
    as _i78;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_status.dart'
    as _i79;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i80;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i81;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_template/models/artwork_template.dart'
    as _i82;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i83;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i84;
import 'package:elbdesk_server/src/generated/modules/prepress/color/models/artwork_color.dart'
    as _i85;
import 'package:elbdesk_server/src/generated/modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i86;
import 'package:elbdesk_server/src/generated/modules/prepress/drucklayout/models/drucklayout.dart'
    as _i87;
import 'package:elbdesk_server/src/generated/modules/prepress/drucklayout/models/drucklayout_pre_selection.dart'
    as _i88;
import 'package:elbdesk_server/src/generated/modules/prepress/drucklayout/models/drucklayout_selection.dart'
    as _i89;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i90;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i91;
import 'package:elbdesk_server/src/generated/modules/prepress/product/models/product.dart'
    as _i92;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork/models/artwork_type.dart'
    as _i93;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork/models/artwork_print_process_type.dart'
    as _i94;
import 'package:elbdesk_server/src/generated/modules/prepress/product/models/product_type.dart'
    as _i95;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_dto.dart'
    as _i96;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau.dart'
    as _i97;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork.dart'
    as _i98;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval.dart'
    as _i99;
import 'package:elbdesk_server/src/generated/modules/sales/sales_order/models/sales_order.dart'
    as _i100;
import 'package:elbdesk_server/src/generated/modules/unsorted/json_designer/json_template.dart'
    as _i101;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i102;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'migrationMatsCompany': _i2.MigrationMatsCompanyEndpoint()
        ..initialize(
          server,
          'migrationMatsCompany',
          null,
        ),
      'migrationMatsPerson': _i3.MigrationMatsPersonEndpoint()
        ..initialize(
          server,
          'migrationMatsPerson',
          null,
        ),
      'appUserSelf': _i4.AppUserSelfEndpoint()
        ..initialize(
          server,
          'appUserSelf',
          null,
        ),
      'appUser': _i4.AppUserEndpoint()
        ..initialize(
          server,
          'appUser',
          null,
        ),
      'appUserPublicInsecure': _i4.AppUserPublicInsecureEndpoint()
        ..initialize(
          server,
          'appUserPublicInsecure',
          null,
        ),
      'deeplink': _i5.DeeplinkEndpoint()
        ..initialize(
          server,
          'deeplink',
          null,
        ),
      'entityAssignments': _i6.EntityAssignmentsEndpoint()
        ..initialize(
          server,
          'entityAssignments',
          null,
        ),
      'entityLock': _i7.EntityLockEndpoint()
        ..initialize(
          server,
          'entityLock',
          null,
        ),
      'entityLog': _i8.EntityLogEndpoint()
        ..initialize(
          server,
          'entityLog',
          null,
        ),
      'fieldSuggestion': _i9.FieldSuggestionEndpoint()
        ..initialize(
          server,
          'fieldSuggestion',
          null,
        ),
      'globalSettings': _i10.GlobalSettingsEndpoint()
        ..initialize(
          server,
          'globalSettings',
          null,
        ),
      'serviceUser': _i11.ServiceUserEndpoint()
        ..initialize(
          server,
          'serviceUser',
          null,
        ),
      'serviceUserToken': _i12.ServiceUserTokenEndpoint()
        ..initialize(
          server,
          'serviceUserToken',
          null,
        ),
      'appClient': _i13.AppClientEndpoint()
        ..initialize(
          server,
          'appClient',
          null,
        ),
      'companyDepartment': _i14.CompanyDepartmentEndpoint()
        ..initialize(
          server,
          'companyDepartment',
          null,
        ),
      'companyEmployee': _i15.CompanyEmployeeEndpoint()
        ..initialize(
          server,
          'companyEmployee',
          null,
        ),
      'contact': _i16.ContactEndpoint()
        ..initialize(
          server,
          'contact',
          null,
        ),
      'countryCode': _i17.CountryCodeEndpoint()
        ..initialize(
          server,
          'countryCode',
          null,
        ),
      'crmEvent': _i18.CrmEventEndpoint()
        ..initialize(
          server,
          'crmEvent',
          null,
        ),
      'customer': _i19.CustomerEndpoint()
        ..initialize(
          server,
          'customer',
          null,
        ),
      'shippingMethod': _i20.ShippingMethodEndpoint()
        ..initialize(
          server,
          'shippingMethod',
          null,
        ),
      'customerBillingCustomer': _i21.CustomerBillingCustomerEndpoint()
        ..initialize(
          server,
          'customerBillingCustomer',
          null,
        ),
      'customerCustomer': _i22.CustomerCustomerEndpoint()
        ..initialize(
          server,
          'customerCustomer',
          null,
        ),
      'customerShippingContacts': _i23.CustomerShippingContactsEndpoint()
        ..initialize(
          server,
          'customerShippingContacts',
          null,
        ),
      'departmentCode': _i24.DepartmentCodeEndpoint()
        ..initialize(
          server,
          'departmentCode',
          null,
        ),
      'languageCode': _i25.LanguageCodeEndpoint()
        ..initialize(
          server,
          'languageCode',
          null,
        ),
      'paymentCode': _i26.PaymentCodeEndpoint()
        ..initialize(
          server,
          'paymentCode',
          null,
        ),
      'salutationCode': _i27.SalutationCodeEndpoint()
        ..initialize(
          server,
          'salutationCode',
          null,
        ),
      'artwork': _i28.ArtworkEndpoint()
        ..initialize(
          server,
          'artwork',
          null,
        ),
      'artworkLog': _i29.ArtworkLogEndpoint()
        ..initialize(
          server,
          'artworkLog',
          null,
        ),
      'artworkMaster': _i30.ArtworkMasterEndpoint()
        ..initialize(
          server,
          'artworkMaster',
          null,
        ),
      'artworkQuarantine': _i31.ArtworkQuarantineEndpoint()
        ..initialize(
          server,
          'artworkQuarantine',
          null,
        ),
      'artworkQuarantineGroup': _i32.ArtworkQuarantineGroupEndpoint()
        ..initialize(
          server,
          'artworkQuarantineGroup',
          null,
        ),
      'artworkTemplate': _i33.ArtworkTemplateEndpoint()
        ..initialize(
          server,
          'artworkTemplate',
          null,
        ),
      'artworkTemplatePreSelection': _i34.ArtworkTemplatePreSelectionEndpoint()
        ..initialize(
          server,
          'artworkTemplatePreSelection',
          null,
        ),
      'artworkTemplateSelection': _i35.ArtworkTemplateSelectionEndpoint()
        ..initialize(
          server,
          'artworkTemplateSelection',
          null,
        ),
      'artworkColor': _i36.ArtworkColorEndpoint()
        ..initialize(
          server,
          'artworkColor',
          null,
        ),
      'prepressColorPalette': _i37.PrepressColorPaletteEndpoint()
        ..initialize(
          server,
          'prepressColorPalette',
          null,
        ),
      'drucklayout': _i38.DrucklayoutEndpoint()
        ..initialize(
          server,
          'drucklayout',
          null,
        ),
      'drucklayoutPreSelection': _i39.DrucklayoutPreSelectionEndpoint()
        ..initialize(
          server,
          'drucklayoutPreSelection',
          null,
        ),
      'drucklayoutSelection': _i40.DrucklayoutSelectionEndpoint()
        ..initialize(
          server,
          'drucklayoutSelection',
          null,
        ),
      'nutzenLayout': _i41.NutzenLayoutEndpoint()
        ..initialize(
          server,
          'nutzenLayout',
          null,
        ),
      'product': _i42.ProductEndpoint()
        ..initialize(
          server,
          'product',
          null,
        ),
      'productLog': _i43.ProductLogEndpoint()
        ..initialize(
          server,
          'productLog',
          null,
        ),
      'productMaster': _i44.ProductMasterEndpoint()
        ..initialize(
          server,
          'productMaster',
          null,
        ),
      'salesOrderItem': _i45.SalesOrderItemEndpoint()
        ..initialize(
          server,
          'salesOrderItem',
          null,
        ),
      'soiConsulting': _i46.SoiConsultingEndpoint()
        ..initialize(
          server,
          'soiConsulting',
          null,
        ),
      'soiEinzelformaufbau': _i47.SoiEinzelformaufbauEndpoint()
        ..initialize(
          server,
          'soiEinzelformaufbau',
          null,
        ),
      'soiPrepareArtwork': _i48.SoiPrepareArtworkEndpoint()
        ..initialize(
          server,
          'soiPrepareArtwork',
          null,
        ),
      'soiRequestArtworkApproval': _i49.SoiRequestArtworkApprovalEndpoint()
        ..initialize(
          server,
          'soiRequestArtworkApproval',
          null,
        ),
      'salesOrder': _i50.SalesOrderEndpoint()
        ..initialize(
          server,
          'salesOrder',
          null,
        ),
      'ahoiFileStorage': _i51.AhoiFileStorageEndpoint()
        ..initialize(
          server,
          'ahoiFileStorage',
          null,
        ),
      'jsonDesigner': _i52.JsonDesignerEndpoint()
        ..initialize(
          server,
          'jsonDesigner',
          null,
        ),
    };
    connectors['migrationMatsCompany'] = _i1.EndpointConnector(
      name: 'migrationMatsCompany',
      endpoint: endpoints['migrationMatsCompany']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i53.MigrationMatsCompanyDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .create(
            session,
            entity: params['entity'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i53.MigrationMatsCompanyDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i53.MigrationMatsCompanyDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .delete(
            session,
            entity: params['entity'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .findEntityLocks(session),
        ),
        'import': _i1.MethodConnector(
          name: 'import',
          params: {
            'companies': _i1.ParameterDescription(
              name: 'companies',
              type: _i1.getType<List<_i53.MigrationMatsCompanyDTO>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .import(
            session,
            companies: params['companies'],
          ),
        ),
        'migrateToContacts': _i1.MethodConnector(
          name: 'migrateToContacts',
          params: {
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .migrateToContacts(
            session,
            offset: params['offset'],
            limit: params['limit'],
          ),
        ),
        'count': _i1.MethodConnector(
          name: 'count',
          params: {
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
            'isMigrated': _i1.ParameterDescription(
              name: 'isMigrated',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .count(
            session,
            filter: params['filter'],
            isMigrated: params['isMigrated'],
          ),
        ),
        'migrateToCustomers': _i1.MethodConnector(
          name: 'migrateToCustomers',
          params: {
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .migrateToCustomers(
            session,
            offset: params['offset'],
            limit: params['limit'],
          ),
        ),
        'assignEmployeesToCompanies': _i1.MethodConnector(
          name: 'assignEmployeesToCompanies',
          params: {
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .assignEmployeesToCompanies(
                    session,
                    offset: params['offset'],
                    limit: params['limit'],
                  )
                  .then((record) => _i55.mapRecordToJson(record)),
        ),
        'createDepartments': _i1.MethodConnector(
          name: 'createDepartments',
          params: {
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .createDepartments(
                    session,
                    offset: params['offset'],
                    limit: params['limit'],
                  )
                  .then((record) => _i55.mapRecordToJson(record)),
        ),
        'hasGeneratedContacts': _i1.MethodConnector(
          name: 'hasGeneratedContacts',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .hasGeneratedContacts(session),
        ),
        'hasGeneratedContactsAndPerson': _i1.MethodConnector(
          name: 'hasGeneratedContactsAndPerson',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .hasGeneratedContactsAndPerson(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'releaseOnClose': _i1.ParameterDescription(
              name: 'releaseOnClose',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
            releaseOnClose: params['releaseOnClose'],
          ),
        ),
        'watchUpdates': _i1.MethodStreamConnector(
          name: 'watchUpdates',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['migrationMatsCompany']
                      as _i2.MigrationMatsCompanyEndpoint)
                  .watchUpdates(
            session,
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['migrationMatsPerson'] = _i1.EndpointConnector(
      name: 'migrationMatsPerson',
      endpoint: endpoints['migrationMatsPerson']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i56.MigrationMatsPersonDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .create(
            session,
            entity: params['entity'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i56.MigrationMatsPersonDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i56.MigrationMatsPersonDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .delete(
            session,
            entity: params['entity'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .findEntityLocks(session),
        ),
        'import': _i1.MethodConnector(
          name: 'import',
          params: {
            'persons': _i1.ParameterDescription(
              name: 'persons',
              type: _i1.getType<List<_i56.MigrationMatsPersonDTO>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .import(
            session,
            persons: params['persons'],
          ),
        ),
        'migrateToContacts': _i1.MethodConnector(
          name: 'migrateToContacts',
          params: {
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .migrateToContacts(
            session,
            offset: params['offset'],
            limit: params['limit'],
          ),
        ),
        'count': _i1.MethodConnector(
          name: 'count',
          params: {
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
            'isMigrated': _i1.ParameterDescription(
              name: 'isMigrated',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
            'isPerson': _i1.ParameterDescription(
              name: 'isPerson',
              type: _i1.getType<bool?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .count(
            session,
            filter: params['filter'],
            isMigrated: params['isMigrated'],
            isPerson: params['isPerson'],
          ),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'releaseOnClose': _i1.ParameterDescription(
              name: 'releaseOnClose',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
            releaseOnClose: params['releaseOnClose'],
          ),
        ),
        'watchUpdates': _i1.MethodStreamConnector(
          name: 'watchUpdates',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['migrationMatsPerson']
                      as _i3.MigrationMatsPersonEndpoint)
                  .watchUpdates(
            session,
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['appUserSelf'] = _i1.EndpointConnector(
      name: 'appUserSelf',
      endpoint: endpoints['appUserSelf']!,
      methodConnectors: {
        'fetchSelf': _i1.MethodConnector(
          name: 'fetchSelf',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUserSelf'] as _i4.AppUserSelfEndpoint)
                  .fetchSelf(session),
        ),
        'watchSelf': _i1.MethodStreamConnector(
          name: 'watchSelf',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['appUserSelf'] as _i4.AppUserSelfEndpoint)
                  .watchSelf(session),
        ),
      },
    );
    connectors['appUser'] = _i1.EndpointConnector(
      name: 'appUser',
      endpoint: endpoints['appUser']!,
      methodConnectors: {
        'promoteToAdmin': _i1.MethodConnector(
          name: 'promoteToAdmin',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint)
                  .promoteToAdmin(session),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).create(
            session,
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'appUser': _i1.ParameterDescription(
              name: 'appUser',
              type: _i1.getType<_i57.AppUserDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).update(
            session,
            appUser: params['appUser'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).delete(
            session,
            userId: params['userId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUser'] as _i4.AppUserEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['appUser'] as _i4.AppUserEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['appUserPublicInsecure'] = _i1.EndpointConnector(
      name: 'appUserPublicInsecure',
      endpoint: endpoints['appUserPublicInsecure']!,
      methodConnectors: {
        'hasUsers': _i1.MethodConnector(
          name: 'hasUsers',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUserPublicInsecure']
                      as _i4.AppUserPublicInsecureEndpoint)
                  .hasUsers(session),
        ),
        'createInitialAdminAppUser': _i1.MethodConnector(
          name: 'createInitialAdminAppUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fullName': _i1.ParameterDescription(
              name: 'fullName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appUserPublicInsecure']
                      as _i4.AppUserPublicInsecureEndpoint)
                  .createInitialAdminAppUser(
            session,
            email: params['email'],
            fullName: params['fullName'],
          ),
        ),
      },
    );
    connectors['deeplink'] = _i1.EndpointConnector(
      name: 'deeplink',
      endpoint: endpoints['deeplink']!,
      methodConnectors: {
        'getContactType': _i1.MethodConnector(
          name: 'getContactType',
          params: {
            'contactId': _i1.ParameterDescription(
              name: 'contactId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['deeplink'] as _i5.DeeplinkEndpoint).getContactType(
            session,
            contactId: params['contactId'],
          ),
        ),
        'getArtworkCustomerId': _i1.MethodConnector(
          name: 'getArtworkCustomerId',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['deeplink'] as _i5.DeeplinkEndpoint)
                  .getArtworkCustomerId(
            session,
            artworkId: params['artworkId'],
          ),
        ),
        'getSalesOrderCustomerId': _i1.MethodConnector(
          name: 'getSalesOrderCustomerId',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['deeplink'] as _i5.DeeplinkEndpoint)
                  .getSalesOrderCustomerId(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'getSoiCustomerIdAndSalesOrderId': _i1.MethodConnector(
          name: 'getSoiCustomerIdAndSalesOrderId',
          params: {
            'soiTypePrimaryKey': _i1.ParameterDescription(
              name: 'soiTypePrimaryKey',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'soiType': _i1.ParameterDescription(
              name: 'soiType',
              type: _i1.getType<_i58.SalesOrderItemType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['deeplink'] as _i5.DeeplinkEndpoint)
                  .getSoiCustomerIdAndSalesOrderId(
                    session,
                    soiTypePrimaryKey: params['soiTypePrimaryKey'],
                    soiType: params['soiType'],
                  )
                  .then((record) => _i55.mapRecordToJson(record)),
        ),
      },
    );
    connectors['entityAssignments'] = _i1.EndpointConnector(
      name: 'entityAssignments',
      endpoint: endpoints['entityAssignments']!,
      methodConnectors: {
        'fetchEntityAssignments': _i1.MethodConnector(
          name: 'fetchEntityAssignments',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityAssignments'] as _i6.EntityAssignmentsEndpoint)
                  .fetchEntityAssignments(session),
        )
      },
    );
    connectors['entityLock'] = _i1.EndpointConnector(
      name: 'entityLock',
      endpoint: endpoints['entityLock']!,
      methodConnectors: {
        'releaseEntityLock': _i1.MethodConnector(
          name: 'releaseEntityLock',
          params: {
            'entityType': _i1.ParameterDescription(
              name: 'entityType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityLock'] as _i7.EntityLockEndpoint)
                  .releaseEntityLock(
            session,
            params['entityType'],
            params['id'],
          ),
        ),
        'findEntityLocksByTableType': _i1.MethodConnector(
          name: 'findEntityLocksByTableType',
          params: {
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<_i59.TableType>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityLock'] as _i7.EntityLockEndpoint)
                  .findEntityLocksByTableType(
            session,
            tableType: params['tableType'],
          ),
        ),
        'findAllEntityLocks': _i1.MethodConnector(
          name: 'findAllEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityLock'] as _i7.EntityLockEndpoint)
                  .findAllEntityLocks(session),
        ),
      },
    );
    connectors['entityLog'] = _i1.EndpointConnector(
      name: 'entityLog',
      endpoint: endpoints['entityLog']!,
      methodConnectors: {
        'fetchEntityLogs': _i1.MethodConnector(
          name: 'fetchEntityLogs',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<_i59.TableType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityLog'] as _i8.EntityLogEndpoint).fetchEntityLogs(
            session,
            entityId: params['entityId'],
            tableType: params['tableType'],
          ),
        )
      },
    );
    connectors['fieldSuggestion'] = _i1.EndpointConnector(
      name: 'fieldSuggestion',
      endpoint: endpoints['fieldSuggestion']!,
      methodConnectors: {
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'fieldKey': _i1.ParameterDescription(
              name: 'fieldKey',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'searchTerm': _i1.ParameterDescription(
              name: 'searchTerm',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['fieldSuggestion'] as _i9.FieldSuggestionEndpoint)
                  .find(
            session,
            tableType: params['tableType'],
            fieldKey: params['fieldKey'],
            searchTerm: params['searchTerm'],
          ),
        )
      },
    );
    connectors['globalSettings'] = _i1.EndpointConnector(
      name: 'globalSettings',
      endpoint: endpoints['globalSettings']!,
      methodConnectors: {
        'fetchSettings': _i1.MethodConnector(
          name: 'fetchSettings',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .fetchSettings(session),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'settings': _i1.ParameterDescription(
              name: 'settings',
              type: _i1.getType<_i60.GlobalSettingsDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .update(
            session,
            settings: params['settings'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'releaseOnClose': _i1.ParameterDescription(
              name: 'releaseOnClose',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
            releaseOnClose: params['releaseOnClose'],
          ),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['globalSettings'] as _i10.GlobalSettingsEndpoint)
                  .watch(session),
        ),
      },
    );
    connectors['serviceUser'] = _i1.EndpointConnector(
      name: 'serviceUser',
      endpoint: endpoints['serviceUser']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint).create(
            session,
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'serviceUser': _i1.ParameterDescription(
              name: 'serviceUser',
              type: _i1.getType<_i61.ServiceUserDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint).update(
            session,
            serviceUser: params['serviceUser'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint).delete(
            session,
            userId: params['userId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['serviceUser'] as _i11.ServiceUserEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['serviceUserToken'] = _i1.EndpointConnector(
      name: 'serviceUserToken',
      endpoint: endpoints['serviceUserToken']!,
      methodConnectors: {
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'serviceUserId': _i1.ParameterDescription(
              name: 'serviceUserId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUserToken'] as _i12.ServiceUserTokenEndpoint)
                  .find(
            session,
            serviceUserId: params['serviceUserId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'serviceUserId': _i1.ParameterDescription(
              name: 'serviceUserId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'tokenDescription': _i1.ParameterDescription(
              name: 'tokenDescription',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUserToken'] as _i12.ServiceUserTokenEndpoint)
                  .create(
            session,
            serviceUserId: params['serviceUserId'],
            tokenDescription: params['tokenDescription'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'serviceUserTokenId': _i1.ParameterDescription(
              name: 'serviceUserTokenId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serviceUserToken'] as _i12.ServiceUserTokenEndpoint)
                  .delete(
            session,
            serviceUserTokenId: params['serviceUserTokenId'],
          ),
        ),
      },
    );
    connectors['appClient'] = _i1.EndpointConnector(
      name: 'appClient',
      endpoint: endpoints['appClient']!,
      methodConnectors: {
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).create(
            session,
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i62.AppClientDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).fetchAll(
            session,
            params['sort'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appClient'] as _i13.AppClientEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['appClient'] as _i13.AppClientEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchAll': _i1.MethodStreamConnector(
          name: 'watchAll',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['appClient'] as _i13.AppClientEndpoint)
                  .watchAll(session),
        ),
      },
    );
    connectors['companyDepartment'] = _i1.EndpointConnector(
      name: 'companyDepartment',
      endpoint: endpoints['companyDepartment']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .create(
            session,
            companyId: params['companyId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i63.CompanyDepartmentDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .findEntityLocks(session),
        ),
        'fetchDepartmentsByCompany': _i1.MethodConnector(
          name: 'fetchDepartmentsByCompany',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .fetchDepartmentsByCompany(
            session,
            companyId: params['companyId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchDepartmentsByEmployee': _i1.MethodConnector(
          name: 'fetchDepartmentsByEmployee',
          params: {
            'employeeId': _i1.ParameterDescription(
              name: 'employeeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .fetchDepartmentsByEmployee(
            session,
            employeeId: params['employeeId'],
          ),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchDepartmentsByCompany': _i1.MethodStreamConnector(
          name: 'watchDepartmentsByCompany',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .watchDepartmentsByCompany(
            session,
            companyId: params['companyId'],
          ),
        ),
        'watchDepartmentsByEmployee': _i1.MethodStreamConnector(
          name: 'watchDepartmentsByEmployee',
          params: {
            'employeeId': _i1.ParameterDescription(
              name: 'employeeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyDepartment'] as _i14.CompanyDepartmentEndpoint)
                  .watchDepartmentsByEmployee(
            session,
            employeeId: params['employeeId'],
          ),
        ),
      },
    );
    connectors['companyEmployee'] = _i1.EndpointConnector(
      name: 'companyEmployee',
      endpoint: endpoints['companyEmployee']!,
      methodConnectors: {
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'employeeId': _i1.ParameterDescription(
              name: 'employeeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .create(
            session,
            companyId: params['companyId'],
            employeeId: params['employeeId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'companyEmployee': _i1.ParameterDescription(
              name: 'companyEmployee',
              type: _i1.getType<_i64.CompanyEmployeeDTO>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .update(
            session,
            companyEmployee: params['companyEmployee'],
            release: params['release'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'fetchEmployeesByCompany': _i1.MethodConnector(
          name: 'fetchEmployeesByCompany',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .fetchEmployeesByCompany(
            session,
            companyId: params['companyId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchCompaniesByEmployee': _i1.MethodConnector(
          name: 'fetchCompaniesByEmployee',
          params: {
            'employeeId': _i1.ParameterDescription(
              name: 'employeeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .fetchCompaniesByEmployee(
            session,
            employeeId: params['employeeId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchEmployeesByCompanyAndDepartment': _i1.MethodConnector(
          name: 'fetchEmployeesByCompanyAndDepartment',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'departmentId': _i1.ParameterDescription(
              name: 'departmentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .fetchEmployeesByCompanyAndDepartment(
            session,
            companyId: params['companyId'],
            departmentId: params['departmentId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'addEmployeeToDepartment': _i1.MethodConnector(
          name: 'addEmployeeToDepartment',
          params: {
            'companyEmployeeId': _i1.ParameterDescription(
              name: 'companyEmployeeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'departmentId': _i1.ParameterDescription(
              name: 'departmentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .addEmployeeToDepartment(
            session,
            companyEmployeeId: params['companyEmployeeId'],
            departmentId: params['departmentId'],
          ),
        ),
        'removeEmployeeFromDepartment': _i1.MethodConnector(
          name: 'removeEmployeeFromDepartment',
          params: {
            'companyEmployeeId': _i1.ParameterDescription(
              name: 'companyEmployeeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'departmentId': _i1.ParameterDescription(
              name: 'departmentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .removeEmployeeFromDepartment(
            session,
            companyEmployeeId: params['companyEmployeeId'],
            departmentId: params['departmentId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'companyEmployeeId': _i1.ParameterDescription(
              name: 'companyEmployeeId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .delete(
            session,
            companyEmployeeId: params['companyEmployeeId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchEmployessByCompany': _i1.MethodStreamConnector(
          name: 'watchEmployessByCompany',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .watchEmployessByCompany(
            session,
            companyId: params['companyId'],
          ),
        ),
        'watchEmployeeByCompanyUpdates': _i1.MethodStreamConnector(
          name: 'watchEmployeeByCompanyUpdates',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .watchEmployeeByCompanyUpdates(
            session,
            companyId: params['companyId'],
            filter: params['filter'],
          ),
        ),
        'watchCompaniesByEmployee': _i1.MethodStreamConnector(
          name: 'watchCompaniesByEmployee',
          params: {
            'employeeId': _i1.ParameterDescription(
              name: 'employeeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .watchCompaniesByEmployee(
            session,
            employeeId: params['employeeId'],
          ),
        ),
        'watchEmployeesByCompanyAndDepartment': _i1.MethodStreamConnector(
          name: 'watchEmployeesByCompanyAndDepartment',
          params: {
            'companyId': _i1.ParameterDescription(
              name: 'companyId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'departmentId': _i1.ParameterDescription(
              name: 'departmentId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .watchEmployeesByCompanyAndDepartment(
            session,
            companyId: params['companyId'],
            departmentId: params['departmentId'],
          ),
        ),
        'watchEmployeesByDepartmentDeletion': _i1.MethodStreamConnector(
          name: 'watchEmployeesByDepartmentDeletion',
          params: {
            'departmentId': _i1.ParameterDescription(
              name: 'departmentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .watchEmployeesByDepartmentDeletion(
            session,
            departmentId: params['departmentId'],
          ),
        ),
        'watchEmployeeRemovalsFromAnyDepartment': _i1.MethodStreamConnector(
          name: 'watchEmployeeRemovalsFromAnyDepartment',
          params: {
            'employeeId': _i1.ParameterDescription(
              name: 'employeeId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['companyEmployee'] as _i15.CompanyEmployeeEndpoint)
                  .watchEmployeeRemovalsFromAnyDepartment(
            session,
            employeeId: params['employeeId'],
          ),
        ),
      },
    );
    connectors['contact'] = _i1.EndpointConnector(
      name: 'contact',
      endpoint: endpoints['contact']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'type': _i1.ParameterDescription(
              name: 'type',
              type: _i1.getType<_i65.ContactType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).create(
            session,
            sessionId: params['sessionId'],
            type: params['type'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'findSpotlight': _i1.MethodConnector(
          name: 'findSpotlight',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).findSpotlight(
            session,
            query: params['query'],
          ),
        ),
        'findContactPropertyValues': _i1.MethodConnector(
          name: 'findContactPropertyValues',
          params: {
            'field': _i1.ParameterDescription(
              name: 'field',
              type: _i1.getType<_i66.ContactField>(),
              nullable: false,
            ),
            'searchTerm': _i1.ParameterDescription(
              name: 'searchTerm',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint)
                  .findContactPropertyValues(
            session,
            params['field'],
            params['searchTerm'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findCompanies': _i1.MethodConnector(
          name: 'findCompanies',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).findCompanies(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findPersons': _i1.MethodConnector(
          name: 'findPersons',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).findPersons(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i67.ContactDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint).delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['contact'] as _i16.ContactEndpoint)
                  .findEntityLocks(session),
        ),
        'watcEntityCard': _i1.MethodStreamConnector(
          name: 'watcEntityCard',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'releaseOnClose': _i1.ParameterDescription(
              name: 'releaseOnClose',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['contact'] as _i16.ContactEndpoint).watcEntityCard(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
            releaseOnClose: params['releaseOnClose'],
          ),
        ),
        'watchUpdates': _i1.MethodStreamConnector(
          name: 'watchUpdates',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['contact'] as _i16.ContactEndpoint).watchUpdates(
            session,
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['countryCode'] = _i1.EndpointConnector(
      name: 'countryCode',
      endpoint: endpoints['countryCode']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'countryCode': _i1.ParameterDescription(
              name: 'countryCode',
              type: _i1.getType<_i68.CountryCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint).create(
            session,
            countryCode: params['countryCode'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
            id: params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'countryCode': _i1.ParameterDescription(
              name: 'countryCode',
              type: _i1.getType<_i68.CountryCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint).update(
            session,
            countryCode: params['countryCode'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchAll': _i1.MethodStreamConnector(
          name: 'watchAll',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['countryCode'] as _i17.CountryCodeEndpoint)
                  .watchAll(session),
        ),
      },
    );
    connectors['crmEvent'] = _i1.EndpointConnector(
      name: 'crmEvent',
      endpoint: endpoints['crmEvent']!,
      methodConnectors: {
        'validateEventContactFilter': _i1.MethodConnector(
          name: 'validateEventContactFilter',
          params: {
            'contactId': _i1.ParameterDescription(
              name: 'contactId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .validateEventContactFilter(
            session,
            contactId: params['contactId'],
            filter: params['filter'],
          ),
        ),
        'fetchContactsInEvent': _i1.MethodConnector(
          name: 'fetchContactsInEvent',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .fetchContactsInEvent(
            session,
            eventId: params['eventId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchContactsNotInEvent': _i1.MethodConnector(
          name: 'fetchContactsNotInEvent',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .fetchContactsNotInEvent(
            session,
            eventId: params['eventId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i69.CrmEventDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'addContactsToEvent': _i1.MethodConnector(
          name: 'addContactsToEvent',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'contactIds': _i1.ParameterDescription(
              name: 'contactIds',
              type: _i1.getType<List<int>>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .addContactsToEvent(
            session,
            eventId: params['eventId'],
            contactIds: params['contactIds'],
            sessionId: params['sessionId'],
          ),
        ),
        'deleteContactFromEvent': _i1.MethodConnector(
          name: 'deleteContactFromEvent',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'contactId': _i1.ParameterDescription(
              name: 'contactId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .deleteContactFromEvent(
            session,
            eventId: params['eventId'],
            contactId: params['contactId'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i69.CrmEventDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .findEntityLocks(session),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchContactDeletions': _i1.MethodStreamConnector(
          name: 'watchContactDeletions',
          params: {
            'eventId': _i1.ParameterDescription(
              name: 'eventId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .watchContactDeletions(
            session,
            eventId: params['eventId'],
          ),
        ),
        'watchEventContactsWithFilter': _i1.MethodStreamConnector(
          name: 'watchEventContactsWithFilter',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .watchEventContactsWithFilter(
            session,
            entityId: params['entityId'],
            filter: params['filter'],
          ),
        ),
        'watchAll': _i1.MethodStreamConnector(
          name: 'watchAll',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['crmEvent'] as _i18.CrmEventEndpoint)
                  .watchAll(session),
        ),
      },
    );
    connectors['customer'] = _i1.EndpointConnector(
      name: 'customer',
      endpoint: endpoints['customer']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findSpotlight': _i1.MethodConnector(
          name: 'findSpotlight',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).findSpotlight(
            session,
            query: params['query'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'contact': _i1.ParameterDescription(
              name: 'contact',
              type: _i1.getType<_i67.ContactDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).create(
            session,
            params['contact'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).delete(
            session,
            customerId: params['customerId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).fetchAndLock(
            session,
            id: params['id'],
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i70.CustomerDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'addShippingAddress': _i1.MethodConnector(
          name: 'addShippingAddress',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'contactId': _i1.ParameterDescription(
              name: 'contactId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint)
                  .addShippingAddress(
            session,
            customerId: params['customerId'],
            contactId: params['contactId'],
          ),
        ),
        'deleteShippingAddress': _i1.MethodConnector(
          name: 'deleteShippingAddress',
          params: {
            'customerShippingContact': _i1.ParameterDescription(
              name: 'customerShippingContact',
              type: _i1.getType<_i71.CustomerShippingContactDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint)
                  .deleteShippingAddress(
            session,
            customerShippingContact: params['customerShippingContact'],
          ),
        ),
        'fetchBillingAddresses': _i1.MethodConnector(
          name: 'fetchBillingAddresses',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint)
                  .fetchBillingAddresses(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'addBillingAddress': _i1.MethodConnector(
          name: 'addBillingAddress',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerCustomerId': _i1.ParameterDescription(
              name: 'customerCustomerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'isPrimary': _i1.ParameterDescription(
              name: 'isPrimary',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint)
                  .addBillingAddress(
            session,
            customerId: params['customerId'],
            customerCustomerId: params['customerCustomerId'],
            isPrimary: params['isPrimary'],
          ),
        ),
        'deleteBillingAddress': _i1.MethodConnector(
          name: 'deleteBillingAddress',
          params: {
            'customerBillingCustomer': _i1.ParameterDescription(
              name: 'customerBillingCustomer',
              type: _i1.getType<_i72.CustomerBillingCustomerDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint)
                  .deleteBillingAddress(
            session,
            customerBillingCustomer: params['customerBillingCustomer'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customer'] as _i19.CustomerEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['customer'] as _i19.CustomerEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['shippingMethod'] = _i1.EndpointConnector(
      name: 'shippingMethod',
      endpoint: endpoints['shippingMethod']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i73.ShippingMethodDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
            id: params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i73.ShippingMethodDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchAll': _i1.MethodStreamConnector(
          name: 'watchAll',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['shippingMethod'] as _i20.ShippingMethodEndpoint)
                  .watchAll(session),
        ),
      },
    );
    connectors['customerBillingCustomer'] = _i1.EndpointConnector(
      name: 'customerBillingCustomer',
      endpoint: endpoints['customerBillingCustomer']!,
      methodConnectors: {
        'markAsPrimary': _i1.MethodConnector(
          name: 'markAsPrimary',
          params: {
            'customerBillingCustomer': _i1.ParameterDescription(
              name: 'customerBillingCustomer',
              type: _i1.getType<_i72.CustomerBillingCustomerDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .markAsPrimary(
            session,
            customerBillingCustomer: params['customerBillingCustomer'],
          ),
        ),
        'removeAsPrimary': _i1.MethodConnector(
          name: 'removeAsPrimary',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .removeAsPrimary(
            session,
            customerId: params['customerId'],
          ),
        ),
        'fetchBillingCustomers': _i1.MethodConnector(
          name: 'fetchBillingCustomers',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .fetchBillingCustomers(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetch': _i1.MethodConnector(
          name: 'fetch',
          params: {
            'customerBillingCustomerId': _i1.ParameterDescription(
              name: 'customerBillingCustomerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .fetch(
            session,
            params['customerBillingCustomerId'],
          ),
        ),
        'deleteBillingAddress': _i1.MethodConnector(
          name: 'deleteBillingAddress',
          params: {
            'customerBillingCustomerId': _i1.ParameterDescription(
              name: 'customerBillingCustomerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .deleteBillingAddress(
            session,
            customerBillingCustomerId: params['customerBillingCustomerId'],
          ),
        ),
        'isBillingAddressAssigned': _i1.MethodConnector(
          name: 'isBillingAddressAssigned',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'billingCustomerId': _i1.ParameterDescription(
              name: 'billingCustomerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .isBillingAddressAssigned(
            session,
            customerId: params['customerId'],
            billingCustomerId: params['billingCustomerId'],
          ),
        ),
        'watchByCustomer': _i1.MethodStreamConnector(
          name: 'watchByCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .watchByCustomer(
            session,
            customerId: params['customerId'],
          ),
        ),
        'watchDeletionsByCustomer': _i1.MethodStreamConnector(
          name: 'watchDeletionsByCustomer',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['customerBillingCustomer']
                      as _i21.CustomerBillingCustomerEndpoint)
                  .watchDeletionsByCustomer(session),
        ),
      },
    );
    connectors['customerCustomer'] = _i1.EndpointConnector(
      name: 'customerCustomer',
      endpoint: endpoints['customerCustomer']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'customer': _i1.ParameterDescription(
              name: 'customer',
              type: _i1.getType<_i70.CustomerDTO>(),
              nullable: false,
            ),
            'customerCustomerContact': _i1.ParameterDescription(
              name: 'customerCustomerContact',
              type: _i1.getType<_i67.ContactDTO>(),
              nullable: false,
            ),
            'isPrimary': _i1.ParameterDescription(
              name: 'isPrimary',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerCustomer'] as _i22.CustomerCustomerEndpoint)
                  .create(
            session,
            customer: params['customer'],
            customerCustomerContact: params['customerCustomerContact'],
            isPrimary: params['isPrimary'],
          ),
        ),
        'fetchCustomerCustomers': _i1.MethodConnector(
          name: 'fetchCustomerCustomers',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerCustomer'] as _i22.CustomerCustomerEndpoint)
                  .fetchCustomerCustomers(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findById': _i1.MethodConnector(
          name: 'findById',
          params: {
            'customerCustomerId': _i1.ParameterDescription(
              name: 'customerCustomerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerCustomer'] as _i22.CustomerCustomerEndpoint)
                  .findById(
            session,
            customerCustomerId: params['customerCustomerId'],
          ),
        ),
        'deleteCustomerCustomer': _i1.MethodConnector(
          name: 'deleteCustomerCustomer',
          params: {
            'customerCustomerId': _i1.ParameterDescription(
              name: 'customerCustomerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerCustomer'] as _i22.CustomerCustomerEndpoint)
                  .deleteCustomerCustomer(
            session,
            customerCustomerId: params['customerCustomerId'],
          ),
        ),
        'addCustomerCustomer': _i1.MethodConnector(
          name: 'addCustomerCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerCustomerContactId': _i1.ParameterDescription(
              name: 'customerCustomerContactId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerCustomer'] as _i22.CustomerCustomerEndpoint)
                  .addCustomerCustomer(
            session,
            customerId: params['customerId'],
            customerCustomerContactId: params['customerCustomerContactId'],
          ),
        ),
        'watchForCustomerList': _i1.MethodStreamConnector(
          name: 'watchForCustomerList',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['customerCustomer'] as _i22.CustomerCustomerEndpoint)
                  .watchForCustomerList(
            session,
            customerId: params['customerId'],
          ),
        ),
      },
    );
    connectors['customerShippingContacts'] = _i1.EndpointConnector(
      name: 'customerShippingContacts',
      endpoint: endpoints['customerShippingContacts']!,
      methodConnectors: {
        'fetch': _i1.MethodConnector(
          name: 'fetch',
          params: {
            'customerShippingContactId': _i1.ParameterDescription(
              name: 'customerShippingContactId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerShippingContacts']
                      as _i23.CustomerShippingContactsEndpoint)
                  .fetch(
            session,
            params['customerShippingContactId'],
          ),
        ),
        'fetchShippingContacts': _i1.MethodConnector(
          name: 'fetchShippingContacts',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerShippingContacts']
                      as _i23.CustomerShippingContactsEndpoint)
                  .fetchShippingContacts(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'markAsPrimary': _i1.MethodConnector(
          name: 'markAsPrimary',
          params: {
            'customerShippingContact': _i1.ParameterDescription(
              name: 'customerShippingContact',
              type: _i1.getType<_i71.CustomerShippingContactDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerShippingContacts']
                      as _i23.CustomerShippingContactsEndpoint)
                  .markAsPrimary(
            session,
            customerShippingContact: params['customerShippingContact'],
          ),
        ),
        'removeAsPrimary': _i1.MethodConnector(
          name: 'removeAsPrimary',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerShippingContacts']
                      as _i23.CustomerShippingContactsEndpoint)
                  .removeAsPrimary(
            session,
            customerId: params['customerId'],
          ),
        ),
        'deleteShippingAddress': _i1.MethodConnector(
          name: 'deleteShippingAddress',
          params: {
            'customerShippingContactId': _i1.ParameterDescription(
              name: 'customerShippingContactId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['customerShippingContacts']
                      as _i23.CustomerShippingContactsEndpoint)
                  .deleteShippingAddress(
            session,
            customerShippingContactId: params['customerShippingContactId'],
          ),
        ),
        'watchByCustomer': _i1.MethodStreamConnector(
          name: 'watchByCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['customerShippingContacts']
                      as _i23.CustomerShippingContactsEndpoint)
                  .watchByCustomer(
            session,
            customerId: params['customerId'],
          ),
        ),
        'watchDeletionsByCustomer': _i1.MethodStreamConnector(
          name: 'watchDeletionsByCustomer',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['customerShippingContacts']
                      as _i23.CustomerShippingContactsEndpoint)
                  .watchDeletionsByCustomer(session),
        ),
      },
    );
    connectors['departmentCode'] = _i1.EndpointConnector(
      name: 'departmentCode',
      endpoint: endpoints['departmentCode']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i74.DepartmentCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i74.DepartmentCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['departmentCode'] as _i24.DepartmentCodeEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['languageCode'] = _i1.EndpointConnector(
      name: 'languageCode',
      endpoint: endpoints['languageCode']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i75.LanguageCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint).create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i75.LanguageCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchAll': _i1.MethodStreamConnector(
          name: 'watchAll',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['languageCode'] as _i25.LanguageCodeEndpoint)
                  .watchAll(session),
        ),
      },
    );
    connectors['paymentCode'] = _i1.EndpointConnector(
      name: 'paymentCode',
      endpoint: endpoints['paymentCode']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i76.PaymentCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint).create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
            id: params['id'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i76.PaymentCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchAll': _i1.MethodStreamConnector(
          name: 'watchAll',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['paymentCode'] as _i26.PaymentCodeEndpoint)
                  .watchAll(session),
        ),
      },
    );
    connectors['salutationCode'] = _i1.EndpointConnector(
      name: 'salutationCode',
      endpoint: endpoints['salutationCode']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i77.SalutationCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .fetchById(
            session,
            params['entityId'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i77.SalutationCodeDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchAll': _i1.MethodStreamConnector(
          name: 'watchAll',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['salutationCode'] as _i27.SalutationCodeEndpoint)
                  .watchAll(session),
        ),
      },
    );
    connectors['artwork'] = _i1.EndpointConnector(
      name: 'artwork',
      endpoint: endpoints['artwork']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchCustomerId': _i1.MethodConnector(
          name: 'fetchCustomerId',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).fetchCustomerId(
            session,
            params['id'],
          ),
        ),
        'fetchReadOnly': _i1.MethodConnector(
          name: 'fetchReadOnly',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).fetchReadOnly(
            session,
            params['id'],
          ),
        ),
        'fetchBySalesOrderId': _i1.MethodConnector(
          name: 'fetchBySalesOrderId',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint)
                  .fetchBySalesOrderId(
            session,
            params['salesOrderId'],
          ),
        ),
        'fetchHistory': _i1.MethodConnector(
          name: 'fetchHistory',
          params: {
            'artworkMasterId': _i1.ParameterDescription(
              name: 'artworkMasterId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).fetchHistory(
            session,
            params['artworkMasterId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i78.ArtworkDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchArtworkLayerNames': _i1.MethodConnector(
          name: 'fetchArtworkLayerNames',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint)
                  .fetchArtworkLayerNames(session),
        ),
        'fetchAllArtworksFromCustomer': _i1.MethodConnector(
          name: 'fetchAllArtworksFromCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint)
                  .fetchAllArtworksFromCustomer(
            session,
            params['customerId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'releaseOnClose': _i1.ParameterDescription(
              name: 'releaseOnClose',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
            releaseOnClose: params['releaseOnClose'],
          ),
        ),
        'watchForSalesOrder': _i1.MethodStreamConnector(
          name: 'watchForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint).watchForSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'watchDeletionsForSalesOrder': _i1.MethodStreamConnector(
          name: 'watchDeletionsForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artwork'] as _i28.ArtworkEndpoint)
                  .watchDeletionsForSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
      },
    );
    connectors['artworkLog'] = _i1.EndpointConnector(
      name: 'artworkLog',
      endpoint: endpoints['artworkLog']!,
      methodConnectors: {
        'fetchArtworkLogs': _i1.MethodConnector(
          name: 'fetchArtworkLogs',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<_i59.TableType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkLog'] as _i29.ArtworkLogEndpoint)
                  .fetchArtworkLogs(
            session,
            entityId: params['entityId'],
            tableType: params['tableType'],
          ),
        )
      },
    );
    connectors['artworkMaster'] = _i1.EndpointConnector(
      name: 'artworkMaster',
      endpoint: endpoints['artworkMaster']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkMaster'] as _i30.ArtworkMasterEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchForCreation': _i1.MethodConnector(
          name: 'fetchForCreation',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkMaster'] as _i30.ArtworkMasterEndpoint)
                  .fetchForCreation(
            session,
            params['id'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkMaster'] as _i30.ArtworkMasterEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findByCustomer': _i1.MethodConnector(
          name: 'findByCustomer',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkMaster'] as _i30.ArtworkMasterEndpoint)
                  .findByCustomer(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAllArtworksFromCustomer': _i1.MethodConnector(
          name: 'fetchAllArtworksFromCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkMaster'] as _i30.ArtworkMasterEndpoint)
                  .fetchAllArtworksFromCustomer(
            session,
            params['customerId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkMaster'] as _i30.ArtworkMasterEndpoint)
                  .findEntityLocks(session),
        ),
      },
    );
    connectors['artworkQuarantine'] = _i1.EndpointConnector(
      name: 'artworkQuarantine',
      endpoint: endpoints['artworkQuarantine']!,
      methodConnectors: {
        'fetchByGroupId': _i1.MethodConnector(
          name: 'fetchByGroupId',
          params: {
            'groupId': _i1.ParameterDescription(
              name: 'groupId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .fetchByGroupId(
            session,
            params['groupId'],
          ),
        ),
        'fetchByGroupIdAndStatus': _i1.MethodConnector(
          name: 'fetchByGroupIdAndStatus',
          params: {
            'groupId': _i1.ParameterDescription(
              name: 'groupId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i79.ArtworkQuarantineGroupStatus>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .fetchByGroupIdAndStatus(
            session,
            params['groupId'],
            params['status'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i80.ArtworkQuarantineDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'createFromDateneingang': _i1.MethodConnector(
          name: 'createFromDateneingang',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkQuarantine': _i1.ParameterDescription(
              name: 'artworkQuarantine',
              type: _i1.getType<_i80.ArtworkQuarantineDTO>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .createFromDateneingang(
            session,
            customerId: params['customerId'],
            artworkQuarantine: params['artworkQuarantine'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchByCustomerId': _i1.MethodConnector(
          name: 'fetchByCustomerId',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .fetchByCustomerId(
            session,
            params['customerId'],
          ),
        ),
        'deleteFromArtworkCreation': _i1.MethodConnector(
          name: 'deleteFromArtworkCreation',
          params: {
            'artworkQuarantineId': _i1.ParameterDescription(
              name: 'artworkQuarantineId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .deleteFromArtworkCreation(
            session,
            params['artworkQuarantineId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .findEntityLocks(session),
        ),
        'mockAEwebhookWithQuarantineXml': _i1.MethodConnector(
          name: 'mockAEwebhookWithQuarantineXml',
          params: {
            'xmlContent': _i1.ParameterDescription(
              name: 'xmlContent',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .mockAEwebhookWithQuarantineXml(
            session,
            params['xmlContent'],
          ),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'releaseOnClose': _i1.ParameterDescription(
              name: 'releaseOnClose',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
            releaseOnClose: params['releaseOnClose'],
          ),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchDeleted': _i1.MethodStreamConnector(
          name: 'watchDeleted',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .watchDeleted(session),
        ),
        'watchCustomerQuarantines': _i1.MethodStreamConnector(
          name: 'watchCustomerQuarantines',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .watchCustomerQuarantines(
            session,
            customerId: params['customerId'],
          ),
        ),
        'watchAllQuarantines': _i1.MethodStreamConnector(
          name: 'watchAllQuarantines',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantine'] as _i31.ArtworkQuarantineEndpoint)
                  .watchAllQuarantines(session),
        ),
      },
    );
    connectors['artworkQuarantineGroup'] = _i1.EndpointConnector(
      name: 'artworkQuarantineGroup',
      endpoint: endpoints['artworkQuarantineGroup']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .create(
            session,
            sessionId: params['sessionId'],
            customerId: params['customerId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'group': _i1.ParameterDescription(
              name: 'group',
              type: _i1.getType<_i81.ArtworkQuarantineGroupDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .update(
            session,
            group: params['group'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchByCustomerId': _i1.MethodConnector(
          name: 'fetchByCustomerId',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .fetchByCustomerId(
            session,
            params['customerId'],
          ),
        ),
        'fetchByStatus': _i1.MethodConnector(
          name: 'fetchByStatus',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i79.ArtworkQuarantineGroupStatus>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .fetchByStatus(
            session,
            params['status'],
          ),
        ),
        'fetchGroupsByCustomerIdAndStatus': _i1.MethodConnector(
          name: 'fetchGroupsByCustomerIdAndStatus',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i79.ArtworkQuarantineGroupStatus>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .fetchGroupsByCustomerIdAndStatus(
            session,
            customerId: params['customerId'],
            status: params['status'],
          ),
        ),
        'fetchQuarantinesByCustomerIdAndStatus': _i1.MethodConnector(
          name: 'fetchQuarantinesByCustomerIdAndStatus',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i79.ArtworkQuarantineGroupStatus>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .fetchQuarantinesByCustomerIdAndStatus(
            session,
            customerId: params['customerId'],
            status: params['status'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'setDeleted': _i1.MethodConnector(
          name: 'setDeleted',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i81.ArtworkQuarantineGroupDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .setDeleted(
            session,
            params['entity'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchAllGroups': _i1.MethodStreamConnector(
          name: 'watchAllGroups',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .watchAllGroups(session),
        ),
        'watchCustomerGroups': _i1.MethodStreamConnector(
          name: 'watchCustomerGroups',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .watchCustomerGroups(
            session,
            customerId: params['customerId'],
          ),
        ),
        'watchGroupsByStatus': _i1.MethodStreamConnector(
          name: 'watchGroupsByStatus',
          params: {
            'status': _i1.ParameterDescription(
              name: 'status',
              type: _i1.getType<_i79.ArtworkQuarantineGroupStatus>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkQuarantineGroup']
                      as _i32.ArtworkQuarantineGroupEndpoint)
                  .watchGroupsByStatus(
            session,
            status: params['status'],
          ),
        ),
      },
    );
    connectors['artworkTemplate'] = _i1.EndpointConnector(
      name: 'artworkTemplate',
      endpoint: endpoints['artworkTemplate']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'preSelectionId': _i1.ParameterDescription(
              name: 'preSelectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'selectionId': _i1.ParameterDescription(
              name: 'selectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .create(
            session,
            customerId: params['customerId'],
            preSelectionId: params['preSelectionId'],
            selectionId: params['selectionId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findByCustomer': _i1.MethodConnector(
          name: 'findByCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
            'includeGeneralTemplates': _i1.ParameterDescription(
              name: 'includeGeneralTemplates',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .findByCustomer(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
            includeGeneralTemplates: params['includeGeneralTemplates'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i82.ArtworkTemplateDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchCustomerUpdates': _i1.MethodStreamConnector(
          name: 'watchCustomerUpdates',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {
            'stream': _i1.StreamParameterDescription<_i82.ArtworkTemplateDTO>(
              name: 'stream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkTemplate'] as _i33.ArtworkTemplateEndpoint)
                  .watchCustomerUpdates(
            session,
            streamParams['stream']!.cast<_i82.ArtworkTemplateDTO>(),
            customerId: params['customerId'],
          ),
        ),
      },
    );
    connectors['artworkTemplatePreSelection'] = _i1.EndpointConnector(
      name: 'artworkTemplatePreSelection',
      endpoint: endpoints['artworkTemplatePreSelection']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i83.ArtworkTemplatePreSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i83.ArtworkTemplatePreSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'fetchByCustomerId': _i1.MethodConnector(
          name: 'fetchByCustomerId',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .fetchByCustomerId(
            session,
            params['customerId'],
          ),
        ),
        'fetchGlobal': _i1.MethodConnector(
          name: 'fetchGlobal',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .fetchGlobal(session),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchPreSelection': _i1.MethodStreamConnector(
          name: 'watchPreSelection',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkTemplatePreSelection']
                      as _i34.ArtworkTemplatePreSelectionEndpoint)
                  .watchPreSelection(
            session,
            customerId: params['customerId'],
          ),
        ),
      },
    );
    connectors['artworkTemplateSelection'] = _i1.EndpointConnector(
      name: 'artworkTemplateSelection',
      endpoint: endpoints['artworkTemplateSelection']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i84.ArtworkTemplateSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i84.ArtworkTemplateSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'fetchFromPreSelection': _i1.MethodConnector(
          name: 'fetchFromPreSelection',
          params: {
            'preSelectionId': _i1.ParameterDescription(
              name: 'preSelectionId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .fetchFromPreSelection(
            session,
            params['preSelectionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchSelection': _i1.MethodStreamConnector(
          name: 'watchSelection',
          params: {
            'preSelectionId': _i1.ParameterDescription(
              name: 'preSelectionId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkTemplateSelection']
                      as _i35.ArtworkTemplateSelectionEndpoint)
                  .watchSelection(
            session,
            preSelectionId: params['preSelectionId'],
          ),
        ),
      },
    );
    connectors['artworkColor'] = _i1.EndpointConnector(
      name: 'artworkColor',
      endpoint: endpoints['artworkColor']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'colorPaletteId': _i1.ParameterDescription(
              name: 'colorPaletteId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint).create(
            session,
            sessionId: params['sessionId'],
            colorPaletteId: params['colorPaletteId'],
          ),
        ),
        'createFromCsv': _i1.MethodConnector(
          name: 'createFromCsv',
          params: {
            'artworkColor': _i1.ParameterDescription(
              name: 'artworkColor',
              type: _i1.getType<_i85.ArtworkColorDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .createFromCsv(
            session,
            artworkColor: params['artworkColor'],
          ),
        ),
        'importColors': _i1.MethodConnector(
          name: 'importColors',
          params: {
            'artworkColors': _i1.ParameterDescription(
              name: 'artworkColors',
              type: _i1.getType<List<_i85.ArtworkColorDTO>>(),
              nullable: false,
            ),
            'paletteName': _i1.ParameterDescription(
              name: 'paletteName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .importColors(
            session,
            artworkColors: params['artworkColors'],
            paletteName: params['paletteName'],
            customerId: params['customerId'],
          ),
        ),
        'addColorsToPalette': _i1.MethodConnector(
          name: 'addColorsToPalette',
          params: {
            'artworkColors': _i1.ParameterDescription(
              name: 'artworkColors',
              type: _i1.getType<List<_i85.ArtworkColorDTO>>(),
              nullable: false,
            ),
            'paletteId': _i1.ParameterDescription(
              name: 'paletteId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .addColorsToPalette(
            session,
            artworkColors: params['artworkColors'],
            paletteId: params['paletteId'],
          ),
        ),
        'findByShortName': _i1.MethodConnector(
          name: 'findByShortName',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'shortName': _i1.ParameterDescription(
              name: 'shortName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .findByShortName(
            session,
            customerId: params['customerId'],
            shortName: params['shortName'],
          ),
        ),
        'updateShortName': _i1.MethodConnector(
          name: 'updateShortName',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'shortName': _i1.ParameterDescription(
              name: 'shortName',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .updateShortName(
            session,
            entityId: params['entityId'],
            shortName: params['shortName'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findAllByCustomerId': _i1.MethodConnector(
          name: 'findAllByCustomerId',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .findAllByCustomerId(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchColorPaletteColors': _i1.MethodConnector(
          name: 'fetchColorPaletteColors',
          params: {
            'colorPaletteId': _i1.ParameterDescription(
              name: 'colorPaletteId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .fetchColorPaletteColors(
            session,
            colorPaletteId: params['colorPaletteId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i85.ArtworkColorDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint).delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artworkColor'] as _i36.ArtworkColorEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['prepressColorPalette'] = _i1.EndpointConnector(
      name: 'prepressColorPalette',
      endpoint: endpoints['prepressColorPalette']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .create(
            session,
            sessionId: params['sessionId'],
            customerId: params['customerId'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchGlobalAndCustomerColorBooks': _i1.MethodConnector(
          name: 'fetchGlobalAndCustomerColorBooks',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .fetchGlobalAndCustomerColorBooks(
            session,
            customerId: params['customerId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i86.PrepressColorPaletteDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'colorBookExists': _i1.MethodConnector(
          name: 'colorBookExists',
          params: {
            'paletteName': _i1.ParameterDescription(
              name: 'paletteName',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .colorBookExists(
            session,
            paletteName: params['paletteName'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['prepressColorPalette']
                      as _i37.PrepressColorPaletteEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['drucklayout'] = _i1.EndpointConnector(
      name: 'drucklayout',
      endpoint: endpoints['drucklayout']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'preSelectionId': _i1.ParameterDescription(
              name: 'preSelectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'selectionId': _i1.ParameterDescription(
              name: 'selectionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint).create(
            session,
            sessionId: params['sessionId'],
            release: params['release'],
            salesOrderId: params['salesOrderId'],
            customerId: params['customerId'],
            preSelectionId: params['preSelectionId'],
            selectionId: params['selectionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i87.DrucklayoutDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint).delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'fetchBySalesOrder': _i1.MethodConnector(
          name: 'fetchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .fetchBySalesOrder(
            session,
            params['salesOrderId'],
          ),
        ),
        'findDrucklayoutsByCustomer': _i1.MethodConnector(
          name: 'findDrucklayoutsByCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .findDrucklayoutsByCustomer(
            session,
            customerId: params['customerId'],
            sessionId: params['sessionId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchByArtworkAndSalesOrder': _i1.MethodConnector(
          name: 'fetchByArtworkAndSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .fetchByArtworkAndSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
            artworkId: params['artworkId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .findEntityLocks(session),
        ),
        'assignNutzenlayouts': _i1.MethodConnector(
          name: 'assignNutzenlayouts',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'drucklayoutId': _i1.ParameterDescription(
              name: 'drucklayoutId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'nutzenlayoutIds': _i1.ParameterDescription(
              name: 'nutzenlayoutIds',
              type: _i1.getType<Set<int>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .assignNutzenlayouts(
            session,
            sessionId: params['sessionId'],
            drucklayoutId: params['drucklayoutId'],
            salesOrderId: params['salesOrderId'],
            nutzenlayoutIds: params['nutzenlayoutIds'],
          ),
        ),
        'fetchAssignedNutzenlayouts': _i1.MethodConnector(
          name: 'fetchAssignedNutzenlayouts',
          params: {
            'drucklayoutId': _i1.ParameterDescription(
              name: 'drucklayoutId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .fetchAssignedNutzenlayouts(
                    session,
                    drucklayoutId: params['drucklayoutId'],
                    salesOrderId: params['salesOrderId'],
                  )
                  .then((record) => _i55.mapRecordToJson(record)),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchBySalesOrder': _i1.MethodStreamConnector(
          name: 'watchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .watchBySalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'watchByCustomer': _i1.MethodStreamConnector(
          name: 'watchByCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['drucklayout'] as _i38.DrucklayoutEndpoint)
                  .watchByCustomer(
            session,
            customerId: params['customerId'],
          ),
        ),
      },
    );
    connectors['drucklayoutPreSelection'] = _i1.EndpointConnector(
      name: 'drucklayoutPreSelection',
      endpoint: endpoints['drucklayoutPreSelection']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i88.DrucklayoutPreSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i88.DrucklayoutPreSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'fetchByCustomerId': _i1.MethodConnector(
          name: 'fetchByCustomerId',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .fetchByCustomerId(
            session,
            params['customerId'],
          ),
        ),
        'fetchGlobal': _i1.MethodConnector(
          name: 'fetchGlobal',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .fetchGlobal(session),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchPreSelection': _i1.MethodStreamConnector(
          name: 'watchPreSelection',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['drucklayoutPreSelection']
                      as _i39.DrucklayoutPreSelectionEndpoint)
                  .watchPreSelection(
            session,
            customerId: params['customerId'],
          ),
        ),
      },
    );
    connectors['drucklayoutSelection'] = _i1.EndpointConnector(
      name: 'drucklayoutSelection',
      endpoint: endpoints['drucklayoutSelection']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i89.DrucklayoutSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .create(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .fetchAll(session),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i89.DrucklayoutSelectionDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'fetchFromPreSelection': _i1.MethodConnector(
          name: 'fetchFromPreSelection',
          params: {
            'preSelectionId': _i1.ParameterDescription(
              name: 'preSelectionId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .fetchFromPreSelection(
            session,
            params['preSelectionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchSelection': _i1.MethodStreamConnector(
          name: 'watchSelection',
          params: {
            'preSelectionId': _i1.ParameterDescription(
              name: 'preSelectionId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['drucklayoutSelection']
                      as _i40.DrucklayoutSelectionEndpoint)
                  .watchSelection(
            session,
            preSelectionId: params['preSelectionId'],
          ),
        ),
      },
    );
    connectors['nutzenLayout'] = _i1.EndpointConnector(
      name: 'nutzenLayout',
      endpoint: endpoints['nutzenLayout']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'nutzenlayoutId': _i1.ParameterDescription(
              name: 'nutzenlayoutId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .fetchById(
            session,
            nutzenlayoutId: params['nutzenlayoutId'],
          ),
        ),
        'fetchSingleBySalesOrderId': _i1.MethodConnector(
          name: 'fetchSingleBySalesOrderId',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .fetchSingleBySalesOrderId(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'fetchMultiBySalesOrderId': _i1.MethodConnector(
          name: 'fetchMultiBySalesOrderId',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .fetchMultiBySalesOrderId(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'fetchSingleWithArtworkIds': _i1.MethodConnector(
          name: 'fetchSingleWithArtworkIds',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .fetchSingleWithArtworkIds(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'fetchMultiWithArtworkIds': _i1.MethodConnector(
          name: 'fetchMultiWithArtworkIds',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .fetchMultiWithArtworkIds(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'fetchByCustomerWithDimensions': _i1.MethodConnector(
          name: 'fetchByCustomerWithDimensions',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'dimensions': _i1.ParameterDescription(
              name: 'dimensions',
              type: _i1.getType<List<_i90.NutzenlayoutArtworkDimensions>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .fetchByCustomerWithDimensions(
            session,
            customerId: params['customerId'],
            dimensions: params['dimensions'],
          ),
        ),
        'fetchMultiByCustomerWithDimensions': _i1.MethodConnector(
          name: 'fetchMultiByCustomerWithDimensions',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'dimensions': _i1.ParameterDescription(
              name: 'dimensions',
              type: _i1.getType<List<_i90.NutzenlayoutArtworkDimensions>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .fetchMultiByCustomerWithDimensions(
            session,
            customerId: params['customerId'],
            dimensions: params['dimensions'],
          ),
        ),
        'getNutzelayoutsByMasterId': _i1.MethodConnector(
          name: 'getNutzelayoutsByMasterId',
          params: {
            'masterIds': _i1.ParameterDescription(
              name: 'masterIds',
              type: _i1.getType<Set<int>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .getNutzelayoutsByMasterId(
            session,
            masterIds: params['masterIds'],
          ),
        ),
        'createSingleNutzenlayoutWithArtworks': _i1.MethodConnector(
          name: 'createSingleNutzenlayoutWithArtworks',
          params: {
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i91.NutzenlayoutDTO>(),
              nullable: false,
            ),
            'artworkIds': _i1.ParameterDescription(
              name: 'artworkIds',
              type: _i1.getType<Set<int>>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .createSingleNutzenlayoutWithArtworks(
            session,
            dto: params['dto'],
            artworkIds: params['artworkIds'],
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'createMultiNutzenlayoutWithArtworks': _i1.MethodConnector(
          name: 'createMultiNutzenlayoutWithArtworks',
          params: {
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i91.NutzenlayoutDTO>(),
              nullable: false,
            ),
            'artworkIds': _i1.ParameterDescription(
              name: 'artworkIds',
              type: _i1.getType<Set<int>>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'dimensions': _i1.ParameterDescription(
              name: 'dimensions',
              type: _i1.getType<Set<_i90.NutzenlayoutArtworkDimensions>>(),
              nullable: false,
            ),
            'isExistingNutzenlayout': _i1.ParameterDescription(
              name: 'isExistingNutzenlayout',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .createMultiNutzenlayoutWithArtworks(
            session,
            dto: params['dto'],
            artworkIds: params['artworkIds'],
            salesOrderId: params['salesOrderId'],
            dimensions: params['dimensions'],
            isExistingNutzenlayout: params['isExistingNutzenlayout'],
          ),
        ),
        'addArtworksToNutzenlayout': _i1.MethodConnector(
          name: 'addArtworksToNutzenlayout',
          params: {
            'nutzenlayoutDTO': _i1.ParameterDescription(
              name: 'nutzenlayoutDTO',
              type: _i1.getType<_i91.NutzenlayoutDTO>(),
              nullable: false,
            ),
            'artworkIds': _i1.ParameterDescription(
              name: 'artworkIds',
              type: _i1.getType<Set<int>>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .addArtworksToNutzenlayout(
            session,
            nutzenlayoutDTO: params['nutzenlayoutDTO'],
            artworkIds: params['artworkIds'],
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'detachArtworksFromSalesOrderNutzenlayout': _i1.MethodConnector(
          name: 'detachArtworksFromSalesOrderNutzenlayout',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'nutzenlayoutId': _i1.ParameterDescription(
              name: 'nutzenlayoutId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkIds': _i1.ParameterDescription(
              name: 'artworkIds',
              type: _i1.getType<Set<int>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .detachArtworksFromSalesOrderNutzenlayout(
            session,
            salesOrderId: params['salesOrderId'],
            nutzenlayoutId: params['nutzenlayoutId'],
            artworkIds: params['artworkIds'],
          ),
        ),
        'watchSalesOrderSingleNutzenlayoutsLight': _i1.MethodStreamConnector(
          name: 'watchSalesOrderSingleNutzenlayoutsLight',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .watchSalesOrderSingleNutzenlayoutsLight(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'watchSalesOrderMultiNutzenlayoutsLight': _i1.MethodStreamConnector(
          name: 'watchSalesOrderMultiNutzenlayoutsLight',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['nutzenLayout'] as _i41.NutzenLayoutEndpoint)
                  .watchSalesOrderMultiNutzenlayoutsLight(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
      },
    );
    connectors['product'] = _i1.EndpointConnector(
      name: 'product',
      endpoint: endpoints['product']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchByIdWithoutRelations': _i1.MethodConnector(
          name: 'fetchByIdWithoutRelations',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .fetchByIdWithoutRelations(
            session,
            params['id'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint).fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i92.ProductDTO>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint).update(
            session,
            entity: params['entity'],
            release: params['release'],
            sessionId: params['sessionId'],
          ),
        ),
        'createProductFromArtworkQuarantineAndArtworkTemplate':
            _i1.MethodConnector(
          name: 'createProductFromArtworkQuarantineAndArtworkTemplate',
          params: {
            'artworkQuarantineId': _i1.ParameterDescription(
              name: 'artworkQuarantineId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'serienId': _i1.ParameterDescription(
              name: 'serienId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'artworkTemplateId': _i1.ParameterDescription(
              name: 'artworkTemplateId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'layerId': _i1.ParameterDescription(
              name: 'layerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'serienIndex': _i1.ParameterDescription(
              name: 'serienIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderItemTypes': _i1.ParameterDescription(
              name: 'salesOrderItemTypes',
              type: _i1.getType<List<_i58.SalesOrderItemType>>(),
              nullable: false,
            ),
            'artworkType': _i1.ParameterDescription(
              name: 'artworkType',
              type: _i1.getType<_i93.ArtworkType>(),
              nullable: false,
            ),
            'printProcessType': _i1.ParameterDescription(
              name: 'printProcessType',
              type: _i1.getType<_i94.ArtworkPrintProcessType>(),
              nullable: false,
            ),
            'productType': _i1.ParameterDescription(
              name: 'productType',
              type: _i1.getType<_i95.ProductType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .createProductFromArtworkQuarantineAndArtworkTemplate(
            session,
            artworkQuarantineId: params['artworkQuarantineId'],
            serienId: params['serienId'],
            artworkTemplateId: params['artworkTemplateId'],
            customerId: params['customerId'],
            layerId: params['layerId'],
            salesOrderId: params['salesOrderId'],
            serienIndex: params['serienIndex'],
            salesOrderItemTypes: params['salesOrderItemTypes'],
            artworkType: params['artworkType'],
            printProcessType: params['printProcessType'],
            productType: params['productType'],
          ),
        ),
        'createBulkProductFromArtworkQuarantineAndArtworkTemplate':
            _i1.MethodConnector(
          name: 'createBulkProductFromArtworkQuarantineAndArtworkTemplate',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkTemplateId': _i1.ParameterDescription(
              name: 'artworkTemplateId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderItemTypes': _i1.ParameterDescription(
              name: 'salesOrderItemTypes',
              type: _i1.getType<List<_i58.SalesOrderItemType>>(),
              nullable: false,
            ),
            'artworkType': _i1.ParameterDescription(
              name: 'artworkType',
              type: _i1.getType<_i93.ArtworkType>(),
              nullable: false,
            ),
            'layerId': _i1.ParameterDescription(
              name: 'layerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'printProcessType': _i1.ParameterDescription(
              name: 'printProcessType',
              type: _i1.getType<_i94.ArtworkPrintProcessType>(),
              nullable: false,
            ),
            'productType': _i1.ParameterDescription(
              name: 'productType',
              type: _i1.getType<_i95.ProductType>(),
              nullable: false,
            ),
            'serienId': _i1.ParameterDescription(
              name: 'serienId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'quarantinesWithIndices': _i1.ParameterDescription(
              name: 'quarantinesWithIndices',
              type: _i1.getType<
                  List<({int artworkQuarantineId, int serienIndex})>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .createBulkProductFromArtworkQuarantineAndArtworkTemplate(
            session,
            customerId: params['customerId'],
            artworkTemplateId: params['artworkTemplateId'],
            salesOrderId: params['salesOrderId'],
            salesOrderItemTypes: params['salesOrderItemTypes'],
            artworkType: params['artworkType'],
            layerId: params['layerId'],
            printProcessType: params['printProcessType'],
            productType: params['productType'],
            serienId: params['serienId'],
            quarantinesWithIndices: params['quarantinesWithIndices'],
          ),
        ),
        'createProductPartFromArtworkQuarantineAndTemplate':
            _i1.MethodConnector(
          name: 'createProductPartFromArtworkQuarantineAndTemplate',
          params: {
            'artworkQuarantineId': _i1.ParameterDescription(
              name: 'artworkQuarantineId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkTemplateId': _i1.ParameterDescription(
              name: 'artworkTemplateId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderItemTypes': _i1.ParameterDescription(
              name: 'salesOrderItemTypes',
              type: _i1.getType<List<_i58.SalesOrderItemType>>(),
              nullable: false,
            ),
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkType': _i1.ParameterDescription(
              name: 'artworkType',
              type: _i1.getType<_i93.ArtworkType>(),
              nullable: false,
            ),
            'printProcessType': _i1.ParameterDescription(
              name: 'printProcessType',
              type: _i1.getType<_i94.ArtworkPrintProcessType>(),
              nullable: false,
            ),
            'layerId': _i1.ParameterDescription(
              name: 'layerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'serienIndex': _i1.ParameterDescription(
              name: 'serienIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .createProductPartFromArtworkQuarantineAndTemplate(
            session,
            artworkQuarantineId: params['artworkQuarantineId'],
            artworkTemplateId: params['artworkTemplateId'],
            customerId: params['customerId'],
            salesOrderId: params['salesOrderId'],
            salesOrderItemTypes: params['salesOrderItemTypes'],
            productId: params['productId'],
            artworkType: params['artworkType'],
            printProcessType: params['printProcessType'],
            layerId: params['layerId'],
            serienIndex: params['serienIndex'],
          ),
        ),
        'createBulkProductPartFromArtworkQuarantineAndTemplate':
            _i1.MethodConnector(
          name: 'createBulkProductPartFromArtworkQuarantineAndTemplate',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkTemplateId': _i1.ParameterDescription(
              name: 'artworkTemplateId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderItemTypes': _i1.ParameterDescription(
              name: 'salesOrderItemTypes',
              type: _i1.getType<List<_i58.SalesOrderItemType>>(),
              nullable: false,
            ),
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkType': _i1.ParameterDescription(
              name: 'artworkType',
              type: _i1.getType<_i93.ArtworkType>(),
              nullable: false,
            ),
            'layerId': _i1.ParameterDescription(
              name: 'layerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'printProcessType': _i1.ParameterDescription(
              name: 'printProcessType',
              type: _i1.getType<_i94.ArtworkPrintProcessType>(),
              nullable: false,
            ),
            'quarantinesWithIndices': _i1.ParameterDescription(
              name: 'quarantinesWithIndices',
              type: _i1.getType<
                  List<({int artworkQuarantineId, int serienIndex})>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .createBulkProductPartFromArtworkQuarantineAndTemplate(
            session,
            customerId: params['customerId'],
            artworkTemplateId: params['artworkTemplateId'],
            salesOrderId: params['salesOrderId'],
            salesOrderItemTypes: params['salesOrderItemTypes'],
            productId: params['productId'],
            artworkType: params['artworkType'],
            layerId: params['layerId'],
            printProcessType: params['printProcessType'],
            quarantinesWithIndices: params['quarantinesWithIndices'],
          ),
        ),
        'addExistingProductToSalesOrder': _i1.MethodConnector(
          name: 'addExistingProductToSalesOrder',
          params: {
            'productMasterId': _i1.ParameterDescription(
              name: 'productMasterId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .addExistingProductToSalesOrder(
            session,
            productMasterId: params['productMasterId'],
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'fetchForSalesOrderListStream': _i1.MethodConnector(
          name: 'fetchForSalesOrderListStream',
          params: {
            'productId': _i1.ParameterDescription(
              name: 'productId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .fetchForSalesOrderListStream(
            session,
            params['productId'],
          ),
        ),
        'fetchBySalesOrder': _i1.MethodConnector(
          name: 'fetchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint).fetchBySalesOrder(
            session,
            params['salesOrderId'],
          ),
        ),
        'fetchByIdForRelease': _i1.MethodConnector(
          name: 'fetchByIdForRelease',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .fetchByIdForRelease(
            session,
            params['entityId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint)
                  .findEntityLocks(session),
        ),
        'fetchHistory': _i1.MethodConnector(
          name: 'fetchHistory',
          params: {
            'productMasterId': _i1.ParameterDescription(
              name: 'productMasterId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint).fetchHistory(
            session,
            productMasterId: params['productMasterId'],
          ),
        ),
        'createManually': _i1.MethodConnector(
          name: 'createManually',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'productType': _i1.ParameterDescription(
              name: 'productType',
              type: _i1.getType<_i95.ProductType>(),
              nullable: false,
            ),
            'serienId': _i1.ParameterDescription(
              name: 'serienId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'serienIndex': _i1.ParameterDescription(
              name: 'serienIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkType': _i1.ParameterDescription(
              name: 'artworkType',
              type: _i1.getType<_i93.ArtworkType>(),
              nullable: false,
            ),
            'printProcessType': _i1.ParameterDescription(
              name: 'printProcessType',
              type: _i1.getType<_i94.ArtworkPrintProcessType>(),
              nullable: false,
            ),
            'layerId': _i1.ParameterDescription(
              name: 'layerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkTemplateId': _i1.ParameterDescription(
              name: 'artworkTemplateId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['product'] as _i42.ProductEndpoint).createManually(
            session,
            salesOrderId: params['salesOrderId'],
            customerId: params['customerId'],
            productType: params['productType'],
            serienId: params['serienId'],
            serienIndex: params['serienIndex'],
            artworkType: params['artworkType'],
            printProcessType: params['printProcessType'],
            layerId: params['layerId'],
            artworkTemplateId: params['artworkTemplateId'],
          ),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'releaseOnClose': _i1.ParameterDescription(
              name: 'releaseOnClose',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['product'] as _i42.ProductEndpoint).watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
            releaseOnClose: params['releaseOnClose'],
          ),
        ),
        'watchBySalesOrder': _i1.MethodStreamConnector(
          name: 'watchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['product'] as _i42.ProductEndpoint).watchBySalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
      },
    );
    connectors['productLog'] = _i1.EndpointConnector(
      name: 'productLog',
      endpoint: endpoints['productLog']!,
      methodConnectors: {
        'fetchProductLogs': _i1.MethodConnector(
          name: 'fetchProductLogs',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<_i59.TableType>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productLog'] as _i43.ProductLogEndpoint)
                  .fetchProductLogs(
            session,
            entityId: params['entityId'],
            tableType: params['tableType'],
          ),
        )
      },
    );
    connectors['productMaster'] = _i1.EndpointConnector(
      name: 'productMaster',
      endpoint: endpoints['productMaster']!,
      methodConnectors: {
        'findByCustomer': _i1.MethodConnector(
          name: 'findByCustomer',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint)
                  .findByCustomer(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchNextSerienIndex': _i1.MethodConnector(
          name: 'fetchNextSerienIndex',
          params: {
            'serienId': _i1.ParameterDescription(
              name: 'serienId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint)
                  .fetchNextSerienIndex(
            session,
            params['serienId'],
          ),
        ),
        'checkIfSerienIndexIsAvailable': _i1.MethodConnector(
          name: 'checkIfSerienIndexIsAvailable',
          params: {
            'serienId': _i1.ParameterDescription(
              name: 'serienId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'serienIndex': _i1.ParameterDescription(
              name: 'serienIndex',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint)
                  .checkIfSerienIndexIsAvailable(
            session,
            params['serienId'],
            params['serienIndex'],
          ),
        ),
        'fetchByIdForNewSalesOrderProduct': _i1.MethodConnector(
          name: 'fetchByIdForNewSalesOrderProduct',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint)
                  .fetchByIdForNewSalesOrderProduct(
            session,
            params['entityId'],
          ),
        ),
        'fetchByIdForRelease': _i1.MethodConnector(
          name: 'fetchByIdForRelease',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint)
                  .fetchByIdForRelease(
            session,
            params['entityId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['productMaster'] as _i44.ProductMasterEndpoint)
                  .findEntityLocks(session),
        ),
      },
    );
    connectors['salesOrderItem'] = _i1.EndpointConnector(
      name: 'salesOrderItem',
      endpoint: endpoints['salesOrderItem']!,
      methodConnectors: {
        'findBySalesOrder': _i1.MethodConnector(
          name: 'findBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrderItem'] as _i45.SalesOrderItemEndpoint)
                  .findBySalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'fetchByArtworkId': _i1.MethodConnector(
          name: 'fetchByArtworkId',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrderItem'] as _i45.SalesOrderItemEndpoint)
                  .fetchByArtworkId(
            session,
            artworkId: params['artworkId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrderItem'] as _i45.SalesOrderItemEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrderItem'] as _i45.SalesOrderItemEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrderItem'] as _i45.SalesOrderItemEndpoint)
                  .delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'watchForSalesOrder': _i1.MethodStreamConnector(
          name: 'watchForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['salesOrderItem'] as _i45.SalesOrderItemEndpoint)
                  .watchForSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'watchByCustomerList': _i1.MethodStreamConnector(
          name: 'watchByCustomerList',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['salesOrderItem'] as _i45.SalesOrderItemEndpoint)
                  .watchByCustomerList(
            session,
            customerId: params['customerId'],
          ),
        ),
      },
    );
    connectors['soiConsulting'] = _i1.EndpointConnector(
      name: 'soiConsulting',
      endpoint: endpoints['soiConsulting']!,
      methodConnectors: {
        'fetchForTable': _i1.MethodConnector(
          name: 'fetchForTable',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .fetchForTable(
            session,
            params['id'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchForSalesOrder': _i1.MethodConnector(
          name: 'fetchForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .fetchForSalesOrder(
            session,
            params['salesOrderId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i96.SoiConsultingDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'createFromSalesOrder': _i1.MethodConnector(
          name: 'createFromSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .createFromSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
            customerId: params['customerId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint).delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchBySalesOrder': _i1.MethodStreamConnector(
          name: 'watchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .watchBySalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'watchDeletionsForSalesOrder': _i1.MethodStreamConnector(
          name: 'watchDeletionsForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiConsulting'] as _i46.SoiConsultingEndpoint)
                  .watchDeletionsForSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
      },
    );
    connectors['soiEinzelformaufbau'] = _i1.EndpointConnector(
      name: 'soiEinzelformaufbau',
      endpoint: endpoints['soiEinzelformaufbau']!,
      methodConnectors: {
        'createFromSalesOrderArtwork': _i1.MethodConnector(
          name: 'createFromSalesOrderArtwork',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkMasterId': _i1.ParameterDescription(
              name: 'artworkMasterId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .createFromSalesOrderArtwork(
            session,
            salesOrderId: params['salesOrderId'],
            artworkId: params['artworkId'],
            artworkMasterId: params['artworkMasterId'],
            customerId: params['customerId'],
          ),
        ),
        'fetchForTable': _i1.MethodConnector(
          name: 'fetchForTable',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .fetchForTable(
            session,
            params['id'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchForSalesOrder': _i1.MethodConnector(
          name: 'fetchForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .fetchForSalesOrder(
            session,
            params['salesOrderId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i97.SoiEinzelformaufbauDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchByArtwork': _i1.MethodStreamConnector(
          name: 'watchByArtwork',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .watchByArtwork(
            session,
            artworkId: params['artworkId'],
          ),
        ),
        'watchBySalesOrder': _i1.MethodStreamConnector(
          name: 'watchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiEinzelformaufbau']
                      as _i47.SoiEinzelformaufbauEndpoint)
                  .watchBySalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
      },
    );
    connectors['soiPrepareArtwork'] = _i1.EndpointConnector(
      name: 'soiPrepareArtwork',
      endpoint: endpoints['soiPrepareArtwork']!,
      methodConnectors: {
        'createFromSalesOrderArtwork': _i1.MethodConnector(
          name: 'createFromSalesOrderArtwork',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkMasterId': _i1.ParameterDescription(
              name: 'artworkMasterId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .createFromSalesOrderArtwork(
            session,
            salesOrderId: params['salesOrderId'],
            artworkId: params['artworkId'],
            artworkMasterId: params['artworkMasterId'],
            customerId: params['customerId'],
          ),
        ),
        'fetchForTable': _i1.MethodConnector(
          name: 'fetchForTable',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .fetchForTable(
            session,
            params['id'],
          ),
        ),
        'isArtworkInSoiPrepareArtwork': _i1.MethodConnector(
          name: 'isArtworkInSoiPrepareArtwork',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .isArtworkInSoiPrepareArtwork(
            session,
            artworkId: params['artworkId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchForSalesOrder': _i1.MethodConnector(
          name: 'fetchForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .fetchForSalesOrder(
            session,
            params['salesOrderId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i98.SoiPrepareArtworkDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchByArtwork': _i1.MethodStreamConnector(
          name: 'watchByArtwork',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .watchByArtwork(
            session,
            artworkId: params['artworkId'],
          ),
        ),
        'watchBySalesOrder': _i1.MethodStreamConnector(
          name: 'watchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .watchBySalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'watchDeletionsForSalesOrder': _i1.MethodStreamConnector(
          name: 'watchDeletionsForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiPrepareArtwork'] as _i48.SoiPrepareArtworkEndpoint)
                  .watchDeletionsForSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
      },
    );
    connectors['soiRequestArtworkApproval'] = _i1.EndpointConnector(
      name: 'soiRequestArtworkApproval',
      endpoint: endpoints['soiRequestArtworkApproval']!,
      methodConnectors: {
        'createFromSalesOrderArtwork': _i1.MethodConnector(
          name: 'createFromSalesOrderArtwork',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'artworkMasterId': _i1.ParameterDescription(
              name: 'artworkMasterId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .createFromSalesOrderArtwork(
            session,
            salesOrderId: params['salesOrderId'],
            artworkId: params['artworkId'],
            artworkMasterId: params['artworkMasterId'],
            customerId: params['customerId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
        'fetchForSalesOrder': _i1.MethodConnector(
          name: 'fetchForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .fetchForSalesOrder(
            session,
            params['salesOrderId'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i99.SoiRequestArtworkApprovalDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .findEntityLocks(session),
        ),
        'watchEntity': _i1.MethodStreamConnector(
          name: 'watchEntity',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .watchEntity(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
        'watchByArtwork': _i1.MethodStreamConnector(
          name: 'watchByArtwork',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .watchByArtwork(
            session,
            artworkId: params['artworkId'],
          ),
        ),
        'watchBySalesOrder': _i1.MethodStreamConnector(
          name: 'watchBySalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .watchBySalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
        'watchDeletionsForSalesOrder': _i1.MethodStreamConnector(
          name: 'watchDeletionsForSalesOrder',
          params: {
            'salesOrderId': _i1.ParameterDescription(
              name: 'salesOrderId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['soiRequestArtworkApproval']
                      as _i49.SoiRequestArtworkApprovalEndpoint)
                  .watchDeletionsForSalesOrder(
            session,
            salesOrderId: params['salesOrderId'],
          ),
        ),
      },
    );
    connectors['salesOrder'] = _i1.EndpointConnector(
      name: 'salesOrder',
      endpoint: endpoints['salesOrder']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).create(
            session,
            sessionId: params['sessionId'],
            customerId: params['customerId'],
          ),
        ),
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
        'findSpotlight': _i1.MethodConnector(
          name: 'findSpotlight',
          params: {
            'query': _i1.ParameterDescription(
              name: 'query',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint)
                  .findSpotlight(
            session,
            query: params['query'],
          ),
        ),
        'find': _i1.MethodConnector(
          name: 'find',
          params: {
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).find(
            session,
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'findByCustomerId': _i1.MethodConnector(
          name: 'findByCustomerId',
          params: {
            'customerId': _i1.ParameterDescription(
              name: 'customerId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sort': _i1.ParameterDescription(
              name: 'sort',
              type: _i1.getType<_i54.Sort?>(),
              nullable: true,
            ),
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i54.Filter?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint)
                  .findByCustomerId(
            session,
            customerId: params['customerId'],
            sort: params['sort'],
            filter: params['filter'],
          ),
        ),
        'fetchAndLock': _i1.MethodConnector(
          name: 'fetchAndLock',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'editingSessionId': _i1.ParameterDescription(
              name: 'editingSessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).fetchAndLock(
            session,
            id: params['id'],
            editingSessionId: params['editingSessionId'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'entity': _i1.ParameterDescription(
              name: 'entity',
              type: _i1.getType<_i100.SalesOrderDTO>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'release': _i1.ParameterDescription(
              name: 'release',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).update(
            session,
            entity: params['entity'],
            sessionId: params['sessionId'],
            release: params['release'],
          ),
        ),
        'release': _i1.MethodConnector(
          name: 'release',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).release(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).delete(
            session,
            entityId: params['entityId'],
            sessionId: params['sessionId'],
          ),
        ),
        'findEntityLocks': _i1.MethodConnector(
          name: 'findEntityLocks',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint)
                  .findEntityLocks(session),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'sessionId': _i1.ParameterDescription(
              name: 'sessionId',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['salesOrder'] as _i50.SalesOrderEndpoint).watch(
            session,
            sessionId: params['sessionId'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['ahoiFileStorage'] = _i1.EndpointConnector(
      name: 'ahoiFileStorage',
      endpoint: endpoints['ahoiFileStorage']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ahoiFileStorage'] as _i51.AhoiFileStorageEndpoint)
                  .getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ahoiFileStorage'] as _i51.AhoiFileStorageEndpoint)
                  .verifyUpload(
            session,
            params['path'],
          ),
        ),
        'deleteFile': _i1.MethodConnector(
          name: 'deleteFile',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ahoiFileStorage'] as _i51.AhoiFileStorageEndpoint)
                  .deleteFile(
            session,
            params['path'],
          ),
        ),
        'getDownloadDescription': _i1.MethodConnector(
          name: 'getDownloadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ahoiFileStorage'] as _i51.AhoiFileStorageEndpoint)
                  .getDownloadDescription(
            session,
            params['path'],
          ),
        ),
        'getDownloadUrl': _i1.MethodConnector(
          name: 'getDownloadUrl',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['ahoiFileStorage'] as _i51.AhoiFileStorageEndpoint)
                  .getDownloadUrl(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['jsonDesigner'] = _i1.EndpointConnector(
      name: 'jsonDesigner',
      endpoint: endpoints['jsonDesigner']!,
      methodConnectors: {
        'createTemplate': _i1.MethodConnector(
          name: 'createTemplate',
          params: {
            'jsonTemplate': _i1.ParameterDescription(
              name: 'jsonTemplate',
              type: _i1.getType<_i101.JsonTemplateDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['jsonDesigner'] as _i52.JsonDesignerEndpoint)
                  .createTemplate(
            session,
            params['jsonTemplate'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i102.Endpoints()..initializeEndpoints(server);
    modules['elbdesk_backend_core'] = _i54.Endpoints()
      ..initializeEndpoints(server);
  }
}
