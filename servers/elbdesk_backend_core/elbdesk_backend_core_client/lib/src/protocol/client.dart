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
import 'package:elbdesk_backend_core_client/src/protocol/core/table_config/models/table_config.dart'
    as _i3;
import 'package:elbdesk_backend_core_client/src/protocol/modules/app_version/app_version_manifest.dart'
    as _i4;
import 'package:elbdesk_backend_core_client/src/protocol/modules/collapsible_card_section/models/collapsible_card_section.dart'
    as _i5;
import 'package:elbdesk_backend_core_client/src/protocol/modules/deeplinks/models/deeplink.dart'
    as _i6;
import 'package:elbdesk_backend_core_client/src/protocol/modules/edit_requests/models/edit_request.dart'
    as _i7;
import 'package:elbdesk_backend_core_client/src/protocol/modules/edit_requests/models/reject_edit_request_dto.dart'
    as _i8;
import 'package:elbdesk_backend_core_client/src/protocol/modules/entity_assignments/entity_assignments.dart'
    as _i9;
import 'package:elbdesk_backend_core_client/src/protocol/modules/entity_notes/entity_note.dart'
    as _i10;
import 'package:elbdesk_backend_core_client/src/protocol/modules/entity_notes/entity_note_notification.dart'
    as _i11;
import 'package:elbdesk_backend_core_client/src/protocol/modules/flutter_log/models/flutter_log.dart'
    as _i12;
import 'package:elbdesk_backend_core_client/src/protocol/modules/light_user/models/light_user.dart'
    as _i13;
import 'package:elbdesk_backend_core_client/src/protocol/modules/recent_windows/recent_window.dart'
    as _i14;
import 'package:elbdesk_backend_core_client/src/protocol/modules/serverpod_log/models/serverpod_log.dart'
    as _i15;
import 'package:elbdesk_backend_core_client/src/protocol/modules/user_settings/user_settings.dart'
    as _i16;
import 'package:elbdesk_backend_core_client/src/protocol/modules/user_settings/user_ribbon_config.dart'
    as _i17;

/// {@category Endpoint}
class EndpointTable extends _i1.EndpointRef {
  EndpointTable(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.table';

  _i2.Future<_i3.TableConfig> addTableConfig(_i3.TableConfig config) =>
      caller.callServerEndpoint<_i3.TableConfig>(
        'elbdesk_backend_core.table',
        'addTableConfig',
        {'config': config},
      );

  _i2.Future<_i3.TableConfig> deleteTableConfig(int id) =>
      caller.callServerEndpoint<_i3.TableConfig>(
        'elbdesk_backend_core.table',
        'deleteTableConfig',
        {'id': id},
      );

  _i2.Future<List<_i3.TableConfig>?> findTableConfigs(
          String componentIdentifier) =>
      caller.callServerEndpoint<List<_i3.TableConfig>?>(
        'elbdesk_backend_core.table',
        'findTableConfigs',
        {'componentIdentifier': componentIdentifier},
      );

  /// * Update
  _i2.Future<_i3.TableConfig> updateTableConfig(_i3.TableConfig config) =>
      caller.callServerEndpoint<_i3.TableConfig>(
        'elbdesk_backend_core.table',
        'updateTableConfig',
        {'config': config},
      );

  /// Update config to primary
  /// The old primary will be set to false
  _i2.Future<void> togglePrimaryConfig(_i3.TableConfig config) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.table',
        'togglePrimaryConfig',
        {'config': config},
      );
}

/// {@category Endpoint}
class EndpointAppVersion extends _i1.EndpointRef {
  EndpointAppVersion(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.appVersion';

  _i2.Stream<_i4.AppVersionManifest> watchAppVersionUpdates() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i4.AppVersionManifest>,
          _i4.AppVersionManifest>(
        'elbdesk_backend_core.appVersion',
        'watchAppVersionUpdates',
        {},
        {},
      );

  _i2.Future<_i4.AppVersionManifest> fetchLatestAppVersionManifest() =>
      caller.callServerEndpoint<_i4.AppVersionManifest>(
        'elbdesk_backend_core.appVersion',
        'fetchLatestAppVersionManifest',
        {},
      );

  _i2.Future<String> requestCredentials() => caller.callServerEndpoint<String>(
        'elbdesk_backend_core.appVersion',
        'requestCredentials',
        {},
      );
}

/// {@category Endpoint}
class EndpointCollapsibleCardSection extends _i1.EndpointRef {
  EndpointCollapsibleCardSection(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.collapsibleCardSection';

  _i2.Future<_i5.CollapsibleCardSectionConfig> fetchCollapsibleCardSection() =>
      caller.callServerEndpoint<_i5.CollapsibleCardSectionConfig>(
        'elbdesk_backend_core.collapsibleCardSection',
        'fetchCollapsibleCardSection',
        {},
      );

  /// SQL Injection unsafe! Update the collapse card section
  /// but more readable
  _i2.Future<void> updateCollapsibleIdentifierSqlUnsafe(
    String collapsibleIdentifier,
    bool isCollapsed,
  ) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.collapsibleCardSection',
        'updateCollapsibleIdentifierSqlUnsafe',
        {
          'collapsibleIdentifier': collapsibleIdentifier,
          'isCollapsed': isCollapsed,
        },
      );

  /// SQL Injection safe version of updateCollapsibleIdentifier
  _i2.Future<void> updateCollapsibleIdentifierSqlSafe(
    String collapsibleIdentifier,
    bool isCollapsed,
  ) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.collapsibleCardSection',
        'updateCollapsibleIdentifierSqlSafe',
        {
          'collapsibleIdentifier': collapsibleIdentifier,
          'isCollapsed': isCollapsed,
        },
      );
}

/// {@category Endpoint}
class EndpointDeeplinkCore extends _i1.EndpointRef {
  EndpointDeeplinkCore(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.deeplinkCore';

  _i2.Future<String> createDeeplink({
    required String floatingWindowType,
    required int primaryId,
  }) =>
      caller.callServerEndpoint<String>(
        'elbdesk_backend_core.deeplinkCore',
        'createDeeplink',
        {
          'floatingWindowType': floatingWindowType,
          'primaryId': primaryId,
        },
      );

  _i2.Future<_i6.Deeplink?> getDeeplink({required String path}) =>
      caller.callServerEndpoint<_i6.Deeplink?>(
        'elbdesk_backend_core.deeplinkCore',
        'getDeeplink',
        {'path': path},
      );
}

/// Edit Request Endpoint
///
/// Used to send edit requests to the client.
///
/// {@category Endpoint}
class EndpointEditRequestEndoint extends _i1.EndpointRef {
  EndpointEditRequestEndoint(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.editRequestEndoint';

  /// Stream edit requests
  _i2.Stream<_i7.EditRequestDTO> streamEditRequests({
    required int primaryKey,
    required String tableType,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i7.EditRequestDTO>,
          _i7.EditRequestDTO>(
        'elbdesk_backend_core.editRequestEndoint',
        'streamEditRequests',
        {
          'primaryKey': primaryKey,
          'tableType': tableType,
        },
        {},
      );

  _i2.Stream<_i8.RejectEditRequestDTO> watchRejectEditRequests({
    required int primaryKey,
    required String tableType,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i8.RejectEditRequestDTO>,
          _i8.RejectEditRequestDTO>(
        'elbdesk_backend_core.editRequestEndoint',
        'watchRejectEditRequests',
        {
          'primaryKey': primaryKey,
          'tableType': tableType,
        },
        {},
      );

  /// Send edit request
  ///
  /// The edit request will be displayed for the user that is currently
  /// blocking the entity. It will display the name of the sender and the
  /// request message.
  ///
  /// The user can then either approve or reject the request.
  _i2.Future<void> sendRequest(_i7.EditRequestDTO request) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.editRequestEndoint',
        'sendRequest',
        {'request': request},
      );

  _i2.Future<void> rejectRequest(_i8.RejectEditRequestDTO request) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.editRequestEndoint',
        'rejectRequest',
        {'request': request},
      );
}

/// {@category Endpoint}
class EndpointEntityAssignmentsCore extends _i1.EndpointRef {
  EndpointEntityAssignmentsCore(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.entityAssignmentsCore';

  _i2.Stream<_i9.EntityAssignmentDTO> watchAddedAssignments(
          {required int lightUserId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i9.EntityAssignmentDTO>,
          _i9.EntityAssignmentDTO>(
        'elbdesk_backend_core.entityAssignmentsCore',
        'watchAddedAssignments',
        {'lightUserId': lightUserId},
        {},
      );

  _i2.Stream<_i9.EntityAssignmentDTO> watchRemovedAssignments(
          {required int lightUserId}) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i9.EntityAssignmentDTO>,
          _i9.EntityAssignmentDTO>(
        'elbdesk_backend_core.entityAssignmentsCore',
        'watchRemovedAssignments',
        {'lightUserId': lightUserId},
        {},
      );
}

/// {@category Endpoint}
class EndpointEntityNoteCore extends _i1.EndpointRef {
  EndpointEntityNoteCore(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.entityNoteCore';

  _i2.Stream<_i10.EntityNoteDTO> watch({
    required String tableType,
    required int entityId,
  }) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i10.EntityNoteDTO>,
          _i10.EntityNoteDTO>(
        'elbdesk_backend_core.entityNoteCore',
        'watch',
        {
          'tableType': tableType,
          'entityId': entityId,
        },
        {},
      );

  _i2.Future<List<_i10.EntityNoteDTO>> fetchNotes({
    required String tableType,
    required int entityId,
  }) =>
      caller.callServerEndpoint<List<_i10.EntityNoteDTO>>(
        'elbdesk_backend_core.entityNoteCore',
        'fetchNotes',
        {
          'tableType': tableType,
          'entityId': entityId,
        },
      );

  _i2.Future<void> createNote(_i10.EntityNoteDTO note) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteCore',
        'createNote',
        {'note': note},
      );

  _i2.Future<void> updateNote(_i10.EntityNoteDTO note) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteCore',
        'updateNote',
        {'note': note},
      );

  _i2.Future<void> deleteNote(_i10.EntityNoteDTO note) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteCore',
        'deleteNote',
        {'note': note},
      );

  _i2.Future<void> restoreNote(_i10.EntityNoteDTO note) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteCore',
        'restoreNote',
        {'note': note},
      );
}

/// {@category Endpoint}
class EndpointEntityNoteNotification extends _i1.EndpointRef {
  EndpointEntityNoteNotification(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.entityNoteNotification';

  _i2.Stream<_i11.EntityNoteNotificationDTO> watch() =>
      caller.callStreamingServerEndpoint<
          _i2.Stream<_i11.EntityNoteNotificationDTO>,
          _i11.EntityNoteNotificationDTO>(
        'elbdesk_backend_core.entityNoteNotification',
        'watch',
        {},
        {},
      );

  _i2.Future<void> updateNotification(
          _i11.EntityNoteNotificationDTO notification) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteNotification',
        'updateNotification',
        {'notification': notification},
      );

  _i2.Future<void> createNotification(
          _i11.EntityNoteNotificationDTO notification) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteNotification',
        'createNotification',
        {'notification': notification},
      );

  _i2.Future<void> markAsRead(int notificationId) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteNotification',
        'markAsRead',
        {'notificationId': notificationId},
      );

  _i2.Future<void> markAsUnRead(int notificationId) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteNotification',
        'markAsUnRead',
        {'notificationId': notificationId},
      );

  _i2.Future<void> markAsCleared(int notificationId) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.entityNoteNotification',
        'markAsCleared',
        {'notificationId': notificationId},
      );

  _i2.Future<List<_i11.EntityNoteNotificationDTO>> fetchUnreadNotifications(
          {required int userId}) =>
      caller.callServerEndpoint<List<_i11.EntityNoteNotificationDTO>>(
        'elbdesk_backend_core.entityNoteNotification',
        'fetchUnreadNotifications',
        {'userId': userId},
      );
}

/// Endpoint for managing Flutter error logs
/// {@category Endpoint}
class EndpointFlutterLog extends _i1.EndpointRef {
  EndpointFlutterLog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.flutterLog';

  /// Creates a new Flutter log entry
  _i2.Future<_i12.FlutterLogDTO> create(_i12.FlutterLogDTO log) =>
      caller.callServerEndpoint<_i12.FlutterLogDTO>(
        'elbdesk_backend_core.flutterLog',
        'create',
        {'log': log},
      );

  /// Fetches Flutter error logs with pagination and filtering
  _i2.Future<List<_i12.FlutterLogDTO>> fetch({
    int? limit,
    int? offset,
    String? searchTerm,
  }) =>
      caller.callServerEndpoint<List<_i12.FlutterLogDTO>>(
        'elbdesk_backend_core.flutterLog',
        'fetch',
        {
          'limit': limit,
          'offset': offset,
          'searchTerm': searchTerm,
        },
      );

  /// Fetches a single log entry by its id
  _i2.Future<_i12.FlutterLogDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i12.FlutterLogDTO?>(
        'elbdesk_backend_core.flutterLog',
        'fetchById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointHeartbeat extends _i1.EndpointRef {
  EndpointHeartbeat(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.heartbeat';

  _i2.Stream<bool> watchHeartbeat() =>
      caller.callStreamingServerEndpoint<_i2.Stream<bool>, bool>(
        'elbdesk_backend_core.heartbeat',
        'watchHeartbeat',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointLightUser extends _i1.EndpointRef {
  EndpointLightUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.lightUser';

  _i2.Stream<_i13.LightUserDTO> watch() => caller.callStreamingServerEndpoint<
          _i2.Stream<_i13.LightUserDTO>, _i13.LightUserDTO>(
        'elbdesk_backend_core.lightUser',
        'watch',
        {},
        {},
      );

  /// Fetch an LightUser by its id
  _i2.Future<_i13.LightUserDTO?> fetchById({
    required int id,
    required bool includeUserInfo,
  }) =>
      caller.callServerEndpoint<_i13.LightUserDTO?>(
        'elbdesk_backend_core.lightUser',
        'fetchById',
        {
          'id': id,
          'includeUserInfo': includeUserInfo,
        },
      );

  /// Fetch an LightUser by its id
  _i2.Future<_i13.LightUserDTO?> fetchByUserInfoId({
    required int userInfoId,
    required bool includeUserInfo,
  }) =>
      caller.callServerEndpoint<_i13.LightUserDTO?>(
        'elbdesk_backend_core.lightUser',
        'fetchByUserInfoId',
        {
          'userInfoId': userInfoId,
          'includeUserInfo': includeUserInfo,
        },
      );

  /// Fetch all LightUsers
  _i2.Future<List<_i13.LightUserDTO>> fetchAll({
    required bool includeUserInfo,
    required bool showInactive,
  }) =>
      caller.callServerEndpoint<List<_i13.LightUserDTO>>(
        'elbdesk_backend_core.lightUser',
        'fetchAll',
        {
          'includeUserInfo': includeUserInfo,
          'showInactive': showInactive,
        },
      );
}

/// {@category Endpoint}
class EndpointRecentWindow extends _i1.EndpointRef {
  EndpointRecentWindow(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.recentWindow';

  _i2.Future<List<_i14.RecentWindowDTO>> fetchRecentWindows() =>
      caller.callServerEndpoint<List<_i14.RecentWindowDTO>>(
        'elbdesk_backend_core.recentWindow',
        'fetchRecentWindows',
        {},
      );

  _i2.Future<void> addRecentWindow({
    required bool isInserted,
    required _i14.RecentWindowDTO dto,
  }) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.recentWindow',
        'addRecentWindow',
        {
          'isInserted': isInserted,
          'dto': dto,
        },
      );
}

/// {@category Endpoint}
class EndpointServerpodLog extends _i1.EndpointRef {
  EndpointServerpodLog(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.serverpodLog';

  /// Fetches server logs with optional pagination and filtering
  _i2.Future<List<_i15.ServerpodLogDTO>> fetchLogs({
    int? limit,
    int? offset,
    String? searchTerm,
  }) =>
      caller.callServerEndpoint<List<_i15.ServerpodLogDTO>>(
        'elbdesk_backend_core.serverpodLog',
        'fetchLogs',
        {
          'limit': limit,
          'offset': offset,
          'searchTerm': searchTerm,
        },
      );

  /// Fetches a single log entry by its id
  _i2.Future<_i15.ServerpodLogDTO?> fetchById(int id) =>
      caller.callServerEndpoint<_i15.ServerpodLogDTO?>(
        'elbdesk_backend_core.serverpodLog',
        'fetchById',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointTime extends _i1.EndpointRef {
  EndpointTime(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.time';

  _i2.Stream<DateTime> watchServerTime() =>
      caller.callStreamingServerEndpoint<_i2.Stream<DateTime>, DateTime>(
        'elbdesk_backend_core.time',
        'watchServerTime',
        {},
        {},
      );
}

/// The UserSettingsEndpoint is used to fetch and update the user settings
///
/// See [UserSettingsDTO] for more details
///
/// {@category Endpoint}
class EndpointUserSettings extends _i1.EndpointRef {
  EndpointUserSettings(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'elbdesk_backend_core.userSettings';

  /// Find a UserSettings by its id
  _i2.Future<_i16.UserSettingsDTO> fetchUserSettings() =>
      caller.callServerEndpoint<_i16.UserSettingsDTO>(
        'elbdesk_backend_core.userSettings',
        'fetchUserSettings',
        {},
      );

  _i2.Future<_i16.UserSettingsDTO?> upsertUserSettings(
          _i16.UserSettingsDTO userSettingsDTO) =>
      caller.callServerEndpoint<_i16.UserSettingsDTO?>(
        'elbdesk_backend_core.userSettings',
        'upsertUserSettings',
        {'userSettingsDTO': userSettingsDTO},
      );

  /// SQL Injection unsafe! Update the collapse card section
  /// but more readable
  _i2.Future<void> updateCollapsibleIdentifierSqlUnsafe(
    String collapsibleIdentifier,
    bool isCollapsed,
  ) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.userSettings',
        'updateCollapsibleIdentifierSqlUnsafe',
        {
          'collapsibleIdentifier': collapsibleIdentifier,
          'isCollapsed': isCollapsed,
        },
      );

  /// SQL Injection safe version of updateCollapsibleIdentifier
  _i2.Future<void> updateCollapsibleIdentifierSqlSafe(
    String collapsibleIdentifier,
    bool isCollapsed,
  ) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.userSettings',
        'updateCollapsibleIdentifierSqlSafe',
        {
          'collapsibleIdentifier': collapsibleIdentifier,
          'isCollapsed': isCollapsed,
        },
      );

  _i2.Future<void> resetCollapsibleIdentifier() =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.userSettings',
        'resetCollapsibleIdentifier',
        {},
      );

  _i2.Future<void> updateRecentWindowFilterValues(
    String floatingWindowType,
    bool isVisible,
  ) =>
      caller.callServerEndpoint<void>(
        'elbdesk_backend_core.userSettings',
        'updateRecentWindowFilterValues',
        {
          'floatingWindowType': floatingWindowType,
          'isVisible': isVisible,
        },
      );

  _i2.Future<_i16.UserSettingsDTO?> saveRibbonConfigToServer(
          Map<String, _i17.UserRibbonConfigDTO> ribbonConfigs) =>
      caller.callServerEndpoint<_i16.UserSettingsDTO?>(
        'elbdesk_backend_core.userSettings',
        'saveRibbonConfigToServer',
        {'ribbonConfigs': ribbonConfigs},
      );
}

class Caller extends _i1.ModuleEndpointCaller {
  Caller(_i1.ServerpodClientShared client) : super(client) {
    table = EndpointTable(this);
    appVersion = EndpointAppVersion(this);
    collapsibleCardSection = EndpointCollapsibleCardSection(this);
    deeplinkCore = EndpointDeeplinkCore(this);
    editRequestEndoint = EndpointEditRequestEndoint(this);
    entityAssignmentsCore = EndpointEntityAssignmentsCore(this);
    entityNoteCore = EndpointEntityNoteCore(this);
    entityNoteNotification = EndpointEntityNoteNotification(this);
    flutterLog = EndpointFlutterLog(this);
    heartbeat = EndpointHeartbeat(this);
    lightUser = EndpointLightUser(this);
    recentWindow = EndpointRecentWindow(this);
    serverpodLog = EndpointServerpodLog(this);
    time = EndpointTime(this);
    userSettings = EndpointUserSettings(this);
  }

  late final EndpointTable table;

  late final EndpointAppVersion appVersion;

  late final EndpointCollapsibleCardSection collapsibleCardSection;

  late final EndpointDeeplinkCore deeplinkCore;

  late final EndpointEditRequestEndoint editRequestEndoint;

  late final EndpointEntityAssignmentsCore entityAssignmentsCore;

  late final EndpointEntityNoteCore entityNoteCore;

  late final EndpointEntityNoteNotification entityNoteNotification;

  late final EndpointFlutterLog flutterLog;

  late final EndpointHeartbeat heartbeat;

  late final EndpointLightUser lightUser;

  late final EndpointRecentWindow recentWindow;

  late final EndpointServerpodLog serverpodLog;

  late final EndpointTime time;

  late final EndpointUserSettings userSettings;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'elbdesk_backend_core.table': table,
        'elbdesk_backend_core.appVersion': appVersion,
        'elbdesk_backend_core.collapsibleCardSection': collapsibleCardSection,
        'elbdesk_backend_core.deeplinkCore': deeplinkCore,
        'elbdesk_backend_core.editRequestEndoint': editRequestEndoint,
        'elbdesk_backend_core.entityAssignmentsCore': entityAssignmentsCore,
        'elbdesk_backend_core.entityNoteCore': entityNoteCore,
        'elbdesk_backend_core.entityNoteNotification': entityNoteNotification,
        'elbdesk_backend_core.flutterLog': flutterLog,
        'elbdesk_backend_core.heartbeat': heartbeat,
        'elbdesk_backend_core.lightUser': lightUser,
        'elbdesk_backend_core.recentWindow': recentWindow,
        'elbdesk_backend_core.serverpodLog': serverpodLog,
        'elbdesk_backend_core.time': time,
        'elbdesk_backend_core.userSettings': userSettings,
      };
}
