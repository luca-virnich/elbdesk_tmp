// import 'package:elbdesk_sales/src/soi_step_and_repeat/logic/soi_step_and_repeat_provider.dart';
// import 'package:elbdesk_sales/src/soi_step_and_repeat/widgets/soi_step_and_repeat_table.dart';
// import 'package:flutter/widgets.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// Sales Order Step and Repeat
// ///
// /// Displays the step and repeat associated with the sales order
// class SalesOrderStepAndRepeat extends HookConsumerWidget {
//   const SalesOrderStepAndRepeat({required this.salesOrderId, super.key});
//   final int salesOrderId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return SoiStepAndRepeatTable.allFromSalesOrder(
//       salesOrderId: salesOrderId,
//       dataProvider: (sessionId) =>
//           watchSoiStepAndRepeatBySalesOrderProvider(salesOrderId, sessionId),
//     );
//   }
// }
