part of 'floating_card_body.dart';

class _MobileTabBar extends StatelessWidget {
  const _MobileTabBar({
    required this.tabController,
    required this.navigationGroups,
    required this.showNotesButton,
    required this.showShareButton,
    required this.shareEntityId,
    required this.floatingWindowType,
    required this.noteEntityId,
    required this.noteTableType,
    required this.floatingWindowId,
    required this.navigatorKey,
    required this.isFirstRun,
    required this.entityNotesHint,
    required this.additionalEntityData,
    required this.initialNoteId,
    required this.initialNoteParentId,
    required this.isMobileView,
  });

  final TabController tabController;
  final List<CardNavigationGroup> navigationGroups;
  final bool showNotesButton;
  final bool showShareButton;
  final int? shareEntityId;
  final String floatingWindowType;
  final int? noteEntityId;
  final String? noteTableType;
  final String floatingWindowId;
  final GlobalKey<NavigatorState> navigatorKey;
  final bool isFirstRun;
  final String? entityNotesHint;
  final AdditionalEntityData? additionalEntityData;
  final int? initialNoteId;
  final int? initialNoteParentId;
  final bool isMobileView;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final tabs = <Widget>[];

    // Add navigation items
    for (final group in navigationGroups) {
      for (final item in group.items) {
        tabs.add(
          Tab(
            icon: Icon(item.icon),
          ),
        );
      }
    }

    return Material(
      color: theme.generalColors.background,
      child: SizedBox(
        height: kToolbarHeight,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: theme.generalColors.divider,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobileView ? AppSpace.m : AppSpace.l,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: tabController,
                    tabs: tabs,
                    isScrollable: true,
                    indicatorColor: theme.generalColors.primary,
                    labelColor: theme.generalColors.primary,
                    unselectedLabelColor: theme.generalColors.divider,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 16),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    padding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    dividerColor: Colors.transparent,
                    tabAlignment: TabAlignment.start,
                  ),
                ),
                Row(
                  children: [
                    // Share button - exact desktop implementation
                    if (showShareButton &&
                        (shareEntityId ?? noteEntityId) != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: _MobileShareButton(
                          entityId: shareEntityId ?? noteEntityId!,
                          floatingWindowType: floatingWindowType,
                        ),
                      ),
                    // Notes button - exact desktop implementation with badge
                    if (showNotesButton)
                      _MobileNotesButton(
                        entityId: noteEntityId!,
                        tableType: noteTableType!,
                        floatingWindowId: floatingWindowId,
                        navigatorKey: navigatorKey,
                        isFirstRun: isFirstRun,
                        entityNotesHint: entityNotesHint,
                        additionalEntityData: additionalEntityData,
                        initialNoteId: initialNoteId,
                        initialNoteParentId: initialNoteParentId,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
