import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    required this.value,
    required this.onChanged,
    this.focusOrder,
    this.readOnly = false,
    this.disableSplash = false,
    super.key,
  });
  final bool value;
  final void Function(bool)? onChanged;
  final double? focusOrder;
  final bool readOnly;
  final bool disableSplash;
  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    final generalColors = context.appTheme.generalColors;
    final textFieldProperties = context.appTheme.textFieldProperties;

    return ElbFocusOrderWrapper(
      focusOrderId: focusOrder,
      child: Checkbox(
        splashRadius: disableSplash ? 0 : 15,
        visualDensity: VisualDensity.compact,
        mouseCursor:
            readOnly ? SystemMouseCursors.basic : SystemMouseCursors.click,
        activeColor: generalColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiuses.xs),
        ),
        side: BorderSide(
          color: textFieldProperties.borderColor,
        ),
        checkColor: generalColors.onPrimary,
        value: value,
        onChanged: readOnly
            ? null
            : (v) {
                if (v != null) {
                  onChanged?.call(v);
                }
              },
      ),
    );
  }
}
