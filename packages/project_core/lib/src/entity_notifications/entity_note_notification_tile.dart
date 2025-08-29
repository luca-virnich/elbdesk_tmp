import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

bool _isSystemNote(EntityNoteNotification notification) {
  return notification.hardcodedSender != null;
}

class EntityNoteNotificationTile extends ConsumerWidget {
  const EntityNoteNotificationTile({
    required this.notification,
    super.key,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableType = TableType.values.byName(notification.tableType);
    return switch (tableType) {
      TableType.contact => _ContactTile(
          notification: notification,
        ),
      TableType.salesOrder => _SalesOrderTile(
          notification: notification,
        ),
      TableType.companyEmployee => _CompanyEmployeeTile(
          notification: notification,
        ),
      TableType.customer => _CustomerTile(
          notification: notification,
        ),
      TableType.artworkMaster => _ArtworkMasterTile(
          notification: notification,
        ),
      TableType.productMaster => _ProductMasterTile(
          notification: notification,
        ),
      TableType.soiPrepareArtwork => _SoiPrepareArtworkTile(
          notification: notification,
        ),
      TableType.soiConsulting => _SoiConsultingTile(
          notification: notification,
        ),
      TableType.soiRequestArtworkApproval => _SoiRequestArtworkApprovalTile(
          notification: notification,
        ),
      TableType.soiEinzelformaufbau => _SoiEinzelformaufbauTile(
          notification: notification,
        ),
      TableType.artworkQuarantineGroup => _ArtworkQuarantineGroupTile(
          notification: notification,
        ),
      _ => _NotImplementedTile(
          notification: notification,
        ),
    };
  }
}

class _ContactTile extends ConsumerWidget {
  const _ContactTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    // This solved FloatingWindowType type error
    final contactType = ContactAdditionalData.fromJson(
      notification.additionalData ?? {},
    ).contactType;
    final subtitle = switch (contactType) {
      ContactType.company => crmL10n.contact_type_company,
      ContactType.person => crmL10n.contact_type_person,
    };
    final icon = switch (contactType) {
      ContactType.company => AppIcons.company,
      ContactType.person => AppIcons.person,
    };
    return EntityNotificationBaseTile(
      subtitle: subtitle,
      icon: icon,
      notification: notification,
      onPressed: () {
        final isPerson = contactType == ContactType.person;
        if (isPerson) {
          ref.openWindow(
            FloatingContactPersonWindowData(
              contactId: notification.entityId,
              initialNoteId: notification.id,
              initialNoteParentId: notification.parentId,
            ),
          );
        } else {
          ref.openWindow(
            FloatingContactCompanyWindowData(
              contactId: notification.entityId,
              initialNoteId: notification.id,
              initialNoteParentId: notification.parentId,
            ),
          );
        }
      },
    );
  }
}

class _ArtworkMasterTile extends ConsumerWidget {
  const _ArtworkMasterTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artworkAdditionalData = ArtworkAdditionalData.fromJson(
      notification.additionalData ?? {},
    );

    return EntityNotificationBaseTile(
      subtitle: artworkAdditionalData.customSalesOrderId ?? '',
      icon: AppIcons.artwork,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingArtworkWindowData(
            artworkId: artworkAdditionalData.artworkId,
            customerId: artworkAdditionalData.customerId!,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _ProductMasterTile extends ConsumerWidget {
  const _ProductMasterTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productMasterAdditionalData = ProductMasterAdditionalData.fromJson(
      notification.additionalData ?? {},
    );

    return EntityNotificationBaseTile(
      subtitle: productMasterAdditionalData.customSalesOrderId,
      icon: AppIcons.product,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingProductWindowData(
            productId: productMasterAdditionalData.productId,
            salesOrderId: productMasterAdditionalData.salesOrderId,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _CustomerTile extends ConsumerWidget {
  const _CustomerTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    return EntityNotificationBaseTile(
      subtitle: crmL10n.customer_singular,
      icon: AppIcons.customer,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingCustomerWindowData(
            customerId: notification.entityId,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _SoiPrepareArtworkTile extends ConsumerWidget {
  const _SoiPrepareArtworkTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiPrepareArtworkAdditionalData.fromJson(
      notification.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return EntityNotificationBaseTile(
      label: ppL10n.soi_prepare_artwork,
      subtitle: additionalData.artworkCustomId,
      icon: AppIcons.soiPrepareArtwork,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingSoiPrepareArtworkWindowData(
            entityId: notification.entityId,
            customerId: additionalData.customerId!,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _SoiConsultingTile extends ConsumerWidget {
  const _SoiConsultingTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiConsultingAdditionalData.fromJson(
      notification.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return EntityNotificationBaseTile(
      label: ppL10n.soi_consulting_singular,
      subtitle: additionalData.fullSalesOrderId,
      icon: AppIcons.soiConsulting,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingSoiConsultingWindowData(
            entityId: notification.entityId,
            customerId: additionalData.customerId!,
            salesOrderId: additionalData.salesOrderId,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _SoiRequestArtworkApprovalTile extends ConsumerWidget {
  const _SoiRequestArtworkApprovalTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiRequestArtworkApprovalAdditionalData.fromJson(
      notification.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return EntityNotificationBaseTile(
      label: ppL10n.soi_request_artwork_approval_singular,
      subtitle: additionalData.artworkCustomId,
      icon: AppIcons.soiRequestArtworkApproval,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingSoiRequestArtworkApprovalWindowData(
            entityId: notification.entityId,
            customerId: additionalData.customerId,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _SoiEinzelformaufbauTile extends ConsumerWidget {
  const _SoiEinzelformaufbauTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SoiEinzelformaufbauAdditionalData.fromJson(
      notification.additionalData ?? {},
    );
    final ppL10n = context.prepressL10n;
    return EntityNotificationBaseTile(
      label: ppL10n.soi_einzelformaufbau_singular,
      subtitle: additionalData.artworkCustomId,
      icon: AppIcons.soiEinzelformaufbau,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingSoiEinzelformaufbauWindowData(
            entityId: notification.entityId,
            customerId: additionalData.customerId,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _CompanyEmployeeTile extends ConsumerWidget {
  const _CompanyEmployeeTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyEmployeeAdditionalData =
        CompanyEmployeeAdditionalData.fromJson(
      notification.additionalData ?? {},
    );

    final label = '${companyEmployeeAdditionalData.employeeName} '
        '(${companyEmployeeAdditionalData.companyName})';
    final crmL10n = context.crmL10n;
    return EntityNotificationBaseTile(
      label: label,
      subtitle: crmL10n.company_employee_singular,
      icon: AppIcons.employee,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingCompanyEmployeeWindowData(
            entityId: notification.entityId,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

class _SalesOrderTile extends ConsumerWidget {
  const _SalesOrderTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData = SalesOrderAdditionalData.fromJson(
      notification.additionalData ?? {},
    );

    return EntityNotificationBaseTile(
      label: additionalData.customId,
      subtitle: additionalData.customerName,
      icon: AppIcons.salesOrder,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingSalesOrderWindowData(
            salesOrderId: notification.entityId,
            initialNoteId: notification.id,
            initialNoteParentId: notification.parentId,
          ),
        );
      },
    );
  }
}

// Artwork Quarantine Group

class _ArtworkQuarantineGroupTile extends ConsumerWidget {
  const _ArtworkQuarantineGroupTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    final additionalData = ArtworkQuarantineGroupAdditionalData.fromJson(
      notification.additionalData ?? {},
    );

    final isSystemNote = _isSystemNote(notification);

    return EntityNotificationBaseTile(
      label: '${ppL10n.artwork_quarantine_group_singular} '
          '#${notification.entityId}',
      subtitle: additionalData.description,
      icon: AppIcons.artworkQuarantineGroup,
      notification: notification,
      onPressed: () {
        ref.openWindow(
          FloatingArtworkQuarantineGroupWindowData(
            groupId: notification.entityId,
            customerId: notification.entityId,
            initialNoteId: isSystemNote ? null : notification.id,
            initialNoteParentId: isSystemNote ? null : notification.parentId,
          ),
        );
      },
    );
  }
}

class _NotImplementedTile extends StatelessWidget {
  const _NotImplementedTile({
    required this.notification,
  });

  final EntityNoteNotification notification;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return EntityNotificationBaseTile(
      onPressed: () {},
      icon: AppIcons.error_outline,
      subtitle: l10n.notification_not_implemented_yet,
      notification: notification,
    );
  }
}
