import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/app_client/config/app_client_fields.dart';
import 'package:elbdesk_crm/src/app_client/logic/app_client_state.dart';
import 'package:elbdesk_crm/src/app_client/models/app_client.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_card/in_window_contact_selection.dart';
import 'package:elbdesk_crm/src/contact/widgets/contact_read_only_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:project_core/project_core.dart';

/// @nodoc
class AppClientMainPage extends ConsumerWidget {
  /// @nodoc
  const AppClientMainPage({
    required this.entityId,
    required this.sessionId,
    required this.readOnly,
    required this.stateNotifier,
    required this.initialEntity,
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.validationGroup,
    super.key,
  });
  final int entityId;
  final String sessionId;
  final bool readOnly;
  final AppClientState stateNotifier;
  final AppClient initialEntity;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  final String validationGroup;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final crmL10n = context.crmL10n;
    return ScrollableCardItem.constrained(
      builder: (context, constraints) {
        return Column(
          children: [
            CollapsibleCardSection(
              title: crmL10n.app_client_singular,
              identifier: ComponentIdentifier.appClientCardMainPageGeneral.name,
              child: ElbTwoColumnWrap(
                readOnly: readOnly,
                validationGroupId: validationGroup,
                customL10n: crmL10n,
                width: constraints.maxWidth,
                columnLeft: [
                  ElbTwoColumnWrapTextItem(
                    field: AppClientFields.fromEnum(AppClientField.description),
                    initialText: initialEntity.description,
                    onChanged: stateNotifier.updateDescription,
                  ),
                ],
                columnRight: const [],
              ),
            ),
            const CardSectionDivider(),
            _ContactView(
              stateNotifier: stateNotifier,
              appClientId: entityId,
              sessionId: sessionId,
              navigatorKey: navigatorKey,
              floatingWindowId: floatingWindowId,
            ),
          ],
        );
      },
    );
  }
}

class _ContactView extends ConsumerWidget {
  const _ContactView({
    required this.stateNotifier,
    required this.appClientId,
    required this.sessionId,
    required this.navigatorKey,
    required this.floatingWindowId,
  });
  final AppClientState stateNotifier;
  final int appClientId;
  final String sessionId;
  final GlobalKey<NavigatorState> navigatorKey;
  final String floatingWindowId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final floatingWindowFocus =
        ref.watch(windowFocusNodeProvider(floatingWindowId));
    final selectedContact = ref.watch(
      appClientStateProvider(appClientId, sessionId)
          .select((value) => value.requireValue.contact),
    );
    final crmL10n = context.crmL10n;
    if (selectedContact == null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CardSectionTitle(title: crmL10n.contact_singular),
          const SizedBox(height: UiConstants.defaultPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: AppButton.primary(
              label: l10n.gen_choose_entity(crmL10n.contact_singular),
              onPressed: () async {
                await showElbDialog<void>(
                  context: context,
                  child: InWindowContactSelection.company(
                    floatingWindowId: floatingWindowId,
                    floatingWindowFocus: floatingWindowFocus,
                    navigatorKey: navigatorKey,
                    isLoading: false,
                    titleText: l10n.gen_choose_entity(crmL10n.contact_singular),
                    onSelect: (contact) async {
                      ref
                          .read(
                            appClientStateProvider(appClientId, sessionId)
                                .notifier,
                          )
                          .updateContact(contact);
                      navigatorKey.currentState?.pop();
                    },
                  ),
                );
              },
            ),
          ),
        ],
      );
    }
    return ContactReadOnlyView(
      contactId: selectedContact.meta.id!,
      autoUpdate: false,
    );
  }
}
