import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_backend_core_server/src/modules/user_settings/user_settings_utils.dart';
import 'package:serverpod/serverpod.dart';

/// The UserSettingsEndpoint is used to fetch and update the user settings
///
/// See [UserSettingsDTO] for more details
///
class UserSettingsEndpoint extends Endpoint {
  // ensure that the user is logged in (serverpod functionality)
  @override
  bool get requireLogin => true;

  /// Find a UserSettings by its id
  Future<UserSettingsDTO> fetchUserSettings(Session session) async {
    final userId = await CoreUtils.getCurrentUserId(session);

    final userSettingsDTO = await UserSettingsDTO.db.findFirstRow(
      session,
      where: (p0) {
        return p0.userId.equals(userId);
      },
    );

    // TODO(Luca): fix this, handle proper initial user settings allocation
    // maybe create the initial user settings with the app user creation
    if (userSettingsDTO == null) {
      final initialUserSettings = UserSettingsUtils.initial(userId: userId);
      return _createUserSettings(
        session,
        initialUserSettings,
      );
    } else {
      return userSettingsDTO;
    }
  }

  Future<UserSettingsDTO?> upsertUserSettings(
    Session session,
    UserSettingsDTO userSettingsDTO,
  ) async {
    // We are grabbing the userId to check if the user is authenticated and to
    // update the user settings.
    final userId = (await session.authenticated)?.userId;
    if (userId == null) throw Exception('User not authenticated');

    final dto = userSettingsDTO.copyWith(userId: userId);

    // We are checking if the user has settings, if not we create one
    final serverRow = await fetchUserSettings(session);

    // If the serverRow is not null, we update the user settings.
    // The settings object is the dto but we have to add the rowId to it.
    return _updateUserSettings(session, dto.copyWith(id: serverRow.id));
  }

  Future<UserSettingsDTO> _createUserSettings(
    Session session,
    UserSettingsDTO userSettingsDTO,
  ) async {
    // final userId = (await session.authenticated)?.userId;
    // if (userId == null) throw Exception('User not authenticated');

    return UserSettingsDTO.db.insertRow(session, userSettingsDTO);
  }

  Future<UserSettingsDTO?> _updateUserSettings(
    Session session,
    UserSettingsDTO userSettingsDTO,
  ) async {
    // final userId = (await session.authenticated)?.userId;
    // if (userId == null) throw Exception('User not authenticated');

    return UserSettingsDTO.db.updateRow(session, userSettingsDTO);
  }

  /// SQL Injection unsafe! Update the collapse card section
  /// but more readable
  Future<void> updateCollapsibleIdentifierSqlUnsafe(
    Session session,
    String collapsibleIdentifier,
    bool isCollapsed,
  ) async {
    final tableName = UserSettingsDTOTable().tableName;
    final columnName =
        UserSettingsDTO.t.collapseCardSection.columnName.split('.').last;
    final userColumn = UserSettingsDTO.t.userId.columnName.split('.').last;
    final userId = (await session.authenticated)?.userId;

    if (userId == null) throw Exception('User not authenticated');

    final query = '''
    UPDATE $tableName
      SET "$columnName" = jsonb_set(
        COALESCE("$columnName"::jsonb, '{}'::jsonb), 
        ARRAY['$collapsibleIdentifier'],
        $isCollapsed
      )
      WHERE "$userColumn" = $userId
    ''';

    await session.db.unsafeExecute(query);
  }

  /// SQL Injection safe version of updateCollapsibleIdentifier
  Future<void> updateCollapsibleIdentifierSqlSafe(
    Session session,
    String collapsibleIdentifier,
    bool isCollapsed,
  ) async {
    final tableName = UserSettingsDTOTable().tableName;
    final columnName =
        UserSettingsDTO.t.collapseCardSection.columnName.split('.').last;
    final userColumn = UserSettingsDTO.t.userId.columnName.split('.').last;
    final userId = (await session.authenticated)?.userId;

    if (userId == null) throw Exception('User not authenticated');

    final query = '''
    UPDATE $tableName
      SET "$columnName" = jsonb_set(
        COALESCE("$columnName"::jsonb, '{}'::jsonb), 
        ARRAY[@collapsibleIdentifier::text],
        @isCollapsed::jsonb
      )
      WHERE "$userColumn" = @userId
    ''';

    final params = QueryParameters.named({
      'collapsibleIdentifier': collapsibleIdentifier,
      'isCollapsed': isCollapsed.toString(),
      'userId': userId,
    });

    await session.db.unsafeExecute(query, parameters: params);
  }

  Future<void> resetCollapsibleIdentifier(Session session) async {
    final userId = (await session.authenticated)?.userId;
    if (userId == null) throw Exception('User not authenticated');

    final tableName = UserSettingsDTOTable().tableName;
    final columnName =
        UserSettingsDTO.t.collapseCardSection.columnName.split('.').last;
    final userColumn = UserSettingsDTO.t.userId.columnName.split('.').last;

    final query = '''
    UPDATE $tableName
      SET "$columnName" = '{}'::jsonb
      WHERE "$userColumn" = @userId
    ''';

    final params = QueryParameters.named({
      'userId': userId,
    });

    await session.db.unsafeExecute(query, parameters: params);
  }

  Future<void> updateRecentWindowFilterValues(
    Session session,
    String floatingWindowType,
    bool isVisible,
  ) async {
    final tableName = UserSettingsDTOTable().tableName;
    final columnName =
        UserSettingsDTO.t.recentWindowFilterValues.columnName.split('.').last;
    final userColumn = UserSettingsDTO.t.userId.columnName.split('.').last;
    final userId = (await session.authenticated)?.userId;

    if (userId == null) throw Exception('User not authenticated');

    final query = '''
    UPDATE $tableName
      SET "$columnName" = jsonb_set(
        COALESCE("$columnName"::jsonb, '{}'::jsonb), 
        ARRAY[@floatingWindowType::text],
        @isVisible::jsonb
      )
      WHERE "$userColumn" = @userId
    ''';

    final params = QueryParameters.named({
      'floatingWindowType': floatingWindowType,
      'isVisible': isVisible.toString(),
      'userId': userId,
    });

    await session.db.unsafeExecute(query, parameters: params);
  }

  Future<UserSettingsDTO?> saveRibbonConfigToServer(
    Session session,
    Map<String, UserRibbonConfigDTO> ribbonConfigs,
  ) async {
    final userSettingsDTO = await fetchUserSettings(session);

    final updatedUserSettingsDTO = userSettingsDTO.copyWith(
      ribbonConfigs: ribbonConfigs,
    );

    return UserSettingsDTO.db.updateRow(
      session,
      updatedUserSettingsDTO,
      columns: (t) => [t.ribbonConfigs],
    );
  }
}
