import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class NextCardLinkField extends StatelessWidget {
  const NextCardLinkField({
    required this.label,
    required this.onPressed,
    required this.text,
    required this.labelPosition,
    this.tooltipMessage,
    this.showLabel = true,
    super.key,
  });
  final String? label;
  final VoidCallback onPressed;
  final String text;
  final NextCardFormFieldLabelPosition labelPosition;
  final bool showLabel;
  final String? tooltipMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.cardFieldPadding,
      child: SizedBox(
        height: UiConstants.buttonHeight,
        child: Row(
          children: [
            if (labelPosition == NextCardFormFieldLabelPosition.left &&
                showLabel)
              SizedBox(
                width: UiConstants.leftLabelWidth,
                child: label == null
                    ? const SizedBox.shrink()
                    : NextAppFieldLeftLabel(
                        label: label!,
                        maxLines: 1,
                      ),
              ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: AppOpenInNewTextButton(
                  onPressed: onPressed,
                  label: text,
                  tooltipMessage: tooltipMessage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
