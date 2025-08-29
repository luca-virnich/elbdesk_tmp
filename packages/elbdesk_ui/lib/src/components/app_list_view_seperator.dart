import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppListViewSeperator extends StatelessWidget {
  const AppListViewSeperator.divider({super.key, this.height})
      : showDivider = true;

  const AppListViewSeperator.space({super.key, this.height})
      : showDivider = false;

  final bool showDivider;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return showDivider
        ? AppDivider(
            height: height ?? 32,
          )
        : SizedBox(height: height ?? 12);
  }
}
