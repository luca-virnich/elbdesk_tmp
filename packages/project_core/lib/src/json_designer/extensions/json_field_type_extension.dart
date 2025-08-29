import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';

extension JsonFieldTypeExtension on JsonFieldType {
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      JsonFieldType.text => l10n.json_string_readable,
      JsonFieldType.number => l10n.json_number_readable,
      JsonFieldType.boolean => l10n.json_boolean_readable,
      JsonFieldType.array => l10n.json_array_readable,
      JsonFieldType.object => l10n.json_object_readable,
    };
  }
}
