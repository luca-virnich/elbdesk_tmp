part of 'user_settings_dialog.dart';

class _LanguageSettingArea extends HookConsumerWidget {
  const _LanguageSettingArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final focusNode = useFocusNode();
    const supportedLocales = ElbCoreLocalizations.supportedLocales;
    final initialLocale = useMemoized(
      () => ref.read(currentLocaleProvider),
      [],
    );

    return AppWindowTile(
      isTextField: true,
      title: l10n.user_settings_locale,
      subTitle: l10n.user_settings_locale_subtitle,
      content: (width) => NextDropdownMenu<Locale>(
        initialValue: initialLocale.displayName,
        dropdownMenuEntries: supportedLocales.map((locale) {
          return NextDropdownMenuEntry(
            value: locale,
            label: locale.displayName,
          );
        }).toList(),
        focusNode: focusNode,
        isMandatory: true,
        onSelected: (locale) {
          if (locale != null) {
            final appLocale = AppLocale.fromJson(locale.languageCode);
            ref
                .read(userSettingsStateProvider.notifier)
                .updateLocale(appLocale);
          }
        },
        readOnly: false,
        focusOrderId: 0,
      ),
    );
  }
}
