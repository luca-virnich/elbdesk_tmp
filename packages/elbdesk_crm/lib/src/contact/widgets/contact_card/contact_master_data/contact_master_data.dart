import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/elbdesk_crm.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/contact/logic/contact_state.dart';
import 'package:elbdesk_crm/src/salutation_code/logic/salutation_code_provider.dart';
import 'package:elbdesk_crm/src/salutation_code/models/salutation_code.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'contact_address/contact_address.dart';
part 'contact_communication/contact_communication.dart';
part 'contact_general/contact_general_view.dart';

class ContactMasterData extends ConsumerWidget {
  const ContactMasterData({
    required this.contactId,
    required this.sessionId,
    required this.readOnly,
    required this.validationGroupId,
    required this.initialEntity,
    required this.stateNotifier,
    required this.floatingWindowId,
    required this.navigatorKey,
    super.key,
  });

  final int contactId;
  final String sessionId;
  final bool readOnly;
  final String validationGroupId;
  final Contact initialEntity;
  final ContactState? stateNotifier;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use provided width or fall back to constraints from CardConstraints

    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Column(
          children: [
            _ContactGeneralView(
              stateNotifier: stateNotifier,
              floatingWindowId: floatingWindowId!,
              initialEntity: initialEntity,
              contactId: contactId,
              readOnly: readOnly,
              sessionId: sessionId,
              validationGroupId: validationGroupId,
              width: width,
            ),
            const CardSectionDivider(),
            ContactAddress(
              stateNotifier: stateNotifier,
              contactId: contactId,
              sessionId: sessionId,
              readOnly: readOnly,
              validationGroupId: validationGroupId,
              width: width,
              initialEntity: initialEntity,
              floatingWindowId: floatingWindowId,
              navigatorKey: navigatorKey,
            ),
            const CardSectionDivider(),
            ContactCommunication(
              stateNotifier: stateNotifier,
              contactId: contactId,
              sessionId: sessionId,
              readOnly: readOnly,
              validationGroupId: validationGroupId,
              width: width,
              initialEntity: initialEntity,
            ),
          ],
        );
      },
    );
  }
}
