import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/campaign/config/crm_event_fields.dart';
import 'package:elbdesk_crm/src/campaign/logic/crm_event_state.dart';
import 'package:elbdesk_crm/src/campaign/widgets/event_card/main_page/crm_event_contact_selection.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

/// Content widget for the event card
class CrmEventMainPage extends HookConsumerWidget {
  const CrmEventMainPage({
    required this.sessionId,
    required this.stateNotifier,
    required this.readOnly,
    required this.descriptionErrorNotifier,
    required this.initialEntity,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
    super.key,
  });

  final String sessionId;
  final CrmEventState stateNotifier;
  final bool readOnly;
  final ValueNotifier<String?> descriptionErrorNotifier;
  final CrmEvent initialEntity;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MainEventData(
              constraints: constraints,
              readOnly: readOnly,
              initialEntity: initialEntity,
              stateNotifier: stateNotifier,
              descriptionErrorNotifier: descriptionErrorNotifier,
              entityId: initialEntity.meta.id!,
              sessionId: sessionId,
            ),
            const CardSectionDivider(),
            _EventContactsSection(
              constraints: constraints,
              readOnly: readOnly,
              stateNotifier: stateNotifier,
              initialEntity: initialEntity,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              floatingWindowId: floatingWindowId,
              floatingWindowFocus: floatingWindowFocus,
            ),
          ],
        );
      },
    );
  }
}

class _MainEventData extends ConsumerWidget {
  const _MainEventData({
    required this.readOnly,
    required this.initialEntity,
    required this.stateNotifier,
    required this.descriptionErrorNotifier,
    required this.entityId,
    required this.sessionId,
    required this.constraints,
  });

  final bool readOnly;
  final CrmEvent initialEntity;
  final CrmEventState stateNotifier;
  final ValueNotifier<String?> descriptionErrorNotifier;
  final int entityId;
  final String sessionId;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final asyncEvent = ref.watch(
      crmEventStateProvider(
        entityId,
        sessionId,
      ),
    );
    return CollapsibleCardSection(
      title: crmL10n.event_singular,
      identifier: ComponentIdentifier.crmEventCardMainPageGeneral.name,
      child: asyncEvent.fastWhen(
        data: (crmEvent) => ElbTwoColumnWrap(
          width: constraints.maxWidth,
          customL10n: crmL10n,
          readOnly: readOnly,
          // TODO(mh): Do we need a validation group here?
          validationGroupId: null,
          columnLeft: [
            ElbTwoColumnWrapTextItem(
              field: CrmEventFields.fromEnum(CrmEventField.name),
              initialText: initialEntity.name,
              onChanged: stateNotifier.updateName,
            ),
            ElbTwoColumnWrapDateTimeItem(
              field: CrmEventFields.fromEnum(CrmEventField.startDate),
              initialDate: initialEntity.startDate,
              onChanged: (v) {
                if (v != null) {
                  stateNotifier.updateStartDate(v);
                }
              },
              validator: null,
              isMandatory: true,
            ),
          ],
          columnRight: [
            ElbTwoColumnWrapTextItem(
              field: CrmEventFields.fromEnum(CrmEventField.description),
              customErrorMessageNotifier: descriptionErrorNotifier,
              initialText: initialEntity.description,
              onChanged: stateNotifier.updateDescription,
              validator: null,
            ),
            ElbTwoColumnWrapCustomItem<ElbCrmLocalizations>(
              label: crmL10n.event_status,
              childBuilder: (labelPosition) => Consumer(
                builder: (context, ref, child) {
                  final status = ref.watch(
                    crmEventStateProvider(
                      entityId,
                      sessionId,
                    ).select(
                      (v) => v.requireValue.status,
                    ),
                  );
                  return ElbCardSelectionDropdown(
                    hasValue: true,
                    labelPosition: labelPosition,
                    label: crmL10n.event_status,
                    buttonLabel: status.readable(context.l10n),
                    statusColor: status.color(context.appTheme.statusColors),
                    items: [
                      for (final status in CrmEventStatus.values)
                        ElbSelectionDropdownItem(
                          label: status.readable(context.l10n),
                          onPressed: () {
                            stateNotifier.updateStatus(status);
                          },
                          color: status.color(context.appTheme.statusColors),
                        ),
                    ],
                    readOnly: readOnly,
                    isMandatory: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Widget for managing contacts associated with an event
class _EventContactsSection extends ConsumerWidget {
  const _EventContactsSection({
    required this.constraints,
    required this.readOnly,
    required this.stateNotifier,
    required this.initialEntity,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.floatingWindowFocus,
  });

  final BoxConstraints constraints;
  final bool readOnly;
  final CrmEventState stateNotifier;
  final CrmEvent initialEntity;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;
  final FocusNode floatingWindowFocus;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return ContactTable.byEvent(
      eventId: initialEntity.meta.id,
      displayEventContacts: true,
      onSelect: (contact) {
        final isPerson = contact.general.type == ContactType.person;
        if (isPerson) {
          ref.openWindow(
            FloatingContactPersonWindowData(
              contactId: contact.meta.id,
            ),
          );
        } else {
          ref.openWindow(
            FloatingContactCompanyWindowData(
              contactId: contact.meta.id,
            ),
          );
        }
      },
      eventStateSessionId: sessionId,
      componentIdentifier: ComponentIdentifier.crmEventCardContacts,
      onAddEntityInCard: () async {
        await showElbDialog<void>(
          context: context,
          child: CrmEventContactSelection(
            eventId: initialEntity.meta.id,
            floatingWindowId: floatingWindowId,
            floatingWindowFocus: floatingWindowFocus,
            navigatorKey: navigatorKey,
            sessionId: sessionId,
            isLoading: false,
            titleText: l10n.gen_choose_entity(crmL10n.contact_singular),
            onSelect: (contact) async {
              await ref.read(crmEventRepositoryProvider).addContactsToEvent(
                eventId: initialEntity.meta.id!,
                sessionId: sessionId,
                contactIds: [contact.meta.id!],
              );
              navigatorKey.currentState?.pop();
            },
          ),
        );
      },
    );
  }
}
