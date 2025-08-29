import 'package:elbdesk_core/elbdesk_core.dart';
import '../config/floating_{{#snakeCase}}{{feature_name}}{{/snakeCase}}_window_data.dart';
import '../widgets/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_card/{{#snakeCase}}{{feature_name}}{{/snakeCase}}_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Floating{{#pascalCase}}{{feature_name}}{{/pascalCase}}Card extends HookConsumerWidget {
  const Floating{{#pascalCase}}{{feature_name}}{{/pascalCase}}Card({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final Floating{{#pascalCase}}{{feature_name}}{{/pascalCase}}WindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus = useFocusNode();
    return FloatingWindow(
      key: Key('floating-${data.floatingWindowId}'),
      windowType: data.type,
      windowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      child: {{#pascalCase}}{{feature_name}}{{/pascalCase}}Card(
        entityId: data.entityId,
        customerId: data.customerId,
        floatingWindowId: data.floatingWindowId,
        floatingWindowFocus: floatingWindowFocus,
        initialNoteId: data.initialNoteId,
        initialNoteParentId: data.initialNoteParentId,
      ),
    );
  }
} 
