import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';
import 'package:project_core/src/app_user/config/app_user_fields.dart';
import 'package:project_core/src/app_user/models/app_user.dart';

/// User Info Table
///
/// The Table View for information about app users
class AppUserTable extends ConsumerWidget {
  const AppUserTable.standard({
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
    final crmL10n = context.crmL10n;

    return AppTableView<AppUser, AppUserField>(
      tableDefaultNamePlural: l10n.admin_app_users_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      hiddenFilterGroup: hiddenFilterGroup,
      availableFilterFieldsWithLabels: AppUserField.values.filterableWithLabels(
        l10n,
        crmL10n,
      ),
      availableTableColumnsWithLabels:
          AppUserField.values.tableColumnsWithLabels(
        l10n,
        crmL10n,
      ),
      toolbarTrailingActions: (_) => const [
        _AddUserButton(
          tableType: TableType.appUser,
          readOnly: false,
          tableDensity: AppTableDensity.standard,
        ),
      ],
      onRowTap: (item) {
        ref.openWindow(
          FloatingAppUserWindowData(appUserId: item.meta.id),
        );
      },
      showToolbarDivider: true,
      quickSearchFilterFields: AppUserField.values.quickSearchFilterPersons(
        l10n,
        crmL10n,
      ),
      toolbarPadding: const EdgeInsets.only(right: UiConstants.defaultPadding),
      defaultTableConfig: AppUserFields.defaultTableColumns,
      tableDensity: tableDensity,
      dataProvider: (sessionId) => findAppUsersProvider(sessionId),
      fieldFromKey: (fieldKey) => AppUserFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          AppUserFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) => AppUserFields.fromEnum(field).cellAlignment,
      buildCell: (field, item) {
        final alignment = AppUserFields.fromEnum(field).cellAlignment;
        return switch (field) {
          AppUserField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: alignment,
            ),
          AppUserField.isDraft => AppTableCellBool(
              item.meta.isDraft,
              alignment: alignment,
            ),
          AppUserField.id => const SizedBox.shrink(),
          AppUserField.userInfoId => const SizedBox.shrink(),
          AppUserField.userIdentifier => AppTableCellText(
              item.userInfo.userIdentifier,
              alignment: alignment,
            ),
          AppUserField.userName => AppTableCellText(
              item.userInfo.userName ?? '',
              alignment: alignment,
            ),
          AppUserField.fullName => AppTableCellText(
              item.userInfo.fullName ?? '',
              alignment: alignment,
            ),
          AppUserField.email => AppTableCellText(
              item.userInfo.email ?? '',
              alignment: alignment,
            ),
          AppUserField.created => AppTableCellDateTime(
              item.userInfo.created,
              alignment: alignment,
            ),
          AppUserField.imageUrl => AppTableCellText(
              item.userInfo.imageUrl ?? l10n.gen_not_available,
              alignment: alignment,
            ),
          AppUserField.scopeNames => AppTableCellText(
              item.userInfo.scopeNames.toString(),
              alignment: alignment,
            ),
          AppUserField.blocked => AppTableCellBool(
              item.userInfo.blocked,
              alignment: alignment,
            ),
          AppUserField.firstName => AppTableCellText(
              item.general.firstName,
              alignment: alignment,
            ),
          AppUserField.lastName => AppTableCellText(
              item.general.lastName,
              alignment: alignment,
            ),
          AppUserField.initials => AppTableCellText(
              item.general.initials,
              alignment: alignment,
            ),
          AppUserField.address => AppTableCellText(
              item.address.address,
              alignment: alignment,
            ),
          AppUserField.address2 => AppTableCellText(
              item.address.address2,
              alignment: alignment,
            ),
          AppUserField.postCode => AppTableCellText(
              item.address.postCode,
              alignment: alignment,
            ),
          AppUserField.city => AppTableCellText(
              item.address.city,
              alignment: alignment,
            ),
          AppUserField.state => AppTableCellText(
              item.address.state,
              alignment: alignment,
            ),
          AppUserField.country => AppTableCellText(
              item.address.countryCode?.code ?? '',
              alignment: alignment,
            ),
          AppUserField.phone => AppTableCellText(
              item.communication.phone,
              alignment: alignment,
            ),
          AppUserField.mobile => AppTableCellText(
              item.communication.mobile,
              alignment: alignment,
            ),
          AppUserField.employeeNumber => AppTableCellText(
              item.employee.employeeNumber,
              alignment: alignment,
            ),
          AppUserField.entryDate => AppTableCellDateTime(
              item.employee.entryDate,
              alignment: alignment,
            ),
          AppUserField.terminationDate => AppTableCellDateTime(
              item.employee.terminationDate,
              alignment: alignment,
            ),
          AppUserField.department => AppTableCellText(
              item.employee.department?.description ?? '',
              alignment: alignment,
            ),
          AppUserField.position => AppTableCellText(
              item.employee.position,
              alignment: alignment,
            ),
          AppUserField.costCenter => AppTableCellText(
              item.employee.costCenter,
              alignment: alignment,
            ),
          AppUserField.isActive => AppTableCellBool(
              item.employee.isActive,
              alignment: alignment,
            ),
          AppUserField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: alignment,
            ),
          AppUserField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: alignment,
            ),
          AppUserField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: alignment,
            ),
          AppUserField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: alignment,
            ),
          AppUserField.privateEmail => AppTableCellText(
              item.communication.privateEmail,
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
      onPressed: () async {
        ref.openWindow(
          FloatingAppUserWindowData(
            appUserId: null,
          ),
        );
      },
      tooltip: l10n.admin_new_user,
      iconData: AppIcons.add,
    );
  }
}
