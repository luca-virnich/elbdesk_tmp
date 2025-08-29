import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class NextCardMultiField extends StatelessWidget {
  const NextCardMultiField({
    required this.label,
    required this.labelPosition,
    required this.fields,
    super.key,
  });
  final String label;
  final NextCardFormFieldLabelPosition labelPosition;
  final List<Widget> fields;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelPosition == NextCardFormFieldLabelPosition.top) AppText(label),
        Row(
          children: [
            if (labelPosition == NextCardFormFieldLabelPosition.left)
              SizedBox(
                width: UiConstants.leftLabelWidth,
                child: NextAppFieldLeftLabel(
                  label: label,
                  maxLines: 1,
                ),
              ),
            Expanded(
              child: Row(
                spacing: UiConstants.defaultPadding,
                children: fields.map((e) => Expanded(child: e)).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
