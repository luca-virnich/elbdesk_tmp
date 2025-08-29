import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'floating_window_title_data.freezed.dart';

@freezed
class FloatingWindowTitlebarData with _$FloatingWindowTitlebarData {
  const factory FloatingWindowTitlebarData({
    String? title,
    required String baseTitle,
    IconData? icon,
  }) = _FloatingWindowTitlebarData;

  const FloatingWindowTitlebarData._();

  String titleText(bool showBaseTitle) {
    final hasBaseTitle = baseTitle.isNotEmpty;
    final hasTitle = title != null && title!.isNotEmpty;

    if (showBaseTitle) {
      // When showing base title, prefer to show it with dynamic title if both exist
      if (hasBaseTitle && hasTitle) {
        return '$baseTitle: $title';
      }
      if (hasBaseTitle) {
        return baseTitle;
      }
      if (hasTitle) {
        return title!;
      }
    } else {
      // When not showing base title, only show dynamic title
      if (hasTitle) {
        return title!;
      }
      // Fallback to base title if no dynamic title exists
      if (hasBaseTitle) {
        return baseTitle;
      }
    }

    // Final fallback for windows with no title at all
    return '';
  }

  factory FloatingWindowTitlebarData.empty() =>
      const FloatingWindowTitlebarData(baseTitle: '');
}
