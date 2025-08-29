import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Specialized drop area for specific file types
///
/// This widget creates a drop area that accepts files for a specific purpose:
/// - Artworks (PDFs only)
/// - General attachments (any file)
/// - Email attachments (usually .msg files)
/// - Order attachments (usually PDFs)
class SpecializedDropArea extends HookConsumerWidget {
  const SpecializedDropArea({
    required this.icon,
    required this.stateNotifier,
    this.subtitle,
    this.title,
    this.attachmentType,
    super.key,
  });

  final String? title;
  final String? subtitle;
  final IconData icon;
  final ArtworkQuarantineGroupState stateNotifier;

  /// If null, this drop area is for artworks
  /// If not null, this drop area is for attachments of the specified type
  final SystemFileAttachmentType? attachmentType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final generalColors = context.appTheme.generalColors;
    final isFilesLoading = useState<bool>(false);

    return SizedBox(
      height: 130,
      child: AppFileDropArea(
        icon: icon,
        title1: title,
        subTitle: subtitle,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon
            ElbIcon(
              icon,
              size: AppIconSize.xl,
            ),
            const SizedBox(height: AppSpace.xs),

            if (title != null) ...[
              AppText(
                title!,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
            ],
            AppText(
              subtitle ?? l10n.file_click_or_drag_and_drop,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
          ],
        ),

        // Drag & Dropped files
        onDragDone: (detail) async {
          if (detail.files.isEmpty) return;

          isFilesLoading.value = true;

          await AsyncHandler.handleAsyncOperation(
            context,
            () async {
              final filePaths = detail.files.map((file) => file.path).toList();
              await stateNotifier.processAndAddFiles(
                filePaths,
                attachmentType: attachmentType,
              );
            },
          );

          isFilesLoading.value = false;
        },

        // Button to select files
        onPressed: () async {
          isFilesLoading.value = true;

          await AsyncHandler.handleAsyncOperation(
            context,
            () async {
              // Use file picker directly
              final List<XFile>? result;
              if (attachmentType == null) {
                result =
                    await ref.read(filePickerControllerProvider).pickPdfFiles();
              } else {
                result =
                    await ref.read(filePickerControllerProvider).pickAnyFiles();
              }

              if (result != null && result.isNotEmpty) {
                final filePaths = result
                    .where((file) => file.path.isNotEmpty)
                    .map((file) => file.path)
                    .toList();

                if (filePaths.isNotEmpty) {
                  await stateNotifier.processAndAddFiles(
                    filePaths,
                    attachmentType: attachmentType,
                  );
                }
              }
            },
          );

          isFilesLoading.value = false;
        },
        backgroundColor: generalColors.primarySurface.withAppOpacity(
          attachmentType == null ? 0.15 : 0.1, // Artworks vs attachments
        ),
        isLoading: isFilesLoading.value,
        compact: true,
      ),
    );
  }
}
