import 'package:elbdesk_server/src/modules/core/generic_crud.dart';

/// Lock Edit Session Query
///
/// Used to lock an edit session for an entity
///
/// This is done in a raw SQL query to avoid the need of a transaction
/// Otherwise we might have a race condition where two users edit the same
/// entity at the same time
///
/// See [GenericCrud] for more information on how this is used
///
String lockEditSessionQuery({required String tableName}) {
  final query = '''
    
   UPDATE $tableName
    SET
      "editingSession" = CASE
        WHEN "editingSession" IS NULL OR "editingSession" = '' THEN @editingSessionValue
        ELSE "editingSession"
      END,
      "editingById" = CASE
        WHEN "editingSession" IS NULL OR "editingSession" = '' THEN
          CASE
            WHEN "editingById" IS NULL THEN @editingByIdValue
            ELSE "editingById"
          END
        ELSE "editingById"
      END,
      "editingSince" = CASE
        WHEN "editingSession" IS NULL OR "editingSession" = '' THEN
          CASE
            WHEN "editingSince" IS NULL THEN @editingSinceValue
            ELSE "editingSince"
          END
        ELSE "editingSince"
      END
    WHERE id = @id AND ("editingSession" IS NULL OR "editingSession" = '')
    RETURNING *;
    
    ''';

  return query;
}
