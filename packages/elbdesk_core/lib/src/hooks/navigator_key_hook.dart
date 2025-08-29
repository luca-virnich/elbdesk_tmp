import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

GlobalKey<NavigatorState> useNavigatorKey() {
  return use(const _NavigatorKeyHook());
}

class _NavigatorKeyHook extends Hook<GlobalKey<NavigatorState>> {
  const _NavigatorKeyHook();

  @override
  HookState<GlobalKey<NavigatorState>, Hook<GlobalKey<NavigatorState>>>
      createState() => _NavigatorKeyHookState();
}

class _NavigatorKeyHookState
    extends HookState<GlobalKey<NavigatorState>, _NavigatorKeyHook> {
  late final GlobalKey<NavigatorState> _navigatorKey;

  @override
  void initHook() {
    super.initHook();
    _navigatorKey = GlobalKey<NavigatorState>();
  }

  @override
  GlobalKey<NavigatorState> build(BuildContext context) => _navigatorKey;

  @override
  String get debugLabel => 'useNavigatorKey';
}
