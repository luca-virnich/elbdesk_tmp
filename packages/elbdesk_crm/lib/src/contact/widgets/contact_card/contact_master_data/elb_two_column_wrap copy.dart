// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';

// class ElbTwoColumnWrap extends StatelessWidget {
//   /// Creates a [TwoColumnWrap].
//   ///
//   /// The [builder] function must not be null and returns the label position and
//   /// the child width.
//   const ElbTwoColumnWrap({
//     required this.builder,
//     required this.width,
//     this.breakpoint = UiConstants.twoColumnWrapBreakpointWidth,
//     this.runSpacing,
//     super.key,
//   });

//   final List<Widget> Function(
//     NextCardFormFieldLabelPosition labelPosition,
//     double childWidth,
//   ) builder;
//   final double width;
//   final double breakpoint;
//   final double? runSpacing;
//   @override
//   Widget build(BuildContext context) {
//     final isTwoColumns = width > breakpoint;
//     final labelPosition = width > 300
//         ? NextCardFormFieldLabelPosition.left
//         : NextCardFormFieldLabelPosition.top;
//     final childWidth = isTwoColumns
//         ? (width - UiConstants.twoColumnWrapHorizontalSpacing) / 2
//         : width;

//     return Wrap(
//       spacing: UiConstants.twoColumnWrapHorizontalSpacing,
//       runSpacing: runSpacing ?? 0,
//       children: builder(labelPosition, childWidth).map((child) {
//         return SizedBox(
//           width: childWidth,
//           child: FocusTraversalGroup(
//             child: child,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

// class ElbTwoColumnWrapItemGroup {
//   ElbTwoColumnWrapItemGroup({required this.items});
//   final List<ElbTwoColumnWrapItem> items;
// }

// enum ElbTwoColumnWrapItemType {
//   text,
//   int,
// }

// class ElbTwoColumnWrapItem {
//   ElbTwoColumnWrapItem._({
//     required this.type,
//     required this.label,
//     this.initialText,
//     this.onTextChanged,
//     this.intValue,
//     this.validator,
//   });

//   factory ElbTwoColumnWrapItem.text({
//     required String label,
//     String? initialText,
//     void Function(String)? onTextChanged,
//     String? Function(String?)? validator,
//   }) {
//     return ElbTwoColumnWrapItem._(
//       type: ElbTwoColumnWrapItemType.text,
//       label: label,
//       initialText: initialText,
//       onTextChanged: onTextChanged,
//       validator: validator,
//     );
//   }

//   factory ElbTwoColumnWrapItem.int({
//     required String label,
//     int? value,
//   }) {
//     return ElbTwoColumnWrapItem._(
//       type: ElbTwoColumnWrapItemType.int,
//       label: label,
//       intValue: value,
//     );
//   }

//   final ElbTwoColumnWrapItemType type;
//   final String label;
//   final String? initialText;
//   final int? intValue;

//   final void Function(String)? onTextChanged;
//   final String? Function(String?)? validator;
// }
