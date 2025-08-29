// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// Me Mode Button
// ///
// /// This button is used to filter the table by the current user
// /// It is a toggle button that adds or removes a filter to the tableState
// /// based on the current user
// class MeModeButton extends HookConsumerWidget {
//   /// Constructor
//   const MeModeButton({
//     required this.sessionId,
//     required this.fieldKey,
//     required this.tableType,
//     this.isSmallButton = false,
//     super.key,
//   });

//   /// The sessionId is used to identify the tableState
//   final String sessionId;

//   /// The fieldKey is used to identify the field to filter
//   ///
//   /// e.g.
//   /// - SalesOrderField.handlingUser.name
//   /// - SalesOrderItemField.handlingUser.name
//   final String fieldKey;

//   /// Wether the Button should be small
//   final bool isSmallButton;

//   /// The tableType is used to identify the table to filter
//   ///
//   /// e.g.
//   /// - TableType.sales_order
//   /// - TableType.sales_order_item
//   final TableType tableType;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     final tableStateNotifier = ref.watch(
//       hiddenAppTableFilterGroupStateProvider(
//         tableType.name,
//         sessionId,
//       ).notifier,
//     );

//     final currentUserName = ref.watch(
//       authUserStateProvider.select((value) {
//         return value?.id.toString() ?? '';
//       }),
//     );

//     final meModeFilter = useMemoized(
//       () => FilterField(
//         uuid: const Uuid().v4(),
//         fieldKey: fieldKey,
//         filterOperator: FilterOperator.and,
//         type: FilterType.equal,
//         fieldType: FilterFieldType.text,
//         value: currentUserName,
//       ),
//       [],
//     );
//     return AppToggleButton(
//       //  label: l10n.gen_me_mode,

//       onChanged: (value) {
//         if (value) {
//           // Add filter to tableState
//           tableStateNotifier.addFilterField(meModeFilter);
//         } else {
//           tableStateNotifier.removeFilterField(meModeFilter);
//         }
//       },
//       tooltip: l10n.gen_me_mode,

//       icon: AppIcons.person,

//       label: isSmallButton ? null : l10n.gen_me_mode,
//     );
//   }
// }
