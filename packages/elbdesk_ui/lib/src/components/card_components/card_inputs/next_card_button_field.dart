// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:uuid/uuid.dart';

// class NextCardButtonField extends StatelessWidget {
//   const NextCardButtonField({
//     required this.labelPosition,
//     required this.readOnly,
//     required this.label,
//     required this.validationGroupId,
//     required this.onPressed,
//     required this.buttonLabel,
//     this.controller,
//     this.buttonIconData,
//     this.showLabel = true,
//     this.focusNode,
//     this.focusOrder,
//     this.validator,
//     this.onChanged,
//     this.onClear,
//     this.editable = true,
//     super.key,
//   });
//   final String? label;

//   /// Position of the label (top or left)
//   final NextCardFormFieldLabelPosition labelPosition;

//   /// Whether the field and button should be disabled
//   final bool readOnly;

//   /// Whether the text field should be editable
//   final bool editable;

//   /// Validation group identifier for form validation
//   final String? validationGroupId;

//   /// Callback when button is pressed
//   final VoidCallback? onPressed;

//   /// Text to display on the button
//   final String buttonLabel;

//   /// Optional icon to display on the button
//   final IconData? buttonIconData;

//   /// Text controller for the text field
//   final TextEditingController? controller;

//   /// Whether to show the label
//   final bool showLabel;

//   /// Focus node for the text field
//   final FocusNode? focusNode;

//   /// Focus order for tab navigation
//   final double? focusOrder;

//   /// Validator function for the text field
//   final String? Function(String?)? validator;

//   /// Callback when text field value changes
//   final void Function(String)? onChanged;

//   /// Callback when clear button is pressed
//   final void Function(String?)? onClear;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: NextCardFormField.text(
//             label: label,
//             labelPosition: labelPosition,
//             readOnly: readOnly || !editable,
//             validationGroup: validationGroupId,
//             onChanged: onChanged,
//             controller: controller,
//             validator: validator,
//             onClear: onClear,
//             focusNode: focusNode,
//             focusOrder: focusOrder,
//           ),
//         ),
//         const SizedBox(width: 8),
//         AppButton.secondary(
//           onPressed: readOnly ? null : onPressed,
//           label: buttonLabel,
//           iconData: buttonIconData,
//         ),
//       ],
//     );
//   }
// }

// /// A card form field that displays a text field with a button
// class NextCardButtonField1 extends HookWidget {
//   const NextCardButtonField1({
//     required this.labelPosition,
//     required this.readOnly,
//     required this.label,
//     required this.validationGroupId,
//     required this.onPressed,
//     required this.buttonLabel,
//     this.controller,
//     this.buttonIconData,
//     this.showLabel = true,
//     this.focusNode,
//     this.focusOrder,
//     this.validator,
//     this.onChanged,
//     this.onClear,
//     this.editable = true,
//     super.key,
//   });

//   /// The label text for the field
//   final String? label;

//   /// Position of the label (top or left)
//   final NextCardFormFieldLabelPosition labelPosition;

//   /// Whether the field and button should be disabled
//   final bool readOnly;

//   /// Whether the text field should be editable
//   final bool editable;

//   /// Validation group identifier for form validation
//   final String? validationGroupId;

//   /// Callback when button is pressed
//   final VoidCallback? onPressed;

//   /// Text to display on the button
//   final String buttonLabel;

//   /// Optional icon to display on the button
//   final IconData? buttonIconData;

//   /// Text controller for the text field
//   final TextEditingController? controller;

//   /// Whether to show the label
//   final bool showLabel;

//   /// Focus node for the text field
//   final FocusNode? focusNode;

//   /// Focus order for tab navigation
//   final double? focusOrder;

//   /// Validator function for the text field
//   final String? Function(String?)? validator;

//   /// Callback when text field value changes
//   final void Function(String)? onChanged;

//   /// Callback when clear button is pressed
//   final void Function(String?)? onClear;

//   @override
//   Widget build(BuildContext context) {
//     final containerKey = useMemoized(GlobalKey.new, []);

//     return _Field(
//       key: containerKey,
//       labelPosition: labelPosition,
//       readOnly: readOnly,
//       editable: editable,
//       label: label,
//       showLabel: showLabel,
//       containerKey: containerKey,
//       validationGroup: validationGroupId,
//       focusNode: focusNode,
//       focusOrder: focusOrder,
//       onPressed: onPressed,
//       buttonLabel: buttonLabel,
//       buttonIconData: buttonIconData,
//       controller: controller,
//       validator: validator,
//       onChanged: onChanged,
//       onClear: onClear,
//     );
//   }
// }

// class _Field extends StatefulWidget {
//   const _Field({
//     required this.labelPosition,
//     required this.readOnly,
//     required this.editable,
//     required this.label,
//     required this.validationGroup,
//     required this.showLabel,
//     required this.containerKey,
//     required this.onPressed,
//     required this.buttonLabel,
//     this.buttonIconData,
//     this.controller,
//     this.focusNode,
//     this.focusOrder,
//     this.validator,
//     this.onChanged,
//     this.onClear,
//     super.key,
//   });

//   final String? label;
//   final NextCardFormFieldLabelPosition labelPosition;
//   final bool readOnly;
//   final bool editable;
//   final String? validationGroup;
//   final bool showLabel;
//   final GlobalKey containerKey;
//   final FocusNode? focusNode;
//   final double? focusOrder;
//   final VoidCallback? onPressed;
//   final String buttonLabel;
//   final IconData? buttonIconData;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//   final void Function(String)? onChanged;
//   final void Function(String?)? onClear;

//   @override
//   State<_Field> createState() => _FieldState();
// }

// class _FieldState extends State<_Field> {
//   late final TextEditingController localController;

//   @override
//   void initState() {
//     super.initState();
//     localController = widget.controller ?? TextEditingController();
//   }

//   @override
//   void dispose() {
//     if (widget.controller == null) {
//       localController.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final buttonField = Padding(
//       padding: UiConstants.cardFieldPadding,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (widget.labelPosition == NextCardFormFieldLabelPosition.top)
//             AppText(widget.label ?? ''),
//           SizedBox(
//             height: UiConstants.buttonHeight,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 if (widget.labelPosition ==
//                         NextCardFormFieldLabelPosition.left &&
//                     widget.showLabel)
//                   SizedBox(
//                     width: UiConstants.leftLabelWidth,
//                     child: widget.label == null
//                         ? const SizedBox.shrink()
//                         : NextAppFieldLeftLabel(
//                             label: widget.label!,
//                             maxLines: 1,
//                           ),
//                   ),
//                 Expanded(
//                   child: ExcludeFocus(
//                     child: _TextFormField(
//                       controller: localController,
//                       validator: widget.validator,
//                       onChanged: widget.onChanged,
//                       onClear: widget.onClear,
//                       focusNode: widget.focusNode,
//                       readOnly: widget.readOnly,
//                       editable: widget.editable,
//                       validationGroup: widget.validationGroup,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 _Button(
//                   onPressed: widget.readOnly ? null : widget.onPressed,
//                   buttonLabel: widget.buttonLabel,
//                   buttonIconData: widget.buttonIconData,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );

//     if (widget.focusOrder != null) {
//       return ElbFocusOrderWrapper(
//         focusOrderId: widget.focusOrder,
//         child: buttonField,
//       );
//     }
//     return buttonField;
//   }
// }

// class _TextFormField extends StatefulWidget {
//   const _TextFormField({
//     required this.controller,
//     this.validator,
//     this.onChanged,
//     this.onClear,
//     this.focusNode,
//     this.readOnly = false,
//     this.editable = true,
//     this.validationGroup,
//   });

//   final TextEditingController controller;
//   final String? Function(String?)? validator;
//   final void Function(String)? onChanged;
//   final void Function(String?)? onClear;
//   final FocusNode? focusNode;
//   final bool readOnly;
//   final bool editable;
//   final String? validationGroup;

//   @override
//   State<_TextFormField> createState() => _TextFormFieldState();
// }

// class _TextFormFieldState extends State<_TextFormField> {
//   late final String fieldId;
//   bool hadErrorOnce = false;

//   @override
//   void initState() {
//     super.initState();
//     fieldId = const Uuid().v4();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: (context, ref, child) {
//         return FormField<String>(
//           validator: (value) {
//             final result = widget.validator?.call(value);

//             if (widget.validationGroup != null) {
//               if (result != null) {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   if (!context.mounted) return;
//                   ref
//                       .read(
//                         validationGroupProvider(widget.validationGroup!)
//                             .notifier,
//                       )
//                       .add(fieldId);
//                 });
//               } else {
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   if (!context.mounted) return;
//                   ref
//                       .read(
//                         validationGroupProvider(widget.validationGroup!)
//                             .notifier,
//                       )
//                       .remove(fieldId);
//                 });
//               }
//             }
//             return result;
//           },
//           initialValue: widget.controller.text,
//           autovalidateMode: hadErrorOnce
//               ? AutovalidateMode.onUserInteraction
//               : AutovalidateMode.onUnfocus,
//           builder: (fieldState) {
//             if (fieldState.hasError && !hadErrorOnce) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 setState(() {
//                   if (context.mounted) {
//                     hadErrorOnce = true;
//                   }
//                 });
//               });
//             }

//             return NextTextField(
//               controller: widget.controller,
//               focusNode: widget.focusNode,
//               readOnly: widget.readOnly || !widget.editable,
//               hasError: fieldState.hasError,
//               onChanged: (value) {
//                 widget.onChanged?.call(value);
//                 fieldState.didChange(value);
//               },
//               onSubmitted: (value) {
//                 fieldState.didChange(value);
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class _Button extends StatelessWidget {
//   const _Button({
//     required this.onPressed,
//     required this.buttonLabel,
//     this.buttonIconData,
//   });

//   final VoidCallback? onPressed;
//   final String buttonLabel;
//   final IconData? buttonIconData;

//   @override
//   Widget build(BuildContext context) {
//     return AppButton.secondary(
//       onPressed: onPressed,
//       label: buttonLabel,
//       iconData: buttonIconData,
//     );
//   }
// }
