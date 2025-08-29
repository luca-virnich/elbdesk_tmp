import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/system_file_attachment_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/models/system_file.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/utils/file_utils.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart';

/// Attachment tile

///

/// displays the attachment type, filename, extension, and file size

class AttachmentTile extends HookConsumerWidget {
  const AttachmentTile({
    required this.attachment,
    required this.stateNotifier,
    this.backgroundColor,
    super.key,
  });

  final SystemFile attachment;

  final Color? backgroundColor;

  final ArtworkQuarantineGroupState stateNotifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;

    final borderRadiuses = context.appTheme.borderRadiuses;

    // Animation controller for highlighting

    final highlightController = useAnimationController(
      duration: AnimationConstants.defaultDuration,
    );

    final duplicateNotifications = ref.watch(
      artworkQuarantineGroupDuplicateAttachmentsControllerProvider(
        stateNotifier.entityId,
        stateNotifier.sessionId,
      ),
    );

    // Listen for duplicate notifications

    // This stream is used to trigger the color animation highlight

    // when a duplicate attachment is detected.

    useEffect(
      () {
        final subscription =
            duplicateNotifications.stream.listen((notification) {
          // Trigger animation if this attachment's path is in the duplicates

          if (notification.paths.any((p) => p == attachment.path)) {
            highlightController
              ..reset()
              ..forward().then((_) => highlightController.reverse());
          }
        });

        return subscription.cancel;
      },
      [],
    );

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.appTheme.generalColors.background,
            borderRadius: BorderRadius.circular(borderRadiuses.s),
            border: Border.all(
              color: generalColors.primarySurfaceBorder.withAppOpacity(0.8),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAppOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadiuses.s),
            child: Column(
              children: [
                // Top accent bar

                _HeaderColorBar(
                  attachment: attachment,
                ),

                // Main content

                _AttachmentContent(
                  attachment: attachment,
                  stateNotifier: stateNotifier,
                ),
              ],
            ),
          ),
        ),

        // Blinking overlay

        AnimatedBuilder(
          animation: highlightController,
          builder: (context, child) {
            return Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    color: generalColors.primary
                        .withAppOpacity(0.1 * highlightController.value),
                    borderRadius: BorderRadius.circular(borderRadiuses.s),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _AttachmentContent extends StatelessWidget {
  const _AttachmentContent({
    required this.attachment,
    required this.stateNotifier,
  });

  final SystemFile attachment;

  final ArtworkQuarantineGroupState stateNotifier;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    final generalColors = appTheme.generalColors;

    return Padding(
      padding: const EdgeInsets.all(AppSpace.s),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row with icon, title, and delete button

          Row(
            children: [
              // Clickable icon container

              _ClickableAttachmentIcon(
                attachment: attachment,
                stateNotifier: stateNotifier,
              ),

              const SizedBox(width: AppSpace.s),

              // Filename in header

              Expanded(
                child: AppText(
                  attachment.filename.split('.').first,
                  style: context.appTheme.textStyles.defaultText.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                    color: generalColors.onBackground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(width: AppSpace.s),

              // Extension badge

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 3,
                  vertical: 1,
                ),
                decoration: BoxDecoration(
                  color: generalColors.primarySurface.withAppOpacity(0.6),
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: generalColors.primarySurface.withAppOpacity(0.4),
                    width: 0.5,
                  ),
                ),
                child: AppText(
                  p
                      .extension(attachment.filename)
                      .replaceAll('.', '')
                      .toUpperCase(),
                  style: context.appTheme.textStyles.defaultText.copyWith(
                    fontSize: 7,
                    fontWeight: FontWeight.w600,
                    color: generalColors.onBackground.withAppOpacity(0.6),
                  ),
                ),
              ),

              const SizedBox(width: AppSpace.xs),

              // File size

              AppText(
                FileUtils.formatFileSize(attachment.fileSize ?? 0),
                style: context.appTheme.textStyles.defaultText.copyWith(
                  fontSize: 7,
                  fontWeight: FontWeight.w400,
                  color: generalColors.onBackground.withAppOpacity(0.5),
                ),
              ),

              const SizedBox(width: AppSpace.xs),

              // Delete button

              AppIconButton.secondary(
                icon: const Icon(
                  AppIcons.delete,
                  size: AppSpace.l,
                ),
                onPressed: () async {
                  stateNotifier.removeAttachment(attachment);
                },
              ),
            ],
          ),

          const SizedBox(height: AppSpace.xs),
        ],
      ),
    );
  }
}

/// Clickable attachment icon with hover effects and tooltip

class _ClickableAttachmentIcon extends HookWidget {
  const _ClickableAttachmentIcon({
    required this.attachment,
    required this.stateNotifier,
  });

  final SystemFile attachment;

  final ArtworkQuarantineGroupState stateNotifier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final appTheme = context.appTheme;

    final statusColors = appTheme.statusColors;

    // Track hover state

    final isHovered = useState(false);

    return ElbMouseRegionGestureDetector(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      onTap: () async {
        await AsyncHandler.handleAsyncOperation(
          context,
          () async {
            // Open file in external app using launchUrl

            final fileUri = Uri.file(attachment.path);

            await launchUrl(fileUri);
          },
          errorNavigatorKey: AppNavigatorKeys.appRootNavigatorKey,
          showErrorNotification: true,
        );
      },
      child: Tooltip(
        message: l10n.gen_open,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                attachment.attachmentType
                    .color(statusColors)
                    .withAppOpacity(isHovered.value ? 0.2 : 0.1),
                attachment.attachmentType
                    .color(statusColors)
                    .withAppOpacity(isHovered.value ? 0.1 : 0.05),
              ],
            ),
            borderRadius: BorderRadius.circular(4),
            border: isHovered.value
                ? Border.all(
                    color: attachment.attachmentType.color(statusColors),
                    width: 1,
                  )
                : null,
          ),
          child: Center(
            child: ElbIcon(
              isHovered.value
                  ? AppIcons.open_in_new
                  : attachment.attachmentType.icon,
              size: AppIconSize.m,
              color: attachment.attachmentType.color(statusColors),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeaderColorBar extends StatelessWidget {
  const _HeaderColorBar({
    required this.attachment,
  });

  final SystemFile attachment;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme;

    final statusColors = appTheme.statusColors;

    return Container(
      height: 3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            attachment.attachmentType.color(statusColors),
            attachment.attachmentType.color(statusColors).withAppOpacity(0.6),
          ],
        ),
      ),
    );
  }
}
