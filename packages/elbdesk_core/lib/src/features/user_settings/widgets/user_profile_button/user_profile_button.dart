import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/user_settings/widgets/user_profile_button/user_profile_avatar.dart';
import 'package:elbdesk_core/src/features/user_settings/widgets/user_settings_dialog/user_settings_dialog.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Opens the [UserSettingsOverlay] when the user clicks on the user profile
/// button, show the initials of the User and the connection status.
class UserProfileMenuButton extends HookConsumerWidget {
  /// @nodoc
  const UserProfileMenuButton({
    required this.userName,
    super.key,
  });

  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppOverlay(
      targetAnchor: Alignment.bottomRight,
      offset: const Offset(0, -43),
      child: (controller) {
        return GestureDetector(
          onTap: controller.show,
          child: const UserProfileAvatar(radius: 18),
        );
      },
      overlay: (controller) {
        return GestureDetector(
          onTap: controller.close,
          child: AppWindow.fixed(
            width: 250,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: UiConstants.defaultPadding,
              children: [
                // const _UserProfileTile(),
                const AppDivider(),
                _UserSettingsButton(
                  menuController: controller,
                  userName: userName,
                ),
                _SignOutButton(
                  onPressed: () async {
                    controller.close();
                    await sessionManager.signOutDevice();
                  },
                ),
                const CompactModeSwitchButton(),
                const Align(
                  alignment: Alignment.centerRight,
                  child: AppText(
                    'v$appVersion',
                    color: Colors.grey,
                    fontSize: 16,
                    minFontSize: 14,
                    autoSize: false,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CompactModeSwitchButton extends StatelessWidget {
  const CompactModeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppButton.danger(
          onPressed: windowManager.close,
          label: 'Verlassen',
        ),
        Row(
          children: [
            AppButton.secondary(
              expand: true,
              iconData: Icons.collections_bookmark_sharp,
              tooltip: 'Compact Mode',
              onPressed: () async {
                final isCompactMode =
                    (await windowManager.getTitleBarHeight()) < 2;
                if (isCompactMode) {
                  await windowManager.setTitleBarStyle(TitleBarStyle.normal);
                } else {
                  await windowManager.setTitleBarStyle(
                    TitleBarStyle.hidden,
                    windowButtonVisibility: false,
                  );
                }
              },
            ),
            AppButton.secondary(
              iconData: Icons.window_rounded,
              tooltip: 'Maximieren / Unmaximieren',
              onPressed: () async {
                final isMaximized = await windowManager.isMaximized();
                if (isMaximized) {
                  await windowManager.unmaximize();
                } else {
                  await windowManager.maximize();
                }
              },
            ),
            AppButton.secondary(
              iconData: Icons.window_rounded,
              tooltip: 'Minimieren',
              onPressed: () async {
                await windowManager.minimize();
              },
            ),
          ],
        ),
      ],
    );
  }
}

// class _UserProfileTile extends ConsumerWidget {
//   const _UserProfileTile();

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     final fullName = ref.watch(
//       currentAppUserStateProvider.select((value) {
//         return value.requireValue.userInfo.fullName;
//       }),
//     );

//     return Padding(
//       padding: const EdgeInsets.symmetric(
//         horizontal: UiConstants.defaultPadding / 2,
//       ).copyWith(bottom: UiConstants.defaultPadding / 8),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const UserProfileAvatar(),
//           const SizedBox(width: UiConstants.defaultPadding),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppText(fullName),
//               Opacity(
//                 opacity: 0.5,
//                 child: AppText(
//                   l10n.user_activity_status_online,
//                   fontWeight: FontWeight.w300,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class _SignOutButton extends ConsumerWidget {
  const _SignOutButton({this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return AppButton.secondary(
      expand: true,
      iconPosition: AppButtonIconPosition.leftOutside,
      label: l10n.auth_sign_out,
      iconData: AppIcons.logout,
      onPressed: onPressed,
    );
  }
}

class _UserSettingsButton extends StatelessWidget {
  const _UserSettingsButton({
    required this.menuController,
    required this.userName,
  });
  final AppOverlayController menuController;
  final String userName;
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppButton.secondary(
      iconPosition: AppButtonIconPosition.leftOutside,
      label: l10n.user_settings,
      iconData: AppIcons.settings,
      onPressed: () async {
        menuController.close();
        await showElbDialog<void>(
          context: context,
          isDismissible: true,
          child: UserSettingsOverlay(
            userName: userName,
            onClose: () {
              AppDialog.closeDialog(AppNavigatorKeys.appRootNavigatorKey);
            },
          ),
        );
      },
    );
  }
}
