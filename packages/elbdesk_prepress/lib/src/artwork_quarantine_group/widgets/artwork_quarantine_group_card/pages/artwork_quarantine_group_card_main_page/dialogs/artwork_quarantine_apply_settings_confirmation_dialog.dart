import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Dialog that asks the user to confirm applying group settings to all
/// open artworks
class ArtworkQuarantineApplySettingsConfirmationDialog
    extends HookConsumerWidget {
  const ArtworkQuarantineApplySettingsConfirmationDialog({
    required this.groupId,
    required this.floatingWindowId,
    required this.sessionId,
    super.key,
  });

  final int groupId;

  final String floatingWindowId;
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;
    final isLoadingNotifier = useState<bool>(false);

    final stateNotifier = ref.watch(
      artworkQuarantineGroupStateProvider(groupId, sessionId).notifier,
    );

    final group = ref.watch(
      artworkQuarantineGroupStateProvider(groupId, sessionId).select(
        (state) => state.requireValue,
      ),
    );

    // Count open artworks
    final openArtworksCount = group.artworkQuarantines
            ?.where(
              (artwork) =>
                  artwork.general.status == ArtworkQuarantineGroupStatus.open,
            )
            .length ??
        0;

    return ElbDialog(
      maxWidth: 600,
      isSelfScrollable: false,
      isLoading: isLoadingNotifier.value,
      blockShortcuts: isLoadingNotifier.value,
      title: ppL10n.artwork_quarantine_group_apply_settings_confirmation_title,
      floatingWindowId: floatingWindowId,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Confirmation message
          AppText(
            ppL10n.artwork_quarantine_group_apply_settings_confirmation_message(
              openArtworksCount.toString(),
            ),
            style: context.appTheme.textStyles.defaultText,
          ),
          const SizedBox(height: UiConstants.defaultPadding),
          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton.secondary(
                onPressed: isLoadingNotifier.value
                    ? null
                    : () => Navigator.of(context).pop(),
                label: l10n.gen_cancel,
              ),
              const SizedBox(width: UiConstants.defaultPadding),
              AppButton.primary(
                onPressed: isLoadingNotifier.value || openArtworksCount == 0
                    ? null
                    : () async {
                        isLoadingNotifier.value = true;
                        try {
                          // Apply group settings to all open artworks
                          stateNotifier.applyGroupSettingsToAllArtworks();
                          Navigator.of(context).pop(true);
                        } catch (e) {
                          Navigator.of(context).pop(false);
                        } finally {
                          isLoadingNotifier.value = false;
                        }
                      },
                label: l10n.gen_apply,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
