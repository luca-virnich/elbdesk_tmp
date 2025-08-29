import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/app_client/config/app_client_fields.dart';
import 'package:elbdesk_crm/src/app_client/logic/app_client_provider.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class AppClientTable extends HookConsumerWidget {
  const AppClientTable({
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
    final crmL10n = context.crmL10n;
    final sessionId = useUuid();
    return AppTableView<AppClient, AppClientField>(
      tableDefaultNamePlural: crmL10n.app_client_plural,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      sessionId: sessionId,
      defaultTableConfig: AppClientFields.defaultTableColumns,
      dataProvider: findAppClientsProvider.call,
      showToolbarDivider: true,
      toolbarPadding:
          const EdgeInsets.only(right: UiConstants.tableCardToolbarPadding),
      onRowTap: (item) {
        ref.openWindow(
          FloatingAppClientWindowData(
            entityId: item.meta.id,
          ),
        );
      },
      fieldFromKey: (fieldKey) => AppClientFields.fromFieldKey(fieldKey).value,
      buildCell: (field, item) {
        return switch (field) {
          AppClientField.description => AppTableCellText(
              item.description,
            ),
          AppClientField.contact => AppTableCellOpenInNew(
              '${item.contact?.general.name}',
              onPressed: () {
                final isPerson =
                    item.contact?.general.type == ContactType.person;
                if (isPerson) {
                  ref.openWindow(
                    FloatingContactPersonWindowData(
                      contactId: item.contact?.meta.id,
                    ),
                  );
                } else {
                  ref.openWindow(
                    FloatingContactCompanyWindowData(
                      contactId: item.contact?.meta.id,
                    ),
                  );
                }
              },
            ),
          AppClientField.createdAt => AppTableCellDate(
              item.meta.createdAt,
            ),
          AppClientField.createdBy => AppTableCellUser(
              item.meta.createdById,
            ),
          AppClientField.lastModifiedAt => AppTableCellDate(
              item.meta.lastModifiedAt,
            ),
          AppClientField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
            ),
          AppClientField.id => AppTableCellText(
              item.meta.id.toString(),
            ),
          _ => const SizedBox.shrink(),
        };
      },
      toolbarTrailingActions: (sessionId) => [
        _AddAppClientButton(
          sessionId: sessionId,
          navigatorKey: navigatorKey,
        ),
      ],
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          onPressed: () {
            ref.openWindow(
              FloatingAppClientWindowData(
                entityId: null,
              ),
            );
          },
          label: crmL10n.app_client_singular,
          icon: AppIcons.add,
        ),
      ],
      buildCellTitle: (field) =>
          AppClientFields.fromEnum(field).readable(context.l10n, crmL10n),
      getTitleAlignment: (field) =>
          AppClientFields.fromEnum(field).cellAlignment,
      availableFilterFieldsWithLabels:
          AppClientField.values.filterableWithLabels(context.l10n, crmL10n),
      availableTableColumnsWithLabels:
          AppClientField.values.tableColumnsWithLabels(context.l10n, crmL10n),
    );
  }
}

class _AddAppClientButton extends HookConsumerWidget {
  const _AddAppClientButton({
    required this.sessionId,
    required this.navigatorKey,
  });
  final String sessionId;

  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return AppButton.primary(
      onPressed: () async {
        ref.openWindow(
          FloatingAppClientWindowData(
            entityId: null,
          ),
        );
      },
      tooltip: l10n.gen_add_entity(crmL10n.app_client_singular),
      iconData: AppIcons.add,
    );
  }
}
