part of '../widgets/soi_request_artwork_approval_card.dart';

class _SoiRequestApprovalCardMainPage extends HookConsumerWidget {
  const _SoiRequestApprovalCardMainPage({
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
  final SoiRequestArtworkApprovalState stateNotifier;
  final int entityId;
  final SoiRequestArtworkApproval initialEntity;
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
      soiRequestArtworkApprovalStateProvider(entityId, sessionId)
          .select((state) => state.requireValue.salesOrderItem!.status),
    );

    final type = ref.watch(
      soiRequestArtworkApprovalStateProvider(entityId, sessionId)
          .select((state) => state.requireValue.type),
    );

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Consumer(
              builder: (context, ref, child) {
                final deadline = ref.watch(
                  soiRequestArtworkApprovalStateProvider(
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
                      .soiRequestApprovalMainPageGeneralShared,
                );
              },
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              title: l10n.gen_general,
              identifier:
                  ComponentIdentifier.soiRequestApprovalMainPageGeneral.name,
              child: ElbTwoColumnWrap(
                customL10n: salesL10n,
                readOnly: readOnly,
                validationGroupId: null,
                width: constraints.maxWidth,
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
                            soiRequestArtworkApprovalStateProvider(
                              entityId,
                              sessionId,
                            ).select(
                              (state) => state
                                  .requireValue.salesOrderItem!.billableTime,
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
                columnRight: [
                  ElbTwoColumnDropdown.selection(
                    field: SoiRequestArtworkApprovalFields.fromEnum(
                      SoiRequestArtworkApprovalField.approvalType,
                    ),
                    readOnly: readOnly,
                    value: type,
                    onChanged: stateNotifier.updateType,
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              identifier:
                  ComponentIdentifier.soiRequestApprovalMainPageArtwork.name,
              title: salesL10n.prepress_artwork_singular,
              child: ArtworkRealtimeCompactView(
                artworkId: initialEntity.artwork.meta.id!,
                sessionId: sessionId,
              ),
            ),
          ],
        );
      },
    );
  }
}
