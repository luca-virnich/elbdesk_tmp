import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'window_navigator_provider.g.dart';

@riverpod
GlobalKey<NavigatorState> windowNavigator(Ref ref, String windowId) {
  return GlobalKey<NavigatorState>();
}
