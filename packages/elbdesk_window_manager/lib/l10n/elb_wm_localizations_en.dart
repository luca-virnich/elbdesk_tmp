// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'elb_wm_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class ElbWmLocalizationsEn extends ElbWmLocalizations {
  ElbWmLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get minimizeTooltip => 'Minimize';

  @override
  String get maximizeTooltip => 'Maximize';

  @override
  String get restoreTooltip => 'Restore';

  @override
  String get closeTooltip => 'Close';

  @override
  String get minimizeAllTooltip => 'Minimize all windows';

  @override
  String get restoreAllTooltip => 'Restore all windows';

  @override
  String get scrollLeftTooltip => 'Scroll left';

  @override
  String get scrollRightTooltip => 'Scroll right';

  @override
  String get showWindowOverviewTooltip => 'Show window overview';

  @override
  String get closeOverviewTooltip => 'Close overview';

  @override
  String get noOpenWindows => 'No open windows';

  @override
  String get minimizeAllLabel => 'Minimize All';

  @override
  String get windowsLabel => 'Windows';

  @override
  String get menuLabel => 'Menu';

  @override
  String get allWindowsTitle => 'All Windows';

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
  String get minimizedLabel => 'Minimized';

  @override
  String get navigationTitle => 'Navigation';

  @override
  String get expandTooltip => 'Expand';

  @override
  String get collapseTooltip => 'Collapse';

  @override
  String get errorTitle => 'Error';
}
