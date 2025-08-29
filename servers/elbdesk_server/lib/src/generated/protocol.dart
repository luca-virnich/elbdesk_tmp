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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart'
    as _i4;
import 'modules/crm/salutation_code/models/salutation_code_formular.dart'
    as _i5;
import 'modules/core/admin_migration/models/migration_mats_company.dart' as _i6;
import 'modules/core/admin_migration/models/migration_mats_company_field.dart'
    as _i7;
import 'modules/core/admin_migration/models/migration_mats_person.dart' as _i8;
import 'modules/core/admin_migration/models/migration_mats_person_field.dart'
    as _i9;
import 'modules/core/app_user/models/app_scope.dart' as _i10;
import 'modules/core/app_user/models/app_user.dart' as _i11;
import 'modules/core/app_user/models/app_user_field.dart' as _i12;
import 'modules/core/custom_entity_keys/custom_entity_int_keys.dart' as _i13;
import 'modules/core/entity_log/entity_log.dart' as _i14;
import 'modules/core/entity_log/entity_log_field.dart' as _i15;
import 'modules/core/global_settings/models/global_settings.dart' as _i16;
import 'modules/core/global_settings/models/global_settings_field.dart' as _i17;
import 'modules/core/service_user/model/service_user.dart' as _i18;
import 'modules/core/service_user/model/service_user_field.dart' as _i19;
import 'modules/core/service_user/model/service_user_token.dart' as _i20;
import 'modules/core/spotlight/spotlight_item.dart' as _i21;
import 'modules/core/spotlight/spotlight_type.dart' as _i22;
import 'modules/core/table/table_type.dart' as _i23;
import 'modules/crm/app_client/models/app_client.dart' as _i24;
import 'modules/crm/app_client/models/app_client_field.dart' as _i25;
import 'modules/crm/company_company/models/company_company.dart' as _i26;
import 'modules/crm/company_company/models/company_employee_field.dart' as _i27;
import 'modules/crm/company_department/models/company_department.dart' as _i28;
import 'modules/crm/company_department/models/company_department_field.dart'
    as _i29;
import 'modules/crm/company_employee/models/company_employee.dart' as _i30;
import 'modules/crm/company_employee/models/company_employee_department_jt.dart'
    as _i31;
import 'modules/crm/company_employee/models/company_employee_field.dart'
    as _i32;
import 'modules/crm/contact/models/contact.dart' as _i33;
import 'modules/crm/contact/models/contact_field.dart' as _i34;
import 'modules/crm/contact/models/contact_type.dart' as _i35;
import 'modules/crm/country_code/models/country_code.dart' as _i36;
import 'modules/crm/country_code/models/country_code_address_format.dart'
    as _i37;
import 'modules/crm/country_code/models/country_code_contact_address_format.dart'
    as _i38;
import 'modules/crm/country_code/models/country_code_field.dart' as _i39;
import 'modules/crm/crm_event/models/crm_event.dart' as _i40;
import 'modules/crm/crm_event/models/crm_event_contact_jt.dart' as _i41;
import 'modules/crm/crm_event/models/crm_event_field.dart' as _i42;
import 'modules/crm/crm_event/models/crm_event_status.dart' as _i43;
import 'modules/crm/customer/models/customer.dart' as _i44;
import 'modules/crm/customer/models/customer_field.dart' as _i45;
import 'modules/crm/customer/models/customer_sales_order_hints.dart' as _i46;
import 'modules/crm/customer/models/invoice_delivery_method.dart' as _i47;
import 'modules/crm/customer/models/shipping_method.dart' as _i48;
import 'modules/crm/customer/models/shipping_method_field.dart' as _i49;
import 'modules/crm/customer_billing_customers/models/customer_billing_customer.dart'
    as _i50;
import 'modules/crm/customer_billing_customers/models/customer_billing_customer_field.dart'
    as _i51;
import 'modules/crm/customer_contacts/models/customer_contacts.dart' as _i52;
import 'modules/crm/customer_contacts/models/customer_contacts_type.dart'
    as _i53;
import 'modules/crm/customer_contacts/models/customer_field.dart' as _i54;
import 'modules/crm/customer_customer/models/customer_customer.dart' as _i55;
import 'modules/crm/customer_customer/models/customer_customer_field.dart'
    as _i56;
import 'modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart'
    as _i57;
import 'modules/crm/customer_shipping_contact/models/customer_shipping_contact_field.dart'
    as _i58;
import 'modules/crm/department_code/models/department_code.dart' as _i59;
import 'modules/crm/department_code/models/department_code_field.dart' as _i60;
import 'modules/crm/language_code/models/language_code.dart' as _i61;
import 'modules/crm/language_code/models/language_code_field.dart' as _i62;
import 'modules/crm/payment_code/models/payment_code.dart' as _i63;
import 'modules/crm/payment_code/models/payment_code_field.dart' as _i64;
import 'modules/crm/salutation_code/models/salutation_code.dart' as _i65;
import 'modules/crm/salutation_code/models/salutation_code_field.dart' as _i66;
import 'exceptions/elb_exception_message.dart' as _i67;
import 'modules/crm/salutation_code/models/salutation_type.dart' as _i68;
import 'modules/prepress/artwork/models/artwork.dart' as _i69;
import 'modules/prepress/artwork/models/artwork_additional_data_field.dart'
    as _i70;
import 'modules/prepress/artwork/models/artwork_artwork_master.dart' as _i71;
import 'modules/prepress/artwork/models/artwork_die_cutter_type.dart' as _i72;
import 'modules/prepress/artwork/models/artwork_field.dart' as _i73;
import 'modules/prepress/artwork/models/artwork_log.dart' as _i74;
import 'modules/prepress/artwork/models/artwork_log_field.dart' as _i75;
import 'modules/prepress/artwork/models/artwork_master.dart' as _i76;
import 'modules/prepress/artwork/models/artwork_print_process_type.dart'
    as _i77;
import 'modules/prepress/artwork/models/artwork_sales_order_update.dart'
    as _i78;
import 'modules/prepress/artwork/models/artwork_type.dart' as _i79;
import 'modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i80;
import 'modules/prepress/artwork_quarantine/models/artwork_quarantine_field.dart'
    as _i81;
import 'modules/prepress/artwork_quarantine/models/artwork_quaratine_analysis_data_dto.dart'
    as _i82;
import 'modules/prepress/artwork_quarantine/models/color_specification.dart'
    as _i83;
import 'modules/prepress/artwork_quarantine/models/font_info.dart' as _i84;
import 'modules/prepress/artwork_quarantine/models/layer_info.dart' as _i85;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i86;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_field.dart'
    as _i87;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_status.dart'
    as _i88;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_type.dart'
    as _i89;
import 'modules/prepress/artwork_quarantine_group/models/system_file.dart'
    as _i90;
import 'modules/prepress/artwork_quarantine_group/models/system_file_attachment_type.dart'
    as _i91;
import 'modules/prepress/artwork_template/models/artwork_template.dart' as _i92;
import 'modules/prepress/artwork_template/models/artwork_template_field.dart'
    as _i93;
import 'modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i94;
import 'modules/prepress/artwork_template/models/artwork_template_pre_selection_field.dart'
    as _i95;
import 'modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i96;
import 'modules/prepress/artwork_template/models/artwork_template_selection_field.dart'
    as _i97;
import 'modules/prepress/bearer/models/bearer.dart' as _i98;
import 'modules/prepress/bearer/models/bearer_field.dart' as _i99;
import 'modules/prepress/bearer/models/bearer_type.dart' as _i100;
import 'modules/prepress/bearer/models/types/bearer_flexo_print_multilayer.dart'
    as _i101;
import 'modules/prepress/bearer/models/types/bearer_offset_press_fixed_plate.dart'
    as _i102;
import 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_fixed_plate.dart'
    as _i103;
import 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_min_plate.dart'
    as _i104;
import 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_plate_equals_sub.dart'
    as _i105;
import 'modules/prepress/bearer/models/types/bearer_standard_flexo.dart'
    as _i106;
import 'modules/prepress/bearer/models/types/bearer_type1.dart' as _i107;
import 'modules/prepress/bearer/models/types/bearer_type2.dart' as _i108;
import 'modules/prepress/codes/models/artwork_code.dart' as _i109;
import 'modules/prepress/codes/models/artwork_code_field.dart' as _i110;
import 'modules/prepress/codes/models/artwork_code_type.dart' as _i111;
import 'modules/prepress/codes/models/codes/aztec_code.dart' as _i112;
import 'modules/prepress/codes/models/codes/template_code.dart' as _i113;
import 'modules/prepress/codes/models/codes/twoOf5_code.dart' as _i114;
import 'modules/prepress/color/models/artwork_color.dart' as _i115;
import 'modules/prepress/color/models/artwork_color_field.dart' as _i116;
import 'modules/prepress/color/models/artwork_color_print_process_type.dart'
    as _i117;
import 'modules/prepress/color/models/artwork_color_spec_type.dart' as _i118;
import 'modules/prepress/color/models/artwork_color_type.dart' as _i119;
import 'modules/prepress/color/models/artwork_verarbeitungsebene_type.dart'
    as _i120;
import 'modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i121;
import 'modules/prepress/color_palette/models/prepress_color_palette_field.dart'
    as _i122;
import 'modules/prepress/drucklayout/models/drucklayout.dart' as _i123;
import 'modules/prepress/drucklayout/models/drucklayout_field.dart' as _i124;
import 'modules/prepress/drucklayout/models/drucklayout_multi_nutzenlayout_jt.dart'
    as _i125;
import 'modules/prepress/drucklayout/models/drucklayout_pre_selection.dart'
    as _i126;
import 'modules/prepress/drucklayout/models/drucklayout_pre_selection_field.dart'
    as _i127;
import 'modules/prepress/drucklayout/models/drucklayout_sales_order_jt.dart'
    as _i128;
import 'modules/unsorted/junction_tables/customer_bearer.dart' as _i129;
import 'modules/prepress/drucklayout/models/drucklayout_selection_field.dart'
    as _i130;
import 'modules/prepress/drucklayout/models/drucklayout_single_nutzenlayout_jt.dart'
    as _i131;
import 'modules/prepress/layer/models/artwork_layer.dart' as _i132;
import 'modules/prepress/layer/models/artwork_layer_field.dart' as _i133;
import 'modules/prepress/layer/models/artwork_layer_type.dart' as _i134;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i135;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_cell_dto.dart'
    as _i136;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_column_dto.dart'
    as _i137;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_form_type.dart'
    as _i138;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_laufrichtung.dart'
    as _i139;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_type.dart' as _i140;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_unit_system.dart'
    as _i141;
import 'modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i142;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_artwork_jt.dart'
    as _i143;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i144;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_light.dart'
    as _i145;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_artwork_jt.dart'
    as _i146;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i147;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_light.dart'
    as _i148;
import 'modules/prepress/product/models/product.dart' as _i149;
import 'modules/prepress/product/models/product_field.dart' as _i150;
import 'modules/prepress/product/models/product_log.dart' as _i151;
import 'modules/prepress/product/models/product_log_field.dart' as _i152;
import 'modules/prepress/product/models/product_master.dart' as _i153;
import 'modules/prepress/product/models/product_type.dart' as _i154;
import 'modules/prepress/sales_order_item/models/sales_order_item.dart'
    as _i155;
import 'modules/prepress/sales_order_item/models/sales_order_item_field.dart'
    as _i156;
import 'modules/prepress/sales_order_item/models/sales_order_item_status.dart'
    as _i157;
import 'modules/prepress/sales_order_item/models/sales_order_item_type.dart'
    as _i158;
import 'modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_dto.dart'
    as _i159;
import 'modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_field.dart'
    as _i160;
import 'modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau.dart'
    as _i161;
import 'modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau_field.dart'
    as _i162;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/eye_c_status.dart'
    as _i163;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork.dart'
    as _i164;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_additional_data_field.dart'
    as _i165;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_difficulty_level.dart'
    as _i166;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_field.dart'
    as _i167;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval.dart'
    as _i168;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_additional_data_field.dart'
    as _i169;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_field.dart'
    as _i170;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_type.dart'
    as _i171;
import 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat.dart'
    as _i172;
import 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat_field.dart'
    as _i173;
import 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat_status.dart'
    as _i174;
import 'modules/prepress/trapping/models/trapping.dart' as _i175;
import 'modules/sales/sales_order/models/sales_order.dart' as _i176;
import 'modules/sales/sales_order/models/sales_order_additional_data_field.dart'
    as _i177;
import 'modules/sales/sales_order/models/sales_order_field.dart' as _i178;
import 'modules/sales/sales_order/models/sales_order_status.dart' as _i179;
import 'modules/sales/sales_order/models/sales_order_status_dto.dart' as _i180;
import 'modules/sales/sales_order/models/sales_order_status_field.dart'
    as _i181;
import 'modules/unsorted/dashboard_grid/dashboard_tile_config.dart' as _i182;
import 'modules/unsorted/dashboard_grid/dashboard_tile_type.dart' as _i183;
import 'modules/unsorted/ftp_interface/ftp_incoming_reply_type.dart' as _i184;
import 'modules/unsorted/ftp_interface/ftp_interface.dart' as _i185;
import 'modules/unsorted/ftp_interface/ftp_type.dart' as _i186;
import 'modules/unsorted/json_designer/json_dto.dart' as _i187;
import 'modules/unsorted/json_designer/json_field_type.dart' as _i188;
import 'modules/unsorted/json_designer/json_template.dart' as _i189;
import 'modules/unsorted/json_designer/json_template_field.dart' as _i190;
import 'modules/unsorted/json_designer/json_template_type.dart' as _i191;
import 'modules/prepress/drucklayout/models/drucklayout_selection.dart'
    as _i192;
import 'package:elbdesk_server/src/generated/modules/core/admin_migration/models/migration_mats_company.dart'
    as _i193;
import 'package:elbdesk_server/src/generated/modules/crm/contact/models/contact.dart'
    as _i194;
import 'package:elbdesk_server/src/generated/modules/crm/customer/models/customer.dart'
    as _i195;
import 'package:elbdesk_server/src/generated/modules/core/admin_migration/models/migration_mats_person.dart'
    as _i196;
import 'package:elbdesk_server/src/generated/modules/core/app_user/models/app_user.dart'
    as _i197;
import 'package:elbdesk_server/src/generated/modules/core/entity_log/entity_log.dart'
    as _i198;
import 'package:elbdesk_server/src/generated/modules/core/service_user/model/service_user.dart'
    as _i199;
import 'package:elbdesk_server/src/generated/modules/core/service_user/model/service_user_token.dart'
    as _i200;
import 'package:elbdesk_server/src/generated/modules/crm/app_client/models/app_client.dart'
    as _i201;
import 'package:elbdesk_server/src/generated/modules/crm/company_department/models/company_department.dart'
    as _i202;
import 'package:elbdesk_server/src/generated/modules/crm/company_employee/models/company_employee.dart'
    as _i203;
import 'package:elbdesk_server/src/generated/modules/core/spotlight/spotlight_item.dart'
    as _i204;
import 'package:elbdesk_server/src/generated/modules/crm/country_code/models/country_code.dart'
    as _i205;
import 'package:elbdesk_server/src/generated/modules/crm/crm_event/models/crm_event.dart'
    as _i206;
import 'package:elbdesk_server/src/generated/modules/crm/customer_billing_customers/models/customer_billing_customer.dart'
    as _i207;
import 'package:elbdesk_server/src/generated/modules/crm/customer/models/shipping_method.dart'
    as _i208;
import 'package:elbdesk_server/src/generated/modules/crm/customer_customer/models/customer_customer.dart'
    as _i209;
import 'package:elbdesk_server/src/generated/modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart'
    as _i210;
import 'package:elbdesk_server/src/generated/modules/crm/department_code/models/department_code.dart'
    as _i211;
import 'package:elbdesk_server/src/generated/modules/crm/language_code/models/language_code.dart'
    as _i212;
import 'package:elbdesk_server/src/generated/modules/crm/payment_code/models/payment_code.dart'
    as _i213;
import 'package:elbdesk_server/src/generated/modules/crm/salutation_code/models/salutation_code.dart'
    as _i214;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork/models/artwork.dart'
    as _i215;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork/models/artwork_log.dart'
    as _i216;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork/models/artwork_master.dart'
    as _i217;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i218;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i219;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_template/models/artwork_template.dart'
    as _i220;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i221;
import 'package:elbdesk_server/src/generated/modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i222;
import 'package:elbdesk_server/src/generated/modules/prepress/color/models/artwork_color.dart'
    as _i223;
import 'package:elbdesk_server/src/generated/modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i224;
import 'package:elbdesk_server/src/generated/modules/prepress/drucklayout/models/drucklayout.dart'
    as _i225;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i226;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i227;
import 'package:elbdesk_server/src/generated/modules/prepress/drucklayout/models/drucklayout_pre_selection.dart'
    as _i228;
import 'package:elbdesk_server/src/generated/modules/prepress/drucklayout/models/drucklayout_selection.dart'
    as _i229;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_light.dart'
    as _i230;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_light.dart'
    as _i231;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i232;
import 'package:elbdesk_server/src/generated/modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i233;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/models/sales_order_item_type.dart'
    as _i234;
import 'package:elbdesk_server/src/generated/modules/prepress/product/models/product.dart'
    as _i235;
import 'package:elbdesk_server/src/generated/modules/prepress/product/models/product_log.dart'
    as _i236;
import 'package:elbdesk_server/src/generated/modules/prepress/product/models/product_master.dart'
    as _i237;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/models/sales_order_item.dart'
    as _i238;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_dto.dart'
    as _i239;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau.dart'
    as _i240;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork.dart'
    as _i241;
import 'package:elbdesk_server/src/generated/modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval.dart'
    as _i242;
import 'package:elbdesk_server/src/generated/modules/sales/sales_order/models/sales_order.dart'
    as _i243;
export 'exceptions/elb_exception_message.dart';
export 'modules/core/admin_migration/models/migration_mats_company.dart';
export 'modules/core/admin_migration/models/migration_mats_company_field.dart';
export 'modules/core/admin_migration/models/migration_mats_person.dart';
export 'modules/core/admin_migration/models/migration_mats_person_field.dart';
export 'modules/core/app_user/models/app_scope.dart';
export 'modules/core/app_user/models/app_user.dart';
export 'modules/core/app_user/models/app_user_field.dart';
export 'modules/core/custom_entity_keys/custom_entity_int_keys.dart';
export 'modules/core/entity_log/entity_log.dart';
export 'modules/core/entity_log/entity_log_field.dart';
export 'modules/core/global_settings/models/global_settings.dart';
export 'modules/core/global_settings/models/global_settings_field.dart';
export 'modules/core/service_user/model/service_user.dart';
export 'modules/core/service_user/model/service_user_field.dart';
export 'modules/core/service_user/model/service_user_token.dart';
export 'modules/core/spotlight/spotlight_item.dart';
export 'modules/core/spotlight/spotlight_type.dart';
export 'modules/core/table/table_type.dart';
export 'modules/crm/app_client/models/app_client.dart';
export 'modules/crm/app_client/models/app_client_field.dart';
export 'modules/crm/company_company/models/company_company.dart';
export 'modules/crm/company_company/models/company_employee_field.dart';
export 'modules/crm/company_department/models/company_department.dart';
export 'modules/crm/company_department/models/company_department_field.dart';
export 'modules/crm/company_employee/models/company_employee.dart';
export 'modules/crm/company_employee/models/company_employee_department_jt.dart';
export 'modules/crm/company_employee/models/company_employee_field.dart';
export 'modules/crm/contact/models/contact.dart';
export 'modules/crm/contact/models/contact_field.dart';
export 'modules/crm/contact/models/contact_type.dart';
export 'modules/crm/country_code/models/country_code.dart';
export 'modules/crm/country_code/models/country_code_address_format.dart';
export 'modules/crm/country_code/models/country_code_contact_address_format.dart';
export 'modules/crm/country_code/models/country_code_field.dart';
export 'modules/crm/crm_event/models/crm_event.dart';
export 'modules/crm/crm_event/models/crm_event_contact_jt.dart';
export 'modules/crm/crm_event/models/crm_event_field.dart';
export 'modules/crm/crm_event/models/crm_event_status.dart';
export 'modules/crm/customer/models/customer.dart';
export 'modules/crm/customer/models/customer_field.dart';
export 'modules/crm/customer/models/customer_sales_order_hints.dart';
export 'modules/crm/customer/models/invoice_delivery_method.dart';
export 'modules/crm/customer/models/shipping_method.dart';
export 'modules/crm/customer/models/shipping_method_field.dart';
export 'modules/crm/customer_billing_customers/models/customer_billing_customer.dart';
export 'modules/crm/customer_billing_customers/models/customer_billing_customer_field.dart';
export 'modules/crm/customer_contacts/models/customer_contacts.dart';
export 'modules/crm/customer_contacts/models/customer_contacts_type.dart';
export 'modules/crm/customer_contacts/models/customer_field.dart';
export 'modules/crm/customer_customer/models/customer_customer.dart';
export 'modules/crm/customer_customer/models/customer_customer_field.dart';
export 'modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart';
export 'modules/crm/customer_shipping_contact/models/customer_shipping_contact_field.dart';
export 'modules/crm/department_code/models/department_code.dart';
export 'modules/crm/department_code/models/department_code_field.dart';
export 'modules/crm/language_code/models/language_code.dart';
export 'modules/crm/language_code/models/language_code_field.dart';
export 'modules/crm/payment_code/models/payment_code.dart';
export 'modules/crm/payment_code/models/payment_code_field.dart';
export 'modules/crm/salutation_code/models/salutation_code.dart';
export 'modules/crm/salutation_code/models/salutation_code_field.dart';
export 'modules/crm/salutation_code/models/salutation_code_formular.dart';
export 'modules/crm/salutation_code/models/salutation_type.dart';
export 'modules/prepress/artwork/models/artwork.dart';
export 'modules/prepress/artwork/models/artwork_additional_data_field.dart';
export 'modules/prepress/artwork/models/artwork_artwork_master.dart';
export 'modules/prepress/artwork/models/artwork_die_cutter_type.dart';
export 'modules/prepress/artwork/models/artwork_field.dart';
export 'modules/prepress/artwork/models/artwork_log.dart';
export 'modules/prepress/artwork/models/artwork_log_field.dart';
export 'modules/prepress/artwork/models/artwork_master.dart';
export 'modules/prepress/artwork/models/artwork_print_process_type.dart';
export 'modules/prepress/artwork/models/artwork_sales_order_update.dart';
export 'modules/prepress/artwork/models/artwork_type.dart';
export 'modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart';
export 'modules/prepress/artwork_quarantine/models/artwork_quarantine_field.dart';
export 'modules/prepress/artwork_quarantine/models/artwork_quaratine_analysis_data_dto.dart';
export 'modules/prepress/artwork_quarantine/models/color_specification.dart';
export 'modules/prepress/artwork_quarantine/models/font_info.dart';
export 'modules/prepress/artwork_quarantine/models/layer_info.dart';
export 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart';
export 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_field.dart';
export 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_status.dart';
export 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_type.dart';
export 'modules/prepress/artwork_quarantine_group/models/system_file.dart';
export 'modules/prepress/artwork_quarantine_group/models/system_file_attachment_type.dart';
export 'modules/prepress/artwork_template/models/artwork_template.dart';
export 'modules/prepress/artwork_template/models/artwork_template_field.dart';
export 'modules/prepress/artwork_template/models/artwork_template_pre_selection.dart';
export 'modules/prepress/artwork_template/models/artwork_template_pre_selection_field.dart';
export 'modules/prepress/artwork_template/models/artwork_template_selection.dart';
export 'modules/prepress/artwork_template/models/artwork_template_selection_field.dart';
export 'modules/prepress/bearer/models/bearer.dart';
export 'modules/prepress/bearer/models/bearer_field.dart';
export 'modules/prepress/bearer/models/bearer_type.dart';
export 'modules/prepress/bearer/models/types/bearer_flexo_print_multilayer.dart';
export 'modules/prepress/bearer/models/types/bearer_offset_press_fixed_plate.dart';
export 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_fixed_plate.dart';
export 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_min_plate.dart';
export 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_plate_equals_sub.dart';
export 'modules/prepress/bearer/models/types/bearer_standard_flexo.dart';
export 'modules/prepress/bearer/models/types/bearer_type1.dart';
export 'modules/prepress/bearer/models/types/bearer_type2.dart';
export 'modules/prepress/codes/models/artwork_code.dart';
export 'modules/prepress/codes/models/artwork_code_field.dart';
export 'modules/prepress/codes/models/artwork_code_type.dart';
export 'modules/prepress/codes/models/codes/aztec_code.dart';
export 'modules/prepress/codes/models/codes/template_code.dart';
export 'modules/prepress/codes/models/codes/twoOf5_code.dart';
export 'modules/prepress/color/models/artwork_color.dart';
export 'modules/prepress/color/models/artwork_color_field.dart';
export 'modules/prepress/color/models/artwork_color_print_process_type.dart';
export 'modules/prepress/color/models/artwork_color_spec_type.dart';
export 'modules/prepress/color/models/artwork_color_type.dart';
export 'modules/prepress/color/models/artwork_verarbeitungsebene_type.dart';
export 'modules/prepress/color_palette/models/prepress_color_palette.dart';
export 'modules/prepress/color_palette/models/prepress_color_palette_field.dart';
export 'modules/prepress/drucklayout/models/drucklayout.dart';
export 'modules/prepress/drucklayout/models/drucklayout_field.dart';
export 'modules/prepress/drucklayout/models/drucklayout_multi_nutzenlayout_jt.dart';
export 'modules/prepress/drucklayout/models/drucklayout_pre_selection.dart';
export 'modules/prepress/drucklayout/models/drucklayout_pre_selection_field.dart';
export 'modules/prepress/drucklayout/models/drucklayout_sales_order_jt.dart';
export 'modules/prepress/drucklayout/models/drucklayout_selection.dart';
export 'modules/prepress/drucklayout/models/drucklayout_selection_field.dart';
export 'modules/prepress/drucklayout/models/drucklayout_single_nutzenlayout_jt.dart';
export 'modules/prepress/layer/models/artwork_layer.dart';
export 'modules/prepress/layer/models/artwork_layer_field.dart';
export 'modules/prepress/layer/models/artwork_layer_type.dart';
export 'modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart';
export 'modules/prepress/nutzenlayout/models/nutzenlayout_cell_dto.dart';
export 'modules/prepress/nutzenlayout/models/nutzenlayout_column_dto.dart';
export 'modules/prepress/nutzenlayout/models/nutzenlayout_form_type.dart';
export 'modules/prepress/nutzenlayout/models/nutzenlayout_laufrichtung.dart';
export 'modules/prepress/nutzenlayout/models/nutzenlayout_type.dart';
export 'modules/prepress/nutzenlayout/models/nutzenlayout_unit_system.dart';
export 'modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart';
export 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_artwork_jt.dart';
export 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart';
export 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_light.dart';
export 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_artwork_jt.dart';
export 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart';
export 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_light.dart';
export 'modules/prepress/product/models/product.dart';
export 'modules/prepress/product/models/product_field.dart';
export 'modules/prepress/product/models/product_log.dart';
export 'modules/prepress/product/models/product_log_field.dart';
export 'modules/prepress/product/models/product_master.dart';
export 'modules/prepress/product/models/product_type.dart';
export 'modules/prepress/sales_order_item/models/sales_order_item.dart';
export 'modules/prepress/sales_order_item/models/sales_order_item_field.dart';
export 'modules/prepress/sales_order_item/models/sales_order_item_status.dart';
export 'modules/prepress/sales_order_item/models/sales_order_item_type.dart';
export 'modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_dto.dart';
export 'modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_field.dart';
export 'modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau.dart';
export 'modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau_field.dart';
export 'modules/prepress/sales_order_item/soi_prepare_artwork/models/eye_c_status.dart';
export 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork.dart';
export 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_additional_data_field.dart';
export 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_difficulty_level.dart';
export 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_field.dart';
export 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval.dart';
export 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_additional_data_field.dart';
export 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_field.dart';
export 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_type.dart';
export 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat.dart';
export 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat_field.dart';
export 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat_status.dart';
export 'modules/prepress/trapping/models/trapping.dart';
export 'modules/sales/sales_order/models/sales_order.dart';
export 'modules/sales/sales_order/models/sales_order_additional_data_field.dart';
export 'modules/sales/sales_order/models/sales_order_field.dart';
export 'modules/sales/sales_order/models/sales_order_status.dart';
export 'modules/sales/sales_order/models/sales_order_status_dto.dart';
export 'modules/sales/sales_order/models/sales_order_status_field.dart';
export 'modules/unsorted/dashboard_grid/dashboard_tile_config.dart';
export 'modules/unsorted/dashboard_grid/dashboard_tile_type.dart';
export 'modules/unsorted/ftp_interface/ftp_incoming_reply_type.dart';
export 'modules/unsorted/ftp_interface/ftp_interface.dart';
export 'modules/unsorted/ftp_interface/ftp_type.dart';
export 'modules/unsorted/json_designer/json_dto.dart';
export 'modules/unsorted/json_designer/json_field_type.dart';
export 'modules/unsorted/json_designer/json_template.dart';
export 'modules/unsorted/json_designer/json_template_field.dart';
export 'modules/unsorted/json_designer/json_template_type.dart';
export 'modules/unsorted/junction_tables/customer_bearer.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'bearer_type_prepress_flexo_print_multilayer',
      dartName: 'BearerTypeFlexoPrintMultilayerDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'bearer_type_prepress_flexo_print_multilayer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'machineControlFile',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'bearer_type_prepress_flexo_print_multilayer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'color_specifications',
      dartName: 'ColorSpecificationDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'color_specifications_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'book',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'egname',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'frequency',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'angle',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'dotshape',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'r',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'g',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'b',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'attribute',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'printingmethod',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'databaseColorId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'artworkQuarantineId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'color_specifications_fk_0',
          columns: ['databaseColorId'],
          referenceTable: 'ed_prepress_artwork_color',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'color_specifications_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_core_custom_entity_int_keys',
      dartName: 'CustomEntityIntKeys',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_core_custom_entity_int_keys_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tableType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TableType',
        ),
        _i2.ColumnDefinition(
          name: 'latestNumber',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_custom_entity_int_keys_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_core_entity_log',
      dartName: 'EntityLogDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_core_entity_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'entityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'oldValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'newValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'field',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tableType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TableType',
        ),
        _i2.ColumnDefinition(
          name: 'editedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'editedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_entity_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'log_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'entityId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'editedAt',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'tableType',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_app_client',
      dartName: 'AppClientDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_app_client_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'contactId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'automationEngine',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_app_client_fk_0',
          columns: ['contactId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_app_client_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'app_client_contact_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'contactId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_company_company',
      dartName: 'CompanyCompanyDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_company_company_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'companyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'companyCompanyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'note',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_company_company_fk_0',
          columns: ['companyId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_company_company_fk_1',
          columns: ['companyCompanyId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_company_company_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_company_department',
      dartName: 'CompanyDepartmentDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_crm_company_department_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'companyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_company_department_fk_0',
          columns: ['companyId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_company_department_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_company_employee',
      dartName: 'CompanyEmployeeDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_crm_company_employee_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'companyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'employeeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'position',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'active',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'note',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_company_employee_fk_0',
          columns: ['companyId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_company_employee_fk_1',
          columns: ['employeeId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_company_employee_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_contact',
      dartName: 'ContactDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_contact_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'initials',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fullName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'birthDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'customId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'customIdString',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'individualGreeting',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'importantNote',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address2',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address3',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'postCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'state',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'countryCodeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'languageCodeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'salutationCodeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'phone2',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'mobile',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'website',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'fax',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'migrationMatsPersonId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'matsContactId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'migrationMatsCompanyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'matsCompanyId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_contact_fk_0',
          columns: ['countryCodeId'],
          referenceTable: 'ed_crm_country_code',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_contact_fk_1',
          columns: ['languageCodeId'],
          referenceTable: 'ed_crm_language_code',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_contact_fk_2',
          columns: ['salutationCodeId'],
          referenceTable: 'ed_crm_salutation_code',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_contact_fk_3',
          columns: ['migrationMatsPersonId'],
          referenceTable: 'ed_migration_mats_person',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_contact_fk_4',
          columns: ['migrationMatsCompanyId'],
          referenceTable: 'ed_migration_mats_company',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_contact_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'contact_custom_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'customId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_country_code',
      dartName: 'CountryCodeDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_country_code_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'countryRegionName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isoCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'numericCode',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'addressFormat',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CountryCodeAddressFormat',
        ),
        _i2.ColumnDefinition(
          name: 'contactAddressFormat',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CountryCodeContactAddressFormat',
        ),
        _i2.ColumnDefinition(
          name: 'federalRegion',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'euCode',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'intrastatCode',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'taxScheme',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'showState',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimary',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_country_code_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'country_code_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'code',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'country_code_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'countryRegionName',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_customer',
      dartName: 'CustomerDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_customer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'registerNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'paymentCodeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'vatId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customIdString',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderHints',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:CustomerSalesOrderHintsDTO?',
        ),
        _i2.ColumnDefinition(
          name: 'invoiceEmail',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'invoiceDeliveryMethod',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingMethodId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'contractSovereigntyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'assignedUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'contactId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_fk_0',
          columns: ['paymentCodeId'],
          referenceTable: 'ed_crm_payment_code',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_fk_1',
          columns: ['shippingMethodId'],
          referenceTable: 'ed_crm_shipping_method',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_fk_2',
          columns: ['contractSovereigntyId'],
          referenceTable: 'ed_crm_app_client',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_fk_3',
          columns: ['assignedUserId'],
          referenceTable: 'ed_user_light_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_fk_4',
          columns: ['contactId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_customer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_contact_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'contactId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_custom_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'customId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_customer_billing_customer',
      dartName: 'CustomerBillingCustomerDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_crm_customer_billing_customer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'billingCustomerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimary',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_billing_customer_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_billing_customer_fk_1',
          columns: ['billingCustomerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_customer_billing_customer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_billing_customer_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'customerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'billingCustomerId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_customer_contacts',
      dartName: 'CustomerContactsDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_crm_customer_contacts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'contactId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:CustomerContactsType',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimary',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_contacts_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_contacts_fk_1',
          columns: ['contactId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_customer_contacts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_customer_customer',
      dartName: 'CustomerCustomerDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_crm_customer_customer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerCustomerContactId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_customer_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_customer_fk_1',
          columns: ['customerCustomerContactId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_customer_customer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_customer_shipping_contact',
      dartName: 'CustomerShippingContactDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_crm_customer_shipping_contact_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'shippingContactId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimary',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_shipping_contact_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_customer_shipping_contact_fk_1',
          columns: ['shippingContactId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_customer_shipping_contact_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'customer_shipping_contact_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'customerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'shippingContactId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_department_code',
      dartName: 'DepartmentCodeDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_department_code_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_department_code_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'department_code_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'code',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'department_code_description_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'description',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_event',
      dartName: 'CrmEventDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_event_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'endDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'executionDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_event_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_language_code',
      dartName: 'LanguageCodeDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_language_code_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'languageName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimary',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_language_code_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'language_code_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'code',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'language_code_language_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'languageName',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_payment_code',
      dartName: 'PaymentCodeDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_payment_code_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dueDateCalculation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'discountDateCalculation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'discountPercentage',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'calculateDiscountOnCreditNote',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_payment_code_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'payment_code_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'code',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_salutation_code',
      dartName: 'SalutationCodeDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_salutation_code_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimaryPerson',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimaryCompany',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_salutation_code_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'salutation_code_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'code',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'salutation_code_description_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'description',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_salutation_code_formular',
      dartName: 'SalutationCodeFormularDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_crm_salutation_code_formular_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'languageCodeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salutationType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:SalutationType',
        ),
        _i2.ColumnDefinition(
          name: 'salutation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'name1',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ContactField',
        ),
        _i2.ColumnDefinition(
          name: 'name2',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ContactField',
        ),
        _i2.ColumnDefinition(
          name: 'name3',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ContactField',
        ),
        _i2.ColumnDefinition(
          name: 'name4',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:ContactField',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_crm_salutation_code_formular_fk_0',
          columns: ['languageCodeId'],
          referenceTable: 'ed_crm_language_code',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_salutation_code_formular_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_crm_shipping_method',
      dartName: 'ShippingMethodDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_crm_shipping_method_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'code',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_crm_shipping_method_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'shipping_method_code_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'code',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_global_settings',
      dartName: 'GlobalSettingsDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_global_settings_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'globalSettingsJson',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_global_settings_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_migration_mats_company',
      dartName: 'MigrationMatsCompanyDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_migration_mats_company_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'idAccount',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'account',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'account2',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'idAramis',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'idStaff',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'idAvVerantw',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'standort',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingStreet1',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingStreet2',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingPostalCode',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingCity',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingCountry',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingState',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'phone1',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'phone2',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fax',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'website',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isMigrated',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_migration_mats_company_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_migration_mats_person',
      dartName: 'MigrationMatsPersonDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_migration_mats_person_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'idContact',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'nameFirst',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'nameLast',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'anrede',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'titel',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'department',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'position',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'anredeLang',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'idAccount',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isPerson',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'primaryStreet1',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryStreet2',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryPostalCode',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryCity',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryCountry',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'primaryState',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'telefon1',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'telefon2',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'mobilTelefon',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'fax',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'wK',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'wWf',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'wFp',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'contactInfor',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'isMigrated',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_migration_mats_person_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork',
      dartName: 'ArtworkDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_prepress_artwork_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkMasterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'abzug',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'reference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isLocked',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'dieCutterType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'layerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkQuarantineId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'artworkType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'printProcessType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'codes',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkCodeDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'width',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'height',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'cornerRadius',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'trapping',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:TrappingDTO',
        ),
        _i2.ColumnDefinition(
          name: 'layers',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkLayerDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'anschnitt',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'colors',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkColorDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_fk_1',
          columns: ['artworkMasterId'],
          referenceTable: 'ed_prepress_artwork_master',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_fk_2',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_fk_3',
          columns: ['artworkQuarantineId'],
          referenceTable: 'ed_prepress_artwork_quarantine',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_fk_4',
          columns: ['productId'],
          referenceTable: 'ed_prepress_product',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artwork_sales_order_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkMasterId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_color',
      dartName: 'ArtworkColorDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_color_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'colorName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'shortName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'color',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'l',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'a',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'b',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'customText',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'colorSpecType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'colorType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'verarbeitungsEbene',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'printProcess',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'screenLineature',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'screenAngle',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'screenPointForm',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'boost',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'colorPaletteId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_color_fk_0',
          columns: ['colorPaletteId'],
          referenceTable: 'ed_prepress_color_palette',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_color_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_log',
      dartName: 'ArtworkLogDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'entityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderCustomId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'oldValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'newValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'field',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tableType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TableType',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_master',
      dartName: 'ArtworkMasterDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_master_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'reference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'layerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkQuarantineId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'productId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'codes',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkCodeDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'artworkType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'printProcessType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'width',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'height',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'cornerRadius',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'dieCutterType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'trapping',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:TrappingDTO',
        ),
        _i2.ColumnDefinition(
          name: 'layers',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkLayerDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'anschnitt',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'colors',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkColorDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_master_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_master_fk_1',
          columns: ['productId'],
          referenceTable: 'ed_prepress_product_master',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_master_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'artwork_master_quarantine_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkQuarantineId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_quarantine',
      dartName: 'ArtworkQuarantineDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_quarantine_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'groupId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'quarantineUuid',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'keywords',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'originalFilePath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'productType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'printProcessType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'width',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'height',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'cornerRadius',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'analysisData',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:ArtworkQuarantineAnalysisDataDTO?',
        ),
        _i2.ColumnDefinition(
          name: 'colors',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:ArtworkColorDTO>?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_quarantine_fk_0',
          columns: ['groupId'],
          referenceTable: 'ed_prepress_artwork_quarantine_group',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_quarantine_fk_1',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_quarantine_fk_2',
          columns: ['artworkId'],
          referenceTable: 'ed_prepress_artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_quarantine_fk_3',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_quarantine_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_quarantine_group',
      dartName: 'ArtworkQuarantineGroupDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_quarantine_group_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'artworkType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'productType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'printProcessType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'width',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'height',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'cornerRadius',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'selectedProductSeriesId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'outputPath',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'attachments',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'List<protocol:SystemFileDTO>?',
        ),
        _i2.ColumnDefinition(
          name: 'assignedUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'sendToAeAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'sendToAeBy',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_quarantine_group_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_quarantine_group_fk_1',
          columns: ['assignedUserId'],
          referenceTable: 'ed_user_light_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_quarantine_group_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_template',
      dartName: 'ArtworkTemplateDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_template_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'artworkTemplateSelectionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkTemplatePreSelectionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'trapping',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:TrappingDTO',
        ),
        _i2.ColumnDefinition(
          name: 'layers',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkLayerDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'anschnitt',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'colors',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkColorDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_template_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_template_fk_1',
          columns: ['artworkTemplateSelectionId'],
          referenceTable: 'ed_prepress_artwork_template_selection',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_template_fk_2',
          columns: ['artworkTemplatePreSelectionId'],
          referenceTable: 'ed_prepress_artwork_template_pre_selection',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_template_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_template_pre_selection',
      dartName: 'ArtworkTemplatePreSelectionDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_template_pre_selection_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_template_pre_selection_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_template_pre_selection_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_artwork_template_selection',
      dartName: 'ArtworkTemplateSelectionDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_artwork_template_selection_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkTemplatePreSelectionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_artwork_template_selection_fk_0',
          columns: ['artworkTemplatePreSelectionId'],
          referenceTable: 'ed_prepress_artwork_template_pre_selection',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_artwork_template_selection_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_bearer',
      dartName: 'BearerDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_prepress_bearer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:BearerType',
        ),
        _i2.ColumnDefinition(
          name: 'bearerName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'longText',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'costCenterCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type1Id',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'type2Id',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'typeStandardFlexoPrintId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'typeFlexoPrintMultilayerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'typeSheetFedPressMinPlateId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'typeSheetFedPressPlateEqualsSubId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'typeOffsetPressFixedPlateId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'typeSheetFedPressFixedPlateId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_0',
          columns: ['type1Id'],
          referenceTable: 'prepress_bearer_type1',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_1',
          columns: ['type2Id'],
          referenceTable: 'prepress_bearer_type2',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_2',
          columns: ['typeStandardFlexoPrintId'],
          referenceTable: 'prepress_bearer_type_standard_flexo_print',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_3',
          columns: ['typeFlexoPrintMultilayerId'],
          referenceTable: 'bearer_type_prepress_flexo_print_multilayer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_4',
          columns: ['typeSheetFedPressMinPlateId'],
          referenceTable: 'prepress_bearer_type_sheet_fed_press_min_plate',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_5',
          columns: ['typeSheetFedPressPlateEqualsSubId'],
          referenceTable:
              'prepress_bearer_type_sheet_fed_press_plate_equals_sub',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_6',
          columns: ['typeOffsetPressFixedPlateId'],
          referenceTable: 'prepress_bearer_type_offset_press_fixed_plate',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_bearer_fk_7',
          columns: ['typeSheetFedPressFixedPlateId'],
          referenceTable: 'prepress_bearer_type_sheet_fed_press_fixed_plate',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_bearer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_color_palette',
      dartName: 'PrepressColorPaletteDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_color_palette_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'paletteName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_color_palette_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_color_palette_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_drucklayout',
      dartName: 'DrucklayoutDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_drucklayout_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'title',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'drucklayoutSelectionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'drucklayoutPreSelectionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_drucklayout_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_drucklayout_fk_1',
          columns: ['drucklayoutSelectionId'],
          referenceTable: 'ed_prepress_drucklayout_selection',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_drucklayout_fk_2',
          columns: ['drucklayoutPreSelectionId'],
          referenceTable: 'ed_prepress_drucklayout_pre_selection',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_drucklayout_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_drucklayout_pre_selection',
      dartName: 'DrucklayoutPreSelectionDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_drucklayout_pre_selection_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_drucklayout_pre_selection_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_drucklayout_pre_selection_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_drucklayout_selection',
      dartName: 'DrucklayoutSelectionDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_drucklayout_selection_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'drucklayoutPreSelectionId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_drucklayout_selection_fk_0',
          columns: ['drucklayoutPreSelectionId'],
          referenceTable: 'ed_prepress_drucklayout_pre_selection',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_drucklayout_selection_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_nutzenlayout',
      dartName: 'NutzenlayoutDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_nutzenlayout_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'drucklaenge',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'formType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:NutzenlayoutFormType',
        ),
        _i2.ColumnDefinition(
          name: 'nutzenlayoutColumns',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:NutzenlayoutColumnDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'dimensions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:NutzenlayoutArtworkDimensions>',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'leadingUnitSystem',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_nutzenlayout_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_nutzenlayout_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_product',
      dartName: 'ProductDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_prepress_product_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'serienId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'serienIndex',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'serienIdString',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'productMasterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'keywords',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'productType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'printProcessType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_product_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_product_fk_1',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_product_fk_2',
          columns: ['productMasterId'],
          referenceTable: 'ed_prepress_product_master',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_product_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'product_sales_order_id_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'productMasterId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_product_log',
      dartName: 'ProductLogDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_product_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'entityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderCustomId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'oldValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'newValue',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'field',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tableType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:TableType',
        ),
        _i2.ColumnDefinition(
          name: 'updatedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'updatedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_product_log_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_product_master',
      dartName: 'ProductMasterDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_product_master_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'serienId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'serienIdString',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'serienIndex',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'keywords',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'productType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'printProcessType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_product_master_fk_0',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_product_master_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_sales_order_multi_nutzenlayout',
      dartName: 'SalesOrderMultiNutzenlayoutDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_sales_order_multi_nutzenlayout_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'nutzenlayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'cellArtworkAssignments',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:ArtworkArtworkMaster>',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_sales_order_multi_nutzenlayout_fk_0',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_sales_order_multi_nutzenlayout_fk_1',
          columns: ['nutzenlayoutId'],
          referenceTable: 'ed_prepress_nutzenlayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_sales_order_multi_nutzenlayout_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_sales_order_single_nutzenlayout',
      dartName: 'SalesOrderSingleNutzenlayoutDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_sales_order_single_nutzenlayout_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'nutzenlayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_sales_order_single_nutzenlayout_fk_0',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_sales_order_single_nutzenlayout_fk_1',
          columns: ['nutzenlayoutId'],
          referenceTable: 'ed_prepress_nutzenlayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_sales_order_single_nutzenlayout_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_soi_consulting',
      dartName: 'SoiConsultingDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_soi_consulting_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderItemId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_consulting_fk_0',
          columns: ['salesOrderItemId'],
          referenceTable: 'ed_sales_order_item',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_soi_consulting_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_soi_einzelformaufbau',
      dartName: 'SoiEinzelformaufbauDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_soi_einzelformaufbau_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkMasterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'version',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderItemId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_einzelformaufbau_fk_0',
          columns: ['artworkId'],
          referenceTable: 'ed_prepress_artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_einzelformaufbau_fk_1',
          columns: ['salesOrderItemId'],
          referenceTable: 'ed_sales_order_item',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_soi_einzelformaufbau_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'soi_einzelformaufbau_artwork_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_soi_prepare_artwork',
      dartName: 'SoiPrepareArtworkDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_soi_prepare_artwork_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkMasterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'eyeCStatus',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'difficultyLevel',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderItemId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_prepare_artwork_fk_0',
          columns: ['artworkId'],
          referenceTable: 'ed_prepress_artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_prepare_artwork_fk_1',
          columns: ['salesOrderItemId'],
          referenceTable: 'ed_sales_order_item',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_soi_prepare_artwork_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'soi_prepare_artwork_artwork_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_soi_request_artwork_approval',
      dartName: 'SoiRequestArtworkApprovalDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_soi_request_artwork_approval_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkMasterId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'approvalType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderItemId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_request_artwork_approval_fk_0',
          columns: ['artworkId'],
          referenceTable: 'ed_prepress_artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_request_artwork_approval_fk_1',
          columns: ['salesOrderItemId'],
          referenceTable: 'ed_sales_order_item',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_soi_request_artwork_approval_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'soi_request_artwork_approval_artwork_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_prepress_soi_step_and_repeat',
      dartName: 'SoiStepAndRepeatDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_prepress_soi_step_and_repeat_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'soiId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_step_and_repeat_fk_0',
          columns: ['artworkId'],
          referenceTable: 'ed_prepress_artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_prepress_soi_step_and_repeat_fk_1',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_prepress_soi_step_and_repeat_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_sales_order_item',
      dartName: 'SalesOrderItemDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_sales_order_item_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'deadline',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'billableTime',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'soiTypePrimaryKey',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'assignedUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_order_item_fk_0',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_order_item_fk_1',
          columns: ['assignedUserId'],
          referenceTable: 'ed_user_light_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_sales_order_item_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_sales_sales_order',
      dartName: 'SalesOrderDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_sales_sales_order_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'customId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customIdString',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'keywords',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'billingAddressId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'shippingAddressId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'assignedUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'customerCustomerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'customerCustomerContactPersonId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerContactPersonId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'customerFirstReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerSecondReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'customerCustomerReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_sales_order_fk_0',
          columns: ['billingAddressId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_sales_order_fk_1',
          columns: ['shippingAddressId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_sales_order_fk_2',
          columns: ['assignedUserId'],
          referenceTable: 'ed_user_light_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_sales_order_fk_3',
          columns: ['customerCustomerId'],
          referenceTable: 'ed_crm_customer_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_sales_order_fk_4',
          columns: ['customerCustomerContactPersonId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_sales_order_fk_5',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_sales_sales_order_fk_6',
          columns: ['customerContactPersonId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_sales_sales_order_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_sales_sales_order_status',
      dartName: 'SalesOrderStatusDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_sales_sales_order_status_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'color',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'orderId',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_sales_sales_order_status_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'sales_order_status_description_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'description',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_user_app_user',
      dartName: 'AppUserDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_user_app_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'firstName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'lastName',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'initials',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'birthDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'address',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'address2',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'postCode',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'city',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'state',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'countryCodeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'phone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mobile',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'privateEmail',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'employeeNumber',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'entryDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'terminationDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'departmentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'position',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'costCenter',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_user_app_user_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_user_app_user_fk_1',
          columns: ['countryCodeId'],
          referenceTable: 'ed_crm_country_code',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_user_app_user_fk_2',
          columns: ['departmentId'],
          referenceTable: 'ed_crm_department_code',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_user_app_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'app_user_name_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'firstName',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'lastName',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
        _i2.IndexDefinition(
          indexName: 'app_user_initials_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'initials',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_user_service_user',
      dartName: 'ServiceUserDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_user_service_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'serviceName',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'serviceDescription',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isActive',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_user_service_user_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_user_service_user_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'service_user_user_info_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ed_user_service_user_token',
      dartName: 'ServiceUserTokenDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_user_service_user_token_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'authKeyId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'tokenDescription',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: '_edUserServiceUserTokensEdUserServiceUserId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_user_service_user_token_fk_0',
          columns: ['authKeyId'],
          referenceTable: 'serverpod_auth_key',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_user_service_user_token_fk_1',
          columns: ['_edUserServiceUserTokensEdUserServiceUserId'],
          referenceTable: 'ed_user_service_user',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_user_service_user_token_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'service_user_token_auth_key_id_unique_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'authKeyId',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'elb_json_template',
      dartName: 'JsonTemplateDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'elb_json_template_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:JsonTemplateType',
        ),
        _i2.ColumnDefinition(
          name: 'json',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'protocol:JsonDTO',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'elb_json_template_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jt_company_employee_department',
      dartName: 'CompanyEmployeeDepartmentJT',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'jt_company_employee_department_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'companyEmployeeId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'companyDepartmentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_company_employee_department_fk_0',
          columns: ['companyEmployeeId'],
          referenceTable: 'ed_crm_company_employee',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_company_employee_department_fk_1',
          columns: ['companyDepartmentId'],
          referenceTable: 'ed_crm_company_department',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jt_company_employee_department_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'company_employee_department_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'companyEmployeeId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'companyDepartmentId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jt_crm_event_contacts',
      dartName: 'CrmEventContactJT',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'jt_crm_event_contacts_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'crmEventId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'contactId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_crm_event_contacts_fk_0',
          columns: ['crmEventId'],
          referenceTable: 'ed_crm_event',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_crm_event_contacts_fk_1',
          columns: ['contactId'],
          referenceTable: 'ed_crm_contact',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jt_crm_event_contacts_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'crm_event_contact_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'crmEventId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'contactId',
            ),
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jt_drucklayout_multi_nutzenlayout',
      dartName: 'DrucklayoutMultiNutzenlayoutJT',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'jt_drucklayout_multi_nutzenlayout_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'drucklayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderMultiNutzenlayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_multi_nutzenlayout_fk_0',
          columns: ['drucklayoutId'],
          referenceTable: 'ed_prepress_drucklayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_multi_nutzenlayout_fk_1',
          columns: ['salesOrderMultiNutzenlayoutId'],
          referenceTable: 'ed_prepress_sales_order_multi_nutzenlayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_multi_nutzenlayout_fk_2',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jt_drucklayout_multi_nutzenlayout_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'drucklayout_multi_nutzenlayout_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'drucklayoutId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderMultiNutzenlayoutId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jt_drucklayout_sales_order',
      dartName: 'DrucklayoutSalesOrderJT',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'jt_drucklayout_sales_order_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'drucklayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_sales_order_fk_0',
          columns: ['drucklayoutId'],
          referenceTable: 'ed_prepress_drucklayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_sales_order_fk_1',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jt_drucklayout_sales_order_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'drucklayout_sales_order_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'drucklayoutId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jt_drucklayout_single_nutzenlayout',
      dartName: 'DrucklayoutSingleNutzenlayoutJT',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'jt_drucklayout_single_nutzenlayout_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'drucklayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderSingleNutzenlayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_single_nutzenlayout_fk_0',
          columns: ['drucklayoutId'],
          referenceTable: 'ed_prepress_drucklayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_single_nutzenlayout_fk_1',
          columns: ['salesOrderSingleNutzenlayoutId'],
          referenceTable: 'ed_prepress_sales_order_single_nutzenlayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_drucklayout_single_nutzenlayout_fk_2',
          columns: ['salesOrderId'],
          referenceTable: 'ed_sales_sales_order',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jt_drucklayout_single_nutzenlayout_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'drucklayout_single_nutzenlayout_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'drucklayoutId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderSingleNutzenlayoutId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jt_sales_order_multi_nutzenlayout_artworks',
      dartName: 'SalesOrderMultiNutzenlayoutArtworkJT',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'jt_sales_order_multi_nutzenlayout_artworks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderMultiNutzenlayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_sales_order_multi_nutzenlayout_artworks_fk_0',
          columns: ['salesOrderMultiNutzenlayoutId'],
          referenceTable: 'ed_prepress_sales_order_multi_nutzenlayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_sales_order_multi_nutzenlayout_artworks_fk_1',
          columns: ['artworkId'],
          referenceTable: 'ed_prepress_artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jt_sales_order_multi_nutzenlayout_artworks_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'sales_order_multi_nutzenlayout_artwork_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderMultiNutzenlayoutId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'jt_sales_order_single_nutzenlayout_artworks',
      dartName: 'SalesOrderSingleNutzenlayoutArtworkJT',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'jt_sales_order_single_nutzenlayout_artworks_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'salesOrderSingleNutzenlayoutId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'artworkId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_sales_order_single_nutzenlayout_artworks_fk_0',
          columns: ['salesOrderSingleNutzenlayoutId'],
          referenceTable: 'ed_prepress_sales_order_single_nutzenlayout',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'jt_sales_order_single_nutzenlayout_artworks_fk_1',
          columns: ['artworkId'],
          referenceTable: 'ed_prepress_artwork',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'jt_sales_order_single_nutzenlayout_artworks_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'sales_order_single_nutzenlayout_artwork_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'salesOrderSingleNutzenlayoutId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'artworkId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_customer_relation',
      dartName: 'BearerCustomerRelation',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'prepress_bearer_customer_relation_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'bearerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'customerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'prepress_bearer_customer_relation_fk_0',
          columns: ['bearerId'],
          referenceTable: 'ed_prepress_bearer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'prepress_bearer_customer_relation_fk_1',
          columns: ['customerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_bearer_customer_relation_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'bearer_customer_index_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'bearerId',
            ),
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'customerId',
            ),
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_type1',
      dartName: 'BearerType1DTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'prepress_bearer_type1_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'marginLeft',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'marginRight',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_bearer_type1_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_type2',
      dartName: 'BearerType2DTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'prepress_bearer_type2_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'minWidth',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'minHeight',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_bearer_type2_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_type_offset_press_fixed_plate',
      dartName: 'BearerTypeOffsetPressFixedPlateDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'prepress_bearer_type_offset_press_fixed_plate_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'machineControlFile',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'rasterFieldType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'registrationMarkType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_bearer_type_offset_press_fixed_plate_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_type_sheet_fed_press_fixed_plate',
      dartName: 'BearerTypeSheetFedPressFixedPlateDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'prepress_bearer_type_sheet_fed_press_fixed_plate_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'machineControlFile',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'rasterFieldType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'registrationMarkType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_bearer_type_sheet_fed_press_fixed_plate_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_type_sheet_fed_press_min_plate',
      dartName: 'BearerTypeSheetFedPressMinPlateDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'prepress_bearer_type_sheet_fed_press_min_plate_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'machineControlFile',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'rasterFieldType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'registrationMarkType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'atsType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_bearer_type_sheet_fed_press_min_plate_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_type_sheet_fed_press_plate_equals_sub',
      dartName: 'BearerTypeSheetFedPressPlateEqualsSubDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'prepress_bearer_type_sheet_fed_press_plate_equals_sub_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'machineControlFile',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'rasterFieldType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'registrationMarkType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName:
              'prepress_bearer_type_sheet_fed_press_plate_equals_sub_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_bearer_type_standard_flexo_print',
      dartName: 'BearerTypeStandardFlexoPrintDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'prepress_bearer_type_standard_flexo_print_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'machineControlFile',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'rasterFieldType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'registrationMarkType',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_bearer_type_standard_flexo_print_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'prepress_ftp_interface',
      dartName: 'FTPInterfaceDTO',
      schema: 'public',
      module: 'elbdesk',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'prepress_ftp_interface_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:FTPType',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'host',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'user',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'password',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'port',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dataInput',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'extractZip',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'workflowStart',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'incomingReplyType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:FTPIncomingReplyType',
        ),
        _i2.ColumnDefinition(
          name: 'incomingConfirmationReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'incomingConfirmation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'incomingConfirmationEmail',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'incomingClientConfirmationReference',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'incomingClientConfirmation',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'incomingClientConfirmationEmail',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dataOutput',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'createdById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'lastModifiedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'deletedById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingById',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'editingSince',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'isDraft',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'editingSession',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: '_edCrmCustomerFtpinterfacesEdCrmCustomerId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'prepress_ftp_interface_fk_0',
          columns: ['_edCrmCustomerFtpinterfacesEdCrmCustomerId'],
          referenceTable: 'ed_crm_customer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'prepress_ftp_interface_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i4.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i5.SalutationCodeFormularDTO) {
      return _i5.SalutationCodeFormularDTO.fromJson(data) as T;
    }
    if (t == _i6.MigrationMatsCompanyDTO) {
      return _i6.MigrationMatsCompanyDTO.fromJson(data) as T;
    }
    if (t == _i7.MigrationMatsCompanyField) {
      return _i7.MigrationMatsCompanyField.fromJson(data) as T;
    }
    if (t == _i8.MigrationMatsPersonDTO) {
      return _i8.MigrationMatsPersonDTO.fromJson(data) as T;
    }
    if (t == _i9.MigrationMatsPersonField) {
      return _i9.MigrationMatsPersonField.fromJson(data) as T;
    }
    if (t == _i10.AppScope) {
      return _i10.AppScope.fromJson(data) as T;
    }
    if (t == _i11.AppUserDTO) {
      return _i11.AppUserDTO.fromJson(data) as T;
    }
    if (t == _i12.AppUserField) {
      return _i12.AppUserField.fromJson(data) as T;
    }
    if (t == _i13.CustomEntityIntKeys) {
      return _i13.CustomEntityIntKeys.fromJson(data) as T;
    }
    if (t == _i14.EntityLogDTO) {
      return _i14.EntityLogDTO.fromJson(data) as T;
    }
    if (t == _i15.EntityLogField) {
      return _i15.EntityLogField.fromJson(data) as T;
    }
    if (t == _i16.GlobalSettingsDTO) {
      return _i16.GlobalSettingsDTO.fromJson(data) as T;
    }
    if (t == _i17.GlobalSettingsField) {
      return _i17.GlobalSettingsField.fromJson(data) as T;
    }
    if (t == _i18.ServiceUserDTO) {
      return _i18.ServiceUserDTO.fromJson(data) as T;
    }
    if (t == _i19.ServiceUserField) {
      return _i19.ServiceUserField.fromJson(data) as T;
    }
    if (t == _i20.ServiceUserTokenDTO) {
      return _i20.ServiceUserTokenDTO.fromJson(data) as T;
    }
    if (t == _i21.SpotlightItem) {
      return _i21.SpotlightItem.fromJson(data) as T;
    }
    if (t == _i22.SpotlightType) {
      return _i22.SpotlightType.fromJson(data) as T;
    }
    if (t == _i23.TableType) {
      return _i23.TableType.fromJson(data) as T;
    }
    if (t == _i24.AppClientDTO) {
      return _i24.AppClientDTO.fromJson(data) as T;
    }
    if (t == _i25.AppClientField) {
      return _i25.AppClientField.fromJson(data) as T;
    }
    if (t == _i26.CompanyCompanyDTO) {
      return _i26.CompanyCompanyDTO.fromJson(data) as T;
    }
    if (t == _i27.CompanyCompanyField) {
      return _i27.CompanyCompanyField.fromJson(data) as T;
    }
    if (t == _i28.CompanyDepartmentDTO) {
      return _i28.CompanyDepartmentDTO.fromJson(data) as T;
    }
    if (t == _i29.CompanyDepartmentField) {
      return _i29.CompanyDepartmentField.fromJson(data) as T;
    }
    if (t == _i30.CompanyEmployeeDTO) {
      return _i30.CompanyEmployeeDTO.fromJson(data) as T;
    }
    if (t == _i31.CompanyEmployeeDepartmentJT) {
      return _i31.CompanyEmployeeDepartmentJT.fromJson(data) as T;
    }
    if (t == _i32.CompanyEmployeeField) {
      return _i32.CompanyEmployeeField.fromJson(data) as T;
    }
    if (t == _i33.ContactDTO) {
      return _i33.ContactDTO.fromJson(data) as T;
    }
    if (t == _i34.ContactField) {
      return _i34.ContactField.fromJson(data) as T;
    }
    if (t == _i35.ContactType) {
      return _i35.ContactType.fromJson(data) as T;
    }
    if (t == _i36.CountryCodeDTO) {
      return _i36.CountryCodeDTO.fromJson(data) as T;
    }
    if (t == _i37.CountryCodeAddressFormat) {
      return _i37.CountryCodeAddressFormat.fromJson(data) as T;
    }
    if (t == _i38.CountryCodeContactAddressFormat) {
      return _i38.CountryCodeContactAddressFormat.fromJson(data) as T;
    }
    if (t == _i39.CountryCodeField) {
      return _i39.CountryCodeField.fromJson(data) as T;
    }
    if (t == _i40.CrmEventDTO) {
      return _i40.CrmEventDTO.fromJson(data) as T;
    }
    if (t == _i41.CrmEventContactJT) {
      return _i41.CrmEventContactJT.fromJson(data) as T;
    }
    if (t == _i42.CrmEventField) {
      return _i42.CrmEventField.fromJson(data) as T;
    }
    if (t == _i43.CrmEventStatus) {
      return _i43.CrmEventStatus.fromJson(data) as T;
    }
    if (t == _i44.CustomerDTO) {
      return _i44.CustomerDTO.fromJson(data) as T;
    }
    if (t == _i45.CustomerField) {
      return _i45.CustomerField.fromJson(data) as T;
    }
    if (t == _i46.CustomerSalesOrderHintsDTO) {
      return _i46.CustomerSalesOrderHintsDTO.fromJson(data) as T;
    }
    if (t == _i47.InvoiceDeliveryMethod) {
      return _i47.InvoiceDeliveryMethod.fromJson(data) as T;
    }
    if (t == _i48.ShippingMethodDTO) {
      return _i48.ShippingMethodDTO.fromJson(data) as T;
    }
    if (t == _i49.ShippingMethodField) {
      return _i49.ShippingMethodField.fromJson(data) as T;
    }
    if (t == _i50.CustomerBillingCustomerDTO) {
      return _i50.CustomerBillingCustomerDTO.fromJson(data) as T;
    }
    if (t == _i51.CustomerBillingCustomerField) {
      return _i51.CustomerBillingCustomerField.fromJson(data) as T;
    }
    if (t == _i52.CustomerContactsDTO) {
      return _i52.CustomerContactsDTO.fromJson(data) as T;
    }
    if (t == _i53.CustomerContactsType) {
      return _i53.CustomerContactsType.fromJson(data) as T;
    }
    if (t == _i54.CustomerContactsField) {
      return _i54.CustomerContactsField.fromJson(data) as T;
    }
    if (t == _i55.CustomerCustomerDTO) {
      return _i55.CustomerCustomerDTO.fromJson(data) as T;
    }
    if (t == _i56.CustomerCustomerField) {
      return _i56.CustomerCustomerField.fromJson(data) as T;
    }
    if (t == _i57.CustomerShippingContactDTO) {
      return _i57.CustomerShippingContactDTO.fromJson(data) as T;
    }
    if (t == _i58.CustomerShippingContactField) {
      return _i58.CustomerShippingContactField.fromJson(data) as T;
    }
    if (t == _i59.DepartmentCodeDTO) {
      return _i59.DepartmentCodeDTO.fromJson(data) as T;
    }
    if (t == _i60.DepartmentCodeField) {
      return _i60.DepartmentCodeField.fromJson(data) as T;
    }
    if (t == _i61.LanguageCodeDTO) {
      return _i61.LanguageCodeDTO.fromJson(data) as T;
    }
    if (t == _i62.LanguageCodeField) {
      return _i62.LanguageCodeField.fromJson(data) as T;
    }
    if (t == _i63.PaymentCodeDTO) {
      return _i63.PaymentCodeDTO.fromJson(data) as T;
    }
    if (t == _i64.PaymentCodeField) {
      return _i64.PaymentCodeField.fromJson(data) as T;
    }
    if (t == _i65.SalutationCodeDTO) {
      return _i65.SalutationCodeDTO.fromJson(data) as T;
    }
    if (t == _i66.SalutationCodeField) {
      return _i66.SalutationCodeField.fromJson(data) as T;
    }
    if (t == _i67.ElbExceptionMessage) {
      return _i67.ElbExceptionMessage.fromJson(data) as T;
    }
    if (t == _i68.SalutationType) {
      return _i68.SalutationType.fromJson(data) as T;
    }
    if (t == _i69.ArtworkDTO) {
      return _i69.ArtworkDTO.fromJson(data) as T;
    }
    if (t == _i70.ArtworkAdditionalDataField) {
      return _i70.ArtworkAdditionalDataField.fromJson(data) as T;
    }
    if (t == _i71.ArtworkArtworkMaster) {
      return _i71.ArtworkArtworkMaster.fromJson(data) as T;
    }
    if (t == _i72.ArtworkDieCutterType) {
      return _i72.ArtworkDieCutterType.fromJson(data) as T;
    }
    if (t == _i73.ArtworkField) {
      return _i73.ArtworkField.fromJson(data) as T;
    }
    if (t == _i74.ArtworkLogDTO) {
      return _i74.ArtworkLogDTO.fromJson(data) as T;
    }
    if (t == _i75.ArtworkLogField) {
      return _i75.ArtworkLogField.fromJson(data) as T;
    }
    if (t == _i76.ArtworkMasterDTO) {
      return _i76.ArtworkMasterDTO.fromJson(data) as T;
    }
    if (t == _i77.ArtworkPrintProcessType) {
      return _i77.ArtworkPrintProcessType.fromJson(data) as T;
    }
    if (t == _i78.ArtworkSalesOrderUpdate) {
      return _i78.ArtworkSalesOrderUpdate.fromJson(data) as T;
    }
    if (t == _i79.ArtworkType) {
      return _i79.ArtworkType.fromJson(data) as T;
    }
    if (t == _i80.ArtworkQuarantineDTO) {
      return _i80.ArtworkQuarantineDTO.fromJson(data) as T;
    }
    if (t == _i81.ArtworkQuarantineField) {
      return _i81.ArtworkQuarantineField.fromJson(data) as T;
    }
    if (t == _i82.ArtworkQuarantineAnalysisDataDTO) {
      return _i82.ArtworkQuarantineAnalysisDataDTO.fromJson(data) as T;
    }
    if (t == _i83.ColorSpecificationDTO) {
      return _i83.ColorSpecificationDTO.fromJson(data) as T;
    }
    if (t == _i84.FontInfoDTO) {
      return _i84.FontInfoDTO.fromJson(data) as T;
    }
    if (t == _i85.LayerInfoDTO) {
      return _i85.LayerInfoDTO.fromJson(data) as T;
    }
    if (t == _i86.ArtworkQuarantineGroupDTO) {
      return _i86.ArtworkQuarantineGroupDTO.fromJson(data) as T;
    }
    if (t == _i87.ArtworkQuarantineGroupField) {
      return _i87.ArtworkQuarantineGroupField.fromJson(data) as T;
    }
    if (t == _i88.ArtworkQuarantineGroupStatus) {
      return _i88.ArtworkQuarantineGroupStatus.fromJson(data) as T;
    }
    if (t == _i89.ArtworkQuarantineGroupType) {
      return _i89.ArtworkQuarantineGroupType.fromJson(data) as T;
    }
    if (t == _i90.SystemFileDTO) {
      return _i90.SystemFileDTO.fromJson(data) as T;
    }
    if (t == _i91.SystemFileAttachmentType) {
      return _i91.SystemFileAttachmentType.fromJson(data) as T;
    }
    if (t == _i92.ArtworkTemplateDTO) {
      return _i92.ArtworkTemplateDTO.fromJson(data) as T;
    }
    if (t == _i93.ArtworkTemplateField) {
      return _i93.ArtworkTemplateField.fromJson(data) as T;
    }
    if (t == _i94.ArtworkTemplatePreSelectionDTO) {
      return _i94.ArtworkTemplatePreSelectionDTO.fromJson(data) as T;
    }
    if (t == _i95.ArtworkTemplatePreSelectionField) {
      return _i95.ArtworkTemplatePreSelectionField.fromJson(data) as T;
    }
    if (t == _i96.ArtworkTemplateSelectionDTO) {
      return _i96.ArtworkTemplateSelectionDTO.fromJson(data) as T;
    }
    if (t == _i97.ArtworkTemplateSelectionField) {
      return _i97.ArtworkTemplateSelectionField.fromJson(data) as T;
    }
    if (t == _i98.BearerDTO) {
      return _i98.BearerDTO.fromJson(data) as T;
    }
    if (t == _i99.BearerField) {
      return _i99.BearerField.fromJson(data) as T;
    }
    if (t == _i100.BearerType) {
      return _i100.BearerType.fromJson(data) as T;
    }
    if (t == _i101.BearerTypeFlexoPrintMultilayerDTO) {
      return _i101.BearerTypeFlexoPrintMultilayerDTO.fromJson(data) as T;
    }
    if (t == _i102.BearerTypeOffsetPressFixedPlateDTO) {
      return _i102.BearerTypeOffsetPressFixedPlateDTO.fromJson(data) as T;
    }
    if (t == _i103.BearerTypeSheetFedPressFixedPlateDTO) {
      return _i103.BearerTypeSheetFedPressFixedPlateDTO.fromJson(data) as T;
    }
    if (t == _i104.BearerTypeSheetFedPressMinPlateDTO) {
      return _i104.BearerTypeSheetFedPressMinPlateDTO.fromJson(data) as T;
    }
    if (t == _i105.BearerTypeSheetFedPressPlateEqualsSubDTO) {
      return _i105.BearerTypeSheetFedPressPlateEqualsSubDTO.fromJson(data) as T;
    }
    if (t == _i106.BearerTypeStandardFlexoPrintDTO) {
      return _i106.BearerTypeStandardFlexoPrintDTO.fromJson(data) as T;
    }
    if (t == _i107.BearerType1DTO) {
      return _i107.BearerType1DTO.fromJson(data) as T;
    }
    if (t == _i108.BearerType2DTO) {
      return _i108.BearerType2DTO.fromJson(data) as T;
    }
    if (t == _i109.ArtworkCodeDTO) {
      return _i109.ArtworkCodeDTO.fromJson(data) as T;
    }
    if (t == _i110.ArtworkCodeField) {
      return _i110.ArtworkCodeField.fromJson(data) as T;
    }
    if (t == _i111.ArtworkCodeType) {
      return _i111.ArtworkCodeType.fromJson(data) as T;
    }
    if (t == _i112.AztecCodeDTO) {
      return _i112.AztecCodeDTO.fromJson(data) as T;
    }
    if (t == _i113.TemplateCodeDTO) {
      return _i113.TemplateCodeDTO.fromJson(data) as T;
    }
    if (t == _i114.TwoOf5CodeDTO) {
      return _i114.TwoOf5CodeDTO.fromJson(data) as T;
    }
    if (t == _i115.ArtworkColorDTO) {
      return _i115.ArtworkColorDTO.fromJson(data) as T;
    }
    if (t == _i116.ArtworkColorField) {
      return _i116.ArtworkColorField.fromJson(data) as T;
    }
    if (t == _i117.ArtworkColorPrintProcessType) {
      return _i117.ArtworkColorPrintProcessType.fromJson(data) as T;
    }
    if (t == _i118.ArtworkColorSpecType) {
      return _i118.ArtworkColorSpecType.fromJson(data) as T;
    }
    if (t == _i119.ArtworkColorType) {
      return _i119.ArtworkColorType.fromJson(data) as T;
    }
    if (t == _i120.ArtworkVerarbeitungsebeneType) {
      return _i120.ArtworkVerarbeitungsebeneType.fromJson(data) as T;
    }
    if (t == _i121.PrepressColorPaletteDTO) {
      return _i121.PrepressColorPaletteDTO.fromJson(data) as T;
    }
    if (t == _i122.PrepressColorPaletteField) {
      return _i122.PrepressColorPaletteField.fromJson(data) as T;
    }
    if (t == _i123.DrucklayoutDTO) {
      return _i123.DrucklayoutDTO.fromJson(data) as T;
    }
    if (t == _i124.DrucklayoutField) {
      return _i124.DrucklayoutField.fromJson(data) as T;
    }
    if (t == _i125.DrucklayoutMultiNutzenlayoutJT) {
      return _i125.DrucklayoutMultiNutzenlayoutJT.fromJson(data) as T;
    }
    if (t == _i126.DrucklayoutPreSelectionDTO) {
      return _i126.DrucklayoutPreSelectionDTO.fromJson(data) as T;
    }
    if (t == _i127.DrucklayoutPreSelectionField) {
      return _i127.DrucklayoutPreSelectionField.fromJson(data) as T;
    }
    if (t == _i128.DrucklayoutSalesOrderJT) {
      return _i128.DrucklayoutSalesOrderJT.fromJson(data) as T;
    }
    if (t == _i129.BearerCustomerRelation) {
      return _i129.BearerCustomerRelation.fromJson(data) as T;
    }
    if (t == _i130.DrucklayoutSelectionField) {
      return _i130.DrucklayoutSelectionField.fromJson(data) as T;
    }
    if (t == _i131.DrucklayoutSingleNutzenlayoutJT) {
      return _i131.DrucklayoutSingleNutzenlayoutJT.fromJson(data) as T;
    }
    if (t == _i132.ArtworkLayerDTO) {
      return _i132.ArtworkLayerDTO.fromJson(data) as T;
    }
    if (t == _i133.ArtworkLayerField) {
      return _i133.ArtworkLayerField.fromJson(data) as T;
    }
    if (t == _i134.ArtworkLayerType) {
      return _i134.ArtworkLayerType.fromJson(data) as T;
    }
    if (t == _i135.NutzenlayoutArtworkDimensions) {
      return _i135.NutzenlayoutArtworkDimensions.fromJson(data) as T;
    }
    if (t == _i136.NutzenlayoutCellDTO) {
      return _i136.NutzenlayoutCellDTO.fromJson(data) as T;
    }
    if (t == _i137.NutzenlayoutColumnDTO) {
      return _i137.NutzenlayoutColumnDTO.fromJson(data) as T;
    }
    if (t == _i138.NutzenlayoutFormType) {
      return _i138.NutzenlayoutFormType.fromJson(data) as T;
    }
    if (t == _i139.NutzenlayoutLaufrichtung) {
      return _i139.NutzenlayoutLaufrichtung.fromJson(data) as T;
    }
    if (t == _i140.NutzenlayoutType) {
      return _i140.NutzenlayoutType.fromJson(data) as T;
    }
    if (t == _i141.NutzenlayoutUnitSystem) {
      return _i141.NutzenlayoutUnitSystem.fromJson(data) as T;
    }
    if (t == _i142.NutzenlayoutDTO) {
      return _i142.NutzenlayoutDTO.fromJson(data) as T;
    }
    if (t == _i143.SalesOrderMultiNutzenlayoutArtworkJT) {
      return _i143.SalesOrderMultiNutzenlayoutArtworkJT.fromJson(data) as T;
    }
    if (t == _i144.SalesOrderMultiNutzenlayoutDTO) {
      return _i144.SalesOrderMultiNutzenlayoutDTO.fromJson(data) as T;
    }
    if (t == _i145.SalesOrderMultiNutzenlayoutLightDTO) {
      return _i145.SalesOrderMultiNutzenlayoutLightDTO.fromJson(data) as T;
    }
    if (t == _i146.SalesOrderSingleNutzenlayoutArtworkJT) {
      return _i146.SalesOrderSingleNutzenlayoutArtworkJT.fromJson(data) as T;
    }
    if (t == _i147.SalesOrderSingleNutzenlayoutDTO) {
      return _i147.SalesOrderSingleNutzenlayoutDTO.fromJson(data) as T;
    }
    if (t == _i148.SalesOrderSingleNutzenlayoutLightDTO) {
      return _i148.SalesOrderSingleNutzenlayoutLightDTO.fromJson(data) as T;
    }
    if (t == _i149.ProductDTO) {
      return _i149.ProductDTO.fromJson(data) as T;
    }
    if (t == _i150.ProductField) {
      return _i150.ProductField.fromJson(data) as T;
    }
    if (t == _i151.ProductLogDTO) {
      return _i151.ProductLogDTO.fromJson(data) as T;
    }
    if (t == _i152.ProductLogField) {
      return _i152.ProductLogField.fromJson(data) as T;
    }
    if (t == _i153.ProductMasterDTO) {
      return _i153.ProductMasterDTO.fromJson(data) as T;
    }
    if (t == _i154.ProductType) {
      return _i154.ProductType.fromJson(data) as T;
    }
    if (t == _i155.SalesOrderItemDTO) {
      return _i155.SalesOrderItemDTO.fromJson(data) as T;
    }
    if (t == _i156.SalesOrderItemField) {
      return _i156.SalesOrderItemField.fromJson(data) as T;
    }
    if (t == _i157.SalesOrderItemStatus) {
      return _i157.SalesOrderItemStatus.fromJson(data) as T;
    }
    if (t == _i158.SalesOrderItemType) {
      return _i158.SalesOrderItemType.fromJson(data) as T;
    }
    if (t == _i159.SoiConsultingDTO) {
      return _i159.SoiConsultingDTO.fromJson(data) as T;
    }
    if (t == _i160.SoiConsultingField) {
      return _i160.SoiConsultingField.fromJson(data) as T;
    }
    if (t == _i161.SoiEinzelformaufbauDTO) {
      return _i161.SoiEinzelformaufbauDTO.fromJson(data) as T;
    }
    if (t == _i162.SoiEinzelformaufbauField) {
      return _i162.SoiEinzelformaufbauField.fromJson(data) as T;
    }
    if (t == _i163.EyeCStatus) {
      return _i163.EyeCStatus.fromJson(data) as T;
    }
    if (t == _i164.SoiPrepareArtworkDTO) {
      return _i164.SoiPrepareArtworkDTO.fromJson(data) as T;
    }
    if (t == _i165.SoiPrepareArtworkAdditionalDataField) {
      return _i165.SoiPrepareArtworkAdditionalDataField.fromJson(data) as T;
    }
    if (t == _i166.SoiPrepareArtworkDifficultyLevel) {
      return _i166.SoiPrepareArtworkDifficultyLevel.fromJson(data) as T;
    }
    if (t == _i167.SoiPrepareArtworkField) {
      return _i167.SoiPrepareArtworkField.fromJson(data) as T;
    }
    if (t == _i168.SoiRequestArtworkApprovalDTO) {
      return _i168.SoiRequestArtworkApprovalDTO.fromJson(data) as T;
    }
    if (t == _i169.SoiRequestArtworkApprovalAdditionalDataField) {
      return _i169.SoiRequestArtworkApprovalAdditionalDataField.fromJson(data)
          as T;
    }
    if (t == _i170.SoiRequestArtworkApprovalField) {
      return _i170.SoiRequestArtworkApprovalField.fromJson(data) as T;
    }
    if (t == _i171.SoiRequestArtworkApprovalType) {
      return _i171.SoiRequestArtworkApprovalType.fromJson(data) as T;
    }
    if (t == _i172.SoiStepAndRepeatDTO) {
      return _i172.SoiStepAndRepeatDTO.fromJson(data) as T;
    }
    if (t == _i173.SoiStepAndRepeatField) {
      return _i173.SoiStepAndRepeatField.fromJson(data) as T;
    }
    if (t == _i174.SoiStepAndRepeatStatus) {
      return _i174.SoiStepAndRepeatStatus.fromJson(data) as T;
    }
    if (t == _i175.TrappingDTO) {
      return _i175.TrappingDTO.fromJson(data) as T;
    }
    if (t == _i176.SalesOrderDTO) {
      return _i176.SalesOrderDTO.fromJson(data) as T;
    }
    if (t == _i177.SalesOrderAdditionalDataField) {
      return _i177.SalesOrderAdditionalDataField.fromJson(data) as T;
    }
    if (t == _i178.SalesOrderField) {
      return _i178.SalesOrderField.fromJson(data) as T;
    }
    if (t == _i179.SalesOrderStatus) {
      return _i179.SalesOrderStatus.fromJson(data) as T;
    }
    if (t == _i180.SalesOrderStatusDTO) {
      return _i180.SalesOrderStatusDTO.fromJson(data) as T;
    }
    if (t == _i181.SalesOrderStatusField) {
      return _i181.SalesOrderStatusField.fromJson(data) as T;
    }
    if (t == _i182.DashboardTileConfigDTO) {
      return _i182.DashboardTileConfigDTO.fromJson(data) as T;
    }
    if (t == _i183.DashboardTileType) {
      return _i183.DashboardTileType.fromJson(data) as T;
    }
    if (t == _i184.FTPIncomingReplyType) {
      return _i184.FTPIncomingReplyType.fromJson(data) as T;
    }
    if (t == _i185.FTPInterfaceDTO) {
      return _i185.FTPInterfaceDTO.fromJson(data) as T;
    }
    if (t == _i186.FTPType) {
      return _i186.FTPType.fromJson(data) as T;
    }
    if (t == _i187.JsonDTO) {
      return _i187.JsonDTO.fromJson(data) as T;
    }
    if (t == _i188.JsonFieldType) {
      return _i188.JsonFieldType.fromJson(data) as T;
    }
    if (t == _i189.JsonTemplateDTO) {
      return _i189.JsonTemplateDTO.fromJson(data) as T;
    }
    if (t == _i190.JsonTemplateField) {
      return _i190.JsonTemplateField.fromJson(data) as T;
    }
    if (t == _i191.JsonTemplateType) {
      return _i191.JsonTemplateType.fromJson(data) as T;
    }
    if (t == _i192.DrucklayoutSelectionDTO) {
      return _i192.DrucklayoutSelectionDTO.fromJson(data) as T;
    }
    if (t == _i1.getType<_i5.SalutationCodeFormularDTO?>()) {
      return (data != null
          ? _i5.SalutationCodeFormularDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i6.MigrationMatsCompanyDTO?>()) {
      return (data != null ? _i6.MigrationMatsCompanyDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.MigrationMatsCompanyField?>()) {
      return (data != null
          ? _i7.MigrationMatsCompanyField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i8.MigrationMatsPersonDTO?>()) {
      return (data != null ? _i8.MigrationMatsPersonDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.MigrationMatsPersonField?>()) {
      return (data != null ? _i9.MigrationMatsPersonField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.AppScope?>()) {
      return (data != null ? _i10.AppScope.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.AppUserDTO?>()) {
      return (data != null ? _i11.AppUserDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.AppUserField?>()) {
      return (data != null ? _i12.AppUserField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.CustomEntityIntKeys?>()) {
      return (data != null ? _i13.CustomEntityIntKeys.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.EntityLogDTO?>()) {
      return (data != null ? _i14.EntityLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.EntityLogField?>()) {
      return (data != null ? _i15.EntityLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.GlobalSettingsDTO?>()) {
      return (data != null ? _i16.GlobalSettingsDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.GlobalSettingsField?>()) {
      return (data != null ? _i17.GlobalSettingsField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i18.ServiceUserDTO?>()) {
      return (data != null ? _i18.ServiceUserDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.ServiceUserField?>()) {
      return (data != null ? _i19.ServiceUserField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.ServiceUserTokenDTO?>()) {
      return (data != null ? _i20.ServiceUserTokenDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.SpotlightItem?>()) {
      return (data != null ? _i21.SpotlightItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.SpotlightType?>()) {
      return (data != null ? _i22.SpotlightType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.TableType?>()) {
      return (data != null ? _i23.TableType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.AppClientDTO?>()) {
      return (data != null ? _i24.AppClientDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.AppClientField?>()) {
      return (data != null ? _i25.AppClientField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.CompanyCompanyDTO?>()) {
      return (data != null ? _i26.CompanyCompanyDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.CompanyCompanyField?>()) {
      return (data != null ? _i27.CompanyCompanyField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.CompanyDepartmentDTO?>()) {
      return (data != null ? _i28.CompanyDepartmentDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i29.CompanyDepartmentField?>()) {
      return (data != null ? _i29.CompanyDepartmentField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.CompanyEmployeeDTO?>()) {
      return (data != null ? _i30.CompanyEmployeeDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i31.CompanyEmployeeDepartmentJT?>()) {
      return (data != null
          ? _i31.CompanyEmployeeDepartmentJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i32.CompanyEmployeeField?>()) {
      return (data != null ? _i32.CompanyEmployeeField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i33.ContactDTO?>()) {
      return (data != null ? _i33.ContactDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.ContactField?>()) {
      return (data != null ? _i34.ContactField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.ContactType?>()) {
      return (data != null ? _i35.ContactType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i36.CountryCodeDTO?>()) {
      return (data != null ? _i36.CountryCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.CountryCodeAddressFormat?>()) {
      return (data != null
          ? _i37.CountryCodeAddressFormat.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i38.CountryCodeContactAddressFormat?>()) {
      return (data != null
          ? _i38.CountryCodeContactAddressFormat.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i39.CountryCodeField?>()) {
      return (data != null ? _i39.CountryCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.CrmEventDTO?>()) {
      return (data != null ? _i40.CrmEventDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.CrmEventContactJT?>()) {
      return (data != null ? _i41.CrmEventContactJT.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.CrmEventField?>()) {
      return (data != null ? _i42.CrmEventField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.CrmEventStatus?>()) {
      return (data != null ? _i43.CrmEventStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i44.CustomerDTO?>()) {
      return (data != null ? _i44.CustomerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i45.CustomerField?>()) {
      return (data != null ? _i45.CustomerField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.CustomerSalesOrderHintsDTO?>()) {
      return (data != null
          ? _i46.CustomerSalesOrderHintsDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i47.InvoiceDeliveryMethod?>()) {
      return (data != null ? _i47.InvoiceDeliveryMethod.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i48.ShippingMethodDTO?>()) {
      return (data != null ? _i48.ShippingMethodDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i49.ShippingMethodField?>()) {
      return (data != null ? _i49.ShippingMethodField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.CustomerBillingCustomerDTO?>()) {
      return (data != null
          ? _i50.CustomerBillingCustomerDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i51.CustomerBillingCustomerField?>()) {
      return (data != null
          ? _i51.CustomerBillingCustomerField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i52.CustomerContactsDTO?>()) {
      return (data != null ? _i52.CustomerContactsDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.CustomerContactsType?>()) {
      return (data != null ? _i53.CustomerContactsType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i54.CustomerContactsField?>()) {
      return (data != null ? _i54.CustomerContactsField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i55.CustomerCustomerDTO?>()) {
      return (data != null ? _i55.CustomerCustomerDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i56.CustomerCustomerField?>()) {
      return (data != null ? _i56.CustomerCustomerField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i57.CustomerShippingContactDTO?>()) {
      return (data != null
          ? _i57.CustomerShippingContactDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i58.CustomerShippingContactField?>()) {
      return (data != null
          ? _i58.CustomerShippingContactField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i59.DepartmentCodeDTO?>()) {
      return (data != null ? _i59.DepartmentCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.DepartmentCodeField?>()) {
      return (data != null ? _i60.DepartmentCodeField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i61.LanguageCodeDTO?>()) {
      return (data != null ? _i61.LanguageCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.LanguageCodeField?>()) {
      return (data != null ? _i62.LanguageCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.PaymentCodeDTO?>()) {
      return (data != null ? _i63.PaymentCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i64.PaymentCodeField?>()) {
      return (data != null ? _i64.PaymentCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i65.SalutationCodeDTO?>()) {
      return (data != null ? _i65.SalutationCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.SalutationCodeField?>()) {
      return (data != null ? _i66.SalutationCodeField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i67.ElbExceptionMessage?>()) {
      return (data != null ? _i67.ElbExceptionMessage.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i68.SalutationType?>()) {
      return (data != null ? _i68.SalutationType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i69.ArtworkDTO?>()) {
      return (data != null ? _i69.ArtworkDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i70.ArtworkAdditionalDataField?>()) {
      return (data != null
          ? _i70.ArtworkAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i71.ArtworkArtworkMaster?>()) {
      return (data != null ? _i71.ArtworkArtworkMaster.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i72.ArtworkDieCutterType?>()) {
      return (data != null ? _i72.ArtworkDieCutterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i73.ArtworkField?>()) {
      return (data != null ? _i73.ArtworkField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i74.ArtworkLogDTO?>()) {
      return (data != null ? _i74.ArtworkLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i75.ArtworkLogField?>()) {
      return (data != null ? _i75.ArtworkLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i76.ArtworkMasterDTO?>()) {
      return (data != null ? _i76.ArtworkMasterDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i77.ArtworkPrintProcessType?>()) {
      return (data != null ? _i77.ArtworkPrintProcessType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i78.ArtworkSalesOrderUpdate?>()) {
      return (data != null ? _i78.ArtworkSalesOrderUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i79.ArtworkType?>()) {
      return (data != null ? _i79.ArtworkType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i80.ArtworkQuarantineDTO?>()) {
      return (data != null ? _i80.ArtworkQuarantineDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i81.ArtworkQuarantineField?>()) {
      return (data != null ? _i81.ArtworkQuarantineField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i82.ArtworkQuarantineAnalysisDataDTO?>()) {
      return (data != null
          ? _i82.ArtworkQuarantineAnalysisDataDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i83.ColorSpecificationDTO?>()) {
      return (data != null ? _i83.ColorSpecificationDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i84.FontInfoDTO?>()) {
      return (data != null ? _i84.FontInfoDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i85.LayerInfoDTO?>()) {
      return (data != null ? _i85.LayerInfoDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i86.ArtworkQuarantineGroupDTO?>()) {
      return (data != null
          ? _i86.ArtworkQuarantineGroupDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i87.ArtworkQuarantineGroupField?>()) {
      return (data != null
          ? _i87.ArtworkQuarantineGroupField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i88.ArtworkQuarantineGroupStatus?>()) {
      return (data != null
          ? _i88.ArtworkQuarantineGroupStatus.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i89.ArtworkQuarantineGroupType?>()) {
      return (data != null
          ? _i89.ArtworkQuarantineGroupType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i90.SystemFileDTO?>()) {
      return (data != null ? _i90.SystemFileDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i91.SystemFileAttachmentType?>()) {
      return (data != null
          ? _i91.SystemFileAttachmentType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i92.ArtworkTemplateDTO?>()) {
      return (data != null ? _i92.ArtworkTemplateDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i93.ArtworkTemplateField?>()) {
      return (data != null ? _i93.ArtworkTemplateField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i94.ArtworkTemplatePreSelectionDTO?>()) {
      return (data != null
          ? _i94.ArtworkTemplatePreSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i95.ArtworkTemplatePreSelectionField?>()) {
      return (data != null
          ? _i95.ArtworkTemplatePreSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i96.ArtworkTemplateSelectionDTO?>()) {
      return (data != null
          ? _i96.ArtworkTemplateSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i97.ArtworkTemplateSelectionField?>()) {
      return (data != null
          ? _i97.ArtworkTemplateSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i98.BearerDTO?>()) {
      return (data != null ? _i98.BearerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i99.BearerField?>()) {
      return (data != null ? _i99.BearerField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i100.BearerType?>()) {
      return (data != null ? _i100.BearerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i101.BearerTypeFlexoPrintMultilayerDTO?>()) {
      return (data != null
          ? _i101.BearerTypeFlexoPrintMultilayerDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i102.BearerTypeOffsetPressFixedPlateDTO?>()) {
      return (data != null
          ? _i102.BearerTypeOffsetPressFixedPlateDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i103.BearerTypeSheetFedPressFixedPlateDTO?>()) {
      return (data != null
          ? _i103.BearerTypeSheetFedPressFixedPlateDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i104.BearerTypeSheetFedPressMinPlateDTO?>()) {
      return (data != null
          ? _i104.BearerTypeSheetFedPressMinPlateDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i105.BearerTypeSheetFedPressPlateEqualsSubDTO?>()) {
      return (data != null
          ? _i105.BearerTypeSheetFedPressPlateEqualsSubDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i106.BearerTypeStandardFlexoPrintDTO?>()) {
      return (data != null
          ? _i106.BearerTypeStandardFlexoPrintDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i107.BearerType1DTO?>()) {
      return (data != null ? _i107.BearerType1DTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i108.BearerType2DTO?>()) {
      return (data != null ? _i108.BearerType2DTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i109.ArtworkCodeDTO?>()) {
      return (data != null ? _i109.ArtworkCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i110.ArtworkCodeField?>()) {
      return (data != null ? _i110.ArtworkCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i111.ArtworkCodeType?>()) {
      return (data != null ? _i111.ArtworkCodeType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i112.AztecCodeDTO?>()) {
      return (data != null ? _i112.AztecCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i113.TemplateCodeDTO?>()) {
      return (data != null ? _i113.TemplateCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i114.TwoOf5CodeDTO?>()) {
      return (data != null ? _i114.TwoOf5CodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i115.ArtworkColorDTO?>()) {
      return (data != null ? _i115.ArtworkColorDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i116.ArtworkColorField?>()) {
      return (data != null ? _i116.ArtworkColorField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i117.ArtworkColorPrintProcessType?>()) {
      return (data != null
          ? _i117.ArtworkColorPrintProcessType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i118.ArtworkColorSpecType?>()) {
      return (data != null ? _i118.ArtworkColorSpecType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i119.ArtworkColorType?>()) {
      return (data != null ? _i119.ArtworkColorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i120.ArtworkVerarbeitungsebeneType?>()) {
      return (data != null
          ? _i120.ArtworkVerarbeitungsebeneType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i121.PrepressColorPaletteDTO?>()) {
      return (data != null
          ? _i121.PrepressColorPaletteDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i122.PrepressColorPaletteField?>()) {
      return (data != null
          ? _i122.PrepressColorPaletteField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i123.DrucklayoutDTO?>()) {
      return (data != null ? _i123.DrucklayoutDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i124.DrucklayoutField?>()) {
      return (data != null ? _i124.DrucklayoutField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i125.DrucklayoutMultiNutzenlayoutJT?>()) {
      return (data != null
          ? _i125.DrucklayoutMultiNutzenlayoutJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i126.DrucklayoutPreSelectionDTO?>()) {
      return (data != null
          ? _i126.DrucklayoutPreSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i127.DrucklayoutPreSelectionField?>()) {
      return (data != null
          ? _i127.DrucklayoutPreSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i128.DrucklayoutSalesOrderJT?>()) {
      return (data != null
          ? _i128.DrucklayoutSalesOrderJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i129.BearerCustomerRelation?>()) {
      return (data != null ? _i129.BearerCustomerRelation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i130.DrucklayoutSelectionField?>()) {
      return (data != null
          ? _i130.DrucklayoutSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i131.DrucklayoutSingleNutzenlayoutJT?>()) {
      return (data != null
          ? _i131.DrucklayoutSingleNutzenlayoutJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i132.ArtworkLayerDTO?>()) {
      return (data != null ? _i132.ArtworkLayerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i133.ArtworkLayerField?>()) {
      return (data != null ? _i133.ArtworkLayerField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i134.ArtworkLayerType?>()) {
      return (data != null ? _i134.ArtworkLayerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i135.NutzenlayoutArtworkDimensions?>()) {
      return (data != null
          ? _i135.NutzenlayoutArtworkDimensions.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i136.NutzenlayoutCellDTO?>()) {
      return (data != null ? _i136.NutzenlayoutCellDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i137.NutzenlayoutColumnDTO?>()) {
      return (data != null ? _i137.NutzenlayoutColumnDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i138.NutzenlayoutFormType?>()) {
      return (data != null ? _i138.NutzenlayoutFormType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i139.NutzenlayoutLaufrichtung?>()) {
      return (data != null
          ? _i139.NutzenlayoutLaufrichtung.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i140.NutzenlayoutType?>()) {
      return (data != null ? _i140.NutzenlayoutType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i141.NutzenlayoutUnitSystem?>()) {
      return (data != null ? _i141.NutzenlayoutUnitSystem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i142.NutzenlayoutDTO?>()) {
      return (data != null ? _i142.NutzenlayoutDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i143.SalesOrderMultiNutzenlayoutArtworkJT?>()) {
      return (data != null
          ? _i143.SalesOrderMultiNutzenlayoutArtworkJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i144.SalesOrderMultiNutzenlayoutDTO?>()) {
      return (data != null
          ? _i144.SalesOrderMultiNutzenlayoutDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i145.SalesOrderMultiNutzenlayoutLightDTO?>()) {
      return (data != null
          ? _i145.SalesOrderMultiNutzenlayoutLightDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i146.SalesOrderSingleNutzenlayoutArtworkJT?>()) {
      return (data != null
          ? _i146.SalesOrderSingleNutzenlayoutArtworkJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i147.SalesOrderSingleNutzenlayoutDTO?>()) {
      return (data != null
          ? _i147.SalesOrderSingleNutzenlayoutDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i148.SalesOrderSingleNutzenlayoutLightDTO?>()) {
      return (data != null
          ? _i148.SalesOrderSingleNutzenlayoutLightDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i149.ProductDTO?>()) {
      return (data != null ? _i149.ProductDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i150.ProductField?>()) {
      return (data != null ? _i150.ProductField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i151.ProductLogDTO?>()) {
      return (data != null ? _i151.ProductLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i152.ProductLogField?>()) {
      return (data != null ? _i152.ProductLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i153.ProductMasterDTO?>()) {
      return (data != null ? _i153.ProductMasterDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i154.ProductType?>()) {
      return (data != null ? _i154.ProductType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i155.SalesOrderItemDTO?>()) {
      return (data != null ? _i155.SalesOrderItemDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i156.SalesOrderItemField?>()) {
      return (data != null ? _i156.SalesOrderItemField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i157.SalesOrderItemStatus?>()) {
      return (data != null ? _i157.SalesOrderItemStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i158.SalesOrderItemType?>()) {
      return (data != null ? _i158.SalesOrderItemType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i159.SoiConsultingDTO?>()) {
      return (data != null ? _i159.SoiConsultingDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i160.SoiConsultingField?>()) {
      return (data != null ? _i160.SoiConsultingField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i161.SoiEinzelformaufbauDTO?>()) {
      return (data != null ? _i161.SoiEinzelformaufbauDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i162.SoiEinzelformaufbauField?>()) {
      return (data != null
          ? _i162.SoiEinzelformaufbauField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i163.EyeCStatus?>()) {
      return (data != null ? _i163.EyeCStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i164.SoiPrepareArtworkDTO?>()) {
      return (data != null ? _i164.SoiPrepareArtworkDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i165.SoiPrepareArtworkAdditionalDataField?>()) {
      return (data != null
          ? _i165.SoiPrepareArtworkAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i166.SoiPrepareArtworkDifficultyLevel?>()) {
      return (data != null
          ? _i166.SoiPrepareArtworkDifficultyLevel.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i167.SoiPrepareArtworkField?>()) {
      return (data != null ? _i167.SoiPrepareArtworkField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i168.SoiRequestArtworkApprovalDTO?>()) {
      return (data != null
          ? _i168.SoiRequestArtworkApprovalDTO.fromJson(data)
          : null) as T;
    }
    if (t ==
        _i1.getType<_i169.SoiRequestArtworkApprovalAdditionalDataField?>()) {
      return (data != null
          ? _i169.SoiRequestArtworkApprovalAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i170.SoiRequestArtworkApprovalField?>()) {
      return (data != null
          ? _i170.SoiRequestArtworkApprovalField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i171.SoiRequestArtworkApprovalType?>()) {
      return (data != null
          ? _i171.SoiRequestArtworkApprovalType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i172.SoiStepAndRepeatDTO?>()) {
      return (data != null ? _i172.SoiStepAndRepeatDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i173.SoiStepAndRepeatField?>()) {
      return (data != null ? _i173.SoiStepAndRepeatField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i174.SoiStepAndRepeatStatus?>()) {
      return (data != null ? _i174.SoiStepAndRepeatStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i175.TrappingDTO?>()) {
      return (data != null ? _i175.TrappingDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i176.SalesOrderDTO?>()) {
      return (data != null ? _i176.SalesOrderDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i177.SalesOrderAdditionalDataField?>()) {
      return (data != null
          ? _i177.SalesOrderAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i178.SalesOrderField?>()) {
      return (data != null ? _i178.SalesOrderField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i179.SalesOrderStatus?>()) {
      return (data != null ? _i179.SalesOrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i180.SalesOrderStatusDTO?>()) {
      return (data != null ? _i180.SalesOrderStatusDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i181.SalesOrderStatusField?>()) {
      return (data != null ? _i181.SalesOrderStatusField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i182.DashboardTileConfigDTO?>()) {
      return (data != null ? _i182.DashboardTileConfigDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i183.DashboardTileType?>()) {
      return (data != null ? _i183.DashboardTileType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i184.FTPIncomingReplyType?>()) {
      return (data != null ? _i184.FTPIncomingReplyType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i185.FTPInterfaceDTO?>()) {
      return (data != null ? _i185.FTPInterfaceDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i186.FTPType?>()) {
      return (data != null ? _i186.FTPType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i187.JsonDTO?>()) {
      return (data != null ? _i187.JsonDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i188.JsonFieldType?>()) {
      return (data != null ? _i188.JsonFieldType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i189.JsonTemplateDTO?>()) {
      return (data != null ? _i189.JsonTemplateDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i190.JsonTemplateField?>()) {
      return (data != null ? _i190.JsonTemplateField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i191.JsonTemplateType?>()) {
      return (data != null ? _i191.JsonTemplateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i192.DrucklayoutSelectionDTO?>()) {
      return (data != null
          ? _i192.DrucklayoutSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<List<_i20.ServiceUserTokenDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i20.ServiceUserTokenDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i31.CompanyEmployeeDepartmentJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i31.CompanyEmployeeDepartmentJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i31.CompanyEmployeeDepartmentJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i31.CompanyEmployeeDepartmentJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i41.CrmEventContactJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i41.CrmEventContactJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i41.CrmEventContactJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i41.CrmEventContactJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i185.FTPInterfaceDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i185.FTPInterfaceDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i129.BearerCustomerRelation>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i129.BearerCustomerRelation>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i121.PrepressColorPaletteDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i121.PrepressColorPaletteDTO>(e))
              .toList()
          : null) as T;
    }
    if (t ==
        _i1.getType<List<_i146.SalesOrderSingleNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i146.SalesOrderSingleNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i143.SalesOrderMultiNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i143.SalesOrderMultiNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i109.ArtworkCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i109.ArtworkCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i132.ArtworkLayerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i132.ArtworkLayerDTO>(e))
          .toList() as T;
    }
    if (t == List<_i115.ArtworkColorDTO>) {
      return (data as List)
          .map((e) => deserialize<_i115.ArtworkColorDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i115.ArtworkColorDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i115.ArtworkColorDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i83.ColorSpecificationDTO>) {
      return (data as List)
          .map((e) => deserialize<_i83.ColorSpecificationDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i90.SystemFileDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i90.SystemFileDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i80.ArtworkQuarantineDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i80.ArtworkQuarantineDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i129.BearerCustomerRelation>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i129.BearerCustomerRelation>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i115.ArtworkColorDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i115.ArtworkColorDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i128.DrucklayoutSalesOrderJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i128.DrucklayoutSalesOrderJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i131.DrucklayoutSingleNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i131.DrucklayoutSingleNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i125.DrucklayoutMultiNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i125.DrucklayoutMultiNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i136.NutzenlayoutCellDTO>) {
      return (data as List)
          .map((e) => deserialize<_i136.NutzenlayoutCellDTO>(e))
          .toList() as T;
    }
    if (t == List<_i137.NutzenlayoutColumnDTO>) {
      return (data as List)
          .map((e) => deserialize<_i137.NutzenlayoutColumnDTO>(e))
          .toList() as T;
    }
    if (t == List<_i135.NutzenlayoutArtworkDimensions>) {
      return (data as List)
          .map((e) => deserialize<_i135.NutzenlayoutArtworkDimensions>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i143.SalesOrderMultiNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i143.SalesOrderMultiNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i125.DrucklayoutMultiNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i125.DrucklayoutMultiNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i71.ArtworkArtworkMaster>) {
      return (data as List)
          .map((e) => deserialize<_i71.ArtworkArtworkMaster>(e))
          .toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t ==
        _i1.getType<List<_i146.SalesOrderSingleNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i146.SalesOrderSingleNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i131.DrucklayoutSingleNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i131.DrucklayoutSingleNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i69.ArtworkDTO>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i69.ArtworkDTO>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i76.ArtworkMasterDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i76.ArtworkMasterDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i128.DrucklayoutSalesOrderJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i128.DrucklayoutSalesOrderJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<Map<String, _i187.JsonDTO>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<_i187.JsonDTO>(v)))
          : null) as T;
    }
    if (t == List<_i193.MigrationMatsCompanyDTO>) {
      return (data as List)
          .map((e) => deserialize<_i193.MigrationMatsCompanyDTO>(e))
          .toList() as T;
    }
    if (t == List<_i4.EntityLockDTO>) {
      return (data as List)
          .map((e) => deserialize<_i4.EntityLockDTO>(e))
          .toList() as T;
    }
    if (t == List<_i194.ContactDTO>) {
      return (data as List)
          .map((e) => deserialize<_i194.ContactDTO>(e))
          .toList() as T;
    }
    if (t == List<_i195.CustomerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i195.CustomerDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(int, bool, int)>()) {
      return (
        deserialize<int>(((data as Map)['p'] as List)[0]),
        deserialize<bool>(data['p'][1]),
        deserialize<int>(data['p'][2]),
      ) as T;
    }
    if (t == List<_i196.MigrationMatsPersonDTO>) {
      return (data as List)
          .map((e) => deserialize<_i196.MigrationMatsPersonDTO>(e))
          .toList() as T;
    }
    if (t == List<_i197.AppUserDTO>) {
      return (data as List)
          .map((e) => deserialize<_i197.AppUserDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(int?, int?)>()) {
      return (
        ((data as Map)['p'] as List)[0] == null
            ? null
            : deserialize<int>(data['p'][0]),
        ((data)['p'] as List)[1] == null
            ? null
            : deserialize<int>(data['p'][1]),
      ) as T;
    }
    if (t == List<_i4.EntityAssignmentDTO>) {
      return (data as List)
          .map((e) => deserialize<_i4.EntityAssignmentDTO>(e))
          .toList() as T;
    }
    if (t == List<_i198.EntityLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i198.EntityLogDTO>(e))
          .toList() as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i199.ServiceUserDTO>) {
      return (data as List)
          .map((e) => deserialize<_i199.ServiceUserDTO>(e))
          .toList() as T;
    }
    if (t == List<_i200.ServiceUserTokenDTO>) {
      return (data as List)
          .map((e) => deserialize<_i200.ServiceUserTokenDTO>(e))
          .toList() as T;
    }
    if (t == List<_i201.AppClientDTO>) {
      return (data as List)
          .map((e) => deserialize<_i201.AppClientDTO>(e))
          .toList() as T;
    }
    if (t == List<_i202.CompanyDepartmentDTO>) {
      return (data as List)
          .map((e) => deserialize<_i202.CompanyDepartmentDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(int?, _i203.CompanyEmployeeDTO?)>()) {
      return (
        ((data as Map)['p'] as List)[0] == null
            ? null
            : deserialize<int>(data['p'][0]),
        ((data)['p'] as List)[1] == null
            ? null
            : deserialize<_i203.CompanyEmployeeDTO>(data['p'][1]),
      ) as T;
    }
    if (t == List<_i203.CompanyEmployeeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i203.CompanyEmployeeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i204.SpotlightItem>) {
      return (data as List)
          .map((e) => deserialize<_i204.SpotlightItem>(e))
          .toList() as T;
    }
    if (t == List<_i205.CountryCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i205.CountryCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i206.CrmEventDTO>) {
      return (data as List)
          .map((e) => deserialize<_i206.CrmEventDTO>(e))
          .toList() as T;
    }
    if (t == List<_i207.CustomerBillingCustomerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i207.CustomerBillingCustomerDTO>(e))
          .toList() as T;
    }
    if (t == List<_i208.ShippingMethodDTO>) {
      return (data as List)
          .map((e) => deserialize<_i208.ShippingMethodDTO>(e))
          .toList() as T;
    }
    if (t == List<_i209.CustomerCustomerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i209.CustomerCustomerDTO>(e))
          .toList() as T;
    }
    if (t == List<_i210.CustomerShippingContactDTO>) {
      return (data as List)
          .map((e) => deserialize<_i210.CustomerShippingContactDTO>(e))
          .toList() as T;
    }
    if (t == List<_i211.DepartmentCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i211.DepartmentCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i212.LanguageCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i212.LanguageCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i213.PaymentCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i213.PaymentCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i214.SalutationCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i214.SalutationCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i215.ArtworkDTO>) {
      return (data as List)
          .map((e) => deserialize<_i215.ArtworkDTO>(e))
          .toList() as T;
    }
    if (t == List<_i216.ArtworkLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i216.ArtworkLogDTO>(e))
          .toList() as T;
    }
    if (t == List<_i217.ArtworkMasterDTO>) {
      return (data as List)
          .map((e) => deserialize<_i217.ArtworkMasterDTO>(e))
          .toList() as T;
    }
    if (t == List<_i218.ArtworkQuarantineDTO>) {
      return (data as List)
          .map((e) => deserialize<_i218.ArtworkQuarantineDTO>(e))
          .toList() as T;
    }
    if (t == List<_i219.ArtworkQuarantineGroupDTO>) {
      return (data as List)
          .map((e) => deserialize<_i219.ArtworkQuarantineGroupDTO>(e))
          .toList() as T;
    }
    if (t == List<_i220.ArtworkTemplateDTO>) {
      return (data as List)
          .map((e) => deserialize<_i220.ArtworkTemplateDTO>(e))
          .toList() as T;
    }
    if (t == List<_i221.ArtworkTemplatePreSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i221.ArtworkTemplatePreSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i222.ArtworkTemplateSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i222.ArtworkTemplateSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i223.ArtworkColorDTO>) {
      return (data as List)
          .map((e) => deserialize<_i223.ArtworkColorDTO>(e))
          .toList() as T;
    }
    if (t == List<_i224.PrepressColorPaletteDTO>) {
      return (data as List)
          .map((e) => deserialize<_i224.PrepressColorPaletteDTO>(e))
          .toList() as T;
    }
    if (t == List<_i225.DrucklayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i225.DrucklayoutDTO>(e))
          .toList() as T;
    }
    if (t == Set<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toSet() as T;
    }
    if (t ==
        _i1.getType<
            ({
              List<_i226.SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
              List<_i227.SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts
            })>()) {
      return (
        multiNutzenlayouts:
            deserialize<List<_i226.SalesOrderMultiNutzenlayoutDTO>>(
                ((data as Map)['n'] as Map)['multiNutzenlayouts']),
        singleNutzenlayouts:
            deserialize<List<_i227.SalesOrderSingleNutzenlayoutDTO>>(
                data['n']['singleNutzenlayouts']),
      ) as T;
    }
    if (t == List<_i226.SalesOrderMultiNutzenlayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i226.SalesOrderMultiNutzenlayoutDTO>(e))
          .toList() as T;
    }
    if (t == List<_i227.SalesOrderSingleNutzenlayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i227.SalesOrderSingleNutzenlayoutDTO>(e))
          .toList() as T;
    }
    if (t == List<_i228.DrucklayoutPreSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i228.DrucklayoutPreSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i229.DrucklayoutSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i229.DrucklayoutSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i230.SalesOrderSingleNutzenlayoutLightDTO>) {
      return (data as List)
          .map(
              (e) => deserialize<_i230.SalesOrderSingleNutzenlayoutLightDTO>(e))
          .toList() as T;
    }
    if (t == List<_i231.SalesOrderMultiNutzenlayoutLightDTO>) {
      return (data as List)
          .map((e) => deserialize<_i231.SalesOrderMultiNutzenlayoutLightDTO>(e))
          .toList() as T;
    }
    if (t == List<_i232.NutzenlayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i232.NutzenlayoutDTO>(e))
          .toList() as T;
    }
    if (t == List<_i233.NutzenlayoutArtworkDimensions>) {
      return (data as List)
          .map((e) => deserialize<_i233.NutzenlayoutArtworkDimensions>(e))
          .toList() as T;
    }
    if (t == Set<_i233.NutzenlayoutArtworkDimensions>) {
      return (data as List)
          .map((e) => deserialize<_i233.NutzenlayoutArtworkDimensions>(e))
          .toSet() as T;
    }
    if (t == List<_i234.SalesOrderItemType>) {
      return (data as List)
          .map((e) => deserialize<_i234.SalesOrderItemType>(e))
          .toList() as T;
    }
    if (t == List<_i235.ProductDTO>) {
      return (data as List)
          .map((e) => deserialize<_i235.ProductDTO>(e))
          .toList() as T;
    }
    if (t == List<({int artworkQuarantineId, int serienIndex})>) {
      return (data as List)
          .map((e) =>
              deserialize<({int artworkQuarantineId, int serienIndex})>(e))
          .toList() as T;
    }
    if (t == _i1.getType<({int artworkQuarantineId, int serienIndex})>()) {
      return (
        artworkQuarantineId: deserialize<int>(
            ((data as Map)['n'] as Map)['artworkQuarantineId']),
        serienIndex: deserialize<int>(data['n']['serienIndex']),
      ) as T;
    }
    if (t == _i1.getType<({int artworkQuarantineId, int serienIndex})>()) {
      return (
        artworkQuarantineId: deserialize<int>(
            ((data as Map)['n'] as Map)['artworkQuarantineId']),
        serienIndex: deserialize<int>(data['n']['serienIndex']),
      ) as T;
    }
    if (t == List<_i236.ProductLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i236.ProductLogDTO>(e))
          .toList() as T;
    }
    if (t == List<_i237.ProductMasterDTO>) {
      return (data as List)
          .map((e) => deserialize<_i237.ProductMasterDTO>(e))
          .toList() as T;
    }
    if (t == List<_i238.SalesOrderItemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i238.SalesOrderItemDTO>(e))
          .toList() as T;
    }
    if (t == List<_i239.SoiConsultingDTO>) {
      return (data as List)
          .map((e) => deserialize<_i239.SoiConsultingDTO>(e))
          .toList() as T;
    }
    if (t == List<_i240.SoiEinzelformaufbauDTO>) {
      return (data as List)
          .map((e) => deserialize<_i240.SoiEinzelformaufbauDTO>(e))
          .toList() as T;
    }
    if (t == List<_i241.SoiPrepareArtworkDTO>) {
      return (data as List)
          .map((e) => deserialize<_i241.SoiPrepareArtworkDTO>(e))
          .toList() as T;
    }
    if (t == List<_i242.SoiRequestArtworkApprovalDTO>) {
      return (data as List)
          .map((e) => deserialize<_i242.SoiRequestArtworkApprovalDTO>(e))
          .toList() as T;
    }
    if (t == List<_i243.SalesOrderDTO>) {
      return (data as List)
          .map((e) => deserialize<_i243.SalesOrderDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(int?, _i203.CompanyEmployeeDTO?)>()) {
      return (
        ((data as Map)['p'] as List)[0] == null
            ? null
            : deserialize<int>(data['p'][0]),
        ((data)['p'] as List)[1] == null
            ? null
            : deserialize<_i203.CompanyEmployeeDTO>(data['p'][1]),
      ) as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i4.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i5.SalutationCodeFormularDTO) {
      return 'SalutationCodeFormularDTO';
    }
    if (data is _i6.MigrationMatsCompanyDTO) {
      return 'MigrationMatsCompanyDTO';
    }
    if (data is _i7.MigrationMatsCompanyField) {
      return 'MigrationMatsCompanyField';
    }
    if (data is _i8.MigrationMatsPersonDTO) {
      return 'MigrationMatsPersonDTO';
    }
    if (data is _i9.MigrationMatsPersonField) {
      return 'MigrationMatsPersonField';
    }
    if (data is _i10.AppScope) {
      return 'AppScope';
    }
    if (data is _i11.AppUserDTO) {
      return 'AppUserDTO';
    }
    if (data is _i12.AppUserField) {
      return 'AppUserField';
    }
    if (data is _i13.CustomEntityIntKeys) {
      return 'CustomEntityIntKeys';
    }
    if (data is _i14.EntityLogDTO) {
      return 'EntityLogDTO';
    }
    if (data is _i15.EntityLogField) {
      return 'EntityLogField';
    }
    if (data is _i16.GlobalSettingsDTO) {
      return 'GlobalSettingsDTO';
    }
    if (data is _i17.GlobalSettingsField) {
      return 'GlobalSettingsField';
    }
    if (data is _i18.ServiceUserDTO) {
      return 'ServiceUserDTO';
    }
    if (data is _i19.ServiceUserField) {
      return 'ServiceUserField';
    }
    if (data is _i20.ServiceUserTokenDTO) {
      return 'ServiceUserTokenDTO';
    }
    if (data is _i21.SpotlightItem) {
      return 'SpotlightItem';
    }
    if (data is _i22.SpotlightType) {
      return 'SpotlightType';
    }
    if (data is _i23.TableType) {
      return 'TableType';
    }
    if (data is _i24.AppClientDTO) {
      return 'AppClientDTO';
    }
    if (data is _i25.AppClientField) {
      return 'AppClientField';
    }
    if (data is _i26.CompanyCompanyDTO) {
      return 'CompanyCompanyDTO';
    }
    if (data is _i27.CompanyCompanyField) {
      return 'CompanyCompanyField';
    }
    if (data is _i28.CompanyDepartmentDTO) {
      return 'CompanyDepartmentDTO';
    }
    if (data is _i29.CompanyDepartmentField) {
      return 'CompanyDepartmentField';
    }
    if (data is _i30.CompanyEmployeeDTO) {
      return 'CompanyEmployeeDTO';
    }
    if (data is _i31.CompanyEmployeeDepartmentJT) {
      return 'CompanyEmployeeDepartmentJT';
    }
    if (data is _i32.CompanyEmployeeField) {
      return 'CompanyEmployeeField';
    }
    if (data is _i33.ContactDTO) {
      return 'ContactDTO';
    }
    if (data is _i34.ContactField) {
      return 'ContactField';
    }
    if (data is _i35.ContactType) {
      return 'ContactType';
    }
    if (data is _i36.CountryCodeDTO) {
      return 'CountryCodeDTO';
    }
    if (data is _i37.CountryCodeAddressFormat) {
      return 'CountryCodeAddressFormat';
    }
    if (data is _i38.CountryCodeContactAddressFormat) {
      return 'CountryCodeContactAddressFormat';
    }
    if (data is _i39.CountryCodeField) {
      return 'CountryCodeField';
    }
    if (data is _i40.CrmEventDTO) {
      return 'CrmEventDTO';
    }
    if (data is _i41.CrmEventContactJT) {
      return 'CrmEventContactJT';
    }
    if (data is _i42.CrmEventField) {
      return 'CrmEventField';
    }
    if (data is _i43.CrmEventStatus) {
      return 'CrmEventStatus';
    }
    if (data is _i44.CustomerDTO) {
      return 'CustomerDTO';
    }
    if (data is _i45.CustomerField) {
      return 'CustomerField';
    }
    if (data is _i46.CustomerSalesOrderHintsDTO) {
      return 'CustomerSalesOrderHintsDTO';
    }
    if (data is _i47.InvoiceDeliveryMethod) {
      return 'InvoiceDeliveryMethod';
    }
    if (data is _i48.ShippingMethodDTO) {
      return 'ShippingMethodDTO';
    }
    if (data is _i49.ShippingMethodField) {
      return 'ShippingMethodField';
    }
    if (data is _i50.CustomerBillingCustomerDTO) {
      return 'CustomerBillingCustomerDTO';
    }
    if (data is _i51.CustomerBillingCustomerField) {
      return 'CustomerBillingCustomerField';
    }
    if (data is _i52.CustomerContactsDTO) {
      return 'CustomerContactsDTO';
    }
    if (data is _i53.CustomerContactsType) {
      return 'CustomerContactsType';
    }
    if (data is _i54.CustomerContactsField) {
      return 'CustomerContactsField';
    }
    if (data is _i55.CustomerCustomerDTO) {
      return 'CustomerCustomerDTO';
    }
    if (data is _i56.CustomerCustomerField) {
      return 'CustomerCustomerField';
    }
    if (data is _i57.CustomerShippingContactDTO) {
      return 'CustomerShippingContactDTO';
    }
    if (data is _i58.CustomerShippingContactField) {
      return 'CustomerShippingContactField';
    }
    if (data is _i59.DepartmentCodeDTO) {
      return 'DepartmentCodeDTO';
    }
    if (data is _i60.DepartmentCodeField) {
      return 'DepartmentCodeField';
    }
    if (data is _i61.LanguageCodeDTO) {
      return 'LanguageCodeDTO';
    }
    if (data is _i62.LanguageCodeField) {
      return 'LanguageCodeField';
    }
    if (data is _i63.PaymentCodeDTO) {
      return 'PaymentCodeDTO';
    }
    if (data is _i64.PaymentCodeField) {
      return 'PaymentCodeField';
    }
    if (data is _i65.SalutationCodeDTO) {
      return 'SalutationCodeDTO';
    }
    if (data is _i66.SalutationCodeField) {
      return 'SalutationCodeField';
    }
    if (data is _i67.ElbExceptionMessage) {
      return 'ElbExceptionMessage';
    }
    if (data is _i68.SalutationType) {
      return 'SalutationType';
    }
    if (data is _i69.ArtworkDTO) {
      return 'ArtworkDTO';
    }
    if (data is _i70.ArtworkAdditionalDataField) {
      return 'ArtworkAdditionalDataField';
    }
    if (data is _i71.ArtworkArtworkMaster) {
      return 'ArtworkArtworkMaster';
    }
    if (data is _i72.ArtworkDieCutterType) {
      return 'ArtworkDieCutterType';
    }
    if (data is _i73.ArtworkField) {
      return 'ArtworkField';
    }
    if (data is _i74.ArtworkLogDTO) {
      return 'ArtworkLogDTO';
    }
    if (data is _i75.ArtworkLogField) {
      return 'ArtworkLogField';
    }
    if (data is _i76.ArtworkMasterDTO) {
      return 'ArtworkMasterDTO';
    }
    if (data is _i77.ArtworkPrintProcessType) {
      return 'ArtworkPrintProcessType';
    }
    if (data is _i78.ArtworkSalesOrderUpdate) {
      return 'ArtworkSalesOrderUpdate';
    }
    if (data is _i79.ArtworkType) {
      return 'ArtworkType';
    }
    if (data is _i80.ArtworkQuarantineDTO) {
      return 'ArtworkQuarantineDTO';
    }
    if (data is _i81.ArtworkQuarantineField) {
      return 'ArtworkQuarantineField';
    }
    if (data is _i82.ArtworkQuarantineAnalysisDataDTO) {
      return 'ArtworkQuarantineAnalysisDataDTO';
    }
    if (data is _i83.ColorSpecificationDTO) {
      return 'ColorSpecificationDTO';
    }
    if (data is _i84.FontInfoDTO) {
      return 'FontInfoDTO';
    }
    if (data is _i85.LayerInfoDTO) {
      return 'LayerInfoDTO';
    }
    if (data is _i86.ArtworkQuarantineGroupDTO) {
      return 'ArtworkQuarantineGroupDTO';
    }
    if (data is _i87.ArtworkQuarantineGroupField) {
      return 'ArtworkQuarantineGroupField';
    }
    if (data is _i88.ArtworkQuarantineGroupStatus) {
      return 'ArtworkQuarantineGroupStatus';
    }
    if (data is _i89.ArtworkQuarantineGroupType) {
      return 'ArtworkQuarantineGroupType';
    }
    if (data is _i90.SystemFileDTO) {
      return 'SystemFileDTO';
    }
    if (data is _i91.SystemFileAttachmentType) {
      return 'SystemFileAttachmentType';
    }
    if (data is _i92.ArtworkTemplateDTO) {
      return 'ArtworkTemplateDTO';
    }
    if (data is _i93.ArtworkTemplateField) {
      return 'ArtworkTemplateField';
    }
    if (data is _i94.ArtworkTemplatePreSelectionDTO) {
      return 'ArtworkTemplatePreSelectionDTO';
    }
    if (data is _i95.ArtworkTemplatePreSelectionField) {
      return 'ArtworkTemplatePreSelectionField';
    }
    if (data is _i96.ArtworkTemplateSelectionDTO) {
      return 'ArtworkTemplateSelectionDTO';
    }
    if (data is _i97.ArtworkTemplateSelectionField) {
      return 'ArtworkTemplateSelectionField';
    }
    if (data is _i98.BearerDTO) {
      return 'BearerDTO';
    }
    if (data is _i99.BearerField) {
      return 'BearerField';
    }
    if (data is _i100.BearerType) {
      return 'BearerType';
    }
    if (data is _i101.BearerTypeFlexoPrintMultilayerDTO) {
      return 'BearerTypeFlexoPrintMultilayerDTO';
    }
    if (data is _i102.BearerTypeOffsetPressFixedPlateDTO) {
      return 'BearerTypeOffsetPressFixedPlateDTO';
    }
    if (data is _i103.BearerTypeSheetFedPressFixedPlateDTO) {
      return 'BearerTypeSheetFedPressFixedPlateDTO';
    }
    if (data is _i104.BearerTypeSheetFedPressMinPlateDTO) {
      return 'BearerTypeSheetFedPressMinPlateDTO';
    }
    if (data is _i105.BearerTypeSheetFedPressPlateEqualsSubDTO) {
      return 'BearerTypeSheetFedPressPlateEqualsSubDTO';
    }
    if (data is _i106.BearerTypeStandardFlexoPrintDTO) {
      return 'BearerTypeStandardFlexoPrintDTO';
    }
    if (data is _i107.BearerType1DTO) {
      return 'BearerType1DTO';
    }
    if (data is _i108.BearerType2DTO) {
      return 'BearerType2DTO';
    }
    if (data is _i109.ArtworkCodeDTO) {
      return 'ArtworkCodeDTO';
    }
    if (data is _i110.ArtworkCodeField) {
      return 'ArtworkCodeField';
    }
    if (data is _i111.ArtworkCodeType) {
      return 'ArtworkCodeType';
    }
    if (data is _i112.AztecCodeDTO) {
      return 'AztecCodeDTO';
    }
    if (data is _i113.TemplateCodeDTO) {
      return 'TemplateCodeDTO';
    }
    if (data is _i114.TwoOf5CodeDTO) {
      return 'TwoOf5CodeDTO';
    }
    if (data is _i115.ArtworkColorDTO) {
      return 'ArtworkColorDTO';
    }
    if (data is _i116.ArtworkColorField) {
      return 'ArtworkColorField';
    }
    if (data is _i117.ArtworkColorPrintProcessType) {
      return 'ArtworkColorPrintProcessType';
    }
    if (data is _i118.ArtworkColorSpecType) {
      return 'ArtworkColorSpecType';
    }
    if (data is _i119.ArtworkColorType) {
      return 'ArtworkColorType';
    }
    if (data is _i120.ArtworkVerarbeitungsebeneType) {
      return 'ArtworkVerarbeitungsebeneType';
    }
    if (data is _i121.PrepressColorPaletteDTO) {
      return 'PrepressColorPaletteDTO';
    }
    if (data is _i122.PrepressColorPaletteField) {
      return 'PrepressColorPaletteField';
    }
    if (data is _i123.DrucklayoutDTO) {
      return 'DrucklayoutDTO';
    }
    if (data is _i124.DrucklayoutField) {
      return 'DrucklayoutField';
    }
    if (data is _i125.DrucklayoutMultiNutzenlayoutJT) {
      return 'DrucklayoutMultiNutzenlayoutJT';
    }
    if (data is _i126.DrucklayoutPreSelectionDTO) {
      return 'DrucklayoutPreSelectionDTO';
    }
    if (data is _i127.DrucklayoutPreSelectionField) {
      return 'DrucklayoutPreSelectionField';
    }
    if (data is _i128.DrucklayoutSalesOrderJT) {
      return 'DrucklayoutSalesOrderJT';
    }
    if (data is _i129.BearerCustomerRelation) {
      return 'BearerCustomerRelation';
    }
    if (data is _i130.DrucklayoutSelectionField) {
      return 'DrucklayoutSelectionField';
    }
    if (data is _i131.DrucklayoutSingleNutzenlayoutJT) {
      return 'DrucklayoutSingleNutzenlayoutJT';
    }
    if (data is _i132.ArtworkLayerDTO) {
      return 'ArtworkLayerDTO';
    }
    if (data is _i133.ArtworkLayerField) {
      return 'ArtworkLayerField';
    }
    if (data is _i134.ArtworkLayerType) {
      return 'ArtworkLayerType';
    }
    if (data is _i135.NutzenlayoutArtworkDimensions) {
      return 'NutzenlayoutArtworkDimensions';
    }
    if (data is _i136.NutzenlayoutCellDTO) {
      return 'NutzenlayoutCellDTO';
    }
    if (data is _i137.NutzenlayoutColumnDTO) {
      return 'NutzenlayoutColumnDTO';
    }
    if (data is _i138.NutzenlayoutFormType) {
      return 'NutzenlayoutFormType';
    }
    if (data is _i139.NutzenlayoutLaufrichtung) {
      return 'NutzenlayoutLaufrichtung';
    }
    if (data is _i140.NutzenlayoutType) {
      return 'NutzenlayoutType';
    }
    if (data is _i141.NutzenlayoutUnitSystem) {
      return 'NutzenlayoutUnitSystem';
    }
    if (data is _i142.NutzenlayoutDTO) {
      return 'NutzenlayoutDTO';
    }
    if (data is _i143.SalesOrderMultiNutzenlayoutArtworkJT) {
      return 'SalesOrderMultiNutzenlayoutArtworkJT';
    }
    if (data is _i144.SalesOrderMultiNutzenlayoutDTO) {
      return 'SalesOrderMultiNutzenlayoutDTO';
    }
    if (data is _i145.SalesOrderMultiNutzenlayoutLightDTO) {
      return 'SalesOrderMultiNutzenlayoutLightDTO';
    }
    if (data is _i146.SalesOrderSingleNutzenlayoutArtworkJT) {
      return 'SalesOrderSingleNutzenlayoutArtworkJT';
    }
    if (data is _i147.SalesOrderSingleNutzenlayoutDTO) {
      return 'SalesOrderSingleNutzenlayoutDTO';
    }
    if (data is _i148.SalesOrderSingleNutzenlayoutLightDTO) {
      return 'SalesOrderSingleNutzenlayoutLightDTO';
    }
    if (data is _i149.ProductDTO) {
      return 'ProductDTO';
    }
    if (data is _i150.ProductField) {
      return 'ProductField';
    }
    if (data is _i151.ProductLogDTO) {
      return 'ProductLogDTO';
    }
    if (data is _i152.ProductLogField) {
      return 'ProductLogField';
    }
    if (data is _i153.ProductMasterDTO) {
      return 'ProductMasterDTO';
    }
    if (data is _i154.ProductType) {
      return 'ProductType';
    }
    if (data is _i155.SalesOrderItemDTO) {
      return 'SalesOrderItemDTO';
    }
    if (data is _i156.SalesOrderItemField) {
      return 'SalesOrderItemField';
    }
    if (data is _i157.SalesOrderItemStatus) {
      return 'SalesOrderItemStatus';
    }
    if (data is _i158.SalesOrderItemType) {
      return 'SalesOrderItemType';
    }
    if (data is _i159.SoiConsultingDTO) {
      return 'SoiConsultingDTO';
    }
    if (data is _i160.SoiConsultingField) {
      return 'SoiConsultingField';
    }
    if (data is _i161.SoiEinzelformaufbauDTO) {
      return 'SoiEinzelformaufbauDTO';
    }
    if (data is _i162.SoiEinzelformaufbauField) {
      return 'SoiEinzelformaufbauField';
    }
    if (data is _i163.EyeCStatus) {
      return 'EyeCStatus';
    }
    if (data is _i164.SoiPrepareArtworkDTO) {
      return 'SoiPrepareArtworkDTO';
    }
    if (data is _i165.SoiPrepareArtworkAdditionalDataField) {
      return 'SoiPrepareArtworkAdditionalDataField';
    }
    if (data is _i166.SoiPrepareArtworkDifficultyLevel) {
      return 'SoiPrepareArtworkDifficultyLevel';
    }
    if (data is _i167.SoiPrepareArtworkField) {
      return 'SoiPrepareArtworkField';
    }
    if (data is _i168.SoiRequestArtworkApprovalDTO) {
      return 'SoiRequestArtworkApprovalDTO';
    }
    if (data is _i169.SoiRequestArtworkApprovalAdditionalDataField) {
      return 'SoiRequestArtworkApprovalAdditionalDataField';
    }
    if (data is _i170.SoiRequestArtworkApprovalField) {
      return 'SoiRequestArtworkApprovalField';
    }
    if (data is _i171.SoiRequestArtworkApprovalType) {
      return 'SoiRequestArtworkApprovalType';
    }
    if (data is _i172.SoiStepAndRepeatDTO) {
      return 'SoiStepAndRepeatDTO';
    }
    if (data is _i173.SoiStepAndRepeatField) {
      return 'SoiStepAndRepeatField';
    }
    if (data is _i174.SoiStepAndRepeatStatus) {
      return 'SoiStepAndRepeatStatus';
    }
    if (data is _i175.TrappingDTO) {
      return 'TrappingDTO';
    }
    if (data is _i176.SalesOrderDTO) {
      return 'SalesOrderDTO';
    }
    if (data is _i177.SalesOrderAdditionalDataField) {
      return 'SalesOrderAdditionalDataField';
    }
    if (data is _i178.SalesOrderField) {
      return 'SalesOrderField';
    }
    if (data is _i179.SalesOrderStatus) {
      return 'SalesOrderStatus';
    }
    if (data is _i180.SalesOrderStatusDTO) {
      return 'SalesOrderStatusDTO';
    }
    if (data is _i181.SalesOrderStatusField) {
      return 'SalesOrderStatusField';
    }
    if (data is _i182.DashboardTileConfigDTO) {
      return 'DashboardTileConfigDTO';
    }
    if (data is _i183.DashboardTileType) {
      return 'DashboardTileType';
    }
    if (data is _i184.FTPIncomingReplyType) {
      return 'FTPIncomingReplyType';
    }
    if (data is _i185.FTPInterfaceDTO) {
      return 'FTPInterfaceDTO';
    }
    if (data is _i186.FTPType) {
      return 'FTPType';
    }
    if (data is _i187.JsonDTO) {
      return 'JsonDTO';
    }
    if (data is _i188.JsonFieldType) {
      return 'JsonFieldType';
    }
    if (data is _i189.JsonTemplateDTO) {
      return 'JsonTemplateDTO';
    }
    if (data is _i190.JsonTemplateField) {
      return 'JsonTemplateField';
    }
    if (data is _i191.JsonTemplateType) {
      return 'JsonTemplateType';
    }
    if (data is _i192.DrucklayoutSelectionDTO) {
      return 'DrucklayoutSelectionDTO';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i4.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'elbdesk_backend_core.$className';
    }
    if (data is (int?, _i203.CompanyEmployeeDTO?)) {
      return '(int?,CompanyEmployeeDTO?)';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'SalutationCodeFormularDTO') {
      return deserialize<_i5.SalutationCodeFormularDTO>(data['data']);
    }
    if (dataClassName == 'MigrationMatsCompanyDTO') {
      return deserialize<_i6.MigrationMatsCompanyDTO>(data['data']);
    }
    if (dataClassName == 'MigrationMatsCompanyField') {
      return deserialize<_i7.MigrationMatsCompanyField>(data['data']);
    }
    if (dataClassName == 'MigrationMatsPersonDTO') {
      return deserialize<_i8.MigrationMatsPersonDTO>(data['data']);
    }
    if (dataClassName == 'MigrationMatsPersonField') {
      return deserialize<_i9.MigrationMatsPersonField>(data['data']);
    }
    if (dataClassName == 'AppScope') {
      return deserialize<_i10.AppScope>(data['data']);
    }
    if (dataClassName == 'AppUserDTO') {
      return deserialize<_i11.AppUserDTO>(data['data']);
    }
    if (dataClassName == 'AppUserField') {
      return deserialize<_i12.AppUserField>(data['data']);
    }
    if (dataClassName == 'CustomEntityIntKeys') {
      return deserialize<_i13.CustomEntityIntKeys>(data['data']);
    }
    if (dataClassName == 'EntityLogDTO') {
      return deserialize<_i14.EntityLogDTO>(data['data']);
    }
    if (dataClassName == 'EntityLogField') {
      return deserialize<_i15.EntityLogField>(data['data']);
    }
    if (dataClassName == 'GlobalSettingsDTO') {
      return deserialize<_i16.GlobalSettingsDTO>(data['data']);
    }
    if (dataClassName == 'GlobalSettingsField') {
      return deserialize<_i17.GlobalSettingsField>(data['data']);
    }
    if (dataClassName == 'ServiceUserDTO') {
      return deserialize<_i18.ServiceUserDTO>(data['data']);
    }
    if (dataClassName == 'ServiceUserField') {
      return deserialize<_i19.ServiceUserField>(data['data']);
    }
    if (dataClassName == 'ServiceUserTokenDTO') {
      return deserialize<_i20.ServiceUserTokenDTO>(data['data']);
    }
    if (dataClassName == 'SpotlightItem') {
      return deserialize<_i21.SpotlightItem>(data['data']);
    }
    if (dataClassName == 'SpotlightType') {
      return deserialize<_i22.SpotlightType>(data['data']);
    }
    if (dataClassName == 'TableType') {
      return deserialize<_i23.TableType>(data['data']);
    }
    if (dataClassName == 'AppClientDTO') {
      return deserialize<_i24.AppClientDTO>(data['data']);
    }
    if (dataClassName == 'AppClientField') {
      return deserialize<_i25.AppClientField>(data['data']);
    }
    if (dataClassName == 'CompanyCompanyDTO') {
      return deserialize<_i26.CompanyCompanyDTO>(data['data']);
    }
    if (dataClassName == 'CompanyCompanyField') {
      return deserialize<_i27.CompanyCompanyField>(data['data']);
    }
    if (dataClassName == 'CompanyDepartmentDTO') {
      return deserialize<_i28.CompanyDepartmentDTO>(data['data']);
    }
    if (dataClassName == 'CompanyDepartmentField') {
      return deserialize<_i29.CompanyDepartmentField>(data['data']);
    }
    if (dataClassName == 'CompanyEmployeeDTO') {
      return deserialize<_i30.CompanyEmployeeDTO>(data['data']);
    }
    if (dataClassName == 'CompanyEmployeeDepartmentJT') {
      return deserialize<_i31.CompanyEmployeeDepartmentJT>(data['data']);
    }
    if (dataClassName == 'CompanyEmployeeField') {
      return deserialize<_i32.CompanyEmployeeField>(data['data']);
    }
    if (dataClassName == 'ContactDTO') {
      return deserialize<_i33.ContactDTO>(data['data']);
    }
    if (dataClassName == 'ContactField') {
      return deserialize<_i34.ContactField>(data['data']);
    }
    if (dataClassName == 'ContactType') {
      return deserialize<_i35.ContactType>(data['data']);
    }
    if (dataClassName == 'CountryCodeDTO') {
      return deserialize<_i36.CountryCodeDTO>(data['data']);
    }
    if (dataClassName == 'CountryCodeAddressFormat') {
      return deserialize<_i37.CountryCodeAddressFormat>(data['data']);
    }
    if (dataClassName == 'CountryCodeContactAddressFormat') {
      return deserialize<_i38.CountryCodeContactAddressFormat>(data['data']);
    }
    if (dataClassName == 'CountryCodeField') {
      return deserialize<_i39.CountryCodeField>(data['data']);
    }
    if (dataClassName == 'CrmEventDTO') {
      return deserialize<_i40.CrmEventDTO>(data['data']);
    }
    if (dataClassName == 'CrmEventContactJT') {
      return deserialize<_i41.CrmEventContactJT>(data['data']);
    }
    if (dataClassName == 'CrmEventField') {
      return deserialize<_i42.CrmEventField>(data['data']);
    }
    if (dataClassName == 'CrmEventStatus') {
      return deserialize<_i43.CrmEventStatus>(data['data']);
    }
    if (dataClassName == 'CustomerDTO') {
      return deserialize<_i44.CustomerDTO>(data['data']);
    }
    if (dataClassName == 'CustomerField') {
      return deserialize<_i45.CustomerField>(data['data']);
    }
    if (dataClassName == 'CustomerSalesOrderHintsDTO') {
      return deserialize<_i46.CustomerSalesOrderHintsDTO>(data['data']);
    }
    if (dataClassName == 'InvoiceDeliveryMethod') {
      return deserialize<_i47.InvoiceDeliveryMethod>(data['data']);
    }
    if (dataClassName == 'ShippingMethodDTO') {
      return deserialize<_i48.ShippingMethodDTO>(data['data']);
    }
    if (dataClassName == 'ShippingMethodField') {
      return deserialize<_i49.ShippingMethodField>(data['data']);
    }
    if (dataClassName == 'CustomerBillingCustomerDTO') {
      return deserialize<_i50.CustomerBillingCustomerDTO>(data['data']);
    }
    if (dataClassName == 'CustomerBillingCustomerField') {
      return deserialize<_i51.CustomerBillingCustomerField>(data['data']);
    }
    if (dataClassName == 'CustomerContactsDTO') {
      return deserialize<_i52.CustomerContactsDTO>(data['data']);
    }
    if (dataClassName == 'CustomerContactsType') {
      return deserialize<_i53.CustomerContactsType>(data['data']);
    }
    if (dataClassName == 'CustomerContactsField') {
      return deserialize<_i54.CustomerContactsField>(data['data']);
    }
    if (dataClassName == 'CustomerCustomerDTO') {
      return deserialize<_i55.CustomerCustomerDTO>(data['data']);
    }
    if (dataClassName == 'CustomerCustomerField') {
      return deserialize<_i56.CustomerCustomerField>(data['data']);
    }
    if (dataClassName == 'CustomerShippingContactDTO') {
      return deserialize<_i57.CustomerShippingContactDTO>(data['data']);
    }
    if (dataClassName == 'CustomerShippingContactField') {
      return deserialize<_i58.CustomerShippingContactField>(data['data']);
    }
    if (dataClassName == 'DepartmentCodeDTO') {
      return deserialize<_i59.DepartmentCodeDTO>(data['data']);
    }
    if (dataClassName == 'DepartmentCodeField') {
      return deserialize<_i60.DepartmentCodeField>(data['data']);
    }
    if (dataClassName == 'LanguageCodeDTO') {
      return deserialize<_i61.LanguageCodeDTO>(data['data']);
    }
    if (dataClassName == 'LanguageCodeField') {
      return deserialize<_i62.LanguageCodeField>(data['data']);
    }
    if (dataClassName == 'PaymentCodeDTO') {
      return deserialize<_i63.PaymentCodeDTO>(data['data']);
    }
    if (dataClassName == 'PaymentCodeField') {
      return deserialize<_i64.PaymentCodeField>(data['data']);
    }
    if (dataClassName == 'SalutationCodeDTO') {
      return deserialize<_i65.SalutationCodeDTO>(data['data']);
    }
    if (dataClassName == 'SalutationCodeField') {
      return deserialize<_i66.SalutationCodeField>(data['data']);
    }
    if (dataClassName == 'ElbExceptionMessage') {
      return deserialize<_i67.ElbExceptionMessage>(data['data']);
    }
    if (dataClassName == 'SalutationType') {
      return deserialize<_i68.SalutationType>(data['data']);
    }
    if (dataClassName == 'ArtworkDTO') {
      return deserialize<_i69.ArtworkDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkAdditionalDataField') {
      return deserialize<_i70.ArtworkAdditionalDataField>(data['data']);
    }
    if (dataClassName == 'ArtworkArtworkMaster') {
      return deserialize<_i71.ArtworkArtworkMaster>(data['data']);
    }
    if (dataClassName == 'ArtworkDieCutterType') {
      return deserialize<_i72.ArtworkDieCutterType>(data['data']);
    }
    if (dataClassName == 'ArtworkField') {
      return deserialize<_i73.ArtworkField>(data['data']);
    }
    if (dataClassName == 'ArtworkLogDTO') {
      return deserialize<_i74.ArtworkLogDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkLogField') {
      return deserialize<_i75.ArtworkLogField>(data['data']);
    }
    if (dataClassName == 'ArtworkMasterDTO') {
      return deserialize<_i76.ArtworkMasterDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkPrintProcessType') {
      return deserialize<_i77.ArtworkPrintProcessType>(data['data']);
    }
    if (dataClassName == 'ArtworkSalesOrderUpdate') {
      return deserialize<_i78.ArtworkSalesOrderUpdate>(data['data']);
    }
    if (dataClassName == 'ArtworkType') {
      return deserialize<_i79.ArtworkType>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineDTO') {
      return deserialize<_i80.ArtworkQuarantineDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineField') {
      return deserialize<_i81.ArtworkQuarantineField>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineAnalysisDataDTO') {
      return deserialize<_i82.ArtworkQuarantineAnalysisDataDTO>(data['data']);
    }
    if (dataClassName == 'ColorSpecificationDTO') {
      return deserialize<_i83.ColorSpecificationDTO>(data['data']);
    }
    if (dataClassName == 'FontInfoDTO') {
      return deserialize<_i84.FontInfoDTO>(data['data']);
    }
    if (dataClassName == 'LayerInfoDTO') {
      return deserialize<_i85.LayerInfoDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupDTO') {
      return deserialize<_i86.ArtworkQuarantineGroupDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupField') {
      return deserialize<_i87.ArtworkQuarantineGroupField>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupStatus') {
      return deserialize<_i88.ArtworkQuarantineGroupStatus>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupType') {
      return deserialize<_i89.ArtworkQuarantineGroupType>(data['data']);
    }
    if (dataClassName == 'SystemFileDTO') {
      return deserialize<_i90.SystemFileDTO>(data['data']);
    }
    if (dataClassName == 'SystemFileAttachmentType') {
      return deserialize<_i91.SystemFileAttachmentType>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateDTO') {
      return deserialize<_i92.ArtworkTemplateDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateField') {
      return deserialize<_i93.ArtworkTemplateField>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplatePreSelectionDTO') {
      return deserialize<_i94.ArtworkTemplatePreSelectionDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplatePreSelectionField') {
      return deserialize<_i95.ArtworkTemplatePreSelectionField>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateSelectionDTO') {
      return deserialize<_i96.ArtworkTemplateSelectionDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateSelectionField') {
      return deserialize<_i97.ArtworkTemplateSelectionField>(data['data']);
    }
    if (dataClassName == 'BearerDTO') {
      return deserialize<_i98.BearerDTO>(data['data']);
    }
    if (dataClassName == 'BearerField') {
      return deserialize<_i99.BearerField>(data['data']);
    }
    if (dataClassName == 'BearerType') {
      return deserialize<_i100.BearerType>(data['data']);
    }
    if (dataClassName == 'BearerTypeFlexoPrintMultilayerDTO') {
      return deserialize<_i101.BearerTypeFlexoPrintMultilayerDTO>(data['data']);
    }
    if (dataClassName == 'BearerTypeOffsetPressFixedPlateDTO') {
      return deserialize<_i102.BearerTypeOffsetPressFixedPlateDTO>(
          data['data']);
    }
    if (dataClassName == 'BearerTypeSheetFedPressFixedPlateDTO') {
      return deserialize<_i103.BearerTypeSheetFedPressFixedPlateDTO>(
          data['data']);
    }
    if (dataClassName == 'BearerTypeSheetFedPressMinPlateDTO') {
      return deserialize<_i104.BearerTypeSheetFedPressMinPlateDTO>(
          data['data']);
    }
    if (dataClassName == 'BearerTypeSheetFedPressPlateEqualsSubDTO') {
      return deserialize<_i105.BearerTypeSheetFedPressPlateEqualsSubDTO>(
          data['data']);
    }
    if (dataClassName == 'BearerTypeStandardFlexoPrintDTO') {
      return deserialize<_i106.BearerTypeStandardFlexoPrintDTO>(data['data']);
    }
    if (dataClassName == 'BearerType1DTO') {
      return deserialize<_i107.BearerType1DTO>(data['data']);
    }
    if (dataClassName == 'BearerType2DTO') {
      return deserialize<_i108.BearerType2DTO>(data['data']);
    }
    if (dataClassName == 'ArtworkCodeDTO') {
      return deserialize<_i109.ArtworkCodeDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkCodeField') {
      return deserialize<_i110.ArtworkCodeField>(data['data']);
    }
    if (dataClassName == 'ArtworkCodeType') {
      return deserialize<_i111.ArtworkCodeType>(data['data']);
    }
    if (dataClassName == 'AztecCodeDTO') {
      return deserialize<_i112.AztecCodeDTO>(data['data']);
    }
    if (dataClassName == 'TemplateCodeDTO') {
      return deserialize<_i113.TemplateCodeDTO>(data['data']);
    }
    if (dataClassName == 'TwoOf5CodeDTO') {
      return deserialize<_i114.TwoOf5CodeDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkColorDTO') {
      return deserialize<_i115.ArtworkColorDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkColorField') {
      return deserialize<_i116.ArtworkColorField>(data['data']);
    }
    if (dataClassName == 'ArtworkColorPrintProcessType') {
      return deserialize<_i117.ArtworkColorPrintProcessType>(data['data']);
    }
    if (dataClassName == 'ArtworkColorSpecType') {
      return deserialize<_i118.ArtworkColorSpecType>(data['data']);
    }
    if (dataClassName == 'ArtworkColorType') {
      return deserialize<_i119.ArtworkColorType>(data['data']);
    }
    if (dataClassName == 'ArtworkVerarbeitungsebeneType') {
      return deserialize<_i120.ArtworkVerarbeitungsebeneType>(data['data']);
    }
    if (dataClassName == 'PrepressColorPaletteDTO') {
      return deserialize<_i121.PrepressColorPaletteDTO>(data['data']);
    }
    if (dataClassName == 'PrepressColorPaletteField') {
      return deserialize<_i122.PrepressColorPaletteField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutDTO') {
      return deserialize<_i123.DrucklayoutDTO>(data['data']);
    }
    if (dataClassName == 'DrucklayoutField') {
      return deserialize<_i124.DrucklayoutField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutMultiNutzenlayoutJT') {
      return deserialize<_i125.DrucklayoutMultiNutzenlayoutJT>(data['data']);
    }
    if (dataClassName == 'DrucklayoutPreSelectionDTO') {
      return deserialize<_i126.DrucklayoutPreSelectionDTO>(data['data']);
    }
    if (dataClassName == 'DrucklayoutPreSelectionField') {
      return deserialize<_i127.DrucklayoutPreSelectionField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSalesOrderJT') {
      return deserialize<_i128.DrucklayoutSalesOrderJT>(data['data']);
    }
    if (dataClassName == 'BearerCustomerRelation') {
      return deserialize<_i129.BearerCustomerRelation>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSelectionField') {
      return deserialize<_i130.DrucklayoutSelectionField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSingleNutzenlayoutJT') {
      return deserialize<_i131.DrucklayoutSingleNutzenlayoutJT>(data['data']);
    }
    if (dataClassName == 'ArtworkLayerDTO') {
      return deserialize<_i132.ArtworkLayerDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkLayerField') {
      return deserialize<_i133.ArtworkLayerField>(data['data']);
    }
    if (dataClassName == 'ArtworkLayerType') {
      return deserialize<_i134.ArtworkLayerType>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutArtworkDimensions') {
      return deserialize<_i135.NutzenlayoutArtworkDimensions>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutCellDTO') {
      return deserialize<_i136.NutzenlayoutCellDTO>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutColumnDTO') {
      return deserialize<_i137.NutzenlayoutColumnDTO>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutFormType') {
      return deserialize<_i138.NutzenlayoutFormType>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutLaufrichtung') {
      return deserialize<_i139.NutzenlayoutLaufrichtung>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutType') {
      return deserialize<_i140.NutzenlayoutType>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutUnitSystem') {
      return deserialize<_i141.NutzenlayoutUnitSystem>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutDTO') {
      return deserialize<_i142.NutzenlayoutDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderMultiNutzenlayoutArtworkJT') {
      return deserialize<_i143.SalesOrderMultiNutzenlayoutArtworkJT>(
          data['data']);
    }
    if (dataClassName == 'SalesOrderMultiNutzenlayoutDTO') {
      return deserialize<_i144.SalesOrderMultiNutzenlayoutDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderMultiNutzenlayoutLightDTO') {
      return deserialize<_i145.SalesOrderMultiNutzenlayoutLightDTO>(
          data['data']);
    }
    if (dataClassName == 'SalesOrderSingleNutzenlayoutArtworkJT') {
      return deserialize<_i146.SalesOrderSingleNutzenlayoutArtworkJT>(
          data['data']);
    }
    if (dataClassName == 'SalesOrderSingleNutzenlayoutDTO') {
      return deserialize<_i147.SalesOrderSingleNutzenlayoutDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderSingleNutzenlayoutLightDTO') {
      return deserialize<_i148.SalesOrderSingleNutzenlayoutLightDTO>(
          data['data']);
    }
    if (dataClassName == 'ProductDTO') {
      return deserialize<_i149.ProductDTO>(data['data']);
    }
    if (dataClassName == 'ProductField') {
      return deserialize<_i150.ProductField>(data['data']);
    }
    if (dataClassName == 'ProductLogDTO') {
      return deserialize<_i151.ProductLogDTO>(data['data']);
    }
    if (dataClassName == 'ProductLogField') {
      return deserialize<_i152.ProductLogField>(data['data']);
    }
    if (dataClassName == 'ProductMasterDTO') {
      return deserialize<_i153.ProductMasterDTO>(data['data']);
    }
    if (dataClassName == 'ProductType') {
      return deserialize<_i154.ProductType>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemDTO') {
      return deserialize<_i155.SalesOrderItemDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemField') {
      return deserialize<_i156.SalesOrderItemField>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemStatus') {
      return deserialize<_i157.SalesOrderItemStatus>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemType') {
      return deserialize<_i158.SalesOrderItemType>(data['data']);
    }
    if (dataClassName == 'SoiConsultingDTO') {
      return deserialize<_i159.SoiConsultingDTO>(data['data']);
    }
    if (dataClassName == 'SoiConsultingField') {
      return deserialize<_i160.SoiConsultingField>(data['data']);
    }
    if (dataClassName == 'SoiEinzelformaufbauDTO') {
      return deserialize<_i161.SoiEinzelformaufbauDTO>(data['data']);
    }
    if (dataClassName == 'SoiEinzelformaufbauField') {
      return deserialize<_i162.SoiEinzelformaufbauField>(data['data']);
    }
    if (dataClassName == 'EyeCStatus') {
      return deserialize<_i163.EyeCStatus>(data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkDTO') {
      return deserialize<_i164.SoiPrepareArtworkDTO>(data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkAdditionalDataField') {
      return deserialize<_i165.SoiPrepareArtworkAdditionalDataField>(
          data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkDifficultyLevel') {
      return deserialize<_i166.SoiPrepareArtworkDifficultyLevel>(data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkField') {
      return deserialize<_i167.SoiPrepareArtworkField>(data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalDTO') {
      return deserialize<_i168.SoiRequestArtworkApprovalDTO>(data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalAdditionalDataField') {
      return deserialize<_i169.SoiRequestArtworkApprovalAdditionalDataField>(
          data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalField') {
      return deserialize<_i170.SoiRequestArtworkApprovalField>(data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalType') {
      return deserialize<_i171.SoiRequestArtworkApprovalType>(data['data']);
    }
    if (dataClassName == 'SoiStepAndRepeatDTO') {
      return deserialize<_i172.SoiStepAndRepeatDTO>(data['data']);
    }
    if (dataClassName == 'SoiStepAndRepeatField') {
      return deserialize<_i173.SoiStepAndRepeatField>(data['data']);
    }
    if (dataClassName == 'SoiStepAndRepeatStatus') {
      return deserialize<_i174.SoiStepAndRepeatStatus>(data['data']);
    }
    if (dataClassName == 'TrappingDTO') {
      return deserialize<_i175.TrappingDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderDTO') {
      return deserialize<_i176.SalesOrderDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderAdditionalDataField') {
      return deserialize<_i177.SalesOrderAdditionalDataField>(data['data']);
    }
    if (dataClassName == 'SalesOrderField') {
      return deserialize<_i178.SalesOrderField>(data['data']);
    }
    if (dataClassName == 'SalesOrderStatus') {
      return deserialize<_i179.SalesOrderStatus>(data['data']);
    }
    if (dataClassName == 'SalesOrderStatusDTO') {
      return deserialize<_i180.SalesOrderStatusDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderStatusField') {
      return deserialize<_i181.SalesOrderStatusField>(data['data']);
    }
    if (dataClassName == 'DashboardTileConfigDTO') {
      return deserialize<_i182.DashboardTileConfigDTO>(data['data']);
    }
    if (dataClassName == 'DashboardTileType') {
      return deserialize<_i183.DashboardTileType>(data['data']);
    }
    if (dataClassName == 'FTPIncomingReplyType') {
      return deserialize<_i184.FTPIncomingReplyType>(data['data']);
    }
    if (dataClassName == 'FTPInterfaceDTO') {
      return deserialize<_i185.FTPInterfaceDTO>(data['data']);
    }
    if (dataClassName == 'FTPType') {
      return deserialize<_i186.FTPType>(data['data']);
    }
    if (dataClassName == 'JsonDTO') {
      return deserialize<_i187.JsonDTO>(data['data']);
    }
    if (dataClassName == 'JsonFieldType') {
      return deserialize<_i188.JsonFieldType>(data['data']);
    }
    if (dataClassName == 'JsonTemplateDTO') {
      return deserialize<_i189.JsonTemplateDTO>(data['data']);
    }
    if (dataClassName == 'JsonTemplateField') {
      return deserialize<_i190.JsonTemplateField>(data['data']);
    }
    if (dataClassName == 'JsonTemplateType') {
      return deserialize<_i191.JsonTemplateType>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSelectionDTO') {
      return deserialize<_i192.DrucklayoutSelectionDTO>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('elbdesk_backend_core.')) {
      data['className'] = dataClassName.substring(21);
      return _i4.Protocol().deserializeByClassName(data);
    }
    if (dataClassName == '(int?,CompanyEmployeeDTO?)') {
      return deserialize<(int?, _i203.CompanyEmployeeDTO?)>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i4.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i6.MigrationMatsCompanyDTO:
        return _i6.MigrationMatsCompanyDTO.t;
      case _i8.MigrationMatsPersonDTO:
        return _i8.MigrationMatsPersonDTO.t;
      case _i11.AppUserDTO:
        return _i11.AppUserDTO.t;
      case _i13.CustomEntityIntKeys:
        return _i13.CustomEntityIntKeys.t;
      case _i14.EntityLogDTO:
        return _i14.EntityLogDTO.t;
      case _i16.GlobalSettingsDTO:
        return _i16.GlobalSettingsDTO.t;
      case _i18.ServiceUserDTO:
        return _i18.ServiceUserDTO.t;
      case _i20.ServiceUserTokenDTO:
        return _i20.ServiceUserTokenDTO.t;
      case _i24.AppClientDTO:
        return _i24.AppClientDTO.t;
      case _i26.CompanyCompanyDTO:
        return _i26.CompanyCompanyDTO.t;
      case _i28.CompanyDepartmentDTO:
        return _i28.CompanyDepartmentDTO.t;
      case _i30.CompanyEmployeeDTO:
        return _i30.CompanyEmployeeDTO.t;
      case _i31.CompanyEmployeeDepartmentJT:
        return _i31.CompanyEmployeeDepartmentJT.t;
      case _i33.ContactDTO:
        return _i33.ContactDTO.t;
      case _i36.CountryCodeDTO:
        return _i36.CountryCodeDTO.t;
      case _i40.CrmEventDTO:
        return _i40.CrmEventDTO.t;
      case _i41.CrmEventContactJT:
        return _i41.CrmEventContactJT.t;
      case _i44.CustomerDTO:
        return _i44.CustomerDTO.t;
      case _i48.ShippingMethodDTO:
        return _i48.ShippingMethodDTO.t;
      case _i50.CustomerBillingCustomerDTO:
        return _i50.CustomerBillingCustomerDTO.t;
      case _i52.CustomerContactsDTO:
        return _i52.CustomerContactsDTO.t;
      case _i55.CustomerCustomerDTO:
        return _i55.CustomerCustomerDTO.t;
      case _i57.CustomerShippingContactDTO:
        return _i57.CustomerShippingContactDTO.t;
      case _i59.DepartmentCodeDTO:
        return _i59.DepartmentCodeDTO.t;
      case _i61.LanguageCodeDTO:
        return _i61.LanguageCodeDTO.t;
      case _i63.PaymentCodeDTO:
        return _i63.PaymentCodeDTO.t;
      case _i65.SalutationCodeDTO:
        return _i65.SalutationCodeDTO.t;
      case _i5.SalutationCodeFormularDTO:
        return _i5.SalutationCodeFormularDTO.t;
      case _i69.ArtworkDTO:
        return _i69.ArtworkDTO.t;
      case _i74.ArtworkLogDTO:
        return _i74.ArtworkLogDTO.t;
      case _i76.ArtworkMasterDTO:
        return _i76.ArtworkMasterDTO.t;
      case _i80.ArtworkQuarantineDTO:
        return _i80.ArtworkQuarantineDTO.t;
      case _i83.ColorSpecificationDTO:
        return _i83.ColorSpecificationDTO.t;
      case _i86.ArtworkQuarantineGroupDTO:
        return _i86.ArtworkQuarantineGroupDTO.t;
      case _i92.ArtworkTemplateDTO:
        return _i92.ArtworkTemplateDTO.t;
      case _i94.ArtworkTemplatePreSelectionDTO:
        return _i94.ArtworkTemplatePreSelectionDTO.t;
      case _i96.ArtworkTemplateSelectionDTO:
        return _i96.ArtworkTemplateSelectionDTO.t;
      case _i98.BearerDTO:
        return _i98.BearerDTO.t;
      case _i101.BearerTypeFlexoPrintMultilayerDTO:
        return _i101.BearerTypeFlexoPrintMultilayerDTO.t;
      case _i102.BearerTypeOffsetPressFixedPlateDTO:
        return _i102.BearerTypeOffsetPressFixedPlateDTO.t;
      case _i103.BearerTypeSheetFedPressFixedPlateDTO:
        return _i103.BearerTypeSheetFedPressFixedPlateDTO.t;
      case _i104.BearerTypeSheetFedPressMinPlateDTO:
        return _i104.BearerTypeSheetFedPressMinPlateDTO.t;
      case _i105.BearerTypeSheetFedPressPlateEqualsSubDTO:
        return _i105.BearerTypeSheetFedPressPlateEqualsSubDTO.t;
      case _i106.BearerTypeStandardFlexoPrintDTO:
        return _i106.BearerTypeStandardFlexoPrintDTO.t;
      case _i107.BearerType1DTO:
        return _i107.BearerType1DTO.t;
      case _i108.BearerType2DTO:
        return _i108.BearerType2DTO.t;
      case _i115.ArtworkColorDTO:
        return _i115.ArtworkColorDTO.t;
      case _i121.PrepressColorPaletteDTO:
        return _i121.PrepressColorPaletteDTO.t;
      case _i123.DrucklayoutDTO:
        return _i123.DrucklayoutDTO.t;
      case _i125.DrucklayoutMultiNutzenlayoutJT:
        return _i125.DrucklayoutMultiNutzenlayoutJT.t;
      case _i126.DrucklayoutPreSelectionDTO:
        return _i126.DrucklayoutPreSelectionDTO.t;
      case _i128.DrucklayoutSalesOrderJT:
        return _i128.DrucklayoutSalesOrderJT.t;
      case _i192.DrucklayoutSelectionDTO:
        return _i192.DrucklayoutSelectionDTO.t;
      case _i131.DrucklayoutSingleNutzenlayoutJT:
        return _i131.DrucklayoutSingleNutzenlayoutJT.t;
      case _i142.NutzenlayoutDTO:
        return _i142.NutzenlayoutDTO.t;
      case _i143.SalesOrderMultiNutzenlayoutArtworkJT:
        return _i143.SalesOrderMultiNutzenlayoutArtworkJT.t;
      case _i144.SalesOrderMultiNutzenlayoutDTO:
        return _i144.SalesOrderMultiNutzenlayoutDTO.t;
      case _i146.SalesOrderSingleNutzenlayoutArtworkJT:
        return _i146.SalesOrderSingleNutzenlayoutArtworkJT.t;
      case _i147.SalesOrderSingleNutzenlayoutDTO:
        return _i147.SalesOrderSingleNutzenlayoutDTO.t;
      case _i149.ProductDTO:
        return _i149.ProductDTO.t;
      case _i151.ProductLogDTO:
        return _i151.ProductLogDTO.t;
      case _i153.ProductMasterDTO:
        return _i153.ProductMasterDTO.t;
      case _i155.SalesOrderItemDTO:
        return _i155.SalesOrderItemDTO.t;
      case _i159.SoiConsultingDTO:
        return _i159.SoiConsultingDTO.t;
      case _i161.SoiEinzelformaufbauDTO:
        return _i161.SoiEinzelformaufbauDTO.t;
      case _i164.SoiPrepareArtworkDTO:
        return _i164.SoiPrepareArtworkDTO.t;
      case _i168.SoiRequestArtworkApprovalDTO:
        return _i168.SoiRequestArtworkApprovalDTO.t;
      case _i172.SoiStepAndRepeatDTO:
        return _i172.SoiStepAndRepeatDTO.t;
      case _i176.SalesOrderDTO:
        return _i176.SalesOrderDTO.t;
      case _i180.SalesOrderStatusDTO:
        return _i180.SalesOrderStatusDTO.t;
      case _i185.FTPInterfaceDTO:
        return _i185.FTPInterfaceDTO.t;
      case _i189.JsonTemplateDTO:
        return _i189.JsonTemplateDTO.t;
      case _i129.BearerCustomerRelation:
        return _i129.BearerCustomerRelation.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'elbdesk';

  /// Wraps serialized data with its class name so that it can be deserialized
  /// with [deserializeByClassName].
  ///
  /// Records and containers containing records will be return in their JSON representation in the returned map.
  @override
  Map<String, dynamic> wrapWithClassName(Object? data) {
    /// In case the value (to be streamed) contains a record, we need to map it before it reaches the underlying JSON encode
    if (data is Iterable || data is Map) {
      return {
        'className': getClassNameForObject(data)!,
        'data': mapRecordContainingContainerToJson(data!),
      };
    } else if (data is Record) {
      return {
        'className': getClassNameForObject(data)!,
        'data': mapRecordToJson(data),
      };
    }

    return super.wrapWithClassName(data);
  }
}

/// Maps any `Record`s known to this [Protocol] to their JSON representation
///
/// Throws in case the record type is not known.
///
/// This method will return `null` (only) for `null` inputs.
Map<String, dynamic>? mapRecordToJson(Record? record) {
  if (record == null) {
    return null;
  }
  if (record is (int, bool, int)) {
    return {
      "p": [
        record.$1,
        record.$2,
        record.$3,
      ],
    };
  }
  if (record is (int?, int?)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is (int?, _i203.CompanyEmployeeDTO?)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is ({
    List<_i226.SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
    List<_i227.SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts
  })) {
    return {
      "n": {
        "multiNutzenlayouts": record.multiNutzenlayouts,
        "singleNutzenlayouts": record.singleNutzenlayouts,
      },
    };
  }
  if (record is ({int artworkQuarantineId, int serienIndex})) {
    return {
      "n": {
        "artworkQuarantineId": record.artworkQuarantineId,
        "serienIndex": record.serienIndex,
      },
    };
  }
  throw Exception('Unsupported record type ${record.runtimeType}');
}

/// Maps container types (like [List], [Map], [Set]) containing [Record]s to their JSON representation.
///
/// It should not be called for [SerializableModel] types. These handle the "[Record] in container" mapping internally already.
///
/// It is only supposed to be called from generated protocol code.
///
/// Returns either a `List<dynamic>` (for List, Sets, and Maps with non-String keys) or a `Map<String, dynamic>` in case the input was a `Map<String, …>`.
Object? mapRecordContainingContainerToJson(Object obj) {
  if (obj is! Iterable && obj is! Map) {
    throw ArgumentError.value(
      obj,
      'obj',
      'The object to serialize should be of type List, Map, or Set',
    );
  }

  dynamic mapIfNeeded(Object? obj) {
    return switch (obj) {
      Record record => mapRecordToJson(record),
      Iterable iterable => mapRecordContainingContainerToJson(iterable),
      Map map => mapRecordContainingContainerToJson(map),
      Object? value => value,
    };
  }

  switch (obj) {
    case Map<String, dynamic>():
      return {
        for (var entry in obj.entries) entry.key: mapIfNeeded(entry.value),
      };
    case Map():
      return [
        for (var entry in obj.entries)
          {
            'k': mapIfNeeded(entry.key),
            'v': mapIfNeeded(entry.value),
          }
      ];

    case Iterable():
      return [
        for (var e in obj) mapIfNeeded(e),
      ];
  }

  return obj;
}
