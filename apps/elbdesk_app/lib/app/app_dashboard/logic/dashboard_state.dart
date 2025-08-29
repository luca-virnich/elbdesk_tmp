/// Dashboard State
///
/// Manages the dashboard grid configuration and persists changes to the server.
/// This state ensures immediate UI updates by optimistically updating the grid.
// @riverpod
// class DashboardState extends _$DashboardState {
//   // Add debouncing for persistence
//   Timer? _persistDebounceTimer;

//   @override
//   Future<List<DashboardTileConfig>> build() async {
//     // Retrieve initial dashboard tile configuration from user settings.
//     final dashboardTileConfigs = ref.watch(
//       userSettingsStateProvider
//           .selectAsync((value) => value.dashboardTileConfigs),
//     );
//     return dashboardTileConfigs;
//   }

//   /// Adds a new tile to the dashboard
//   Future<void> addTile(DashboardTileType type) async {
//     final currentTiles = state.requireValue;

//     // Find first empty slot by checking existing tiles
//     final usedSlots = currentTiles.map((t) => t.slotIndex).toSet();
//     var firstEmptySlot = 0;
//     while (usedSlots.contains(firstEmptySlot)) {
//       firstEmptySlot++;
//     }

//     final newTile = DashboardTileConfig(
//       id: const Uuid().v4(),
//       type: type,
//       slotIndex: firstEmptySlot,
//       stackPosition: 0,
//       columnSpan: 1,
//       height: DashboardUIConstants.defaultTileHeight,
//     );

//     // Ensure the current state is loaded before updating.
//     if (state.value == null) return;
//     // Create updated list with the new tile appended.
//     final updatedTiles = List<DashboardTileConfig>.from(state.value!)
//       ..add(newTile);
//     // Optimistically update state.
//     state = AsyncData(updatedTiles);
//     // Persist the updated configuration.
//     await _persist(updatedTiles);
//   }

//   /// Updates a specific tile configuration.
//   ///
//   /// Applies an update immediately and then persists the changes.
//   void updateTile(DashboardTileConfig tile) {
//     state =
//         AsyncData(state.value!.map((t) => t.id == tile.id ? tile : t).toList());
//     _persist(state.value!);
//   }

//   /// Updates the entire dashboard tile configuration.
//   ///
//   /// Applies an update immediately and then persists the changes.
//   void updateTiles(List<DashboardTileConfig> tiles) {
//     // Avoid unnecessary list copies
//     if (listEquals(state.value, tiles)) return;
//     state = AsyncData(tiles);
//     _persist(tiles);
//   }

//   /// Persists the current dashboard configuration to the server.
//   ///
//   /// Only performs save if the user is logged in.
//   Future<void> _persist(List<DashboardTileConfig> tiles) async {
//     _persistDebounceTimer?.cancel();
//     _persistDebounceTimer = Timer(const Duration(milliseconds: 500), () async {
//       final isLoggedIn = ref.read(authUserStateProvider) != null;
//       if (!isLoggedIn) return;

//       final currentSettings = ref.read(userSettingsStateProvider).value;
//       if (currentSettings == null) return;

//       final updatedSettings = currentSettings.copyWith(
//         dashboardTileConfigs: tiles,
//       );

//       await ref
//           .read(userSettingsRepositoryProvider)
//           .updateUserSettings(updatedSettings);
//     });
//   }

//   /// Resets the dashboard to the default configuration
//   Future<void> resetToDefault() async {
//     state = const AsyncLoading();
//     try {
//       await _persist(DashboardConstants.defaultDashboardConfig);
//       state = AsyncData(DashboardConstants.defaultDashboardConfig);
//     } catch (e, stack) {
//       state = AsyncError(e, stack);
//     }
//   }
// }

/// Dashboard Edit State
///
// /// Determines if the dashboard is in edit mode.
// @riverpod
// class DashboardEditState extends _$DashboardEditState {
//   @override
//   bool build() => false;

//   void toggleEditMode() {
//     state = !state;
//   }

//   void setEditMode(bool value) {
//     state = value;
//   }
// }

// /// Dashboard Columns
// ///
// /// Manages the number of columns in the dashboard.
// @riverpod
// class DashboardColumns extends _$DashboardColumns {
//   @override
//   int build() => DashboardUIConstants.defaultColumns;

//   void setColumns(int value) {
//     state = value;
//   }
// }
