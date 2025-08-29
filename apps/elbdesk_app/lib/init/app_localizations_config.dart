import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
// Import other packages as needed
// import 'package:elbdesk_sales/l10n/elb_sales_localizations.dart';
// import 'package:elbdesk_prepress/l10n/elb_prepress_localizations.dart';
import 'package:flutter/material.dart';
import 'package:project_core/l10n/elb_project_localizations.dart';

/// Configuration for app-wide localizations
class AppLocalizationsConfig {
  AppLocalizationsConfig._();

  /// All localization sources in the app
  static final List<List<Locale>> _allLocalizationSources = [
    ElbCoreLocalizations.supportedLocales,
    ElbCrmLocalizations.supportedLocales,
    ElbWmLocalizations.supportedLocales,
    ElbPrepressLocalizations.supportedLocales,
    ElbSalesLocalizations.supportedLocales,
    ElbProjectLocalizations.supportedLocales,
    // Add more packages here as needed:
    // ElbSalesLocalizations.supportedLocales,
    // ElbPrepressLocalizations.supportedLocales,
  ];

  /// Get the intersection of all supported locales
  /// Only returns locales that are supported by ALL packages
  static List<Locale> get supportedLocales {
    if (_allLocalizationSources.isEmpty) return [];

    // Start with the first package's locales
    var intersection = _allLocalizationSources.first.toSet();

    // Find intersection with all other packages
    for (final locales in _allLocalizationSources.skip(1)) {
      intersection = intersection.intersection(locales.toSet());
    }

    return intersection.toList()
      ..sort((a, b) => a.languageCode.compareTo(b.languageCode));
  }

  /// All localization delegates
  static List<LocalizationsDelegate<dynamic>> get localizationsDelegates => [
        ...ElbCoreLocalizations.localizationsDelegates,
        ...ElbCrmLocalizations.localizationsDelegates,
        ...ElbWmLocalizations.localizationsDelegates,
        ...ElbPrepressLocalizations.localizationsDelegates,
        ...ElbSalesLocalizations.localizationsDelegates,
        ...ElbProjectLocalizations.localizationsDelegates,
        // Add more delegates here as needed
      ];

  /// Verify all packages support the same locales (for debugging)
  static void verifyLocalizationConsistency() {
    final core = ElbCoreLocalizations.supportedLocales.toSet();
    final crm = ElbCrmLocalizations.supportedLocales.toSet();
    final wm = ElbWmLocalizations.supportedLocales.toSet();
    final prepress = ElbPrepressLocalizations.supportedLocales.toSet();
    final sales = ElbSalesLocalizations.supportedLocales.toSet();
    final project = ElbProjectLocalizations.supportedLocales.toSet();

    final allLocales = {
      ...core,
      ...crm,
      ...wm,
      ...prepress,
      ...sales,
      ...project
    };
    final commonLocales = supportedLocales.toSet();
    final missingLocales = allLocales.difference(commonLocales);

    if (missingLocales.isNotEmpty) {
      dlog(
        'WARNING: The following locales are not supported by all packages:',
      );
      for (final locale in missingLocales) {
        final missing = <String>[];
        if (!core.contains(locale)) missing.add('Core');
        if (!crm.contains(locale)) missing.add('CRM');
        if (!wm.contains(locale)) missing.add('WindowManager');
        if (!prepress.contains(locale)) missing.add('Prepress');
        if (!sales.contains(locale)) missing.add('Sales');
        if (!project.contains(locale)) missing.add('Project');
        dlog('  - $locale is missing in: ${missing.join(', ')}');
      }
    }
  }
}
