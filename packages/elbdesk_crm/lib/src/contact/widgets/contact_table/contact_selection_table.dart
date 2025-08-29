// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_crm/elbdesk_crm.dart';
// import 'package:elbdesk_crm/src/contact/config/contact_table_default_columns.dart';
// import 'package:elbdesk_crm/src/contact/extensions/contact_field_extension.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// A simplified table view for selecting contacts
// ///
// /// This widget provides a compact table interface optimized for contact
// /// selection with support for hidden filters and basic contact information
// /// display
// class ContactSelectionTable extends HookConsumerWidget {
//   /// Creates a contact selection table
//   const ContactSelectionTable({
//     super.key,
//     this.onSelect,
//     this.hiddenFilterGroup,
//   });

//   /// Callback when a contact is selected
//   final void Function(Contact)? onSelect;

//   /// Optional hidden filters to pre-filter the contacts
//   final FilterGroup? hiddenFilterGroup;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     return AppTableView<Contact, ContactField>(
//       isResizable: false,
//       isSortable: false,
//       showTableViews: false,
//       showToolbarDivider: true,
//       tableDensity: AppTableDensity.compact,
//       tableType: TableType.contact,
//       hiddenFilterGroup: hiddenFilterGroup,
//       defaultTableConfig: contactTableDefaultColumns,
//       dataProvider: findContactsProvider.call,
//       onRowTap: onSelect,
//       fieldFromKey: (fieldKey) =>
//           ContactFieldWrapper.fromFieldKey(fieldKey).field,
//       buildCellTitle: (field) => ContactFieldWrapper(field).readable(l10n),
//       getTitleAlignment: (field) => ContactFieldWrapper(field).cellAlignment,
//       buildCell: (field, item) {
//         final cellAlignment = ContactFieldWrapper(field).cellAlignment;
//         final isDraft = item.meta.isDraft;
//         final isBold = item.general.type == ContactType.company;

//         return switch (field) {
//           ContactField.customId => AppTableCellText(
//               item.fullContactId,
//               alignment: cellAlignment,
//             ),
//           ContactField.deletedAt => AppTableCellDateTime(
//               item.meta.deletedAt,
//               alignment: cellAlignment,
//             ),
//           ContactField.isDraft => AppTableCellBool(
//               isDraft,
//               alignment: cellAlignment,
//             ),
//           ContactField.salutationCode => AppTableCellText(
//               item.general.salutationCode?.description ?? '',
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.importantNote => AppTableCellText(
//               item.general.importantNote,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.languageCode => AppTableCellText(
//               item.general.languageCode?.name ?? '',
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.countryCode => AppTableCellText(
//               item.address.countryCode?.name ?? '',
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.selectContact => AppTableCellTextButton(
//               l10n.gen_table_select_entity,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//               onPressed: () {
//                 onSelect?.call(item);
//               },
//             ),
//           ContactField.id => AppTableCellTextButton(
//               item.meta.id.toString(),
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.type => AppTableCellText(
//               item.general.type.toString(),
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.firstName => AppTableCellText(
//               item.general.firstName,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.lastName => AppTableCellText(
//               item.general.lastName,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.fullName => AppTableCellText(
//               item.general.name,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.initials => AppTableCellText(
//               item.general.initials,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.address => AppTableCellText(
//               item.address.address,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.address2 => AppTableCellText(
//               item.address.address2,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.address3 => AppTableCellText(
//               item.address.address3,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.postCode => AppTableCellText(
//               item.address.postCode,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.city => AppTableCellText(
//               item.address.city,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.state => AppTableCellText(
//               item.address.state,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.phone => AppTableCellText(
//               item.communication.phone,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.email => AppTableCellText(
//               item.communication.email,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.mobile => AppTableCellText(
//               item.communication.mobile,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.website => AppTableCellText(
//               item.communication.website,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.customer => AppTableCellText(
//               item.customer?.contact?.general.name ?? '',
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.customerId => AppTableCellTextButton(
//               item.customer?.meta.id.toString() ?? '',
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//               onPressed: item.customer?.meta.id == null
//                   ? null
//                   : () {
//                       ref
//                           .read(floatingWindowDataStateProvider.notifier)
//                           .addWindow(
//                             FloatingCustomerWindowData(
//                               customerId: item.customer!.meta.id,
//                             ),
//                           );
//                     },
//             ),
//           ContactField.customerCustomId => AppTableCellText(
//               item.customer?.customId.toString() ?? '',
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.filterByIdOrFullName => AppTableCellTextButton(
//               item.general.name,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),

//           // Meta Fields
//           ContactField.createdAt => AppTableCellDateTime(
//               item.meta.createdAt,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.createdBy => AppTableUserCell(
//               item.meta.createdById,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.lastModifiedAt => AppTableCellDateTime(
//               item.meta.lastModifiedAt,
//               alignment: cellAlignment,
//               bold: item.general.type == ContactType.company,
//               italic: isDraft,
//             ),
//           ContactField.lastModifiedBy => AppTableUserCell(
//               item.meta.lastModifiedById,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//           ContactField.birthDate => AppTableCellDateTime(
//               item.general.birthDate,
//               alignment: cellAlignment,
//               bold: isBold,
//               italic: isDraft,
//             ),
//         };
//       },
//       availableFilterFieldsWithLabels:
//           ContactField.values.filterableWithLabelsAll(
//         l10n,
//       ),
//       availableTableColumnsWithLabels: null,
//       toolbarTrailingActions: null,
//     );
//   }
// }
