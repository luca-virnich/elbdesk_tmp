import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart'
    show
        FloatingContactCompanyTableWindowData,
        FloatingContactPersonTableWindowData,
        FloatingCustomerTableWindowData;
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';
import 'package:windows_taskbar/windows_taskbar.dart';

class AppNavigation extends HookConsumerWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unreadNotificationsCount =
        ref.watch(getUnreadNotificationsCountProvider).valueOrNull;

    useEffect(
      () {
        if (kIsWeb || !Platform.isWindows) {
          return;
        }
        if (unreadNotificationsCount == 0) {
          WindowsTaskbar.resetOverlayIcon();
          return null;
        }
        if (unreadNotificationsCount != null &&
            unreadNotificationsCount > 0 &&
            unreadNotificationsCount < 10) {
          WindowsTaskbar.setOverlayIcon(
            ThumbnailToolbarAssetIcon(
              'assets/img/taskbar_badges/$unreadNotificationsCount.ico',
            ),
          );
          return null;
        }
        if (unreadNotificationsCount != null &&
            unreadNotificationsCount >= 10) {
          WindowsTaskbar.setOverlayIcon(
            ThumbnailToolbarAssetIcon('assets/img/taskbar_badges/9p.ico'),
          );
          return null;
        }
        return null;
      },
      [unreadNotificationsCount],
    );
    final l10n = context.l10n;
    final isAdmin = ref.watch(isAdminProvider);
    final isSuperAdmin = ref.watch(isSuperAdminProvider);
    final isCrmAdmin = ref.watch(isCrmAdminProvider);
    final isMopAdmin = ref.watch(isMopAdminProvider);

    final isAdminInSomething = isAdmin || isCrmAdmin || isMopAdmin;
    final crmL10n = context.crmL10n;
    final ppL10n = context.prepressL10n;
    final salesL10n = context.salesL10n;

    return ExpandableSideNavigation(
      items: [
        SideNavigationMenuItem(
          icon: AppIcons.crm_admin,
          label: 'Home',
          showBadge:
              unreadNotificationsCount != null && unreadNotificationsCount > 0,
          badgeColor:
              context.appTheme.navigationProperties.errorBadgeBackgroundColor,
          badgeCount: unreadNotificationsCount,
          onTap: () {
            ref.read(windowManagerProvider).minimizeAllWindows();
          },
        ),
        SideNavigationSection(title: 'CRM'),
        SideNavigationMenuItem(
          icon: AppIcons.person,
          label: crmL10n.contacts_persons,
          onTap: () => ref.openWindow(
            FloatingContactPersonTableWindowData(),
          ),
        ),
        SideNavigationMenuItem(
          icon: AppIcons.company,
          label: crmL10n.contacts_companies,
          onTap: () => ref.openWindow(
            FloatingContactCompanyTableWindowData(),
          ),
        ),
        SideNavigationMenuItem(
          icon: AppIcons.customer,
          label: crmL10n.customers,
          onTap: () => ref.openWindow(
            FloatingCustomerTableWindowData(),
          ),
        ),
        SideNavigationSection(title: 'Sales'),
        SideNavigationMenuItem(
          icon: AppIcons.salesOrder,
          label: salesL10n.sales_order_plural,
          onTap: () => ref.openWindow(
            FloatingSalesOrderTableWindowData(),
          ),
        ),
        SideNavigationMenuItem(
          icon: AppIcons.salesOrderItem,
          label: salesL10n.sales_order_item_plural,
          onTap: () => ref.openWindow(
            FloatingSalesOrderItemTableWindowData(),
          ),
        ),
        SideNavigationMenuItem(
          icon: AppIcons.product,
          label: ppL10n.product_plural,
          onTap: () => ref.openWindow(
            FloatingProductTableWindowData(),
          ),
        ),
        SideNavigationSection(title: 'Prepress'),
        SideNavigationMenuItem(
          icon: AppIcons.artworkQuarantineGroup,
          label: ppL10n.artwork_quarantine_group_plural,
          onTap: () => ref.openWindow(
            FloatingArtworkQuarantineGroupTableWindowData(),
          ),
        ),
        if (isAdminInSomething) SideNavigationSection(title: 'Admin'),
        if (isAdmin)
          SideNavigationMenuItem(
            icon: AppIcons.admin_settings,
            label: l10n.admin_title,
            onTap: () => ref.openWindow(
              FloatingAdminSettingsWindowData(),
            ),
          ),
        if (isAdmin)
          SideNavigationMenuItem(
            icon: AppIcons.appUser,
            label: l10n.admin_app_users_plural,
            onTap: () => ref.openWindow(
              FloatingAppUserTableWindowData(),
            ),
          ),
        if (isAdmin)
          SideNavigationMenuItem(
            icon: AppIcons.entity_lock,
            label: l10n.entity_lock_title_plural,
            onTap: () => ref.openWindow(
              FloatingEntityLockTableWindowData(),
            ),
          ),
        if (isCrmAdmin)
          SideNavigationMenuItem(
            icon: AppIcons.crm_admin,
            label: l10n.app_scope_crm_admin,
            onTap: () => ref.openWindow(
              FloatingCrmAdminWindowData(),
            ),
          ),
        if (isMopAdmin)
          SideNavigationMenuItem(
            icon: AppIcons.mop_admin,
            label: l10n.app_scope_mop_admin,
            onTap: () => ref.openWindow(
              FloatingMopAdminWindowData(),
            ),
          ),
        if (isSuperAdmin) ...[
          SideNavigationSection(title: 'Super Admin'),
          SideNavigationMenuItem(
            icon: AppIcons.admin_log,
            label: l10n.admin_log_title_plural,
            onTap: () => ref.openWindow(
              FloatingAdminLogWindowData(),
            ),
          ),
          SideNavigationMenuItem(
            icon: AppIcons.admin_migration,
            label: 'Admin Migration'.hc,
            onTap: () => ref.openWindow(
              FloatingAdminMigrationWindowData(),
            ),
          ),
          SideNavigationMenuItem(
            icon: AppIcons.serviceUser,
            label: 'Service Users',
            onTap: () => ref.openWindow(
              FloatingServiceUserTableWindowData(),
            ),
          ),
        ],
      ],
    );
  }
}
