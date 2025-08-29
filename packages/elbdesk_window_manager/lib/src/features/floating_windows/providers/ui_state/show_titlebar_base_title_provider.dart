import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_titlebar_base_title_provider.g.dart';

/// Provider to control whether base titles should be shown in title bars and taskbar tiles

@Riverpod(keepAlive: true)
class ShowTitlebarBaseTitle extends _$ShowTitlebarBaseTitle {
  @override
  bool build() => true;

  void update(bool value) {
    state = value;
  }
}
