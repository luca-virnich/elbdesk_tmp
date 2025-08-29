import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_crm/l10n/elb_crm_localizations_ext.dart';
import 'package:elbdesk_crm/src/campaign/logic/crm_event_state.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

enum ContactTableType {
  all,
  persons,
  companies,
  byEvent,
}

class ContactTable extends HookConsumerWidget {
  const ContactTable.all({
    required this.componentIdentifier,
    this.floatingWindowId,
    super.key,
    this.hiddenFilterGroup,
    this.initialFilter,
    this.toolbarPadding,
    this.tableDensity,
    this.onSelect,
    this.fixedTableTitle,
    this.selfGrowable = false,
    this.isSelection = false,
    this.showTableViews = true,
    this.showToolbarDivider = false,
    this.isCollapsible = true,
  })  : _tableType = ContactTableType.all,
        isResizable = true,
        onAddEntityInCard = null,
        eventId = null,
        eventStateSessionId = null,
        displayEventContacts = null;

  const ContactTable.persons({
    required this.componentIdentifier,
    this.floatingWindowId,
    super.key,
    this.initialFilter,
    this.tableDensity,
    this.toolbarPadding,
    this.hiddenFilterGroup,
    this.onSelect,
    this.selfGrowable = false,
    this.isSelection = false,
    this.showTableViews = true,
    this.showToolbarDivider = true,
    this.isCollapsible = true,
  })  : _tableType = ContactTableType.persons,
        isResizable = true,
        fixedTableTitle = null,
        onAddEntityInCard = null,
        eventId = null,
        eventStateSessionId = null,
        displayEventContacts = null;

  const ContactTable.companies({
    required this.componentIdentifier,
    this.floatingWindowId,
    super.key,
    this.initialFilter,
    this.tableDensity,
    this.onSelect,
    this.toolbarPadding,
    this.hiddenFilterGroup,
    this.selfGrowable = false,
    this.showTableViews = true,
    this.isSelection = false,
    this.showToolbarDivider = true,
    this.isCollapsible = true,
  })  : _tableType = ContactTableType.companies,
        isResizable = true,
        fixedTableTitle = null,
        eventId = null,
        onAddEntityInCard = null,
        eventStateSessionId = null,
        displayEventContacts = null;

  const ContactTable.byEvent({
    required this.componentIdentifier,
    required this.eventId,
    required this.onAddEntityInCard,
    required this.eventStateSessionId,
    this.floatingWindowId,
    super.key,
    this.initialFilter,
    this.tableDensity,
    this.hiddenFilterGroup,
    this.onSelect,
    this.selfGrowable = true,
    this.isSelection = false,
    this.toolbarPadding,
    this.showTableViews = false,
    this.showToolbarDivider = true,
    this.displayEventContacts = false,
    this.isCollapsible = true,
  })  : _tableType = ContactTableType.byEvent,
        isResizable = true,
        fixedTableTitle = null;

  final ContactTableType _tableType;
  final FilterGroup? hiddenFilterGroup;
  final Filter? initialFilter;
  final AppTableDensity? tableDensity;
  final void Function(Contact)? onSelect;
  final void Function()? onAddEntityInCard;
  final bool showToolbarDivider;
  final bool isResizable;
  final bool showTableViews;
  final String? fixedTableTitle;
  final bool isSelection;
  final String? floatingWindowId;
  final ComponentIdentifier componentIdentifier;
  final bool isCollapsible;
  final int? eventId;
  final String? eventStateSessionId;
  final bool selfGrowable;
  // Defines wether contacts that are already assigned to the event are
  // shown or excluded
  final bool? displayEventContacts;
  final EdgeInsets? toolbarPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);
    final availableFilterFieldsWithLabels = switch (_tableType) {
      ContactTableType.companies =>
        ContactField.values.filtersCompanies(l10n, crmL10n),
      ContactTableType.persons =>
        ContactField.values.filtersPersons(l10n, crmL10n),
      ContactTableType.all =>
        ContactField.values.filtersContacts(l10n, crmL10n),
      ContactTableType.byEvent =>
        ContactField.values.filtersContacts(l10n, crmL10n),
    };

    final availableTableColumnsWithLabels = switch (_tableType) {
      ContactTableType.companies =>
        ContactField.values.columnsCompanies(l10n, crmL10n),
      ContactTableType.persons =>
        ContactField.values.columnsPersons(l10n, crmL10n),
      ContactTableType.all =>
        ContactField.values.columnsContacts(l10n, crmL10n),
      ContactTableType.byEvent =>
        ContactField.values.columnsContacts(l10n, crmL10n),
    };

    final tableType = switch (_tableType) {
      ContactTableType.companies => TableType.contactCompany,
      ContactTableType.persons => TableType.contactPerson,
      ContactTableType.all => TableType.contact,
      ContactTableType.byEvent => TableType.contact,
    };
    final projectL10n = context.projectL10n;

    final defaultName = switch (_tableType) {
      ContactTableType.companies =>
        FloatingWindowType.contactCompanyTable.title(projectL10n),
      ContactTableType.persons =>
        FloatingWindowType.contactPersonTable.title(projectL10n),
      ContactTableType.all => crmL10n.contact_plural,
      ContactTableType.byEvent => crmL10n.contact_plural,
    };

    final dropdownFilterItems = useMemoized(
      () {
        return ContactFields.buildFilterDropdownItems(l10n, crmL10n);
      },
      [l10n, crmL10n],
    );

    return AppTableView<Contact, ContactField>(
      tableDefaultNamePlural: defaultName,
      tableViewIdentifier: componentIdentifier.name,
      isCollapsible: isCollapsible,
      isResizable: isResizable,
      dropdownFilterItems: dropdownFilterItems,
      showLoadingIndicatorOnRefresh: true,
      showTableViews: fixedTableTitle == null && showTableViews,
      toolbarPadding: toolbarPadding ?? EdgeInsets.zero,
      fixedTableTitle: fixedTableTitle,
      selfGrowable: selfGrowable,
      showToolbarDivider: showToolbarDivider,
      hiddenFilterGroup: hiddenFilterGroup,
      availableFilterFieldsWithLabels: availableFilterFieldsWithLabels,
      availableTableColumnsWithLabels: availableTableColumnsWithLabels,
      quickSearchFilterFields:
          ContactField.values.quickSearchFilters(l10n, crmL10n),
      toolbarMobileTrailingActions: (sessionId) => [
        MobileTableToolbarActionItem(
          icon: AppIcons.refresh,
          label: l10n.gen_refresh,
          onPressed: () {
            switch (_tableType) {
              case ContactTableType.companies:
                ref.invalidate(findCompanyContactsProvider(sessionId));
              case ContactTableType.persons:
                ref.invalidate(findPersonContactsProvider(sessionId));

              case ContactTableType.all:
                ref.invalidate(findContactsProvider(sessionId));

              case ContactTableType.byEvent:
                ref.invalidate(
                  crmEventStateProvider(eventId!, eventStateSessionId!),
                );
            }
          },
        ),
        if (_tableType != ContactTableType.byEvent)
          MobileTableToolbarActionItem(
            icon: AppIcons.add,
            label: l10n.gen_add_entity(crmL10n.contact_singular),
            onPressed: () {
              ref.openWindow(
                _tableType == ContactTableType.persons
                    ? FloatingContactPersonWindowData(
                        contactId: null,
                      )
                    : FloatingContactCompanyWindowData(
                        contactId: null,
                      ),
              );
            },
          ),
        if (_tableType == ContactTableType.byEvent && isSelection)
          MobileTableToolbarActionItem(
            label: l10n.gen_add_entity(crmL10n.contact_plural),
            icon: AppIcons.add,
            onPressed: () async {
              await AsyncHandler.handleAsyncOperation(
                context,
                () async {
                  // Fetch relevant contacts
                  final contacts = await ref.read(
                    fetchContactsNotInEventProvider(
                      eventId!,
                      sessionId,
                    ).future,
                  );

                  // Add contacts to the event
                  await ref.read(crmEventRepositoryProvider).addContactsToEvent(
                        eventId: eventId!,
                        sessionId: sessionId,
                        contactIds: contacts.map((e) => e.meta.id!).toList(),
                      );
                },
                successMessage: l10n.gen_saving_success,
              );

              if (context.mounted) {
                Navigator.of(context).pop();
                isLoading.value = false;
              }
            },
          ),
        if (_tableType == ContactTableType.byEvent && !isSelection)
          MobileTableToolbarActionItem(
            label: l10n.gen_add_entity(crmL10n.contact_plural),
            icon: AppIcons.add,
            onPressed: onAddEntityInCard,
          ),
      ],
      toolbarTrailingActions: (sessionId) => [
        AppTableRefreshButton(
          onPressed: () {
            switch (_tableType) {
              case ContactTableType.companies:
                ref.invalidate(findCompanyContactsProvider(sessionId));
              case ContactTableType.persons:
                ref.invalidate(findPersonContactsProvider(sessionId));

              case ContactTableType.all:
                ref.invalidate(findContactsProvider(sessionId));

              case ContactTableType.byEvent:
                ref.invalidate(
                  crmEventStateProvider(eventId!, eventStateSessionId!),
                );
            }
          },
        ),
        if (_tableType != ContactTableType.byEvent)
          _AddContactButton(
            tableType: TableType.contact,
            readOnly: false,
            tableDensity: AppTableDensity.standard,
            initialContactType: _tableType == ContactTableType.persons
                ? ContactType.person
                : ContactType.company,
          ),
        if (_tableType == ContactTableType.byEvent && isSelection)
          _AddAllContactsToEventButton(
            eventId: eventId!,
            sessionId: sessionId,
            eventStateSessionId: eventStateSessionId!,
          ),
        if (_tableType == ContactTableType.byEvent && !isSelection)
          AppButton.primary(
            iconData: AppIcons.add,
            onPressed: onAddEntityInCard,
            tooltip: l10n.gen_add_entity(crmL10n.contact_plural),
          ),
      ],
      defaultTableConfig: switch (_tableType) {
        ContactTableType.companies => ContactFields.defaultCompanyTableColumns,
        ContactTableType.persons => ContactFields.defaultPersonsTableColumns,
        ContactTableType.all => ContactFields.defaultTableColumns,
        ContactTableType.byEvent => ContactFields.defaultTableColumns,
      },
      tableDensity: tableDensity,
      dataProvider: (sessionId) {
        return switch (_tableType) {
          ContactTableType.companies => findCompanyContactsProvider(sessionId),
          ContactTableType.persons => findPersonContactsProvider(sessionId),
          ContactTableType.all => findContactsProvider(sessionId),
          ContactTableType.byEvent => isSelection
              ? fetchContactsNotInEventProvider(
                  eventId!,
                  sessionId,
                )
              : fetchAndWatchEventContactsProvider(
                  eventId!,
                  sessionId,
                ),
        };
      },
      fieldFromKey: (fieldKey) => ContactFields.fromFieldKey(fieldKey).value,
      buildCellTitle: (field) =>
          ContactFields.fromEnum(field).readable(l10n, crmL10n),
      getTitleAlignment: (field) => ContactFields.fromEnum(field).cellAlignment,
      onRowShiftTab: (item) {
        if (floatingWindowId != null && !isSelection) {
          ref.removeWindow(floatingWindowId!);
        }
      },
      onRowTap: onSelect == null ? null : (item) => onSelect!(item),
      buildCell: (field, item) {
        final isDraft = item.meta.isDraft;
        final isBold = item.general.type == ContactType.company &&
            _tableType == ContactTableType.all;
        final cellAlignment = ContactFields.fromEnum(field).cellAlignment;

        return switch (field) {
          ContactField.customId => const SizedBox(),
          ContactField.customIdString => switch (isSelection) {
              true => AppTableCellOpenInNew(
                  item.fullContactId,
                  alignment: cellAlignment,
                  bold: isBold,
                  onPressed: () {
                    final isPerson = item.general.type == ContactType.person;
                    if (isPerson) {
                      ref.openWindow(
                        FloatingContactPersonWindowData(
                          contactId: item.meta.id,
                        ),
                      );
                    } else {
                      ref.openWindow(
                        FloatingContactCompanyWindowData(
                          contactId: item.meta.id,
                        ),
                      );
                    }
                  },
                ),
              false => AppTableCellText(
                  item.fullContactId,
                  alignment: cellAlignment,
                  bold: isBold,
                ),
            },
          ContactField.deletedAt => AppTableCellDateTime(
              item.meta.deletedAt,
              alignment: cellAlignment,
            ),
          ContactField.isDraft => AppTableCellBool(
              isDraft,
              alignment: cellAlignment,
            ),
          ContactField.salutationCode => AppTableCellText(
              item.general.salutationCode?.description ?? '',
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.importantNote => AppTableCellText(
              item.general.importantNote,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.languageCode => AppTableCellText(
              item.general.languageCode?.name ?? '',
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.countryCode => AppTableCellText(
              item.address.countryCode?.name ?? '',
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.filterByIdOrFullName => const SizedBox.shrink(),
          ContactField.selectContact => const SizedBox.shrink(),
          ContactField.id => AppTableCellNum(
              item.meta.id,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.type => AppTableCellText(
              item.general.type.toString(),
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.firstName => AppTableCellText(
              item.general.firstName,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.lastName => AppTableCellText(
              item.general.lastName,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.fullName => AppTableCellText(
              item.general.name,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.address => AppTableCellText(
              item.address.address,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.address2 => AppTableCellText(
              item.address.address2,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.address3 => AppTableCellText(
              item.address.address3,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.postCode => AppTableCellText(
              item.address.postCode,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.city => AppTableCellText(
              item.address.city,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.state => AppTableCellText(
              item.address.state,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.phone => AppTableCellText(
              item.communication.phone,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.email => AppTableCellText(
              item.communication.email,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.mobile => AppTableCellText(
              item.communication.mobile,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.website => AppTableCellText(
              item.communication.website,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.customer => const SizedBox.shrink(),
          ContactField.customerId => const SizedBox.shrink(),
          ContactField.customerCustomId => AppTableCellOpenInNew(
              item.customer?.customId.toString() ?? '',
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
              onShiftPressed: () {
                if (floatingWindowId != null) {
                  ref.removeWindow(floatingWindowId!);
                }
              },
              onPressed: item.customer?.meta.id == null
                  ? null
                  : () {
                      ref.openWindow(
                        FloatingCustomerWindowData(
                          customerId: item.customer!.meta.id,
                        ),
                      );
                    },
            ),

          // Meta Fields
          ContactField.createdAt => AppTableCellDateTime(
              item.meta.createdAt,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.createdBy => AppTableCellUser(
              item.meta.createdById,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.lastModifiedAt => AppTableCellDateTime(
              item.meta.lastModifiedAt,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.lastModifiedBy => AppTableCellUser(
              item.meta.lastModifiedById,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.birthDate => AppTableCellDate(
              item.general.birthDate,
              alignment: cellAlignment,
              bold: isBold,
              italic: isDraft,
            ),
          ContactField.actions => _tableType == ContactTableType.byEvent &&
                  !isSelection
              ? AppTableCellTextButton(
                  crmL10n.event_remove_contact,
                  alignment: cellAlignment,
                  bold: isBold,
                  italic: isDraft,
                  onPressed: () {
                    ref.read(crmEventRepositoryProvider).deleteContactFromEvent(
                          eventId: eventId!,
                          contactId: item.meta.id!,
                        );
                  },
                )
              : const SizedBox.shrink(),
        };
      },
    );
  }
}

class _AddAllContactsToEventButton extends HookConsumerWidget {
  const _AddAllContactsToEventButton({
    required this.eventId,
    required this.sessionId,
    required this.eventStateSessionId,
  });

  final int eventId;
  final String sessionId;
  final String eventStateSessionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;
    final isLoading = useState<bool>(false);

    return AppButton.primary(
      label: l10n.gen_add_entity(crmL10n.contact_plural),
      isLoading: isLoading.value,
      onPressed: isLoading.value
          ? null
          : () async {
              isLoading.value = true;
              await AsyncHandler.handleAsyncOperation(
                context,
                () async {
                  // Fetch relevant contacts
                  final contacts = await ref.read(
                    fetchContactsNotInEventProvider(
                      eventId,
                      sessionId,
                    ).future,
                  );

                  // Add contacts to the event
                  await ref.read(crmEventRepositoryProvider).addContactsToEvent(
                        eventId: eventId,
                        sessionId: sessionId,
                        contactIds: contacts.map((e) => e.meta.id!).toList(),
                      );
                },
                successMessage: l10n.gen_saving_success,
              );

              if (context.mounted) {
                Navigator.of(context).pop();
                isLoading.value = false;
              }
            },
    );
  }
}

class _AddContactButton extends HookConsumerWidget {
  const _AddContactButton({
    required this.tableType,
    required this.readOnly,
    required this.tableDensity,
    required this.initialContactType,
  });

  final TableType tableType;

  final bool readOnly;
  final AppTableDensity tableDensity;
  final ContactType initialContactType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final crmL10n = context.crmL10n;

    return AppButton.primary(
      onPressed: readOnly
          ? null
          : () {
              final isPerson = initialContactType == ContactType.person;
              if (isPerson) {
                ref.openWindow(
                  FloatingContactPersonWindowData(
                    contactId: null,
                  ),
                );
              } else {
                ref.openWindow(
                  FloatingContactCompanyWindowData(
                    contactId: null,
                  ),
                );
              }
            },
      tooltip: l10n.gen_add_entity(crmL10n.contact_singular),
      iconData: AppIcons.add,
    );
  }
}
