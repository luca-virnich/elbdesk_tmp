import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A custom save and close button widget that uses the primary button style.
///
/// The [AppSaveAndCloseButton] widget is a stateless widget that displays a
/// save and close button with an icon and a label. The button uses the primary
/// button style from the [AppButton] class. The label text is localized using
// ignore: comment_references
/// the [l10n] extension.
///
/// {@tool snippet}
/// This example shows how to use [AppSaveAndCloseButton] in a Flutter
/// application:
///
/// ```dart
/// AppSaveAndCloseButton(
///   onPressed: () {
///     print('Save and close button pressed');
///   },
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppButton], which is the underlying button widget used.
///  * [VoidCallback], which is the type of the callback function.
class AppSaveAndCloseButton extends StatelessWidget {
  /// Creates an [AppSaveAndCloseButton] widget.
  ///
  /// The [onPressed] parameter must not be null.
  const AppSaveAndCloseButton(
      {required this.onPressed, this.isLoading = false, super.key});

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppButton.primary(
      isLoading: isLoading,
      tooltip: l10n.gen_save_and_close,
      onPressed: onPressed,
      label: l10n.gen_save_and_close,
      iconData: Icons.check,
    );
  }
}
