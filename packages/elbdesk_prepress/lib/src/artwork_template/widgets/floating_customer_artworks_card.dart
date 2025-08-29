import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_template/config/floating_artwork_template_window_data.dart';
import 'package:elbdesk_prepress/src/artwork_template/widgets/artwork_template_card/artwork_template_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FloatingCustomerArtworksCard extends HookConsumerWidget {
  const FloatingCustomerArtworksCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingArtworkTemplateWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(data.floatingWindowId));
    return ArtworkTemplateCard(
      artworkTemplateId: data.artworkTemplateId,
      customerId: data.customerId,
      preSelectionId: data.preSelectionId,
      selectionId: data.selectionId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowFocus: floatingWindowFocus,
      floatingWindowType: data.windowType,
    );
  }
}
