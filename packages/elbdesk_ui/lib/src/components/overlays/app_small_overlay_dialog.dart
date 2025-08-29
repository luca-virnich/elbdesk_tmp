import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A styled small dialog widget intended to be used with [AppSimpleOverlay]
/// as its overlayContent.
class AppSmallOverlayDialog extends StatelessWidget {
  const AppSmallOverlayDialog({
    required this.content,
    this.title,
    this.width,
    super.key,
  });

  /// The content to be shown in the dialog
  final Widget content;

  /// Optional title to show at the top of the dialog
  final String? title;

  /// Optional fixed width for the dialog. Defaults to 300.
  final double? width;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final secondaryButtonStyles = theme.buttonStyles.secondary;

    return Material(
      color: theme.generalColors.transparent,
      child: Container(
        width: width ?? 300,
        decoration: BoxDecoration(
          color: theme.generalColors.background,
          boxShadow: theme.shadows.windowShadow,
          borderRadius: BorderRadius.circular(theme.borderRadiuses.m),
          border: Border.all(
            color: secondaryButtonStyles.borderColor,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (title != null)
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: secondaryButtonStyles.borderColor
                            .withAppOpacity(0.75),
                      ),
                    ),
                  ),
                  child: Center(
                    child: AppText(
                      title!,
                      maxLines: 1,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(AppSpace.s),
                child: content,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
