import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:serverpod/serverpod.dart';

class CollapsibleCardSectionEndpoint extends Endpoint {
  // ensure that the user is logged in (serverpod functionality)
  @override
  bool get requireLogin => true;

  Future<CollapsibleCardSectionConfig> fetchCollapsibleCardSection(
      Session session) async {
    final userId = await CoreUtils.getCurrentUserId(session);
    final config = await session.db.transaction(
      (transaction) async {
        final configs = await CollapsibleCardSectionConfig.db.findFirstRow(
          session,
          where: (v) {
            return v.userId.equals(userId);
          },
          transaction: transaction,
        );
        if (configs == null) {
          return _initialzeCollapsibleCardSection(
            session,
            userId,
            transaction,
          );
        } else {
          return configs;
        }
      },
    );
    return config;
  }

  Future<CollapsibleCardSectionConfig> _initialzeCollapsibleCardSection(
    Session session,
    int userId,
    Transaction transaction,
  ) async {
    final initial = CollapsibleCardSectionConfig(
      userId: userId,
      configs: {},
    );
    // final userId = (await session.authenticated)?.userId;
    // if (userId == null) throw Exception('User not authenticated');

    return CollapsibleCardSectionConfig.db
        .insertRow(session, initial, transaction: transaction);
  }

  /// SQL Injection unsafe! Update the collapse card section
  /// but more readable
  Future<void> updateCollapsibleIdentifierSqlUnsafe(
    Session session,
    String collapsibleIdentifier,
    bool isCollapsed,
  ) async {
    final tableName = CollapsibleCardSectionConfigTable().tableName;
    final columnName =
        CollapsibleCardSectionConfigTable().configs.columnName.split('.').last;
    final userColumn =
        CollapsibleCardSectionConfigTable().userId.columnName.split('.').last;
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
    final tableName = CollapsibleCardSectionConfigTable().tableName;
    final columnName =
        CollapsibleCardSectionConfigTable().configs.columnName.split('.').last;
    final userColumn =
        CollapsibleCardSectionConfigTable().userId.columnName.split('.').last;
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

  // Future<void> resetCollapsibleIdentifier(Session session) async {
  //   final userId = (await session.authenticated)?.userId;
  //   if (userId == null) throw Exception('User not authenticated');

  //   final tableName = UserSettingsDTOTable().tableName;
  //   final columnName =
  //       UserSettingsDTO.t.collapseCardSection.columnName.split('.').last;
  //   final userColumn = UserSettingsDTO.t.userId.columnName.split('.').last;

  //   final query = '''
  //   UPDATE $tableName
  //     SET "$columnName" = '{}'::jsonb
  //     WHERE "$userColumn" = @userId
  //   ''';

  //   final params = QueryParameters.named({
  //     'userId': userId,
  //   });

  //   await session.db.unsafeExecute(query, parameters: params);
  // }
}
