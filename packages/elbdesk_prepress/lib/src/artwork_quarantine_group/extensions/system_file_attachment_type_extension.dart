import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

/// Extension for providing readable field names, icons, and colors
/// for SystemFileAttachmentType
extension SystemFileAttachmentTypeExt on SystemFileAttachmentType? {
  /// Returns the readable name of the attachment type
  String readable(ElbCoreLocalizations l10n) {
    return switch (this) {
      SystemFileAttachmentType.general => l10n.gen_attachment_general,
      SystemFileAttachmentType.order => l10n.gen_attachment_order,
      SystemFileAttachmentType.email => l10n.gen_attachment_email,
      null => l10n.gen_general,
    };
  }

  /// Returns the icon of the attachment type
  IconData get icon {
    return switch (this) {
      SystemFileAttachmentType.general => AppIcons.attachment,
      SystemFileAttachmentType.order => AppIcons.salesOrder,
      SystemFileAttachmentType.email => AppIcons.email,
      null => AppIcons.attachment,
    };
  }

  /// Returns the color of the attachment type
  Color color(AppStatusColors statusColors) {
    return switch (this) {
      SystemFileAttachmentType.general => statusColors.info,
      SystemFileAttachmentType.order => statusColors.success,
      SystemFileAttachmentType.email => statusColors.pending,
      null => statusColors.info,
    };
  }
}
