import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class ServiceUserTableCard extends StatelessWidget {
  const ServiceUserTableCard({
    required this.iconData,
    required this.floatingWindowId,
    required this.floatingWindowType,
    super.key,
  });

  final String floatingWindowId;
  final IconData iconData;
  final String floatingWindowType;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return CustomCard(
      floatingWindowType: floatingWindowType,
      baseTitle: l10n.admin_app_users_plural,
      iconData: iconData,
      floatingWindowId: floatingWindowId,
      childBuilder: (context, selectedNavIndexRef, navigatorKey) {
        return FloatingCardBody(
          floatingWindowType: FloatingWindowType.adminServiceUsersTable.name,
          navigatorKey: navigatorKey,
          floatingWindowId: floatingWindowId,
          isFirstRun: true,
          children: [
            CardBodyItem(
              child: const TableCardItem(
                table: ServiceUserTable.standard(
                  componentIdentifier:
                      ComponentIdentifier.floatingServiceUserTable,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
