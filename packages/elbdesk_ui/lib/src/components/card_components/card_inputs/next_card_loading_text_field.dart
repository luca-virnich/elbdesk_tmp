import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class NextCardLoadingTextField extends StatelessWidget {
  const NextCardLoadingTextField({
    required this.labelPosition,
    required this.label,
    this.suffix,
    super.key,
  });
  final NextCardFormFieldLabelPosition labelPosition;
  final String? label;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.cardFieldPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelPosition == NextCardFormFieldLabelPosition.top)
            AppText(label ?? ''),
          Row(
            children: [
              if (labelPosition == NextCardFormFieldLabelPosition.left)
                SizedBox(
                  width: UiConstants.leftLabelWidth,
                  child: label == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: AppText(
                            label!,
                            autoSize: false,
                            height: 1.2,
                            maxLines: 2,
                          ),
                        ),
                ),
              Expanded(
                child: NextLoadingTextField(
                  suffix: suffix,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
