import 'package:elbdesk_prepress/src/artwork_quarantine_group/config/floating_artwork_quarantine_group_window_data.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/artwork_quarantine_group_card.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Floating Artwork Quarantine Group Card
///
/// Wrapper for displaying artwork quarantine group details in a floating window
class FloatingArtworkQuarantineGroupCard extends HookConsumerWidget {
  const FloatingArtworkQuarantineGroupCard({
    required this.data,
    super.key,
  });

  /// The data for the floating window
  final FloatingArtworkQuarantineGroupWindowData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ArtworkQuarantineGroupCard(
      artworkQuarantineGroupId: data.groupId,
      initialCustomerId: data.customerId,
      floatingWindowId: data.floatingWindowId,
      floatingWindowType: data.windowType,
      initialNoteId: data.initialNoteId,
      initialNoteParentId: data.initialNoteParentId,
    );
  }
}
