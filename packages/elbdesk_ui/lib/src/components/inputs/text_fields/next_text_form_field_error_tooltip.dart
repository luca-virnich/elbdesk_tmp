import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class NextTextFormFieldErrorTooltip extends StatelessWidget {
  const NextTextFormFieldErrorTooltip({
    super.key,
    this.errorText,
    this.onClearFn,
  });
  final String? errorText;
  final Null Function()? onClearFn;

  @override
  Widget build(BuildContext context) {
    final statusColors = context.appTheme.statusColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    final clearButton = ElbMouseRegionGestureDetector(
      onTap: onClearFn,
      enabled: onClearFn != null,
      child: ElbIcon(
        AppIcons.cancel,
        color: statusColors.error,
      ),
    );
    if (errorText == null) {
      return clearButton;
    }
    return AppTooltip(
      forceTooltip: true,
      decoration: BoxDecoration(
        color: statusColors.error,
        border: Border.all(
          color: statusColors.error,
        ),
        borderRadius: BorderRadius.circular(borderRadiuses.xs),
      ),
      preferBelow: false,
      message: errorText,
      textStyle: TextStyle(
        color: statusColors.onError,
      ),
      child: clearButton,
    );
  }
}
