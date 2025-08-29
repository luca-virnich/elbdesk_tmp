import 'package:elbdesk_server/src/modules/core/field_suggestion/field_suggestion_handler.dart';
import 'package:serverpod/serverpod.dart';

class FieldSuggestionEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<List<String>> find(
    Session session, {
    required String tableType,
    required String fieldKey,
    required String searchTerm,
  }) async {
    return FieldSuggestionHandler.getSuggestions(
      session,
      tableTypeName: tableType,
      fieldKey: fieldKey,
      searchTerm: searchTerm,
    );
  }
}
