import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/providers.dart';

/// A title widget for the title bar that handles dynamic titles
class TitleBarTitle extends ConsumerWidget {
  const TitleBarTitle({super.key, required this.windowId, required this.color});

  final Color color;
  final String windowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titlebarData = ref.watch(floatingWindowTitleStateProvider(windowId));
    final showBaseTitle = ref.watch(showTitlebarBaseTitleProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (titlebarData.icon != null) ...[
          Icon(titlebarData.icon, color: color),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            titlebarData.titleText(showBaseTitle),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: color, fontSize: 15),
          ),
        ),
      ],
    );
  }
}
