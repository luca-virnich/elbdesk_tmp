import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class RecentWindowFilterItemTile extends StatelessWidget {
  const RecentWindowFilterItemTile({
    required this.title,
    required this.isSelected,
    required this.icon,
    required this.onPressed,
    super.key,
  });
  final String title;
  final bool isSelected;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElbListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8)
          .copyWith(right: 12),
      buttonBorderRadius: 0,
      onPressed: onPressed,
      leading: Icon(icon),
      trailing: AppCheckbox(
        value: isSelected,
        onChanged: (value) {
          onPressed();
        },
      ),
      titleText: title,
    );
  }
}
