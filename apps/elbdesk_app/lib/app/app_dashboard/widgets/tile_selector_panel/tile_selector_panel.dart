// import 'package:elbdesk_client/elbdesk_client.dart';
// import 'package:elbdesk_core/elbdesk_core.dart';
// import 'package:elbdesk_ui/elbdesk_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// /// TileSelectorPanel
// ///
// /// A side panel that slides in from the right and displays tile previews
// /// with an add button to insert a new tile into the dashboard grid.
// class TileSelectorPanel extends HookConsumerWidget {
//   /// Constructor
//   const TileSelectorPanel({
//     required this.onClose,
//     required this.onTileAdd,
//     super.key,
//   });

//   /// Callback to close the panel.
//   final VoidCallback onClose;

//   /// Callback when a tile is added from the panel.
//   /// Provides the selected tile type.
//   final void Function(DashboardTileType) onTileAdd;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;
//     final generalColors = context.appTheme.generalColors;
//     final borderRadiuses = context.appTheme.borderRadiuses;

//     final isResetLoading = useState(false);

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(0, AppSpace.s, 0, AppSpace.s),
//       child: Container(
//         constraints: const BoxConstraints(
//           minWidth: 300,
//           maxWidth: 400,
//         ),
//         padding: const EdgeInsets.all(UiConstants.defaultPadding),
//         decoration: BoxDecoration(
//           color: generalColors.primarySurface,
//           borderRadius: BorderRadius.all(Radius.circular(borderRadiuses.m)),
//           border: Border.all(
//             width: AppSpace.xxs,
//             color: generalColors.primarySurfaceBorder,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withAppOpacity(0.25),
//               offset: const Offset(0, 2),
//               blurRadius: 8,
//               spreadRadius: 0,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header row with close button.
//             Row(
//               children: [
//                 AppText(
//                   l10n.dashboard_add_tile,
//                   style: context.appTheme.textStyles.h2,
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   icon: const ElbIcon(AppIcons.close),
//                   tooltip: l10n.gen_close,
//                   onPressed: onClose,
//                 ),
//               ],
//             ),
//             const SizedBox(height: UiConstants.defaultPadding),
//             _RecentItemsDummy(onTileAdd: onTileAdd),
//             const SizedBox(height: UiConstants.defaultPadding),
//             _AssignedToMeDummy(onTileAdd: onTileAdd),
//             const SizedBox(height: UiConstants.defaultPadding),
//             // _CustomerTileDummy(onTileAdd: onTileAdd),
//             const Spacer(),

//             // Reset Dashboard Button
//             Center(
//               child: AppButton.secondary(
//                 label: l10n.dashboard_reset_dashboard,
//                 icon: const ElbIcon(AppIcons.reset),
//                 isLoading: isResetLoading.value,
//                 onPressed: isResetLoading.value
//                     ? null
//                     : () async {
//                         // isResetLoading.value = true;
//                         // if (context.mounted) {
//                         //   final result = await AppDialog.show<bool>(
//                         //     context: context,
//                         //     isDismissible: true,
//                         //     child: AppDialogBody(
//                         //       onCancel: () =>
//                         //           Navigator.of(context, rootNavigator: true)
//                         //               .pop(false),
//                         //       titleText: l10n.dashboard_reset_tiles_question,
//                         //       actions: [
//                         //         AppButton.text(
//                         //           label: context.l10n.gen_cancel,
//                         //           onPressed: () => Navigator.of(
//                         //             context,
//                         //             rootNavigator: true,
//                         //           ).pop(false),
//                         //         ),
//                         //         AppButton.primary(
//                         //           label: l10n.gen_reset,
//                         //           onPressed: () => Navigator.of(
//                         //             context,
//                         //             rootNavigator: true,
//                         //           ).pop(true),
//                         //         ),
//                         //       ],
//                         //       child: AppText(
//                         //         l10n.dashboard_reset_tiles_warning,
//                         //       ),
//                         //     ),
//                         //   );
//                         //   if (result ?? false) {
//                         //     await ref
//                         //         .read(dashboardStateProvider.notifier)
//                         //         .resetToDefault();
//                         //     onClose();
//                         //   }
//                         // }
//                         // if (context.mounted) {
//                         //   isResetLoading.value = false;
//                         // }
//                       },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _RecentItemsDummy extends StatelessWidget {
//   const _RecentItemsDummy({
//     required this.onTileAdd,
//   });

//   final void Function(DashboardTileType) onTileAdd;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     final generalColors = context.appTheme.generalColors;
//     final borderRadiuses = context.appTheme.borderRadiuses;
//     return _TileSelectorItem(
//       title: l10n.dashboard_recent_items,
//       icon: AppIcons.recentItems,
//       onAdd: () => onTileAdd(DashboardTileType.recent_items),
//       previewBuilder: (context) => Column(
//         children: List.generate(
//           3,
//           (index) => Padding(
//             padding: const EdgeInsets.symmetric(vertical: AppSpace.xs),
//             child: Row(
//               children: [
//                 const ElbIcon(
//                   AppIcons.departmentCode,
//                   size: AppIconSize.s,
//                 ),
//                 const SizedBox(width: AppSpace.s),
//                 Expanded(
//                   child: Container(
//                     height: AppSpace.s,
//                     decoration: BoxDecoration(
//                       color: generalColors.primarySurface,
//                       borderRadius: BorderRadius.circular(borderRadiuses.m),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _AssignedToMeDummy extends StatelessWidget {
//   const _AssignedToMeDummy({
//     required this.onTileAdd,
//   });

//   final void Function(DashboardTileType) onTileAdd;

//   @override
//   Widget build(BuildContext context) {
//     final l10n = context.l10n;
//     final statusColors = context.appTheme.statusColors;
//     final borderRadiuses = context.appTheme.borderRadiuses;
//     return _TileSelectorItem(
//       title: l10n.dashboard_assigned_to_me,
//       icon: AppIcons.assignedToMe,
//       onAdd: () => onTileAdd(DashboardTileType.assigned),
//       previewBuilder: (context) => Column(
//         children: List.generate(
//           3,
//           (index) => Padding(
//             padding: const EdgeInsets.symmetric(vertical: AppSpace.xs),
//             child: Row(
//               children: [
//                 Container(
//                   width: AppSpace.s,
//                   height: AppSpace.s,
//                   decoration: BoxDecoration(
//                     color: [
//                       statusColors.info,
//                       statusColors.warning,
//                       statusColors.error,
//                     ][index],
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//                 const SizedBox(width: AppSpace.s),
//                 Expanded(
//                   child: Container(
//                     height: AppSpace.s,
//                     decoration: BoxDecoration(
//                       color: context.appTheme.generalColors.primarySurface,
//                       borderRadius: BorderRadius.circular(borderRadiuses.m),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class _CustomerTileDummy extends StatelessWidget {
// //   const _CustomerTileDummy({
// //     required this.onTileAdd,
// //   });

// //   final void Function(DashboardTileType) onTileAdd;

// //   @override
// //   Widget build(BuildContext context) {
// //     final l10n = context.l10n;
// //     final generalColors = context.appTheme.generalColors;
// //     final borderRadiuses = context.appTheme.borderRadiuses;
// //     return _TileSelectorItem(
// //       title: l10n.crm_customer_singular,
// //       icon: AppIcons.customer,
// //       onAdd: () => onTileAdd(DashboardTileType.customer),
// //       previewBuilder: (context) => Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: List.generate(
// //           2,
// //           (index) => Padding(
// //             padding: const EdgeInsets.symmetric(vertical: AppSpace.xs),
// //             child: Container(
// //               height: AppSpace.s,
// //               width: double.infinity,
// //               decoration: BoxDecoration(
// //                 color: generalColors.primarySurface,
// //                 borderRadius: BorderRadius.circular(borderRadiuses.m),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// /// Widget displaying a tile preview with an add button.
// class _TileSelectorItem extends StatefulWidget {
//   /// Constructor
//   const _TileSelectorItem({
//     required this.title,
//     required this.onAdd,
//     required this.icon,
//     required this.previewBuilder,
//   });

//   /// Title text of the tile preview
//   final String title;

//   /// Icon to display in the header
//   final IconData icon;

//   /// Callback when the tile is selected
//   final VoidCallback onAdd;

//   /// Builder for the preview content
//   final Widget Function(BuildContext) previewBuilder;

//   @override
//   State<_TileSelectorItem> createState() => _TileSelectorItemState();
// }

// class _TileSelectorItemState extends State<_TileSelectorItem> {
//   // Track hover state locally
//   bool _isHovered = false;

//   @override
//   Widget build(BuildContext context) {
//     final generalColors = context.appTheme.generalColors;
//     final borderRadiuses = context.appTheme.borderRadiuses;
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: AnimatedScale(
//         scale: _isHovered ? 1.05 : 1.0,
//         duration: AnimationConstants.shortDuration,
//         child: InkWell(
//           onTap: widget.onAdd,
//           onHover: (hovering) => setState(() => _isHovered = hovering),
//           borderRadius: BorderRadius.circular(borderRadiuses.m),
//           child: Container(
//             decoration: BoxDecoration(
//               color: generalColors.background,
//               borderRadius: BorderRadius.circular(borderRadiuses.m),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(AppSpace.xs),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header
//                   Padding(
//                     padding: const EdgeInsets.all(AppSpace.s),
//                     child: Row(
//                       children: [
//                         ElbIcon(widget.icon, size: AppIconSize.m),
//                         const SizedBox(width: AppSpace.s),
//                         Expanded(
//                           child: AppText(
//                             widget.title,
//                             style: context.appTheme.textStyles.defaultTextLight,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   // Preview content
//                   Padding(
//                     padding: const EdgeInsets.all(AppSpace.s),
//                     child: widget.previewBuilder(context),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
