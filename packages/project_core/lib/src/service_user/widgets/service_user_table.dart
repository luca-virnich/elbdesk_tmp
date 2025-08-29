import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/service_user/_export_service_user.dart';

/// User Info Table
///
/// The Table View for information about app users
class ServiceUserTable extends ConsumerWidget {
  const ServiceUserTable.standard({
    required this.componentIdentifier,
    this.isCollapsible = true,
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
    this.tableDensity,
  });

  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity? tableDensity;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return AppTableView<ServiceUser, ServiceUserField>(
      tableDefaultNamePlural: l10n.admin_service_users_plural,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      tableViewIdentifier: componentIdentifier.name,
      hiddenFilterGroup: hiddenFilterGroup,
      availableFilterFieldsWithLabels:
          ServiceUserField.values.filterableWithLabels(
        l10n,
      ),
      availableTableColumnsWithLabels:
          ServiceUserField.values.tableColumnsWithLabels(
        l10n,
      ),
      toolbarTrailingActions: (_) => const [
        _AddUserButton(
          tableType: TableType.serviceUser,
          readOnly: false,
          tableDensity: AppTableDensity.standard,
        ),
      ],
      onRowTap: (item) {
        ref.openWindow(
          FloatingServiceUserWindowData(serviceUserId: item.meta.id),
        );
      },
      showToolbarDivider: true,
      quickSearchFilterFields: ServiceUserField.values.quickSearchFilterPersons(
        l10n,
      ),
      isCollapsible: isCollapsible,
      defaultTableConfig: ServiceUserFields.defaultTableColumns,
      tableDensity: tableDensity,
      dataProvider: (sessionId) => findServiceUsersProvider(sessionId),
      fieldFromKey: (fieldKey) =>
          ServiceUserFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ServiceUserFields.fromEnum(field).readable(l10n, l10n),
      getTitleAlignment: (field) =>
          ServiceUserFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        // Get field config once to avoid repeated lookups
        final extField = ServiceUserFields.fromEnum(field);
        final alignment = extField.cellAlignment;
        return switch (field) {
          ServiceUserField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          ServiceUserField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          ServiceUserField.id => const SizedBox.shrink(),
          ServiceUserField.userInfoId => const SizedBox.shrink(),
          ServiceUserField.userIdentifier => AppTableCellText(
              item.userInfo.userIdentifier,
              alignment: alignment,
            ),
          ServiceUserField.created => AppTableCellText(
              item.userInfo.created.toIso8601String(),
              alignment: alignment,
            ),
          ServiceUserField.scopeNames => AppTableCellText(
              item.userInfo.scopeNames.toString(),
              alignment: alignment,
            ),
          ServiceUserField.blocked => AppTableCellText(
              item.userInfo.blocked.toString(),
              alignment: alignment,
            ),
          ServiceUserField.serviceName => AppTableCellText(
              item.serviceName,
              alignment: alignment,
            ),
          ServiceUserField.serviceDescription => AppTableCellText(
              item.serviceDescription,
              alignment: alignment,
            ),
          ServiceUserField.isActive => AppTableCellText(
              item.isActive.toString(),
              alignment: alignment,
            ),
          ServiceUserField.createdAt => AppTableCellText(
              item.meta.createdAt!.toIso8601String(),
              alignment: alignment,
            ),
          ServiceUserField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          ServiceUserField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          ServiceUserField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
        };
      },
    );
  }
}

class _AddUserButton extends HookConsumerWidget {
  const _AddUserButton({
    required this.tableType,
    required this.readOnly,
    required this.tableDensity,
  });
  final TableType tableType;
  final bool readOnly;
  final AppTableDensity tableDensity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final buttonKey = useMemoized(GlobalKey.new, []);
    return AppButton.primary(
      key: buttonKey,
      onPressed: () {
        ref.openWindow(
          FloatingServiceUserWindowData(
            serviceUserId: null,
          ),
        );
      },
      tooltip: l10n.admin_new_user,
      iconData: AppIcons.add,
    );
  }
}
