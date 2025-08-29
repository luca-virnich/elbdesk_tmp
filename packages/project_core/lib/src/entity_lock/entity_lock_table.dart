import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/data/entity_lock/fields/entity_lock_fields.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/entity_lock/entity_lock_repository.dart';

class EntityLockTable extends HookConsumerWidget {
  const EntityLockTable({
    required this.navigatorKey,
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return AppTableView<EntityLockDTO, EntityLockField>(
      tableDefaultNamePlural: l10n.entity_lock_title_plural,
      tableViewIdentifier: componentIdentifier.name,
      showToolbarDivider: true,
      isResizable: true,
      isCollapsible: isCollapsible,
      toolbarPadding: const EdgeInsets.only(right: UiConstants.defaultPadding),
      availableFilterFieldsWithLabels:
          EntityLockField.values.filterableWithLabels(l10n),
      availableTableColumnsWithLabels:
          EntityLockField.values.tableColumnsWithLabels(l10n),
      defaultTableConfig: entityLockTableDefaultConfig,
      dataProvider: (sessionId) => fetchAllEntityLocksProvider,
      fieldFromKey: (fieldKey) => EntityLockFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          EntityLockFields.fromEnum(field).readable(l10n, l10n),
      getTitleAlignment: (field) =>
          EntityLockFields.fromEnum(field).cellAlignment,
      showTableViews: false,
      toolbarTrailingActions: (_) => [
        AppButton.secondary(
          iconData: AppIcons.refresh,
          onPressed: () {
            ref.invalidate(fetchAllEntityLocksProvider);
          },
          tooltip: l10n.gen_refresh,
        ),
      ],
      buildCell: (field, entityLock) {
        return switch (field) {
          EntityLockField.entityId => AppTableCellText(
              entityLock.entityId.toString(),
              alignment: EntityLockFields.fromEnum(field).cellAlignment,
            ),
          EntityLockField.entityType => AppTableCellText(
              // entityLock.tableType.readable(projectL10n),
              'FIXME',
              alignment: EntityLockFields.fromEnum(field).cellAlignment,
            ),
          EntityLockField.editingSessionId => AppTableCellText(
              entityLock.editingSessionId,
              alignment: EntityLockFields.fromEnum(field).cellAlignment,
            ),
          EntityLockField.lockedAt => AppTableCellDateTime(
              entityLock.lockedAt,
              alignment: EntityLockFields.fromEnum(field).cellAlignment,
            ),
          EntityLockField.lockedBy => AppTableCellUser(
              entityLock.userId,
              alignment: EntityLockFields.fromEnum(field).cellAlignment,
            ),
          EntityLockField.deleteButton => AppTableCellTextButton(
              l10n.entity_delete_lock,
              textColor: context.appTheme.generalColors.danger,
              alignment: EntityLockFields.fromEnum(field).cellAlignment,
              onPressed: () async {
                final release = await showElbDialog<bool>(
                  context: context,
                  isDismissible: true,
                  navigatorKey: navigatorKey,
                  child: _ReleaseDialog(
                    lockedById: entityLock.userId!,
                    lockedAt: entityLock.lockedAt,
                  ),
                );
                if (release ?? false) {
                  await ref
                      .read(entityLockRepositoryProvider)
                      .releaseEntityLock(
                        entityLock.tableType,
                        entityLock.entityId,
                      );
                  ref.invalidate(fetchAllEntityLocksProvider);
                }
              },
            ),
        };
      },
    );
  }
}

class _ReleaseDialog extends ConsumerWidget {
  const _ReleaseDialog({
    required this.lockedById,
    required this.lockedAt,
  });
  final int lockedById;
  final DateTime lockedAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lockedByName = lockedById == 1
        ? 'System'
        : ref
            .watch(fetchLocalLightUserByUserInfoIdProvider(lockedById))
            .fullName;

    final l10n = context.l10n;
    final now = DateTime.now();
    final lockedSince = now.difference(lockedAt.toLocal()).inMinutes;
    return ElbAlertDialog(
      titleText: l10n.entity_delete_lock,
      actions: [
        AppButton.secondary(
          label: l10n.gen_cancel,
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        AppButton.danger(
          label: l10n.entity_delete_lock,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
      onCancel: () {
        Navigator.of(context).pop(false);
      },
      contentText: l10n.entity_delete_lock_message(lockedByName, lockedSince),
    );
  }
}

final entityLockTableDefaultConfig = [
  TableFieldConfig(
    width: 150,
    fieldKey: EntityLockField.entityType.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: EntityLockField.entityId.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: EntityLockField.lockedAt.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: EntityLockField.lockedBy.name,
  ),
  TableFieldConfig(
    width: 150,
    fieldKey: EntityLockField.deleteButton.name,
  ),
];
