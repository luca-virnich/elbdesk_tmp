// import 'package:elbdesk_core/l10n/l10n_extension.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';

// /// A custom save button widget that uses the primary button style.
// ///
// /// The [AppSaveButton] widget is a stateless widget that displays a save button
// /// with an icon and a label. The button uses the primary button style from the
// // ignore: comment_references
// /// [AppButton] class. The label text is localized using the [l10n] extension.
// ///
// /// {@tool snippet}
// /// This example shows how to use [AppSaveButton] in a Flutter application:
// ///
// /// ```dart
// /// AppSaveButton(
// ///   onPressed: () {
// ///     print('Save button pressed');
// ///   },
// /// )
// /// ```
// /// {@end-tool}
// ///
// /// See also:
// ///
// ///  * [AppButton], which is the underlying button widget used.
// ///  * [VoidCallback], which is the type of the callback function.
// class AppSaveButton extends StatelessWidget {
//   /// Creates an [AppSaveButton] widget.
//   ///
//   /// The [onPressed] parameter must not be null.
//   const AppSaveButton({required this.onPressed, super.key});

//   /// The callback function that is called when the button is pressed.
//   final VoidCallback? onPressed;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     return AppButton.primary(
//       onPressed: onPressed,
//       label: l10n.gen_save,
//       iconData: AppIcons.check,
//     );
//   }
// }
