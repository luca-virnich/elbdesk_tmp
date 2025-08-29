import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'elb_wm_localizations_de.dart';
import 'elb_wm_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of ElbWmLocalizations
/// returned by `ElbWmLocalizations.of(context)`.
///
/// Applications need to include `ElbWmLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/elb_wm_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: ElbWmLocalizations.localizationsDelegates,
///   supportedLocales: ElbWmLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the ElbWmLocalizations.supportedLocales
/// property.
abstract class ElbWmLocalizations {
  ElbWmLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static ElbWmLocalizations of(BuildContext context) {
    return Localizations.of<ElbWmLocalizations>(context, ElbWmLocalizations)!;
  }

  static const LocalizationsDelegate<ElbWmLocalizations> delegate =
      _ElbWmLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
  ];

  /// No description provided for @minimizeTooltip.
  ///
  /// In de, this message translates to:
  /// **'Minimieren'**
  String get minimizeTooltip;

  /// No description provided for @maximizeTooltip.
  ///
  /// In de, this message translates to:
  /// **'Maximieren'**
  String get maximizeTooltip;

  /// No description provided for @restoreTooltip.
  ///
  /// In de, this message translates to:
  /// **'Wiederherstellen'**
  String get restoreTooltip;

  /// No description provided for @closeTooltip.
  ///
  /// In de, this message translates to:
  /// **'Schließen'**
  String get closeTooltip;

  /// No description provided for @minimizeAllTooltip.
  ///
  /// In de, this message translates to:
  /// **'Alle Fenster minimieren'**
  String get minimizeAllTooltip;

  /// No description provided for @restoreAllTooltip.
  ///
  /// In de, this message translates to:
  /// **'Alle Fenster wiederherstellen'**
  String get restoreAllTooltip;

  /// No description provided for @scrollLeftTooltip.
  ///
  /// In de, this message translates to:
  /// **'Nach links scrollen'**
  String get scrollLeftTooltip;

  /// No description provided for @scrollRightTooltip.
  ///
  /// In de, this message translates to:
  /// **'Nach rechts scrollen'**
  String get scrollRightTooltip;

  /// No description provided for @showWindowOverviewTooltip.
  ///
  /// In de, this message translates to:
  /// **'Fensterübersicht anzeigen'**
  String get showWindowOverviewTooltip;

  /// No description provided for @closeOverviewTooltip.
  ///
  /// In de, this message translates to:
  /// **'Übersicht schließen'**
  String get closeOverviewTooltip;

  /// No description provided for @noOpenWindows.
  ///
  /// In de, this message translates to:
  /// **'Keine offenen Fenster'**
  String get noOpenWindows;

  /// No description provided for @minimizeAllLabel.
  ///
  /// In de, this message translates to:
  /// **'Alle minimieren'**
  String get minimizeAllLabel;

  /// No description provided for @windowsLabel.
  ///
  /// In de, this message translates to:
  /// **'Fenster'**
  String get windowsLabel;

  /// No description provided for @menuLabel.
  ///
  /// In de, this message translates to:
  /// **'Menü'**
  String get menuLabel;

  /// No description provided for @allWindowsTitle.
  ///
  /// In de, this message translates to:
  /// **'Alle Fenster'**
  String get allWindowsTitle;

  /// Count of windows
  ///
  /// In de, this message translates to:
  /// **'{count, plural, =0{No windows} =1{1 window} other{{count} windows}}'**
  String windowCount(int count);

  /// No description provided for @minimizedLabel.
  ///
  /// In de, this message translates to:
  /// **'Minimiert'**
  String get minimizedLabel;

  /// No description provided for @navigationTitle.
  ///
  /// In de, this message translates to:
  /// **'Navigation'**
  String get navigationTitle;

  /// No description provided for @expandTooltip.
  ///
  /// In de, this message translates to:
  /// **'Erweitern'**
  String get expandTooltip;

  /// No description provided for @collapseTooltip.
  ///
  /// In de, this message translates to:
  /// **'Reduzieren'**
  String get collapseTooltip;

  /// No description provided for @errorTitle.
  ///
  /// In de, this message translates to:
  /// **'Fehler'**
  String get errorTitle;
}

class _ElbWmLocalizationsDelegate
    extends LocalizationsDelegate<ElbWmLocalizations> {
  const _ElbWmLocalizationsDelegate();

  @override
  Future<ElbWmLocalizations> load(Locale locale) {
    return SynchronousFuture<ElbWmLocalizations>(
      lookupElbWmLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_ElbWmLocalizationsDelegate old) => false;
}

ElbWmLocalizations lookupElbWmLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return ElbWmLocalizationsDe();
    case 'en':
      return ElbWmLocalizationsEn();
  }

  throw FlutterError(
    'ElbWmLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
