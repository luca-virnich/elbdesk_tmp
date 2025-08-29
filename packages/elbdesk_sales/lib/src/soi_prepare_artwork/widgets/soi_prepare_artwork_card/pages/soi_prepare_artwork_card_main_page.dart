part of '../soi_prepare_artwork_card.dart';

class _SoiPrepareArtworkCardMainPage extends HookConsumerWidget {
  const _SoiPrepareArtworkCardMainPage({
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
  final SoiPrepareArtworkState stateNotifier;
  final int entityId;
  final SoiPrepareArtwork initialEntity;
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
      soiPrepareArtworkStateProvider(entityId, sessionId)
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
                  soiPrepareArtworkStateProvider(entityId, sessionId).select(
                    (state) => state.requireValue.salesOrderItem?.deadline,
                  ),
                );
                return SoiGeneralSharedSection(
                  readOnly: readOnly,
                  currentDeadline: deadline,
                  statusList: SalesOrderItemStatus.values.soiPrepareArtwork,
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
                  onDeadlineChanged: stateNotifier.onDeadlineDateChanged,
                  identifier: ComponentIdentifier
                      .soiPrepareArtworkMainPageGeneralShared,
                );
              },
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              title: l10n.gen_general,
              identifier:
                  ComponentIdentifier.soiPrepareArtworkMainPageGeneral.name,
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
                            soiPrepareArtworkStateProvider(
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
                  ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                    label: '',
                    readOnly: readOnly,
                    childBuilder: (labelPosition) => Consumer(
                      builder: (context, ref, child) {
                        return _EyeCStatusView(
                          labelPosition: labelPosition,
                          width: constraints.maxWidth,
                          entityId: entityId,
                          readOnly: readOnly,
                          sessionId: sessionId,
                        );
                      },
                    ),
                  ),
                  ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                    label: '',
                    readOnly: readOnly,
                    childBuilder: (labelPosition) => Consumer(
                      builder: (context, ref, child) {
                        return _DifficultyLevelView(
                          labelPosition: labelPosition,
                          width: constraints.maxWidth,
                          entityId: entityId,
                          readOnly: readOnly,
                          sessionId: sessionId,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),
            CollapsibleCardSection(
              identifier:
                  ComponentIdentifier.soiPrepareArtworkMainPageArtwork.name,
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

class _EyeCStatusView extends HookConsumerWidget {
  const _EyeCStatusView({
    required this.labelPosition,
    required this.width,
    required this.entityId,
    required this.sessionId,
    required this.readOnly,
  });

  final NextCardFormFieldLabelPosition labelPosition;
  final double width;
  final int entityId;
  final String sessionId;
  final bool readOnly;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eyeCStatus = ref.watch(
      soiPrepareArtworkStateProvider(entityId, sessionId)
          .select((state) => state.requireValue.eyeCStatus),
    );
    final l10n = context.l10n;

    return ElbCardSelectionDropdown(
      hasValue: eyeCStatus != null,
      focusOrderId: 6,
      isMandatory: true,
      readOnly: readOnly,
      labelPosition: labelPosition,
      label: 'EyeC',
      items: [
        ElbSelectionDropdownItem(
          label: EyeCStatus.notNecessary.readable(l10n),
          onPressed: () {
            ref
                .read(
                  soiPrepareArtworkStateProvider(entityId, sessionId).notifier,
                )
                .updateEyeCStatus(EyeCStatus.notNecessary);
          },
          color: EyeCStatus.notNecessary.color,
        ),
        ElbSelectionDropdownItem(
          label: EyeCStatus.necessary.readable(l10n),
          onPressed: () {
            ref
                .read(
                  soiPrepareArtworkStateProvider(entityId, sessionId).notifier,
                )
                .updateEyeCStatus(EyeCStatus.necessary);
          },
          color: EyeCStatus.necessary.color,
        ),
        ElbSelectionDropdownItem(
          label: EyeCStatus.done.readable(l10n),
          onPressed: () {
            ref
                .read(
                  soiPrepareArtworkStateProvider(entityId, sessionId).notifier,
                )
                .updateEyeCStatus(EyeCStatus.done);
          },
          color: EyeCStatus.done.color,
        ),
      ],
      buttonLabel: eyeCStatus?.readable(l10n) ?? l10n.gen_please_choose,
      statusColor: eyeCStatus?.color ?? Colors.grey,
    );
  }
}

class _DifficultyLevelView extends HookConsumerWidget {
  const _DifficultyLevelView({
    required this.labelPosition,
    required this.width,
    required this.entityId,
    required this.sessionId,
    required this.readOnly,
  });

  final NextCardFormFieldLabelPosition labelPosition;
  final double width;
  final int entityId;
  final String sessionId;
  final bool readOnly;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficultyLevel = ref.watch(
      soiPrepareArtworkStateProvider(entityId, sessionId)
          .select((state) => state.requireValue.difficultyLevel),
    );
    final l10n = context.l10n;

    return ElbCardSelectionDropdown(
      focusOrderId: 7,
      hasValue: difficultyLevel != null,
      isMandatory: true,
      readOnly: readOnly,
      labelPosition: labelPosition,
      label: l10n.soi_prepare_artwork_difficulty,
      items: [
        ElbSelectionDropdownItem(
          label: SoiPrepareArtworkDifficultyLevel.easy.readable(l10n),
          onPressed: () {
            ref
                .read(
                  soiPrepareArtworkStateProvider(entityId, sessionId).notifier,
                )
                .updateDifficultyLevel(SoiPrepareArtworkDifficultyLevel.easy);
          },
          color: SoiPrepareArtworkDifficultyLevel.easy.color,
        ),
        ElbSelectionDropdownItem(
          label: SoiPrepareArtworkDifficultyLevel.medium.readable(l10n),
          onPressed: () {
            ref
                .read(
                  soiPrepareArtworkStateProvider(entityId, sessionId).notifier,
                )
                .updateDifficultyLevel(SoiPrepareArtworkDifficultyLevel.medium);
          },
          color: SoiPrepareArtworkDifficultyLevel.medium.color,
        ),
        ElbSelectionDropdownItem(
          label: SoiPrepareArtworkDifficultyLevel.hard.readable(l10n),
          onPressed: () {
            ref
                .read(
                  soiPrepareArtworkStateProvider(entityId, sessionId).notifier,
                )
                .updateDifficultyLevel(SoiPrepareArtworkDifficultyLevel.hard);
          },
          color: SoiPrepareArtworkDifficultyLevel.hard.color,
        ),
      ],
      buttonLabel: difficultyLevel?.readable(l10n) ?? 'Bitte wählen',
      statusColor: difficultyLevel?.color ?? Colors.grey,
    );
  }
}
