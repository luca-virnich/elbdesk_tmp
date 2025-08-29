import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// Dedicated widget for displaying artwork quarantines in overview screens
/// with index selection functionality
class ArtworkQuarantineOverviewTile extends StatelessWidget {
  /// Constructor for quarantine selection with checkboxes
  const ArtworkQuarantineOverviewTile.chooseQuarantine({
    required this.artworkQuarantine,
    required this.index,
    required this.showCheckbox,
    required this.isSelected,
    this.onSelectionChanged,
    this.onPressed,
    this.customerId,
    this.salesOrderId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.floatingWindowId,
    super.key,
  })  : displayIndex = 0,
        onIndexChanged = null;

  /// Constructor for index selection with editable index field
  const ArtworkQuarantineOverviewTile.chooseIndex({
    required this.artworkQuarantine,
    required this.index,
    required this.displayIndex,
    required this.onIndexChanged,
    super.key,
  })  : showCheckbox = null,
        isSelected = false,
        onSelectionChanged = null,
        onPressed = null,
        customerId = null,
        salesOrderId = null,
        navigatorKey = null,
        floatingWindowFocus = null,
        floatingWindowId = null;

  final ArtworkQuarantine artworkQuarantine;
  final int index;
  final int displayIndex;
  final ValueChanged<int>? onIndexChanged;

  // Choose quarantine specific properties
  final bool? showCheckbox;
  final bool isSelected;
  final ValueChanged<bool>? onSelectionChanged;
  final VoidCallback? onPressed;
  final int? customerId;
  final int? salesOrderId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;
  final String? floatingWindowId;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final ppL10n = context.prepressL10n;

    // If this is a choose quarantine tile, use the list tile layout
    if (showCheckbox != null) {
      return ElbListTile(
        leading: showCheckbox!
            ? Padding(
                padding: const EdgeInsets.only(right: AppSpace.s),
                child: AppCheckbox(
                  value: isSelected,
                  onChanged: onSelectionChanged,
                ),
              )
            : null,
        onPressed: onPressed,
        child: Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: AppText(
                  artworkQuarantine.general.description,
                  style: context.appTheme.textStyles.defaultText,
                ),
              ),
              const SizedBox(width: AppSpace.m),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    AppText(
                      artworkQuarantine.dimensions(false),
                      style: context.appTheme.textStyles.defaultText.copyWith(
                        fontSize: 12,
                      ),
                    ),
                    if (artworkQuarantine.artworkData.cornerRadius != null) ...[
                      const SizedBox(width: AppSpace.s),
                      AppText(
                        artworkQuarantine.readableCornerRadius(ppL10n),
                        style: context.appTheme.textStyles.defaultText.copyWith(
                          fontSize: 12,
                        ),
                      ),
                    ],
                    const Spacer(),
                    if (artworkQuarantine.general.keywords != null &&
                        artworkQuarantine.general.keywords!.isNotEmpty) ...[
                      const SizedBox(width: AppSpace.m),
                      AppText(
                        '${ppL10n.artwork_quarantine_keywords}: '
                        '${artworkQuarantine.general.keywords}',
                        style: context.appTheme.textStyles.defaultText.copyWith(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Otherwise, use the overview tile layout with index field
    return Container(
      padding: const EdgeInsets.all(AppSpace.s),
      decoration: BoxDecoration(
        color: theme.generalColors.primarySurface.withAppOpacity(0.05),
        borderRadius: BorderRadius.circular(theme.borderRadiuses.s),
        border: Border.all(
          color: theme.generalColors.primarySurfaceBorder.withAppOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Index field
          SizedBox(
            width: 80,
            child: NextCardFormField.int(
              labelPosition: NextCardFormFieldLabelPosition.top,
              readOnly: false,
              label: ppL10n.product_index,
              validationGroup: null,
              onChanged: (value) {
                final asInt = int.tryParse(value);
                if (asInt != null && onIndexChanged != null) {
                  onIndexChanged!(asInt);
                }
              },
              initialInt: displayIndex,
            ),
          ),
          const SizedBox(width: AppSpace.m),

          // Quarantine info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with filename
                AppText(
                  artworkQuarantine.general.description,
                  style: theme.textStyles.defaultText.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: AppSpace.xs),

                // Dimensions and details
                Row(
                  children: [
                    AppText(
                      artworkQuarantine.dimensions(false),
                      style: theme.textStyles.defaultText.copyWith(
                        fontSize: 12,
                        color: theme.generalColors.onBackground
                            .withAppOpacity(0.7),
                      ),
                    ),
                    if (artworkQuarantine.artworkData.cornerRadius != null) ...[
                      const SizedBox(width: AppSpace.s),
                      AppText(
                        artworkQuarantine.readableCornerRadius(ppL10n),
                        style: theme.textStyles.defaultText.copyWith(
                          fontSize: 12,
                          color: theme.generalColors.onBackground
                              .withAppOpacity(0.7),
                        ),
                      ),
                    ],
                  ],
                ),

                // Keywords if available
                if (artworkQuarantine.general.keywords != null &&
                    artworkQuarantine.general.keywords!.isNotEmpty) ...[
                  const SizedBox(height: AppSpace.xs),
                  AppText(
                    '${ppL10n.artwork_quarantine_keywords}: '
                    '${artworkQuarantine.general.keywords}',
                    style: theme.textStyles.defaultText.copyWith(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      color:
                          theme.generalColors.onBackground.withAppOpacity(0.6),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
