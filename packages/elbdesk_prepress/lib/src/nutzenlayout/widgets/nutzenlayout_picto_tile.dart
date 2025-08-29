import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/nutzenlayout/extensions/nutzenlayout_form_type_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A compact pictogram tile for Nutzenlayout, styled like SoiStatusPictoView.
///
/// Differentiates between Einzelform and Sammelform, and opens the correct
/// dialog on press.
class NutzenlayoutPictoTile extends HookWidget {
  const NutzenlayoutPictoTile({
    required this.nutzenlayout,
    required this.customerId,
    required this.salesOrderId,
    required this.artworkId,
    required this.sessionId,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    required this.navigatorKey,
    this.size = 55.0,
    super.key,
  });

  /// The Nutzenlayout entity
  final Nutzenlayout? nutzenlayout;

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

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final theme = context.appTheme;
    final generalColors = theme.generalColors;
    final isLoading = useState(false);

    if (nutzenlayout == null) {
      // If no layout exists -> Show create button
      return AppRotateAwayButtonWrapper(
        targetHeight: size,
        targetWidth: size * 2,
        primaryActionLabel: ppL10n.soi_einzelformaufbau_singular_short,
        onPrimaryAction: isLoading.value
            ? null
            : () async {
                await showElbDialog<void>(
                  context: context,
                  child: AddEinzelformaufbauDialog(
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    artworkId: artworkId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                  ),
                  navigatorKey: navigatorKey,
                );
              },
        secondaryActionLabel: ppL10n.soi_sammelformaufbau_singular_short,
        onSecondaryAction: isLoading.value
            ? null
            : () async {
                await showElbDialog<void>(
                  context: context,
                  child: AddSammelformaufbauDialog(
                    customerId: customerId,
                    salesOrderId: salesOrderId,
                    artworkId: artworkId,
                    sessionId: sessionId,
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                  ),
                  navigatorKey: navigatorKey,
                );
              },
        frontContentBuilder: (context, flipToBack) => AppPictoTile(
          icon: AppIcons.add,
          label: l10n.gen_create,
          tooltip: l10n.gen_create,
          onPressed: flipToBack,
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
        ),
      );
    }

    final formType = nutzenlayout!.formType;

    final tooltip = formType.readable(ppL10n);

    /// Opens the correct dialog based on form type
    Future<void> openDialog() async {
      if (formType == NutzenlayoutFormType.einzelform) {
        await showElbDialog<void>(
          context: context,
          child: EditEinzelformaufbauDialog(
            nutzenlayout: nutzenlayout!,
            customerId: customerId,
            salesOrderId: salesOrderId,
            sessionId: sessionId,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            navigatorKey: navigatorKey,
          ),
          navigatorKey: navigatorKey,
        );
      } else if (formType == NutzenlayoutFormType.sammelform) {
        await showElbDialog<void>(
          context: context,
          child: EditMultiNutzenlayoutSelectionDialog(
            nutzenlayout: nutzenlayout!,
            customerId: customerId,
            salesOrderId: salesOrderId,
            sessionId: sessionId,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            navigatorKey: navigatorKey,
            includedArtworks: null,
          ),
          navigatorKey: navigatorKey,
        );
      }
    }

    return AppPictoTile(
      icon: formType.icon,
      label: nutzenlayout!.matrixReadable(l10n),
      tooltip: tooltip,
      onPressed: openDialog,
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
