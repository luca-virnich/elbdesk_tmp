import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_sales/src/sales_order_item/widgets/soi_general_shared_section.dart';
import 'package:elbdesk_sales/src/soi_consulting/logic/soi_consulting_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class SoiConsultingCard extends HookConsumerWidget {
  const SoiConsultingCard({
    required this.floatingWindowId,
    required this.entityId,
    required this.salesOrderId,
    required this.floatingWindowFocus,
    required this.customerId,
    required this.floatingWindowType,
    this.navigatorKey,
    this.initialNoteId,
    this.initialNoteParentId,
    super.key,
  });
  final String floatingWindowId;
  final int? entityId;
  final int customerId;
  final int salesOrderId;

  final GlobalKey<NavigatorState>? navigatorKey;

  final FocusNode floatingWindowFocus;
  final String floatingWindowType;
  final int? initialNoteId;
  final int? initialNoteParentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useFormKey();
    final l10n = context.l10n;
    final salesL10n = context.salesL10n;

    Future<SoiConsulting> onSavePressed(
      int entityId,
      String sessionId,
    ) async {
      final data = ref
          .read(soiConsultingStateProvider(entityId, sessionId))
          .requireValue;

      // if not company, check if we
      // check if contact has customer

      await ref.read(soiConsultingRepositoryProvider).update(
            entity: data,
            release: false,
            sessionId: sessionId,
          );
      ref
          .read(soiConsultingStateProvider(entityId, sessionId).notifier)
          .updateMetaAfterSave();
      ref.read(recentWindowsProvider.notifier).updateEntityWindow(
            RecentWindow(
              type: floatingWindowType,
              entityId: entityId,
              label: salesL10n.soi_consulting_singular,
              additionalData: SoiConsultingAdditionalData(
                customerId: customerId,
                salesOrderId: salesOrderId,
                fullSalesOrderId: data.salesOrder!.fullSalesOrderId,
              ).toJson(),
            ),
          );
      ref.invalidate(findSalesOrderItemsProvider);
      return data;
    }

    return EntityCard<SoiConsulting>(
      floatingWindowType: floatingWindowType,
      floatingWindowFocus: floatingWindowFocus,
      formKey: formKey,
      onSave: (entityId, sessionId, navigatorKey) =>
          onSavePressed(entityId, sessionId),
      showTitleBar: true,
      invalidateEntityState: (entityId, sessionId) async {
        ref.invalidate(
          soiConsultingStateProvider(entityId, sessionId),
        );
      },
      stateRefetchWithoutLock: (entityId, sessionId) async {
        await ref
            .read(soiConsultingStateProvider(entityId, sessionId).notifier)
            .refetchWithoutLock();
      },
      streamDataProvider: ({
        required sessionId,
        required dataId,
      }) =>
          watchSoiConsultingProvider(
        sessionId: sessionId,
        id: dataId,
      ),
      tableType: TableType.soiConsulting.name,
      stateSaveUnlockRefetch: (editingSessionId, dataId, navigatorKey) async {
        await ref
            .read(
              soiConsultingStateProvider(dataId, editingSessionId).notifier,
            )
            .saveAndUnlockAndRefetch();
      },
      entityId: entityId,
      stateRefetchWithLock: (entityId, sessionId) => ref
          .read(soiConsultingStateProvider(entityId, sessionId).notifier)
          .refetchWithLock(),
      floatingWindowId: floatingWindowId,
      stateProvider: soiConsultingStateProvider.call,
      createEntity: (sessionId) =>
          ref.read(soiConsultingRepositoryProvider).create(
                sessionId: sessionId,
                salesOrderId: salesOrderId,
                customerId: customerId,
              ),
      getTitle: (entity) => entity.soiIdReadable,
      tableIcon: (entityId, sessionId) => AppIcons.soiConsulting,
      tablePrefix: (entityId, sessionId) => salesL10n.soi_consulting_singular,
      childBuilder: (
        context,
        entityId,
        sessionId,
        selectedNavIndexRef,
        navigatorKey,
        readOnly,
        meta,
        initialEntity,
        isSaving,
        savedOrInitialEntity,
        isFirstRender,
      ) {
        final stateNotifier = ref.watch(
          soiConsultingStateProvider(entityId, sessionId).notifier,
        );
        useEffect(
          () {
            if (!isFirstRender.value) return;
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              ref.read(recentWindowsProvider.notifier).insertEntityWindow(
                    RecentWindow(
                      type: floatingWindowType,
                      entityId: entityId,
                      label: salesL10n.soi_consulting_singular,
                      additionalData: SoiConsultingAdditionalData(
                        customerId: customerId,
                        salesOrderId: salesOrderId,
                        fullSalesOrderId:
                            initialEntity.salesOrder!.fullSalesOrderId,
                      ).toJson(),
                    ),
                  );
            });
            return null;
          },
          [],
        );
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.soiConsulting.name,
          noteEntityId: entityId,
          noteTableType: TableType.soiConsulting.name,
          initialNoteId: initialNoteId,
          initialNoteParentId: initialNoteParentId,
          isFirstRun: isFirstRender.value,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          formKey: formKey,
          initialNavigationIndexNotifier: selectedNavIndexRef,
          footer: _Footer(
            savedOrInitialEntity: savedOrInitialEntity,
            onSavePressed: () => onSavePressed(entityId, sessionId),
            isSaving: isSaving,
            floatingWindowId: floatingWindowId,
            formKey: formKey,
            readOnly: readOnly,
            navigatorKey: navigatorKey,
            entityId: entityId,
            sessionId: sessionId,
            meta: meta,
          ),
          navigationGroups: [
            CardNavigationGroup(
              items: [
                CardNavigationItem(
                  icon: AppIcons.home,
                  label: l10n.gen_general,
                  showErrorBadge: false,
                ),
              ],
            ),
          ],
          children: [
            CardBodyItem(
              child: _Body(
                entityId: entityId,
                customerId: customerId,
                floatingWindowFocus: floatingWindowFocus,
                stateNotifier: stateNotifier,
                initialEntity: initialEntity,
                readOnly: readOnly,
                sessionId: sessionId,
                floatingWindowId: floatingWindowId,
                navigatorKey: navigatorKey,
                artworkSessionId: sessionId,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Footer extends HookConsumerWidget {
  const _Footer({
    required this.floatingWindowId,
    required this.formKey,
    required this.readOnly,
    required this.navigatorKey,
    required this.entityId,
    required this.sessionId,
    required this.meta,
    required this.isSaving,
    required this.onSavePressed,
    required this.savedOrInitialEntity,
  });

  final String floatingWindowId;
  final GlobalKey<FormState> formKey;
  final bool readOnly;
  final GlobalKey<NavigatorState> navigatorKey;
  final int entityId;
  final String sessionId;
  final DataMeta meta;
  final ValueNotifier<bool> isSaving;
  final Future<SoiConsulting> Function() onSavePressed;
  final ObjectRef<SoiConsulting?> savedOrInitialEntity;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return EntityCardFooter<SoiConsulting>(
      onSaveError: null,
      savedOrInitialEntity: savedOrInitialEntity,
      isSavingNotifier: isSaving,
      readOnly: readOnly,
      navigatorKey: navigatorKey,
      hideDeleteButton: true,
      onDeletePressed: () async {
        Future<void> deleteOperation() async {
          await ref
              .read(soiConsultingRepositoryProvider)
              .delete(entityId, sessionId);
        }

        final (:success, :exception, :data) =
            await AsyncHandler.handleAsyncOperation(
          context,
          deleteOperation,
          successMessage: l10n.gen_saving_success,
          successNavigatorKey: navigatorKey,
          errorNavigatorKey: navigatorKey,
        );
        if (success) {
          ref.removeWindow(floatingWindowId);
        }
      },
      formKey: formKey,
      meta: meta,
      floatingWindowId: floatingWindowId,
      onSavePressed: onSavePressed,
      stateProvider: soiConsultingStateProvider.call(entityId, sessionId),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({
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
  final SoiConsultingState stateNotifier;
  final int entityId;
  final SoiConsulting initialEntity;
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
      soiConsultingStateProvider(entityId, sessionId)
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
                  soiConsultingStateProvider(
                    entityId,
                    sessionId,
                  ).select(
                    (state) => state.requireValue.salesOrderItem?.deadline,
                  ),
                );

                return SoiGeneralSharedSection(
                  currentDeadline: deadline,
                  onDeadlineChanged: stateNotifier.updateDeadline,
                  statusList: SalesOrderItemStatus.values.soiConsulting,
                  width: constraints.maxWidth,
                  salesOrderId: initialEntity.salesOrder!.meta.id!,
                  fullSalesOrderId: initialEntity.salesOrder!.fullSalesOrderId,
                  customerId: customerId,
                  customerName:
                      initialEntity.salesOrder!.customer!.contact!.general.name,
                  currentStatus: selectedStatus,
                  onStatusSelected: stateNotifier.updateStatus,
                  assignedUser: initialEntity.salesOrderItem!.assignedUser,
                  onAssignedUserSelected: stateNotifier.updateAssignedUser,
                  description: initialEntity.salesOrderItem!.description,
                  onDescriptionChanged: stateNotifier.updateDescription,
                  readOnly: readOnly,
                  identifier: ComponentIdentifier.soiConsultingGeneralShared,
                );
              },
            ),
            const CardSectionDivider(),
            CardSectionTitle(title: l10n.soi_consulting_order),
            ElbTwoColumnWrap(
              customL10n: salesL10n,
              columnLeft: [
                ElbTwoColumnWrapCustomItem<ElbSalesLocalizations>(
                  label: '',
                  childBuilder: (labelPosition) => Consumer(
                    builder: (context, ref, child) {
                      return AppCardTimeTextField(
                        focusOrder: null,
                        label: salesL10n.sales_order_item_planned_time,
                        labelPosition: labelPosition,
                        readOnly: readOnly,
                        initialValue:
                            initialEntity.salesOrderItem!.billableTime,
                        onEmptyValue: () {
                          stateNotifier.updateBillableTime(0);
                        },
                        value: ref.watch(
                          soiConsultingStateProvider(
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
              readOnly: readOnly,
              validationGroupId: null,
              width: constraints.maxWidth,
            ),
            const CardSectionDivider(),
            CardSectionTitle(title: l10n.soi_consulting_text),
            _TextSection(
              initialText: initialEntity.text,
              onChanged: stateNotifier.updateText,
              readOnly: readOnly,
            ),
          ],
        );
      },
    );
  }
}

class _TextSection extends HookConsumerWidget {
  const _TextSection({
    required this.initialText,
    required this.onChanged,
    required this.readOnly,
  });
  final String initialText;
  final void Function(String) onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: initialText);
    return NextTextField(
      maxLines: 10,
      textInputAction: TextInputAction.newline,
      readOnly: readOnly,
      onChanged: onChanged,
      controller: controller,
    );
  }
}
