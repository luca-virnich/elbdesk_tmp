import 'package:elbdesk_ui/src/components/app_text.dart';
import 'package:elbdesk_ui/src/core/theme/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class AppTableCellFormattedText extends StatelessWidget {
  const AppTableCellFormattedText(
    this.text, {
    required this.bold,
    required this.italic,
    this.color,
    super.key,
  });
  final String text;
  final bool? bold;
  final bool? italic;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: context.appTheme.textStyles.tableCellStyle.copyWith(
        fontWeight: (bold ?? false) ? FontWeight.bold : null,
        fontStyle: (italic ?? false) ? FontStyle.italic : null,
        color: color ?? context.appTheme.generalColors.onBackground,
      ),
      maxLines: 1,
    );
  }
}
