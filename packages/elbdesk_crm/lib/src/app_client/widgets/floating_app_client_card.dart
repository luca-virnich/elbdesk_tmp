import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/src/app_client/widgets/app_client_card/app_client_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// @nodoc
class FloatingAppClientCard extends HookConsumerWidget {
  /// @nodoc
  const FloatingAppClientCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingAppClientWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppClientCard(
      floatingWindowId: data.floatingWindowId,
      appClientId: data.entityId,
      floatingWindowType: data.windowType,
    );
  }
}
