import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

GlobalKey<FormState> useFormKey() {
  return use(const _FormKeyHook());
}

class _FormKeyHook extends Hook<GlobalKey<FormState>> {
  const _FormKeyHook();

  @override
  HookState<GlobalKey<FormState>, Hook<GlobalKey<FormState>>> createState() =>
      _FormKeyHookState();
}

class _FormKeyHookState extends HookState<GlobalKey<FormState>, _FormKeyHook> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initHook() {
    super.initHook();
    _formKey = GlobalKey<FormState>();
  }

  @override
  GlobalKey<FormState> build(BuildContext context) => _formKey;

  @override
  String get debugLabel => 'useFormKey';
}
