/// A tile widget for displaying a customer
///
/// When no customer is selected, shows a "Choose Customer" button that opens
/// a floating dialog with a customer table to search and select a customer.
/// When a customer is selected, the customer's data is fetched asynchronously.
/// The tile is built using [DashboardGridTile]
// class CustomerTile extends HookConsumerWidget {
//   const CustomerTile({
//     required this.tileWidth,
//     super.key,
//     this.tileId,
//     this.customerId,
//     this.contactIds,
//   });

//   final double tileWidth;
//   final String? tileId;
//   final int? customerId;
//   final List<int>? contactIds;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedCustomerId = useState<int?>(customerId);

//     // If no customer is selected, display the "Choose Customer" button.
//     if (selectedCustomerId.value == null) {
//       return EmptyCustomerTile(
//         tileId: tileId,
//         selectedCustomerId: selectedCustomerId,
//       );
//     }

//     final asyncCustomer =
//         ref.watch(fetchCustomerProvider(customerId: selectedCustomerId.value!));

//     return asyncCustomer.componentWhen(
//       // Display customer details on successful fetch.
//       data: (customer) => _CustomerTileContent(
//         tileId: tileId,
//         customerId: selectedCustomerId.value!,
//         companyId: customer.contact!.meta.id,
//         customer: customer,
//         tileWidth: tileWidth,
//       ),
//       // Show loading tile while customer is being fetched.
//       loadingWidget: DashboardGridTile(
//         title: '',
//         tileId: tileId,
//         children: const [
//           AppLoadingIndicator(),
//         ],
//       ),
//     );
//   }
// }

/// The tile displaying customer details along with contact information,
/// now relying solely on the dashboard state for its contacts.
// class _CustomerTileContent extends HookConsumerWidget {
//   const _CustomerTileContent({
//     required this.tileId,
//     required this.customerId,
//     required this.companyId,
//     required this.customer,
//     required this.tileWidth,
//   });

//   final String? tileId;
//   final int customerId;
//   final int? companyId;
//   final Customer customer;
//   final double tileWidth;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     // Retrieve the dashboard tile configuration if tileId is provided.
//     final tileConfig =
//         ref.watch(dashboardStateProvider).requireValue.firstWhere(
//               (tile) => tile.id == tileId,
//             );

//     final contactIds = tileConfig.childEntityIds ?? [];

//     return DashboardGridTile(
//       title: customer.contact?.general.name ?? '',
//       leadingIcon: AppIcons.customer,
//       tileId: tileId,

//       // Open Customer Window
//       onIconTap: () {
//         ref.openWindow(
//           FloatingCustomerWindowData(
//             customerId: customerId,
//           ),
//         );
//       },
//       actions: [
//         // Create a new sales order
//         AppButton.primary(
//           iconData: AppIcons.add,
//           tooltip: tileWidth > 350 ? null : l10n.sales_sales_order_singular,
//           label: tileWidth > 350 ? l10n.sales_sales_order_singular : null,
//           onPressed: () {
//             ref.openWindow(
//               FloatingSalesOrderWindowData(
//                 salesOrderId: null,
//                 customerId: customerId,
//               ),
//             );
//           },
//         ),
//       ],
//       appPopMenuItems: [
//         // Add new contact to tile
//         NextMenuItemButton(
//           child: AppText(
//             l10n.gen_add_entity(l10n.crm_contact_singular),
//             autoSize: false,
//           ),
//           onPressed: () async {
//             // Open a dialog for selecting a contact.
//             final selectedContact = await AppResponsiveDialog.show<Contact?>(
//               context: context,
//               navigatorKey: dashboardNavigatorKey,
//               showSubmitCloseDialog: false,
//               title: l10n.crm_company_employee_assigned_employees,
//               maxHeight: 500,
//               icon: AppIcons.employee,
//               child: SelfScrollableCardItem(
//                 showRightPadding: true,
//                 child: _EmployeeSelectionList(
//                   customerId: customerId,
//                   companyId: companyId,
//                 ),
//               ),
//             );

//             // If a contact is selected and tileId exists, update dashboard
//             // state
//             if (selectedContact != null && tileId != null) {
//               try {
//                 // Retrieve current dashboard tile configuration.
//                 final tiles = ref.read(dashboardStateProvider).requireValue;
//                 final thisTileConfig =
//                     tiles.firstWhere((tile) => tile.id == tileId);
//                 final currentChildIds = thisTileConfig.childEntityIds ?? [];

//                 // Only update when the contact ID is not already present
//                 if (!currentChildIds.contains(selectedContact.meta.id)) {
//                   final updatedTile = thisTileConfig.copyWith(
//                     childEntityIds: [
//                       ...currentChildIds,
//                       selectedContact.meta.id!,
//                     ],
//                   );
//                   ref
//                       .read(dashboardStateProvider.notifier)
//                       .updateTile(updatedTile);
//                 }
//               } catch (error) {
//                 if (context.mounted) {
//                   AppNotificationOverlay.error(
//                     context,
//                     l10n.gen_error(error),
//                   );
//                 }
//               }
//             }
//           },
//         ),
//       ],
//       children: [
//         DashboardTileContacts(
//           contactIds: [customer.contact!.meta.id!, ...contactIds],
//           tileWidth: tileWidth,
//         ),
//       ],
//     );
//   }
// }

/// Displays a row of contact cards based on contact IDs
// class DashboardTileContacts extends StatelessWidget {
//   const DashboardTileContacts({
//     required this.contactIds,
//     required this.tileWidth,
//     super.key,
//   });

//   final List<int> contactIds;

//   final double tileWidth;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           for (int i = 0; i < contactIds.length; i++) ...[
//             Expanded(
//               child: DashboardContactInfo(
//                 contactId: contactIds[i],
//                 tileWidth: tileWidth,
//               ),
//             ),
//             if (i < contactIds.length - 1) const SizedBox(width: AppSpace.s),
//           ],
//         ],
//       ),
//     );
//   }
// }

// /// Fetches and displays detailed contact information by contact ID
// class DashboardContactInfo extends ConsumerWidget {
//   const DashboardContactInfo({
//     required this.contactId,
//     required this.tileWidth,
//     super.key,
//   });

//   final int contactId;

//   final double tileWidth;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final contactAsync = ref.watch(fetchContactByIdProvider(contactId));

//     return contactAsync.fastWhen(
//       data: (contact) => ContactInfoCard(
//         contact: contact,
//         tileWidth: tileWidth,
//       ),
//     );
//   }
// }

// /// Displays a list of employees associated with the customer for selection
// class _EmployeeSelectionList extends ConsumerWidget {
//   const _EmployeeSelectionList({
//     required this.customerId,
//     required this.companyId,
//   });

//   final int customerId;
//   final int? companyId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     final employeesAsync = ref.watch(
//       fetchEmployeesByCompanyWithoutFilterProvider(
//         companyId: companyId!,
//       ),
//     );

//     return employeesAsync.fastWhen(
//       data: (employees) {
//         if (employees.isEmpty) {
//           return Center(
//             child: AppText(l10n.crm_company_employee_no_assigned_employees),
//           );
//         }

//         return ListView.separated(
//           shrinkWrap: true,
//           itemCount: employees.length,
//           separatorBuilder: (_, __) => const SizedBox(height: AppSpace.m),
//           itemBuilder: (context, index) {
//             final employee = employees[index];
//             return ElbListTile(
//               mainAxisAlignment: MainAxisAlignment.start,
//               onPressed: () => Navigator.of(context).pop(employee.employee),
//               leading: const ElbIcon(AppIcons.employee),
//               titleText: employee.employee.general.name,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const SizedBox(width: AppSpace.m),
//                   //Name
//                   AppText(
//                     employee.employee.general.name,
//                     style: context.appTheme.textStyles.h3,
//                   ),
//                   const SizedBox(width: AppSpace.m),
//                   //Job Title
//                   AppText(employee.position),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
