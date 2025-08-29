import 'package:elbdesk_backend_core_server/elbdesk_backend_core_server.dart';
import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/app_user/endpoints/app_user_endpoint.dart';
import 'package:elbdesk_server/src/modules/crm/contact/contact_handler.dart';
import 'package:elbdesk_server/src/modules/crm/customer/endpoints/customer_endpoint.dart';
import 'package:serverpod/serverpod.dart';

class FieldSuggestionHandler {
  const FieldSuggestionHandler._();

  static Future<List<String>> getSuggestions(
    Session session, {
    required String tableTypeName,
    required String fieldKey,
    required String searchTerm,
  }) async {
    final filter = Filter(
      filterGroups: [
        FilterGroup(
          nextOperator: FilterOperator.and,
          filters: [
            // Search term
            if (searchTerm.isNotEmpty)
              FilterField(
                fieldKey: fieldKey,
                value: searchTerm,
                filterOperator: FilterOperator.and,
                fieldType: FilterFieldType.text,
                uuid: '',
                type: FilterType.iLike,
              ),
            // field not empty
            FilterField(
              fieldKey: fieldKey,
              value: '',
              filterOperator: FilterOperator.and,
              fieldType: FilterFieldType.text,
              uuid: '',
              type: FilterType.notEqual,
            ),
          ],
        ),
      ],
    );

    var entities = <dynamic>[];
    final tableType = TableType.values.byName(tableTypeName);

    if (tableType == TableType.contact) {
      entities = await ContactHandler.find(session, filter: filter);
    }
    if (tableType == TableType.customer) {
      entities = await CustomerEndpoint().find(session, filter: filter);
    }
    if (tableType == TableType.appUser) {
      entities = await AppUserEndpoint().find(session, filter: filter);
    }

    final allValues = <String>{};
    for (final entity in entities) {
      final json = entity.toJson();
      final propertyValue = json[fieldKey] as String?;
      if (propertyValue != null && propertyValue.isNotEmpty) {
        allValues.add(propertyValue);
      }
    }

    return allValues.toList();
  }
}
