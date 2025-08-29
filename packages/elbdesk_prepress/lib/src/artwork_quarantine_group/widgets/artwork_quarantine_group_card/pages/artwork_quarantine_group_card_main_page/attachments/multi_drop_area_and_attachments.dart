import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/system_file_attachment_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/models/system_file.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/pages/artwork_quarantine_group_card_main_page/attachments/attachment_list.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/widgets/artwork_quarantine_group_card/pages/artwork_quarantine_group_card_main_page/attachments/specialized_drop_area.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Multi Drop Area widget
///
/// Provides multiple specialized drop areas in a horizontal layout:
/// - Artworks (PDFs only)
/// - General attachments
/// - Email attachments
/// - Order attachments
class MultiDropAreaAndAttachments extends ConsumerWidget {
  const MultiDropAreaAndAttachments({
    required this.groupId,
    required this.sessionId,
    required this.stateNotifier,
    required this.customerId,
    super.key,
  });

  final int groupId;
  final String sessionId;
  final ArtworkQuarantineGroupState stateNotifier;
  final int? customerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final groupState = ref.watch(
      artworkQuarantineGroupStateProvider(groupId, sessionId),
    );
    final group = groupState.requireValue;
    final attachments = group.attachments ?? <SystemFile>[];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: AppSpace.s),

          // Attachment List
          if (attachments.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpace.s),
              child: AttachmentList(
                attachments: attachments,
                stateNotifier: stateNotifier,
              ),
            ),
            const AppDivider(),
          ],

          // Multiple Drop Areas in horizontal layout
          Padding(
            padding: const EdgeInsets.all(AppSpace.s),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Calculate drop area width for 4 areas with spacing
                const spacing = AppSpace.s;
                const totalSpacing = spacing * 3; // 3 gaps between 4 areas
                final dropAreaWidth = (constraints.maxWidth - totalSpacing) / 4;

                return Row(
                  children: [
                    // Artworks Drop Area
                    SizedBox(
                      width: dropAreaWidth,
                      child: SpecializedDropArea(
                        title: l10n.data_import_artworks_as_pdf,
                        icon: AppIcons.artwork,
                        stateNotifier: stateNotifier,
                        attachmentType: null,
                      ),
                    ),
                    const SizedBox(width: spacing),

                    // General Attachments Drop Area
                    SizedBox(
                      width: dropAreaWidth,
                      child: SpecializedDropArea(
                        title: l10n.data_import_attachments,
                        icon: SystemFileAttachmentType.general.icon,
                        stateNotifier: stateNotifier,
                        attachmentType: SystemFileAttachmentType.general,
                      ),
                    ),

                    const SizedBox(width: spacing),

                    // Order Attachments Drop Area
                    SizedBox(
                      width: dropAreaWidth,
                      child: SpecializedDropArea(
                        title: SystemFileAttachmentType.order.readable(l10n),
                        icon: SystemFileAttachmentType.order.icon,
                        stateNotifier: stateNotifier,
                        attachmentType: SystemFileAttachmentType.order,
                      ),
                    ),

                    const SizedBox(width: spacing),

                    // Email Attachments Drop Area
                    SizedBox(
                      width: dropAreaWidth,
                      child: SpecializedDropArea(
                        title: SystemFileAttachmentType.email.readable(l10n),
                        icon: SystemFileAttachmentType.email.icon,
                        stateNotifier: stateNotifier,
                        attachmentType: SystemFileAttachmentType.email,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
