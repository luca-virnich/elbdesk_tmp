import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A progress indicator that follows the app's theme
class AppProgressIndicator extends StatelessWidget {
  /// Creates an [AppProgressIndicator].
  const AppProgressIndicator({
    required this.progress,
    super.key,
    this.height = 4,
  });

  /// The current progress value between 0.0 and 1.0
  final double progress;

  /// The height of the progress bar
  final double height;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadiuses.m),
      child: LinearProgressIndicator(
        value: progress,
        backgroundColor: generalColors.barrierColor.withAppOpacity(0.1),
        valueColor: AlwaysStoppedAnimation<Color>(generalColors.primary),
        color: generalColors.primary,
        minHeight: height,
      ),
    );
  }
}
