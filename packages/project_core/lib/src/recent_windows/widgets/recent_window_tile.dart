import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class RecentWindowTile extends ConsumerWidget {
  const RecentWindowTile({required this.recentWindow, super.key});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final type = FloatingWindowType.values.byName(recentWindow.type);

    if (!type.isSupportedForRecentWindows) {
      return Text('Not supported: $type');
    }

    return switch (type) {
      FloatingWindowType.contactPerson =>
        _ContactTile(recentWindow: recentWindow),
      FloatingWindowType.contactCompany =>
        _ContactTile(recentWindow: recentWindow),
      FloatingWindowType.contactPersonTable =>
        _ContactPersonTableTile(recentWindow: recentWindow),
      FloatingWindowType.contactCompanyTable =>
        _ContactCompanyTableTile(recentWindow: recentWindow),
      FloatingWindowType.customer => _CustomerTile(recentWindow: recentWindow),
      FloatingWindowType.artworkTemplate =>
        _ArtworkTemplateTile(recentWindow: recentWindow),
      FloatingWindowType.customerTable =>
        _CustomerTableTile(recentWindow: recentWindow),
      FloatingWindowType.salesOrder =>
        _SalesOrderTile(recentWindow: recentWindow),
      FloatingWindowType.companyEmployee =>
        _CompanyEmployeeTile(recentWindow: recentWindow),
      FloatingWindowType.artwork => _ArtworkTile(recentWindow: recentWindow),
      FloatingWindowType.artworkQuarantineGroup =>
        _ArtworkQuarantineGroupTile(recentWindow: recentWindow),
      FloatingWindowType.drucklayout =>
        _DrucklayoutTile(recentWindow: recentWindow),
      FloatingWindowType.product => _ProductTile(recentWindow: recentWindow),
      FloatingWindowType.appUser => _AppUserTile(recentWindow: recentWindow),
      FloatingWindowType.salesOrderTable =>
        _SalesOrderTableTile(recentWindow: recentWindow),
      FloatingWindowType.salesOrderItemTable =>
        _SalesOrderItemTableTile(recentWindow: recentWindow),
      FloatingWindowType.soiPrepareArtwork =>
        _SoiPrepareArtworkTile(recentWindow: recentWindow),
      FloatingWindowType.soiRequestArtworkApproval =>
        _SoiRequestArtworkApprovalTile(recentWindow: recentWindow),
      FloatingWindowType.soiEinzelformaufbau =>
        _SoiEinzelformaufbauTile(recentWindow: recentWindow),
      FloatingWindowType.soiConsulting =>
        _SoiConsultingTile(recentWindow: recentWindow),
      FloatingWindowType.crmEvent => _CrmEventTile(recentWindow: recentWindow),
      FloatingWindowType.serviceUser =>
        _ServiceUserTile(recentWindow: recentWindow),
      FloatingWindowType.adminServiceUsersTable =>
        _AdminServiceUsersTableTile(recentWindow: recentWindow),
      FloatingWindowType.artworkQuarantineGroupTable =>
        _ArtworkQuarantineGroupTableTile(recentWindow: recentWindow),
      FloatingWindowType.companyDepartment =>
        _CompanyDepartmentTile(recentWindow: recentWindow),
      _ => SizedBox(
          child: Text('Not implemented: $recentWindow'),
        ),
    };
  }
}

class _ServiceUserTile extends ConsumerWidget {
  const _ServiceUserTile({required this.recentWindow});
  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseTile(
      title: recentWindow.label,
      subtitle: 'Service User',
      onPressed: () {
        ref.openWindow(
          FloatingServiceUserWindowData(
            serviceUserId: recentWindow.entityId,
          ),
        );
      },
      icon: AppIcons.serviceUser,
    );
  }
}

class _CompanyDepartmentTile extends ConsumerWidget {
  const _CompanyDepartmentTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = CompanyDepartmentAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );
    final crmL10n = context.crmL10n;

    return _BaseTile(
      title: recentWindow.label,
      subtitle: crmL10n.company_department_singular,
      onPressed: () {
        ref.openWindow(
          FloatingCompanyDepartmentWindowData(
            entityId: recentWindow.entityId,
            companyId: additionalData.companyId,
          ),
        );
      },
      icon: AppIcons.companyDepartment,
    );
  }
}

class _AdminServiceUsersTableTile extends ConsumerWidget {
  const _AdminServiceUsersTableTile({required this.recentWindow});
  final RecentWindow recentWindow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _BaseTile(
      title: 'Service Users',
      subtitle: 'Service Users',
      onPressed: () {
        ref.openWindow(
          FloatingServiceUserTableWindowData(),
        );
      },
      icon: AppIcons.serviceUser,
    );
  }
}

class _ArtworkTile extends ConsumerWidget {
  const _ArtworkTile({required this.recentWindow});
  final RecentWindow recentWindow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = ArtworkAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );

    return _BaseTile(
      title: recentWindow.label,
      subtitle: additionalData.customSalesOrderId ?? '',
      onPressed: () {
        ref.openWindow(
          FloatingArtworkWindowData(
            artworkId: recentWindow.entityId,
            customerId: additionalData.customerId!,
          ),
        );
      },
      icon: AppIcons.artworkQuarantine,
    );
  }
}

class _ArtworkQuarantineGroupTile extends ConsumerWidget {
  const _ArtworkQuarantineGroupTile({required this.recentWindow});
  final RecentWindow recentWindow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = ArtworkQuarantineGroupAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );

    return _BaseTile(
      title: recentWindow.label,
      subtitle: additionalData.description,
      onPressed: () {
        ref.openWindow(
          FloatingArtworkQuarantineGroupWindowData(
            groupId: recentWindow.entityId,
            customerId: additionalData.customerId,
          ),
        );
      },
      icon: AppIcons.data_import,
    );
  }
}

class _ArtworkQuarantineGroupTableTile extends ConsumerWidget {
  const _ArtworkQuarantineGroupTableTile({required this.recentWindow});
  final RecentWindow recentWindow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final l10n = context.l10n;
    return _BaseTile(
      title: ppL10n.artwork_quarantine_group_plural,
      subtitle: l10n.entity_table,
      onPressed: () {
        ref.openWindow(
          FloatingArtworkQuarantineGroupTableWindowData(),
        );
      },
      icon: AppIcons.artworkQuarantine,
    );
  }
}

class _DrucklayoutTile extends ConsumerWidget {
  const _DrucklayoutTile({required this.recentWindow});
  final RecentWindow recentWindow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = DrucklayoutAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );

    return _BaseTile(
      title: recentWindow.label,
      subtitle: additionalData.description ?? '',
      onPressed: () {
        ref.openWindow(
          FloatingDrucklayoutWindowData(
            entityId: recentWindow.entityId,
            customerId: additionalData.customerId,
            salesOrderId: additionalData.salesOrderId,
            preSelectionId: additionalData.preSelectionId!,
            selectionId: additionalData.selectionId!,
          ),
        );
      },
      icon: AppIcons.drucklayout,
    );
  }
}

class _ProductTile extends ConsumerWidget {
  const _ProductTile({required this.recentWindow});
  final RecentWindow recentWindow;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final customerId = recentWindow.additionalData?['customerId'] as int;
    // final customSalesOrderId =
    //     recentWindow.additionalData?['customSalesOrderId'] as String?;

    final additionalData = ProductMasterAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );

    return _BaseTile(
      title: recentWindow.label,
      subtitle: additionalData.customSalesOrderId,
      onPressed: () {
        ref.openWindow(
          FloatingProductWindowData(
            productId: recentWindow.entityId,
            salesOrderId: additionalData.salesOrderId,
          ),
        );
      },
      icon: AppIcons.product,
    );
  }
}

class _ContactTile extends ConsumerWidget {
  const _ContactTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    // This solved FloatingWindowType type error
    if (recentWindow.entityId == null) return const SizedBox.shrink();

    final contactType = ContactAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    ).contactType;
    final subtitle = switch (contactType) {
      ContactType.company => crmL10n.contact_type_company,
      ContactType.person => crmL10n.contact_type_person,
    };
    final icon = switch (contactType) {
      ContactType.company => AppIcons.company,
      ContactType.person => AppIcons.person,
    };

    return _BaseTile(
      title: recentWindow.label,
      subtitle: subtitle,
      onPressed: () {
        final isPerson = contactType == ContactType.person;
        if (isPerson) {
          ref.openWindow(
            FloatingContactPersonWindowData(
              contactId: recentWindow.entityId,
            ),
          );
        } else {
          ref.openWindow(
            FloatingContactCompanyWindowData(
              contactId: recentWindow.entityId,
            ),
          );
        }
      },
      icon: icon,
    );
  }
}

class _AppUserTile extends ConsumerWidget {
  const _AppUserTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return _BaseTile(
      title: recentWindow.label,
      subtitle: l10n.app_user,
      icon: AppIcons.appUser,
      onPressed: () {
        ref.openWindow(
          FloatingAppUserWindowData(
            appUserId: recentWindow.entityId,
          ),
        );
      },
    );
  }
}

class _SalesOrderTile extends ConsumerWidget {
  const _SalesOrderTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SalesOrderAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );

    return _BaseTile(
      title: additionalData.customId,
      subtitle: additionalData.customerName,
      icon: AppIcons.salesOrder,
      onPressed: () {
        ref.openWindow(
          FloatingSalesOrderWindowData(
            salesOrderId: recentWindow.entityId,
          ),
        );
      },
    );
  }
}

class _ContactPersonTableTile extends ConsumerWidget {
  const _ContactPersonTableTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final l10n = context.l10n;
    return _BaseTile(
      title: crmL10n.contacts_persons,
      subtitle: l10n.entity_table,
      onPressed: () {
        ref.openWindow(
          FloatingContactPersonTableWindowData(),
        );
      },
      icon: AppIcons.person,
    );
  }
}

class _CustomerTableTile extends ConsumerWidget {
  const _CustomerTableTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return _BaseTile(
      title: crmL10n.customer_plural,
      subtitle: l10n.entity_table,
      onPressed: () {
        ref.openWindow(
          FloatingCustomerTableWindowData(),
        );
      },
      icon: AppIcons.customer,
    );
  }
}

class _ContactCompanyTableTile extends ConsumerWidget {
  const _ContactCompanyTableTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final l10n = context.l10n;
    return _BaseTile(
      title: crmL10n.contact_type_company,
      subtitle: l10n.entity_table,
      onPressed: () {
        ref.openWindow(
          FloatingContactCompanyTableWindowData(),
        );
      },
      icon: AppIcons.company,
    );
  }
}

class _SalesOrderTableTile extends ConsumerWidget {
  const _SalesOrderTableTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final salesL10n = context.salesL10n;
    final l10n = context.l10n;
    return _BaseTile(
      title: salesL10n.sales_order_plural,
      subtitle: l10n.entity_table,
      onPressed: () {
        ref.openWindow(
          FloatingSalesOrderTableWindowData(),
        );
      },
      icon: AppIcons.salesOrder,
    );
  }
}

class _SalesOrderItemTableTile extends ConsumerWidget {
  const _SalesOrderItemTableTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    return _BaseTile(
      title: salesL10n.sales_order_item_plural,
      subtitle: l10n.entity_table,
      onPressed: () {
        ref.openWindow(
          FloatingSalesOrderItemTableWindowData(),
        );
      },
      icon: AppIcons.salesOrderItem,
    );
  }
}

class _SoiPrepareArtworkTile extends ConsumerWidget {
  const _SoiPrepareArtworkTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiPrepareArtworkAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return _BaseTile(
      title: ppL10n.soi_prepare_artwork,
      subtitle: additionalData.artworkCustomId,
      onPressed: () {
        ref.openWindow(
          FloatingSoiPrepareArtworkWindowData(
            entityId: recentWindow.entityId,
            customerId: additionalData.customerId!,
          ),
        );
      },
      icon: AppIcons.soiPrepareArtwork,
    );
  }
}

class _SoiEinzelformaufbauTile extends ConsumerWidget {
  const _SoiEinzelformaufbauTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiEinzelformaufbauAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return _BaseTile(
      title: ppL10n.soi_einzelformaufbau_singular,
      subtitle: additionalData.artworkCustomId,
      onPressed: () {
        ref.openWindow(
          FloatingSoiEinzelformaufbauWindowData(
            entityId: recentWindow.entityId,
            customerId: additionalData.customerId,
          ),
        );
      },
      icon: AppIcons.soiEinzelformaufbau,
    );
  }
}

class _SoiConsultingTile extends ConsumerWidget {
  const _SoiConsultingTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiConsultingAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return _BaseTile(
      title: ppL10n.soi_consulting_singular,
      subtitle: additionalData.fullSalesOrderId,
      onPressed: () {
        ref.openWindow(
          FloatingSoiConsultingWindowData(
            entityId: recentWindow.entityId,
            customerId: additionalData.customerId!,
            salesOrderId: additionalData.salesOrderId,
          ),
        );
      },
      icon: AppIcons.soiConsulting,
    );
  }
}

class _SoiRequestArtworkApprovalTile extends ConsumerWidget {
  const _SoiRequestArtworkApprovalTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiRequestArtworkApprovalAdditionalData.fromJson(
      recentWindow.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return _BaseTile(
      title: ppL10n.soi_request_artwork_approval_singular,
      subtitle: additionalData.artworkCustomId,
      onPressed: () {
        ref.openWindow(
          FloatingSoiRequestArtworkApprovalWindowData(
            entityId: recentWindow.entityId,
            customerId: additionalData.customerId,
          ),
        );
      },
      icon: AppIcons.soiRequestArtworkApproval,
    );
  }
}

class _CustomerTile extends ConsumerWidget {
  const _CustomerTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    return _BaseTile(
      title: recentWindow.label,
      subtitle: crmL10n.customer_singular,
      icon: AppIcons.customer,
      onPressed: () {
        ref.openWindow(
          FloatingCustomerWindowData(
            customerId: recentWindow.entityId,
          ),
        );
      },
    );
  }
}

class _ArtworkTemplateTile extends ConsumerWidget {
  const _ArtworkTemplateTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerId = recentWindow.additionalData?['customerId'] as int?;
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    return _BaseTile(
      title: customerId == null
          ? '${l10n.gen_global}${recentWindow.label}'
          : recentWindow.label,
      subtitle: ppL10n.artwork_template_singular,
      icon: AppIcons.artworkTemplate,
      onPressed: () {
        ref.openWindow(
          FloatingArtworkTemplateWindowData(
            artworkTemplateId: recentWindow.entityId,
            customerId: customerId,
            preSelectionId: 0,
            selectionId: 0,
          ),
        );
      },
    );
  }
}

class _CrmEventTile extends ConsumerWidget {
  const _CrmEventTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    return _BaseTile(
      title: recentWindow.label,
      subtitle: crmL10n.event_singular,
      onPressed: () {
        ref.openWindow(
          FloatingCrmEventWindowData(
            eventId: recentWindow.entityId,
          ),
        );
      },
      icon: AppIcons.crm_event,
    );
  }
}

class _CompanyEmployeeTile extends ConsumerWidget {
  const _CompanyEmployeeTile({required this.recentWindow});

  final RecentWindow recentWindow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    return _BaseTile(
      title: recentWindow.label,
      subtitle: crmL10n.company_employee_singular,
      onPressed: () {
        ref.openWindow(
          FloatingCompanyEmployeeWindowData(
            entityId: recentWindow.entityId!,
          ),
        );
      },
      icon: AppIcons.employee,
    );
  }
}

class _BaseTile extends StatelessWidget {
  const _BaseTile({
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.subtitle,
  });

  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ElbListTile(
      buttonBorderRadius: 0,
      contentPadding: const EdgeInsets.only(
        left: AppSpace.xl,
        right: AppSpace.xs,
        top: AppSpace.m,
        bottom: AppSpace.m,
      ),
      onPressed: onPressed,
      leading: ElbIcon(icon),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(width: AppSpace.s),
            Flexible(
              child: AppText(
                title,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: AppSpace.s),
            Flexible(
              child: AppText(
                subtitle,
                color: context.appTheme.generalColors.onBackground
                    .withAppOpacity(0.5),
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
