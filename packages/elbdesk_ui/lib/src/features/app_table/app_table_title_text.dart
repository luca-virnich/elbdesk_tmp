import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A widget that displays a table title text with customizable alignment.
///
/// The [AppTableTitleText] widget is used to display a title text in a table
/// with a specified alignment. The text style is defined by the
// ignore: comment_references
/// [tableTitleStyle] from the [AppStyles] class.
///
/// {@tool snippet}
/// This example shows how to use [AppTableTitleText] to display a table title:
///
/// ```dart
/// AppTableTitleText(
///   'Table Title',
///   alignment: Alignment.center,
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Align], which is used to align the child widget.
///  * [AppText], which is used to display the text.
class AppTableTitleText extends StatelessWidget {
  /// Creates an [AppTableTitleText].
  ///
  /// The [text] parameter must not be null.
  const AppTableTitleText(
    this.text, {
    this.alignment = Alignment.centerLeft,
    super.key,
  });

  /// The text to display as the table title.
  final String text;

  /// The alignment of the text within the widget.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AppText(
        text,
        style: context.appTheme.textStyles.tableTitleStyle,
        maxLines: 1,
      ),
    );
  }
}
