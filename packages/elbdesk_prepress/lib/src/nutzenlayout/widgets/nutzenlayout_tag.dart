import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

// TOODO(tk): This is depricated. Delete it?
class NutzenlayoutTag extends StatelessWidget {
  const NutzenlayoutTag({
    required this.nutzenlayout,
    this.onPressed,
    super.key,
  });
  final Nutzenlayout nutzenlayout;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElbTag(
      isSelected: true,
      useOpacity: false,
      hideDot: true,
      color: Colors.orange.withAppOpacity(0.1),
      label:
          '${nutzenlayout.matrix} | ${nutzenlayout.laufrichtung.shortReadable(l10n)} | ${nutzenlayout.offset(l10n.localeName)} ',
      onPressed: onPressed,
    );
  }
}
