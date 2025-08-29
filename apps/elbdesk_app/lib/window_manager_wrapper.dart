import 'package:elbdesk_app/app/app_navigation.dart';
import 'package:elbdesk_app/app/app_updater/update_listener.dart';
import 'package:elbdesk_app/features/app_navigation/widgets/app_bar_spotlight.dart';
import 'package:elbdesk_app/features/app_navigation/widgets/branded_top_navigation_bar.dart';
import 'package:elbdesk_app/widgets/dashboard_bottom_status_bar.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart' hide WindowManager;
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class WindowManagerWrapper extends ConsumerWidget {
  const WindowManagerWrapper({
    required this.child,
    super.key,
  });
  final Widget child;

  static const mobileBreakpoint = 600.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(currentLocaleProvider);
    final currentUser = ref.watch(authUserStateProvider)?.id ?? 0;

    return ElbDeskWindowManager(
      userId: currentUser,
      environment: appRunMode.key,
      shortcuts: {
        if (!kIsWeb) globalMenuShortcutMeta: const GlobalMenuIntent(),
        globalMenuShortcutControl: const GlobalMenuIntent(),
        f2searchCustomerNumberShortcut: const GlobalMenuIntent(
          spotlightType: SpotlightType.searchCustomer,
        ),
        f3searchCustomerNameShortcut: const GlobalMenuIntent(
          spotlightType: SpotlightType.searchCustomer,
        ),
      },
      actions: {
        GlobalMenuIntent: CallbackAction<GlobalMenuIntent>(
          onInvoke: (intent) async {
            await showElbDialog<void>(
              // minWidth: 600,
              // blurBackground: true,
              context: context,
              child: SpotlightDialog(
                spotlightType: intent.spotlightType,
              ),
              isDismissible: true,
            );
            return null;
          },
        ),
      },
      allowWindowsOutsideView:
          true, // Allow windows to be dragged outside the viewport
      mobileBreakpoint:
          mobileBreakpoint, // Mobile breakpoint for responsive design
      statusBar: const DashboardBottomStatusBar(),
      stackTaskbarTiles: true,

      language: currentLanguage.languageCode,

      mobileTaskbarItems: const [],

      topHeader: Builder(
        builder: (context) {
          final maxWidth = MediaQuery.sizeOf(context).width;

          final alignSearchRight = maxWidth < 1000;
          final isMobile = maxWidth < 450;

          final isMobileLayout = maxWidth < mobileBreakpoint;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const UpdateListener(),
              Row(
                children: [
                  SizedBox(
                    width: maxWidth / 3,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: isMobileLayout ? 8 : 24,
                        ),
                        child: const BrandingLogo(
                          height: 50,
                        ),
                      ),
                    ),
                  ),
                  if (!isMobile && !alignSearchRight)
                    SizedBox(
                      width: maxWidth / 3,
                      child: AppBarSpotlight(
                        isMobileView: isMobile,
                      ),
                    ),
                  // if (isMobile) const MobileAppBarSpotlight(),
                  SizedBox(
                    width:
                        !alignSearchRight ? maxWidth / 3 : (maxWidth / 3) * 2,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: isMobileLayout ? 8 : 24,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (alignSearchRight) ...[
                              const SizedBox(width: 16),
                              Flexible(
                                child: AppBarSpotlight(
                                  isMobileView: isMobile,
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                            Consumer(
                              builder: (context, ref, child) {
                                final userName = ref.watch(
                                  currentAppUserStateProvider.select(
                                    (value) =>
                                        value.requireValue.userInfo.fullName,
                                  ),
                                );
                                return UserProfileMenuButton(
                                  userName: userName ?? '',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      sideNavigation: const AppNavigation(),
      child: child,
    );
  }
}

class GlobalMenuIntent extends Intent {
  const GlobalMenuIntent({
    this.spotlightType = SpotlightType.general,
  });
  final SpotlightType spotlightType;
}
