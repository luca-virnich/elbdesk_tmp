import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A custom suffix button for text fields that can be placed inside the text
/// field.
///
/// This widget allows you to provide an icon button with the specified icon
/// data and callback function. It also supports skipping traversal for the
/// focus node.
class AppTextFieldInsideSuffixButton extends StatelessWidget {
  /// Creates an [AppTextFieldInsideSuffixButton].
  ///
  /// The [iconData] and [onPressed] parameters are required.
  /// The [skipTraversal] parameter defaults to `true`.
  const AppTextFieldInsideSuffixButton({
    required this.iconData,
    required this.onPressed,
    this.skipTraversal = true,
    super.key,
  });

  /// The icon data to display inside the button.
  final IconData iconData;

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether to skip traversal for the focus node.
  final bool skipTraversal;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      /// The overlay color of the button, set to transparent.
      overlayColor: context.appTheme.generalColors.transparent,

      /// Whether to skip traversal for the focus node.
      skipTraversal: skipTraversal,

      /// The icon data to display inside the button.
      iconData: iconData,

      /// The callback function that is called when the button is pressed.
      onPressed: onPressed,
    );
  }
}
