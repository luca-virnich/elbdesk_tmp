import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/soi_einzelformaufbau/_export_soi_einzelformaufbau.dart';
import 'package:elbdesk_sales/src/soi_einzelformaufbau/widgets/soi_einzelformaufbau_card/soi_einzelformaufbau_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingSoiEinzelformaufbauCard extends HookConsumerWidget {
  const FloatingSoiEinzelformaufbauCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingSoiEinzelformaufbauWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return SoiEinzelformaufbauCard(
      entityId: data.entityId,
      customerId: data.customerId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
