// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher_string.dart';

// /// A custom text field widget for phone number input based on the
// /// [AppRawTextField] widget.
// ///
// /// This widget uses a [TextEditingController] to manage the input text and a
// /// [FocusNode] to manage the focus state. It also includes a suffix button for
// /// initiating a phone call.
// class AppPhoneTextField extends StatelessWidget {
//   /// Creates an [AppPhoneTextField].
//   ///
//   /// The [controller], [focusNode], and [labelText] parameters are required.
//   const AppPhoneTextField({
//     required this.controller,
//     required this.focusNode,
//     required this.labelText,
//     super.key,
//   });

//   /// The focus node for managing focus state.
//   final FocusNode focusNode;

//   /// The controller for managing the input text.
//   final TextEditingController controller;

//   /// The label text to display for the input field.
//   final String labelText;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: AppRawTextField(
//             /// Input formatters to apply to the input field.
//             inputFormatters: [
//               PhoneInputFormatter(),
//             ],
//             focusNode: focusNode,
//             controller: controller,
//             labelText: labelText,
//           ),
//         ),
//         AppTextFieldOutsideSuffixButton(
//           tooltip: 'Call'.hc,
//           iconData: Icons.call,
//           onPressed: () {
//             final tel = controller.text.trim();

//             if (tel.isNotEmpty) {
//               launchUrlString('tel:$tel');
//             }
//           },
//         ),
//       ],
//     );
//   }
// }

// /// A custom input formatter for phone numbers.
// ///
// /// This formatter ensures that the input text matches a specific phone number
// /// pattern.
// class PhoneInputFormatter extends TextInputFormatter {
//   /// A regular expression to match valid phone numbers.
//   final regex = RegExp(r'^(?! )[+]?([0-9][0-9 -]*|[0-9-]*)$');

//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     if (newValue.text.isEmpty) {
//       return newValue;
//     }
//     if (regex.hasMatch(newValue.text)) {
//       return newValue;
//     }
//     return oldValue;
//   }
// }
