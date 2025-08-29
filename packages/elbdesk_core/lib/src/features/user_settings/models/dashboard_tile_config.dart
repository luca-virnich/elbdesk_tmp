// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'dashboard_tile_config.freezed.dart';

// /// Dashboard Tile Configuration model
// ///
// /// Stores layout parameters and persistent state for a dashboard tile.
// @freezed
// class DashboardTileConfig with _$DashboardTileConfig {
//   /// Main constructor including optional entity id fields.
//   const factory DashboardTileConfig({
//     required String id,
//     // Which slot the tile belongs to.
//     required int slotIndex,
//     // Position within the slot (0 is top)
//     required int stackPosition,
//     // Width of the tile in columns
//     required int columnSpan,
//     // Individual tile height
//     required double height,
//     // Type of the tile
//     required DashboardTileType type,

//     /// Optional identifier for the main entity e.g. a Customer ID.
//     int? entityId,

//     /// Optional list of related child entity IDs.
//     List<int>? childEntityIds,
//   }) = _DashboardTileConfig;

//   /// Private constructor for additional methods.
//   const DashboardTileConfig._();

//   /// Initial constructor for new tiles.
//   factory DashboardTileConfig.initial({
//     required String id,
//     required int slotIndex,
//     required DashboardTileType type,
//   }) =>
//       DashboardTileConfig(
//         id: id,
//         slotIndex: slotIndex,
//         stackPosition: 0,
//         columnSpan: 1,
//         height: 400,
//         type: type,
//         entityId: null,
//         childEntityIds: null,
//       );

//   /// Empty constructor for placeholder tiles.
//   factory DashboardTileConfig.empty({
//     required int slotIndex,
//     required DashboardTileType type,
//   }) =>
//       DashboardTileConfig(
//         id: 'empty_$slotIndex',
//         slotIndex: slotIndex,
//         stackPosition: 0,
//         columnSpan: 1,
//         height: 400,
//         type: type,
//         entityId: null,
//         childEntityIds: null,
//       );

//   /// Constructs a DashboardTileConfig from a DTO.
//   factory DashboardTileConfig.fromDTO(DashboardTileConfigDTO dto) =>
//       DashboardTileConfig(
//         id: dto.id,
//         slotIndex: dto.slotIndex,
//         stackPosition: dto.stackPosition,
//         columnSpan: dto.columnSpan,
//         height: dto.height,
//         type: dto.type,
//         entityId: dto.entityId,
//         childEntityIds: dto.childEntityIds,
//       );

//   /// Converts the DashboardTileConfig to its DTO.
//   DashboardTileConfigDTO toDTO() => DashboardTileConfigDTO(
//         id: id,
//         slotIndex: slotIndex,
//         stackPosition: stackPosition,
//         columnSpan: columnSpan,
//         height: height,
//         type: type,
//         entityId: entityId,
//         childEntityIds: childEntityIds,
//       );
// }
