// import 'package:elbdesk_prepress/elbdesk_prepress.dart';
// import 'package:flutter/widgets.dart';

// class SalesOrderArtworks extends StatelessWidget {
//   const SalesOrderArtworks({
//     required this.salesOrderId,
//     required this.customerId,
//     required this.navigatorKey,
//     super.key,
//   });
//   final int salesOrderId;
//   final int customerId;
//   final GlobalKey<NavigatorState> navigatorKey;

//   @override
//   Widget build(BuildContext context) {
//     return ArtworkTable.bySalesOrder(
//       salesOrderId: salesOrderId,
//       customerId: customerId,
//       navigatorKey: navigatorKey,
//       dataProvider: (sessionId) =>
//           watchArtworksBySalesOrderProvider(salesOrderId, sessionId),
//     );
//   }
// }
