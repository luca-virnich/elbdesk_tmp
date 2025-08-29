import 'package:elbdesk_server/src/generated/protocol.dart';
import 'package:elbdesk_server/src/modules/core/generic_crud.dart';
import 'package:serverpod/serverpod.dart';

class JsonDesignerEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<JsonTemplateDTO?> createTemplate(
    Session session,
    JsonTemplateDTO jsonTemplate,
  ) async {
    return GenericCrud.create(
      session,
      JsonTemplateDTO.db.insertRow(session, jsonTemplate),
    );
  }
}
