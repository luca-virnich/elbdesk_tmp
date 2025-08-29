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
import 'modules/crm/salutation_code/models/salutation_code_formular.dart'
    as _i2;
import 'modules/core/admin_migration/models/migration_mats_company.dart' as _i3;
import 'modules/core/admin_migration/models/migration_mats_company_field.dart'
    as _i4;
import 'modules/core/admin_migration/models/migration_mats_person.dart' as _i5;
import 'modules/core/admin_migration/models/migration_mats_person_field.dart'
    as _i6;
import 'modules/core/app_user/models/app_scope.dart' as _i7;
import 'modules/core/app_user/models/app_user.dart' as _i8;
import 'modules/core/app_user/models/app_user_field.dart' as _i9;
import 'modules/core/custom_entity_keys/custom_entity_int_keys.dart' as _i10;
import 'modules/core/entity_log/entity_log.dart' as _i11;
import 'modules/core/entity_log/entity_log_field.dart' as _i12;
import 'modules/core/global_settings/models/global_settings.dart' as _i13;
import 'modules/core/global_settings/models/global_settings_field.dart' as _i14;
import 'modules/core/service_user/model/service_user.dart' as _i15;
import 'modules/core/service_user/model/service_user_field.dart' as _i16;
import 'modules/core/service_user/model/service_user_token.dart' as _i17;
import 'modules/core/spotlight/spotlight_item.dart' as _i18;
import 'modules/core/spotlight/spotlight_type.dart' as _i19;
import 'modules/core/table/table_type.dart' as _i20;
import 'modules/crm/app_client/models/app_client.dart' as _i21;
import 'modules/crm/app_client/models/app_client_field.dart' as _i22;
import 'modules/crm/company_company/models/company_company.dart' as _i23;
import 'modules/crm/company_company/models/company_employee_field.dart' as _i24;
import 'modules/crm/company_department/models/company_department.dart' as _i25;
import 'modules/crm/company_department/models/company_department_field.dart'
    as _i26;
import 'modules/crm/company_employee/models/company_employee.dart' as _i27;
import 'modules/crm/company_employee/models/company_employee_department_jt.dart'
    as _i28;
import 'modules/crm/company_employee/models/company_employee_field.dart'
    as _i29;
import 'modules/crm/contact/models/contact.dart' as _i30;
import 'modules/crm/contact/models/contact_field.dart' as _i31;
import 'modules/crm/contact/models/contact_type.dart' as _i32;
import 'modules/crm/country_code/models/country_code.dart' as _i33;
import 'modules/crm/country_code/models/country_code_address_format.dart'
    as _i34;
import 'modules/crm/country_code/models/country_code_contact_address_format.dart'
    as _i35;
import 'modules/crm/country_code/models/country_code_field.dart' as _i36;
import 'modules/crm/crm_event/models/crm_event.dart' as _i37;
import 'modules/crm/crm_event/models/crm_event_contact_jt.dart' as _i38;
import 'modules/crm/crm_event/models/crm_event_field.dart' as _i39;
import 'modules/crm/crm_event/models/crm_event_status.dart' as _i40;
import 'modules/crm/customer/models/customer.dart' as _i41;
import 'modules/crm/customer/models/customer_field.dart' as _i42;
import 'modules/crm/customer/models/customer_sales_order_hints.dart' as _i43;
import 'modules/crm/customer/models/invoice_delivery_method.dart' as _i44;
import 'modules/crm/customer/models/shipping_method.dart' as _i45;
import 'modules/crm/customer/models/shipping_method_field.dart' as _i46;
import 'modules/crm/customer_billing_customers/models/customer_billing_customer.dart'
    as _i47;
import 'modules/crm/customer_billing_customers/models/customer_billing_customer_field.dart'
    as _i48;
import 'modules/crm/customer_contacts/models/customer_contacts.dart' as _i49;
import 'modules/crm/customer_contacts/models/customer_contacts_type.dart'
    as _i50;
import 'modules/crm/customer_contacts/models/customer_field.dart' as _i51;
import 'modules/crm/customer_customer/models/customer_customer.dart' as _i52;
import 'modules/crm/customer_customer/models/customer_customer_field.dart'
    as _i53;
import 'modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart'
    as _i54;
import 'modules/crm/customer_shipping_contact/models/customer_shipping_contact_field.dart'
    as _i55;
import 'modules/crm/department_code/models/department_code.dart' as _i56;
import 'modules/crm/department_code/models/department_code_field.dart' as _i57;
import 'modules/crm/language_code/models/language_code.dart' as _i58;
import 'modules/crm/language_code/models/language_code_field.dart' as _i59;
import 'modules/crm/payment_code/models/payment_code.dart' as _i60;
import 'modules/crm/payment_code/models/payment_code_field.dart' as _i61;
import 'modules/crm/salutation_code/models/salutation_code.dart' as _i62;
import 'modules/crm/salutation_code/models/salutation_code_field.dart' as _i63;
import 'exceptions/elb_exception_message.dart' as _i64;
import 'modules/crm/salutation_code/models/salutation_type.dart' as _i65;
import 'modules/prepress/artwork/models/artwork.dart' as _i66;
import 'modules/prepress/artwork/models/artwork_additional_data_field.dart'
    as _i67;
import 'modules/prepress/artwork/models/artwork_artwork_master.dart' as _i68;
import 'modules/prepress/artwork/models/artwork_die_cutter_type.dart' as _i69;
import 'modules/prepress/artwork/models/artwork_field.dart' as _i70;
import 'modules/prepress/artwork/models/artwork_log.dart' as _i71;
import 'modules/prepress/artwork/models/artwork_log_field.dart' as _i72;
import 'modules/prepress/artwork/models/artwork_master.dart' as _i73;
import 'modules/prepress/artwork/models/artwork_print_process_type.dart'
    as _i74;
import 'modules/prepress/artwork/models/artwork_sales_order_update.dart'
    as _i75;
import 'modules/prepress/artwork/models/artwork_type.dart' as _i76;
import 'modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i77;
import 'modules/prepress/artwork_quarantine/models/artwork_quarantine_field.dart'
    as _i78;
import 'modules/prepress/artwork_quarantine/models/artwork_quaratine_analysis_data_dto.dart'
    as _i79;
import 'modules/prepress/artwork_quarantine/models/color_specification.dart'
    as _i80;
import 'modules/prepress/artwork_quarantine/models/font_info.dart' as _i81;
import 'modules/prepress/artwork_quarantine/models/layer_info.dart' as _i82;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i83;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_field.dart'
    as _i84;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group_status.dart'
    as _i85;
import 'modules/prepress/artwork_quarantine_group/models/artwork_quarantine_type.dart'
    as _i86;
import 'modules/prepress/artwork_quarantine_group/models/system_file.dart'
    as _i87;
import 'modules/prepress/artwork_quarantine_group/models/system_file_attachment_type.dart'
    as _i88;
import 'modules/prepress/artwork_template/models/artwork_template.dart' as _i89;
import 'modules/prepress/artwork_template/models/artwork_template_field.dart'
    as _i90;
import 'modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i91;
import 'modules/prepress/artwork_template/models/artwork_template_pre_selection_field.dart'
    as _i92;
import 'modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i93;
import 'modules/prepress/artwork_template/models/artwork_template_selection_field.dart'
    as _i94;
import 'modules/prepress/bearer/models/bearer.dart' as _i95;
import 'modules/prepress/bearer/models/bearer_field.dart' as _i96;
import 'modules/prepress/bearer/models/bearer_type.dart' as _i97;
import 'modules/prepress/bearer/models/types/bearer_flexo_print_multilayer.dart'
    as _i98;
import 'modules/prepress/bearer/models/types/bearer_offset_press_fixed_plate.dart'
    as _i99;
import 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_fixed_plate.dart'
    as _i100;
import 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_min_plate.dart'
    as _i101;
import 'modules/prepress/bearer/models/types/bearer_sheet_fed_press_plate_equals_sub.dart'
    as _i102;
import 'modules/prepress/bearer/models/types/bearer_standard_flexo.dart'
    as _i103;
import 'modules/prepress/bearer/models/types/bearer_type1.dart' as _i104;
import 'modules/prepress/bearer/models/types/bearer_type2.dart' as _i105;
import 'modules/prepress/codes/models/artwork_code.dart' as _i106;
import 'modules/prepress/codes/models/artwork_code_field.dart' as _i107;
import 'modules/prepress/codes/models/artwork_code_type.dart' as _i108;
import 'modules/prepress/codes/models/codes/aztec_code.dart' as _i109;
import 'modules/prepress/codes/models/codes/template_code.dart' as _i110;
import 'modules/prepress/codes/models/codes/twoOf5_code.dart' as _i111;
import 'modules/prepress/color/models/artwork_color.dart' as _i112;
import 'modules/prepress/color/models/artwork_color_field.dart' as _i113;
import 'modules/prepress/color/models/artwork_color_print_process_type.dart'
    as _i114;
import 'modules/prepress/color/models/artwork_color_spec_type.dart' as _i115;
import 'modules/prepress/color/models/artwork_color_type.dart' as _i116;
import 'modules/prepress/color/models/artwork_verarbeitungsebene_type.dart'
    as _i117;
import 'modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i118;
import 'modules/prepress/color_palette/models/prepress_color_palette_field.dart'
    as _i119;
import 'modules/prepress/drucklayout/models/drucklayout.dart' as _i120;
import 'modules/prepress/drucklayout/models/drucklayout_field.dart' as _i121;
import 'modules/prepress/drucklayout/models/drucklayout_multi_nutzenlayout_jt.dart'
    as _i122;
import 'modules/prepress/drucklayout/models/drucklayout_pre_selection.dart'
    as _i123;
import 'modules/prepress/drucklayout/models/drucklayout_pre_selection_field.dart'
    as _i124;
import 'modules/prepress/drucklayout/models/drucklayout_sales_order_jt.dart'
    as _i125;
import 'modules/unsorted/junction_tables/customer_bearer.dart' as _i126;
import 'modules/prepress/drucklayout/models/drucklayout_selection_field.dart'
    as _i127;
import 'modules/prepress/drucklayout/models/drucklayout_single_nutzenlayout_jt.dart'
    as _i128;
import 'modules/prepress/layer/models/artwork_layer.dart' as _i129;
import 'modules/prepress/layer/models/artwork_layer_field.dart' as _i130;
import 'modules/prepress/layer/models/artwork_layer_type.dart' as _i131;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i132;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_cell_dto.dart'
    as _i133;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_column_dto.dart'
    as _i134;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_form_type.dart'
    as _i135;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_laufrichtung.dart'
    as _i136;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_type.dart' as _i137;
import 'modules/prepress/nutzenlayout/models/nutzenlayout_unit_system.dart'
    as _i138;
import 'modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i139;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_artwork_jt.dart'
    as _i140;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i141;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_light.dart'
    as _i142;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_artwork_jt.dart'
    as _i143;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i144;
import 'modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_light.dart'
    as _i145;
import 'modules/prepress/product/models/product.dart' as _i146;
import 'modules/prepress/product/models/product_field.dart' as _i147;
import 'modules/prepress/product/models/product_log.dart' as _i148;
import 'modules/prepress/product/models/product_log_field.dart' as _i149;
import 'modules/prepress/product/models/product_master.dart' as _i150;
import 'modules/prepress/product/models/product_type.dart' as _i151;
import 'modules/prepress/sales_order_item/models/sales_order_item.dart'
    as _i152;
import 'modules/prepress/sales_order_item/models/sales_order_item_field.dart'
    as _i153;
import 'modules/prepress/sales_order_item/models/sales_order_item_status.dart'
    as _i154;
import 'modules/prepress/sales_order_item/models/sales_order_item_type.dart'
    as _i155;
import 'modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_dto.dart'
    as _i156;
import 'modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_field.dart'
    as _i157;
import 'modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau.dart'
    as _i158;
import 'modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau_field.dart'
    as _i159;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/eye_c_status.dart'
    as _i160;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork.dart'
    as _i161;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_additional_data_field.dart'
    as _i162;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_difficulty_level.dart'
    as _i163;
import 'modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork_field.dart'
    as _i164;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval.dart'
    as _i165;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_additional_data_field.dart'
    as _i166;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_field.dart'
    as _i167;
import 'modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval_type.dart'
    as _i168;
import 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat.dart'
    as _i169;
import 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat_field.dart'
    as _i170;
import 'modules/prepress/sales_order_item/soi_step_and_repeat/models/soi_step_and_repeat_status.dart'
    as _i171;
import 'modules/prepress/trapping/models/trapping.dart' as _i172;
import 'modules/sales/sales_order/models/sales_order.dart' as _i173;
import 'modules/sales/sales_order/models/sales_order_additional_data_field.dart'
    as _i174;
import 'modules/sales/sales_order/models/sales_order_field.dart' as _i175;
import 'modules/sales/sales_order/models/sales_order_status.dart' as _i176;
import 'modules/sales/sales_order/models/sales_order_status_dto.dart' as _i177;
import 'modules/sales/sales_order/models/sales_order_status_field.dart'
    as _i178;
import 'modules/unsorted/dashboard_grid/dashboard_tile_config.dart' as _i179;
import 'modules/unsorted/dashboard_grid/dashboard_tile_type.dart' as _i180;
import 'modules/unsorted/ftp_interface/ftp_incoming_reply_type.dart' as _i181;
import 'modules/unsorted/ftp_interface/ftp_interface.dart' as _i182;
import 'modules/unsorted/ftp_interface/ftp_type.dart' as _i183;
import 'modules/unsorted/json_designer/json_dto.dart' as _i184;
import 'modules/unsorted/json_designer/json_field_type.dart' as _i185;
import 'modules/unsorted/json_designer/json_template.dart' as _i186;
import 'modules/unsorted/json_designer/json_template_field.dart' as _i187;
import 'modules/unsorted/json_designer/json_template_type.dart' as _i188;
import 'modules/prepress/drucklayout/models/drucklayout_selection.dart'
    as _i189;
import 'package:elbdesk_client/src/protocol/modules/core/admin_migration/models/migration_mats_company.dart'
    as _i190;
import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart'
    as _i191;
import 'package:elbdesk_client/src/protocol/modules/crm/contact/models/contact.dart'
    as _i192;
import 'package:elbdesk_client/src/protocol/modules/crm/customer/models/customer.dart'
    as _i193;
import 'package:elbdesk_client/src/protocol/modules/core/admin_migration/models/migration_mats_person.dart'
    as _i194;
import 'package:elbdesk_client/src/protocol/modules/core/app_user/models/app_user.dart'
    as _i195;
import 'package:elbdesk_client/src/protocol/modules/core/entity_log/entity_log.dart'
    as _i196;
import 'package:elbdesk_client/src/protocol/modules/core/service_user/model/service_user.dart'
    as _i197;
import 'package:elbdesk_client/src/protocol/modules/core/service_user/model/service_user_token.dart'
    as _i198;
import 'package:elbdesk_client/src/protocol/modules/crm/app_client/models/app_client.dart'
    as _i199;
import 'package:elbdesk_client/src/protocol/modules/crm/company_department/models/company_department.dart'
    as _i200;
import 'package:elbdesk_client/src/protocol/modules/crm/company_employee/models/company_employee.dart'
    as _i201;
import 'package:elbdesk_client/src/protocol/modules/core/spotlight/spotlight_item.dart'
    as _i202;
import 'package:elbdesk_client/src/protocol/modules/crm/country_code/models/country_code.dart'
    as _i203;
import 'package:elbdesk_client/src/protocol/modules/crm/crm_event/models/crm_event.dart'
    as _i204;
import 'package:elbdesk_client/src/protocol/modules/crm/customer_billing_customers/models/customer_billing_customer.dart'
    as _i205;
import 'package:elbdesk_client/src/protocol/modules/crm/customer/models/shipping_method.dart'
    as _i206;
import 'package:elbdesk_client/src/protocol/modules/crm/customer_customer/models/customer_customer.dart'
    as _i207;
import 'package:elbdesk_client/src/protocol/modules/crm/customer_shipping_contact/models/customer_shipping_contact.dart'
    as _i208;
import 'package:elbdesk_client/src/protocol/modules/crm/department_code/models/department_code.dart'
    as _i209;
import 'package:elbdesk_client/src/protocol/modules/crm/language_code/models/language_code.dart'
    as _i210;
import 'package:elbdesk_client/src/protocol/modules/crm/payment_code/models/payment_code.dart'
    as _i211;
import 'package:elbdesk_client/src/protocol/modules/crm/salutation_code/models/salutation_code.dart'
    as _i212;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork.dart'
    as _i213;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork_log.dart'
    as _i214;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork/models/artwork_master.dart'
    as _i215;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_quarantine/models/artwork_quarantine_dto.dart'
    as _i216;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_quarantine_group/models/artwork_quarantine_group.dart'
    as _i217;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_template/models/artwork_template.dart'
    as _i218;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_template/models/artwork_template_pre_selection.dart'
    as _i219;
import 'package:elbdesk_client/src/protocol/modules/prepress/artwork_template/models/artwork_template_selection.dart'
    as _i220;
import 'package:elbdesk_client/src/protocol/modules/prepress/color/models/artwork_color.dart'
    as _i221;
import 'package:elbdesk_client/src/protocol/modules/prepress/color_palette/models/prepress_color_palette.dart'
    as _i222;
import 'package:elbdesk_client/src/protocol/modules/prepress/drucklayout/models/drucklayout.dart'
    as _i223;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_dto.dart'
    as _i224;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_dto.dart'
    as _i225;
import 'package:elbdesk_client/src/protocol/modules/prepress/drucklayout/models/drucklayout_pre_selection.dart'
    as _i226;
import 'package:elbdesk_client/src/protocol/modules/prepress/drucklayout/models/drucklayout_selection.dart'
    as _i227;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_single_nutzenlayout_light.dart'
    as _i228;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/sales_order_multi_nutzenlayout_light.dart'
    as _i229;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/tables/nutzenlayout_dto.dart'
    as _i230;
import 'package:elbdesk_client/src/protocol/modules/prepress/nutzenlayout/models/nutzenlayout_artwork_dimensions.dart'
    as _i231;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/models/sales_order_item_type.dart'
    as _i232;
import 'package:elbdesk_client/src/protocol/modules/prepress/product/models/product.dart'
    as _i233;
import 'package:elbdesk_client/src/protocol/modules/prepress/product/models/product_log.dart'
    as _i234;
import 'package:elbdesk_client/src/protocol/modules/prepress/product/models/product_master.dart'
    as _i235;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/models/sales_order_item.dart'
    as _i236;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_consulting/models/soi_consulting_dto.dart'
    as _i237;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_einzelformaufbau/models/soi_einzelformaufbau.dart'
    as _i238;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_prepare_artwork/models/soi_prepare_artwork.dart'
    as _i239;
import 'package:elbdesk_client/src/protocol/modules/prepress/sales_order_item/soi_request_artwork_approval/models/soi_request_artwork_approval.dart'
    as _i240;
import 'package:elbdesk_client/src/protocol/modules/sales/sales_order/models/sales_order.dart'
    as _i241;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i242;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.SalutationCodeFormularDTO) {
      return _i2.SalutationCodeFormularDTO.fromJson(data) as T;
    }
    if (t == _i3.MigrationMatsCompanyDTO) {
      return _i3.MigrationMatsCompanyDTO.fromJson(data) as T;
    }
    if (t == _i4.MigrationMatsCompanyField) {
      return _i4.MigrationMatsCompanyField.fromJson(data) as T;
    }
    if (t == _i5.MigrationMatsPersonDTO) {
      return _i5.MigrationMatsPersonDTO.fromJson(data) as T;
    }
    if (t == _i6.MigrationMatsPersonField) {
      return _i6.MigrationMatsPersonField.fromJson(data) as T;
    }
    if (t == _i7.AppScope) {
      return _i7.AppScope.fromJson(data) as T;
    }
    if (t == _i8.AppUserDTO) {
      return _i8.AppUserDTO.fromJson(data) as T;
    }
    if (t == _i9.AppUserField) {
      return _i9.AppUserField.fromJson(data) as T;
    }
    if (t == _i10.CustomEntityIntKeys) {
      return _i10.CustomEntityIntKeys.fromJson(data) as T;
    }
    if (t == _i11.EntityLogDTO) {
      return _i11.EntityLogDTO.fromJson(data) as T;
    }
    if (t == _i12.EntityLogField) {
      return _i12.EntityLogField.fromJson(data) as T;
    }
    if (t == _i13.GlobalSettingsDTO) {
      return _i13.GlobalSettingsDTO.fromJson(data) as T;
    }
    if (t == _i14.GlobalSettingsField) {
      return _i14.GlobalSettingsField.fromJson(data) as T;
    }
    if (t == _i15.ServiceUserDTO) {
      return _i15.ServiceUserDTO.fromJson(data) as T;
    }
    if (t == _i16.ServiceUserField) {
      return _i16.ServiceUserField.fromJson(data) as T;
    }
    if (t == _i17.ServiceUserTokenDTO) {
      return _i17.ServiceUserTokenDTO.fromJson(data) as T;
    }
    if (t == _i18.SpotlightItem) {
      return _i18.SpotlightItem.fromJson(data) as T;
    }
    if (t == _i19.SpotlightType) {
      return _i19.SpotlightType.fromJson(data) as T;
    }
    if (t == _i20.TableType) {
      return _i20.TableType.fromJson(data) as T;
    }
    if (t == _i21.AppClientDTO) {
      return _i21.AppClientDTO.fromJson(data) as T;
    }
    if (t == _i22.AppClientField) {
      return _i22.AppClientField.fromJson(data) as T;
    }
    if (t == _i23.CompanyCompanyDTO) {
      return _i23.CompanyCompanyDTO.fromJson(data) as T;
    }
    if (t == _i24.CompanyCompanyField) {
      return _i24.CompanyCompanyField.fromJson(data) as T;
    }
    if (t == _i25.CompanyDepartmentDTO) {
      return _i25.CompanyDepartmentDTO.fromJson(data) as T;
    }
    if (t == _i26.CompanyDepartmentField) {
      return _i26.CompanyDepartmentField.fromJson(data) as T;
    }
    if (t == _i27.CompanyEmployeeDTO) {
      return _i27.CompanyEmployeeDTO.fromJson(data) as T;
    }
    if (t == _i28.CompanyEmployeeDepartmentJT) {
      return _i28.CompanyEmployeeDepartmentJT.fromJson(data) as T;
    }
    if (t == _i29.CompanyEmployeeField) {
      return _i29.CompanyEmployeeField.fromJson(data) as T;
    }
    if (t == _i30.ContactDTO) {
      return _i30.ContactDTO.fromJson(data) as T;
    }
    if (t == _i31.ContactField) {
      return _i31.ContactField.fromJson(data) as T;
    }
    if (t == _i32.ContactType) {
      return _i32.ContactType.fromJson(data) as T;
    }
    if (t == _i33.CountryCodeDTO) {
      return _i33.CountryCodeDTO.fromJson(data) as T;
    }
    if (t == _i34.CountryCodeAddressFormat) {
      return _i34.CountryCodeAddressFormat.fromJson(data) as T;
    }
    if (t == _i35.CountryCodeContactAddressFormat) {
      return _i35.CountryCodeContactAddressFormat.fromJson(data) as T;
    }
    if (t == _i36.CountryCodeField) {
      return _i36.CountryCodeField.fromJson(data) as T;
    }
    if (t == _i37.CrmEventDTO) {
      return _i37.CrmEventDTO.fromJson(data) as T;
    }
    if (t == _i38.CrmEventContactJT) {
      return _i38.CrmEventContactJT.fromJson(data) as T;
    }
    if (t == _i39.CrmEventField) {
      return _i39.CrmEventField.fromJson(data) as T;
    }
    if (t == _i40.CrmEventStatus) {
      return _i40.CrmEventStatus.fromJson(data) as T;
    }
    if (t == _i41.CustomerDTO) {
      return _i41.CustomerDTO.fromJson(data) as T;
    }
    if (t == _i42.CustomerField) {
      return _i42.CustomerField.fromJson(data) as T;
    }
    if (t == _i43.CustomerSalesOrderHintsDTO) {
      return _i43.CustomerSalesOrderHintsDTO.fromJson(data) as T;
    }
    if (t == _i44.InvoiceDeliveryMethod) {
      return _i44.InvoiceDeliveryMethod.fromJson(data) as T;
    }
    if (t == _i45.ShippingMethodDTO) {
      return _i45.ShippingMethodDTO.fromJson(data) as T;
    }
    if (t == _i46.ShippingMethodField) {
      return _i46.ShippingMethodField.fromJson(data) as T;
    }
    if (t == _i47.CustomerBillingCustomerDTO) {
      return _i47.CustomerBillingCustomerDTO.fromJson(data) as T;
    }
    if (t == _i48.CustomerBillingCustomerField) {
      return _i48.CustomerBillingCustomerField.fromJson(data) as T;
    }
    if (t == _i49.CustomerContactsDTO) {
      return _i49.CustomerContactsDTO.fromJson(data) as T;
    }
    if (t == _i50.CustomerContactsType) {
      return _i50.CustomerContactsType.fromJson(data) as T;
    }
    if (t == _i51.CustomerContactsField) {
      return _i51.CustomerContactsField.fromJson(data) as T;
    }
    if (t == _i52.CustomerCustomerDTO) {
      return _i52.CustomerCustomerDTO.fromJson(data) as T;
    }
    if (t == _i53.CustomerCustomerField) {
      return _i53.CustomerCustomerField.fromJson(data) as T;
    }
    if (t == _i54.CustomerShippingContactDTO) {
      return _i54.CustomerShippingContactDTO.fromJson(data) as T;
    }
    if (t == _i55.CustomerShippingContactField) {
      return _i55.CustomerShippingContactField.fromJson(data) as T;
    }
    if (t == _i56.DepartmentCodeDTO) {
      return _i56.DepartmentCodeDTO.fromJson(data) as T;
    }
    if (t == _i57.DepartmentCodeField) {
      return _i57.DepartmentCodeField.fromJson(data) as T;
    }
    if (t == _i58.LanguageCodeDTO) {
      return _i58.LanguageCodeDTO.fromJson(data) as T;
    }
    if (t == _i59.LanguageCodeField) {
      return _i59.LanguageCodeField.fromJson(data) as T;
    }
    if (t == _i60.PaymentCodeDTO) {
      return _i60.PaymentCodeDTO.fromJson(data) as T;
    }
    if (t == _i61.PaymentCodeField) {
      return _i61.PaymentCodeField.fromJson(data) as T;
    }
    if (t == _i62.SalutationCodeDTO) {
      return _i62.SalutationCodeDTO.fromJson(data) as T;
    }
    if (t == _i63.SalutationCodeField) {
      return _i63.SalutationCodeField.fromJson(data) as T;
    }
    if (t == _i64.ElbExceptionMessage) {
      return _i64.ElbExceptionMessage.fromJson(data) as T;
    }
    if (t == _i65.SalutationType) {
      return _i65.SalutationType.fromJson(data) as T;
    }
    if (t == _i66.ArtworkDTO) {
      return _i66.ArtworkDTO.fromJson(data) as T;
    }
    if (t == _i67.ArtworkAdditionalDataField) {
      return _i67.ArtworkAdditionalDataField.fromJson(data) as T;
    }
    if (t == _i68.ArtworkArtworkMaster) {
      return _i68.ArtworkArtworkMaster.fromJson(data) as T;
    }
    if (t == _i69.ArtworkDieCutterType) {
      return _i69.ArtworkDieCutterType.fromJson(data) as T;
    }
    if (t == _i70.ArtworkField) {
      return _i70.ArtworkField.fromJson(data) as T;
    }
    if (t == _i71.ArtworkLogDTO) {
      return _i71.ArtworkLogDTO.fromJson(data) as T;
    }
    if (t == _i72.ArtworkLogField) {
      return _i72.ArtworkLogField.fromJson(data) as T;
    }
    if (t == _i73.ArtworkMasterDTO) {
      return _i73.ArtworkMasterDTO.fromJson(data) as T;
    }
    if (t == _i74.ArtworkPrintProcessType) {
      return _i74.ArtworkPrintProcessType.fromJson(data) as T;
    }
    if (t == _i75.ArtworkSalesOrderUpdate) {
      return _i75.ArtworkSalesOrderUpdate.fromJson(data) as T;
    }
    if (t == _i76.ArtworkType) {
      return _i76.ArtworkType.fromJson(data) as T;
    }
    if (t == _i77.ArtworkQuarantineDTO) {
      return _i77.ArtworkQuarantineDTO.fromJson(data) as T;
    }
    if (t == _i78.ArtworkQuarantineField) {
      return _i78.ArtworkQuarantineField.fromJson(data) as T;
    }
    if (t == _i79.ArtworkQuarantineAnalysisDataDTO) {
      return _i79.ArtworkQuarantineAnalysisDataDTO.fromJson(data) as T;
    }
    if (t == _i80.ColorSpecificationDTO) {
      return _i80.ColorSpecificationDTO.fromJson(data) as T;
    }
    if (t == _i81.FontInfoDTO) {
      return _i81.FontInfoDTO.fromJson(data) as T;
    }
    if (t == _i82.LayerInfoDTO) {
      return _i82.LayerInfoDTO.fromJson(data) as T;
    }
    if (t == _i83.ArtworkQuarantineGroupDTO) {
      return _i83.ArtworkQuarantineGroupDTO.fromJson(data) as T;
    }
    if (t == _i84.ArtworkQuarantineGroupField) {
      return _i84.ArtworkQuarantineGroupField.fromJson(data) as T;
    }
    if (t == _i85.ArtworkQuarantineGroupStatus) {
      return _i85.ArtworkQuarantineGroupStatus.fromJson(data) as T;
    }
    if (t == _i86.ArtworkQuarantineGroupType) {
      return _i86.ArtworkQuarantineGroupType.fromJson(data) as T;
    }
    if (t == _i87.SystemFileDTO) {
      return _i87.SystemFileDTO.fromJson(data) as T;
    }
    if (t == _i88.SystemFileAttachmentType) {
      return _i88.SystemFileAttachmentType.fromJson(data) as T;
    }
    if (t == _i89.ArtworkTemplateDTO) {
      return _i89.ArtworkTemplateDTO.fromJson(data) as T;
    }
    if (t == _i90.ArtworkTemplateField) {
      return _i90.ArtworkTemplateField.fromJson(data) as T;
    }
    if (t == _i91.ArtworkTemplatePreSelectionDTO) {
      return _i91.ArtworkTemplatePreSelectionDTO.fromJson(data) as T;
    }
    if (t == _i92.ArtworkTemplatePreSelectionField) {
      return _i92.ArtworkTemplatePreSelectionField.fromJson(data) as T;
    }
    if (t == _i93.ArtworkTemplateSelectionDTO) {
      return _i93.ArtworkTemplateSelectionDTO.fromJson(data) as T;
    }
    if (t == _i94.ArtworkTemplateSelectionField) {
      return _i94.ArtworkTemplateSelectionField.fromJson(data) as T;
    }
    if (t == _i95.BearerDTO) {
      return _i95.BearerDTO.fromJson(data) as T;
    }
    if (t == _i96.BearerField) {
      return _i96.BearerField.fromJson(data) as T;
    }
    if (t == _i97.BearerType) {
      return _i97.BearerType.fromJson(data) as T;
    }
    if (t == _i98.BearerTypeFlexoPrintMultilayerDTO) {
      return _i98.BearerTypeFlexoPrintMultilayerDTO.fromJson(data) as T;
    }
    if (t == _i99.BearerTypeOffsetPressFixedPlateDTO) {
      return _i99.BearerTypeOffsetPressFixedPlateDTO.fromJson(data) as T;
    }
    if (t == _i100.BearerTypeSheetFedPressFixedPlateDTO) {
      return _i100.BearerTypeSheetFedPressFixedPlateDTO.fromJson(data) as T;
    }
    if (t == _i101.BearerTypeSheetFedPressMinPlateDTO) {
      return _i101.BearerTypeSheetFedPressMinPlateDTO.fromJson(data) as T;
    }
    if (t == _i102.BearerTypeSheetFedPressPlateEqualsSubDTO) {
      return _i102.BearerTypeSheetFedPressPlateEqualsSubDTO.fromJson(data) as T;
    }
    if (t == _i103.BearerTypeStandardFlexoPrintDTO) {
      return _i103.BearerTypeStandardFlexoPrintDTO.fromJson(data) as T;
    }
    if (t == _i104.BearerType1DTO) {
      return _i104.BearerType1DTO.fromJson(data) as T;
    }
    if (t == _i105.BearerType2DTO) {
      return _i105.BearerType2DTO.fromJson(data) as T;
    }
    if (t == _i106.ArtworkCodeDTO) {
      return _i106.ArtworkCodeDTO.fromJson(data) as T;
    }
    if (t == _i107.ArtworkCodeField) {
      return _i107.ArtworkCodeField.fromJson(data) as T;
    }
    if (t == _i108.ArtworkCodeType) {
      return _i108.ArtworkCodeType.fromJson(data) as T;
    }
    if (t == _i109.AztecCodeDTO) {
      return _i109.AztecCodeDTO.fromJson(data) as T;
    }
    if (t == _i110.TemplateCodeDTO) {
      return _i110.TemplateCodeDTO.fromJson(data) as T;
    }
    if (t == _i111.TwoOf5CodeDTO) {
      return _i111.TwoOf5CodeDTO.fromJson(data) as T;
    }
    if (t == _i112.ArtworkColorDTO) {
      return _i112.ArtworkColorDTO.fromJson(data) as T;
    }
    if (t == _i113.ArtworkColorField) {
      return _i113.ArtworkColorField.fromJson(data) as T;
    }
    if (t == _i114.ArtworkColorPrintProcessType) {
      return _i114.ArtworkColorPrintProcessType.fromJson(data) as T;
    }
    if (t == _i115.ArtworkColorSpecType) {
      return _i115.ArtworkColorSpecType.fromJson(data) as T;
    }
    if (t == _i116.ArtworkColorType) {
      return _i116.ArtworkColorType.fromJson(data) as T;
    }
    if (t == _i117.ArtworkVerarbeitungsebeneType) {
      return _i117.ArtworkVerarbeitungsebeneType.fromJson(data) as T;
    }
    if (t == _i118.PrepressColorPaletteDTO) {
      return _i118.PrepressColorPaletteDTO.fromJson(data) as T;
    }
    if (t == _i119.PrepressColorPaletteField) {
      return _i119.PrepressColorPaletteField.fromJson(data) as T;
    }
    if (t == _i120.DrucklayoutDTO) {
      return _i120.DrucklayoutDTO.fromJson(data) as T;
    }
    if (t == _i121.DrucklayoutField) {
      return _i121.DrucklayoutField.fromJson(data) as T;
    }
    if (t == _i122.DrucklayoutMultiNutzenlayoutJT) {
      return _i122.DrucklayoutMultiNutzenlayoutJT.fromJson(data) as T;
    }
    if (t == _i123.DrucklayoutPreSelectionDTO) {
      return _i123.DrucklayoutPreSelectionDTO.fromJson(data) as T;
    }
    if (t == _i124.DrucklayoutPreSelectionField) {
      return _i124.DrucklayoutPreSelectionField.fromJson(data) as T;
    }
    if (t == _i125.DrucklayoutSalesOrderJT) {
      return _i125.DrucklayoutSalesOrderJT.fromJson(data) as T;
    }
    if (t == _i126.BearerCustomerRelation) {
      return _i126.BearerCustomerRelation.fromJson(data) as T;
    }
    if (t == _i127.DrucklayoutSelectionField) {
      return _i127.DrucklayoutSelectionField.fromJson(data) as T;
    }
    if (t == _i128.DrucklayoutSingleNutzenlayoutJT) {
      return _i128.DrucklayoutSingleNutzenlayoutJT.fromJson(data) as T;
    }
    if (t == _i129.ArtworkLayerDTO) {
      return _i129.ArtworkLayerDTO.fromJson(data) as T;
    }
    if (t == _i130.ArtworkLayerField) {
      return _i130.ArtworkLayerField.fromJson(data) as T;
    }
    if (t == _i131.ArtworkLayerType) {
      return _i131.ArtworkLayerType.fromJson(data) as T;
    }
    if (t == _i132.NutzenlayoutArtworkDimensions) {
      return _i132.NutzenlayoutArtworkDimensions.fromJson(data) as T;
    }
    if (t == _i133.NutzenlayoutCellDTO) {
      return _i133.NutzenlayoutCellDTO.fromJson(data) as T;
    }
    if (t == _i134.NutzenlayoutColumnDTO) {
      return _i134.NutzenlayoutColumnDTO.fromJson(data) as T;
    }
    if (t == _i135.NutzenlayoutFormType) {
      return _i135.NutzenlayoutFormType.fromJson(data) as T;
    }
    if (t == _i136.NutzenlayoutLaufrichtung) {
      return _i136.NutzenlayoutLaufrichtung.fromJson(data) as T;
    }
    if (t == _i137.NutzenlayoutType) {
      return _i137.NutzenlayoutType.fromJson(data) as T;
    }
    if (t == _i138.NutzenlayoutUnitSystem) {
      return _i138.NutzenlayoutUnitSystem.fromJson(data) as T;
    }
    if (t == _i139.NutzenlayoutDTO) {
      return _i139.NutzenlayoutDTO.fromJson(data) as T;
    }
    if (t == _i140.SalesOrderMultiNutzenlayoutArtworkJT) {
      return _i140.SalesOrderMultiNutzenlayoutArtworkJT.fromJson(data) as T;
    }
    if (t == _i141.SalesOrderMultiNutzenlayoutDTO) {
      return _i141.SalesOrderMultiNutzenlayoutDTO.fromJson(data) as T;
    }
    if (t == _i142.SalesOrderMultiNutzenlayoutLightDTO) {
      return _i142.SalesOrderMultiNutzenlayoutLightDTO.fromJson(data) as T;
    }
    if (t == _i143.SalesOrderSingleNutzenlayoutArtworkJT) {
      return _i143.SalesOrderSingleNutzenlayoutArtworkJT.fromJson(data) as T;
    }
    if (t == _i144.SalesOrderSingleNutzenlayoutDTO) {
      return _i144.SalesOrderSingleNutzenlayoutDTO.fromJson(data) as T;
    }
    if (t == _i145.SalesOrderSingleNutzenlayoutLightDTO) {
      return _i145.SalesOrderSingleNutzenlayoutLightDTO.fromJson(data) as T;
    }
    if (t == _i146.ProductDTO) {
      return _i146.ProductDTO.fromJson(data) as T;
    }
    if (t == _i147.ProductField) {
      return _i147.ProductField.fromJson(data) as T;
    }
    if (t == _i148.ProductLogDTO) {
      return _i148.ProductLogDTO.fromJson(data) as T;
    }
    if (t == _i149.ProductLogField) {
      return _i149.ProductLogField.fromJson(data) as T;
    }
    if (t == _i150.ProductMasterDTO) {
      return _i150.ProductMasterDTO.fromJson(data) as T;
    }
    if (t == _i151.ProductType) {
      return _i151.ProductType.fromJson(data) as T;
    }
    if (t == _i152.SalesOrderItemDTO) {
      return _i152.SalesOrderItemDTO.fromJson(data) as T;
    }
    if (t == _i153.SalesOrderItemField) {
      return _i153.SalesOrderItemField.fromJson(data) as T;
    }
    if (t == _i154.SalesOrderItemStatus) {
      return _i154.SalesOrderItemStatus.fromJson(data) as T;
    }
    if (t == _i155.SalesOrderItemType) {
      return _i155.SalesOrderItemType.fromJson(data) as T;
    }
    if (t == _i156.SoiConsultingDTO) {
      return _i156.SoiConsultingDTO.fromJson(data) as T;
    }
    if (t == _i157.SoiConsultingField) {
      return _i157.SoiConsultingField.fromJson(data) as T;
    }
    if (t == _i158.SoiEinzelformaufbauDTO) {
      return _i158.SoiEinzelformaufbauDTO.fromJson(data) as T;
    }
    if (t == _i159.SoiEinzelformaufbauField) {
      return _i159.SoiEinzelformaufbauField.fromJson(data) as T;
    }
    if (t == _i160.EyeCStatus) {
      return _i160.EyeCStatus.fromJson(data) as T;
    }
    if (t == _i161.SoiPrepareArtworkDTO) {
      return _i161.SoiPrepareArtworkDTO.fromJson(data) as T;
    }
    if (t == _i162.SoiPrepareArtworkAdditionalDataField) {
      return _i162.SoiPrepareArtworkAdditionalDataField.fromJson(data) as T;
    }
    if (t == _i163.SoiPrepareArtworkDifficultyLevel) {
      return _i163.SoiPrepareArtworkDifficultyLevel.fromJson(data) as T;
    }
    if (t == _i164.SoiPrepareArtworkField) {
      return _i164.SoiPrepareArtworkField.fromJson(data) as T;
    }
    if (t == _i165.SoiRequestArtworkApprovalDTO) {
      return _i165.SoiRequestArtworkApprovalDTO.fromJson(data) as T;
    }
    if (t == _i166.SoiRequestArtworkApprovalAdditionalDataField) {
      return _i166.SoiRequestArtworkApprovalAdditionalDataField.fromJson(data)
          as T;
    }
    if (t == _i167.SoiRequestArtworkApprovalField) {
      return _i167.SoiRequestArtworkApprovalField.fromJson(data) as T;
    }
    if (t == _i168.SoiRequestArtworkApprovalType) {
      return _i168.SoiRequestArtworkApprovalType.fromJson(data) as T;
    }
    if (t == _i169.SoiStepAndRepeatDTO) {
      return _i169.SoiStepAndRepeatDTO.fromJson(data) as T;
    }
    if (t == _i170.SoiStepAndRepeatField) {
      return _i170.SoiStepAndRepeatField.fromJson(data) as T;
    }
    if (t == _i171.SoiStepAndRepeatStatus) {
      return _i171.SoiStepAndRepeatStatus.fromJson(data) as T;
    }
    if (t == _i172.TrappingDTO) {
      return _i172.TrappingDTO.fromJson(data) as T;
    }
    if (t == _i173.SalesOrderDTO) {
      return _i173.SalesOrderDTO.fromJson(data) as T;
    }
    if (t == _i174.SalesOrderAdditionalDataField) {
      return _i174.SalesOrderAdditionalDataField.fromJson(data) as T;
    }
    if (t == _i175.SalesOrderField) {
      return _i175.SalesOrderField.fromJson(data) as T;
    }
    if (t == _i176.SalesOrderStatus) {
      return _i176.SalesOrderStatus.fromJson(data) as T;
    }
    if (t == _i177.SalesOrderStatusDTO) {
      return _i177.SalesOrderStatusDTO.fromJson(data) as T;
    }
    if (t == _i178.SalesOrderStatusField) {
      return _i178.SalesOrderStatusField.fromJson(data) as T;
    }
    if (t == _i179.DashboardTileConfigDTO) {
      return _i179.DashboardTileConfigDTO.fromJson(data) as T;
    }
    if (t == _i180.DashboardTileType) {
      return _i180.DashboardTileType.fromJson(data) as T;
    }
    if (t == _i181.FTPIncomingReplyType) {
      return _i181.FTPIncomingReplyType.fromJson(data) as T;
    }
    if (t == _i182.FTPInterfaceDTO) {
      return _i182.FTPInterfaceDTO.fromJson(data) as T;
    }
    if (t == _i183.FTPType) {
      return _i183.FTPType.fromJson(data) as T;
    }
    if (t == _i184.JsonDTO) {
      return _i184.JsonDTO.fromJson(data) as T;
    }
    if (t == _i185.JsonFieldType) {
      return _i185.JsonFieldType.fromJson(data) as T;
    }
    if (t == _i186.JsonTemplateDTO) {
      return _i186.JsonTemplateDTO.fromJson(data) as T;
    }
    if (t == _i187.JsonTemplateField) {
      return _i187.JsonTemplateField.fromJson(data) as T;
    }
    if (t == _i188.JsonTemplateType) {
      return _i188.JsonTemplateType.fromJson(data) as T;
    }
    if (t == _i189.DrucklayoutSelectionDTO) {
      return _i189.DrucklayoutSelectionDTO.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.SalutationCodeFormularDTO?>()) {
      return (data != null
          ? _i2.SalutationCodeFormularDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i3.MigrationMatsCompanyDTO?>()) {
      return (data != null ? _i3.MigrationMatsCompanyDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i4.MigrationMatsCompanyField?>()) {
      return (data != null
          ? _i4.MigrationMatsCompanyField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i5.MigrationMatsPersonDTO?>()) {
      return (data != null ? _i5.MigrationMatsPersonDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i6.MigrationMatsPersonField?>()) {
      return (data != null ? _i6.MigrationMatsPersonField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.AppScope?>()) {
      return (data != null ? _i7.AppScope.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.AppUserDTO?>()) {
      return (data != null ? _i8.AppUserDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.AppUserField?>()) {
      return (data != null ? _i9.AppUserField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.CustomEntityIntKeys?>()) {
      return (data != null ? _i10.CustomEntityIntKeys.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i11.EntityLogDTO?>()) {
      return (data != null ? _i11.EntityLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.EntityLogField?>()) {
      return (data != null ? _i12.EntityLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.GlobalSettingsDTO?>()) {
      return (data != null ? _i13.GlobalSettingsDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.GlobalSettingsField?>()) {
      return (data != null ? _i14.GlobalSettingsField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i15.ServiceUserDTO?>()) {
      return (data != null ? _i15.ServiceUserDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.ServiceUserField?>()) {
      return (data != null ? _i16.ServiceUserField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.ServiceUserTokenDTO?>()) {
      return (data != null ? _i17.ServiceUserTokenDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i18.SpotlightItem?>()) {
      return (data != null ? _i18.SpotlightItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.SpotlightType?>()) {
      return (data != null ? _i19.SpotlightType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.TableType?>()) {
      return (data != null ? _i20.TableType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.AppClientDTO?>()) {
      return (data != null ? _i21.AppClientDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.AppClientField?>()) {
      return (data != null ? _i22.AppClientField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.CompanyCompanyDTO?>()) {
      return (data != null ? _i23.CompanyCompanyDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.CompanyCompanyField?>()) {
      return (data != null ? _i24.CompanyCompanyField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.CompanyDepartmentDTO?>()) {
      return (data != null ? _i25.CompanyDepartmentDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i26.CompanyDepartmentField?>()) {
      return (data != null ? _i26.CompanyDepartmentField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.CompanyEmployeeDTO?>()) {
      return (data != null ? _i27.CompanyEmployeeDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i28.CompanyEmployeeDepartmentJT?>()) {
      return (data != null
          ? _i28.CompanyEmployeeDepartmentJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i29.CompanyEmployeeField?>()) {
      return (data != null ? _i29.CompanyEmployeeField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i30.ContactDTO?>()) {
      return (data != null ? _i30.ContactDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.ContactField?>()) {
      return (data != null ? _i31.ContactField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.ContactType?>()) {
      return (data != null ? _i32.ContactType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.CountryCodeDTO?>()) {
      return (data != null ? _i33.CountryCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.CountryCodeAddressFormat?>()) {
      return (data != null
          ? _i34.CountryCodeAddressFormat.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i35.CountryCodeContactAddressFormat?>()) {
      return (data != null
          ? _i35.CountryCodeContactAddressFormat.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i36.CountryCodeField?>()) {
      return (data != null ? _i36.CountryCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i37.CrmEventDTO?>()) {
      return (data != null ? _i37.CrmEventDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i38.CrmEventContactJT?>()) {
      return (data != null ? _i38.CrmEventContactJT.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i39.CrmEventField?>()) {
      return (data != null ? _i39.CrmEventField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i40.CrmEventStatus?>()) {
      return (data != null ? _i40.CrmEventStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i41.CustomerDTO?>()) {
      return (data != null ? _i41.CustomerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i42.CustomerField?>()) {
      return (data != null ? _i42.CustomerField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i43.CustomerSalesOrderHintsDTO?>()) {
      return (data != null
          ? _i43.CustomerSalesOrderHintsDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i44.InvoiceDeliveryMethod?>()) {
      return (data != null ? _i44.InvoiceDeliveryMethod.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i45.ShippingMethodDTO?>()) {
      return (data != null ? _i45.ShippingMethodDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i46.ShippingMethodField?>()) {
      return (data != null ? _i46.ShippingMethodField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i47.CustomerBillingCustomerDTO?>()) {
      return (data != null
          ? _i47.CustomerBillingCustomerDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i48.CustomerBillingCustomerField?>()) {
      return (data != null
          ? _i48.CustomerBillingCustomerField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i49.CustomerContactsDTO?>()) {
      return (data != null ? _i49.CustomerContactsDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i50.CustomerContactsType?>()) {
      return (data != null ? _i50.CustomerContactsType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i51.CustomerContactsField?>()) {
      return (data != null ? _i51.CustomerContactsField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i52.CustomerCustomerDTO?>()) {
      return (data != null ? _i52.CustomerCustomerDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i53.CustomerCustomerField?>()) {
      return (data != null ? _i53.CustomerCustomerField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i54.CustomerShippingContactDTO?>()) {
      return (data != null
          ? _i54.CustomerShippingContactDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i55.CustomerShippingContactField?>()) {
      return (data != null
          ? _i55.CustomerShippingContactField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i56.DepartmentCodeDTO?>()) {
      return (data != null ? _i56.DepartmentCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i57.DepartmentCodeField?>()) {
      return (data != null ? _i57.DepartmentCodeField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i58.LanguageCodeDTO?>()) {
      return (data != null ? _i58.LanguageCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i59.LanguageCodeField?>()) {
      return (data != null ? _i59.LanguageCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i60.PaymentCodeDTO?>()) {
      return (data != null ? _i60.PaymentCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i61.PaymentCodeField?>()) {
      return (data != null ? _i61.PaymentCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i62.SalutationCodeDTO?>()) {
      return (data != null ? _i62.SalutationCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i63.SalutationCodeField?>()) {
      return (data != null ? _i63.SalutationCodeField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i64.ElbExceptionMessage?>()) {
      return (data != null ? _i64.ElbExceptionMessage.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i65.SalutationType?>()) {
      return (data != null ? _i65.SalutationType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i66.ArtworkDTO?>()) {
      return (data != null ? _i66.ArtworkDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i67.ArtworkAdditionalDataField?>()) {
      return (data != null
          ? _i67.ArtworkAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i68.ArtworkArtworkMaster?>()) {
      return (data != null ? _i68.ArtworkArtworkMaster.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i69.ArtworkDieCutterType?>()) {
      return (data != null ? _i69.ArtworkDieCutterType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i70.ArtworkField?>()) {
      return (data != null ? _i70.ArtworkField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i71.ArtworkLogDTO?>()) {
      return (data != null ? _i71.ArtworkLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i72.ArtworkLogField?>()) {
      return (data != null ? _i72.ArtworkLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i73.ArtworkMasterDTO?>()) {
      return (data != null ? _i73.ArtworkMasterDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i74.ArtworkPrintProcessType?>()) {
      return (data != null ? _i74.ArtworkPrintProcessType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i75.ArtworkSalesOrderUpdate?>()) {
      return (data != null ? _i75.ArtworkSalesOrderUpdate.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i76.ArtworkType?>()) {
      return (data != null ? _i76.ArtworkType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i77.ArtworkQuarantineDTO?>()) {
      return (data != null ? _i77.ArtworkQuarantineDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i78.ArtworkQuarantineField?>()) {
      return (data != null ? _i78.ArtworkQuarantineField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i79.ArtworkQuarantineAnalysisDataDTO?>()) {
      return (data != null
          ? _i79.ArtworkQuarantineAnalysisDataDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i80.ColorSpecificationDTO?>()) {
      return (data != null ? _i80.ColorSpecificationDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i81.FontInfoDTO?>()) {
      return (data != null ? _i81.FontInfoDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i82.LayerInfoDTO?>()) {
      return (data != null ? _i82.LayerInfoDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i83.ArtworkQuarantineGroupDTO?>()) {
      return (data != null
          ? _i83.ArtworkQuarantineGroupDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i84.ArtworkQuarantineGroupField?>()) {
      return (data != null
          ? _i84.ArtworkQuarantineGroupField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i85.ArtworkQuarantineGroupStatus?>()) {
      return (data != null
          ? _i85.ArtworkQuarantineGroupStatus.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i86.ArtworkQuarantineGroupType?>()) {
      return (data != null
          ? _i86.ArtworkQuarantineGroupType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i87.SystemFileDTO?>()) {
      return (data != null ? _i87.SystemFileDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i88.SystemFileAttachmentType?>()) {
      return (data != null
          ? _i88.SystemFileAttachmentType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i89.ArtworkTemplateDTO?>()) {
      return (data != null ? _i89.ArtworkTemplateDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i90.ArtworkTemplateField?>()) {
      return (data != null ? _i90.ArtworkTemplateField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i91.ArtworkTemplatePreSelectionDTO?>()) {
      return (data != null
          ? _i91.ArtworkTemplatePreSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i92.ArtworkTemplatePreSelectionField?>()) {
      return (data != null
          ? _i92.ArtworkTemplatePreSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i93.ArtworkTemplateSelectionDTO?>()) {
      return (data != null
          ? _i93.ArtworkTemplateSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i94.ArtworkTemplateSelectionField?>()) {
      return (data != null
          ? _i94.ArtworkTemplateSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i95.BearerDTO?>()) {
      return (data != null ? _i95.BearerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i96.BearerField?>()) {
      return (data != null ? _i96.BearerField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i97.BearerType?>()) {
      return (data != null ? _i97.BearerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i98.BearerTypeFlexoPrintMultilayerDTO?>()) {
      return (data != null
          ? _i98.BearerTypeFlexoPrintMultilayerDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i99.BearerTypeOffsetPressFixedPlateDTO?>()) {
      return (data != null
          ? _i99.BearerTypeOffsetPressFixedPlateDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i100.BearerTypeSheetFedPressFixedPlateDTO?>()) {
      return (data != null
          ? _i100.BearerTypeSheetFedPressFixedPlateDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i101.BearerTypeSheetFedPressMinPlateDTO?>()) {
      return (data != null
          ? _i101.BearerTypeSheetFedPressMinPlateDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i102.BearerTypeSheetFedPressPlateEqualsSubDTO?>()) {
      return (data != null
          ? _i102.BearerTypeSheetFedPressPlateEqualsSubDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i103.BearerTypeStandardFlexoPrintDTO?>()) {
      return (data != null
          ? _i103.BearerTypeStandardFlexoPrintDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i104.BearerType1DTO?>()) {
      return (data != null ? _i104.BearerType1DTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i105.BearerType2DTO?>()) {
      return (data != null ? _i105.BearerType2DTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i106.ArtworkCodeDTO?>()) {
      return (data != null ? _i106.ArtworkCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i107.ArtworkCodeField?>()) {
      return (data != null ? _i107.ArtworkCodeField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i108.ArtworkCodeType?>()) {
      return (data != null ? _i108.ArtworkCodeType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i109.AztecCodeDTO?>()) {
      return (data != null ? _i109.AztecCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i110.TemplateCodeDTO?>()) {
      return (data != null ? _i110.TemplateCodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i111.TwoOf5CodeDTO?>()) {
      return (data != null ? _i111.TwoOf5CodeDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i112.ArtworkColorDTO?>()) {
      return (data != null ? _i112.ArtworkColorDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i113.ArtworkColorField?>()) {
      return (data != null ? _i113.ArtworkColorField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i114.ArtworkColorPrintProcessType?>()) {
      return (data != null
          ? _i114.ArtworkColorPrintProcessType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i115.ArtworkColorSpecType?>()) {
      return (data != null ? _i115.ArtworkColorSpecType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i116.ArtworkColorType?>()) {
      return (data != null ? _i116.ArtworkColorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i117.ArtworkVerarbeitungsebeneType?>()) {
      return (data != null
          ? _i117.ArtworkVerarbeitungsebeneType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i118.PrepressColorPaletteDTO?>()) {
      return (data != null
          ? _i118.PrepressColorPaletteDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i119.PrepressColorPaletteField?>()) {
      return (data != null
          ? _i119.PrepressColorPaletteField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i120.DrucklayoutDTO?>()) {
      return (data != null ? _i120.DrucklayoutDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i121.DrucklayoutField?>()) {
      return (data != null ? _i121.DrucklayoutField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i122.DrucklayoutMultiNutzenlayoutJT?>()) {
      return (data != null
          ? _i122.DrucklayoutMultiNutzenlayoutJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i123.DrucklayoutPreSelectionDTO?>()) {
      return (data != null
          ? _i123.DrucklayoutPreSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i124.DrucklayoutPreSelectionField?>()) {
      return (data != null
          ? _i124.DrucklayoutPreSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i125.DrucklayoutSalesOrderJT?>()) {
      return (data != null
          ? _i125.DrucklayoutSalesOrderJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i126.BearerCustomerRelation?>()) {
      return (data != null ? _i126.BearerCustomerRelation.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i127.DrucklayoutSelectionField?>()) {
      return (data != null
          ? _i127.DrucklayoutSelectionField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i128.DrucklayoutSingleNutzenlayoutJT?>()) {
      return (data != null
          ? _i128.DrucklayoutSingleNutzenlayoutJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i129.ArtworkLayerDTO?>()) {
      return (data != null ? _i129.ArtworkLayerDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i130.ArtworkLayerField?>()) {
      return (data != null ? _i130.ArtworkLayerField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i131.ArtworkLayerType?>()) {
      return (data != null ? _i131.ArtworkLayerType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i132.NutzenlayoutArtworkDimensions?>()) {
      return (data != null
          ? _i132.NutzenlayoutArtworkDimensions.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i133.NutzenlayoutCellDTO?>()) {
      return (data != null ? _i133.NutzenlayoutCellDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i134.NutzenlayoutColumnDTO?>()) {
      return (data != null ? _i134.NutzenlayoutColumnDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i135.NutzenlayoutFormType?>()) {
      return (data != null ? _i135.NutzenlayoutFormType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i136.NutzenlayoutLaufrichtung?>()) {
      return (data != null
          ? _i136.NutzenlayoutLaufrichtung.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i137.NutzenlayoutType?>()) {
      return (data != null ? _i137.NutzenlayoutType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i138.NutzenlayoutUnitSystem?>()) {
      return (data != null ? _i138.NutzenlayoutUnitSystem.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i139.NutzenlayoutDTO?>()) {
      return (data != null ? _i139.NutzenlayoutDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i140.SalesOrderMultiNutzenlayoutArtworkJT?>()) {
      return (data != null
          ? _i140.SalesOrderMultiNutzenlayoutArtworkJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i141.SalesOrderMultiNutzenlayoutDTO?>()) {
      return (data != null
          ? _i141.SalesOrderMultiNutzenlayoutDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i142.SalesOrderMultiNutzenlayoutLightDTO?>()) {
      return (data != null
          ? _i142.SalesOrderMultiNutzenlayoutLightDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i143.SalesOrderSingleNutzenlayoutArtworkJT?>()) {
      return (data != null
          ? _i143.SalesOrderSingleNutzenlayoutArtworkJT.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i144.SalesOrderSingleNutzenlayoutDTO?>()) {
      return (data != null
          ? _i144.SalesOrderSingleNutzenlayoutDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i145.SalesOrderSingleNutzenlayoutLightDTO?>()) {
      return (data != null
          ? _i145.SalesOrderSingleNutzenlayoutLightDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i146.ProductDTO?>()) {
      return (data != null ? _i146.ProductDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i147.ProductField?>()) {
      return (data != null ? _i147.ProductField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i148.ProductLogDTO?>()) {
      return (data != null ? _i148.ProductLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i149.ProductLogField?>()) {
      return (data != null ? _i149.ProductLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i150.ProductMasterDTO?>()) {
      return (data != null ? _i150.ProductMasterDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i151.ProductType?>()) {
      return (data != null ? _i151.ProductType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i152.SalesOrderItemDTO?>()) {
      return (data != null ? _i152.SalesOrderItemDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i153.SalesOrderItemField?>()) {
      return (data != null ? _i153.SalesOrderItemField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i154.SalesOrderItemStatus?>()) {
      return (data != null ? _i154.SalesOrderItemStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i155.SalesOrderItemType?>()) {
      return (data != null ? _i155.SalesOrderItemType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i156.SoiConsultingDTO?>()) {
      return (data != null ? _i156.SoiConsultingDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i157.SoiConsultingField?>()) {
      return (data != null ? _i157.SoiConsultingField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i158.SoiEinzelformaufbauDTO?>()) {
      return (data != null ? _i158.SoiEinzelformaufbauDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i159.SoiEinzelformaufbauField?>()) {
      return (data != null
          ? _i159.SoiEinzelformaufbauField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i160.EyeCStatus?>()) {
      return (data != null ? _i160.EyeCStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i161.SoiPrepareArtworkDTO?>()) {
      return (data != null ? _i161.SoiPrepareArtworkDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i162.SoiPrepareArtworkAdditionalDataField?>()) {
      return (data != null
          ? _i162.SoiPrepareArtworkAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i163.SoiPrepareArtworkDifficultyLevel?>()) {
      return (data != null
          ? _i163.SoiPrepareArtworkDifficultyLevel.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i164.SoiPrepareArtworkField?>()) {
      return (data != null ? _i164.SoiPrepareArtworkField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i165.SoiRequestArtworkApprovalDTO?>()) {
      return (data != null
          ? _i165.SoiRequestArtworkApprovalDTO.fromJson(data)
          : null) as T;
    }
    if (t ==
        _i1.getType<_i166.SoiRequestArtworkApprovalAdditionalDataField?>()) {
      return (data != null
          ? _i166.SoiRequestArtworkApprovalAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i167.SoiRequestArtworkApprovalField?>()) {
      return (data != null
          ? _i167.SoiRequestArtworkApprovalField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i168.SoiRequestArtworkApprovalType?>()) {
      return (data != null
          ? _i168.SoiRequestArtworkApprovalType.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i169.SoiStepAndRepeatDTO?>()) {
      return (data != null ? _i169.SoiStepAndRepeatDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i170.SoiStepAndRepeatField?>()) {
      return (data != null ? _i170.SoiStepAndRepeatField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i171.SoiStepAndRepeatStatus?>()) {
      return (data != null ? _i171.SoiStepAndRepeatStatus.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i172.TrappingDTO?>()) {
      return (data != null ? _i172.TrappingDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i173.SalesOrderDTO?>()) {
      return (data != null ? _i173.SalesOrderDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i174.SalesOrderAdditionalDataField?>()) {
      return (data != null
          ? _i174.SalesOrderAdditionalDataField.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i175.SalesOrderField?>()) {
      return (data != null ? _i175.SalesOrderField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i176.SalesOrderStatus?>()) {
      return (data != null ? _i176.SalesOrderStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i177.SalesOrderStatusDTO?>()) {
      return (data != null ? _i177.SalesOrderStatusDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i178.SalesOrderStatusField?>()) {
      return (data != null ? _i178.SalesOrderStatusField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i179.DashboardTileConfigDTO?>()) {
      return (data != null ? _i179.DashboardTileConfigDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i180.DashboardTileType?>()) {
      return (data != null ? _i180.DashboardTileType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i181.FTPIncomingReplyType?>()) {
      return (data != null ? _i181.FTPIncomingReplyType.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i182.FTPInterfaceDTO?>()) {
      return (data != null ? _i182.FTPInterfaceDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i183.FTPType?>()) {
      return (data != null ? _i183.FTPType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i184.JsonDTO?>()) {
      return (data != null ? _i184.JsonDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i185.JsonFieldType?>()) {
      return (data != null ? _i185.JsonFieldType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i186.JsonTemplateDTO?>()) {
      return (data != null ? _i186.JsonTemplateDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i187.JsonTemplateField?>()) {
      return (data != null ? _i187.JsonTemplateField.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i188.JsonTemplateType?>()) {
      return (data != null ? _i188.JsonTemplateType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i189.DrucklayoutSelectionDTO?>()) {
      return (data != null
          ? _i189.DrucklayoutSelectionDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<List<_i17.ServiceUserTokenDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i17.ServiceUserTokenDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i28.CompanyEmployeeDepartmentJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i28.CompanyEmployeeDepartmentJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i28.CompanyEmployeeDepartmentJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i28.CompanyEmployeeDepartmentJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i38.CrmEventContactJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i38.CrmEventContactJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i38.CrmEventContactJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i38.CrmEventContactJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i182.FTPInterfaceDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i182.FTPInterfaceDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i126.BearerCustomerRelation>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i126.BearerCustomerRelation>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i118.PrepressColorPaletteDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i118.PrepressColorPaletteDTO>(e))
              .toList()
          : null) as T;
    }
    if (t ==
        _i1.getType<List<_i143.SalesOrderSingleNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i143.SalesOrderSingleNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i140.SalesOrderMultiNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i140.SalesOrderMultiNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i106.ArtworkCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i106.ArtworkCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i129.ArtworkLayerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i129.ArtworkLayerDTO>(e))
          .toList() as T;
    }
    if (t == List<_i112.ArtworkColorDTO>) {
      return (data as List)
          .map((e) => deserialize<_i112.ArtworkColorDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i112.ArtworkColorDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i112.ArtworkColorDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i80.ColorSpecificationDTO>) {
      return (data as List)
          .map((e) => deserialize<_i80.ColorSpecificationDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i87.SystemFileDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i87.SystemFileDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i77.ArtworkQuarantineDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i77.ArtworkQuarantineDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i126.BearerCustomerRelation>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i126.BearerCustomerRelation>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i112.ArtworkColorDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i112.ArtworkColorDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i125.DrucklayoutSalesOrderJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i125.DrucklayoutSalesOrderJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i128.DrucklayoutSingleNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i128.DrucklayoutSingleNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i122.DrucklayoutMultiNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i122.DrucklayoutMultiNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i133.NutzenlayoutCellDTO>) {
      return (data as List)
          .map((e) => deserialize<_i133.NutzenlayoutCellDTO>(e))
          .toList() as T;
    }
    if (t == List<_i134.NutzenlayoutColumnDTO>) {
      return (data as List)
          .map((e) => deserialize<_i134.NutzenlayoutColumnDTO>(e))
          .toList() as T;
    }
    if (t == List<_i132.NutzenlayoutArtworkDimensions>) {
      return (data as List)
          .map((e) => deserialize<_i132.NutzenlayoutArtworkDimensions>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i140.SalesOrderMultiNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i140.SalesOrderMultiNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i122.DrucklayoutMultiNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i122.DrucklayoutMultiNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i68.ArtworkArtworkMaster>) {
      return (data as List)
          .map((e) => deserialize<_i68.ArtworkArtworkMaster>(e))
          .toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t ==
        _i1.getType<List<_i143.SalesOrderSingleNutzenlayoutArtworkJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) =>
                  deserialize<_i143.SalesOrderSingleNutzenlayoutArtworkJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i128.DrucklayoutSingleNutzenlayoutJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i128.DrucklayoutSingleNutzenlayoutJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i66.ArtworkDTO>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i66.ArtworkDTO>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i73.ArtworkMasterDTO>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i73.ArtworkMasterDTO>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i125.DrucklayoutSalesOrderJT>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i125.DrucklayoutSalesOrderJT>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<Map<String, _i184.JsonDTO>?>()) {
      return (data != null
          ? (data as Map).map((k, v) =>
              MapEntry(deserialize<String>(k), deserialize<_i184.JsonDTO>(v)))
          : null) as T;
    }
    if (t == List<_i190.MigrationMatsCompanyDTO>) {
      return (data as List)
          .map((e) => deserialize<_i190.MigrationMatsCompanyDTO>(e))
          .toList() as T;
    }
    if (t == List<_i191.EntityLockDTO>) {
      return (data as List)
          .map((e) => deserialize<_i191.EntityLockDTO>(e))
          .toList() as T;
    }
    if (t == List<_i192.ContactDTO>) {
      return (data as List)
          .map((e) => deserialize<_i192.ContactDTO>(e))
          .toList() as T;
    }
    if (t == List<_i193.CustomerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i193.CustomerDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(int, bool, int)>()) {
      return (
        deserialize<int>(((data as Map)['p'] as List)[0]),
        deserialize<bool>(data['p'][1]),
        deserialize<int>(data['p'][2]),
      ) as T;
    }
    if (t == List<_i194.MigrationMatsPersonDTO>) {
      return (data as List)
          .map((e) => deserialize<_i194.MigrationMatsPersonDTO>(e))
          .toList() as T;
    }
    if (t == List<_i195.AppUserDTO>) {
      return (data as List)
          .map((e) => deserialize<_i195.AppUserDTO>(e))
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
    if (t == List<_i191.EntityAssignmentDTO>) {
      return (data as List)
          .map((e) => deserialize<_i191.EntityAssignmentDTO>(e))
          .toList() as T;
    }
    if (t == List<_i196.EntityLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i196.EntityLogDTO>(e))
          .toList() as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i197.ServiceUserDTO>) {
      return (data as List)
          .map((e) => deserialize<_i197.ServiceUserDTO>(e))
          .toList() as T;
    }
    if (t == List<_i198.ServiceUserTokenDTO>) {
      return (data as List)
          .map((e) => deserialize<_i198.ServiceUserTokenDTO>(e))
          .toList() as T;
    }
    if (t == List<_i199.AppClientDTO>) {
      return (data as List)
          .map((e) => deserialize<_i199.AppClientDTO>(e))
          .toList() as T;
    }
    if (t == List<_i200.CompanyDepartmentDTO>) {
      return (data as List)
          .map((e) => deserialize<_i200.CompanyDepartmentDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(int?, _i201.CompanyEmployeeDTO?)>()) {
      return (
        ((data as Map)['p'] as List)[0] == null
            ? null
            : deserialize<int>(data['p'][0]),
        ((data)['p'] as List)[1] == null
            ? null
            : deserialize<_i201.CompanyEmployeeDTO>(data['p'][1]),
      ) as T;
    }
    if (t == List<_i201.CompanyEmployeeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i201.CompanyEmployeeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i202.SpotlightItem>) {
      return (data as List)
          .map((e) => deserialize<_i202.SpotlightItem>(e))
          .toList() as T;
    }
    if (t == List<_i203.CountryCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i203.CountryCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i204.CrmEventDTO>) {
      return (data as List)
          .map((e) => deserialize<_i204.CrmEventDTO>(e))
          .toList() as T;
    }
    if (t == List<_i205.CustomerBillingCustomerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i205.CustomerBillingCustomerDTO>(e))
          .toList() as T;
    }
    if (t == List<_i206.ShippingMethodDTO>) {
      return (data as List)
          .map((e) => deserialize<_i206.ShippingMethodDTO>(e))
          .toList() as T;
    }
    if (t == List<_i207.CustomerCustomerDTO>) {
      return (data as List)
          .map((e) => deserialize<_i207.CustomerCustomerDTO>(e))
          .toList() as T;
    }
    if (t == List<_i208.CustomerShippingContactDTO>) {
      return (data as List)
          .map((e) => deserialize<_i208.CustomerShippingContactDTO>(e))
          .toList() as T;
    }
    if (t == List<_i209.DepartmentCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i209.DepartmentCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i210.LanguageCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i210.LanguageCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i211.PaymentCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i211.PaymentCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i212.SalutationCodeDTO>) {
      return (data as List)
          .map((e) => deserialize<_i212.SalutationCodeDTO>(e))
          .toList() as T;
    }
    if (t == List<_i213.ArtworkDTO>) {
      return (data as List)
          .map((e) => deserialize<_i213.ArtworkDTO>(e))
          .toList() as T;
    }
    if (t == List<_i214.ArtworkLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i214.ArtworkLogDTO>(e))
          .toList() as T;
    }
    if (t == List<_i215.ArtworkMasterDTO>) {
      return (data as List)
          .map((e) => deserialize<_i215.ArtworkMasterDTO>(e))
          .toList() as T;
    }
    if (t == List<_i216.ArtworkQuarantineDTO>) {
      return (data as List)
          .map((e) => deserialize<_i216.ArtworkQuarantineDTO>(e))
          .toList() as T;
    }
    if (t == List<_i217.ArtworkQuarantineGroupDTO>) {
      return (data as List)
          .map((e) => deserialize<_i217.ArtworkQuarantineGroupDTO>(e))
          .toList() as T;
    }
    if (t == List<_i218.ArtworkTemplateDTO>) {
      return (data as List)
          .map((e) => deserialize<_i218.ArtworkTemplateDTO>(e))
          .toList() as T;
    }
    if (t == List<_i219.ArtworkTemplatePreSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i219.ArtworkTemplatePreSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i220.ArtworkTemplateSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i220.ArtworkTemplateSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i221.ArtworkColorDTO>) {
      return (data as List)
          .map((e) => deserialize<_i221.ArtworkColorDTO>(e))
          .toList() as T;
    }
    if (t == List<_i222.PrepressColorPaletteDTO>) {
      return (data as List)
          .map((e) => deserialize<_i222.PrepressColorPaletteDTO>(e))
          .toList() as T;
    }
    if (t == List<_i223.DrucklayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i223.DrucklayoutDTO>(e))
          .toList() as T;
    }
    if (t == Set<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toSet() as T;
    }
    if (t ==
        _i1.getType<
            ({
              List<_i224.SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
              List<_i225.SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts
            })>()) {
      return (
        multiNutzenlayouts:
            deserialize<List<_i224.SalesOrderMultiNutzenlayoutDTO>>(
                ((data as Map)['n'] as Map)['multiNutzenlayouts']),
        singleNutzenlayouts:
            deserialize<List<_i225.SalesOrderSingleNutzenlayoutDTO>>(
                data['n']['singleNutzenlayouts']),
      ) as T;
    }
    if (t == List<_i224.SalesOrderMultiNutzenlayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i224.SalesOrderMultiNutzenlayoutDTO>(e))
          .toList() as T;
    }
    if (t == List<_i225.SalesOrderSingleNutzenlayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i225.SalesOrderSingleNutzenlayoutDTO>(e))
          .toList() as T;
    }
    if (t == List<_i226.DrucklayoutPreSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i226.DrucklayoutPreSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i227.DrucklayoutSelectionDTO>) {
      return (data as List)
          .map((e) => deserialize<_i227.DrucklayoutSelectionDTO>(e))
          .toList() as T;
    }
    if (t == List<_i228.SalesOrderSingleNutzenlayoutLightDTO>) {
      return (data as List)
          .map(
              (e) => deserialize<_i228.SalesOrderSingleNutzenlayoutLightDTO>(e))
          .toList() as T;
    }
    if (t == List<_i229.SalesOrderMultiNutzenlayoutLightDTO>) {
      return (data as List)
          .map((e) => deserialize<_i229.SalesOrderMultiNutzenlayoutLightDTO>(e))
          .toList() as T;
    }
    if (t == List<_i230.NutzenlayoutDTO>) {
      return (data as List)
          .map((e) => deserialize<_i230.NutzenlayoutDTO>(e))
          .toList() as T;
    }
    if (t == List<_i231.NutzenlayoutArtworkDimensions>) {
      return (data as List)
          .map((e) => deserialize<_i231.NutzenlayoutArtworkDimensions>(e))
          .toList() as T;
    }
    if (t == Set<_i231.NutzenlayoutArtworkDimensions>) {
      return (data as List)
          .map((e) => deserialize<_i231.NutzenlayoutArtworkDimensions>(e))
          .toSet() as T;
    }
    if (t == List<_i232.SalesOrderItemType>) {
      return (data as List)
          .map((e) => deserialize<_i232.SalesOrderItemType>(e))
          .toList() as T;
    }
    if (t == List<_i233.ProductDTO>) {
      return (data as List)
          .map((e) => deserialize<_i233.ProductDTO>(e))
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
    if (t == List<_i234.ProductLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i234.ProductLogDTO>(e))
          .toList() as T;
    }
    if (t == List<_i235.ProductMasterDTO>) {
      return (data as List)
          .map((e) => deserialize<_i235.ProductMasterDTO>(e))
          .toList() as T;
    }
    if (t == List<_i236.SalesOrderItemDTO>) {
      return (data as List)
          .map((e) => deserialize<_i236.SalesOrderItemDTO>(e))
          .toList() as T;
    }
    if (t == List<_i237.SoiConsultingDTO>) {
      return (data as List)
          .map((e) => deserialize<_i237.SoiConsultingDTO>(e))
          .toList() as T;
    }
    if (t == List<_i238.SoiEinzelformaufbauDTO>) {
      return (data as List)
          .map((e) => deserialize<_i238.SoiEinzelformaufbauDTO>(e))
          .toList() as T;
    }
    if (t == List<_i239.SoiPrepareArtworkDTO>) {
      return (data as List)
          .map((e) => deserialize<_i239.SoiPrepareArtworkDTO>(e))
          .toList() as T;
    }
    if (t == List<_i240.SoiRequestArtworkApprovalDTO>) {
      return (data as List)
          .map((e) => deserialize<_i240.SoiRequestArtworkApprovalDTO>(e))
          .toList() as T;
    }
    if (t == List<_i241.SalesOrderDTO>) {
      return (data as List)
          .map((e) => deserialize<_i241.SalesOrderDTO>(e))
          .toList() as T;
    }
    if (t == _i1.getType<(int?, _i201.CompanyEmployeeDTO?)>()) {
      return (
        ((data as Map)['p'] as List)[0] == null
            ? null
            : deserialize<int>(data['p'][0]),
        ((data)['p'] as List)[1] == null
            ? null
            : deserialize<_i201.CompanyEmployeeDTO>(data['p'][1]),
      ) as T;
    }
    try {
      return _i242.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i191.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.SalutationCodeFormularDTO) {
      return 'SalutationCodeFormularDTO';
    }
    if (data is _i3.MigrationMatsCompanyDTO) {
      return 'MigrationMatsCompanyDTO';
    }
    if (data is _i4.MigrationMatsCompanyField) {
      return 'MigrationMatsCompanyField';
    }
    if (data is _i5.MigrationMatsPersonDTO) {
      return 'MigrationMatsPersonDTO';
    }
    if (data is _i6.MigrationMatsPersonField) {
      return 'MigrationMatsPersonField';
    }
    if (data is _i7.AppScope) {
      return 'AppScope';
    }
    if (data is _i8.AppUserDTO) {
      return 'AppUserDTO';
    }
    if (data is _i9.AppUserField) {
      return 'AppUserField';
    }
    if (data is _i10.CustomEntityIntKeys) {
      return 'CustomEntityIntKeys';
    }
    if (data is _i11.EntityLogDTO) {
      return 'EntityLogDTO';
    }
    if (data is _i12.EntityLogField) {
      return 'EntityLogField';
    }
    if (data is _i13.GlobalSettingsDTO) {
      return 'GlobalSettingsDTO';
    }
    if (data is _i14.GlobalSettingsField) {
      return 'GlobalSettingsField';
    }
    if (data is _i15.ServiceUserDTO) {
      return 'ServiceUserDTO';
    }
    if (data is _i16.ServiceUserField) {
      return 'ServiceUserField';
    }
    if (data is _i17.ServiceUserTokenDTO) {
      return 'ServiceUserTokenDTO';
    }
    if (data is _i18.SpotlightItem) {
      return 'SpotlightItem';
    }
    if (data is _i19.SpotlightType) {
      return 'SpotlightType';
    }
    if (data is _i20.TableType) {
      return 'TableType';
    }
    if (data is _i21.AppClientDTO) {
      return 'AppClientDTO';
    }
    if (data is _i22.AppClientField) {
      return 'AppClientField';
    }
    if (data is _i23.CompanyCompanyDTO) {
      return 'CompanyCompanyDTO';
    }
    if (data is _i24.CompanyCompanyField) {
      return 'CompanyCompanyField';
    }
    if (data is _i25.CompanyDepartmentDTO) {
      return 'CompanyDepartmentDTO';
    }
    if (data is _i26.CompanyDepartmentField) {
      return 'CompanyDepartmentField';
    }
    if (data is _i27.CompanyEmployeeDTO) {
      return 'CompanyEmployeeDTO';
    }
    if (data is _i28.CompanyEmployeeDepartmentJT) {
      return 'CompanyEmployeeDepartmentJT';
    }
    if (data is _i29.CompanyEmployeeField) {
      return 'CompanyEmployeeField';
    }
    if (data is _i30.ContactDTO) {
      return 'ContactDTO';
    }
    if (data is _i31.ContactField) {
      return 'ContactField';
    }
    if (data is _i32.ContactType) {
      return 'ContactType';
    }
    if (data is _i33.CountryCodeDTO) {
      return 'CountryCodeDTO';
    }
    if (data is _i34.CountryCodeAddressFormat) {
      return 'CountryCodeAddressFormat';
    }
    if (data is _i35.CountryCodeContactAddressFormat) {
      return 'CountryCodeContactAddressFormat';
    }
    if (data is _i36.CountryCodeField) {
      return 'CountryCodeField';
    }
    if (data is _i37.CrmEventDTO) {
      return 'CrmEventDTO';
    }
    if (data is _i38.CrmEventContactJT) {
      return 'CrmEventContactJT';
    }
    if (data is _i39.CrmEventField) {
      return 'CrmEventField';
    }
    if (data is _i40.CrmEventStatus) {
      return 'CrmEventStatus';
    }
    if (data is _i41.CustomerDTO) {
      return 'CustomerDTO';
    }
    if (data is _i42.CustomerField) {
      return 'CustomerField';
    }
    if (data is _i43.CustomerSalesOrderHintsDTO) {
      return 'CustomerSalesOrderHintsDTO';
    }
    if (data is _i44.InvoiceDeliveryMethod) {
      return 'InvoiceDeliveryMethod';
    }
    if (data is _i45.ShippingMethodDTO) {
      return 'ShippingMethodDTO';
    }
    if (data is _i46.ShippingMethodField) {
      return 'ShippingMethodField';
    }
    if (data is _i47.CustomerBillingCustomerDTO) {
      return 'CustomerBillingCustomerDTO';
    }
    if (data is _i48.CustomerBillingCustomerField) {
      return 'CustomerBillingCustomerField';
    }
    if (data is _i49.CustomerContactsDTO) {
      return 'CustomerContactsDTO';
    }
    if (data is _i50.CustomerContactsType) {
      return 'CustomerContactsType';
    }
    if (data is _i51.CustomerContactsField) {
      return 'CustomerContactsField';
    }
    if (data is _i52.CustomerCustomerDTO) {
      return 'CustomerCustomerDTO';
    }
    if (data is _i53.CustomerCustomerField) {
      return 'CustomerCustomerField';
    }
    if (data is _i54.CustomerShippingContactDTO) {
      return 'CustomerShippingContactDTO';
    }
    if (data is _i55.CustomerShippingContactField) {
      return 'CustomerShippingContactField';
    }
    if (data is _i56.DepartmentCodeDTO) {
      return 'DepartmentCodeDTO';
    }
    if (data is _i57.DepartmentCodeField) {
      return 'DepartmentCodeField';
    }
    if (data is _i58.LanguageCodeDTO) {
      return 'LanguageCodeDTO';
    }
    if (data is _i59.LanguageCodeField) {
      return 'LanguageCodeField';
    }
    if (data is _i60.PaymentCodeDTO) {
      return 'PaymentCodeDTO';
    }
    if (data is _i61.PaymentCodeField) {
      return 'PaymentCodeField';
    }
    if (data is _i62.SalutationCodeDTO) {
      return 'SalutationCodeDTO';
    }
    if (data is _i63.SalutationCodeField) {
      return 'SalutationCodeField';
    }
    if (data is _i64.ElbExceptionMessage) {
      return 'ElbExceptionMessage';
    }
    if (data is _i65.SalutationType) {
      return 'SalutationType';
    }
    if (data is _i66.ArtworkDTO) {
      return 'ArtworkDTO';
    }
    if (data is _i67.ArtworkAdditionalDataField) {
      return 'ArtworkAdditionalDataField';
    }
    if (data is _i68.ArtworkArtworkMaster) {
      return 'ArtworkArtworkMaster';
    }
    if (data is _i69.ArtworkDieCutterType) {
      return 'ArtworkDieCutterType';
    }
    if (data is _i70.ArtworkField) {
      return 'ArtworkField';
    }
    if (data is _i71.ArtworkLogDTO) {
      return 'ArtworkLogDTO';
    }
    if (data is _i72.ArtworkLogField) {
      return 'ArtworkLogField';
    }
    if (data is _i73.ArtworkMasterDTO) {
      return 'ArtworkMasterDTO';
    }
    if (data is _i74.ArtworkPrintProcessType) {
      return 'ArtworkPrintProcessType';
    }
    if (data is _i75.ArtworkSalesOrderUpdate) {
      return 'ArtworkSalesOrderUpdate';
    }
    if (data is _i76.ArtworkType) {
      return 'ArtworkType';
    }
    if (data is _i77.ArtworkQuarantineDTO) {
      return 'ArtworkQuarantineDTO';
    }
    if (data is _i78.ArtworkQuarantineField) {
      return 'ArtworkQuarantineField';
    }
    if (data is _i79.ArtworkQuarantineAnalysisDataDTO) {
      return 'ArtworkQuarantineAnalysisDataDTO';
    }
    if (data is _i80.ColorSpecificationDTO) {
      return 'ColorSpecificationDTO';
    }
    if (data is _i81.FontInfoDTO) {
      return 'FontInfoDTO';
    }
    if (data is _i82.LayerInfoDTO) {
      return 'LayerInfoDTO';
    }
    if (data is _i83.ArtworkQuarantineGroupDTO) {
      return 'ArtworkQuarantineGroupDTO';
    }
    if (data is _i84.ArtworkQuarantineGroupField) {
      return 'ArtworkQuarantineGroupField';
    }
    if (data is _i85.ArtworkQuarantineGroupStatus) {
      return 'ArtworkQuarantineGroupStatus';
    }
    if (data is _i86.ArtworkQuarantineGroupType) {
      return 'ArtworkQuarantineGroupType';
    }
    if (data is _i87.SystemFileDTO) {
      return 'SystemFileDTO';
    }
    if (data is _i88.SystemFileAttachmentType) {
      return 'SystemFileAttachmentType';
    }
    if (data is _i89.ArtworkTemplateDTO) {
      return 'ArtworkTemplateDTO';
    }
    if (data is _i90.ArtworkTemplateField) {
      return 'ArtworkTemplateField';
    }
    if (data is _i91.ArtworkTemplatePreSelectionDTO) {
      return 'ArtworkTemplatePreSelectionDTO';
    }
    if (data is _i92.ArtworkTemplatePreSelectionField) {
      return 'ArtworkTemplatePreSelectionField';
    }
    if (data is _i93.ArtworkTemplateSelectionDTO) {
      return 'ArtworkTemplateSelectionDTO';
    }
    if (data is _i94.ArtworkTemplateSelectionField) {
      return 'ArtworkTemplateSelectionField';
    }
    if (data is _i95.BearerDTO) {
      return 'BearerDTO';
    }
    if (data is _i96.BearerField) {
      return 'BearerField';
    }
    if (data is _i97.BearerType) {
      return 'BearerType';
    }
    if (data is _i98.BearerTypeFlexoPrintMultilayerDTO) {
      return 'BearerTypeFlexoPrintMultilayerDTO';
    }
    if (data is _i99.BearerTypeOffsetPressFixedPlateDTO) {
      return 'BearerTypeOffsetPressFixedPlateDTO';
    }
    if (data is _i100.BearerTypeSheetFedPressFixedPlateDTO) {
      return 'BearerTypeSheetFedPressFixedPlateDTO';
    }
    if (data is _i101.BearerTypeSheetFedPressMinPlateDTO) {
      return 'BearerTypeSheetFedPressMinPlateDTO';
    }
    if (data is _i102.BearerTypeSheetFedPressPlateEqualsSubDTO) {
      return 'BearerTypeSheetFedPressPlateEqualsSubDTO';
    }
    if (data is _i103.BearerTypeStandardFlexoPrintDTO) {
      return 'BearerTypeStandardFlexoPrintDTO';
    }
    if (data is _i104.BearerType1DTO) {
      return 'BearerType1DTO';
    }
    if (data is _i105.BearerType2DTO) {
      return 'BearerType2DTO';
    }
    if (data is _i106.ArtworkCodeDTO) {
      return 'ArtworkCodeDTO';
    }
    if (data is _i107.ArtworkCodeField) {
      return 'ArtworkCodeField';
    }
    if (data is _i108.ArtworkCodeType) {
      return 'ArtworkCodeType';
    }
    if (data is _i109.AztecCodeDTO) {
      return 'AztecCodeDTO';
    }
    if (data is _i110.TemplateCodeDTO) {
      return 'TemplateCodeDTO';
    }
    if (data is _i111.TwoOf5CodeDTO) {
      return 'TwoOf5CodeDTO';
    }
    if (data is _i112.ArtworkColorDTO) {
      return 'ArtworkColorDTO';
    }
    if (data is _i113.ArtworkColorField) {
      return 'ArtworkColorField';
    }
    if (data is _i114.ArtworkColorPrintProcessType) {
      return 'ArtworkColorPrintProcessType';
    }
    if (data is _i115.ArtworkColorSpecType) {
      return 'ArtworkColorSpecType';
    }
    if (data is _i116.ArtworkColorType) {
      return 'ArtworkColorType';
    }
    if (data is _i117.ArtworkVerarbeitungsebeneType) {
      return 'ArtworkVerarbeitungsebeneType';
    }
    if (data is _i118.PrepressColorPaletteDTO) {
      return 'PrepressColorPaletteDTO';
    }
    if (data is _i119.PrepressColorPaletteField) {
      return 'PrepressColorPaletteField';
    }
    if (data is _i120.DrucklayoutDTO) {
      return 'DrucklayoutDTO';
    }
    if (data is _i121.DrucklayoutField) {
      return 'DrucklayoutField';
    }
    if (data is _i122.DrucklayoutMultiNutzenlayoutJT) {
      return 'DrucklayoutMultiNutzenlayoutJT';
    }
    if (data is _i123.DrucklayoutPreSelectionDTO) {
      return 'DrucklayoutPreSelectionDTO';
    }
    if (data is _i124.DrucklayoutPreSelectionField) {
      return 'DrucklayoutPreSelectionField';
    }
    if (data is _i125.DrucklayoutSalesOrderJT) {
      return 'DrucklayoutSalesOrderJT';
    }
    if (data is _i126.BearerCustomerRelation) {
      return 'BearerCustomerRelation';
    }
    if (data is _i127.DrucklayoutSelectionField) {
      return 'DrucklayoutSelectionField';
    }
    if (data is _i128.DrucklayoutSingleNutzenlayoutJT) {
      return 'DrucklayoutSingleNutzenlayoutJT';
    }
    if (data is _i129.ArtworkLayerDTO) {
      return 'ArtworkLayerDTO';
    }
    if (data is _i130.ArtworkLayerField) {
      return 'ArtworkLayerField';
    }
    if (data is _i131.ArtworkLayerType) {
      return 'ArtworkLayerType';
    }
    if (data is _i132.NutzenlayoutArtworkDimensions) {
      return 'NutzenlayoutArtworkDimensions';
    }
    if (data is _i133.NutzenlayoutCellDTO) {
      return 'NutzenlayoutCellDTO';
    }
    if (data is _i134.NutzenlayoutColumnDTO) {
      return 'NutzenlayoutColumnDTO';
    }
    if (data is _i135.NutzenlayoutFormType) {
      return 'NutzenlayoutFormType';
    }
    if (data is _i136.NutzenlayoutLaufrichtung) {
      return 'NutzenlayoutLaufrichtung';
    }
    if (data is _i137.NutzenlayoutType) {
      return 'NutzenlayoutType';
    }
    if (data is _i138.NutzenlayoutUnitSystem) {
      return 'NutzenlayoutUnitSystem';
    }
    if (data is _i139.NutzenlayoutDTO) {
      return 'NutzenlayoutDTO';
    }
    if (data is _i140.SalesOrderMultiNutzenlayoutArtworkJT) {
      return 'SalesOrderMultiNutzenlayoutArtworkJT';
    }
    if (data is _i141.SalesOrderMultiNutzenlayoutDTO) {
      return 'SalesOrderMultiNutzenlayoutDTO';
    }
    if (data is _i142.SalesOrderMultiNutzenlayoutLightDTO) {
      return 'SalesOrderMultiNutzenlayoutLightDTO';
    }
    if (data is _i143.SalesOrderSingleNutzenlayoutArtworkJT) {
      return 'SalesOrderSingleNutzenlayoutArtworkJT';
    }
    if (data is _i144.SalesOrderSingleNutzenlayoutDTO) {
      return 'SalesOrderSingleNutzenlayoutDTO';
    }
    if (data is _i145.SalesOrderSingleNutzenlayoutLightDTO) {
      return 'SalesOrderSingleNutzenlayoutLightDTO';
    }
    if (data is _i146.ProductDTO) {
      return 'ProductDTO';
    }
    if (data is _i147.ProductField) {
      return 'ProductField';
    }
    if (data is _i148.ProductLogDTO) {
      return 'ProductLogDTO';
    }
    if (data is _i149.ProductLogField) {
      return 'ProductLogField';
    }
    if (data is _i150.ProductMasterDTO) {
      return 'ProductMasterDTO';
    }
    if (data is _i151.ProductType) {
      return 'ProductType';
    }
    if (data is _i152.SalesOrderItemDTO) {
      return 'SalesOrderItemDTO';
    }
    if (data is _i153.SalesOrderItemField) {
      return 'SalesOrderItemField';
    }
    if (data is _i154.SalesOrderItemStatus) {
      return 'SalesOrderItemStatus';
    }
    if (data is _i155.SalesOrderItemType) {
      return 'SalesOrderItemType';
    }
    if (data is _i156.SoiConsultingDTO) {
      return 'SoiConsultingDTO';
    }
    if (data is _i157.SoiConsultingField) {
      return 'SoiConsultingField';
    }
    if (data is _i158.SoiEinzelformaufbauDTO) {
      return 'SoiEinzelformaufbauDTO';
    }
    if (data is _i159.SoiEinzelformaufbauField) {
      return 'SoiEinzelformaufbauField';
    }
    if (data is _i160.EyeCStatus) {
      return 'EyeCStatus';
    }
    if (data is _i161.SoiPrepareArtworkDTO) {
      return 'SoiPrepareArtworkDTO';
    }
    if (data is _i162.SoiPrepareArtworkAdditionalDataField) {
      return 'SoiPrepareArtworkAdditionalDataField';
    }
    if (data is _i163.SoiPrepareArtworkDifficultyLevel) {
      return 'SoiPrepareArtworkDifficultyLevel';
    }
    if (data is _i164.SoiPrepareArtworkField) {
      return 'SoiPrepareArtworkField';
    }
    if (data is _i165.SoiRequestArtworkApprovalDTO) {
      return 'SoiRequestArtworkApprovalDTO';
    }
    if (data is _i166.SoiRequestArtworkApprovalAdditionalDataField) {
      return 'SoiRequestArtworkApprovalAdditionalDataField';
    }
    if (data is _i167.SoiRequestArtworkApprovalField) {
      return 'SoiRequestArtworkApprovalField';
    }
    if (data is _i168.SoiRequestArtworkApprovalType) {
      return 'SoiRequestArtworkApprovalType';
    }
    if (data is _i169.SoiStepAndRepeatDTO) {
      return 'SoiStepAndRepeatDTO';
    }
    if (data is _i170.SoiStepAndRepeatField) {
      return 'SoiStepAndRepeatField';
    }
    if (data is _i171.SoiStepAndRepeatStatus) {
      return 'SoiStepAndRepeatStatus';
    }
    if (data is _i172.TrappingDTO) {
      return 'TrappingDTO';
    }
    if (data is _i173.SalesOrderDTO) {
      return 'SalesOrderDTO';
    }
    if (data is _i174.SalesOrderAdditionalDataField) {
      return 'SalesOrderAdditionalDataField';
    }
    if (data is _i175.SalesOrderField) {
      return 'SalesOrderField';
    }
    if (data is _i176.SalesOrderStatus) {
      return 'SalesOrderStatus';
    }
    if (data is _i177.SalesOrderStatusDTO) {
      return 'SalesOrderStatusDTO';
    }
    if (data is _i178.SalesOrderStatusField) {
      return 'SalesOrderStatusField';
    }
    if (data is _i179.DashboardTileConfigDTO) {
      return 'DashboardTileConfigDTO';
    }
    if (data is _i180.DashboardTileType) {
      return 'DashboardTileType';
    }
    if (data is _i181.FTPIncomingReplyType) {
      return 'FTPIncomingReplyType';
    }
    if (data is _i182.FTPInterfaceDTO) {
      return 'FTPInterfaceDTO';
    }
    if (data is _i183.FTPType) {
      return 'FTPType';
    }
    if (data is _i184.JsonDTO) {
      return 'JsonDTO';
    }
    if (data is _i185.JsonFieldType) {
      return 'JsonFieldType';
    }
    if (data is _i186.JsonTemplateDTO) {
      return 'JsonTemplateDTO';
    }
    if (data is _i187.JsonTemplateField) {
      return 'JsonTemplateField';
    }
    if (data is _i188.JsonTemplateType) {
      return 'JsonTemplateType';
    }
    if (data is _i189.DrucklayoutSelectionDTO) {
      return 'DrucklayoutSelectionDTO';
    }
    className = _i242.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    className = _i191.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'elbdesk_backend_core.$className';
    }
    if (data is (int?, _i201.CompanyEmployeeDTO?)) {
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
      return deserialize<_i2.SalutationCodeFormularDTO>(data['data']);
    }
    if (dataClassName == 'MigrationMatsCompanyDTO') {
      return deserialize<_i3.MigrationMatsCompanyDTO>(data['data']);
    }
    if (dataClassName == 'MigrationMatsCompanyField') {
      return deserialize<_i4.MigrationMatsCompanyField>(data['data']);
    }
    if (dataClassName == 'MigrationMatsPersonDTO') {
      return deserialize<_i5.MigrationMatsPersonDTO>(data['data']);
    }
    if (dataClassName == 'MigrationMatsPersonField') {
      return deserialize<_i6.MigrationMatsPersonField>(data['data']);
    }
    if (dataClassName == 'AppScope') {
      return deserialize<_i7.AppScope>(data['data']);
    }
    if (dataClassName == 'AppUserDTO') {
      return deserialize<_i8.AppUserDTO>(data['data']);
    }
    if (dataClassName == 'AppUserField') {
      return deserialize<_i9.AppUserField>(data['data']);
    }
    if (dataClassName == 'CustomEntityIntKeys') {
      return deserialize<_i10.CustomEntityIntKeys>(data['data']);
    }
    if (dataClassName == 'EntityLogDTO') {
      return deserialize<_i11.EntityLogDTO>(data['data']);
    }
    if (dataClassName == 'EntityLogField') {
      return deserialize<_i12.EntityLogField>(data['data']);
    }
    if (dataClassName == 'GlobalSettingsDTO') {
      return deserialize<_i13.GlobalSettingsDTO>(data['data']);
    }
    if (dataClassName == 'GlobalSettingsField') {
      return deserialize<_i14.GlobalSettingsField>(data['data']);
    }
    if (dataClassName == 'ServiceUserDTO') {
      return deserialize<_i15.ServiceUserDTO>(data['data']);
    }
    if (dataClassName == 'ServiceUserField') {
      return deserialize<_i16.ServiceUserField>(data['data']);
    }
    if (dataClassName == 'ServiceUserTokenDTO') {
      return deserialize<_i17.ServiceUserTokenDTO>(data['data']);
    }
    if (dataClassName == 'SpotlightItem') {
      return deserialize<_i18.SpotlightItem>(data['data']);
    }
    if (dataClassName == 'SpotlightType') {
      return deserialize<_i19.SpotlightType>(data['data']);
    }
    if (dataClassName == 'TableType') {
      return deserialize<_i20.TableType>(data['data']);
    }
    if (dataClassName == 'AppClientDTO') {
      return deserialize<_i21.AppClientDTO>(data['data']);
    }
    if (dataClassName == 'AppClientField') {
      return deserialize<_i22.AppClientField>(data['data']);
    }
    if (dataClassName == 'CompanyCompanyDTO') {
      return deserialize<_i23.CompanyCompanyDTO>(data['data']);
    }
    if (dataClassName == 'CompanyCompanyField') {
      return deserialize<_i24.CompanyCompanyField>(data['data']);
    }
    if (dataClassName == 'CompanyDepartmentDTO') {
      return deserialize<_i25.CompanyDepartmentDTO>(data['data']);
    }
    if (dataClassName == 'CompanyDepartmentField') {
      return deserialize<_i26.CompanyDepartmentField>(data['data']);
    }
    if (dataClassName == 'CompanyEmployeeDTO') {
      return deserialize<_i27.CompanyEmployeeDTO>(data['data']);
    }
    if (dataClassName == 'CompanyEmployeeDepartmentJT') {
      return deserialize<_i28.CompanyEmployeeDepartmentJT>(data['data']);
    }
    if (dataClassName == 'CompanyEmployeeField') {
      return deserialize<_i29.CompanyEmployeeField>(data['data']);
    }
    if (dataClassName == 'ContactDTO') {
      return deserialize<_i30.ContactDTO>(data['data']);
    }
    if (dataClassName == 'ContactField') {
      return deserialize<_i31.ContactField>(data['data']);
    }
    if (dataClassName == 'ContactType') {
      return deserialize<_i32.ContactType>(data['data']);
    }
    if (dataClassName == 'CountryCodeDTO') {
      return deserialize<_i33.CountryCodeDTO>(data['data']);
    }
    if (dataClassName == 'CountryCodeAddressFormat') {
      return deserialize<_i34.CountryCodeAddressFormat>(data['data']);
    }
    if (dataClassName == 'CountryCodeContactAddressFormat') {
      return deserialize<_i35.CountryCodeContactAddressFormat>(data['data']);
    }
    if (dataClassName == 'CountryCodeField') {
      return deserialize<_i36.CountryCodeField>(data['data']);
    }
    if (dataClassName == 'CrmEventDTO') {
      return deserialize<_i37.CrmEventDTO>(data['data']);
    }
    if (dataClassName == 'CrmEventContactJT') {
      return deserialize<_i38.CrmEventContactJT>(data['data']);
    }
    if (dataClassName == 'CrmEventField') {
      return deserialize<_i39.CrmEventField>(data['data']);
    }
    if (dataClassName == 'CrmEventStatus') {
      return deserialize<_i40.CrmEventStatus>(data['data']);
    }
    if (dataClassName == 'CustomerDTO') {
      return deserialize<_i41.CustomerDTO>(data['data']);
    }
    if (dataClassName == 'CustomerField') {
      return deserialize<_i42.CustomerField>(data['data']);
    }
    if (dataClassName == 'CustomerSalesOrderHintsDTO') {
      return deserialize<_i43.CustomerSalesOrderHintsDTO>(data['data']);
    }
    if (dataClassName == 'InvoiceDeliveryMethod') {
      return deserialize<_i44.InvoiceDeliveryMethod>(data['data']);
    }
    if (dataClassName == 'ShippingMethodDTO') {
      return deserialize<_i45.ShippingMethodDTO>(data['data']);
    }
    if (dataClassName == 'ShippingMethodField') {
      return deserialize<_i46.ShippingMethodField>(data['data']);
    }
    if (dataClassName == 'CustomerBillingCustomerDTO') {
      return deserialize<_i47.CustomerBillingCustomerDTO>(data['data']);
    }
    if (dataClassName == 'CustomerBillingCustomerField') {
      return deserialize<_i48.CustomerBillingCustomerField>(data['data']);
    }
    if (dataClassName == 'CustomerContactsDTO') {
      return deserialize<_i49.CustomerContactsDTO>(data['data']);
    }
    if (dataClassName == 'CustomerContactsType') {
      return deserialize<_i50.CustomerContactsType>(data['data']);
    }
    if (dataClassName == 'CustomerContactsField') {
      return deserialize<_i51.CustomerContactsField>(data['data']);
    }
    if (dataClassName == 'CustomerCustomerDTO') {
      return deserialize<_i52.CustomerCustomerDTO>(data['data']);
    }
    if (dataClassName == 'CustomerCustomerField') {
      return deserialize<_i53.CustomerCustomerField>(data['data']);
    }
    if (dataClassName == 'CustomerShippingContactDTO') {
      return deserialize<_i54.CustomerShippingContactDTO>(data['data']);
    }
    if (dataClassName == 'CustomerShippingContactField') {
      return deserialize<_i55.CustomerShippingContactField>(data['data']);
    }
    if (dataClassName == 'DepartmentCodeDTO') {
      return deserialize<_i56.DepartmentCodeDTO>(data['data']);
    }
    if (dataClassName == 'DepartmentCodeField') {
      return deserialize<_i57.DepartmentCodeField>(data['data']);
    }
    if (dataClassName == 'LanguageCodeDTO') {
      return deserialize<_i58.LanguageCodeDTO>(data['data']);
    }
    if (dataClassName == 'LanguageCodeField') {
      return deserialize<_i59.LanguageCodeField>(data['data']);
    }
    if (dataClassName == 'PaymentCodeDTO') {
      return deserialize<_i60.PaymentCodeDTO>(data['data']);
    }
    if (dataClassName == 'PaymentCodeField') {
      return deserialize<_i61.PaymentCodeField>(data['data']);
    }
    if (dataClassName == 'SalutationCodeDTO') {
      return deserialize<_i62.SalutationCodeDTO>(data['data']);
    }
    if (dataClassName == 'SalutationCodeField') {
      return deserialize<_i63.SalutationCodeField>(data['data']);
    }
    if (dataClassName == 'ElbExceptionMessage') {
      return deserialize<_i64.ElbExceptionMessage>(data['data']);
    }
    if (dataClassName == 'SalutationType') {
      return deserialize<_i65.SalutationType>(data['data']);
    }
    if (dataClassName == 'ArtworkDTO') {
      return deserialize<_i66.ArtworkDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkAdditionalDataField') {
      return deserialize<_i67.ArtworkAdditionalDataField>(data['data']);
    }
    if (dataClassName == 'ArtworkArtworkMaster') {
      return deserialize<_i68.ArtworkArtworkMaster>(data['data']);
    }
    if (dataClassName == 'ArtworkDieCutterType') {
      return deserialize<_i69.ArtworkDieCutterType>(data['data']);
    }
    if (dataClassName == 'ArtworkField') {
      return deserialize<_i70.ArtworkField>(data['data']);
    }
    if (dataClassName == 'ArtworkLogDTO') {
      return deserialize<_i71.ArtworkLogDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkLogField') {
      return deserialize<_i72.ArtworkLogField>(data['data']);
    }
    if (dataClassName == 'ArtworkMasterDTO') {
      return deserialize<_i73.ArtworkMasterDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkPrintProcessType') {
      return deserialize<_i74.ArtworkPrintProcessType>(data['data']);
    }
    if (dataClassName == 'ArtworkSalesOrderUpdate') {
      return deserialize<_i75.ArtworkSalesOrderUpdate>(data['data']);
    }
    if (dataClassName == 'ArtworkType') {
      return deserialize<_i76.ArtworkType>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineDTO') {
      return deserialize<_i77.ArtworkQuarantineDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineField') {
      return deserialize<_i78.ArtworkQuarantineField>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineAnalysisDataDTO') {
      return deserialize<_i79.ArtworkQuarantineAnalysisDataDTO>(data['data']);
    }
    if (dataClassName == 'ColorSpecificationDTO') {
      return deserialize<_i80.ColorSpecificationDTO>(data['data']);
    }
    if (dataClassName == 'FontInfoDTO') {
      return deserialize<_i81.FontInfoDTO>(data['data']);
    }
    if (dataClassName == 'LayerInfoDTO') {
      return deserialize<_i82.LayerInfoDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupDTO') {
      return deserialize<_i83.ArtworkQuarantineGroupDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupField') {
      return deserialize<_i84.ArtworkQuarantineGroupField>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupStatus') {
      return deserialize<_i85.ArtworkQuarantineGroupStatus>(data['data']);
    }
    if (dataClassName == 'ArtworkQuarantineGroupType') {
      return deserialize<_i86.ArtworkQuarantineGroupType>(data['data']);
    }
    if (dataClassName == 'SystemFileDTO') {
      return deserialize<_i87.SystemFileDTO>(data['data']);
    }
    if (dataClassName == 'SystemFileAttachmentType') {
      return deserialize<_i88.SystemFileAttachmentType>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateDTO') {
      return deserialize<_i89.ArtworkTemplateDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateField') {
      return deserialize<_i90.ArtworkTemplateField>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplatePreSelectionDTO') {
      return deserialize<_i91.ArtworkTemplatePreSelectionDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplatePreSelectionField') {
      return deserialize<_i92.ArtworkTemplatePreSelectionField>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateSelectionDTO') {
      return deserialize<_i93.ArtworkTemplateSelectionDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkTemplateSelectionField') {
      return deserialize<_i94.ArtworkTemplateSelectionField>(data['data']);
    }
    if (dataClassName == 'BearerDTO') {
      return deserialize<_i95.BearerDTO>(data['data']);
    }
    if (dataClassName == 'BearerField') {
      return deserialize<_i96.BearerField>(data['data']);
    }
    if (dataClassName == 'BearerType') {
      return deserialize<_i97.BearerType>(data['data']);
    }
    if (dataClassName == 'BearerTypeFlexoPrintMultilayerDTO') {
      return deserialize<_i98.BearerTypeFlexoPrintMultilayerDTO>(data['data']);
    }
    if (dataClassName == 'BearerTypeOffsetPressFixedPlateDTO') {
      return deserialize<_i99.BearerTypeOffsetPressFixedPlateDTO>(data['data']);
    }
    if (dataClassName == 'BearerTypeSheetFedPressFixedPlateDTO') {
      return deserialize<_i100.BearerTypeSheetFedPressFixedPlateDTO>(
          data['data']);
    }
    if (dataClassName == 'BearerTypeSheetFedPressMinPlateDTO') {
      return deserialize<_i101.BearerTypeSheetFedPressMinPlateDTO>(
          data['data']);
    }
    if (dataClassName == 'BearerTypeSheetFedPressPlateEqualsSubDTO') {
      return deserialize<_i102.BearerTypeSheetFedPressPlateEqualsSubDTO>(
          data['data']);
    }
    if (dataClassName == 'BearerTypeStandardFlexoPrintDTO') {
      return deserialize<_i103.BearerTypeStandardFlexoPrintDTO>(data['data']);
    }
    if (dataClassName == 'BearerType1DTO') {
      return deserialize<_i104.BearerType1DTO>(data['data']);
    }
    if (dataClassName == 'BearerType2DTO') {
      return deserialize<_i105.BearerType2DTO>(data['data']);
    }
    if (dataClassName == 'ArtworkCodeDTO') {
      return deserialize<_i106.ArtworkCodeDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkCodeField') {
      return deserialize<_i107.ArtworkCodeField>(data['data']);
    }
    if (dataClassName == 'ArtworkCodeType') {
      return deserialize<_i108.ArtworkCodeType>(data['data']);
    }
    if (dataClassName == 'AztecCodeDTO') {
      return deserialize<_i109.AztecCodeDTO>(data['data']);
    }
    if (dataClassName == 'TemplateCodeDTO') {
      return deserialize<_i110.TemplateCodeDTO>(data['data']);
    }
    if (dataClassName == 'TwoOf5CodeDTO') {
      return deserialize<_i111.TwoOf5CodeDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkColorDTO') {
      return deserialize<_i112.ArtworkColorDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkColorField') {
      return deserialize<_i113.ArtworkColorField>(data['data']);
    }
    if (dataClassName == 'ArtworkColorPrintProcessType') {
      return deserialize<_i114.ArtworkColorPrintProcessType>(data['data']);
    }
    if (dataClassName == 'ArtworkColorSpecType') {
      return deserialize<_i115.ArtworkColorSpecType>(data['data']);
    }
    if (dataClassName == 'ArtworkColorType') {
      return deserialize<_i116.ArtworkColorType>(data['data']);
    }
    if (dataClassName == 'ArtworkVerarbeitungsebeneType') {
      return deserialize<_i117.ArtworkVerarbeitungsebeneType>(data['data']);
    }
    if (dataClassName == 'PrepressColorPaletteDTO') {
      return deserialize<_i118.PrepressColorPaletteDTO>(data['data']);
    }
    if (dataClassName == 'PrepressColorPaletteField') {
      return deserialize<_i119.PrepressColorPaletteField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutDTO') {
      return deserialize<_i120.DrucklayoutDTO>(data['data']);
    }
    if (dataClassName == 'DrucklayoutField') {
      return deserialize<_i121.DrucklayoutField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutMultiNutzenlayoutJT') {
      return deserialize<_i122.DrucklayoutMultiNutzenlayoutJT>(data['data']);
    }
    if (dataClassName == 'DrucklayoutPreSelectionDTO') {
      return deserialize<_i123.DrucklayoutPreSelectionDTO>(data['data']);
    }
    if (dataClassName == 'DrucklayoutPreSelectionField') {
      return deserialize<_i124.DrucklayoutPreSelectionField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSalesOrderJT') {
      return deserialize<_i125.DrucklayoutSalesOrderJT>(data['data']);
    }
    if (dataClassName == 'BearerCustomerRelation') {
      return deserialize<_i126.BearerCustomerRelation>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSelectionField') {
      return deserialize<_i127.DrucklayoutSelectionField>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSingleNutzenlayoutJT') {
      return deserialize<_i128.DrucklayoutSingleNutzenlayoutJT>(data['data']);
    }
    if (dataClassName == 'ArtworkLayerDTO') {
      return deserialize<_i129.ArtworkLayerDTO>(data['data']);
    }
    if (dataClassName == 'ArtworkLayerField') {
      return deserialize<_i130.ArtworkLayerField>(data['data']);
    }
    if (dataClassName == 'ArtworkLayerType') {
      return deserialize<_i131.ArtworkLayerType>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutArtworkDimensions') {
      return deserialize<_i132.NutzenlayoutArtworkDimensions>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutCellDTO') {
      return deserialize<_i133.NutzenlayoutCellDTO>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutColumnDTO') {
      return deserialize<_i134.NutzenlayoutColumnDTO>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutFormType') {
      return deserialize<_i135.NutzenlayoutFormType>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutLaufrichtung') {
      return deserialize<_i136.NutzenlayoutLaufrichtung>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutType') {
      return deserialize<_i137.NutzenlayoutType>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutUnitSystem') {
      return deserialize<_i138.NutzenlayoutUnitSystem>(data['data']);
    }
    if (dataClassName == 'NutzenlayoutDTO') {
      return deserialize<_i139.NutzenlayoutDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderMultiNutzenlayoutArtworkJT') {
      return deserialize<_i140.SalesOrderMultiNutzenlayoutArtworkJT>(
          data['data']);
    }
    if (dataClassName == 'SalesOrderMultiNutzenlayoutDTO') {
      return deserialize<_i141.SalesOrderMultiNutzenlayoutDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderMultiNutzenlayoutLightDTO') {
      return deserialize<_i142.SalesOrderMultiNutzenlayoutLightDTO>(
          data['data']);
    }
    if (dataClassName == 'SalesOrderSingleNutzenlayoutArtworkJT') {
      return deserialize<_i143.SalesOrderSingleNutzenlayoutArtworkJT>(
          data['data']);
    }
    if (dataClassName == 'SalesOrderSingleNutzenlayoutDTO') {
      return deserialize<_i144.SalesOrderSingleNutzenlayoutDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderSingleNutzenlayoutLightDTO') {
      return deserialize<_i145.SalesOrderSingleNutzenlayoutLightDTO>(
          data['data']);
    }
    if (dataClassName == 'ProductDTO') {
      return deserialize<_i146.ProductDTO>(data['data']);
    }
    if (dataClassName == 'ProductField') {
      return deserialize<_i147.ProductField>(data['data']);
    }
    if (dataClassName == 'ProductLogDTO') {
      return deserialize<_i148.ProductLogDTO>(data['data']);
    }
    if (dataClassName == 'ProductLogField') {
      return deserialize<_i149.ProductLogField>(data['data']);
    }
    if (dataClassName == 'ProductMasterDTO') {
      return deserialize<_i150.ProductMasterDTO>(data['data']);
    }
    if (dataClassName == 'ProductType') {
      return deserialize<_i151.ProductType>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemDTO') {
      return deserialize<_i152.SalesOrderItemDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemField') {
      return deserialize<_i153.SalesOrderItemField>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemStatus') {
      return deserialize<_i154.SalesOrderItemStatus>(data['data']);
    }
    if (dataClassName == 'SalesOrderItemType') {
      return deserialize<_i155.SalesOrderItemType>(data['data']);
    }
    if (dataClassName == 'SoiConsultingDTO') {
      return deserialize<_i156.SoiConsultingDTO>(data['data']);
    }
    if (dataClassName == 'SoiConsultingField') {
      return deserialize<_i157.SoiConsultingField>(data['data']);
    }
    if (dataClassName == 'SoiEinzelformaufbauDTO') {
      return deserialize<_i158.SoiEinzelformaufbauDTO>(data['data']);
    }
    if (dataClassName == 'SoiEinzelformaufbauField') {
      return deserialize<_i159.SoiEinzelformaufbauField>(data['data']);
    }
    if (dataClassName == 'EyeCStatus') {
      return deserialize<_i160.EyeCStatus>(data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkDTO') {
      return deserialize<_i161.SoiPrepareArtworkDTO>(data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkAdditionalDataField') {
      return deserialize<_i162.SoiPrepareArtworkAdditionalDataField>(
          data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkDifficultyLevel') {
      return deserialize<_i163.SoiPrepareArtworkDifficultyLevel>(data['data']);
    }
    if (dataClassName == 'SoiPrepareArtworkField') {
      return deserialize<_i164.SoiPrepareArtworkField>(data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalDTO') {
      return deserialize<_i165.SoiRequestArtworkApprovalDTO>(data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalAdditionalDataField') {
      return deserialize<_i166.SoiRequestArtworkApprovalAdditionalDataField>(
          data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalField') {
      return deserialize<_i167.SoiRequestArtworkApprovalField>(data['data']);
    }
    if (dataClassName == 'SoiRequestArtworkApprovalType') {
      return deserialize<_i168.SoiRequestArtworkApprovalType>(data['data']);
    }
    if (dataClassName == 'SoiStepAndRepeatDTO') {
      return deserialize<_i169.SoiStepAndRepeatDTO>(data['data']);
    }
    if (dataClassName == 'SoiStepAndRepeatField') {
      return deserialize<_i170.SoiStepAndRepeatField>(data['data']);
    }
    if (dataClassName == 'SoiStepAndRepeatStatus') {
      return deserialize<_i171.SoiStepAndRepeatStatus>(data['data']);
    }
    if (dataClassName == 'TrappingDTO') {
      return deserialize<_i172.TrappingDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderDTO') {
      return deserialize<_i173.SalesOrderDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderAdditionalDataField') {
      return deserialize<_i174.SalesOrderAdditionalDataField>(data['data']);
    }
    if (dataClassName == 'SalesOrderField') {
      return deserialize<_i175.SalesOrderField>(data['data']);
    }
    if (dataClassName == 'SalesOrderStatus') {
      return deserialize<_i176.SalesOrderStatus>(data['data']);
    }
    if (dataClassName == 'SalesOrderStatusDTO') {
      return deserialize<_i177.SalesOrderStatusDTO>(data['data']);
    }
    if (dataClassName == 'SalesOrderStatusField') {
      return deserialize<_i178.SalesOrderStatusField>(data['data']);
    }
    if (dataClassName == 'DashboardTileConfigDTO') {
      return deserialize<_i179.DashboardTileConfigDTO>(data['data']);
    }
    if (dataClassName == 'DashboardTileType') {
      return deserialize<_i180.DashboardTileType>(data['data']);
    }
    if (dataClassName == 'FTPIncomingReplyType') {
      return deserialize<_i181.FTPIncomingReplyType>(data['data']);
    }
    if (dataClassName == 'FTPInterfaceDTO') {
      return deserialize<_i182.FTPInterfaceDTO>(data['data']);
    }
    if (dataClassName == 'FTPType') {
      return deserialize<_i183.FTPType>(data['data']);
    }
    if (dataClassName == 'JsonDTO') {
      return deserialize<_i184.JsonDTO>(data['data']);
    }
    if (dataClassName == 'JsonFieldType') {
      return deserialize<_i185.JsonFieldType>(data['data']);
    }
    if (dataClassName == 'JsonTemplateDTO') {
      return deserialize<_i186.JsonTemplateDTO>(data['data']);
    }
    if (dataClassName == 'JsonTemplateField') {
      return deserialize<_i187.JsonTemplateField>(data['data']);
    }
    if (dataClassName == 'JsonTemplateType') {
      return deserialize<_i188.JsonTemplateType>(data['data']);
    }
    if (dataClassName == 'DrucklayoutSelectionDTO') {
      return deserialize<_i189.DrucklayoutSelectionDTO>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i242.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('elbdesk_backend_core.')) {
      data['className'] = dataClassName.substring(21);
      return _i191.Protocol().deserializeByClassName(data);
    }
    if (dataClassName == '(int?,CompanyEmployeeDTO?)') {
      return deserialize<(int?, _i201.CompanyEmployeeDTO?)>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

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
  if (record is (int?, _i201.CompanyEmployeeDTO?)) {
    return {
      "p": [
        record.$1,
        record.$2,
      ],
    };
  }
  if (record is ({
    List<_i224.SalesOrderMultiNutzenlayoutDTO> multiNutzenlayouts,
    List<_i225.SalesOrderSingleNutzenlayoutDTO> singleNutzenlayouts
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
