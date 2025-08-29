import 'dart:io';

import 'package:elbdesk_app/app/app_updater/animated_client_logo.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdateListener extends HookConsumerWidget {
  const UpdateListener({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) return const SizedBox();
    if (kIsWeb || kIsWasm) return const SizedBox();

    final isWindowsNoWeb = Platform.isWindows;
    if (!isWindowsNoWeb) return const SizedBox();

    final currentVersion = Parser.parseSemVer(appVersion);

    final latestVersionAsync = ref.watch(newestAppVersionManifestProvider);
    final isDialogOpen = useRef<bool>(false);
    final hasSoftUpdate = useState<bool>(false);
    final isFirstRun = useRef<bool>(true);

    useEffect(
      () {
        if (!latestVersionAsync.hasValue) return;
        final latestMajor = latestVersionAsync.value!.major;
        final latestMinor = latestVersionAsync.value!.minor;
        final latestPatch = latestVersionAsync.value!.patch;

        // compare majors:
        if (currentVersion.major < latestMajor) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            if (isDialogOpen.value) return;
            isDialogOpen.value = true;
            showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder: (context) => _UpdateDialog(
                url: Uri.parse(latestVersionAsync.value!.url),
              ),
            );
          });
          hasSoftUpdate.value = false;
          return;
        }
        // ! compare minors: We will change this to soft release after 1.0.0
        if (currentVersion.minor < latestMinor) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            if (isDialogOpen.value) return;
            isDialogOpen.value = true;
            showDialog<void>(
              barrierDismissible: false,
              context: context,
              builder: (context) => _UpdateDialog(
                url: Uri.parse(latestVersionAsync.value!.url),
              ),
            );
          });
          hasSoftUpdate.value = false;
          return;
        }
        // compare patches:
        if (currentVersion.patch < latestPatch) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            if (isFirstRun.value) {
              if (isDialogOpen.value) return;
              isDialogOpen.value = true;
              showDialog<void>(
                barrierDismissible: false,
                context: context,
                builder: (context) => _UpdateDialog(
                  url: Uri.parse(latestVersionAsync.value!.url),
                ),
              );
              hasSoftUpdate.value = false;
              return;
            } else {
              hasSoftUpdate.value = true;
            }
            hasSoftUpdate.value = true;
          });
        }
        isFirstRun.value = false;

        return null;
      },
      [latestVersionAsync],
    );

    return hasSoftUpdate.value
        ? ColoredBox(
            color: context.appTheme.generalColors.primary,
            child: Padding(
              padding: const EdgeInsets.all(AppSpace.s),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  UpdateAvailableButton(
                    onPressed: () {
                      isDialogOpen.value = true;
                      showDialog<void>(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => _UpdateDialog(
                          url: Uri.parse(latestVersionAsync.value!.url),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _UpdateDialog extends HookConsumerWidget {
  const _UpdateDialog({
    required this.url,
  });

  final Uri url;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = useState<double>(0);
    final hasError = useState<bool>(false);
    final l10n = ElbCoreLocalizations.of(context)!;
    final appTheme = context.appTheme;
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

    return Dialog(
      child: AppWindow.fixed(
        child: Padding(
          padding: const EdgeInsets.all(AppSpace.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: AppSpace.l),
              AnimatedClientLogo(hasError: hasError.value),
              const SizedBox(height: AppSpace.xl),
              if (!hasError.value)
                AppText(
                  l10n.gen_loading_update_message,
                  style: appTheme.textStyles.h1,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: AppSpace.l),
              if (!hasError.value) ...[
                LinearProgressIndicator(
                  value: progress.value,
                  backgroundColor: appTheme.generalColors.primarySurface,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    appTheme.generalColors.primary,
                  ),
                  borderRadius:
                      BorderRadius.circular(context.appTheme.borderRadiuses.m),
                ),
                const SizedBox(height: AppSpace.s),
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
                const SizedBox(height: AppSpace.xxl),
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
      ),
    );
  }
}
