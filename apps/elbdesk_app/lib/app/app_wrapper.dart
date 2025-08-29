import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:elbdesk_app/app/app_dashboard/app_dashboard.dart';
import 'package:elbdesk_app/window_manager_wrapper.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_wrapper.g.dart';

// * KEEPING ALIVE PROVIDERS WHILE LOGGED IN

@riverpod
Future<void> keepAliveProviders(Ref ref) async {
  ref
    ..listen(watchAllLightUsersProvider, (previous, next) {})
    ..listen(cachedLightUserMapByUserInfoIdProvider, (previous, next) {})
    ..listen(cachedLightUserMapByLightUserIdProvider, (previous, next) {})
    ..listen(watchAllActiveLightUsersProvider, (previous, next) {})
    ..listen(currentAppUserStateProvider, (previous, next) {})
    ..listen(fetchAndWatchGlobalSettingsProvider, (previous, next) {});

  await Future.wait([
    ref.read(watchAllLightUsersProvider.future),
    ref.read(watchAllActiveLightUsersProvider.future),
    ref.read(currentAppUserStateProvider.future),
    ref.read(fetchAndWatchGlobalSettingsProvider.future),
  ]);
  ref
    ..read(cachedLightUserMapByUserInfoIdProvider)
    ..read(cachedLightUserMapByLightUserIdProvider);
}

class AppWrapper extends HookConsumerWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isInitialized = useState<bool>(false);
    final notificationStyle = context.appTheme.textStyles.defaultText;
    ref.listen(keepAliveProvidersProvider, (previous, next) {});

    final init = useCallback(
      () async {
        await ref.read(keepAliveProvidersProvider.future);
        isInitialized.value = true;
      },
      [],
    );

    useEffect(
      () {
        init();

        return null;
      },
      [],
    );
    if (!isInitialized.value) {
      return const AppScaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: AppLoadingIndicator(),
        ),
      );
    }

    ref.listen(notificationOverlayStateProvider, (previous, next) {
      if (next is EntityNotificationOvleray) {
        final users = ref.read(watchAllLightUsersProvider).requireValue;
        final parsedMessage = Parser.parseMessageFromDbEntry(
          next.message,
          notificationStyle,
          users,
        );
        if (next.type == EntityNotificationOverlayType.newMessage) {
          AppNotificationOverlay.newEntityNotification(
            context,
            '${l10n.navigation_new_notification_title}:\n${parsedMessage.toPlainText()}',
          );
        } else if (next.type == EntityNotificationOverlayType.updatedMessage) {
          AppNotificationOverlay.updatedEntityNotification(
            context,
            '${l10n.navigation_update_notification_title}:\n${parsedMessage.toPlainText()}',
          );
        }
      }
    });
    return const _DeepLinkHandler(child: AppDashboard());
  }
}

class _DeepLinkHandler extends ConsumerStatefulWidget {
  const _DeepLinkHandler({required this.child});
  final Widget child;

  @override
  ConsumerState<_DeepLinkHandler> createState() => _DeepLinkHandlerState();
}

class _DeepLinkHandlerState extends ConsumerState<_DeepLinkHandler> {
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();

    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();

    super.dispose();
  }

  Future<void> initDeepLinks() async {
    // Handle links
    _linkSubscription = AppLinks().uriLinkStream.listen((uri) {
      // Extract the path from the URI, removing any leading or trailing slashes
      final path = uri.path.replaceAll(RegExp(r'^/|/$'), '');

      if (path.isNotEmpty) {
        //! FIXME
        // ref.read(deeplinkRepositoryProvider).handleDeeplink(path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _Body(child: widget.child);
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // const isRunningWithWasm = bool.fromEnvironment('dart.tool.dart2wasm');

    return WindowManagerWrapper(
      child: child,
    );
  }
}
