import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class CardSectionCollapseButton extends StatelessWidget {
  const CardSectionCollapseButton({
    required this.onPressed,
    required this.isCollapsed,
    super.key,
  });
  final VoidCallback onPressed;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return AppIconButton.rotating(
      skipTraversal: true,
      onPressed: onPressed,
      turns: isCollapsed ? -0.5 : 0,
      icon: const Icon(
        AppIcons.expand_less,
        size: 28,
      ),
    );
  }
}
