import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';

extension ElbCoreLocalizationExtension on BuildContext {
  ElbCoreLocalizations get l10n => ElbCoreLocalizations.of(this)!;
}
