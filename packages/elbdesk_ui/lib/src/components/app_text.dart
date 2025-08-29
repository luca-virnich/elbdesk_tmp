import 'package:auto_size_text/auto_size_text.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A widget that displays text with optional auto-sizing and customizable
/// styles.
///
/// The [AppText] widget is used to display text with various customization
/// options such as color, style, alignment, font weight, and maximum lines. It
/// can also automatically adjust the font size to fit within the available
/// space if [autoSize] is set to true.
///
/// {@tool snippet}
/// This example shows how to use [AppText] with auto-sizing enabled:
///
/// ```dart
/// AppText(
///   'Hello, World!',
///   autoSize: true,
///   maxLines: 2,
///   textAlign: TextAlign.center,
/// )
/// ```
///
/// This example shows how to use [AppText] with a custom style:
///
/// ```dart
/// AppText(
///   'Hello, World!',
///   style: TextStyle(
///     color: Colors.blue,
///     fontSize: 16,
///     fontWeight: FontWeight.bold,
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AutoSizeText], which is used to automatically adjust the font size.
// ignore: use_design_system_item_AppText
///  * [Text], which is used to display text without auto-sizing.
class AppText extends StatelessWidget {
  /// Creates an [AppText] widget.
  ///
  /// The [text] parameter must not be null.
  const AppText(
    this.text, {
    super.key,
    this.color,
    this.style,
    this.autoSize = true,
    this.textAlign,
    this.fontWeight,
    this.minFontSize,
    this.maxLines,
    this.height,
    this.fontSize,
    this.overflow = TextOverflow.ellipsis,
    this.showTooltip = false,
    this.italic = false,
    this.underline = false,
  });

  /// The text to display.
  final String text;

  /// The color to use for the text.
  final Color? color;

  /// The style to use for the text.
  final TextStyle? style;

  /// Whether to automatically adjust the font size to fit within the available
  /// space.
  final bool autoSize;

  /// The font weight to use for the text.
  final FontWeight? fontWeight;

  /// The maximum number of lines for the text.
  final int? maxLines;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The minimum font size to use when auto-sizing the text.
  final double? minFontSize;
  final double? fontSize;
  final TextOverflow? overflow;
  final double? height;
  final bool showTooltip;
  final bool italic;
  final bool underline;
  @override
  Widget build(BuildContext context) {
    return autoSize
        ? AppTooltip(
            showTooltip: showTooltip,
            message: text,
            child: AutoSizeText(
              text,
              maxLines: maxLines,
              minFontSize: minFontSize ??
                  (fontSize != null && fontSize! >= 15 ? 15 : fontSize ?? 15),
              overflow: maxLines == null ? null : overflow,
              textAlign: textAlign,
              style: style ??
                  TextStyle(
                    color: color,
                    fontSize: fontSize ?? 15,
                    fontWeight: fontWeight,
                    height: height,
                    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                    decoration: underline ? TextDecoration.underline : null,
                    decorationColor: underline ? color : null,
                  ),
            ),
          )
        // ignore: use_design_system_item_AppText
        : AppTooltip(
            showTooltip: showTooltip,
            message: text,
            child: Text(
              text,
              maxLines: maxLines,
              textAlign: textAlign,
              overflow: maxLines == null ? null : overflow,
              style: style ??
                  TextStyle(
                    color: color,
                    fontSize: fontSize ?? 15,
                    fontWeight: fontWeight,
                    height: height,
                    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
                    decoration: underline ? TextDecoration.underline : null,
                    // fontFamily: 'Lato',
                  ),
            ),
          );
  }
}
