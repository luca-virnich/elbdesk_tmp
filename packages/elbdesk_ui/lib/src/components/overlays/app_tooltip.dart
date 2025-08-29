import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A customizable tooltip widget that respects user tooltip preferences.
///
/// Displays a tooltip when hovering over the child widget, unless tooltips
/// are disabled in settings or the message is empty. Use [forceTooltip] to
/// override user preferences and always show the tooltip.
class AppTooltip extends ConsumerWidget {
  const AppTooltip({
    required this.message,
    required this.child,
    this.forceTooltip = false,
    super.key,
    this.waitDuration,
    this.preferBelow,
    this.showTooltip = true,
    this.decoration,
    this.textStyle,
  });

  final String? message;
  final Widget child;
  final Duration? waitDuration;
  final bool? preferBelow;
  final bool showTooltip;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;

  /// If true, the tooltip will be shown even if the user has disabled
  /// tooltips in the settings.
  final bool forceTooltip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTooltipProvider = ref.watch(tooltipStateProvider);
    final borderRadiuses = context.appTheme.borderRadiuses;
    final generalColors = context.appTheme.generalColors;

    if ((!showTooltipProvider && !forceTooltip) ||
        message == null ||
        message!.trim().isEmpty ||
        !showTooltip) {
      return child;
    }

    return Tooltip(
      message: message,
      waitDuration: waitDuration ?? const Duration(milliseconds: 750),
      preferBelow: preferBelow,
      decoration: decoration ??
          BoxDecoration(
            color: generalColors.tooltipBackground,
            borderRadius: BorderRadius.circular(borderRadiuses.s),
          ),
      textStyle: textStyle ?? context.appTheme.textStyles.tooltipStyle,
      child: child,
    );
  }
}
