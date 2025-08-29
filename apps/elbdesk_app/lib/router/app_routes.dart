import 'package:elbdesk_app/app/app_wrapper.dart';
import 'package:elbdesk_app/features/auth/screens/sign_in_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.g.dart';

/// Key for the shell navigator
final GlobalKey<NavigatorState> dashboardNavigatorKey =
    GlobalKey<NavigatorState>();

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
)

/// Initial Route which is shown when the user logged in
class HomeRoute extends GoRouteData {
  /// @nodoc
  const HomeRoute();

  /// @nodoc
  static const path = '/';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage<void>(
      key: state.pageKey,
      restorationId: state.pageKey.value,
      child: const AppWrapper(),
    );
  }
}

@TypedGoRoute<LoginRoute>(
  path: LoginRoute.path,
)

/// Login Route, automatically navigated to when the user is not logged in
class LoginRoute extends GoRouteData {
  /// @nodoc
  const LoginRoute();

  /// @nodoc
  static const path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}
