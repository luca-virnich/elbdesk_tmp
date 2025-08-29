import 'dart:convert';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_platform_info/elbdesk_platform_info.dart';
import 'package:elbdesk_prepress/l10n/elb_prepress_localizations_ext.dart';
import 'package:elbdesk_sales/elbdesk_sales.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/src/entity_assignment/entity_assignment.dart';

class EntityAssignmentTile extends ConsumerWidget {
  const EntityAssignmentTile({
    required this.assignment,
    super.key,
  });
  final EntityAssignment assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tableType = TableType.values.byName(assignment.tableType);
    return switch (tableType) {
      TableType.salesOrder => _SalesOrderTile(
          assignment: assignment,
        ),
      TableType.soiPrepareArtwork => _SoiPrepareArtworkTile(
          assignment: assignment,
        ),
      TableType.soiRequestArtworkApproval => _SoiRequestArtworkApprovalTile(
          assignment: assignment,
        ),
      _ => const Text('Not implemented')
    };
  }
}

class _SalesOrderTile extends ConsumerWidget {
  const _SalesOrderTile({
    required this.assignment,
  });
  final EntityAssignment assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = jsonDecode(assignment.additionalData) as Map<String, dynamic>?;

    final additionalData = SalesOrderAdditionalData.fromJson(data ?? {});

    final salesOrderStatus = Parser.enumFromString(
      SalesOrderStatus.values,
      additionalData.status,
    )!;

    String buildLabel() {
      if (additionalData.keywords != null) {
        return '${additionalData.customId} - ${additionalData.customerName}';
      }
      return additionalData.customId;
    }

    return _BaseTile(
      onPressed: () {
        ref.openWindow(
          FloatingSalesOrderWindowData(
            salesOrderId: assignment.entityId,
          ),
        );
      },
      subtitle: additionalData.keywords ?? '',
      label: buildLabel(),
      // leading: AppTag.small(
      //   color: salesOrderStatus.color(satusColors),
      //   label: salesOrderStatus.readable(l10n),
      // ),
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: salesOrderStatus.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SoiPrepareArtworkTile extends ConsumerWidget {
  const _SoiPrepareArtworkTile({
    required this.assignment,
  });
  final EntityAssignment assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final additionalData = SoiPrepareArtworkAdditionalData.fromJsonString(
      assignment.additionalData,
    );

    final salesOrderItemStatus = Parser.enumFromString(
      SalesOrderItemStatus.values,
      additionalData.status,
    )!;
    String buildSubtitle() {
      if (additionalData.artworkWidth != null &&
          additionalData.artworkHeight != null) {
        final w = additionalData.artworkWidth!.formatted(
          l10n.localeName,
        );
        final h = additionalData.artworkHeight!.formatted(
          l10n.localeName,
        );
        return '${additionalData.artworkCustomId} ($w x $h)';
      }
      return additionalData.artworkCustomId;
    }

    final ppL10n = context.prepressL10n;

    return _BaseTile(
      onPressed: () {
        ref.openWindow(
          FloatingSoiPrepareArtworkWindowData(
            entityId: assignment.entityId,
            customerId: additionalData.customerId!,
          ),
        );
      },
      subtitle: buildSubtitle(),
      deadline: assignment.deadline,
      label: ppL10n.soi_prepare_artwork,
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: salesOrderItemStatus.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SoiRequestArtworkApprovalTile extends ConsumerWidget {
  const _SoiRequestArtworkApprovalTile({
    required this.assignment,
  });
  final EntityAssignment assignment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final additionalData =
        SoiRequestArtworkApprovalAdditionalData.fromJsonString(
      assignment.additionalData,
    );

    final salesOrderItemStatus = Parser.enumFromString(
      SalesOrderItemStatus.values,
      additionalData.status,
    )!;

    String buildSubtitle() {
      // if (additionalData.artworkWidth != null &&
      //     additionalData.artworkHeight != null) {
      //   final w = additionalData.artworkWidth!.formatted(
      //     l10n.localeName,
      //   );
      //   final h = additionalData.artworkHeight!.formatted(
      //     l10n.localeName,
      //   );
      //   return '${additionalData.artworkCustomId} ($w x $h)';
      // }
      return additionalData.artworkCustomId;
    }

    final ppL10n = context.prepressL10n;
    return _BaseTile(
      onPressed: () {
        ref.openWindow(
          FloatingSoiRequestArtworkApprovalWindowData(
            entityId: assignment.entityId,
            customerId: additionalData.customerId,
          ),
        );
      },
      deadline: assignment.deadline,
      subtitle: buildSubtitle(),
      label: ppL10n.soi_request_artwork_approval_singular,
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: salesOrderItemStatus.color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _BaseTile extends ConsumerWidget {
  const _BaseTile({
    required this.onPressed,
    required this.subtitle,
    required this.label,
    this.leading,
    this.deadline,
  });

  final VoidCallback onPressed;

  final Widget? leading;
  final String subtitle;
  final String label;
  final DateTime? deadline;

  static final isMobileDevice = ElbDeskPlatformInfo.isMobileDevice;

  static final mobileBreakpoint =
      WindowManagerInitialization.instance.mobileBreakpoint;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final isMobile = (screenWidth < mobileBreakpoint) || isMobileDevice;

    return ElbTile(
      buttonBorderRadius: 0,
      onPressed: onPressed,
      contentPadding: EdgeInsets.symmetric(
        vertical: isMobile ? 8 : AppSpace.l,
        horizontal: isMobile ? 12 : 22,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          if (leading != null) leading!,
          const SizedBox(width: AppSpace.l),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  label,
                  maxLines: 1,
                ),
                AppText(
                  subtitle,
                  color: context.appTheme.generalColors.onBackground
                      .withAppOpacity(0.5),
                  maxLines: 1,
                ),
              ],
            ),
          ),
          if (deadline != null) _DeadlineText(deadline: deadline!),
        ],
      ),
    );
  }
}

class _DeadlineText extends ConsumerWidget {
  const _DeadlineText({required this.deadline});
  final DateTime deadline;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final serverTime = ref.watch(watchTimeProvider).value;
    final differenceInMinutes = deadline.difference(serverTime!).inMinutes;

    final diffenceColor = differenceInMinutes > 180
        ? context.appTheme.generalColors.onBackground.withAppOpacity(0.5)
        : differenceInMinutes > 60
            ? context.appTheme.statusColors.warning
            : context.appTheme.statusColors.error;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AppText(
          deadline.toDateAndTime(l10n.localeName),
          color: diffenceColor,
        ),
        if (differenceInMinutes < 300)
          AppText(
            l10n.gen_minutes_abbreviation(differenceInMinutes),
            color: diffenceColor,
          ),
      ],
    );
  }
}
