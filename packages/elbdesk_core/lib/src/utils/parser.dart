import 'package:collection/collection.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/entity_notes/entity_note.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Parser {
  const Parser._();

  static String parseMessageToDbEntry(String message, List<Mention> mentions) {
    var storageText = message;
    // Sortiere Mentions von hinten nach vorne, um die Indizes nicht zu verschieben
    final sortedMentions = mentions.toList()
      ..sort((a, b) => b.start!.compareTo(a.start!));

    for (final mention in sortedMentions) {
      final before = storageText.substring(0, mention.start);
      final after = storageText.substring(mention.end!);
      storageText = '$before[user:${mention.userId}]$after';
    }
    return storageText;
  }

  static TextSpan parseMessageFromDbEntry(
    String text,
    TextStyle defaultStyle,
    List<LightUser> appUsers, [
    Color? messageColor,
    Color? mentionColor,
  ]) {
    final userRegex = RegExp(r'\[user:([^\]]+)\]');
    final urlRegex = RegExp(r'(https?://\S+)');
    final userMatches = userRegex.allMatches(text);

    if (userMatches.isEmpty && !urlRegex.hasMatch(text)) {
      return TextSpan(text: text, style: defaultStyle);
    }

    final spans = <TextSpan>[];
    var currentIndex = 0;

    // Process user mentions
    for (final match in userMatches) {
      // Text vor dem Match
      if (match.start > currentIndex) {
        _addTextWithUrls(
          spans,
          text.substring(currentIndex, match.start),
          defaultStyle.copyWith(color: messageColor),
        );
      }

      // Der Mention selbst
      final userId = int.parse(match.group(1)!);
      final user = appUsers.firstWhereOrNull((u) => u.userInfoId == userId);
      spans.add(
        TextSpan(
          text: user != null ? '@${user.fullName}' : match.group(0)!,
          style: defaultStyle.copyWith(
            color: mentionColor ?? Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

      currentIndex = match.end;
    }

    // Restlicher Text
    if (currentIndex < text.length) {
      _addTextWithUrls(
        spans,
        text.substring(currentIndex),
        defaultStyle.copyWith(color: messageColor),
      );
    }

    return TextSpan(children: spans);
  }

  static void _addTextWithUrls(
    List<TextSpan> spans,
    String text,
    TextStyle defaultStyle,
  ) {
    final urlRegex = RegExp(r'(https?://\S+)');
    final urlMatches = urlRegex.allMatches(text);

    if (urlMatches.isEmpty) {
      spans.add(TextSpan(text: text, style: defaultStyle));
      return;
    }

    var lastIndex = 0;
    for (final match in urlMatches) {
      // Add text before URL
      if (match.start > lastIndex) {
        spans.add(
          TextSpan(
            text: text.substring(lastIndex, match.start),
            style: defaultStyle,
          ),
        );
      }

      // Add URL as clickable text
      final url = match.group(0)!;
      spans.add(
        TextSpan(
          text: url,
          style: defaultStyle.copyWith(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse(url));
            },
        ),
      );

      lastIndex = match.end;
    }

    // Add remaining text after last URL
    if (lastIndex < text.length) {
      spans.add(
        TextSpan(
          text: text.substring(lastIndex),
          style: defaultStyle,
        ),
      );
    }
  }

  static double? parseDouble(String value) {
    final trimmed = value.trim();
    final replaced = trimmed.replaceAll(',', '.');
    return double.tryParse(replaced);
  }

  static String parsePhoneNumber(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r'[-() ]|\(0\)'), '');
  }

  static String? parseIsoDateToReadable(String value, String localeName) {
    final dateTime = DateTime.tryParse(value);
    if (dateTime == null) return null;
    return dateTime.toLocal().toDate(localeName);
  }

  static T? enumFromString<T>(List<T> values, String? value) {
    if (value == null) return null;
    try {
      return values.firstWhereOrNull(
        (e) => e.toString().split('.').last == value,
      );
    } catch (e) {
      return null;
    }
  }

  static DateTime? parseDateShortcutInput(String input) {
    // the input can be 10/10/2024 or 10.10.2024
    // we need to check if it is a valid date

    final trimmed = input.trim().toLowerCase();
    final fullNow = DateTime.now();

    // final now = DateTime(fullNow.year, fullNow.month, fullNow.day);
    final now = fullNow;

    if (trimmed == 'h') {
      return now;
    } else if (trimmed == '+1') {
      return now.add(const Duration(days: 1));
    } else if (trimmed.startsWith('+') || trimmed.startsWith('-')) {
      final isAddition = trimmed.startsWith('+');
      final numberStr = trimmed.endsWith('w') || trimmed.endsWith('m')
          ? trimmed.substring(1, trimmed.length - 1)
          : trimmed.substring(1);
      final number = int.tryParse(numberStr);

      if (number != null) {
        if (trimmed.endsWith('w')) {
          return isAddition
              ? now.add(Duration(days: 7 * number))
              : now.subtract(Duration(days: 7 * number));
        } else if (trimmed.endsWith('m')) {
          return isAddition
              ? DateTime(now.year, now.month + number, now.day)
              : DateTime(now.year, now.month - number, now.day);
        } else {
          return isAddition
              ? now.add(Duration(days: number))
              : now.subtract(Duration(days: number));
        }
      }
    } else if (trimmed == 'w') {
      return now.subtract(Duration(days: now.weekday - 1));
    } else if (trimmed == 'n') {
      return now.add(Duration(days: 7 - now.weekday));
    } else if (trimmed == 'b') {
      return DateTime(now.year, now.month);
    } else if (trimmed == 'e') {
      return DateTime(now.year, now.month + 1, 0);
    } else if (trimmed.startsWith('q')) {
      final quarter = int.tryParse(trimmed.substring(1));
      if (quarter != null && quarter >= 1 && quarter <= 4) {
        final month = (quarter - 1) * 3 + 1;
        return DateTime(now.year, month);
      }
    } else if (trimmed == 'ly') {
      return DateTime(now.year - 1);
    } else {
      final number = int.tryParse(trimmed);
      if (number != null && number > 0) {
        final daysInMonth = DateTime(now.year, now.month + 1, 0).day;
        if (number <= daysInMonth) {
          return DateTime(now.year, now.month, number);
        }
      }

      return null;
    }
    return null;
  }

  static DateTime? parseDateFullInput(String input) {
    // the input can be 10/10/2024 or 10.10.2024
    // we need to check if it is a valid date

    final trimmed = input.trim().toLowerCase();

    final parts = trimmed.split('.');
    final englishParts = trimmed.split('/');
    if (parts.length == 3) {
      final day = int.tryParse(parts[0]);
      final month = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);

      if (day != null && month != null && year != null) {
        if (year < 1000 || year > 2100) {
          return null;
        } else {
          return DateTime(year, month, day);
        }
      }
    } else if (englishParts.length == 3) {
      final month = int.tryParse(englishParts[0]);
      final day = int.tryParse(englishParts[1]);
      final year = int.tryParse(englishParts[2]);
      if (day != null && month != null && year != null) {
        if (year < 1000 || year > 2100) {
          return null;
        } else {
          return DateTime(year, month, day);
        }
      }
    }
    return null;
  }

  static SemVer parseSemVer(String version) {
    final semVerRegex = RegExp(r'^(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)'
        r'(?:-(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*)?'
        r'(?:\+[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*)?$');

    final match = semVerRegex.firstMatch(version);
    if (match == null) {
      throw FormatException('Ungültige SemVer-Version: $version');
    }

    final major = int.parse(match.group(1)!);
    final minor = int.parse(match.group(2)!);
    final patch = int.parse(match.group(3)!);

    return SemVer(major: major, minor: minor, patch: patch);
  }

  static TimeOfDay? parseTimeOfDayInput(String input) {
    // if there is no :, return only hours, valid 0-23
    if (!input.contains(':')) {
      final hour = int.tryParse(input);
      if (hour != null && hour >= 0 && hour <= 23) {
        return TimeOfDay(hour: hour, minute: 0);
      }
    }

    // the input can be 10:10
    // we need to check if it is a valid time

    final trimmed = input.trim().toLowerCase();

    final parts = trimmed.split(':');

    if (parts.length == 2) {
      final hour = int.tryParse(parts[0]);
      final minute = int.tryParse(parts[1]);

      if (hour != null && minute != null) {
        return TimeOfDay(hour: hour, minute: minute);
      } else {
        return null;
      }
    }
    return null;
  }
}

class SemVer {
  SemVer({
    required this.major,
    required this.minor,
    required this.patch,
  });
  final int major;
  final int minor;
  final int patch;
}
