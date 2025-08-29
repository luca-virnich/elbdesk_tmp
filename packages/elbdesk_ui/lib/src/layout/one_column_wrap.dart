import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class OneColumnWrap extends StatelessWidget {
  const OneColumnWrap({
    required this.builder,
    required this.width,
    super.key,
  });

  final Widget Function(
    NextCardFormFieldLabelPosition labelPosition,
    double childWidth,
  ) builder;
  final double width;

  @override
  Widget build(BuildContext context) {
    final isTwoColumns = width > UiConstants.twoColumnWrapBreakpointWidth;
    final labelPosition = width > 300
        ? NextCardFormFieldLabelPosition.left
        : NextCardFormFieldLabelPosition.top;
    final childWidth = isTwoColumns
        ? (width - UiConstants.twoColumnWrapHorizontalSpacing) / 2
        : width;

    return builder(labelPosition, childWidth);
  }
}
