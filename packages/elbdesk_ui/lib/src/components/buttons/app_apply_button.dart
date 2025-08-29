import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/src/components/buttons/_export_buttons.dart';
import 'package:flutter/material.dart';

/// A custom apply button widget that uses the primary button style.
///
/// The [AppApplyButton] widget is a stateless widget that displays an apply
/// button with an icon and a label. The button uses the primary button style
// ignore: comment_references
/// from the [AppButton] class. The label text is localized using the [l10n]
/// extension.
///
/// {@tool snippet}
/// This example shows how to use [AppApplyButton] in a Flutter application:
///
/// ```dart
/// AppApplyButton(
///   onPressed: () {
///     print('Apply button pressed');
///   },
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppButton], which is the underlying button widget used.
///  * [VoidCallback], which is the type of the callback function.
class AppApplyButton extends StatelessWidget {
  /// Creates an [AppApplyButton] widget.
  ///
  /// The [onPressed] parameter must not be null.
  const AppApplyButton({
    required this.onPressed,
    this.label,
    this.showLabel = true,
    this.isLoading = false,
    super.key,
  });

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;
  final bool showLabel;
  final bool isLoading;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppButton.primary(
      iconPosition: AppButtonIconPosition.rightInside,
      isLoading: isLoading,
      onPressed: isLoading ? null : onPressed,
      label: showLabel ? label ?? l10n.gen_apply : null,
      tooltip: l10n.gen_apply,
      iconData: Icons.check,
    );
  }
}
