import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/ae_pilot/services/ae_utils.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/artwork_quarantine_thumbnail_view.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/ui/open_in_new_hover_area.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/utils/xfile_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class ArtworkQuarantineThumbnailPdf extends StatelessWidget {
  const ArtworkQuarantineThumbnailPdf({
    required this.quarantine,
    required this.height,
    required this.width,
    super.key,
  });

  final ArtworkQuarantine quarantine;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    // PDF preview with right click context menu
    return SizedBox(
      height: height,
      width: width,
      child: quarantine.hasTrimmedAssets
          // Thumbnail JPG
          ? ArtworkQuarantineThumbnailView(
              quarantine: quarantine,
              height: height,
              width: width,
            )
          : _PdfPreview(
              artworkQuarantine: quarantine,
              height: height,
              width: width,
            ),
    );
  }
}

/// Context menu content with file opening functionality
class _ContextMenuContent extends HookConsumerWidget {
  const _ContextMenuContent({
    required this.quarantine,
    required this.controller,
  });

  final ArtworkQuarantine quarantine;
  final ListenableOverlayPortalController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get file paths
    final originalPdfFilePath = quarantine.artworkData.originalFilePath!;

    // Get global settings for thumbnail path construction

    return AppContextMenu(
      controller: controller,
      items: [
        AppContextMenuItem(
          label: 'PDF',
          onTap: () async {
            unawaited(UriLauncher.openFilePath(originalPdfFilePath));
          },
        ),
      ],
    );
  }
}

/// Analysis data section
class _PdfPreview extends HookConsumerWidget {
  const _PdfPreview({
    required this.artworkQuarantine,
    this.height,
    this.width,
  });

  final ArtworkQuarantine artworkQuarantine;

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnailIsHovered = useState<bool>(false);
    final fileExists = useState<bool?>(null);

    final filePath = artworkQuarantine.artworkData.originalFilePath;

    final existsCheck = useCallback(
      () async {
        if (filePath == null) {
          fileExists.value = false;
        }

        final file = XFile(filePath!);
        final exists = await file.exists;
        fileExists.value = exists;
      },
      [filePath],
    );

    // Check if file exists and is valid
    useEffect(
      () {
        existsCheck();
        return null;
      },
      [filePath],
    );

    if (fileExists.value == null) {
      return const Center(child: AppLoadingIndicator());
    }

    return AppContextMenuWrapper(
      isEnabled: true,
      useGlobalPositioning: true,
      menuContent: (controller) => _ContextMenuContent(
        quarantine: artworkQuarantine,
        controller: controller,
      ),
      child: (controller) => ElbMouseRegionGestureDetector(
        onSecondaryTapDown: !fileExists.value!
            ? null
            : (details) {
                controller.showAt(
                  globalPosition: details.globalPosition,
                );
              },
        enabled: fileExists.value!,
        onTap: !fileExists.value!
            ? null
            : () async {
                if (fileExists.value!) {
                  final eskoViewerUrl = ref
                      .read(fetchAndWatchGlobalSettingsProvider)
                      .requireValue
                      .data
                      .pdfViewerUrl;

                  await AEUtils.openPdfInAEViewer(
                    filePath!,
                    eskoViewerUrl,
                  );
                }
              },
        cursor: SystemMouseCursors.basic,
        onEnter: (_) => thumbnailIsHovered.value = true,
        onExit: (_) => thumbnailIsHovered.value = false,
        child: OpenInNewHoverArea(
          isActive: thumbnailIsHovered.value && fileExists.value! && !kIsWeb,
          child: const ElbIcon(AppIcons.picture_as_pdf, size: AppIconSize.xxl),
        ),
      ),
    );
  }
}
