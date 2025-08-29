// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'elb_wm_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class ElbWmLocalizationsDe extends ElbWmLocalizations {
  ElbWmLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get minimizeTooltip => 'Minimieren';

  @override
  String get maximizeTooltip => 'Maximieren';

  @override
  String get restoreTooltip => 'Wiederherstellen';

  @override
  String get closeTooltip => 'Schließen';

  @override
  String get minimizeAllTooltip => 'Alle Fenster minimieren';

  @override
  String get restoreAllTooltip => 'Alle Fenster wiederherstellen';

  @override
  String get scrollLeftTooltip => 'Nach links scrollen';

  @override
  String get scrollRightTooltip => 'Nach rechts scrollen';

  @override
  String get showWindowOverviewTooltip => 'Fensterübersicht anzeigen';

  @override
  String get closeOverviewTooltip => 'Übersicht schließen';

  @override
  String get noOpenWindows => 'Keine offenen Fenster';

  @override
  String get minimizeAllLabel => 'Alle minimieren';

  @override
  String get windowsLabel => 'Fenster';

  @override
  String get menuLabel => 'Menü';

  @override
  String get allWindowsTitle => 'Alle Fenster';

  @override
  String windowCount(int count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString windows',
      one: '1 window',
      zero: 'No windows',
    );
    return '$_temp0';
  }

  @override
  String get minimizedLabel => 'Minimiert';

  @override
  String get navigationTitle => 'Navigation';

  @override
  String get expandTooltip => 'Erweitern';

  @override
  String get collapseTooltip => 'Reduzieren';

  @override
  String get errorTitle => 'Fehler';
}
