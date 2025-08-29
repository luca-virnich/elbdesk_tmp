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
import 'core/table_config/models/table_config.dart' as _i2;
import 'core/table_config/models/table_field_config.dart' as _i3;
import 'core/table_filter/models/filter.dart' as _i4;
import 'core/table_filter/models/filter_field.dart' as _i5;
import 'core/table_filter/models/filter_field_type.dart' as _i6;
import 'core/table_filter/models/filter_group.dart' as _i7;
import 'core/table_filter/models/filter_operator.dart' as _i8;
import 'core/table_filter/models/filter_type.dart' as _i9;
import 'core/table_filter/models/sort.dart' as _i10;
import 'exceptions/elb_exception/elb_exception.dart' as _i11;
import 'exceptions/elb_exception/elb_exception_type.dart' as _i12;
import 'modules/app_version/app_version_manifest.dart' as _i13;
import 'modules/collapsible_card_section/models/collapsible_card_section.dart'
    as _i14;
import 'modules/deeplinks/models/deeplink.dart' as _i15;
import 'modules/edit_requests/models/edit_request.dart' as _i16;
import 'modules/edit_requests/models/reject_edit_request_dto.dart' as _i17;
import 'modules/entity_assignments/entity_assignments.dart' as _i18;
import 'modules/entity_lock/models/entity_lock.dart' as _i19;
import 'modules/entity_lock/models/entity_lock_field.dart' as _i20;
import 'modules/entity_notes/entity_note.dart' as _i21;
import 'modules/entity_notes/entity_note_notification.dart' as _i22;
import 'modules/entity_notes/mention.dart' as _i23;
import 'modules/flutter_log/models/flutter_log.dart' as _i24;
import 'modules/flutter_log/models/flutter_log_field.dart' as _i25;
import 'modules/light_user/models/light_user.dart' as _i26;
import 'modules/light_user/models/light_user_field.dart' as _i27;
import 'modules/recent_windows/recent_window.dart' as _i28;
import 'modules/serverpod_log/models/serverpod_log.dart' as _i29;
import 'modules/serverpod_log/models/serverpod_log_field.dart' as _i30;
import 'modules/user_settings/app_locale.dart' as _i31;
import 'modules/user_settings/app_theme.dart' as _i32;
import 'modules/user_settings/user_ribbon_config.dart' as _i33;
import 'modules/user_settings/user_settings.dart' as _i34;
import 'package:elbdesk_backend_core_client/src/protocol/core/table_config/models/table_config.dart'
    as _i35;
import 'package:elbdesk_backend_core_client/src/protocol/modules/entity_notes/entity_note.dart'
    as _i36;
import 'package:elbdesk_backend_core_client/src/protocol/modules/entity_notes/entity_note_notification.dart'
    as _i37;
import 'package:elbdesk_backend_core_client/src/protocol/modules/flutter_log/models/flutter_log.dart'
    as _i38;
import 'package:elbdesk_backend_core_client/src/protocol/modules/light_user/models/light_user.dart'
    as _i39;
import 'package:elbdesk_backend_core_client/src/protocol/modules/recent_windows/recent_window.dart'
    as _i40;
import 'package:elbdesk_backend_core_client/src/protocol/modules/serverpod_log/models/serverpod_log.dart'
    as _i41;
import 'package:elbdesk_backend_core_client/src/protocol/modules/user_settings/user_ribbon_config.dart'
    as _i42;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i43;
export 'core/table_config/models/table_config.dart';
export 'core/table_config/models/table_field_config.dart';
export 'core/table_filter/models/filter.dart';
export 'core/table_filter/models/filter_field.dart';
export 'core/table_filter/models/filter_field_type.dart';
export 'core/table_filter/models/filter_group.dart';
export 'core/table_filter/models/filter_operator.dart';
export 'core/table_filter/models/filter_type.dart';
export 'core/table_filter/models/sort.dart';
export 'exceptions/elb_exception/elb_exception.dart';
export 'exceptions/elb_exception/elb_exception_type.dart';
export 'modules/app_version/app_version_manifest.dart';
export 'modules/collapsible_card_section/models/collapsible_card_section.dart';
export 'modules/deeplinks/models/deeplink.dart';
export 'modules/edit_requests/models/edit_request.dart';
export 'modules/edit_requests/models/reject_edit_request_dto.dart';
export 'modules/entity_assignments/entity_assignments.dart';
export 'modules/entity_lock/models/entity_lock.dart';
export 'modules/entity_lock/models/entity_lock_field.dart';
export 'modules/entity_notes/entity_note.dart';
export 'modules/entity_notes/entity_note_notification.dart';
export 'modules/entity_notes/mention.dart';
export 'modules/flutter_log/models/flutter_log.dart';
export 'modules/flutter_log/models/flutter_log_field.dart';
export 'modules/light_user/models/light_user.dart';
export 'modules/light_user/models/light_user_field.dart';
export 'modules/recent_windows/recent_window.dart';
export 'modules/serverpod_log/models/serverpod_log.dart';
export 'modules/serverpod_log/models/serverpod_log_field.dart';
export 'modules/user_settings/app_locale.dart';
export 'modules/user_settings/app_theme.dart';
export 'modules/user_settings/user_ribbon_config.dart';
export 'modules/user_settings/user_settings.dart';
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
    if (t == _i2.TableConfig) {
      return _i2.TableConfig.fromJson(data) as T;
    }
    if (t == _i3.TableFieldConfig) {
      return _i3.TableFieldConfig.fromJson(data) as T;
    }
    if (t == _i4.Filter) {
      return _i4.Filter.fromJson(data) as T;
    }
    if (t == _i5.FilterField) {
      return _i5.FilterField.fromJson(data) as T;
    }
    if (t == _i6.FilterFieldType) {
      return _i6.FilterFieldType.fromJson(data) as T;
    }
    if (t == _i7.FilterGroup) {
      return _i7.FilterGroup.fromJson(data) as T;
    }
    if (t == _i8.FilterOperator) {
      return _i8.FilterOperator.fromJson(data) as T;
    }
    if (t == _i9.FilterType) {
      return _i9.FilterType.fromJson(data) as T;
    }
    if (t == _i10.Sort) {
      return _i10.Sort.fromJson(data) as T;
    }
    if (t == _i11.ElbException) {
      return _i11.ElbException.fromJson(data) as T;
    }
    if (t == _i12.ElbExceptionType) {
      return _i12.ElbExceptionType.fromJson(data) as T;
    }
    if (t == _i13.AppVersionManifest) {
      return _i13.AppVersionManifest.fromJson(data) as T;
    }
    if (t == _i14.CollapsibleCardSectionConfig) {
      return _i14.CollapsibleCardSectionConfig.fromJson(data) as T;
    }
    if (t == _i15.Deeplink) {
      return _i15.Deeplink.fromJson(data) as T;
    }
    if (t == _i16.EditRequestDTO) {
      return _i16.EditRequestDTO.fromJson(data) as T;
    }
    if (t == _i17.RejectEditRequestDTO) {
      return _i17.RejectEditRequestDTO.fromJson(data) as T;
    }
    if (t == _i18.EntityAssignmentDTO) {
      return _i18.EntityAssignmentDTO.fromJson(data) as T;
    }
    if (t == _i19.EntityLockDTO) {
      return _i19.EntityLockDTO.fromJson(data) as T;
    }
    if (t == _i20.EntityLockField) {
      return _i20.EntityLockField.fromJson(data) as T;
    }
    if (t == _i21.EntityNoteDTO) {
      return _i21.EntityNoteDTO.fromJson(data) as T;
    }
    if (t == _i22.EntityNoteNotificationDTO) {
      return _i22.EntityNoteNotificationDTO.fromJson(data) as T;
    }
    if (t == _i23.MentionDTO) {
      return _i23.MentionDTO.fromJson(data) as T;
    }
    if (t == _i24.FlutterLogDTO) {
      return _i24.FlutterLogDTO.fromJson(data) as T;
    }
    if (t == _i25.FlutterLogField) {
      return _i25.FlutterLogField.fromJson(data) as T;
    }
    if (t == _i26.LightUserDTO) {
      return _i26.LightUserDTO.fromJson(data) as T;
    }
    if (t == _i27.LightUserField) {
      return _i27.LightUserField.fromJson(data) as T;
    }
    if (t == _i28.RecentWindowDTO) {
      return _i28.RecentWindowDTO.fromJson(data) as T;
    }
    if (t == _i29.ServerpodLogDTO) {
      return _i29.ServerpodLogDTO.fromJson(data) as T;
    }
    if (t == _i30.ServerpodLogField) {
      return _i30.ServerpodLogField.fromJson(data) as T;
    }
    if (t == _i31.AppLocale) {
      return _i31.AppLocale.fromJson(data) as T;
    }
    if (t == _i32.AppTheme) {
      return _i32.AppTheme.fromJson(data) as T;
    }
    if (t == _i33.UserRibbonConfigDTO) {
      return _i33.UserRibbonConfigDTO.fromJson(data) as T;
    }
    if (t == _i34.UserSettingsDTO) {
      return _i34.UserSettingsDTO.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.TableConfig?>()) {
      return (data != null ? _i2.TableConfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.TableFieldConfig?>()) {
      return (data != null ? _i3.TableFieldConfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Filter?>()) {
      return (data != null ? _i4.Filter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.FilterField?>()) {
      return (data != null ? _i5.FilterField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.FilterFieldType?>()) {
      return (data != null ? _i6.FilterFieldType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.FilterGroup?>()) {
      return (data != null ? _i7.FilterGroup.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.FilterOperator?>()) {
      return (data != null ? _i8.FilterOperator.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.FilterType?>()) {
      return (data != null ? _i9.FilterType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.Sort?>()) {
      return (data != null ? _i10.Sort.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ElbException?>()) {
      return (data != null ? _i11.ElbException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ElbExceptionType?>()) {
      return (data != null ? _i12.ElbExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.AppVersionManifest?>()) {
      return (data != null ? _i13.AppVersionManifest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i14.CollapsibleCardSectionConfig?>()) {
      return (data != null
          ? _i14.CollapsibleCardSectionConfig.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i15.Deeplink?>()) {
      return (data != null ? _i15.Deeplink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.EditRequestDTO?>()) {
      return (data != null ? _i16.EditRequestDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.RejectEditRequestDTO?>()) {
      return (data != null ? _i17.RejectEditRequestDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i18.EntityAssignmentDTO?>()) {
      return (data != null ? _i18.EntityAssignmentDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i19.EntityLockDTO?>()) {
      return (data != null ? _i19.EntityLockDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.EntityLockField?>()) {
      return (data != null ? _i20.EntityLockField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.EntityNoteDTO?>()) {
      return (data != null ? _i21.EntityNoteDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.EntityNoteNotificationDTO?>()) {
      return (data != null
          ? _i22.EntityNoteNotificationDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i23.MentionDTO?>()) {
      return (data != null ? _i23.MentionDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.FlutterLogDTO?>()) {
      return (data != null ? _i24.FlutterLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i25.FlutterLogField?>()) {
      return (data != null ? _i25.FlutterLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.LightUserDTO?>()) {
      return (data != null ? _i26.LightUserDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.LightUserField?>()) {
      return (data != null ? _i27.LightUserField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.RecentWindowDTO?>()) {
      return (data != null ? _i28.RecentWindowDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.ServerpodLogDTO?>()) {
      return (data != null ? _i29.ServerpodLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.ServerpodLogField?>()) {
      return (data != null ? _i30.ServerpodLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.AppLocale?>()) {
      return (data != null ? _i31.AppLocale.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.AppTheme?>()) {
      return (data != null ? _i32.AppTheme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.UserRibbonConfigDTO?>()) {
      return (data != null ? _i33.UserRibbonConfigDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i34.UserSettingsDTO?>()) {
      return (data != null ? _i34.UserSettingsDTO.fromJson(data) : null) as T;
    }
    if (t == List<_i3.TableFieldConfig>) {
      return (data as List)
          .map((e) => deserialize<_i3.TableFieldConfig>(e))
          .toList() as T;
    }
    if (t == List<_i7.FilterGroup>) {
      return (data as List).map((e) => deserialize<_i7.FilterGroup>(e)).toList()
          as T;
    }
    if (t == List<_i5.FilterField>) {
      return (data as List).map((e) => deserialize<_i5.FilterField>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == Map<String, bool>) {
      return (data as Map).map(
              (k, v) => MapEntry(deserialize<String>(k), deserialize<bool>(v)))
          as T;
    }
    if (t == List<_i23.MentionDTO>) {
      return (data as List).map((e) => deserialize<_i23.MentionDTO>(e)).toList()
          as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == _i1.getType<Map<String, bool>?>()) {
      return (data != null
          ? (data as Map).map(
              (k, v) => MapEntry(deserialize<String>(k), deserialize<bool>(v)))
          : null) as T;
    }
    if (t == _i1.getType<Map<String, bool>?>()) {
      return (data != null
          ? (data as Map).map(
              (k, v) => MapEntry(deserialize<String>(k), deserialize<bool>(v)))
          : null) as T;
    }
    if (t == _i1.getType<Map<String, _i33.UserRibbonConfigDTO>?>()) {
      return (data != null
          ? (data as Map).map((k, v) => MapEntry(
              deserialize<String>(k), deserialize<_i33.UserRibbonConfigDTO>(v)))
          : null) as T;
    }
    if (t == _i1.getType<List<_i35.TableConfig>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i35.TableConfig>(e)).toList()
          : null) as T;
    }
    if (t == List<_i36.EntityNoteDTO>) {
      return (data as List)
          .map((e) => deserialize<_i36.EntityNoteDTO>(e))
          .toList() as T;
    }
    if (t == List<_i37.EntityNoteNotificationDTO>) {
      return (data as List)
          .map((e) => deserialize<_i37.EntityNoteNotificationDTO>(e))
          .toList() as T;
    }
    if (t == List<_i38.FlutterLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i38.FlutterLogDTO>(e))
          .toList() as T;
    }
    if (t == List<_i39.LightUserDTO>) {
      return (data as List)
          .map((e) => deserialize<_i39.LightUserDTO>(e))
          .toList() as T;
    }
    if (t == List<_i40.RecentWindowDTO>) {
      return (data as List)
          .map((e) => deserialize<_i40.RecentWindowDTO>(e))
          .toList() as T;
    }
    if (t == List<_i41.ServerpodLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i41.ServerpodLogDTO>(e))
          .toList() as T;
    }
    if (t == Map<String, _i42.UserRibbonConfigDTO>) {
      return (data as Map).map((k, v) => MapEntry(
              deserialize<String>(k), deserialize<_i42.UserRibbonConfigDTO>(v)))
          as T;
    }
    try {
      return _i43.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.TableConfig) {
      return 'TableConfig';
    }
    if (data is _i3.TableFieldConfig) {
      return 'TableFieldConfig';
    }
    if (data is _i4.Filter) {
      return 'Filter';
    }
    if (data is _i5.FilterField) {
      return 'FilterField';
    }
    if (data is _i6.FilterFieldType) {
      return 'FilterFieldType';
    }
    if (data is _i7.FilterGroup) {
      return 'FilterGroup';
    }
    if (data is _i8.FilterOperator) {
      return 'FilterOperator';
    }
    if (data is _i9.FilterType) {
      return 'FilterType';
    }
    if (data is _i10.Sort) {
      return 'Sort';
    }
    if (data is _i11.ElbException) {
      return 'ElbException';
    }
    if (data is _i12.ElbExceptionType) {
      return 'ElbExceptionType';
    }
    if (data is _i13.AppVersionManifest) {
      return 'AppVersionManifest';
    }
    if (data is _i14.CollapsibleCardSectionConfig) {
      return 'CollapsibleCardSectionConfig';
    }
    if (data is _i15.Deeplink) {
      return 'Deeplink';
    }
    if (data is _i16.EditRequestDTO) {
      return 'EditRequestDTO';
    }
    if (data is _i17.RejectEditRequestDTO) {
      return 'RejectEditRequestDTO';
    }
    if (data is _i18.EntityAssignmentDTO) {
      return 'EntityAssignmentDTO';
    }
    if (data is _i19.EntityLockDTO) {
      return 'EntityLockDTO';
    }
    if (data is _i20.EntityLockField) {
      return 'EntityLockField';
    }
    if (data is _i21.EntityNoteDTO) {
      return 'EntityNoteDTO';
    }
    if (data is _i22.EntityNoteNotificationDTO) {
      return 'EntityNoteNotificationDTO';
    }
    if (data is _i23.MentionDTO) {
      return 'MentionDTO';
    }
    if (data is _i24.FlutterLogDTO) {
      return 'FlutterLogDTO';
    }
    if (data is _i25.FlutterLogField) {
      return 'FlutterLogField';
    }
    if (data is _i26.LightUserDTO) {
      return 'LightUserDTO';
    }
    if (data is _i27.LightUserField) {
      return 'LightUserField';
    }
    if (data is _i28.RecentWindowDTO) {
      return 'RecentWindowDTO';
    }
    if (data is _i29.ServerpodLogDTO) {
      return 'ServerpodLogDTO';
    }
    if (data is _i30.ServerpodLogField) {
      return 'ServerpodLogField';
    }
    if (data is _i31.AppLocale) {
      return 'AppLocale';
    }
    if (data is _i32.AppTheme) {
      return 'AppTheme';
    }
    if (data is _i33.UserRibbonConfigDTO) {
      return 'UserRibbonConfigDTO';
    }
    if (data is _i34.UserSettingsDTO) {
      return 'UserSettingsDTO';
    }
    className = _i43.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'TableConfig') {
      return deserialize<_i2.TableConfig>(data['data']);
    }
    if (dataClassName == 'TableFieldConfig') {
      return deserialize<_i3.TableFieldConfig>(data['data']);
    }
    if (dataClassName == 'Filter') {
      return deserialize<_i4.Filter>(data['data']);
    }
    if (dataClassName == 'FilterField') {
      return deserialize<_i5.FilterField>(data['data']);
    }
    if (dataClassName == 'FilterFieldType') {
      return deserialize<_i6.FilterFieldType>(data['data']);
    }
    if (dataClassName == 'FilterGroup') {
      return deserialize<_i7.FilterGroup>(data['data']);
    }
    if (dataClassName == 'FilterOperator') {
      return deserialize<_i8.FilterOperator>(data['data']);
    }
    if (dataClassName == 'FilterType') {
      return deserialize<_i9.FilterType>(data['data']);
    }
    if (dataClassName == 'Sort') {
      return deserialize<_i10.Sort>(data['data']);
    }
    if (dataClassName == 'ElbException') {
      return deserialize<_i11.ElbException>(data['data']);
    }
    if (dataClassName == 'ElbExceptionType') {
      return deserialize<_i12.ElbExceptionType>(data['data']);
    }
    if (dataClassName == 'AppVersionManifest') {
      return deserialize<_i13.AppVersionManifest>(data['data']);
    }
    if (dataClassName == 'CollapsibleCardSectionConfig') {
      return deserialize<_i14.CollapsibleCardSectionConfig>(data['data']);
    }
    if (dataClassName == 'Deeplink') {
      return deserialize<_i15.Deeplink>(data['data']);
    }
    if (dataClassName == 'EditRequestDTO') {
      return deserialize<_i16.EditRequestDTO>(data['data']);
    }
    if (dataClassName == 'RejectEditRequestDTO') {
      return deserialize<_i17.RejectEditRequestDTO>(data['data']);
    }
    if (dataClassName == 'EntityAssignmentDTO') {
      return deserialize<_i18.EntityAssignmentDTO>(data['data']);
    }
    if (dataClassName == 'EntityLockDTO') {
      return deserialize<_i19.EntityLockDTO>(data['data']);
    }
    if (dataClassName == 'EntityLockField') {
      return deserialize<_i20.EntityLockField>(data['data']);
    }
    if (dataClassName == 'EntityNoteDTO') {
      return deserialize<_i21.EntityNoteDTO>(data['data']);
    }
    if (dataClassName == 'EntityNoteNotificationDTO') {
      return deserialize<_i22.EntityNoteNotificationDTO>(data['data']);
    }
    if (dataClassName == 'MentionDTO') {
      return deserialize<_i23.MentionDTO>(data['data']);
    }
    if (dataClassName == 'FlutterLogDTO') {
      return deserialize<_i24.FlutterLogDTO>(data['data']);
    }
    if (dataClassName == 'FlutterLogField') {
      return deserialize<_i25.FlutterLogField>(data['data']);
    }
    if (dataClassName == 'LightUserDTO') {
      return deserialize<_i26.LightUserDTO>(data['data']);
    }
    if (dataClassName == 'LightUserField') {
      return deserialize<_i27.LightUserField>(data['data']);
    }
    if (dataClassName == 'RecentWindowDTO') {
      return deserialize<_i28.RecentWindowDTO>(data['data']);
    }
    if (dataClassName == 'ServerpodLogDTO') {
      return deserialize<_i29.ServerpodLogDTO>(data['data']);
    }
    if (dataClassName == 'ServerpodLogField') {
      return deserialize<_i30.ServerpodLogField>(data['data']);
    }
    if (dataClassName == 'AppLocale') {
      return deserialize<_i31.AppLocale>(data['data']);
    }
    if (dataClassName == 'AppTheme') {
      return deserialize<_i32.AppTheme>(data['data']);
    }
    if (dataClassName == 'UserRibbonConfigDTO') {
      return deserialize<_i33.UserRibbonConfigDTO>(data['data']);
    }
    if (dataClassName == 'UserSettingsDTO') {
      return deserialize<_i34.UserSettingsDTO>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i43.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
