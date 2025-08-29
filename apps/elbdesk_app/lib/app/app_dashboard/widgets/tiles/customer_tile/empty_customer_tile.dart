/// A tile widget for selecting a customer
// class EmptyCustomerTile extends ConsumerWidget {
//   const EmptyCustomerTile({
//     required this.tileId,
//     required this.selectedCustomerId,
//     super.key,
//   });

//   final String? tileId;
//   final ValueNotifier<int?> selectedCustomerId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     return DashboardGridTile(
//       title: l10n.crm_customer_singular,
//       leadingIcon: AppIcons.company,
//       tileId: tileId,
//       isScrollable: false,
//       children: [
//         // Button prompting user to choose a customer
//         Center(
//           child: AppButton.primary(
//             iconData: AppIcons.contact,
//             label: l10n.gen_add_entity(l10n.crm_customer_singular),
//             onPressed: () async {
//               // Open a floating dialog with customer table
//               final selectedCustomer =
//                   await AppResponsiveDialog.show<Customer?>(
//                 context: context,
//                 navigatorKey: dashboardNavigatorKey,
//                 showSubmitCloseDialog: false,
//                 maxHeight: 500,
//                 child: const _SelectCustomerFromTable(),
//               );

//               // Update local state if a customer is selected.
//               if (selectedCustomer != null) {
//                 selectedCustomerId.value = selectedCustomer.id;

//                 // Persist the selected customer in the dashboard state
//                 // if tileId is provided
//                 if (tileId != null) {
//                   try {
//                     // Update dashboard tile configuration with the new
//                     // customer id
//                     ref.read(dashboardStateProvider).whenData((tiles) {
//                       // Find the tile configuration matching the tileId
//                       final index =
//                           tiles.indexWhere((tile) => tile.id == tileId);
//                       if (index != -1) {
//                         // Create updated configuration with new custome
//                         // id (assumes copyWith exists)
//                         final updatedTile = tiles[index]
//                             .copyWith(entityId: selectedCustomer.id);
//                         final updatedTiles =
//                             List<DashboardTileConfig>.from(tiles)
//                               ..[index] = updatedTile;
//                         // Optimistically update dashboard state,
//                         // which also persists changes
//                         ref
//                             .read(dashboardStateProvider.notifier)
//                             .updateTiles(updatedTiles);
//                       }
//                     });
//                   } catch (error) {
//                     // Show error feedback if the configuration update fails
//                     if (context.mounted) {
//                       AppNotificationOverlay.error(
//                         context,
//                         // TODO: merge conflict
//                         error.toString(),
//                         // l10n.gen_error(error),
//                       );
//                     }
//                   }
//                 }
//               }
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }

/// Floating dialog content for selecting a customer
// class _SelectCustomerFromTable extends StatelessWidget {
//   const _SelectCustomerFromTable();

//   @override
//   Widget build(BuildContext context) {
//     return SelfScrollableCardItem(
//       showRightPadding: true,
//       child: CustomerTable.selectCustomer(
//         collapsibleIdentifier: null,
//         onSelect: (customer) {
//           // Return the selected customer and close the dialog.
//           Navigator.of(context).pop(customer);
//         },
//       ),
//     );
//   }
// }
