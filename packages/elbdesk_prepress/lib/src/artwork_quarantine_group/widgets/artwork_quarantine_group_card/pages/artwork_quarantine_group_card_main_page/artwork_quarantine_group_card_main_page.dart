part of '../../artwork_quarantine_group_card.dart';

/// Main page for the Artwork Quarantine Group Card
///
/// This page contains the group management functionality
/// following the EntityCard pattern and includes all data import capabilities
class _ArtworkQuarantineGroupCardMainPage extends HookConsumerWidget {
  const _ArtworkQuarantineGroupCardMainPage({
    required this.stateNotifier,
    required this.initialEntity,
    required this.readOnly,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.sessionId,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.entityId,
  });

  final ArtworkQuarantineGroupState stateNotifier;
  final ArtworkQuarantineGroup initialEntity;
  final bool readOnly;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String sessionId;
  final FocusNode floatingWindowFocus;
  final int? customerId;
  final int entityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SelfScrollableCardItem(
      showRightPadding: true,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              // General card fields at the top
              ArtworkQuarantineGroupGeneral(
                initialEntity: initialEntity,
                stateNotifier: stateNotifier,
                readOnly: readOnly,
                sessionId: sessionId,
                navigatorKey: navigatorKey,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                width: constraints.maxWidth,
              ),
              const AppDivider(),

              // Artworks
              _GroupArtworkList(
                entityId: entityId,
                sessionId: sessionId,
                stateNotifier: stateNotifier,
                readOnly: readOnly,
                floatingWindowFocus: floatingWindowFocus,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
              ),

              // Fixed area at the bottom
              const AppDivider(),

              // Attachments
              if (!readOnly) ...[
                MultiDropAreaAndAttachments(
                  groupId: entityId,
                  sessionId: sessionId,
                  stateNotifier: stateNotifier,
                  customerId: customerId,
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _GroupArtworkList extends StatelessWidget {
  const _GroupArtworkList({
    required this.entityId,
    required this.sessionId,
    required this.stateNotifier,
    required this.readOnly,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.navigatorKey,
  });

  final int entityId;
  final String sessionId;
  final ArtworkQuarantineGroupState stateNotifier;
  final bool readOnly;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              // Scrollable area with Artworks
              ScrollbarTheme(
                data: ScrollbarThemeData(
                  thickness: WidgetStateProperty.all(3),
                  thumbColor: WidgetStateProperty.all(
                    context.appTheme.generalColors.onPrimary
                        .withAppOpacity(0.3),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpace.m),
                    child: _ArtworkWrap(
                      entityId: entityId,
                      sessionId: sessionId,
                      constraints: constraints,
                      stateNotifier: stateNotifier,
                      readOnly: readOnly,
                      floatingWindowFocus: floatingWindowFocus,
                      floatingWindowId: floatingWindowId,
                      navigatorKey: navigatorKey,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ArtworkWrap extends HookConsumerWidget {
  const _ArtworkWrap({
    required this.entityId,
    required this.sessionId,
    required this.constraints,
    required this.stateNotifier,
    required this.readOnly,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.navigatorKey,
  });

  final BoxConstraints constraints;
  final int entityId;
  final String sessionId;
  final ArtworkQuarantineGroupState stateNotifier;
  final bool readOnly;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artworkQuarantines = ref
        .watch(
          artworkQuarantineGroupStateProvider(
            entityId,
            sessionId,
          ).select((state) => state.valueOrNull?.artworkQuarantines ?? []),
        )
        // We have to filter out deletedAt here as well, because there might be
        // a case where the artwork is deleted but the group is not yet saved
        // so the "deletion" was not yet propagated to the backend
        // -> The deleted quarantine is still in state, but we don't want to
        // display it
        .where((a) => a.meta.deletedAt == null)
        .toList()
      ..sort(
        (a, b) => (a.meta.id ?? a.meta.createdAt?.millisecondsSinceEpoch ?? 0)
            .compareTo(
          b.meta.id ?? b.meta.createdAt?.millisecondsSinceEpoch ?? 0,
        ),
      );

    return Align(
      alignment: Alignment.topLeft,
      child: AppWrap(
        spacing: AppSpace.m,
        runSpacing: AppSpace.m,
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: artworkQuarantines.map((artworkQuarantine) {
          final currentIndex =
              artworkQuarantines.indexOf(artworkQuarantine) + 1;

          return SizedBox(
            width: constraints.maxWidth / 2.1,
            child: ArtworkQuarantineTile(
              stateNotifier: stateNotifier,
              artworkQuarantine: artworkQuarantine,
              index: currentIndex,
              entityId: entityId,
              sessionId: sessionId,
              totalArtworks: artworkQuarantines.length,
              readOnly: readOnly,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
              navigatorKey: navigatorKey,
            ),
          );
        }).toList(),
      ),
    );
  }
}
