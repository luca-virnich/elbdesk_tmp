import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/history/artwork_history_card_item.dart';
import 'package:elbdesk_prepress/src/artwork/widgets/artwork_card/history/artwork_master_log_table.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Artwork History
///
/// This widget shows the Artwork History, which contains the changes to the
/// Artwork Master, and also show the Artworks that are based on it.
class ArtworkHistory extends HookConsumerWidget {
  const ArtworkHistory({
    required this.currentArtwork,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    super.key,
  });
  final Artwork currentArtwork;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final sessionId = useUuid();

    return EntityHistory<Artwork>(
      masterEntityId: currentArtwork.artworkMasterId!,
      // Using existing provider
      historyProvider: fetchArtworkHistoryProvider(
        currentArtwork.artworkMasterId!,
        sessionId,
      ),
      getEntityTitle: (artwork) => artwork.salesOrder!.fullSalesOrderId,
      masterEntityTitle: l10n.gen_history_complete,
      masterEntityIcon: AppIcons.artworkMaster,
      entityIcon: AppIcons.artwork,
      // Using existing card item
      historyCardBuilder: (artwork) => ArtworkHistoryCardItem(
        key: Key(artwork.id.toString()),
        artwork: artwork,
        masterArtworkId: currentArtwork.artworkMasterId!,
        navigatorKey: navigatorKey,
        floatingWindowId: floatingWindowId,
        floatingWindowFocus: floatingWindowFocus,
      ),
      // Using existing master history view
      masterHistoryBuilder: (masterId) => SelfScrollableCardItem(
        child: ArtworkMasterLogTable(
          entityId: masterId,
          tableType: TableType.artworkMaster,
          componentIdentifier: ComponentIdentifier.artworkMasterLogTable,
          isCollapsible: false,
        ),
      ),
    );
  }
}
