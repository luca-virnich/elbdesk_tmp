import 'package:elbdesk_core/src/features/entity_notes/entity_note.dart';
import 'package:flutter/material.dart';

class MentionEditingController extends TextEditingController {
  MentionEditingController({super.text});
  List<Mention> mentions = [];
  bool isModifying = false;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    required bool withComposing,
    TextStyle? style,
  }) {
    final defaultStyle = style ??
        const TextStyle(fontSize: 16, color: Colors.black, height: 1.3);
    final mentionStyle = defaultStyle.copyWith(
      color: Colors.blue,
      fontWeight: FontWeight.bold,
    );
    final spans = <TextSpan>[];
    var currentIndex = 0;
    // Sortiere die Mentions nach Startposition

    for (final mention in mentions) {
      if (mention.start! > currentIndex) {
        spans.add(
          TextSpan(
            text: text.substring(currentIndex, mention.start),
            style: defaultStyle,
          ),
        );
      }
      spans.add(
        TextSpan(
          text: text.substring(mention.start!, mention.end),
          style: mentionStyle,
        ),
      );
      currentIndex = mention.end!;
    }
    if (currentIndex < text.length) {
      spans.add(
        TextSpan(text: text.substring(currentIndex), style: defaultStyle),
      );
    }
    return TextSpan(style: defaultStyle, children: spans);
  }
}
