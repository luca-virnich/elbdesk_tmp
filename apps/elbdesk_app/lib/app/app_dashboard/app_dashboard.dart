import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/assigned_to_me_tile.dart';
import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/entity_note_notification_grid_tile.dart';
import 'package:elbdesk_app/app/app_dashboard/widgets/tiles/recent_entity_tile.dart';
import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:project_core/project_core.dart';

class AppDashboard extends StatelessWidget {
  const AppDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final isSingleRowLayout = screenWidth < 1000;
    final isMobileLayout =
        screenWidth < WindowManagerInitialization.instance.mobileBreakpoint;
    return Padding(
      padding: EdgeInsets.only(
        right: isMobileLayout ? 0 : 16,
        left: isMobileLayout ? 0 : 16,
        top: isMobileLayout ? 0 : 16,
        bottom: isMobileLayout ? 0 : 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobileLayout) const _Greeting(),
          // const _AssignmendStats(),
          const SizedBox(height: UiConstants.defaultPadding),
          Expanded(
            child: Builder(
              builder: (context) {
                if (isSingleRowLayout) {
                  return Column(
                    children: [
                      const Expanded(
                        child: AssignedToMeTile(),
                      ),
                      const SizedBox(height: UiConstants.defaultPadding),
                      const Expanded(
                        child: EntityNoteNotificationGridTile(),
                      ),
                      if (isMobileLayout)
                        const SizedBox(height: UiConstants.defaultPadding),
                      // Expanded(
                      //   child: RecentEntityGridTile(),
                      // ),
                    ],
                  );
                }
                // if (screenWidth < 1600) {
                //   return const Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Expanded(
                //         flex: 1,
                //         child: AssignedToMeTile(),
                //       ),
                //       SizedBox(width: UiConstants.defaultPadding),
                //       Expanded(
                //         flex: 1,
                //         child: Column(
                //           children: [
                //             Expanded(
                //               child: EntityNoteNotificationGridTile(),
                //             ),
                //             SizedBox(height: UiConstants.defaultPadding),
                //             Expanded(
                //               child: RecentEntityGridTile(),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ],
                //   );
                // }

                // Wide layout: All 3 children side by side
                return const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AssignedToMeTile(),
                    ),
                    SizedBox(width: UiConstants.defaultPadding),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: EntityNoteNotificationGridTile(),
                          ),
                          SizedBox(height: UiConstants.defaultPadding),
                          Expanded(
                            flex: 2,
                            child: RecentEntityGridTile(),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AssignmendStats extends ConsumerWidget {
  const _AssignmendStats();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUserId = ref.watch(authUserStateProvider)?.id;
    if (myUserId == null || myUserId == 1) {
      return const SizedBox.shrink();
    }
    final lightUserId =
        ref.watch(fetchLocalLightUserByUserInfoIdProvider(myUserId));

    final entityAssignments =
        ref.watch(watchEntityAssignmentsProvider(lightUserId.lightUserId));

    return SizedBox(
      width: 400,
      child: AppCardTile(
        title: '',
        onTitleTap: () {},
        content: entityAssignments.fastWhen(
          data: (assignments) {
            final total = assignments.length;
            final soiPrepareArtworkAssignments = assignments
                .where((e) => e.tableType == TableType.soiPrepareArtwork.name)
                .toList();
            final salesOrderAssignments = assignments
                .where((e) => e.tableType == TableType.salesOrder.name)
                .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                _SoiPrepareArtworkGraph(
                  assignments: soiPrepareArtworkAssignments,
                  total: total,
                ),
                const SizedBox(height: UiConstants.defaultPadding),
                _SalesOrderGraph(
                  assignments: salesOrderAssignments,
                  total: total,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _EntityAssignmentGraph extends StatelessWidget {
  const _EntityAssignmentGraph({
    required this.assignments,
    required this.total,
    required this.getStatusColor,
    required this.title,
    this.fixedWidth,
    this.stats,
  });

  final List<EntityAssignment> assignments;
  final int total;
  final Color Function(EntityAssignment) getStatusColor;
  final double? fixedWidth;
  final String title;
  final String? stats;

  @override
  Widget build(BuildContext context) {
    if (assignments.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(title),
              if (stats != null)
                AppText(
                  stats!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Container(
            height: 10,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      );
    }

    // Group assignments by status color
    final groupedByColor = <Color, List<EntityAssignment>>{};
    for (final assignment in assignments) {
      final color = getStatusColor(assignment);
      if (!groupedByColor.containsKey(color)) {
        groupedByColor[color] = [];
      }
      groupedByColor[color]!.add(assignment);
    }

    // Sort colors for consistent display
    final sortedColors = groupedByColor.keys.toList()
      ..sort((a, b) => a.value.compareTo(b.value));

    // Calculate the width percentage based on assignments vs total
    final widthPercentage = total > 0 ? assignments.length / total : 1.0;

    // Calculate width based on fixed width or screen width
    final availableWidth =
        fixedWidth ?? MediaQuery.of(context).size.width * 0.4;
    final graphWidth = availableWidth * widthPercentage;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(title),
            if (stats != null)
              AppText(
                stats!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              // Container with colored segments representing assignments
              SizedBox(
                width: graphWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: sortedColors.map((color) {
                      final count = groupedByColor[color]!.length;
                      final segmentWidth = count / assignments.length;

                      return Flexible(
                        flex: (segmentWidth * 1000)
                            .round(), // Convert to integer flex
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              // Empty space for the remaining portion
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}

class _SalesOrderGraph extends StatelessWidget {
  const _SalesOrderGraph({
    required this.assignments,
    required this.total,
  });
  final List<EntityAssignment> assignments;
  final int total;

  @override
  Widget build(BuildContext context) {
    final salesL10n = context.salesL10n;
    return _EntityAssignmentGraph(
      title: salesL10n.sales_order_plural,
      assignments: assignments,
      total: total,
      fixedWidth: 400,
      getStatusColor: (assignment) {
        final additionalData = SalesOrderAdditionalData.fromJsonString(
          assignment.additionalData,
        );
        final status = Parser.enumFromString(
          SalesOrderStatus.values,
          additionalData.status,
        );
        return status!.color;
      },
    );
  }
}

class _SoiPrepareArtworkGraph extends StatelessWidget {
  const _SoiPrepareArtworkGraph({
    required this.assignments,
    required this.total,
  });
  final List<EntityAssignment> assignments;
  final int total;

  @override
  Widget build(BuildContext context) {
    return _EntityAssignmentGraph(
      title: 'Artwork aufbereiten',
      stats: '${assignments.length} / $total',
      assignments: assignments,
      total: total,
      getStatusColor: (assignment) {
        final additionalData = SoiPrepareArtworkAdditionalData.fromJsonString(
          assignment.additionalData,
        );
        final status = Parser.enumFromString(
          SalesOrderItemStatus.values,
          additionalData.status,
        );
        return status!.color;
      },
    );
  }
}

/// Overview Screen
///
/// This screen is shown on entry when the app is started
// class DashboardScreen1 extends HookConsumerWidget {
//   /// Constructor
//   const DashboardScreen1({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final scrollController = useScrollController();
//     final tileSelectorVisible = useState<bool>(false);
//     // Track if content is scrolled
//     final showShadow = useState(false);

//     // Add scroll listener to update shadow state
//     useEffect(
//       () {
//         void scrollListener() {
//           showShadow.value = scrollController.offset > 0;
//         }

//         scrollController.addListener(scrollListener);
//         return () => scrollController.removeListener(scrollListener);
//       },
//       [scrollController],
//     );

//     return Stack(
//       children: [
//         _DashboardContent(
//           scrollController: scrollController,
//           tileSelectorVisible: tileSelectorVisible,
//           showShadow: showShadow,
//         ),
//         if (tileSelectorVisible.value)
//           GestureDetector(
//             behavior: HitTestBehavior.translucent,
//             onTapDown: (_) => tileSelectorVisible.value = false,
//           ),
//         AnimatedSlide(
//           duration: AnimationConstants.defaultDuration,
//           curve: AnimationConstants.defaultCurve,
//           offset: Offset(tileSelectorVisible.value ? 0 : 1, 0),
//           child: Align(
//             alignment: Alignment.centerRight,
//             child: TileSelectorPanel(
//               onClose: () => tileSelectorVisible.value = false,
//               onTileAdd: (tileType) async {
//                 final dashboardTiles = ref.read(dashboardStateProvider);
//                 if (dashboardTiles.value == null) return;

//                 // Wait for the state update to complete
//                 await ref
//                     .read(dashboardStateProvider.notifier)
//                     .addTile(tileType);

//                 // Close the panel after the state update is complete
//                 tileSelectorVisible.value = false;
//               },
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _DashboardContent extends HookConsumerWidget {
//   const _DashboardContent({
//     required this.scrollController,
//     required this.tileSelectorVisible,
//     required this.showShadow,
//   });

//   final ScrollController scrollController;
//   final ValueNotifier<bool> tileSelectorVisible;
//   final ValueNotifier<bool> showShadow;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final generalColors = context.appTheme.generalColors;
//     final borderRadiuses = context.appTheme.borderRadiuses;
//     final columns = ref.watch(dashboardColumnsProvider);
//     return DefaultDashboardChildBox(
//       ignoreOuterPadding: true,
//       child: Stack(
//         children: [
//           Column(
//             children: [
//               const SizedBox(height: 55),
//               Expanded(
//                 child: AppScrollbar(
//                   controller: scrollController,
//                   child: SingleChildScrollView(
//                     controller: scrollController,
//                     physics: const ClampingScrollPhysics(),
//                     child: DashboardGrid(columns: columns),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Header container
//           Container(
//             decoration: BoxDecoration(
//               color: generalColors.background,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(borderRadiuses.m),
//                 bottomLeft: Radius.circular(borderRadiuses.m),
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(AppSpace.xxs),
//               child: HeaderRow(
//                 onAddPressed: () => tileSelectorVisible.value = true,
//               ),
//             ),
//           ),
//           // Shadow overlay
//           Positioned(
//             top: 55, // Align with header height
//             left: 0,
//             right: 0,
//             child: AnimatedOpacity(
//               duration: AnimationConstants.staggeredDelay,
//               opacity: showShadow.value ? 1 : 0,
//               child: Container(
//                 height: AppSpace.m,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       generalColors.background.withAppOpacity(1),
//                       generalColors.background.withAppOpacity(0),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/// Dashboard Wrapper

/// Displays a time-sensitive greeting to the user
// class HeaderRow extends HookConsumerWidget {
//   /// Constructor with callback for Add button action.
//   const HeaderRow({required this.onAddPressed, super.key});

//   /// Callback invoked when the Add button is pressed.
//   final VoidCallback onAddPressed;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final l10n = context.l10n;

//     final isEditMode = ref.watch(dashboardEditStateProvider);

//     final isSingleColumn = ref.watch(dashboardColumnsProvider) == 1;

//     return Padding(
//       padding: const EdgeInsets.fromLTRB(
//         UiConstants.defaultPadding,
//         UiConstants.defaultPadding,
//         UiConstants.defaultPadding,
//         0,
//       ),
//       child: Row(
//         children: [
//           const _Greeting(),
//           const Spacer(),
//           // Only show add button in edit mode
//           // and if not in single column mode
//           if (isEditMode && !isSingleColumn)
//             AppButton.secondary(
//               iconData: AppIcons.add,
//               tooltip: l10n.gen_add,
//               onPressed: onAddPressed,
//             ),
//           const SizedBox(width: AppSpace.xs),
//           // dont allow edit mode in single column mode
//           if (!isSingleColumn)
//             AppButton.secondary(
//               iconData: isEditMode ? AppIcons.check : AppIcons.edit,
//               tooltip: isEditMode ? l10n.gen_okay : l10n.gen_edit,
//               onPressed: () => ref
//                   .read(dashboardEditStateProvider.notifier)
//                   .toggleEditMode(),
//             ),
//         ],
//       ),
//     );
//   }

//   /// Returns an appropriate greeting based on the current time.
// }

class _Greeting extends HookConsumerWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverTime = ref.watch(watchTimeProvider).value;
    if (serverTime == null) return const SizedBox();
    final currentHour = serverTime.hour;
    final l10n = context.l10n;
    final firstName =
        ref.watch(currentAppUserStateProvider).requireValue.general.firstName;

    // final now = ref.watch(currentDeviceTimeProvider);

    // ref.listen(currentServerTimeProvider, (previous, next) {
    //   // currentHour.value = next.hour;
    // });

    final greeting = _getGreeting(l10n, currentHour);
    final style = context.appTheme.textStyles.h1;

    return AppText('$greeting, $firstName', style: style);
  }

  String _getGreeting(ElbCoreLocalizations l10n, int hour) {
    if (hour < 12) {
      return l10n.greeting_good_morning;
    } else if (hour < 17) {
      return l10n.greeting_good_afternoon;
    } else {
      return l10n.greeting_good_evening;
    }
  }
}
