import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'view_insets_provider.g.dart';

@riverpod
class ViewInsets extends _$ViewInsets {
  @override
  EdgeInsets build() {
    return EdgeInsets.zero;
  }

  void updateInsets(EdgeInsets insets) {
    state = insets;
  }
}
