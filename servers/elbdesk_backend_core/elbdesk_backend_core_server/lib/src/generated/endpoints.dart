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
import '../core/table_config/endpoints/table_config_endpoint.dart' as _i2;
import '../modules/app_version/app_version_endpoint.dart' as _i3;
import '../modules/collapsible_card_section/endpoints/collapsibpe_card_section_endpoint.dart'
    as _i4;
import '../modules/deeplinks/endpoints/deeplink_core_endpoint.dart' as _i5;
import '../modules/edit_requests/endpoints/edit_request_endpoint.dart' as _i6;
import '../modules/entity_assignments/entity_assignments_core_endpoint.dart'
    as _i7;
import '../modules/entity_notes/entity_note_core_endpoint.dart' as _i8;
import '../modules/entity_notes/entity_note_notification_endpoint.dart' as _i9;
import '../modules/flutter_log/endpoints/flutter_log_endpoint.dart' as _i10;
import '../modules/heartbeat/heartbeat_endpoint.dart' as _i11;
import '../modules/light_user/endpoints/light_user_endpoint.dart' as _i12;
import '../modules/recent_windows/recent_window_endpoint.dart' as _i13;
import '../modules/serverpod_log/endpoints/serverpod_log_endpoint.dart' as _i14;
import '../modules/time/time_endpoint.dart' as _i15;
import '../modules/user_settings/user_settings_endpoint.dart' as _i16;
import 'package:elbdesk_backend_core_server/src/generated/core/table_config/models/table_config.dart'
    as _i17;
import 'package:elbdesk_backend_core_server/src/generated/modules/edit_requests/models/edit_request.dart'
    as _i18;
import 'package:elbdesk_backend_core_server/src/generated/modules/edit_requests/models/reject_edit_request_dto.dart'
    as _i19;
import 'package:elbdesk_backend_core_server/src/generated/modules/entity_notes/entity_note.dart'
    as _i20;
import 'package:elbdesk_backend_core_server/src/generated/modules/entity_notes/entity_note_notification.dart'
    as _i21;
import 'package:elbdesk_backend_core_server/src/generated/modules/flutter_log/models/flutter_log.dart'
    as _i22;
import 'package:elbdesk_backend_core_server/src/generated/modules/recent_windows/recent_window.dart'
    as _i23;
import 'package:elbdesk_backend_core_server/src/generated/modules/user_settings/user_settings.dart'
    as _i24;
import 'package:elbdesk_backend_core_server/src/generated/modules/user_settings/user_ribbon_config.dart'
    as _i25;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i26;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'table': _i2.TableEndpoint()
        ..initialize(
          server,
          'table',
          'elbdesk_backend_core',
        ),
      'appVersion': _i3.AppVersionEndpoint()
        ..initialize(
          server,
          'appVersion',
          'elbdesk_backend_core',
        ),
      'collapsibleCardSection': _i4.CollapsibleCardSectionEndpoint()
        ..initialize(
          server,
          'collapsibleCardSection',
          'elbdesk_backend_core',
        ),
      'deeplinkCore': _i5.DeeplinkCoreEndpoint()
        ..initialize(
          server,
          'deeplinkCore',
          'elbdesk_backend_core',
        ),
      'editRequestEndoint': _i6.EditRequestEndoint()
        ..initialize(
          server,
          'editRequestEndoint',
          'elbdesk_backend_core',
        ),
      'entityAssignmentsCore': _i7.EntityAssignmentsCoreEndpoint()
        ..initialize(
          server,
          'entityAssignmentsCore',
          'elbdesk_backend_core',
        ),
      'entityNoteCore': _i8.EntityNoteCoreEndpoint()
        ..initialize(
          server,
          'entityNoteCore',
          'elbdesk_backend_core',
        ),
      'entityNoteNotification': _i9.EntityNoteNotificationEndpoint()
        ..initialize(
          server,
          'entityNoteNotification',
          'elbdesk_backend_core',
        ),
      'flutterLog': _i10.FlutterLogEndpoint()
        ..initialize(
          server,
          'flutterLog',
          'elbdesk_backend_core',
        ),
      'heartbeat': _i11.HeartbeatEndpoint()
        ..initialize(
          server,
          'heartbeat',
          'elbdesk_backend_core',
        ),
      'lightUser': _i12.LightUserEndpoint()
        ..initialize(
          server,
          'lightUser',
          'elbdesk_backend_core',
        ),
      'recentWindow': _i13.RecentWindowEndpoint()
        ..initialize(
          server,
          'recentWindow',
          'elbdesk_backend_core',
        ),
      'serverpodLog': _i14.ServerpodLogEndpoint()
        ..initialize(
          server,
          'serverpodLog',
          'elbdesk_backend_core',
        ),
      'time': _i15.TimeEndpoint()
        ..initialize(
          server,
          'time',
          'elbdesk_backend_core',
        ),
      'userSettings': _i16.UserSettingsEndpoint()
        ..initialize(
          server,
          'userSettings',
          'elbdesk_backend_core',
        ),
    };
    connectors['table'] = _i1.EndpointConnector(
      name: 'table',
      endpoint: endpoints['table']!,
      methodConnectors: {
        'addTableConfig': _i1.MethodConnector(
          name: 'addTableConfig',
          params: {
            'config': _i1.ParameterDescription(
              name: 'config',
              type: _i1.getType<_i17.TableConfig>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['table'] as _i2.TableEndpoint).addTableConfig(
            session,
            params['config'],
          ),
        ),
        'deleteTableConfig': _i1.MethodConnector(
          name: 'deleteTableConfig',
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
              (endpoints['table'] as _i2.TableEndpoint).deleteTableConfig(
            session,
            params['id'],
          ),
        ),
        'findTableConfigs': _i1.MethodConnector(
          name: 'findTableConfigs',
          params: {
            'componentIdentifier': _i1.ParameterDescription(
              name: 'componentIdentifier',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['table'] as _i2.TableEndpoint).findTableConfigs(
            session,
            params['componentIdentifier'],
          ),
        ),
        'updateTableConfig': _i1.MethodConnector(
          name: 'updateTableConfig',
          params: {
            'config': _i1.ParameterDescription(
              name: 'config',
              type: _i1.getType<_i17.TableConfig>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['table'] as _i2.TableEndpoint).updateTableConfig(
            session,
            params['config'],
          ),
        ),
        'togglePrimaryConfig': _i1.MethodConnector(
          name: 'togglePrimaryConfig',
          params: {
            'config': _i1.ParameterDescription(
              name: 'config',
              type: _i1.getType<_i17.TableConfig>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['table'] as _i2.TableEndpoint).togglePrimaryConfig(
            session,
            params['config'],
          ),
        ),
      },
    );
    connectors['appVersion'] = _i1.EndpointConnector(
      name: 'appVersion',
      endpoint: endpoints['appVersion']!,
      methodConnectors: {
        'fetchLatestAppVersionManifest': _i1.MethodConnector(
          name: 'fetchLatestAppVersionManifest',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appVersion'] as _i3.AppVersionEndpoint)
                  .fetchLatestAppVersionManifest(session),
        ),
        'requestCredentials': _i1.MethodConnector(
          name: 'requestCredentials',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['appVersion'] as _i3.AppVersionEndpoint)
                  .requestCredentials(session),
        ),
        'watchAppVersionUpdates': _i1.MethodStreamConnector(
          name: 'watchAppVersionUpdates',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['appVersion'] as _i3.AppVersionEndpoint)
                  .watchAppVersionUpdates(session),
        ),
      },
    );
    connectors['collapsibleCardSection'] = _i1.EndpointConnector(
      name: 'collapsibleCardSection',
      endpoint: endpoints['collapsibleCardSection']!,
      methodConnectors: {
        'fetchCollapsibleCardSection': _i1.MethodConnector(
          name: 'fetchCollapsibleCardSection',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['collapsibleCardSection']
                      as _i4.CollapsibleCardSectionEndpoint)
                  .fetchCollapsibleCardSection(session),
        ),
        'updateCollapsibleIdentifierSqlUnsafe': _i1.MethodConnector(
          name: 'updateCollapsibleIdentifierSqlUnsafe',
          params: {
            'collapsibleIdentifier': _i1.ParameterDescription(
              name: 'collapsibleIdentifier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isCollapsed': _i1.ParameterDescription(
              name: 'isCollapsed',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['collapsibleCardSection']
                      as _i4.CollapsibleCardSectionEndpoint)
                  .updateCollapsibleIdentifierSqlUnsafe(
            session,
            params['collapsibleIdentifier'],
            params['isCollapsed'],
          ),
        ),
        'updateCollapsibleIdentifierSqlSafe': _i1.MethodConnector(
          name: 'updateCollapsibleIdentifierSqlSafe',
          params: {
            'collapsibleIdentifier': _i1.ParameterDescription(
              name: 'collapsibleIdentifier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isCollapsed': _i1.ParameterDescription(
              name: 'isCollapsed',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['collapsibleCardSection']
                      as _i4.CollapsibleCardSectionEndpoint)
                  .updateCollapsibleIdentifierSqlSafe(
            session,
            params['collapsibleIdentifier'],
            params['isCollapsed'],
          ),
        ),
      },
    );
    connectors['deeplinkCore'] = _i1.EndpointConnector(
      name: 'deeplinkCore',
      endpoint: endpoints['deeplinkCore']!,
      methodConnectors: {
        'createDeeplink': _i1.MethodConnector(
          name: 'createDeeplink',
          params: {
            'floatingWindowType': _i1.ParameterDescription(
              name: 'floatingWindowType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'primaryId': _i1.ParameterDescription(
              name: 'primaryId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['deeplinkCore'] as _i5.DeeplinkCoreEndpoint)
                  .createDeeplink(
            session,
            floatingWindowType: params['floatingWindowType'],
            primaryId: params['primaryId'],
          ),
        ),
        'getDeeplink': _i1.MethodConnector(
          name: 'getDeeplink',
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
              (endpoints['deeplinkCore'] as _i5.DeeplinkCoreEndpoint)
                  .getDeeplink(
            session,
            path: params['path'],
          ),
        ),
      },
    );
    connectors['editRequestEndoint'] = _i1.EndpointConnector(
      name: 'editRequestEndoint',
      endpoint: endpoints['editRequestEndoint']!,
      methodConnectors: {
        'sendRequest': _i1.MethodConnector(
          name: 'sendRequest',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i18.EditRequestDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editRequestEndoint'] as _i6.EditRequestEndoint)
                  .sendRequest(
            session,
            params['request'],
          ),
        ),
        'rejectRequest': _i1.MethodConnector(
          name: 'rejectRequest',
          params: {
            'request': _i1.ParameterDescription(
              name: 'request',
              type: _i1.getType<_i19.RejectEditRequestDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['editRequestEndoint'] as _i6.EditRequestEndoint)
                  .rejectRequest(
            session,
            params['request'],
          ),
        ),
        'streamEditRequests': _i1.MethodStreamConnector(
          name: 'streamEditRequests',
          params: {
            'primaryKey': _i1.ParameterDescription(
              name: 'primaryKey',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<String>(),
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
              (endpoints['editRequestEndoint'] as _i6.EditRequestEndoint)
                  .streamEditRequests(
            session,
            primaryKey: params['primaryKey'],
            tableType: params['tableType'],
          ),
        ),
        'watchRejectEditRequests': _i1.MethodStreamConnector(
          name: 'watchRejectEditRequests',
          params: {
            'primaryKey': _i1.ParameterDescription(
              name: 'primaryKey',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<String>(),
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
              (endpoints['editRequestEndoint'] as _i6.EditRequestEndoint)
                  .watchRejectEditRequests(
            session,
            primaryKey: params['primaryKey'],
            tableType: params['tableType'],
          ),
        ),
      },
    );
    connectors['entityAssignmentsCore'] = _i1.EndpointConnector(
      name: 'entityAssignmentsCore',
      endpoint: endpoints['entityAssignmentsCore']!,
      methodConnectors: {
        'watchAddedAssignments': _i1.MethodStreamConnector(
          name: 'watchAddedAssignments',
          params: {
            'lightUserId': _i1.ParameterDescription(
              name: 'lightUserId',
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
              (endpoints['entityAssignmentsCore']
                      as _i7.EntityAssignmentsCoreEndpoint)
                  .watchAddedAssignments(
            session,
            lightUserId: params['lightUserId'],
          ),
        ),
        'watchRemovedAssignments': _i1.MethodStreamConnector(
          name: 'watchRemovedAssignments',
          params: {
            'lightUserId': _i1.ParameterDescription(
              name: 'lightUserId',
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
              (endpoints['entityAssignmentsCore']
                      as _i7.EntityAssignmentsCoreEndpoint)
                  .watchRemovedAssignments(
            session,
            lightUserId: params['lightUserId'],
          ),
        ),
      },
    );
    connectors['entityNoteCore'] = _i1.EndpointConnector(
      name: 'entityNoteCore',
      endpoint: endpoints['entityNoteCore']!,
      methodConnectors: {
        'fetchNotes': _i1.MethodConnector(
          name: 'fetchNotes',
          params: {
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'entityId': _i1.ParameterDescription(
              name: 'entityId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteCore'] as _i8.EntityNoteCoreEndpoint)
                  .fetchNotes(
            session,
            tableType: params['tableType'],
            entityId: params['entityId'],
          ),
        ),
        'createNote': _i1.MethodConnector(
          name: 'createNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i20.EntityNoteDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteCore'] as _i8.EntityNoteCoreEndpoint)
                  .createNote(
            session,
            params['note'],
          ),
        ),
        'updateNote': _i1.MethodConnector(
          name: 'updateNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i20.EntityNoteDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteCore'] as _i8.EntityNoteCoreEndpoint)
                  .updateNote(
            session,
            params['note'],
          ),
        ),
        'deleteNote': _i1.MethodConnector(
          name: 'deleteNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i20.EntityNoteDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteCore'] as _i8.EntityNoteCoreEndpoint)
                  .deleteNote(
            session,
            params['note'],
          ),
        ),
        'restoreNote': _i1.MethodConnector(
          name: 'restoreNote',
          params: {
            'note': _i1.ParameterDescription(
              name: 'note',
              type: _i1.getType<_i20.EntityNoteDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteCore'] as _i8.EntityNoteCoreEndpoint)
                  .restoreNote(
            session,
            params['note'],
          ),
        ),
        'watch': _i1.MethodStreamConnector(
          name: 'watch',
          params: {
            'tableType': _i1.ParameterDescription(
              name: 'tableType',
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
              (endpoints['entityNoteCore'] as _i8.EntityNoteCoreEndpoint).watch(
            session,
            tableType: params['tableType'],
            entityId: params['entityId'],
          ),
        ),
      },
    );
    connectors['entityNoteNotification'] = _i1.EndpointConnector(
      name: 'entityNoteNotification',
      endpoint: endpoints['entityNoteNotification']!,
      methodConnectors: {
        'updateNotification': _i1.MethodConnector(
          name: 'updateNotification',
          params: {
            'notification': _i1.ParameterDescription(
              name: 'notification',
              type: _i1.getType<_i21.EntityNoteNotificationDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteNotification']
                      as _i9.EntityNoteNotificationEndpoint)
                  .updateNotification(
            session,
            params['notification'],
          ),
        ),
        'createNotification': _i1.MethodConnector(
          name: 'createNotification',
          params: {
            'notification': _i1.ParameterDescription(
              name: 'notification',
              type: _i1.getType<_i21.EntityNoteNotificationDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteNotification']
                      as _i9.EntityNoteNotificationEndpoint)
                  .createNotification(
            session,
            params['notification'],
          ),
        ),
        'markAsRead': _i1.MethodConnector(
          name: 'markAsRead',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteNotification']
                      as _i9.EntityNoteNotificationEndpoint)
                  .markAsRead(
            session,
            params['notificationId'],
          ),
        ),
        'markAsUnRead': _i1.MethodConnector(
          name: 'markAsUnRead',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteNotification']
                      as _i9.EntityNoteNotificationEndpoint)
                  .markAsUnRead(
            session,
            params['notificationId'],
          ),
        ),
        'markAsCleared': _i1.MethodConnector(
          name: 'markAsCleared',
          params: {
            'notificationId': _i1.ParameterDescription(
              name: 'notificationId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteNotification']
                      as _i9.EntityNoteNotificationEndpoint)
                  .markAsCleared(
            session,
            params['notificationId'],
          ),
        ),
        'fetchUnreadNotifications': _i1.MethodConnector(
          name: 'fetchUnreadNotifications',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['entityNoteNotification']
                      as _i9.EntityNoteNotificationEndpoint)
                  .fetchUnreadNotifications(
            session,
            userId: params['userId'],
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
              (endpoints['entityNoteNotification']
                      as _i9.EntityNoteNotificationEndpoint)
                  .watch(session),
        ),
      },
    );
    connectors['flutterLog'] = _i1.EndpointConnector(
      name: 'flutterLog',
      endpoint: endpoints['flutterLog']!,
      methodConnectors: {
        'create': _i1.MethodConnector(
          name: 'create',
          params: {
            'log': _i1.ParameterDescription(
              name: 'log',
              type: _i1.getType<_i22.FlutterLogDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flutterLog'] as _i10.FlutterLogEndpoint).create(
            session,
            params['log'],
          ),
        ),
        'fetch': _i1.MethodConnector(
          name: 'fetch',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'searchTerm': _i1.ParameterDescription(
              name: 'searchTerm',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['flutterLog'] as _i10.FlutterLogEndpoint).fetch(
            session,
            limit: params['limit'],
            offset: params['offset'],
            searchTerm: params['searchTerm'],
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
              (endpoints['flutterLog'] as _i10.FlutterLogEndpoint).fetchById(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['heartbeat'] = _i1.EndpointConnector(
      name: 'heartbeat',
      endpoint: endpoints['heartbeat']!,
      methodConnectors: {
        'watchHeartbeat': _i1.MethodStreamConnector(
          name: 'watchHeartbeat',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['heartbeat'] as _i11.HeartbeatEndpoint)
                  .watchHeartbeat(session),
        )
      },
    );
    connectors['lightUser'] = _i1.EndpointConnector(
      name: 'lightUser',
      endpoint: endpoints['lightUser']!,
      methodConnectors: {
        'fetchById': _i1.MethodConnector(
          name: 'fetchById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'includeUserInfo': _i1.ParameterDescription(
              name: 'includeUserInfo',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lightUser'] as _i12.LightUserEndpoint).fetchById(
            session,
            id: params['id'],
            includeUserInfo: params['includeUserInfo'],
          ),
        ),
        'fetchByUserInfoId': _i1.MethodConnector(
          name: 'fetchByUserInfoId',
          params: {
            'userInfoId': _i1.ParameterDescription(
              name: 'userInfoId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'includeUserInfo': _i1.ParameterDescription(
              name: 'includeUserInfo',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lightUser'] as _i12.LightUserEndpoint)
                  .fetchByUserInfoId(
            session,
            userInfoId: params['userInfoId'],
            includeUserInfo: params['includeUserInfo'],
          ),
        ),
        'fetchAll': _i1.MethodConnector(
          name: 'fetchAll',
          params: {
            'includeUserInfo': _i1.ParameterDescription(
              name: 'includeUserInfo',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'showInactive': _i1.ParameterDescription(
              name: 'showInactive',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['lightUser'] as _i12.LightUserEndpoint).fetchAll(
            session,
            includeUserInfo: params['includeUserInfo'],
            showInactive: params['showInactive'],
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
              (endpoints['lightUser'] as _i12.LightUserEndpoint).watch(session),
        ),
      },
    );
    connectors['recentWindow'] = _i1.EndpointConnector(
      name: 'recentWindow',
      endpoint: endpoints['recentWindow']!,
      methodConnectors: {
        'fetchRecentWindows': _i1.MethodConnector(
          name: 'fetchRecentWindows',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['recentWindow'] as _i13.RecentWindowEndpoint)
                  .fetchRecentWindows(session),
        ),
        'addRecentWindow': _i1.MethodConnector(
          name: 'addRecentWindow',
          params: {
            'isInserted': _i1.ParameterDescription(
              name: 'isInserted',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'dto': _i1.ParameterDescription(
              name: 'dto',
              type: _i1.getType<_i23.RecentWindowDTO>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['recentWindow'] as _i13.RecentWindowEndpoint)
                  .addRecentWindow(
            session,
            isInserted: params['isInserted'],
            dto: params['dto'],
          ),
        ),
      },
    );
    connectors['serverpodLog'] = _i1.EndpointConnector(
      name: 'serverpodLog',
      endpoint: endpoints['serverpodLog']!,
      methodConnectors: {
        'fetchLogs': _i1.MethodConnector(
          name: 'fetchLogs',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'offset': _i1.ParameterDescription(
              name: 'offset',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'searchTerm': _i1.ParameterDescription(
              name: 'searchTerm',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['serverpodLog'] as _i14.ServerpodLogEndpoint)
                  .fetchLogs(
            session,
            limit: params['limit'],
            offset: params['offset'],
            searchTerm: params['searchTerm'],
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
              (endpoints['serverpodLog'] as _i14.ServerpodLogEndpoint)
                  .fetchById(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['time'] = _i1.EndpointConnector(
      name: 'time',
      endpoint: endpoints['time']!,
      methodConnectors: {
        'watchServerTime': _i1.MethodStreamConnector(
          name: 'watchServerTime',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['time'] as _i15.TimeEndpoint).watchServerTime(session),
        )
      },
    );
    connectors['userSettings'] = _i1.EndpointConnector(
      name: 'userSettings',
      endpoint: endpoints['userSettings']!,
      methodConnectors: {
        'fetchUserSettings': _i1.MethodConnector(
          name: 'fetchUserSettings',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userSettings'] as _i16.UserSettingsEndpoint)
                  .fetchUserSettings(session),
        ),
        'upsertUserSettings': _i1.MethodConnector(
          name: 'upsertUserSettings',
          params: {
            'userSettingsDTO': _i1.ParameterDescription(
              name: 'userSettingsDTO',
              type: _i1.getType<_i24.UserSettingsDTO>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userSettings'] as _i16.UserSettingsEndpoint)
                  .upsertUserSettings(
            session,
            params['userSettingsDTO'],
          ),
        ),
        'updateCollapsibleIdentifierSqlUnsafe': _i1.MethodConnector(
          name: 'updateCollapsibleIdentifierSqlUnsafe',
          params: {
            'collapsibleIdentifier': _i1.ParameterDescription(
              name: 'collapsibleIdentifier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isCollapsed': _i1.ParameterDescription(
              name: 'isCollapsed',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userSettings'] as _i16.UserSettingsEndpoint)
                  .updateCollapsibleIdentifierSqlUnsafe(
            session,
            params['collapsibleIdentifier'],
            params['isCollapsed'],
          ),
        ),
        'updateCollapsibleIdentifierSqlSafe': _i1.MethodConnector(
          name: 'updateCollapsibleIdentifierSqlSafe',
          params: {
            'collapsibleIdentifier': _i1.ParameterDescription(
              name: 'collapsibleIdentifier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isCollapsed': _i1.ParameterDescription(
              name: 'isCollapsed',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userSettings'] as _i16.UserSettingsEndpoint)
                  .updateCollapsibleIdentifierSqlSafe(
            session,
            params['collapsibleIdentifier'],
            params['isCollapsed'],
          ),
        ),
        'resetCollapsibleIdentifier': _i1.MethodConnector(
          name: 'resetCollapsibleIdentifier',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userSettings'] as _i16.UserSettingsEndpoint)
                  .resetCollapsibleIdentifier(session),
        ),
        'updateRecentWindowFilterValues': _i1.MethodConnector(
          name: 'updateRecentWindowFilterValues',
          params: {
            'floatingWindowType': _i1.ParameterDescription(
              name: 'floatingWindowType',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'isVisible': _i1.ParameterDescription(
              name: 'isVisible',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userSettings'] as _i16.UserSettingsEndpoint)
                  .updateRecentWindowFilterValues(
            session,
            params['floatingWindowType'],
            params['isVisible'],
          ),
        ),
        'saveRibbonConfigToServer': _i1.MethodConnector(
          name: 'saveRibbonConfigToServer',
          params: {
            'ribbonConfigs': _i1.ParameterDescription(
              name: 'ribbonConfigs',
              type: _i1.getType<Map<String, _i25.UserRibbonConfigDTO>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['userSettings'] as _i16.UserSettingsEndpoint)
                  .saveRibbonConfigToServer(
            session,
            params['ribbonConfigs'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i26.Endpoints()..initializeEndpoints(server);
  }
}
