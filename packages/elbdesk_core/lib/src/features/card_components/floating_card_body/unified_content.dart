part of 'floating_card_body.dart';

class _UnifiedContent extends ConsumerWidget {
  const _UnifiedContent({
    required this.selectedIndex,
    required this.showSideNavigation,
    required this.showNotesInSidePanel,
    required this.floatingWindowId,
    required this.notesPanelWidth,
    required this.navigationExpandedWidth,
    required this.navigationCollapsedWidth,
    required this.navigationDividerPadding,
    this.children,
    this.childrenBuilder,
    this.constraints,
  });

  final List<CardBodyItem>? children;
  final List<CardBodyItem> Function(
    BuildContext context,
    BoxConstraints constraints,
  )? childrenBuilder;
  final BoxConstraints? constraints;
  final ValueNotifier<int> selectedIndex;
  final bool showSideNavigation;
  final bool showNotesInSidePanel;
  final String floatingWindowId;
  final double notesPanelWidth;
  final double navigationExpandedWidth;
  final double navigationCollapsedWidth;
  final double navigationDividerPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Handle both old API (childrenBuilder) and new API (children)
    if (childrenBuilder != null) {
      // Old API: Use LayoutBuilder to get constraints and call builder
      return LayoutBuilder(
        builder: (context, layoutConstraints) {
          final actualChildren = childrenBuilder!(context, layoutConstraints);
          return _buildContent(context, actualChildren);
        },
      );
    } else {
      // New API: Use provided children directly
      return _buildContent(context, children!);
    }
  }

  Widget _buildContent(
    BuildContext context,
    List<CardBodyItem> actualChildren,
  ) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, currentIndex, _) {
        return IndexedStack(
          index: currentIndex,
          children: [
            for (int i = 0; i < actualChildren.length; i++)
              ConstraintBlocker(
                isVisible: i == currentIndex,
                child: RepaintBoundary(
                  child: PersistentFadingBody(
                    loadLazy: actualChildren[i].loadLazy,
                    keepAlive: actualChildren[i].keepAlive,
                    isSelected: i == currentIndex,
                    child: FocusScope(
                      canRequestFocus: i == currentIndex,
                      skipTraversal: i != currentIndex,
                      child: actualChildren[i].build(
                        context,
                        constraints ?? const BoxConstraints(),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
