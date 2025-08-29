import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HiddenEntityStream<T> extends HookConsumerWidget {
  const HiddenEntityStream({
    required this.sessionId,
    required this.dataId,
    required this.onRefresh,
    required this.streamDataProvider,
    required this.toComparable,
    super.key,
  });

  final String sessionId;
  final int dataId;
  final DataComparable Function(T) toComparable;
  final void Function(String editingSessionId, int dataId) onRefresh;

  final ProviderListenable<AsyncValue<T>> Function({
    required String sessionId,
    required int dataId,
  }) streamDataProvider;

  // final Future<void> Function(T, String) saveAndRelease;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<T>>(
      streamDataProvider(sessionId: sessionId, dataId: dataId),
      (previous, next) {
        final updatedData = next.asData?.value;
        if (updatedData == null) return;
        if (previous == null) {
          return;
        }

        if (previous.asData?.value == null) {
          return;
        }

        final comparable = toComparable(updatedData);
        final previousComparable = toComparable(previous.asData!.value);

        if (comparable == previousComparable) return;

        onRefresh(sessionId, dataId);
      },
    );

    return const SizedBox.shrink();
  }
}
