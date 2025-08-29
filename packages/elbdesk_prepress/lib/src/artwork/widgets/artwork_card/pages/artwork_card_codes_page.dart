part of '../artwork_card.dart';

/// Widget that displays all artwork codes and allows adding new ones
class _ArtworkCardCodesPage extends HookConsumerWidget {
  const _ArtworkCardCodesPage({
    required this.entityId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.readOnly,
    required this.stateNotifier,
  });

  final int entityId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final bool readOnly;
  final ArtworkState stateNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codes = ref.watch(
      artworkStateProvider(entityId, sessionId)
          .select((value) => value.requireValue.codes),
    );

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return ArtworkCodesView(
          stateNotifier: stateNotifier,
          maxWidth: constraints.maxWidth,
          inHistory: false,
          navigatorKey: navigatorKey,
          floatingWindowFocus: floatingWindowFocus,
          floatingWindowId: floatingWindowId,
          readOnly: readOnly,
          codes: codes,
          componentIdentifier: ComponentIdentifier.artworkCardCodesPage,
        );
      },
    );
  }
}

/// Widget that displays the appropriate code view based on the artwork code
/// type
