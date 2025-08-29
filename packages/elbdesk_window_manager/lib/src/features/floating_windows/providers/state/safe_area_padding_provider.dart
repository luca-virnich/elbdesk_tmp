import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'safe_area_padding_provider.g.dart';

/// Provides the safe area padding from MediaQuery
/// This needs to be updated from a widget that has access to MediaQuery
@riverpod
class SafeAreaPadding extends _$SafeAreaPadding {
  @override
  EdgeInsets build() {
    return EdgeInsets.zero;
  }

  void updatePadding(EdgeInsets padding) {
    state = padding;
  }
}
