import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Sales Order Artwork Quarantines
///
/// Displays the artwork quarantine groups associated with the sales order
class SalesOrderArtworkQuarantines extends HookConsumerWidget {
  const SalesOrderArtworkQuarantines({
    required this.customerId,
    required this.navigatorKey,
    required this.floatingWindowFocus,
    required this.floatingWindowId,
    required this.salesOrderId,
    required this.componentIdentifier,
    super.key,
  });

  final int customerId;
  final GlobalKey<NavigatorState> navigatorKey;
  final FocusNode floatingWindowFocus;
  final String floatingWindowId;
  final int salesOrderId;
  final ComponentIdentifier componentIdentifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;
    final isGridView = useState<bool>(true); // Default to grid view

    // Watch for artwork quarantine groups for this customer
    final groupsAsyncValue = ref.watch(
      watchArtworkQuarantineGroupsByCustomerProvider(
        customerId,
      ),
    );

    return CollapsibleCardSection(
      identifier: componentIdentifier.name,
      title: l10n.data_import,
      trailingWidgets: [
        // View toggle button
        AppIconButton.secondary(
          iconData: isGridView.value
              ? AppIcons.tiles_view
              : AppIcons.view_column_outlined,
          onPressed: () => isGridView.value = !isGridView.value,
          tooltip:
              isGridView.value ? l10n.gen_ui_table_view : l10n.gen_ui_list_view,
        ),
      ],
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 500,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: groupsAsyncValue.fastWhen(
            data: (groups) {
              // Filter out status.canceled and inUse
              final filteredGroups = groups
                  .where(
                    (group) =>
                        group.status != ArtworkQuarantineGroupStatus.canceled &&
                        group.status != ArtworkQuarantineGroupStatus.inUse,
                  )
                  .toList();

              if (filteredGroups.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(AppSpace.l),
                  child: AppText(
                    l10n.gen_no_entities_assigned(
                      salesL10n.prepress_artwork_quarantine_group_plural,
                    ),
                    color:
                        context.appTheme.buttonStyles.secondary.foregroundColor,
                  ),
                );
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: filteredGroups.map((group) {
                  final isGroupQuarantinesEmpty =
                      group.artworkQuarantines?.isEmpty ?? true;

                  final hasOnlyDeleted = group.artworkQuarantines?.every(
                        (quarantine) => quarantine.meta.deletedAt != null,
                      ) ??
                      true;

                  // Skip groups that are empty or have only deleted
                  // quarantines
                  if (isGroupQuarantinesEmpty || hasOnlyDeleted) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppSpace.s,
                    ),
                    child: ArtworkQuarantineGroupTile(
                      group: group,
                      navigatorKey: navigatorKey,
                      floatingWindowFocus: floatingWindowFocus,
                      floatingWindowId: floatingWindowId,
                      customerId: customerId,
                      salesOrderId: salesOrderId,
                      showGridView: isGridView.value,
                      onTap: () {
                        ref.openWindow(
                          FloatingArtworkQuarantineGroupWindowData(
                            groupId: group.meta.id,
                            customerId: customerId,
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
