import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A custom suffix button for text fields that allows clearing the text.
///
/// This widget uses hooks to manage its state and animations. It displays a
/// clear icon that becomes visible when the text field is not empty.
class AppTextFieldSuffixClearButton extends HookWidget {
  /// Creates an [AppTextFieldSuffixClearButton].
  ///
  /// The [onPressed] parameter is required.
  /// The [visible] parameter defaults to `true`.
  const AppTextFieldSuffixClearButton({
    required this.onPressed,
    this.visible = true,
    super.key,
  });

  /// The callback function that is called when the button is pressed.
  final VoidCallback? onPressed;

  /// Whether the button is visible.
  final bool visible;

  @override
  Widget build(BuildContext context) {
    final ignorePointer = useState<bool>(true);

    return AnimatedOpacity(
      /// The opacity of the button, which changes based on the [visible]
      /// parameter.
      opacity: visible ? 1 : 0,
      duration: AnimationConstants.shortDuration,
      onEnd: () {
        ignorePointer.value = visible;
      },
      child: IgnorePointer(
        /// Whether to ignore pointer events, based on the [visible] parameter.
        ignoring: !visible,
        child: AppIconButton(
          overlayColor: context.appTheme.generalColors.transparent,
          skipTraversal: true,
          iconData: Icons.cancel,
          color: context.appTheme.textFieldProperties.clearButtonColor,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
