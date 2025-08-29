import 'package:auto_size_text/auto_size_text.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  /// Creates an [AppRichText] widget.
  ///
  /// The [children] parameter must not be null.
  const AppRichText({
    required this.children,
    super.key,
    this.autoSize = true,
    this.textAlign,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.showTooltip = false,
    this.tooltipText,
  });

  /// The text spans to display.
  final List<TextSpan> children;

  /// Whether to automatically adjust the font size to fit within the available
  /// space.
  final bool autoSize;

  /// The maximum number of lines for the text.
  final int? maxLines;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// Whether to show a tooltip with the text when hovering.
  final bool showTooltip;

  /// The tooltip text to display.
  final String? tooltipText;

  @override
  Widget build(BuildContext context) {
    return autoSize
        ? AppTooltip(
            showTooltip: showTooltip,
            message: tooltipText,
            child: AutoSizeText.rich(
              TextSpan(
                children: children,
              ),
              maxLines: maxLines,
              minFontSize: 15,
              overflow: maxLines == null ? null : overflow,
              textAlign: textAlign,
            ),
          )
        : AppTooltip(
            showTooltip: showTooltip,
            message: tooltipText,
            child: Text.rich(
              TextSpan(
                children: children,
              ),
              maxLines: maxLines,
              textAlign: textAlign,
              overflow: maxLines == null ? null : overflow,
            ),
          );
  }
}
