import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_sales/src/sales_order/widgets/sales_order_drucklayout/add_drucklayout_to_sales_order_dialog.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A compact pictogram tile for Drucklayout, styled like SoiStatusPictoView.
///
/// Shows existing Drucklayouts or provides option to create new ones.
class DrucklayoutPictoTile extends HookConsumerWidget {
  const DrucklayoutPictoTile({
    required this.drucklayout,
    required this.customerId,
    required this.salesOrderId,
    required this.artworkId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    this.isEnabled = true,
    this.size = 55.0,
    super.key,
  });

  /// The Drucklayout entity
  final Drucklayout? drucklayout;

  /// Customer ID for dialog
  final int customerId;

  /// Sales order ID for dialog
  final int salesOrderId;

  /// Artwork ID
  final int artworkId;

  /// Session ID for dialog
  final String sessionId;

  /// Floating window ID for dialog
  final String floatingWindowId;

  /// Floating window focus callback for dialog
  final FocusNode floatingWindowFocus;

  /// Navigator key for dialog
  final GlobalKey<NavigatorState> navigatorKey;

  /// Tile size
  final double size;

  /// Whether the tile is enabled
  final bool isEnabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final theme = context.appTheme;
    final generalColors = theme.generalColors;
    final isLoading = useState<bool>(false);

    if (drucklayout == null) {
      // If no layout exists -> Show create button
      return AppPictoTile(
        isEnabled: isEnabled,
        icon: AppIcons.add,
        label: ppL10n.drucklayout_singular,
        tooltip: l10n.gen_add_entity(ppL10n.drucklayout_singular),
        onPressed: isLoading.value
            ? null
            : () async {
                isLoading.value = true;
                try {
                  await showElbDialog<void>(
                    context: context,
                    navigatorKey: navigatorKey,
                    child: AddDrucklayoutToSalesOrderDialog(
                      customerId: customerId,
                      salesOrderId: salesOrderId,
                      sessionId: sessionId,
                      floatingWindowId: floatingWindowId,
                      floatingWindowFocus: floatingWindowFocus,
                      navigatorKey: navigatorKey,
                    ),
                  );
                } finally {
                  isLoading.value = false;
                }
              },
        size: size,
        width: size * 2,
        gradientColors: [
          generalColors.primarySurfaceBorder.withAppOpacity(0.2),
          generalColors.primarySurfaceBorder.withAppOpacity(0),
        ],
        borderColor: generalColors.primarySurfaceBorder,
        borderRadius: theme.borderRadiuses.s,
        shadowColor: generalColors.primary.withAppOpacity(0.05),
        iconColor: generalColors.onBackground,
        labelColor: generalColors.onBackground,
      );
    }

    final tooltip = drucklayout!.title;

    return AppPictoTile(
      icon: AppIcons.drucklayout,
      label: drucklayout!.title,
      tooltip: tooltip,
      onPressed: () {
        // Open Drucklayout card for editing using the floating window system
        ref.openWindow(
          FloatingDrucklayoutWindowData(
            entityId: drucklayout!.id,
            customerId: customerId,
            salesOrderId: salesOrderId,
            preSelectionId: drucklayout!.preSelectionId!,
            selectionId: drucklayout!.selectionId!,
          ),
        );
      },
      size: size,
      width: size * 2,
      gradientColors: [
        generalColors.primarySurfaceBorder.withAppOpacity(0.2),
        generalColors.primarySurfaceBorder.withAppOpacity(0),
      ],
      borderColor: generalColors.primarySurfaceBorder,
      borderRadius: theme.borderRadiuses.s,
      shadowColor: generalColors.primary.withAppOpacity(0.05),
      iconColor: generalColors.onBackground,
      labelColor: generalColors.onBackground,
    );
  }
}
