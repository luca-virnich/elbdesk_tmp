import 'package:flutter/material.dart';
import 'package:project_core/l10n/elb_project_localizations.dart';

extension ElbProjectLocalizationsExt on BuildContext {
  ElbProjectLocalizations get projectL10n => ElbProjectLocalizations.of(this);
}
