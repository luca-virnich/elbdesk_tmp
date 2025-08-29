import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppCardCheckbox extends StatelessWidget {
  const AppCardCheckbox({
    required this.value,
    required this.onChanged,
    required this.label,
    this.focusOrder,
    this.readOnly = false,
    super.key,
  });
  final bool value;
  final void Function(bool) onChanged;
  final String label;
  final double? focusOrder;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.cardFieldPadding,
      child: SizedBox(
        height: UiConstants.buttonHeight,
        child: Row(
          children: [
            Expanded(child: AppText(label, maxLines: 1)),
            AppCheckbox(
              readOnly: readOnly,
              value: value,
              onChanged: onChanged,
              focusOrder: focusOrder,
            ),
          ],
        ),
      ),
    );
  }
}
