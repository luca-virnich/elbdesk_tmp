// import 'package:elbdesk_app/widgets/table_sort_button.dart';
// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_prepress/elbdesk_prepress.dart';
// import 'package:elbdesk_prepress/src/bearers/config/bearer_fields.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// Possible types of the Bearer Table
// enum _BearerTableType {
//   /// Standard Table with all available bearers
//   standard,

//   /// Bearer Table by customerId
//   byCustomer,
// }

// /// Bearer Table
// ///
// /// The Table View for the Bearers
// ///
// /// This table view is used to display the bearers in a table view
// /// It uses the AppTable widget to display the bearers
// class BearerTable extends HookConsumerWidget {
//   /// Constructor

//   const BearerTable({
//     required componentIdentifier? componentIdentifier,
//     Key? key,
//   }) : this._(
//           tableType: _BearerTableType.standard,
//           key: key,
//           componentIdentifier: componentIdentifier,
//         );

//   const BearerTable._({
//     required _BearerTableType tableType,
//     required this.componentIdentifier,
//     super.key,
//     this.readOnly = false,
//     this.tableDensity = AppTableDensity.standard,
//     this.customerId,
//   }) : _tableType = tableType;

//   /// Bearer Table
//   ///
//   /// This is the standard BearerTable which displays all bearers
//   /// available to the current user
//   const BearerTable.standard({
//     required componentIdentifier? componentIdentifier,
//     Key? key,
//     bool readOnly = false,
//     AppTableDensity sizeType = AppTableDensity.standard,
//   }) : this._(
//           tableType: _BearerTableType.standard,
//           readOnly: readOnly,
//           tableDensity: sizeType,
//           key: key,
//           componentIdentifier: componentIdentifier,
//         );

//   /// Bearer Table
//   ///
//   /// This displays the BearerTable filtered by customerId
//   /// Only the bearers linked to the specific customer will be displayed
//   const BearerTable.byCustomer({
//     required int customerId,
//     required componentIdentifier? componentIdentifier,
//     Key? key,
//     bool readOnly = false,
//     AppTableDensity sizeType = AppTableDensity.standard,
//   }) : this._(
//           tableType: _BearerTableType.byCustomer,
//           readOnly: readOnly,
//           tableDensity: sizeType,
//           key: key,
//           customerId: customerId,
//           componentIdentifier: componentIdentifier,
//         );

//   /// Type of the table
//   /// Defined through constructors
//   final _BearerTableType _tableType;

//   /// Wether available buttons should be clickable
//   final bool readOnly;

//   /// Size and look of the table
//   final AppTableDensity tableDensity;

//   /// The id of the customer
//   final int? customerId;

//   /// The collapsible identifier
//   final componentIdentifier? componentIdentifier;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Every table view needs a unique sessionId which will be used for
//     // several operations like the filter, current view config etc.
//     // We need this to be able to differentiate between different table views
//     // with the same table (e.g. bearer table in two different tabs)
//     final sessionId = useUuid();

//     final l10n = context.l10n;

//     /// Depending on the type of the table another provider can be used
//     final bearersProvider = switch (_tableType) {
//       _BearerTableType.standard => fetchBearersProvider(
//           TableType.bearer,
//           sessionId,
//         ),
//       _BearerTableType.byCustomer => fetchBearersByCustomerProvider(
//           customerId!,
//           TableType.bearer,
//           sessionId,
//         ),
//     };

//     // OnSave Callback
//     // Called when an object is saved to this table
//     final onSaveCallback = useMemoized(
//       () {
//         return () {};
//       },
//       [],
//     );

//     final containerKey = useMemoized(GlobalKey.new, []);
//     return AppTableWrapper(
//       showToolbarDivider: true,
//       key: containerKey,
//       tableDensity: tableDensity,
//       toolbar: _BearerTableToolbar(
//         sessionId: sessionId,
//         l10n: l10n,
//         onSaveCallback: onSaveCallback,
//         tableDensity: tableDensity,
//         readOnly: readOnly,
//         componentIdentifier: componentIdentifier,
//       ),
//       content: _BearerTableContent(
//         bearersProvider: bearersProvider,
//         sessionId: sessionId,
//         l10n: l10n,
//       ),
//     );
//   }
// }

// class _BearerTableToolbar extends HookWidget {
//   const _BearerTableToolbar({
//     required this.sessionId,
//     required this.l10n,
//     required this.onSaveCallback,
//     required this.tableDensity,
//     required this.readOnly,
//     required this.componentIdentifier,
//   });

//   final String sessionId;
//   final ElbCoreLocalizations l10n;
//   final Null Function() onSaveCallback;
//   final AppTableDensity tableDensity;
//   final bool readOnly;
//   final componentIdentifier? componentIdentifier;

//   @override
//   Widget build(BuildContext context) {
//     final shwoTableViews =
//         useMemoized(() => tableDensity == AppTableDensity.standard, []);

//     final containerKey = useMemoized(GlobalKey.new, []);
//     return AppTableToolbar<BearerField>(
//       tableDensity: tableDensity,
//       tableDefaultConfig: bearerTableDefaultConfig,
//       componentIdentifier: componentIdentifier,
//       onlyDefaultConfig: true,
//       containerKey: containerKey,
//       tableType: TableType.bearer,
//       sessionId: sessionId,
//       showTableViews: shwoTableViews,
//       availableFilterFields: BearerField.values.filterableWithLabels(
//         l10n,
//       ),
//       availableTableColumns: BearerField.values.tableColumnsWithLabels(
//         l10n,
//       ),
//       trailingActions: [
//         const SizedBox(
//           width: UiConstants.elementMargin,
//         ),
//         // Add new Bearer Button
//         _AddBearerButton(
//           sessionId: sessionId,
//           tableType: TableType.bearer,
//           onSaveCallback: onSaveCallback,
//           readOnly: readOnly,
//         ),
//       ],
//     );
//   }
// }

// class _BearerTableContent extends HookConsumerWidget {
//   const _BearerTableContent({
//     required this.bearersProvider,
//     required this.sessionId,
//     required this.l10n,
//   });

//   final AutoDisposeFutureProvider<List<Bearer>> bearersProvider;
//   final String sessionId;
//   final ElbCoreLocalizations l10n;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(bearersProvider).when(
//           skipLoadingOnRefresh: true,
//           skipLoadingOnReload: true,
//           loading: () => const Center(child: AppLoadingIndicator()),
//           error: (error, stackTrace) => AppText('Error: $error'),
//           data: (bearers) {
//             // * Table *
//             return AppTable<Bearer>(
//               isResizable: true,
//               onlyDefaultTableConfig: true,
//               isSelectable: false,
//               tableType: TableType.bearer,
//               sessionId: sessionId,
//               tableDefaultConfig: bearerTableDefaultConfig,
//               columnSort: (
//                 fieldKey,
//               ) {
//                 return TableSortButton(
//                   fieldKey: fieldKey,
//                   tableId: sessionId,
//                 );
//               },
//               columnTitle: (
//                 fieldKey,
//               ) {
//                 final bearerField = BearerFields.fromFieldKey(
//                   fieldKey,
//                 );

//                 return AppTableTitleText(
//                   bearerField.readable(l10n),
//                   alignment: bearerField.cellAlignment,
//                 );
//               },
//               items: bearers,

//               // we get the tableFieldConfig with the fieldKey
//               //(The fieldKey is the key of the field in the table)
//               // We also get the bearer object which is the current
//               // row
//               cellWidget: (
//                 TableFieldConfig tableField,
//                 Bearer bearer,
//               ) {
//                 final bearerField = BearerFields.fromFieldKey(
//                   tableField.fieldKey,
//                 );

//                 // Based on the fieldKey a Field is returned
//                 // In this switch statement all available fields have
//                 // to be declared and defined with a widget so that
//                 // it can be displayed.
//                 // Also the actual data is assigned to the fields
//                 return switch (bearerField) {
//                   // ID Field
//                   // This Field is a great example for a field that also
//                   // acts as a button
//                   // The ID field can always be used to open the actual
//                   // bearer card in a new floating window
//                   BearerField.id => AppTableCellTextButton(
//                       bearer.meta.id.toString(),
//                       alignment: bearerField.cellAlignment,
//                       onPressed: () {
//                         // Add the window to the stack window state
//                         ref.openWindow(
//                           FloatingBearerWindowData(
//                             bearerId: bearer.meta.id,
//                           ),
//                         );
//                       },
//                     ),
//                   BearerField.deletedAt => AppTableCellDateTime(
//                       bearer.meta.deletedAt,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.isDraft => AppTableCellBool(
//                       bearer.meta.isDraft,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.type => AppTableCellText(
//                       bearer.general.type.toString(),
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.bearerName => AppTableCellText(
//                       bearer.general.name,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.description => AppTableCellText(
//                       bearer.general.description,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.longText => AppTableCellText(
//                       bearer.general.longText,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.costCenterCode => AppTableCellText(
//                       bearer.general.costCenterCode,
//                       alignment: bearerField.cellAlignment,
//                     ),

//                   // Meta Fields
//                   BearerField.createdAt => AppTableCellDateTime(
//                       bearer.meta.createdAt,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.createdBy => AppTableUserCell(
//                       bearer.meta.createdById,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.editingSince => AppTableCellDateTime(
//                       bearer.meta.editingSince,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                   BearerField.editingBy => AppTableUserCell(
//                       bearer.meta.editingById,
//                       alignment: bearerField.cellAlignment,
//                     ),
//                 };
//               },
//             );
//           },
//         );
//   }
// }

// /// Add Bearer Button
// ///
// /// This Button is used to add a new bearer to the database
// class _AddBearerButton extends HookConsumerWidget {
//   const _AddBearerButton({
//     required this.sessionId,
//     required this.tableType,
//     required this.onSaveCallback,
//     required this.readOnly,
//   });
//   final String sessionId;
//   final TableType tableType;
//   final VoidCallback onSaveCallback;
//   final bool readOnly;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;
//     final buttonKey = useMemoized(GlobalKey.new, []);
//     return AppButton.primary(
//       key: buttonKey,
//       onPressed: readOnly
//           ? null
//           : () async {
//               // Add the window to the stack window state
//               ref.openWindow(
//                 FloatingBearerWindowData(
//                   bearerId: null,
//                 ),
//               );
//             },
//       label: l10n.bearer_new,
//       iconData: AppIcons.add,
//     );
//   }
// }

// final bearerTableDefaultConfig = [
//   TableFieldConfig(
//     fieldKey: BearerField.id.name,
//     width: 100,
//   ),
// ];
