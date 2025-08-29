import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/card_components/floating_card_body/floating_card_body_constants.dart';
import 'package:elbdesk_core/src/features/entity_notes/entity_note_core_repository.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

part 'constraint_blocker.dart';
part 'mobile_notes_button.dart';
part 'mobile_share_button.dart';
part 'mobile_tab_bar.dart';
part 'unified_content.dart';

/// Card Body
///
/// A widget that usually represents the body of a floating window.
class FloatingCardBody extends HookConsumerWidget {
  /// Creates an [FloatingCardBody].
  ///
  /// Either [children] or [childrenBuilder] must be provided, but not both.
  /// The `navigatorKey` parameter must not be null.
  const FloatingCardBody({
    required this.navigatorKey,
    required this.floatingWindowId,
    required this.isFirstRun,
    required this.floatingWindowType,
    this.children,
    @Deprecated('Use [children] instead.') this.childrenBuilder,
    this.shareEntityId,
    this.noteEntityId,
    this.noteTableType,
    this.isLoading = false,
    this.initialNavigationIndexNotifier,
    super.key,
    this.footer,
    this.navigationGroups = const [],
    this.formKey,
    this.entityNotesHint,
    this.additionalEntityData,
    this.showNotes = true,
    this.initialNoteId,
    this.initialNoteParentId,
    this.header,
    this.showShareButton = false,
  })  : assert(
          children != null || childrenBuilder != null,
          'Either children or childrenBuilder must be provided',
        ),
        assert(
          children == null || childrenBuilder == null,
          'Cannot provide both children and childrenBuilder',
        );

  /// The footer widget to display at the bottom of the floating window.
  final Widget? footer;

  /// The header widget to display at the top of the floating window.
  final Widget? header;

  final String? entityNotesHint;

  final List<CardNavigationGroup> navigationGroups;

  /// The children to display in the card body
  final List<CardBodyItem>? children;

  /// The builder function that creates the body content based on constraints
  @Deprecated('Use [children] instead.')
  final List<CardBodyItem> Function(
    BuildContext context,
    BoxConstraints constraints,
  )? childrenBuilder;

  final ValueNotifier<int>? initialNavigationIndexNotifier;
  final bool? isLoading;
  final GlobalKey<FormState>? formKey;
  final int? noteEntityId;
  final String? noteTableType;
  final String floatingWindowId;
  final AdditionalEntityData? additionalEntityData;
  final GlobalKey<NavigatorState> navigatorKey;
  final int? initialNoteId;
  final int? initialNoteParentId;
  final bool showNotes;
  final bool isFirstRun;
  final String floatingWindowType;
  final bool showShareButton;
  final int? shareEntityId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use ValueNotifier for better performance with selective rebuilds
    final selectedIndex = useValueNotifier<int>(
      initialNavigationIndexNotifier?.value ?? 0,
    );

    final footerHeight = useValueNotifier<double>(0);

    // Sync with external notifier if provided
    useEffect(
      () {
        if (initialNavigationIndexNotifier != null) {
          void listener() {
            selectedIndex.value = initialNavigationIndexNotifier!.value;
          }

          initialNavigationIndexNotifier!.addListener(listener);
          return () => initialNavigationIndexNotifier!.removeListener(listener);
        }
        return null;
      },
      [initialNavigationIndexNotifier],
    );

    // Listen to internal changes and update external notifier
    // Note: We don't use useValueListenable here to avoid rebuilding the
    // entire widget
    useEffect(
      () {
        if (initialNavigationIndexNotifier != null) {
          void updateExternal() {
            if (initialNavigationIndexNotifier!.value != selectedIndex.value) {
              initialNavigationIndexNotifier!.value = selectedIndex.value;
            }
          }

          selectedIndex.addListener(updateExternal);
          return () => selectedIndex.removeListener(updateExternal);
        }
        return null;
      },
      [selectedIndex],
    );

    // Cache computed values
    final hasNavigation = navigationGroups.isNotEmpty;
    final hasNotes = showNotes && noteEntityId != null && noteTableType != null;

    // Use LayoutBuilder to detect viewport size
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobileView = FloatingCardBodyConstants.isMobileView(width);
        final isDesktopView = FloatingCardBodyConstants.isDesktopView(width);

        // Responsive navigation logic
        // Mobile: tabs at top, notes in bottom sheet
        // Desktop: side navigation, notes in side panel
        final showSideNavigation = hasNavigation && isDesktopView;
        final showTabs = hasNavigation && isMobileView;
        final showNotesInSidePanel = hasNotes && isDesktopView;
        final showNotesButton = hasNotes;

        return Shortcuts(
          shortcuts: {
            if (!kIsWeb) entityCardNavUpMeta: const EntityCardNavUpIntent(),
            if (!kIsWeb) entityCardNavDownMeta: const EntityCardNavDownIntent(),
            entityCardNavUpControl: const EntityCardNavUpIntent(),
            entityCardNavDownControl: const EntityCardNavDownIntent(),
          },
          child: Actions(
            actions: {
              EntityCardNavUpIntent: CallbackAction<EntityCardNavUpIntent>(
                onInvoke: (intent) {
                  if (selectedIndex.value > 0) {
                    selectedIndex.value--;
                  }
                  return;
                },
              ),
              EntityCardNavDownIntent: CallbackAction<EntityCardNavDownIntent>(
                onInvoke: (intent) {
                  // The actual bounds checking happens in the
                  // _MobileTabBarWrapper
                  // which knows the item count from children
                  selectedIndex.value++;
                  return;
                },
              ),
            },
            child: Focus(
              autofocus: true,
              skipTraversal: true,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Mobile tab bar
                    if (showTabs)
                      _MobileTabBarWrapper(
                        children: children,
                        childrenBuilder: childrenBuilder,
                        selectedIndex: selectedIndex,
                        navigationGroups: navigationGroups,
                        showNotesButton: showNotesButton,
                        showShareButton: showShareButton,
                        shareEntityId: shareEntityId,
                        floatingWindowType: floatingWindowType,
                        noteEntityId: noteEntityId,
                        noteTableType: noteTableType,
                        floatingWindowId: floatingWindowId,
                        navigatorKey: navigatorKey,
                        isFirstRun: isFirstRun,
                        entityNotesHint: entityNotesHint,
                        additionalEntityData: additionalEntityData,
                        initialNoteId: initialNoteId,
                        initialNoteParentId: initialNoteParentId,
                        isMobileView: isMobileView,
                        constraints: constraints,
                      ),
                    Expanded(
                      child: isLoading ?? false
                          ? const Center(
                              child: AppLoadingIndicator(),
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      // Show header on desktop and tablet,
                                      // but not on mobile with tabs
                                      if (header != null && !showTabs) header!,
                                      Expanded(
                                        child: _UnifiedContent(
                                          children: children,
                                          childrenBuilder: childrenBuilder,
                                          constraints: constraints,
                                          selectedIndex: selectedIndex,
                                          showSideNavigation:
                                              showSideNavigation,
                                          showNotesInSidePanel:
                                              showNotesInSidePanel,
                                          floatingWindowId: floatingWindowId,
                                          notesPanelWidth:
                                              FloatingCardBodyConstants
                                                  .notesPanelWidth,
                                          navigationExpandedWidth:
                                              FloatingCardBodyConstants
                                                  .navigationExpandedWidth,
                                          navigationCollapsedWidth:
                                              FloatingCardBodyConstants
                                                  .navigationCollapsedWidth,
                                          navigationDividerPadding:
                                              FloatingCardBodyConstants
                                                  .navigationDividerPadding,
                                        ),
                                      ),
                                      Consumer(
                                        builder: (context, ref, child) {
                                          final keyboardHeight = ref.watch(
                                            keyboardHeightProvider(false),
                                          );
                                          return ValueListenableBuilder<double>(
                                            valueListenable: footerHeight,
                                            builder: (context, value, child) {
                                              return SizedBox(
                                                height: (keyboardHeight - value)
                                                    .clamp(0, double.infinity),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      if (footer != null) ...[
                                        const AppDivider(),
                                        ElbMeasureSize(
                                          onChange: (size) {
                                            footerHeight.value = size.height;
                                          },
                                          child: footer!,
                                        ),
                                      ],
                                    ],
                                  ),
                                ),
                                if (showNotesInSidePanel)
                                  EntityNotesView(
                                    isFirstRun: isFirstRun,
                                    initialNoteId: initialNoteId,
                                    initialNoteParentId: initialNoteParentId,
                                    entityId: noteEntityId!,
                                    tableType: noteTableType!,
                                    floatingWindowId: floatingWindowId,
                                    hint: entityNotesHint,
                                    additionalEntityData: additionalEntityData,
                                    navigatorKey: navigatorKey,
                                  ),
                                if (showSideNavigation) ...[
                                  const Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: AppDivider.vertical(),
                                  ),
                                  ValueListenableBuilder<int>(
                                    valueListenable: selectedIndex,
                                    builder: (context, currentIndex, child) {
                                      return CardNavigation(
                                        shareEntityId: shareEntityId,
                                        floatingWindowType: floatingWindowType,
                                        showShareButton: showShareButton,
                                        entityId: noteEntityId,
                                        tableType: noteTableType,
                                        floatingWindowId: floatingWindowId,
                                        hasEntityNotes: showNotesButton,
                                        groups: navigationGroups,
                                        selectedIndex: currentIndex,
                                        onSelectedIndexChanged: (index) {
                                          selectedIndex.value = index;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CardBodyItem {
  CardBodyItem({
    this.child,
    this.builder,
    this.keepAlive = true,
    this.loadLazy = true,
  }) : assert(
          child != null || builder != null,
          'Either child or builder must be provided',
        );

  final Widget Function(BuildContext context, BoxConstraints constraints)?
      builder;
  final Widget? child;
  final bool loadLazy;
  final bool keepAlive;

  Widget build(BuildContext context, BoxConstraints constraints) {
    if (builder != null) {
      return builder!(context, constraints);
    }
    return child!;
  }
}

// Wrapper widget to handle tab controller with dynamic item count
class _MobileTabBarWrapper extends HookWidget {
  const _MobileTabBarWrapper({
    required this.selectedIndex,
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
    required this.constraints,
    this.children,
    this.childrenBuilder,
  });

  final List<CardBodyItem>? children;
  final List<CardBodyItem> Function(
    BuildContext context,
    BoxConstraints constraints,
  )? childrenBuilder;
  final ValueNotifier<int> selectedIndex;
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
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    // Get children either from direct children or builder
    final actualChildren = children ?? childrenBuilder!(context, constraints);
    final navItemsLength = actualChildren.length;

    final tabController = useTabController(
      initialLength: navItemsLength,
      initialIndex: selectedIndex.value,
    );

    // Sync tab controller with selected index
    useEffect(
      () {
        void listener() {
          if (selectedIndex.value < navItemsLength) {
            tabController.index = selectedIndex.value;
          }
        }

        selectedIndex.addListener(listener);
        return () => selectedIndex.removeListener(listener);
      },
      [tabController, navItemsLength],
    );

    // Sync selected index with tab controller
    useEffect(
      () {
        void listener() {
          if (tabController.indexIsChanging ||
              tabController.index != selectedIndex.value) {
            selectedIndex.value = tabController.index;
          }
        }

        tabController.addListener(listener);
        return () => tabController.removeListener(listener);
      },
      [tabController],
    );

    return _MobileTabBar(
      tabController: tabController,
      navigationGroups: navigationGroups,
      showNotesButton: showNotesButton,
      showShareButton: showShareButton,
      shareEntityId: shareEntityId,
      floatingWindowType: floatingWindowType,
      noteEntityId: noteEntityId,
      noteTableType: noteTableType,
      floatingWindowId: floatingWindowId,
      navigatorKey: navigatorKey,
      isFirstRun: isFirstRun,
      entityNotesHint: entityNotesHint,
      additionalEntityData: additionalEntityData,
      initialNoteId: initialNoteId,
      initialNoteParentId: initialNoteParentId,
      isMobileView: isMobileView,
    );
  }
}
