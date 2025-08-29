import 'dart:async';

import 'package:elbdesk_app/router/app_routes.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_auth_client/serverpod_auth_client.dart';

part 'app_router.g.dart';

@riverpod
class AppRouterPath extends _$AppRouterPath {
  @override
  String build() {
    ref.keepAlive();
    return '/';
  }

  void updatePath(String path) {
    state = path;
  }
}

/// Router for the application
@riverpod
GoRouter appRouter(Ref ref) {
  final authUserNotifier =
      ValueNotifier<UserInfo?>(ref.read(authUserStateProvider));

  ref.listen(authUserStateProvider, (prev, next) {
    authUserNotifier.value = next;
  });

  return GoRouter(
    routerNeglect: true,
    navigatorKey: AppNavigatorKeys.appRootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: Listenable.merge([
      authUserNotifier,
    ]),
    initialLocation: HomeRoute.path,
    redirect: (context, state) async {
      final path = state.uri.path;

      //user is not logged in
      if (authUserNotifier.value == null) {
        return LoginRoute.path;
      }

      if (authUserNotifier.value != null && path == LoginRoute.path) {
        return HomeRoute.path;
      }
      unawaited(
        Future.microtask(() {
          ref.read(appRouterPathProvider.notifier).updatePath(path);
        }),
      );

      return null;
    },
    routes: $appRoutes,
  );
}
