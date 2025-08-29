import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/config/artwork_quarantine_fields.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/artwork_quarantine_thumbnail_pdf.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/table/artwork_quarantine_color_view_table.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/widgets/table/artwork_quarantine_missing_colors_table.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine_group/logic/artwork_quarantine_group_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

part 'pages/artwork_quarantine_card_main_page.dart';

/// Artwork Quarantine Card
///
/// This card is used to display an artwork quarantine item
/// for review and processing using the group state
class ArtworkQuarantineInGroupCard extends HookConsumerWidget {
  const ArtworkQuarantineInGroupCard({
    required this.floatingWindowId,
    required this.artworkQuarantineUUid,
    required this.customerId,
    required this.floatingWindowFocus,
    required this.groupId,
    required this.sessionId,
    this.navigatorKey,
    this.initialNoteId,
    this.initialNoteParentId,
    this.readOnly = false,
    super.key,
  });

  final String floatingWindowId;
  final String artworkQuarantineUUid;
  final int customerId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode floatingWindowFocus;
  final int? initialNoteId;
  final int? initialNoteParentId;
  final int groupId;
  final String sessionId;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final groupStateNotifier = ref.watch(
      artworkQuarantineGroupStateProvider(groupId, sessionId).notifier,
    );

    final initialArtworkQuarantine = useMemoized(
      () {
        final group = ref
            .read(artworkQuarantineGroupStateProvider(groupId, sessionId))
            .requireValue;

        return group.artworkQuarantines
            ?.firstWhereOrNull(
              (a) => a.general.quarantineUuid == artworkQuarantineUUid,
            )
            ?.copyWith(group: group);
      },
      [artworkQuarantineUUid],
    );
    final ppL10n = context.prepressL10n;

    return ElbDialog(
      isSelfScrollable: true,
      title: ppL10n.artwork_quarantine_singular,
      onCancel: () {
        ref
            .read(
              artworkQuarantineGroupStateProvider(groupId, sessionId).notifier,
            )
            .updateArtwork(
              initialArtworkQuarantine!.general.quarantineUuid,
              initialArtworkQuarantine.copyWith(group: null),
            );
        Navigator.of(context).pop();
      },
      floatingWindowId: floatingWindowId,
      child: Column(
        children: [
          if (initialArtworkQuarantine != null)
            _ArtworkQuarantineCardMainPage(
              stateNotifier: groupStateNotifier,
              artworkQuarantine: initialArtworkQuarantine,
              readOnly: readOnly,
              floatingWindowId: floatingWindowId,
              navigatorKey: navigatorKey ?? GlobalKey<NavigatorState>(),
              groupSessionId: sessionId,
              floatingWindowFocus: floatingWindowFocus,
              customerId: customerId,
              artworkQuarantineRuntimeId: artworkQuarantineUUid,
            )
          else
            Center(
              child: AppText(
                l10n.gen_entity_not_found(
                  ppL10n.artwork_quarantine_plural,
                ),
              ),
            ),
          const AppDivider(),
          CardFooterTemplate(
            leadingActions: [
              AppButton.secondary(
                label: l10n.gen_cancel,
                onPressed: () {
                  ref
                      .read(
                        artworkQuarantineGroupStateProvider(
                          groupId,
                          sessionId,
                        ).notifier,
                      )
                      .updateArtwork(
                        initialArtworkQuarantine!.general.quarantineUuid,
                        initialArtworkQuarantine.copyWith(group: null),
                      );
                  Navigator.of(context).pop();
                },
              ),
            ],
            trailingActions: [
              Consumer(
                builder: (context, ref, _) {
                  // Get the edited artwork quarantine from the group state
                  final editedGroup = ref
                      .watch(
                        artworkQuarantineGroupStateProvider(
                          groupId,
                          sessionId,
                        ),
                      )
                      .requireValue;

                  // Get the edited artwork quarantine from it's group
                  final editedArtworkQuarantine = editedGroup.artworkQuarantines
                      ?.firstWhereOrNull(
                        (a) =>
                            a.general.quarantineUuid == artworkQuarantineUUid,
                      )
                      ?.copyWith(group: initialArtworkQuarantine?.group);

                  // Compare initial with edited quarantine
                  final hasChanges =
                      initialArtworkQuarantine != editedArtworkQuarantine;

                  return AppButton.primary(
                    label: l10n.gen_apply,
                    onPressed: (hasChanges && !readOnly)
                        ? () {
                            Navigator.of(context).pop();
                          }
                        : null,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
