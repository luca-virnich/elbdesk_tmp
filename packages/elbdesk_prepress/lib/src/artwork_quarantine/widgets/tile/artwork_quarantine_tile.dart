import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/artwork_quarantine_thumbnail_pdf.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/create_product_product_part_dialog/create_product_product_dialog.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/tile/artwork_type_front_back_selection.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/extensions/artwork_quarantine_status_extension.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Artwork quarantine tile display type
enum ArtworkQuarantineTileType {
  /// Standard mode with editable fields
  standard,

  /// Compact mode with read-only display
  compact,
}

/// Artwork quarantine tile
///
/// Displayed in DataImport / ArtworkQuarantineGroup
class ArtworkQuarantineTile extends StatelessWidget {
  const ArtworkQuarantineTile({
    required this.artworkQuarantine,
    required this.index,
    required this.sessionId,
    required this.entityId,
    required this.stateNotifier,
    required this.totalArtworks,
    this.readOnly = false,
    this.type = ArtworkQuarantineTileType.standard,
    this.customerId,
    this.salesOrderId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.floatingWindowId,
    this.showCheckbox,
    this.isSelected,
    this.onSelectionChanged,
    this.onPressed,
    super.key,
  });

  /// Compact constructor for read-only display
  const ArtworkQuarantineTile.compact({
    required this.artworkQuarantine,
    required this.index,
    required this.entityId,
    required this.totalArtworks,
    this.customerId,
    this.salesOrderId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.floatingWindowId,
    super.key,
  })  : sessionId = '',
        stateNotifier = null,
        readOnly = true,
        type = ArtworkQuarantineTileType.compact,
        showCheckbox = null,
        isSelected = null,
        onSelectionChanged = null,
        onPressed = null;

  final ArtworkQuarantine artworkQuarantine;
  final int index;
  final String sessionId;
  final int entityId;
  final ArtworkQuarantineGroupState? stateNotifier;
  final int totalArtworks;
  final bool readOnly;
  final ArtworkQuarantineTileType type;
  final int? customerId;
  final int? salesOrderId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;

  // List tile specific properties
  final bool? showCheckbox;
  final bool? isSelected;
  final ValueChanged<bool>? onSelectionChanged;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    final isEditable =
        artworkQuarantine.general.status == ArtworkQuarantineGroupStatus.open &&
            type == ArtworkQuarantineTileType.standard &&
            !readOnly;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.generalColors.primarySurface.withAppOpacity(0.1),
            theme.generalColors.primarySurface.withAppOpacity(0.01),
          ],
        ),
        borderRadius: BorderRadius.circular(theme.borderRadiuses.m),
        border: Border.all(
          color: theme.generalColors.primarySurfaceBorder.withAppOpacity(0.8),
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
        borderRadius: BorderRadius.circular(theme.borderRadiuses.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            _ArtworkTileHeader(
              artworkNumber: index,
              artworkQuarantine: artworkQuarantine,
              stateNotifier: stateNotifier,
              totalArtworks: totalArtworks,
              readOnly: readOnly || !isEditable,
              navigatorKey: navigatorKey,
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
              entityId: entityId,
              sessionId: sessionId,
            ),

            // Main content area
            _ArtworkTileContent(
              artworkQuarantine: artworkQuarantine,
              stateNotifier: stateNotifier,
              readOnly: readOnly || !isEditable,
              type: type,
              customerId: customerId,
              salesOrderId: salesOrderId,
              navigatorKey: navigatorKey,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
            ),
          ],
        ),
      ),
    );
  }
}

/// Header
class _ArtworkTileHeader extends HookConsumerWidget {
  const _ArtworkTileHeader({
    required this.artworkNumber,
    required this.artworkQuarantine,
    required this.stateNotifier,
    required this.totalArtworks,
    required this.readOnly,
    required this.entityId,
    required this.sessionId,
    this.navigatorKey,
    this.floatingWindowId,
    this.floatingWindowFocus,
  });

  final int artworkNumber;
  final ArtworkQuarantine artworkQuarantine;
  final ArtworkQuarantineGroupState? stateNotifier;
  final int totalArtworks;
  final bool readOnly;
  final GlobalKey<NavigatorState>? navigatorKey;
  final String? floatingWindowId;
  final FocusNode? floatingWindowFocus;
  final int entityId;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = context.appTheme;

    final titleHovered = useState<bool>(false);

    return Container(
      padding: const EdgeInsets.all(AppSpace.s),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.generalColors.primary.withAppOpacity(0.05),
            theme.generalColors.primary.withAppOpacity(0.02),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      child: Row(
        children: [
          // Artwork icon and title (Clickable - Opens Artwork Card)
          Expanded(
            child: ElbMouseRegionGestureDetector(
              onEnter: (event) => titleHovered.value = true,
              onExit: (event) => titleHovered.value = false,
              // NavigatorKey and sessionId are required
              // This should only be possible if the user is inside of the
              // group card
              enabled: navigatorKey != null && sessionId.isNotEmpty,
              cursor: titleHovered.value
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.basic,
              onTap: () async {
                await showElbDialog<ArtworkQuarantine?>(
                  context: context,
                  child: ArtworkQuarantineInGroupCard(
                    readOnly: readOnly,
                    floatingWindowId: floatingWindowId ?? '',
                    artworkQuarantineUUid:
                        artworkQuarantine.general.quarantineUuid,
                    customerId: artworkQuarantine.customerId!,
                    floatingWindowFocus: floatingWindowFocus ?? FocusNode(),
                    navigatorKey: navigatorKey,
                    groupId: entityId,
                    sessionId: sessionId,
                  ),
                );
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSpace.xs,
                  ),
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(AppSpace.xs),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          artworkQuarantine.general.status.color
                              .withAppOpacity(0.85),
                          artworkQuarantine.general.status.color
                              .withAppOpacity(0.55),
                        ],
                      ),
                      borderRadius:
                          BorderRadius.circular(theme.borderRadiuses.xs),
                      boxShadow: [
                        BoxShadow(
                          color: (readOnly
                                  ? theme.statusColors.disabled
                                  : artworkQuarantine.general.status.color)
                              .withAppOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ElbIcon(
                      AppIcons.artwork,
                      color: theme.generalColors.onPrimary,
                      size: AppIconSize.l,
                    ),
                  ),

                  const SizedBox(width: AppSpace.m),

                  // Title with filename
                  Expanded(
                    child: _ArtworkTitleWithFilename(
                      artworkNumber: artworkNumber,
                      artworkQuarantine: artworkQuarantine,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Front/Back selector if multiple artworks and artwork exists
          if (!readOnly)
            ArtworkFrontBackSelector(
              artworkQuarantine: artworkQuarantine,
              stateNotifier: stateNotifier!,
              totalArtworks: totalArtworks,
              readOnly: readOnly,
            ),

          // Standard delete button
          if (!readOnly) ...[
            const SizedBox(width: AppSpace.s),
            _ArtworkDeleteButton(
              artworkQuarantine: artworkQuarantine,
              stateNotifier: stateNotifier!,
            ),
          ],
        ],
      ),
    );
  }
}

/// Header artwork type selector that only shows when multiple artworks exist
class ArtworkFrontBackSelector extends StatelessWidget {
  const ArtworkFrontBackSelector({
    required this.artworkQuarantine,
    required this.stateNotifier,
    required this.totalArtworks,
    required this.readOnly,
    super.key,
  });

  final ArtworkQuarantine artworkQuarantine;
  final ArtworkQuarantineGroupState stateNotifier;
  final int totalArtworks;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return ArtworkTypeFrontBackSelection(
      value: stateNotifier.getArtworkType(
        artworkQuarantine.general.quarantineUuid,
      ),
      onPressed: (artworkType) {
        stateNotifier.updateArtworkType(
          artworkQuarantine.general.quarantineUuid,
          artworkType,
        );
      },
      readOnly: readOnly,
    );
  }
}

/// Compact content area
class _ArtworkTileContent extends HookConsumerWidget {
  const _ArtworkTileContent({
    required this.artworkQuarantine,
    required this.stateNotifier,
    required this.readOnly,
    required this.type,
    this.customerId,
    this.salesOrderId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.floatingWindowId,
  });

  final ArtworkQuarantine artworkQuarantine;
  final ArtworkQuarantineGroupState? stateNotifier;
  final bool readOnly;
  final ArtworkQuarantineTileType type;
  final int? customerId;
  final int? salesOrderId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(AppSpace.s),
      child: Row(
        children: [
          // Quarantine data
          ArtworkQuarantineThumbnailPdf(
            quarantine: artworkQuarantine,
            height: 160,
            width: 160,
          ),
          const SizedBox(width: AppSpace.xs),

          if (type == ArtworkQuarantineTileType.standard)
            _TextFields(
              artworkQuarantine: artworkQuarantine,
              stateNotifier: stateNotifier!,
              readOnly: readOnly,
            )
          else
            _CompactDataDisplay(
              artworkQuarantine: artworkQuarantine,
              customerId: customerId,
              salesOrderId: salesOrderId,
              navigatorKey: navigatorKey,
              floatingWindowFocus: floatingWindowFocus,
              floatingWindowId: floatingWindowId,
            ),
        ],
      ),
    );
  }
}

/// Compact data display widget
class _CompactDataDisplay extends StatelessWidget {
  const _CompactDataDisplay({
    required this.artworkQuarantine,
    this.customerId,
    this.salesOrderId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.floatingWindowId,
  });

  final ArtworkQuarantine artworkQuarantine;
  final int? customerId;
  final int? salesOrderId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpace.xs),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dimensions row
            _CompactDimensionsView(
              artworkQuarantine: artworkQuarantine,
            ),
            const SizedBox(height: AppSpace.s),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _CompactDataItem(
                        label: ppL10n.artwork_quarantine_keywords,
                        value: artworkQuarantine
                            .general.keywords.dashWhenNullOrEmpty,
                      ),
                      _CompactDataItem(
                        label: ppL10n.artwork_quarantine_vmop_note,
                        value: artworkQuarantine
                                .analysisData?.note.dashWhenNullOrEmpty ??
                            '',
                      ),
                    ],
                  ),
                ),
                if (salesOrderId != null &&
                    navigatorKey != null &&
                    floatingWindowFocus != null &&
                    floatingWindowId != null) ...[
                  const SizedBox(width: AppSpace.s),
                  _CreateProductButton(
                    artworkQuarantine: artworkQuarantine,
                    customerId: customerId!,
                    salesOrderId: salesOrderId!,
                    navigatorKey: navigatorKey!,
                    floatingWindowFocus: floatingWindowFocus!,
                    floatingWindowId: floatingWindowId!,
                  ),
                  const SizedBox(width: AppSpace.xs),
                  _CreateProductPartButton(
                    artworkQuarantine: artworkQuarantine,
                    customerId: customerId!,
                    salesOrderId: salesOrderId!,
                    navigatorKey: navigatorKey!,
                    floatingWindowFocus: floatingWindowFocus!,
                    floatingWindowId: floatingWindowId!,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CompactDimensionsView extends StatelessWidget {
  const _CompactDimensionsView({
    required this.artworkQuarantine,
  });

  final ArtworkQuarantine artworkQuarantine;

  @override
  Widget build(BuildContext context) {
    final ppL10n = context.prepressL10n;
    return Row(
      children: [
        Expanded(
          child: _CompactDataItem(
            label: ppL10n.artwork_width,
            value: artworkQuarantine.artworkData.width?.toString() ?? '',
          ),
        ),
        const SizedBox(width: AppSpace.s),
        Expanded(
          child: _CompactDataItem(
            label: ppL10n.artwork_height,
            value: artworkQuarantine.artworkData.height?.toString() ?? '',
          ),
        ),
        const SizedBox(width: AppSpace.s),
        Expanded(
          child: _CompactDataItem(
            label: ppL10n.artwork_corner_radius,
            value:
                artworkQuarantine.artworkData.cornerRadius?.toString() ?? '-',
          ),
        ),
      ],
    );
  }
}

/// Compact data item widget
class _CompactDataItem extends StatelessWidget {
  const _CompactDataItem({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          label,
          style: theme.textStyles.defaultText.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: theme.generalColors.onBackground.withAppOpacity(0.7),
          ),
        ),
        const SizedBox(height: AppSpace.xs),
        AppText(
          value,
          style: theme.textStyles.defaultText.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: theme.generalColors.onBackground,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _TextFields extends HookConsumerWidget {
  const _TextFields({
    required this.artworkQuarantine,
    required this.stateNotifier,
    required this.readOnly,
  });

  final ArtworkQuarantine artworkQuarantine;
  final ArtworkQuarantineGroupState stateNotifier;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    // Use individual artwork values
    final widthController = useTextEditingController(
      text: artworkQuarantine.artworkData.width?.toString() ?? '',
    );
    final heightController = useTextEditingController(
      text: artworkQuarantine.artworkData.height?.toString() ?? '',
    );
    final cornerRadiusController = useTextEditingController(
      text: artworkQuarantine.artworkData.cornerRadius?.toString() ?? '',
    );
    final keywordsController = useTextEditingController(
      text: artworkQuarantine.general.keywords ?? '',
    );

    // Update controllers when artworkQuarantine changes
    useEffect(
      () {
        widthController.text =
            artworkQuarantine.artworkData.width?.toString() ?? '';
        heightController.text =
            artworkQuarantine.artworkData.height?.toString() ?? '';
        cornerRadiusController.text =
            artworkQuarantine.artworkData.cornerRadius?.toString() ?? '';

        if (keywordsController.text != artworkQuarantine.general.keywords) {
          keywordsController.text = artworkQuarantine.general.keywords ?? '';
        }
        return null;
      },
      [artworkQuarantine],
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.xs,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dimensions row (Width x Height, Corner Radius)
            _CompactDimensionsView(
              artworkQuarantine: artworkQuarantine,
            ),

            // Vmop Note
            NextCardFormField.text(
              labelPosition: NextCardFormFieldLabelPosition.top,
              readOnly: true,
              focusOrder: 1,
              validationGroup: null,
              label: ppL10n.artwork_quarantine_vmop_note,
              initialText: artworkQuarantine.analysisData?.note ?? '',
              onChanged: null,
              maxLines: 1,
            ),

            // Keywords input
            NextCardFormField.text(
              labelPosition: NextCardFormFieldLabelPosition.top,
              readOnly: readOnly,
              focusOrder: 4,
              validationGroup: null,
              label: ppL10n.artwork_quarantine_keywords,
              controller: keywordsController,
              onChanged: readOnly
                  ? null
                  : (value) {
                      stateNotifier.updateArtworkKeywords(
                        artworkQuarantine.general.quarantineUuid,
                        value,
                      );
                    },
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}

/// Beautiful title with filename
class _ArtworkTitleWithFilename extends StatelessWidget {
  const _ArtworkTitleWithFilename({
    required this.artworkNumber,
    required this.artworkQuarantine,
  });

  final int artworkNumber;
  final ArtworkQuarantine artworkQuarantine;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    // Get filename from artwork data

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main title with count and filename
        AppText(
          '$artworkNumber - ${artworkQuarantine.fileName}',
          style: theme.textStyles.defaultText.copyWith(
            color: theme.generalColors.onBackground,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // Subtle subtitle showing the artwork type
        AppText(
          artworkQuarantine.general.quarantineUuid,
          maxLines: 1,
          style: theme.textStyles.defaultText.copyWith(
            color: theme.generalColors.onBackground.withAppOpacity(0.6),
            fontSize: 11,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

/// Delete button
class _ArtworkDeleteButton extends HookWidget {
  const _ArtworkDeleteButton({
    required this.artworkQuarantine,
    required this.stateNotifier,
  });

  final ArtworkQuarantine artworkQuarantine;
  final ArtworkQuarantineGroupState stateNotifier;

  @override
  Widget build(BuildContext context) {
    final isLoading = useState<bool>(false);

    return AppIconButton.secondary(
      icon: const Icon(
        AppIcons.delete,
      ),
      onPressed: isLoading.value
          ? null
          : () async {
              isLoading.value = true;
              await AsyncHandler.handleAsyncOperation(
                context,
                () async {
                  stateNotifier
                      .removeArtwork(artworkQuarantine.general.quarantineUuid);
                },
              );
              isLoading.value = false;
            },
    );
  }
}

/// Create Product Button for Artwork Quarantine Tile
class _CreateProductButton extends HookConsumerWidget {
  const _CreateProductButton({
    required this.artworkQuarantine,
    required this.customerId,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
  });

  final ArtworkQuarantine artworkQuarantine;
  final int customerId;
  final int salesOrderId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;
    final isEnabled = useMemoized(
      () =>
          artworkQuarantine.general.status == ArtworkQuarantineGroupStatus.done,
      [artworkQuarantine],
    );
    return AppButton.secondary(
      icon: const Icon(
        AppIcons.add,
      ),
      tooltip: ppL10n.product_create,
      onPressed: !isEnabled
          ? null
          : () async {
              await showElbDialog<SalesOrderItemTypesFromArtworkQuarantine?>(
                context: context,
                navigatorKey: navigatorKey,
                child: CreateProductDialog(
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  artworkQuarantine: artworkQuarantine,
                  navigatorKey: navigatorKey,
                  floatingWindowFocus: floatingWindowFocus,
                  floatingWindowId: floatingWindowId,
                ),
              );
            },
    );
  }
}

/// Create Product Part Button for Artwork Quarantine Tile
class _CreateProductPartButton extends HookConsumerWidget {
  const _CreateProductPartButton({
    required this.artworkQuarantine,
    required this.customerId,
    required this.salesOrderId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
  });

  final ArtworkQuarantine artworkQuarantine;
  final int customerId;
  final int salesOrderId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ppL10n = context.prepressL10n;

    final isEnabled = useMemoized(
      () =>
          artworkQuarantine.general.status == ArtworkQuarantineGroupStatus.done,
      [artworkQuarantine],
    );

    return AppButton.secondary(
      icon: const Icon(
        AppIcons.product,
      ),
      tooltip: ppL10n.artwork_add_to_product,
      onPressed: !isEnabled
          ? null
          : () async {
              await showElbDialog<SalesOrderItemTypesFromArtworkQuarantine?>(
                context: context,
                navigatorKey: navigatorKey,
                child: CreateProductPartDialog(
                  customerId: customerId,
                  salesOrderId: salesOrderId,
                  artworkQuarantine: artworkQuarantine,
                  navigatorKey: navigatorKey,
                  floatingWindowFocus: floatingWindowFocus,
                  floatingWindowId: floatingWindowId,
                ),
              );
            },
    );
  }
}
