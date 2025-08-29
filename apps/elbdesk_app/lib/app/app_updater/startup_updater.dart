import 'dart:async';
import 'dart:io';

import 'package:elbdesk_app/app/app_updater/animated_client_logo.dart';
import 'package:elbdesk_app/init/main_app.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StartupUpdater extends StatefulHookConsumerWidget {
  const StartupUpdater({required this.url, super.key});

  final Uri url;

  @override
  ConsumerState<StartupUpdater> createState() => _StartupUpdaterState();
}

class _StartupUpdaterState extends ConsumerState<StartupUpdater> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '',
            theme: appDarkTheme,
            locale: const Locale('de'),
            localizationsDelegates: appLocalizationsDelegates,
            supportedLocales: appSupportedLocales,
            home: Scaffold(
              body: GestureDetector(
                onTapDown: (details) {
                  windowManager.startDragging();
                },
                child: _UpdateWindow(
                  url: widget.url,
                  exitOnDone: true,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _UpdateWindow extends HookConsumerWidget {
  const _UpdateWindow({
    required this.url,
    this.exitOnDone = false,
  });

  final Uri url;
  final bool exitOnDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = useState<double>(0);
    final hasError = useState<bool>(false);

    final appTheme = context.appTheme;
    final l10n = context.l10n;
    Future<void> update() async {
      final (:success, :exception, :data) =
          await AsyncHandler.handleAsyncOperation(
        context,
        () => ref.read(appUpdateRepositoryProvider).update(
              url: url,
              onReceiveProgress: (received, total) {
                progress.value = received / total;
              },
            ),
        errorNavigatorKey: AppNavigatorKeys.appRootNavigatorKey,
        showErrorNotification: true,
      );
      if (!success && context.mounted) {
        hasError.value = true;
      }
      if (success && exitOnDone) {
        Future.delayed(const Duration(seconds: 1), () {
          if (context.mounted) {
            exit(0);
          }
        });
      }
    }

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          update();
        });
        return null;
      },
      [],
    );

    return Container(
      width: double.infinity,
      color: const Color(0xFF1F1F1F),
      padding: const EdgeInsets.all(AppSpace.xxl),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 16),
            AnimatedClientLogo(hasError: hasError.value),
            const SizedBox(height: 24),
            if (!hasError.value)
              AppText(
                l10n.gen_loading_update_message,
                style: appTheme.textStyles.h1,
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 16),
            if (!hasError.value) ...[
              LinearProgressIndicator(
                value: progress.value,
                backgroundColor: appTheme.generalColors.primarySurface,
                valueColor: AlwaysStoppedAnimation<Color>(
                  appTheme.generalColors.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              const SizedBox(height: 8),
              Text(
                '${(progress.value * 100).toInt()}%',
                style: appTheme.textStyles.defaultText,
              ),
            ],
            if (hasError.value) ...[
              AppText(
                l10n.navigation_error_message,
                style: appTheme.textStyles.h2,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              AppButton.primary(
                label: l10n.gen_retry,
                onPressed: () {
                  hasError.value = false;
                  progress.value = 0;
                  update();
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
