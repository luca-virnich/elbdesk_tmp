import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A reusable fullscreen loading overlay with a semi-transparent background,
/// displaying title, description, progress, and an optional cancel button.
class AppFullscreenLoadingOverlay extends StatelessWidget {
  /// Creates an AppFullscreenLoadingOverlay.
  const AppFullscreenLoadingOverlay({
    required this.title,
    super.key,
    this.description,
    this.progress,
    this.onCancel,
    this.maxWidth = 900,
    this.backgroundColor,
    this.alignment = Alignment.center,
    this.verticalAlignmentFactor = 0.8,
  });

  /// The title text displayed at the top.
  final String title;

  /// Optional descriptive text displayed below the title.
  final String? description;

  /// Optional progress value (0.0 to 1.0) for the progress indicator.
  final double? progress;

  /// Callback triggered when the cancel button is pressed.
  /// If null, the cancel button is not displayed.
  final VoidCallback? onCancel;

  /// The maximum width of the overlay content.
  final double maxWidth;

  /// The background color of the overlay container.
  /// Defaults to the theme's background color with 90% opacity.
  final Color? backgroundColor;

  /// The alignment of the overlay within the screen.
  final Alignment alignment;

  /// A factor to lerp between topCenter and center for vertical alignment.
  /// 0.0 aligns to topCenter, 1.0 aligns to center.
  final double verticalAlignmentFactor;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final effectiveAlignment = AlignmentGeometry.lerp(
      Alignment.topCenter,
      alignment,
      verticalAlignmentFactor,
    )!;
    final effectiveBackgroundColor = backgroundColor ??
        context.appTheme.generalColors.background.withAppOpacity(0.9);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title text
        AppText(
          title,
          style: context.appTheme.textStyles.h2,
          textAlign: TextAlign.center,
        ),
        // Spacing
        const SizedBox(
          height: AppSpace.m,
        ),
        // Optional Description
        if (description != null) ...[
          ConstrainedBox(
            constraints: const BoxConstraints(
              // Ensure minimum height even if description is short
              minHeight: 60,
            ),
            child: Center(
              child: AppText(
                description!,
                style: context.appTheme.textStyles.defaultText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // Spacing
          const SizedBox(
            height: AppSpace.l,
          ),
        ],
        // Progress Indicator
        if (progress != null) ...{
          AppProgressIndicator(
            progress: progress!,
          ),
        } else ...{
          const AppLoadingIndicator(),
        },
        // Spacing
        const SizedBox(
          height: AppSpace.l,
        ),
        // Optional Cancel Button
        if (onCancel != null)
          AppButton.secondary(
            label: l10n.gen_cancel,
            onPressed: onCancel,
          ),
      ],
    );
  }
}
