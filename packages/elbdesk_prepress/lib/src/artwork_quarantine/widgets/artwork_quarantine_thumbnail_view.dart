import 'dart:async';
import 'dart:io';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/ae_pilot/services/ae_utils.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/ui/open_in_new_hover_area.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

/// Enhanced thumbnail display for quarantine
///
/// Currently not used anymore, because we're now displaying the PDF Viewer
/// Might be needed though. Don't delete yet.
class ArtworkQuarantineThumbnailView extends HookConsumerWidget {
  const ArtworkQuarantineThumbnailView({
    required this.quarantine,
    required this.height,
    required this.width,
    super.key,
  });

  final ArtworkQuarantine quarantine;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbnailIsHovered = useState<bool>(false);

    final quarantineFolderPath = ref.watch(artworkQuarantineBaseFolderProvider);
    final thumbnailPath = quarantine.trimmedThumbnailPath(quarantineFolderPath);

    return AppContextMenuWrapper(
      key: UniqueKey(),
      isEnabled: true,
      useFixedOverlayPosition: false,
      useGlobalPositioning: true,
      menuContent: (controller) {
        return _ContextMenuContent(
          quarantine: quarantine,
          controller: controller,
        );
      },
      child: (overlayPortalController) {
        return ElbMouseRegionGestureDetector(
          onSecondaryTapDown: (details) {
            overlayPortalController.showAt(
              globalPosition: details.globalPosition,
            );
          },
          onTap: kIsWeb
              ? null
              : () async {
                  try {
                    // Try to open the XML file location if available
                    final trimmedPdfPath =
                        quarantine.trimmedPdfPath(quarantineFolderPath);
                    final eskoViewerUrl = ref
                        .read(fetchAndWatchGlobalSettingsProvider)
                        .requireValue
                        .data
                        .pdfViewerUrl;
                    unawaited(
                      AEUtils.openPdfInAEViewer(
                        trimmedPdfPath,
                        eskoViewerUrl,
                      ),
                    );
                  } catch (e) {
                    // Ignore errors - file might not exist or be accessible
                  }
                },
          cursor: SystemMouseCursors.click,
          onEnter: (_) => thumbnailIsHovered.value = true,
          onExit: (_) => thumbnailIsHovered.value = false,
          child: OpenInNewHoverArea(
            isActive: thumbnailIsHovered.value && !kIsWeb,
            child: _ThumbnailImage(
              thumbnailPath: thumbnailPath,
            ),
          ),
        );
      },
    );
  }
}

/// Displays the actual thumbnail image
class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({
    required this.thumbnailPath,
  });

  final String thumbnailPath;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return kIsWeb
        ? ColoredBox(
            color: theme.generalColors.background,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ElbIcon(
                    AppIcons.image,
                    size: AppIconSize.l,
                  ),
                  const SizedBox(height: UiConstants.elementMargin / 2),
                  AppText(
                    'Thumbnail not available on web'.hc,
                    fontSize: 12,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        : Image.file(
            // TODO: fix for web
            File(thumbnailPath),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return _ThumbnailError();
            },
          );
  }
}

/// Error state when thumbnail fails to load
class _ThumbnailError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElbIcon(
            AppIcons.errorHint,
            size: AppIconSize.l,
            color: context.appTheme.statusColors.error,
          ),
          const SizedBox(height: UiConstants.elementMargin / 2),
          AppText(
            ppL10n.artwork_thumbnail_not_found,
            color:
                context.appTheme.generalColors.onBackground.withAppOpacity(0.6),
            fontSize: 12,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ContextMenuContent extends HookConsumerWidget {
  const _ContextMenuContent({
    required this.quarantine,
    required this.controller,
  });

  final ArtworkQuarantine quarantine;
  final ListenableOverlayPortalController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final globalSettings =
        ref.watch(fetchAndWatchGlobalSettingsProvider).requireValue;
    final quarantineFolderPath = globalSettings.data.artworkFolderPath;
    final eskoViewerUrl = globalSettings.data.pdfViewerUrl;

    // Get global settings for thumbnail path construction

    return AppContextMenu(
      controller: controller,
      items: [
        AppContextMenuItem(
          label: l10n.gen_open_entity('PDF'),
          onTap: () async {
            final trimmedPdfPath =
                quarantine.trimmedPdfPath(quarantineFolderPath);
            unawaited(UriLauncher.openFilePath(trimmedPdfPath));
          },
        ),
        AppContextMenuItem(
          label: l10n.gen_open_entity('PDF (ESKO)'),
          onTap: () async {
            final trimmedPdfPath =
                quarantine.trimmedPdfPath(quarantineFolderPath);
            unawaited(
              AEUtils.openPdfInAEViewer(
                trimmedPdfPath,
                eskoViewerUrl,
              ),
            );
          },
        ),
        AppContextMenuItem(
          label: l10n.gen_open_entity('JPG'),
          onTap: () async {
            final trimmedJpgPath =
                quarantine.trimmedThumbnailPath(quarantineFolderPath);
            unawaited(UriLauncher.openFilePath(trimmedJpgPath));
          },
        ),
      ],
    );
  }
}
