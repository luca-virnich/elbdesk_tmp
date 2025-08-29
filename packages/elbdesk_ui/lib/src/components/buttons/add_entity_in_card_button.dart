import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AddEntityInCardButton extends StatelessWidget {
  const AddEntityInCardButton({
    required this.onPressed,
    required this.tooltip,
    super.key,
  });

  final void Function()? onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return AppButton.secondary(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: const Icon(Icons.add),
    );
  }
}
