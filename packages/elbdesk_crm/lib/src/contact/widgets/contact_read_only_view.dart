import 'dart:async';

import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/contact/extensions/contact_type_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_read_only_view.g.dart';

@riverpod
class ContactReadOnlyContact extends _$ContactReadOnlyContact {
  @override
  Future<Contact> build({
    required int id,
    required bool autoUpdate,
  }) async {
    ref.listen<AsyncValue<Contact>>(
      watchContactUpdatesProvider(
        contactId: id,
      ),
      (previous, next) {
        if (autoUpdate) {
          final updatedData = next.asData?.value;
          if (updatedData != null) {
            final currentStateContact = state.asData?.value;

            if (currentStateContact == null) {
              state = AsyncData(updatedData);
            } else {
              final hasChanges = hasEntityChanges(
                updatedData,
                currentStateContact,
              );

              if (hasChanges) {
                state = AsyncData(updatedData);
              }
            }
          }
        }
      },
    );

    final contactRepository = ref.watch(contactRepositoryProvider);
    final contact = await contactRepository.fetchById(id);

    return state.asData?.value ?? contact;
  }

  void updateContact(Contact contact) {
    state = AsyncData(contact);
  }
}

class ContactReadOnlyView extends HookConsumerWidget {
  /// You have to provide a contact of a contactId
  const ContactReadOnlyView({
    required this.contactId,
    this.autoUpdate = false,
    this.trailingWidget,
    this.width,
    this.onShiftPressedOpenInNew,
    super.key,
  });

  final int contactId;
  final bool autoUpdate;
  final Widget? trailingWidget;
  final double? width;
  final VoidCallback? onShiftPressedOpenInNew;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactAsync = ref.watch(
      contactReadOnlyContactProvider(
        id: contactId,
        autoUpdate: autoUpdate,
      ),
    );

    return contactAsync.fastWhen(
      data: (contact) {
        return ExcludeFocus(
          excluding: true,
          child: _Body(
            contact: contact,
            autoUpdate: autoUpdate,
            trailingWidget: trailingWidget,
            width: width,
            onShiftPressedOpenInNew: onShiftPressedOpenInNew,
            key: UniqueKey(),
          ),
        );
      },
    );
  }
}

class _Body extends HookConsumerWidget {
  /// You have to provide a contact of a contactId
  const _Body({
    required this.contact,
    required this.autoUpdate,
    this.trailingWidget,
    this.width,
    this.onShiftPressedOpenInNew,
    super.key,
  });

  final Contact contact;
  final bool autoUpdate;
  final Widget? trailingWidget;
  final double? width;
  final VoidCallback? onShiftPressedOpenInNew;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    return LayoutWidthBuilder(
      width: width,
      builder: (width) {
        return CollapsibleCardSection(
          title: crmL10n.contact_singular,
          identifier: ComponentIdentifier.contactCardReadOnlyViewGeneral.name,
          trailingWidgets: [
            if (trailingWidget != null) trailingWidget!,
            if (!autoUpdate)
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: _UpdateButton(contact: contact),
              ),
            AppOpenInNewTextButton(
              label: l10n.gen_open_entity(
                crmL10n.contact_singular,
              ),
              tooltipMessage: l10n.gen_open_new_table(
                crmL10n.contacts_companies,
              ),
              onShiftPressed: onShiftPressedOpenInNew,
              onPressed: () {
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
            ),
          ],
          child: Column(
            children: [
              ElbTwoColumnWrap(
                customL10n: crmL10n,
                validationGroupId: null,
                width: width,
                readOnly: true,
                columnLeft: [
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.type),
                    initialText: contact.general.type!.readable(crmL10n),
                    onChanged: null,
                    validator: null,
                  ),
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.fullName),
                    initialText: contact.general.name,
                    onChanged: null,
                    validator: null,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.salutationCode),
                    initialText:
                        contact.general.salutationCode?.description ?? '',
                    onChanged: null,
                    validator: null,
                  ),
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.languageCode),
                    initialText: contact.general.languageCode?.name ?? '',
                    onChanged: null,
                    validator: null,
                  ),
                ],
              ),
              NextCardFormField.text(
                labelPosition: NextCardFormFieldLabelPosition.left,
                initialText: contact.general.importantNote,
                readOnly: true,
                label: l10n.gen_important_note,
                validationGroup: null,
                onChanged: null,
              ),

              // * ADDRESS
              const CardSectionDivider(),

              CardSectionTitle(title: crmL10n.contact_address_singular),
              ElbTwoColumnWrap(
                customL10n: crmL10n,
                validationGroupId: null,
                width: width,
                readOnly: true,
                columnLeft: [
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.address),
                    initialText: contact.address.address,
                    onChanged: null,
                    validator: null,
                  ),
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.address2),
                    initialText: contact.address.address2,
                    onChanged: null,
                    validator: null,
                  ),
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.postCode),
                    initialText: contact.address.postCode,
                    onChanged: null,
                    validator: null,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.city),
                    initialText: contact.address.city,
                    onChanged: null,
                    validator: null,
                  ),
                  if (contact.address.countryCode?.showState ?? false)
                    ElbTwoColumnWrapTextItem(
                      field: ContactFields.fromEnum(ContactField.state),
                      initialText: contact.address.state,
                      onChanged: null,
                      validator: null,
                    ),
                  ElbTwoColumnWrapTextItem(
                    field: ContactFields.fromEnum(ContactField.countryCode),
                    initialText: contact.address.countryCode?.name ?? '',
                    onChanged: null,
                    validator: null,
                  ),
                ],
              ),

              // * COMMUNICATION

              const CardSectionDivider(),
              CardSectionTitle(title: crmL10n.communication),
              ElbTwoColumnWrap(
                customL10n: crmL10n,
                validationGroupId: null,
                width: width,
                readOnly: true,
                columnLeft: [
                  ElbTwoColumnWrapPhoneItem(
                    field: ContactFields.fromEnum(ContactField.phone),
                    initialPhone: contact.communication.phone,
                    onChanged: null,
                    validator: null,
                  ),
                  ElbTwoColumnWrapPhoneItem(
                    field: ContactFields.fromEnum(ContactField.mobile),
                    initialPhone: contact.communication.mobile,
                    onChanged: null,
                    validator: null,
                  ),
                ],
                columnRight: [
                  ElbTwoColumnWrapWebsiteItem(
                    field: ContactFields.fromEnum(ContactField.website),
                    initialWebsite: contact.communication.website,
                    onChanged: null,
                    validator: null,
                  ),
                  ElbTwoColumnWrapEmailItem(
                    field: ContactFields.fromEnum(ContactField.email),
                    initialEmail: contact.communication.email,
                    onChanged: null,
                    validator: null,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UpdateButton extends HookConsumerWidget {
  const _UpdateButton({
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasUpdate = useState<bool>(false);

    final updatedContact = useRef<Contact?>(null);

    ref.listen<AsyncValue<Contact>>(
      watchContactUpdatesProvider(
        contactId: contact.meta.id!,
      ),
      (previous, next) {
        final updatedData = next.asData?.value;
        if (updatedData != null) {
          // print('passed contact: $contact');
          // print('updated contact: $updatedData');
          // At this point we have the updated contact
          // We need to check if the contact is different from the currently
          // shown contact

          final hasChanges = hasEntityChanges(
            updatedData,
            contact,
          );

          if (hasChanges) {
            updatedContact.value = updatedData;
            hasUpdate.value = true;
          }
        }
      },
    );

    if (hasUpdate.value) {
      return UpdateAvailableButton(
        onPressed: () {
          ref
              .read(
                contactReadOnlyContactProvider(
                  id: contact.meta.id!,
                  autoUpdate: false,
                ).notifier,
              )
              .updateContact(updatedContact.value!);
        },
      );
    }
    return const SizedBox.shrink();
  }
}
