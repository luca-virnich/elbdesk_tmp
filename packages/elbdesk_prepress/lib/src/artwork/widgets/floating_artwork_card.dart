import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/config/floating_artwork_window_data.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/artwork_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingArtworkCard extends HookConsumerWidget {
  const FloatingArtworkCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingArtworkWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return ArtworkCard(
      artworkId: data.artworkId,
      customerId: data.customerId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
