import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// A card that displays a table of contacts
class ContactTableCard extends HookConsumerWidget {
  /// Creates a new [ContactTableCard]
  const ContactTableCard({
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    this.type = ContactTableType.all,
    super.key,
  });
  final String floatingWindowId;
  final ContactTableType type;
  final FocusNode? floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final projectL10n = context.projectL10n;
    // This makes it closeable from the task bar
    ref.listen(
      floatingWindowRemoveFromTaskbarStateProvider(floatingWindowId),
      (prev, next) {
        if (next) {
          ref.removeWindow(
            floatingWindowId,
          );
        }
      },
    );

    final icon = switch (type) {
      ContactTableType.all => AppIcons.group_outlined,
      ContactTableType.persons => AppIcons.person,
      ContactTableType.companies => AppIcons.company,
      ContactTableType.byEvent => AppIcons.group_outlined,
    };
    final baseTitle = switch (type) {
      ContactTableType.all => crmL10n.contact_plural,
      ContactTableType.persons =>
        FloatingWindowType.contactPersonTable.title(projectL10n),
      ContactTableType.companies =>
        FloatingWindowType.contactCompanyTable.title(projectL10n),
      ContactTableType.byEvent => crmL10n.contact_plural,
    };

    return CustomCard(
      floatingWindowType: FloatingWindowType.contactPersonTable.name,
      baseTitle: baseTitle,
      iconData: icon,
      floatingWindowId: floatingWindowId,
      childBuilder: (
        context,
        selectedNavIndexRef,
        navigatorKey,
      ) {
        return FloatingCardBody(
          isFirstRun: true,
          floatingWindowType: FloatingWindowType.contactPersonTable.name,
          floatingWindowId: floatingWindowId,
          navigatorKey: navigatorKey,
          children: [
            CardBodyItem(
              child: TableCardItem(
                table: _TableView(
                  type: type,
                  floatingWindowId: floatingWindowId,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TableView extends ConsumerWidget {
  const _TableView({
    required this.type,
    required this.floatingWindowId,
  });

  final ContactTableType type;
  final String floatingWindowId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (type) {
      ContactTableType.all => ContactTable.all(
          toolbarPadding: const EdgeInsets.only(
            right: UiConstants.tableCardToolbarPadding,
          ),
          floatingWindowId: floatingWindowId,
          componentIdentifier: ComponentIdentifier.contactTable,
          isCollapsible: false,
        ),
      ContactTableType.persons => ContactTable.persons(
          floatingWindowId: floatingWindowId,
          toolbarPadding: const EdgeInsets.only(
            right: UiConstants.tableCardToolbarPadding,
          ),
          componentIdentifier: ComponentIdentifier.contactTablePerson,
          isCollapsible: false,
          onSelect: (value) {
            ref.openWindow(
              FloatingContactPersonWindowData(
                contactId: value.meta.id,
              ),
            );
          },
        ),
      ContactTableType.companies => ContactTable.companies(
          floatingWindowId: floatingWindowId,
          componentIdentifier: ComponentIdentifier.contactTableCompany,
          isCollapsible: false,
          toolbarPadding: const EdgeInsets.only(
            right: UiConstants.tableCardToolbarPadding,
          ),
          onSelect: (value) {
            ref.openWindow(
              FloatingContactCompanyWindowData(
                contactId: value.meta.id,
              ),
            );
          },
        ),
      ContactTableType.byEvent => throw UnimplementedError(),
    };
  }
}
