import 'dart:async';

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/contact/logic/contact_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project_core/project_core.dart';

class CompanyContactDeborRibbon extends HookConsumerWidget {
  const CompanyContactDeborRibbon({
    required this.contactId,
    required this.sessionId,
    required this.floatingWindowId,
    super.key,
  });
  final int contactId;
  final String sessionId;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompany = ref.watch(
      contactStateProvider(contactId, sessionId)
          .select((value) => value.requireValue.isCompany),
    );
    final isDebtor = ref.watch(
      contactStateProvider(contactId, sessionId)
          .select((value) => value.requireValue.isDebtor),
    );

    final isDraft = ref.watch(
      contactStateProvider(contactId, sessionId)
          .select((value) => value.requireValue.meta.isDraft),
    );

    final isLoading = useState<bool>(false);
    if (!isCompany) return const SizedBox.shrink();
    final crmL10n = context.crmL10n;
    return Ribbon(
      floatingWindowId: floatingWindowId,
      floatingWindowType: FloatingWindowType.contactCompany.name,
      onPressed: isLoading.value || isDraft
          ? null
          : () async {
              isLoading.value = true;
              final contact = ref
                  .read(contactStateProvider(contactId, sessionId))
                  .requireValue;
              if (isDebtor) {
                ref.openWindow(
                  FloatingCustomerWindowData(
                    customerId: contact.customer!.meta.id,
                  ),
                );
                isLoading.value = false;
                return;
              }

              // check if its a company contact
              if (!contact.isCompany) {
                AppNotificationOverlay.error(
                  context,
                  crmL10n.contact_create_customer_no_company_error,
                );
                isLoading.value = false;
                return;
              }

              final serverContact = await ref
                  .read(contactRepositoryProvider)
                  .fetchById(contactId);

              if (!serverContact.isCompany && context.mounted) {
                AppNotificationOverlay.error(
                  context,
                  crmL10n.contact_create_customer_no_company_on_server_error,
                );
                isLoading.value = false;
                return;
              }
              final customer = serverContact.customer;
              if (customer != null && context.mounted) {
                AppNotificationOverlay.error(
                  context,
                  crmL10n.contact_already_customer,
                );
                isLoading.value = false;
                return;
              }

              final customerId =
                  await ref.read(customerRepositoryProvider).createCustomer(
                        contact,
                      );
              ref
                ..invalidate(findCustomersProvider)
                ..openWindow(
                  FloatingCustomerWindowData(
                    customerId: customerId,
                  ),
                );
              unawaited(
                ref
                    .read(contactStateProvider(contactId, sessionId).notifier)
                    .refetchWithLock(),
              );
              if (context.mounted) {
                isLoading.value = false;
              }
            },
      label: isDebtor
          ? crmL10n.contact_go_to_customer
          : crmL10n.contact_create_as_customer,
      icon: AppIcons.company,
    );
  }
}
