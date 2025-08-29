import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/cupertino.dart';

class AppLoadingIndicator extends StatelessWidget {
  /// Creates an [AppLoadingIndicator].
  ///

  const AppLoadingIndicator({
    super.key,
    this.radius = 8,
    this.showBackground = false,
  });

  /// The size of the bouncing dots.
  final double radius;
  final bool showBackground;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return showBackground
        ? Container(
            decoration: BoxDecoration(
              color: generalColors.barrierColor.withAppOpacity(0.1),
              borderRadius: BorderRadius.circular(borderRadiuses.m),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CupertinoActivityIndicator(radius: radius),
            ),
          )
        : CupertinoActivityIndicator(radius: radius);
  }
}
