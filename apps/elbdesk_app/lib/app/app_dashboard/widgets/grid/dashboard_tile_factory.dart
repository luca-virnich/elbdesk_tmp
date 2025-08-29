// import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/admin_tile.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/assigned_to_me_tile.dart';
// import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/recent_entity_tile.dart';
// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// Maps a [DashboardTileConfig] to its proper dashboard tile widget
// class DashboardTileFactory extends HookConsumerWidget {
//   /// Constructor.
//   const DashboardTileFactory({
//     required this.config,
//     required this.tileWidth,
//     super.key,
//   });

//   /// The configuration for the dashboard tile
//   final DashboardTileConfig config;

//   /// The computed width of a tile passed from DashboardGrid
//   final double tileWidth;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Map the dashboard tile type to the corresponding widget
//     switch (config.type) {
//       case DashboardTileType.recent_items:
//         return RecentEntityGridTile(
//           tileId: config.id,
//         );
//       case DashboardTileType.admin:
//         return AdminTile(
//           tileId: config.id,
//         );
//       case DashboardTileType.assigned:
//         return AssignedToMeTile(
//           tileId: config.id,
//         );
//       case DashboardTileType.customer:
//         return const SizedBox.shrink();
//       // case DashboardTileType.customer:
//       //   return CustomerTile(
//       //     tileId: config.id,
//       //     tileWidth: tileWidth,
//       //     customerId: config.entityId,
//       //     contactIds: config.childEntityIds,
//       //   );
//     }
//   }
// }
