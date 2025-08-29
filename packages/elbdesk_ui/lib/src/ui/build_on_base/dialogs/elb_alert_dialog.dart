import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbAlertDialog extends StatelessWidget {
  const ElbAlertDialog({
    required this.titleText,
    super.key,
    this.contentText,
    this.actions,
    this.child,
    this.hideCloseButton = false,
    this.hideTitlebar = false,
    this.blockShortcuts = false,
    this.titleIcon,
    this.onSaveAndCloseShortcut,
    this.maxWidth,
    this.onCancel,
    this.contentPadding,
    this.minWidth,
  });
  final String titleText;
  final String? contentText;
  final List<Widget>? actions;
  final Widget? child;
  final bool hideCloseButton;
  final bool hideTitlebar;
  final bool blockShortcuts;
  final IconData? titleIcon;
  final double? maxWidth;
  final EdgeInsets? contentPadding;
  final double? minWidth;
  final VoidCallback? onSaveAndCloseShortcut;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return ElbDialog(
      floatingWindowId: null,
      dialogMode: ElbDialogMode.normal,
      icon: titleIcon,
      title: titleText,
      actions: actions,
      maxWidth: maxWidth ?? 400,
      contentPadding: contentPadding,
      minWidth: minWidth,
      onSaveAndCloseShortcut: onSaveAndCloseShortcut,
      onCancel: onCancel,
      child: child ?? AppText(contentText ?? ''),
    );
  }
}
