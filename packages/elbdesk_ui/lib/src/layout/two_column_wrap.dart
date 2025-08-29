import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Use for placing widgets in a two column layout. Mainly used in
/// cards
@Deprecated('Use [ElbTwoColumnWrap] instead')
class TwoColumnWrap extends StatelessWidget {
  /// Creates a [TwoColumnWrap].
  ///
  /// The [builder] function must not be null and returns the label position and
  /// the child width.
  @Deprecated('Use [ElbTwoColumnWrap] instead')
  const TwoColumnWrap({
    required this.builder,
    required this.width,
    this.breakpoint = UiConstants.twoColumnWrapBreakpointWidth,
    this.runSpacing,
    super.key,
  });

  final List<Widget> Function(
    NextCardFormFieldLabelPosition labelPosition,
    double childWidth,
  ) builder;
  final double width;
  final double breakpoint;
  final double? runSpacing;
  @override
  Widget build(BuildContext context) {
    final isTwoColumns = width > breakpoint;
    final labelPosition = width > 300
        ? NextCardFormFieldLabelPosition.left
        : NextCardFormFieldLabelPosition.top;
    final childWidth = isTwoColumns
        ? (width - UiConstants.twoColumnWrapHorizontalSpacing) / 2
        : width;

    return Wrap(
      spacing: UiConstants.twoColumnWrapHorizontalSpacing,
      runSpacing: runSpacing ?? 0,
      children: builder(labelPosition, childWidth).map((child) {
        return SizedBox(
          width: childWidth,
          child: child,
        );
      }).toList(),
    );
  }
}

// class ThreeColumnWrap extends StatelessWidget {
//   const ThreeColumnWrap({
//     required this.builder,
//     required this.width,
//     super.key,
//   });

//   final List<Widget> Function(
//     AppTextFieldLabelPosition labelPosition,
//     double childWidth,
//   ) builder;
//   final double width;

//   @override
//   Widget build(BuildContext context) {
//     final isThreeColumns = width > 900;
//     final labelPosition = width > 300
//         ? AppTextFieldLabelPosition.left
//         : AppTextFieldLabelPosition.top;
//     final childWidth = isThreeColumns
//         ? (width - UiConstants.twoColumnWrapHorizontalSpacing * 2) / 3
//         : width;

//     return Wrap(
//       spacing: UiConstants.twoColumnWrapHorizontalSpacing,
//       children: builder(labelPosition, childWidth).map((child) {
//         return SizedBox(
//           width: childWidth,
//           child: child,
//         );
//       }).toList(),
//     );
//   }
// }
