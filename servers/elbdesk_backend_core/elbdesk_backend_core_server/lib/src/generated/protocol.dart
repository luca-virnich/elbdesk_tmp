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
import 'core/table_config/models/table_config.dart' as _i4;
import 'core/table_config/models/table_field_config.dart' as _i5;
import 'core/table_filter/models/filter.dart' as _i6;
import 'core/table_filter/models/filter_field.dart' as _i7;
import 'core/table_filter/models/filter_field_type.dart' as _i8;
import 'core/table_filter/models/filter_group.dart' as _i9;
import 'core/table_filter/models/filter_operator.dart' as _i10;
import 'core/table_filter/models/filter_type.dart' as _i11;
import 'core/table_filter/models/sort.dart' as _i12;
import 'exceptions/elb_exception/elb_exception.dart' as _i13;
import 'exceptions/elb_exception/elb_exception_type.dart' as _i14;
import 'modules/app_version/app_version_manifest.dart' as _i15;
import 'modules/collapsible_card_section/models/collapsible_card_section.dart'
    as _i16;
import 'modules/deeplinks/models/deeplink.dart' as _i17;
import 'modules/edit_requests/models/edit_request.dart' as _i18;
import 'modules/edit_requests/models/reject_edit_request_dto.dart' as _i19;
import 'modules/entity_assignments/entity_assignments.dart' as _i20;
import 'modules/entity_lock/models/entity_lock.dart' as _i21;
import 'modules/entity_lock/models/entity_lock_field.dart' as _i22;
import 'modules/entity_notes/entity_note.dart' as _i23;
import 'modules/entity_notes/entity_note_notification.dart' as _i24;
import 'modules/entity_notes/mention.dart' as _i25;
import 'modules/flutter_log/models/flutter_log.dart' as _i26;
import 'modules/flutter_log/models/flutter_log_field.dart' as _i27;
import 'modules/light_user/models/light_user.dart' as _i28;
import 'modules/light_user/models/light_user_field.dart' as _i29;
import 'modules/recent_windows/recent_window.dart' as _i30;
import 'modules/serverpod_log/models/serverpod_log.dart' as _i31;
import 'modules/serverpod_log/models/serverpod_log_field.dart' as _i32;
import 'modules/user_settings/app_locale.dart' as _i33;
import 'modules/user_settings/app_theme.dart' as _i34;
import 'modules/user_settings/user_ribbon_config.dart' as _i35;
import 'modules/user_settings/user_settings.dart' as _i36;
import 'package:elbdesk_backend_core_server/src/generated/core/table_config/models/table_config.dart'
    as _i37;
import 'package:elbdesk_backend_core_server/src/generated/modules/entity_notes/entity_note.dart'
    as _i38;
import 'package:elbdesk_backend_core_server/src/generated/modules/entity_notes/entity_note_notification.dart'
    as _i39;
import 'package:elbdesk_backend_core_server/src/generated/modules/flutter_log/models/flutter_log.dart'
    as _i40;
import 'package:elbdesk_backend_core_server/src/generated/modules/light_user/models/light_user.dart'
    as _i41;
import 'package:elbdesk_backend_core_server/src/generated/modules/recent_windows/recent_window.dart'
    as _i42;
import 'package:elbdesk_backend_core_server/src/generated/modules/serverpod_log/models/serverpod_log.dart'
    as _i43;
import 'package:elbdesk_backend_core_server/src/generated/modules/user_settings/user_ribbon_config.dart'
    as _i44;
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

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'ed_core_admin_flutter_log',
      dartName: 'FlutterLogDTO',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_core_admin_flutter_log_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'deviceId',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'context',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'exception',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'flutterLibrary',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'stack',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'silent',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
        ),
        _i2.ColumnDefinition(
          name: 'information',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'time',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'platform',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'appVersion',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'buildNumber',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_admin_flutter_log_pkey',
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
      name: 'ed_core_collapsible_card_section_config',
      dartName: 'CollapsibleCardSectionConfig',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_core_collapsible_card_section_config_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'configs',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'Map<String,bool>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_collapsible_card_section_config_pkey',
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
      name: 'ed_core_deeplink',
      dartName: 'Deeplink',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_core_deeplink_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'floatingWindowType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'primaryId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'payload',
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
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_deeplink_pkey',
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
      name: 'ed_core_entity_note',
      dartName: 'EntityNoteDTO',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_core_entity_note_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'hint',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'entityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'tableType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mentions',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:MentionDTO>',
        ),
        _i2.ColumnDefinition(
          name: 'parentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'hardcodedSender',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'createdAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
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
          name: 'deletedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_entity_note_pkey',
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
      name: 'ed_core_entity_note_notification',
      dartName: 'EntityNoteNotificationDTO',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'ed_core_entity_note_notification_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'tableType',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'entityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'label',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'message',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isUpdate',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'hardcodedSender',
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
          name: 'readAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'clearedAt',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'parentId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'additionalData',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'senderId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'noteId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_entity_note_notification_pkey',
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
      name: 'ed_core_recent_window',
      dartName: 'RecentWindowDTO',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_core_recent_window_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'type',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'entityId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'label',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'timestamp',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'additionalData',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_recent_window_pkey',
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
      name: 'ed_core_table_config',
      dartName: 'TableConfig',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_core_table_config_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'componentIdentifier',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tableId',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'tableFieldConfig',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:TableFieldConfig>',
        ),
        _i2.ColumnDefinition(
          name: 'filter',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:Filter?',
        ),
        _i2.ColumnDefinition(
          name: 'isPrimary',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'sort',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'protocol:Sort?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_table_config_pkey',
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
      name: 'ed_core_user_settings',
      dartName: 'UserSettingsDTO',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_core_user_settings_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'appTheme',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AppTheme',
        ),
        _i2.ColumnDefinition(
          name: 'appLocale',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'protocol:AppLocale',
        ),
        _i2.ColumnDefinition(
          name: 'inactiveFloatingOverlayColor',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
          columnDefault: '\'28000000\'::text',
        ),
        _i2.ColumnDefinition(
          name: 'inactiveFloatingOverlaySavedColors',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<String>',
        ),
        _i2.ColumnDefinition(
          name: 'showTooltips',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'enableTablePrefix',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'reduceMotion',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'dragWindowOutOfMainWindow',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
        _i2.ColumnDefinition(
          name: 'defaultCollapseCardSections',
          columnType: _i2.ColumnType.boolean,
          isNullable: true,
          dartType: 'bool?',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'collapseCardSection',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'Map<String,bool>?',
        ),
        _i2.ColumnDefinition(
          name: 'recentWindowFilterValues',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'Map<String,bool>?',
        ),
        _i2.ColumnDefinition(
          name: 'ribbonConfigs',
          columnType: _i2.ColumnType.json,
          isNullable: true,
          dartType: 'Map<String,protocol:UserRibbonConfigDTO>?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ed_core_user_settings_pkey',
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
      name: 'ed_user_light_user',
      dartName: 'LightUserDTO',
      schema: 'public',
      module: 'elbdesk_backend_core',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ed_user_light_user_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'email',
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
          name: 'initials',
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
          name: 'imageUrl',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ed_user_light_user_fk_0',
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
          indexName: 'ed_user_light_user_pkey',
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
          indexName: 'user_info_id_unique_idx',
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
    ..._i3.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.TableConfig) {
      return _i4.TableConfig.fromJson(data) as T;
    }
    if (t == _i5.TableFieldConfig) {
      return _i5.TableFieldConfig.fromJson(data) as T;
    }
    if (t == _i6.Filter) {
      return _i6.Filter.fromJson(data) as T;
    }
    if (t == _i7.FilterField) {
      return _i7.FilterField.fromJson(data) as T;
    }
    if (t == _i8.FilterFieldType) {
      return _i8.FilterFieldType.fromJson(data) as T;
    }
    if (t == _i9.FilterGroup) {
      return _i9.FilterGroup.fromJson(data) as T;
    }
    if (t == _i10.FilterOperator) {
      return _i10.FilterOperator.fromJson(data) as T;
    }
    if (t == _i11.FilterType) {
      return _i11.FilterType.fromJson(data) as T;
    }
    if (t == _i12.Sort) {
      return _i12.Sort.fromJson(data) as T;
    }
    if (t == _i13.ElbException) {
      return _i13.ElbException.fromJson(data) as T;
    }
    if (t == _i14.ElbExceptionType) {
      return _i14.ElbExceptionType.fromJson(data) as T;
    }
    if (t == _i15.AppVersionManifest) {
      return _i15.AppVersionManifest.fromJson(data) as T;
    }
    if (t == _i16.CollapsibleCardSectionConfig) {
      return _i16.CollapsibleCardSectionConfig.fromJson(data) as T;
    }
    if (t == _i17.Deeplink) {
      return _i17.Deeplink.fromJson(data) as T;
    }
    if (t == _i18.EditRequestDTO) {
      return _i18.EditRequestDTO.fromJson(data) as T;
    }
    if (t == _i19.RejectEditRequestDTO) {
      return _i19.RejectEditRequestDTO.fromJson(data) as T;
    }
    if (t == _i20.EntityAssignmentDTO) {
      return _i20.EntityAssignmentDTO.fromJson(data) as T;
    }
    if (t == _i21.EntityLockDTO) {
      return _i21.EntityLockDTO.fromJson(data) as T;
    }
    if (t == _i22.EntityLockField) {
      return _i22.EntityLockField.fromJson(data) as T;
    }
    if (t == _i23.EntityNoteDTO) {
      return _i23.EntityNoteDTO.fromJson(data) as T;
    }
    if (t == _i24.EntityNoteNotificationDTO) {
      return _i24.EntityNoteNotificationDTO.fromJson(data) as T;
    }
    if (t == _i25.MentionDTO) {
      return _i25.MentionDTO.fromJson(data) as T;
    }
    if (t == _i26.FlutterLogDTO) {
      return _i26.FlutterLogDTO.fromJson(data) as T;
    }
    if (t == _i27.FlutterLogField) {
      return _i27.FlutterLogField.fromJson(data) as T;
    }
    if (t == _i28.LightUserDTO) {
      return _i28.LightUserDTO.fromJson(data) as T;
    }
    if (t == _i29.LightUserField) {
      return _i29.LightUserField.fromJson(data) as T;
    }
    if (t == _i30.RecentWindowDTO) {
      return _i30.RecentWindowDTO.fromJson(data) as T;
    }
    if (t == _i31.ServerpodLogDTO) {
      return _i31.ServerpodLogDTO.fromJson(data) as T;
    }
    if (t == _i32.ServerpodLogField) {
      return _i32.ServerpodLogField.fromJson(data) as T;
    }
    if (t == _i33.AppLocale) {
      return _i33.AppLocale.fromJson(data) as T;
    }
    if (t == _i34.AppTheme) {
      return _i34.AppTheme.fromJson(data) as T;
    }
    if (t == _i35.UserRibbonConfigDTO) {
      return _i35.UserRibbonConfigDTO.fromJson(data) as T;
    }
    if (t == _i36.UserSettingsDTO) {
      return _i36.UserSettingsDTO.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.TableConfig?>()) {
      return (data != null ? _i4.TableConfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.TableFieldConfig?>()) {
      return (data != null ? _i5.TableFieldConfig.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Filter?>()) {
      return (data != null ? _i6.Filter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.FilterField?>()) {
      return (data != null ? _i7.FilterField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.FilterFieldType?>()) {
      return (data != null ? _i8.FilterFieldType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.FilterGroup?>()) {
      return (data != null ? _i9.FilterGroup.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.FilterOperator?>()) {
      return (data != null ? _i10.FilterOperator.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.FilterType?>()) {
      return (data != null ? _i11.FilterType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.Sort?>()) {
      return (data != null ? _i12.Sort.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ElbException?>()) {
      return (data != null ? _i13.ElbException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ElbExceptionType?>()) {
      return (data != null ? _i14.ElbExceptionType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.AppVersionManifest?>()) {
      return (data != null ? _i15.AppVersionManifest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.CollapsibleCardSectionConfig?>()) {
      return (data != null
          ? _i16.CollapsibleCardSectionConfig.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i17.Deeplink?>()) {
      return (data != null ? _i17.Deeplink.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.EditRequestDTO?>()) {
      return (data != null ? _i18.EditRequestDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i19.RejectEditRequestDTO?>()) {
      return (data != null ? _i19.RejectEditRequestDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i20.EntityAssignmentDTO?>()) {
      return (data != null ? _i20.EntityAssignmentDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i21.EntityLockDTO?>()) {
      return (data != null ? _i21.EntityLockDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.EntityLockField?>()) {
      return (data != null ? _i22.EntityLockField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.EntityNoteDTO?>()) {
      return (data != null ? _i23.EntityNoteDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.EntityNoteNotificationDTO?>()) {
      return (data != null
          ? _i24.EntityNoteNotificationDTO.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i25.MentionDTO?>()) {
      return (data != null ? _i25.MentionDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i26.FlutterLogDTO?>()) {
      return (data != null ? _i26.FlutterLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i27.FlutterLogField?>()) {
      return (data != null ? _i27.FlutterLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.LightUserDTO?>()) {
      return (data != null ? _i28.LightUserDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.LightUserField?>()) {
      return (data != null ? _i29.LightUserField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.RecentWindowDTO?>()) {
      return (data != null ? _i30.RecentWindowDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i31.ServerpodLogDTO?>()) {
      return (data != null ? _i31.ServerpodLogDTO.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i32.ServerpodLogField?>()) {
      return (data != null ? _i32.ServerpodLogField.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i33.AppLocale?>()) {
      return (data != null ? _i33.AppLocale.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i34.AppTheme?>()) {
      return (data != null ? _i34.AppTheme.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i35.UserRibbonConfigDTO?>()) {
      return (data != null ? _i35.UserRibbonConfigDTO.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i36.UserSettingsDTO?>()) {
      return (data != null ? _i36.UserSettingsDTO.fromJson(data) : null) as T;
    }
    if (t == List<_i5.TableFieldConfig>) {
      return (data as List)
          .map((e) => deserialize<_i5.TableFieldConfig>(e))
          .toList() as T;
    }
    if (t == List<_i9.FilterGroup>) {
      return (data as List).map((e) => deserialize<_i9.FilterGroup>(e)).toList()
          as T;
    }
    if (t == List<_i7.FilterField>) {
      return (data as List).map((e) => deserialize<_i7.FilterField>(e)).toList()
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
    if (t == List<_i25.MentionDTO>) {
      return (data as List).map((e) => deserialize<_i25.MentionDTO>(e)).toList()
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
    if (t == _i1.getType<Map<String, _i35.UserRibbonConfigDTO>?>()) {
      return (data != null
          ? (data as Map).map((k, v) => MapEntry(
              deserialize<String>(k), deserialize<_i35.UserRibbonConfigDTO>(v)))
          : null) as T;
    }
    if (t == _i1.getType<List<_i37.TableConfig>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i37.TableConfig>(e)).toList()
          : null) as T;
    }
    if (t == List<_i38.EntityNoteDTO>) {
      return (data as List)
          .map((e) => deserialize<_i38.EntityNoteDTO>(e))
          .toList() as T;
    }
    if (t == List<_i39.EntityNoteNotificationDTO>) {
      return (data as List)
          .map((e) => deserialize<_i39.EntityNoteNotificationDTO>(e))
          .toList() as T;
    }
    if (t == List<_i40.FlutterLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i40.FlutterLogDTO>(e))
          .toList() as T;
    }
    if (t == List<_i41.LightUserDTO>) {
      return (data as List)
          .map((e) => deserialize<_i41.LightUserDTO>(e))
          .toList() as T;
    }
    if (t == List<_i42.RecentWindowDTO>) {
      return (data as List)
          .map((e) => deserialize<_i42.RecentWindowDTO>(e))
          .toList() as T;
    }
    if (t == List<_i43.ServerpodLogDTO>) {
      return (data as List)
          .map((e) => deserialize<_i43.ServerpodLogDTO>(e))
          .toList() as T;
    }
    if (t == Map<String, _i44.UserRibbonConfigDTO>) {
      return (data as Map).map((k, v) => MapEntry(
              deserialize<String>(k), deserialize<_i44.UserRibbonConfigDTO>(v)))
          as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
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
    if (data is _i4.TableConfig) {
      return 'TableConfig';
    }
    if (data is _i5.TableFieldConfig) {
      return 'TableFieldConfig';
    }
    if (data is _i6.Filter) {
      return 'Filter';
    }
    if (data is _i7.FilterField) {
      return 'FilterField';
    }
    if (data is _i8.FilterFieldType) {
      return 'FilterFieldType';
    }
    if (data is _i9.FilterGroup) {
      return 'FilterGroup';
    }
    if (data is _i10.FilterOperator) {
      return 'FilterOperator';
    }
    if (data is _i11.FilterType) {
      return 'FilterType';
    }
    if (data is _i12.Sort) {
      return 'Sort';
    }
    if (data is _i13.ElbException) {
      return 'ElbException';
    }
    if (data is _i14.ElbExceptionType) {
      return 'ElbExceptionType';
    }
    if (data is _i15.AppVersionManifest) {
      return 'AppVersionManifest';
    }
    if (data is _i16.CollapsibleCardSectionConfig) {
      return 'CollapsibleCardSectionConfig';
    }
    if (data is _i17.Deeplink) {
      return 'Deeplink';
    }
    if (data is _i18.EditRequestDTO) {
      return 'EditRequestDTO';
    }
    if (data is _i19.RejectEditRequestDTO) {
      return 'RejectEditRequestDTO';
    }
    if (data is _i20.EntityAssignmentDTO) {
      return 'EntityAssignmentDTO';
    }
    if (data is _i21.EntityLockDTO) {
      return 'EntityLockDTO';
    }
    if (data is _i22.EntityLockField) {
      return 'EntityLockField';
    }
    if (data is _i23.EntityNoteDTO) {
      return 'EntityNoteDTO';
    }
    if (data is _i24.EntityNoteNotificationDTO) {
      return 'EntityNoteNotificationDTO';
    }
    if (data is _i25.MentionDTO) {
      return 'MentionDTO';
    }
    if (data is _i26.FlutterLogDTO) {
      return 'FlutterLogDTO';
    }
    if (data is _i27.FlutterLogField) {
      return 'FlutterLogField';
    }
    if (data is _i28.LightUserDTO) {
      return 'LightUserDTO';
    }
    if (data is _i29.LightUserField) {
      return 'LightUserField';
    }
    if (data is _i30.RecentWindowDTO) {
      return 'RecentWindowDTO';
    }
    if (data is _i31.ServerpodLogDTO) {
      return 'ServerpodLogDTO';
    }
    if (data is _i32.ServerpodLogField) {
      return 'ServerpodLogField';
    }
    if (data is _i33.AppLocale) {
      return 'AppLocale';
    }
    if (data is _i34.AppTheme) {
      return 'AppTheme';
    }
    if (data is _i35.UserRibbonConfigDTO) {
      return 'UserRibbonConfigDTO';
    }
    if (data is _i36.UserSettingsDTO) {
      return 'UserSettingsDTO';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
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
      return deserialize<_i4.TableConfig>(data['data']);
    }
    if (dataClassName == 'TableFieldConfig') {
      return deserialize<_i5.TableFieldConfig>(data['data']);
    }
    if (dataClassName == 'Filter') {
      return deserialize<_i6.Filter>(data['data']);
    }
    if (dataClassName == 'FilterField') {
      return deserialize<_i7.FilterField>(data['data']);
    }
    if (dataClassName == 'FilterFieldType') {
      return deserialize<_i8.FilterFieldType>(data['data']);
    }
    if (dataClassName == 'FilterGroup') {
      return deserialize<_i9.FilterGroup>(data['data']);
    }
    if (dataClassName == 'FilterOperator') {
      return deserialize<_i10.FilterOperator>(data['data']);
    }
    if (dataClassName == 'FilterType') {
      return deserialize<_i11.FilterType>(data['data']);
    }
    if (dataClassName == 'Sort') {
      return deserialize<_i12.Sort>(data['data']);
    }
    if (dataClassName == 'ElbException') {
      return deserialize<_i13.ElbException>(data['data']);
    }
    if (dataClassName == 'ElbExceptionType') {
      return deserialize<_i14.ElbExceptionType>(data['data']);
    }
    if (dataClassName == 'AppVersionManifest') {
      return deserialize<_i15.AppVersionManifest>(data['data']);
    }
    if (dataClassName == 'CollapsibleCardSectionConfig') {
      return deserialize<_i16.CollapsibleCardSectionConfig>(data['data']);
    }
    if (dataClassName == 'Deeplink') {
      return deserialize<_i17.Deeplink>(data['data']);
    }
    if (dataClassName == 'EditRequestDTO') {
      return deserialize<_i18.EditRequestDTO>(data['data']);
    }
    if (dataClassName == 'RejectEditRequestDTO') {
      return deserialize<_i19.RejectEditRequestDTO>(data['data']);
    }
    if (dataClassName == 'EntityAssignmentDTO') {
      return deserialize<_i20.EntityAssignmentDTO>(data['data']);
    }
    if (dataClassName == 'EntityLockDTO') {
      return deserialize<_i21.EntityLockDTO>(data['data']);
    }
    if (dataClassName == 'EntityLockField') {
      return deserialize<_i22.EntityLockField>(data['data']);
    }
    if (dataClassName == 'EntityNoteDTO') {
      return deserialize<_i23.EntityNoteDTO>(data['data']);
    }
    if (dataClassName == 'EntityNoteNotificationDTO') {
      return deserialize<_i24.EntityNoteNotificationDTO>(data['data']);
    }
    if (dataClassName == 'MentionDTO') {
      return deserialize<_i25.MentionDTO>(data['data']);
    }
    if (dataClassName == 'FlutterLogDTO') {
      return deserialize<_i26.FlutterLogDTO>(data['data']);
    }
    if (dataClassName == 'FlutterLogField') {
      return deserialize<_i27.FlutterLogField>(data['data']);
    }
    if (dataClassName == 'LightUserDTO') {
      return deserialize<_i28.LightUserDTO>(data['data']);
    }
    if (dataClassName == 'LightUserField') {
      return deserialize<_i29.LightUserField>(data['data']);
    }
    if (dataClassName == 'RecentWindowDTO') {
      return deserialize<_i30.RecentWindowDTO>(data['data']);
    }
    if (dataClassName == 'ServerpodLogDTO') {
      return deserialize<_i31.ServerpodLogDTO>(data['data']);
    }
    if (dataClassName == 'ServerpodLogField') {
      return deserialize<_i32.ServerpodLogField>(data['data']);
    }
    if (dataClassName == 'AppLocale') {
      return deserialize<_i33.AppLocale>(data['data']);
    }
    if (dataClassName == 'AppTheme') {
      return deserialize<_i34.AppTheme>(data['data']);
    }
    if (dataClassName == 'UserRibbonConfigDTO') {
      return deserialize<_i35.UserRibbonConfigDTO>(data['data']);
    }
    if (dataClassName == 'UserSettingsDTO') {
      return deserialize<_i36.UserSettingsDTO>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
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
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.TableConfig:
        return _i4.TableConfig.t;
      case _i16.CollapsibleCardSectionConfig:
        return _i16.CollapsibleCardSectionConfig.t;
      case _i17.Deeplink:
        return _i17.Deeplink.t;
      case _i23.EntityNoteDTO:
        return _i23.EntityNoteDTO.t;
      case _i24.EntityNoteNotificationDTO:
        return _i24.EntityNoteNotificationDTO.t;
      case _i26.FlutterLogDTO:
        return _i26.FlutterLogDTO.t;
      case _i28.LightUserDTO:
        return _i28.LightUserDTO.t;
      case _i30.RecentWindowDTO:
        return _i30.RecentWindowDTO.t;
      case _i36.UserSettingsDTO:
        return _i36.UserSettingsDTO.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'elbdesk_backend_core';
}
