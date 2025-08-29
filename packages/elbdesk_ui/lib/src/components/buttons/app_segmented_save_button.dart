// TODO(all): Delete or refactor

// import 'package:elbdesk_core/l10n/l10n_extension.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:elbdesk_ui/src/atoms/buttons/_export_buttons.dart';
// import 'package:elbdesk_ui/src/atoms/buttons/segmented_actions_button.dart';
// import 'package:flutter/material.dart';

// /// A custom save and close button widget that uses the primary button style.
// ///
// /// The [AppSegmentedSaveButton] widget is a stateless widget that displays a
// /// segmented button with two actions: save and save-and-close. The button uses
// /// the primary button style from the [SegmentedActionsButton] class. The label
// /// text is localized using the `l10n` extension.
// ///
// /// {@tool snippet}
// /// This example shows how to use [AppSegmentedSaveButton] in a Flutter
// /// application:
// ///
// /// ```dart
// /// AppSegmentedSaveButton(
// ///   onSavePressed: () {
//     print('Save button pressed');
// ///   },
// ///   onSaveAndClosePressed: () {
// ///     print('Save and close button pressed');
// ///   },
// /// )
// /// ```
// /// {@end-tool}
// ///
// /// See also:
// ///
// ///  * [SegmentedActionsButton], which is the underlying button widget used.
// ///  * [VoidCallback], which is the type of the callback function.

// @Deprecated('Use SegmentedAppButton instead')
// class AppSegmentedSaveButton extends StatelessWidget {
//   /// Creates an [AppSegmentedSaveButton] widget.
//   ///
//   /// The [onSavePressed] and [onSaveAndClosePressed] parameters must not be
//   /// null.
//   @Deprecated('Use SegmentedAppButton instead')
//   const AppSegmentedSaveButton({
//     required this.onSavePressed,
//     required this.onSaveAndClosePressed,
//     this.isLoading = false,
//     super.key,
//   });

//   /// The callback function that is called when the save button is pressed.
//   final VoidCallback? onSavePressed;

//   /// The callback function that is called when the save-and-close button is
//   /// pressed.
//   final VoidCallback? onSaveAndClosePressed;

//   /// Whether the button is in a loading state.
//   final bool isLoading;

//   @override
//   Widget build(BuildContext context) {
//     // Retrieve the localized strings from the context.
//     final l10n = context.l10n;

//     // Return a segmented actions button with two action segments.
//     return SegmentedActionsButton.primary(
//       isLoading: isLoading,
//       actions: [
//         // The save action segment with an icon and tooltip.
//         ActionSegment(
//           tooltip: l10n.gen_save,
//           iconData: Icons.save,
//           icon: const Icon(Icons.save),
//           onPressed: onSavePressed,
//         ),
//         // The save-and-close action segment with a label and icon.
//         ActionSegment(
//           label: l10n.gen_save_and_close,
//           iconData: Icons.check,
//           iconAlignment: IconAlignment.end,
//           onPressed: onSaveAndClosePressed,
//         ),
//       ],
//     );
//   }
// }
