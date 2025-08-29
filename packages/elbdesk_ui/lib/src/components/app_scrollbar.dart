import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppScrollbar extends HookWidget {
  const AppScrollbar({
    required this.controller,
    required this.child,
    super.key,
  });
  final ScrollController controller;
  final Widget child;

  static final isMobile = ElbDeskPlatformInfo.isMobileDevice;
  @override
  Widget build(BuildContext context) {
    final appColors = context.appTheme.generalColors;
    return child;

    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          crossAxisMargin: 0,
          mainAxisMargin: 2,
          thumbColor: WidgetStateProperty.all(appColors.divider),
          trackColor: WidgetStateProperty.all(Colors.transparent),
          trackBorderColor: WidgetStateProperty.all(Colors.transparent),
          thickness: WidgetStateProperty.all(isMobile ? 2 : 6),
          radius: const Radius.circular(3),
          thumbVisibility: WidgetStateProperty.all(true),
          trackVisibility: WidgetStateProperty.all(false),
        ),
      ),
      child: Scrollbar(
        controller: controller,
        child: child,
      ),
    );
  }
}

class TableScrollbar extends HookWidget {
  const TableScrollbar({
    required this.controller,
    required this.child,
    super.key,
  });
  final ScrollController controller;
  final Widget child;

  static final isMobile = ElbDeskPlatformInfo.isMobileDevice;
  @override
  Widget build(BuildContext context) {
    final appColors = context.appTheme.generalColors;

    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: appScrollbarTheme,
      ),
      child: Scrollbar(
        controller: controller,
        child: child,
      ),
    );
  }
}
