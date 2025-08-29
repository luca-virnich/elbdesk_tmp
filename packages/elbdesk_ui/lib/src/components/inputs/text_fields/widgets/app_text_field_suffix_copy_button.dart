import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A custom suffix button for text fields that allows copying text to the
/// clipboard.
///
/// This widget uses hooks to manage its state and animations. It displays a
/// copy icon initially, which changes to a check icon upon pressing.
class AppTextFieldSuffixCopyButton extends HookWidget {
  /// Creates an [AppTextFieldSuffixCopyButton].
  ///
  /// The [onPressed] parameter is required.
  /// The [visible] parameter defaults to `true`.
  const AppTextFieldSuffixCopyButton({
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
    final isFirstIcon = useState<bool>(true);
    final textFieldProperties = context.appTheme.textFieldProperties;

    return MouseRegion(
      onExit: (event) {
        isFirstIcon.value = true;
      },
      child: AnimatedOpacityOffstage(
        visible: visible,
        onEnd: () {
          ignorePointer.value = visible;
        },
        child: IgnorePointer(
          ignoring: !visible,
          child: AnimatedSwitcher(
            duration: AnimationConstants.shortDuration,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: isFirstIcon.value
                ? AppIconButton(
                    key: const ValueKey<int>(0),
                    overlayColor: context.appTheme.generalColors.transparent,
                    skipTraversal: true,
                    iconData: Icons.content_copy,
                    color: textFieldProperties.clearButtonColor,
                    onPressed: () {
                      isFirstIcon.value = false;
                      onPressed?.call();
                    },
                  )
                : AppIconButton(
                    key: const ValueKey<int>(1),
                    overlayColor: context.appTheme.generalColors.transparent,
                    skipTraversal: true,
                    iconData: Icons.check,
                    color: textFieldProperties.successButtonColor,
                    onPressed: () {
                      isFirstIcon.value = true;
                      onPressed?.call();
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
