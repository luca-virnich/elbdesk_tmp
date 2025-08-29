import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/system_file_attachment_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/models/system_file.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/tiles/attachment_tile.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Displays attachments grouped horizontally by type (general, order, email)
class AttachmentList extends StatelessWidget {
  const AttachmentList({
    required this.attachments,
    required this.stateNotifier,
    super.key,
  });

  final List<SystemFile> attachments;
  final ArtworkQuarantineGroupState stateNotifier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    // Group attachments by type
    final generalAttachments = attachments
        .where(
          (attachment) =>
              attachment.attachmentType == SystemFileAttachmentType.general,
        )
        .toList();
    final orderAttachments = attachments
        .where(
          (attachment) =>
              attachment.attachmentType == SystemFileAttachmentType.order,
        )
        .toList();
    final emailAttachments = attachments
        .where(
          (attachment) =>
              attachment.attachmentType == SystemFileAttachmentType.email,
        )
        .toList();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 160,
      ),
      child: Row(
        children: [
          // General
          if (generalAttachments.isNotEmpty) ...[
            Expanded(
              child: _AttachmentSection(
                title: SystemFileAttachmentType.general.readable(l10n),
                attachments: generalAttachments,
                stateNotifier: stateNotifier,
                type: SystemFileAttachmentType.general,
              ),
            ),
            if (orderAttachments.isNotEmpty || emailAttachments.isNotEmpty)
              const SizedBox(width: AppSpace.s),
          ],

          // Order
          if (orderAttachments.isNotEmpty) ...[
            Expanded(
              child: _AttachmentSection(
                title: SystemFileAttachmentType.order.readable(l10n),
                attachments: orderAttachments,
                stateNotifier: stateNotifier,
                type: SystemFileAttachmentType.order,
              ),
            ),
            if (emailAttachments.isNotEmpty) const SizedBox(width: AppSpace.s),
          ],

          // Emails
          if (emailAttachments.isNotEmpty)
            Expanded(
              child: _AttachmentSection(
                title: SystemFileAttachmentType.email.readable(l10n),
                attachments: emailAttachments,
                stateNotifier: stateNotifier,
                type: SystemFileAttachmentType.email,
              ),
            ),
        ],
      ),
    );
  }
}

/// Section widget for a specific attachment type with horizontal scrolling
class _AttachmentSection extends StatelessWidget {
  const _AttachmentSection({
    required this.title,
    required this.attachments,
    required this.stateNotifier,
    required this.type,
  });

  final String title;
  final List<SystemFile> attachments;
  final ArtworkQuarantineGroupState stateNotifier;
  final SystemFileAttachmentType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.only(
            left: AppSpace.xs,
            bottom: AppSpace.xs,
          ),
          child: AppText(
            title,
            style: context.appTheme.textStyles.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Horizontal scrollable list of attachment tiles
        Flexible(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
            itemCount: attachments.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpace.s),
            itemBuilder: (context, index) {
              return AttachmentTile(
                attachment: attachments[index],
                stateNotifier: stateNotifier,
              );
            },
          ),
        ),
      ],
    );
  }
}
