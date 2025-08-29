import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OpenInNewButton extends HookWidget {
  const OpenInNewButton({
    required this.label,
    required this.onPressed,
    super.key,
  });
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isHovering = useState<bool>(false);
    final primaryColor = context.appTheme.generalColors.primary;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4, top: 2),
          child: AppIconButton(
            iconData: AppIcons.open_in_new,
            onPressed: onPressed,
            useFixedSize: false,
          ),
        ),
        Flexible(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (value) {
              if (context.mounted) {
                isHovering.value = true;
              }
            },
            onExit: (value) {
              if (context.mounted) {
                isHovering.value = false;
              }
            },
            child: AppText(
              label,
              maxLines: 1,
              // underline: isHovering.value,
              color: isHovering.value ? primaryColor : null,
            ),
          ),
        ),
      ],
    );
  }
}
