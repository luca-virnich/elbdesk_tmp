import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/app_user/models/user_info_extension.dart';
import 'package:project_core/src/auth/auth_provider.dart';
import 'package:project_core/src/developer_options/config/floating_developer_options_window_data.dart';

class DeveloperOptionsButton extends HookConsumerWidget {
  const DeveloperOptionsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;

    final authUser = ref.watch(authUserStateProvider);

    return (appRunMode.isProd || appRunMode.isStaging) &&
            !(authUser?.hasPermissions(AppScope.superAdmin.rwd.toSet()) ??
                false)
        ? const SizedBox.shrink()
        : AppIconButton.secondary(
            color: generalColors.onPrimary,
            colorOnHover: generalColors.onPrimary,
            iconData: AppIcons.developer_options,
            onPressed: () {
              ref.openWindow(FloatingDeveloperOptionsWindowData());
            },
          );
  }
}
