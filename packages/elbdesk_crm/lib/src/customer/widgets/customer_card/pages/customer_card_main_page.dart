import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/app_client/logic/app_client_provider.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_read_only_view.dart';
import 'package:elbdesk_crm/src/customer/logic/customer_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

class CustomerMainPage extends ConsumerWidget {
  /// Constructor
  const CustomerMainPage({
    required this.customerId,
    required this.customerCustomId,
    required this.sessionId,
    required this.initialEntity,
    required this.stateNotifier,
    required this.readOnly,
    required this.floatingWindowId,
    required this.savedOrInitialEntity,
    super.key,
  });

  /// Customer Id
  final int customerId;
  final int customerCustomId;
  final Customer initialEntity;
  final CustomerState stateNotifier;
  final bool readOnly;
  final String floatingWindowId;
  final ObjectRef<Customer?> savedOrInitialEntity;

  /// Session Id
  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    final contactId = ref.watch(
      customerStateProvider(customerId, sessionId)
          .select((value) => value.requireValue.contact!.meta.id),
    );

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CollapsibleCardSection(
              title: crmL10n.general,
              identifier: ComponentIdentifier.customerCardMainPageGeneral.name,
              child: ElbTwoColumnWrap(
                customL10n: crmL10n,
                readOnly: readOnly,
                validationGroupId: null,
                width: constraints.maxWidth,
                columnLeft: [
                  ElbTwoColumnWrapAssignUserItem(
                    field: CustomerFields.fromEnum(CustomerField.assignedUser),
                    onSelected: stateNotifier.updateAssignedUser,
                    initialUser: initialEntity.assignedUser,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapLazyTextDropdownItem(
                    field: CustomerFields.fromEnum(
                      CustomerField.contractSovereignty,
                    ),
                    dataProvider: fetchAndWatchAllAppClientsProvider,
                    onSelected: stateNotifier.updateContractSovereignty,
                    itemLabelBuilder: (value) => value.description,
                    initialValue:
                        initialEntity.contractSovereignty?.description ?? '',
                  ),
                ],
              ),
            ),
            const CardSectionDivider(),
            ContactReadOnlyView(
              contactId: contactId!,
              onShiftPressedOpenInNew: () {
                final currentState = ref.read(
                  customerStateProvider(customerId, sessionId).select(
                    (state) => state.requireValue,
                  ),
                );

                final hasChanges = hasEntityChanges(
                  savedOrInitialEntity.value,
                  currentState,
                );

                if (!hasChanges) {
                  ref.removeWindow(floatingWindowId);
                }
              },
              autoUpdate: false,
            ),
          ],
        );
      },
    );
  }
}
