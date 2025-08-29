part of '../soi_einzelformaufbau_card.dart';

class _SoiEinzelformaufbauCardMainPage extends HookConsumerWidget {
  const _SoiEinzelformaufbauCardMainPage({
    required this.stateNotifier,
    required this.initialEntity,
    required this.readOnly,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.artworkSessionId,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.entityId,
    required this.sessionId,
  });
  final SoiEinzelformaufbauState stateNotifier;
  final int entityId;
  final SoiEinzelformaufbau initialEntity;
  final bool readOnly;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String artworkSessionId;
  final FocusNode floatingWindowFocus;
  final int customerId;
  final String sessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;

    final selectedStatus = ref.watch(
      soiEinzelformaufbauStateProvider(entityId, sessionId)
          .select((state) => state.requireValue.salesOrderItem!.status),
    );

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final deadline = ref.watch(
                  soiEinzelformaufbauStateProvider(
                    entityId,
                    sessionId,
                  ).select(
                    (state) => state.requireValue.salesOrderItem?.deadline,
                  ),
                );
                return SoiGeneralSharedSection(
                  currentDeadline: deadline,
                  onDeadlineChanged: stateNotifier.updateDeadline,
                  statusList:
                      SalesOrderItemStatus.values.soiRequestArtworkApproval,
                  width: constraints.maxWidth,
                  salesOrderId: initialEntity.salesOrder!.meta.id!,
                  fullSalesOrderId: initialEntity.salesOrder!.fullSalesOrderId,
                  customerId: initialEntity.artwork.customer!.meta.id!,
                  customerName:
                      initialEntity.artwork.customer!.contact!.general.name,
                  currentStatus: selectedStatus,
                  onStatusSelected: stateNotifier.updateStatus,
                  assignedUser: initialEntity.salesOrderItem!.assignedUser,
                  onAssignedUserSelected: stateNotifier.updateAssignedUser,
                  description: initialEntity.salesOrderItem!.description,
                  onDescriptionChanged: stateNotifier.updateDescription,
                  readOnly: readOnly,
                  identifier: ComponentIdentifier
                      .soiEinzelformaufbauMainPageGeneralShared,
                );
              },
            ),
            const CardSectionDivider(),
            CardSectionTitle(title: l10n.gen_general),
            ElbTwoColumnWrap(
              customL10n: salesL10n,
              readOnly: readOnly,
              validationGroupId: null,
              columnLeft: [
                ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) => Consumer(
                    builder: (context, ref, child) {
                      return AppCardTimeTextField(
                        focusOrder: 5,
                        label: salesL10n.sales_order_item_planned_time,
                        labelPosition: labelPosition,
                        readOnly: readOnly,
                        initialValue:
                            initialEntity.salesOrderItem!.billableTime,
                        onEmptyValue: () {
                          stateNotifier.updateBillableTime(0);
                        },
                        value: ref.watch(
                          soiEinzelformaufbauStateProvider(
                            entityId,
                            sessionId,
                          ).select(
                            (state) =>
                                state.requireValue.salesOrderItem!.billableTime,
                          ),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            stateNotifier.updateBillableTime(value);
                          }
                        },
                        validator: null,
                      );
                    },
                  ),
                ),
              ],
              columnRight: const [],
              width: constraints.maxWidth,
            ),
            const CardSectionDivider(),
            CardSectionTitle(title: salesL10n.prepress_artwork_singular),
            ArtworkRealtimeCompactView(
              artworkId: initialEntity.artwork.meta.id!,
              sessionId: sessionId,
            ),
          ],
        );
      },
    );
  }
}
