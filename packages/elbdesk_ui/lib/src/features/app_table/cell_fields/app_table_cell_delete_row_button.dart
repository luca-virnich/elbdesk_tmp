import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppTableCellDeleteRowButton extends StatelessWidget {
  const AppTableCellDeleteRowButton({
    required this.onPressed,
    required super.key,
    required this.readOnly,
    this.alignment = Alignment.centerLeft,
  });

  final VoidCallback onPressed;
  final Alignment alignment;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final dangerColor = context.appTheme.generalColors.danger;
    return AppTableCellTextButton(
      l10n.gen_delete,
      onPressed: onPressed,
      readOnly: readOnly,
      textColor: dangerColor,
      alignment: alignment,
    );
  }
}
