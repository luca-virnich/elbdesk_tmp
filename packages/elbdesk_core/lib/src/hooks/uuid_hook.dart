import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

String useUuid() {
  return use(const _UuidHook());
}

class _UuidHook extends Hook<String> {
  const _UuidHook();

  @override
  HookState<String, Hook<String>> createState() => _UuidHookState();
}

class _UuidHookState extends HookState<String, _UuidHook> {
  late final String _uuid;

  @override
  void initHook() {
    super.initHook();
    _uuid = const Uuid().v4();
  }

  @override
  String build(BuildContext context) => _uuid;

  @override
  String get debugLabel => 'useUuid';
}
