import 'package:elbdesk_backend_core_client/elbdesk_backend_core_client.dart';

typedef FieldSuggestionFunction = Future<List<String>> Function({
  required String tableType,
  required String fieldKey,
  required String searchTerm,
});

class ElbDeskCore {
  ElbDeskCore._();

  static ServerpodClientShared? _client;
  static FieldSuggestionFunction? _fieldSuggestionFunction;

  static void initialize({
    required ServerpodClientShared client,
    FieldSuggestionFunction? fieldSuggestionFunction,
  }) {
    _client = client;
    _fieldSuggestionFunction = fieldSuggestionFunction;
  }

  static ServerpodClientShared get client {
    if (_client == null) {
      throw Exception(
        'ServerpodClient has not been initialized. '
        'Call ServerpodClient.initialize(client: ...) first.',
      );
    }
    return _client!;
  }

  static FieldSuggestionFunction get fieldSuggestionFunction {
    if (_fieldSuggestionFunction == null) {
      throw Exception(
        'FieldSuggestionFunction has not been initialized. '
        'Pass it during ElbDeskCore.initialize()',
      );
    }
    return _fieldSuggestionFunction!;
  }
}
