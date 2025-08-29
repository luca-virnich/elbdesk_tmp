import 'dart:async';

import 'package:elbdesk_app/features/app_navigation/widgets/branded_top_navigation_bar.dart';
import 'package:elbdesk_app/init/app_localizations_config.dart';
import 'package:elbdesk_app/main.dart';
import 'package:elbdesk_app/router/app_router.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appSupportedLocales = AppLocalizationsConfig.supportedLocales;
final appLocalizationsDelegates = AppLocalizationsConfig.localizationsDelegates;

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAlive = ref.watch(watchHeartbeatProvider);
    // return const _App();

    return isAlive.when(
      loading: () => const _LoadingOnStartup(),
      error: (error, stack) => const _NoConnectionOnStartup(),
      data: (data) {
        if (data == false) {
          return const _NoConnectionOnStartup();
        }
        return const _App();
      },
    );
  }
}

/// Main Application
class _App extends StatefulHookConsumerWidget {
  /// Constructor
  const _App();

  // This widget is the root of your application.
  @override
  ConsumerState<_App> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<_App> {
  bool _isInitialized = false;
  late MediaQueryListener _mediaQueryListener;

  Future<void> _initializeApp() async {
    await ref.read(userSettingsStateProvider.future);
    // await ref.read(fetchAndWatchGlobalSettingsProvider.future);
    // await ref.read(watchAllLightUsersProvider.future);
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void initState() {
    super.initState();
    if (!kIsWeb && !kIsWasm) {
      _mediaQueryListener = MediaQueryListener();
      _mediaQueryListener.init();
    }
    _initializeApp();
  }

  @override
  void dispose() {
    if (!kIsWeb && !kIsWasm) {
      _mediaQueryListener.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(currentLocaleProvider);
    final router = ref.watch(appRouterProvider);
    final brightness = MediaQuery.platformBrightnessOf(context);
    final isDarkTheme = ref.watch(isDarkThemeStateProvider(brightness));
    if (!_isInitialized) {
      return const SizedBox.shrink();
    }

    return HookBuilder(
      builder: (context) {
        useEffect(
          () {
            if (kIsWeb) {
              ElbDeskPlatformInfo.setWebBodyBackgroundColor(
                isDarkTheme ? const Color(0xff0d1117) : Colors.white,
              );
            }
            return null;
          },
          [isDarkTheme],
        );

        // initiaTheme:

        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: elbdeskProjectName.fixed,
            darkTheme: appDarkTheme,
            themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
            theme: appLightTheme,
            locale: locale,
            routerConfig: router,
            localizationsDelegates: appLocalizationsDelegates,
            supportedLocales: appSupportedLocales,
          ),
        );
      },
    );
  }
}

class _LoadingOnStartup extends HookConsumerWidget {
  const _LoadingOnStartup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: elbdeskProjectName.fixed,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: getAppSystemTheme(context),
      home: const AppScaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: AppLoadingIndicator(),
        ),
      ),
    );
  }
}

class _NoConnectionOnStartup extends HookConsumerWidget {
  const _NoConnectionOnStartup();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Timer? retryTimer;
        retryTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
          ref.invalidate(watchHeartbeatProvider);
        });
        return () {
          retryTimer?.cancel();
          retryTimer = null;
        };
      },
      [],
    );

    return MaterialApp(
      title: elbdeskProjectName.fixed,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: appLocalizationsDelegates,
      supportedLocales: appSupportedLocales,
      theme: getAppSystemTheme(context),
      home: AppScaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            final l10n = context.l10n;
            return Column(
              children: [
                const SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpace.xxl),
                  child: Align(
                    child: SizedBox(
                      width: 700,
                      child: AppWindow.fixed(
                        child: SizedBox(
                          width: 400,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: AppSpace.l,
                              ),
                              const BrandingLogo(
                                height: 80,
                              ),
                              const SizedBox(
                                height: AppSpace.xxl,
                              ),
                              Text(
                                l10n.gen_no_connection_on_startup,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MediaQueryListener with WidgetsBindingObserver, WindowListener {
  // final Debouncer _debouncer = Debouncer(milliseconds: 2000);

  void init() {
    windowManager.addListener(this);
  }

  void dispose() {
    windowManager.removeListener(this);
  }

  @override
  Future<void> onWindowClose() async {
    final size = await windowManager.getSize();
    final position = await windowManager.getPosition();

    SharedPrefs.setAppWindowSize(size);
    SharedPrefs.setAppWindowPosition(position);
  }

  @override
  Future<void> onWindowMoved() async {
    final position = await windowManager.getPosition();
    SharedPrefs.setAppWindowPosition(position);
  }

  @override
  Future<void> onWindowResized() async {
    final size = await windowManager.getSize();
    SharedPrefs.setAppWindowSize(size);
  }
}
