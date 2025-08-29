import 'package:elbdesk_ui/src/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

/// How the scrollableActions should be placed along the horizontal axis in a
/// AppWindowMenuFooter.
///
/// See also:
///
///  * [AppWindowMenuFooter]
enum ScrollableActionsAlignment {
  /// Place the scrollableActions children as close to the start of the
  /// horizontal axis as possible.
  start,

  /// Place the scrollableActions children as close to the end of the
  /// horizontal axis as possible.
  end,
}

/// A single row that typically contains three columns of single row buttons
/// grouped in [leadingActions], [scrollableActions] and [trailingActions].
///
/// * [leadingActions]
///   - the column of actions that are always fixed to the left and don't get
/// wrapped if the widget width is less than its [breakpointWidth].
///
/// * [scrollableActions]
///    - the column of actions that gets wrapped into a three dot menu if the
/// widget width is smaller than its [breakpointWidth].
///    - The alignment of the scrollableActions can be defined with the property
/// [scrollableActionsAlignment].
///
/// * [trailingActions]
///   - the column of actions that are always fixed to the right and don't get
/// wrapped if the widget width is less than its [breakpointWidth].
///
/// ## Performance considerations for width calculation
/// If you can provide parent width, please do so. This will prevent the widget
/// from rebuilding on every parent width change.
class AppWindowMenuFooter extends StatelessWidget {
  /// Creates a horizontal array of actions/children separated in three groups.
  ///
  /// The [scrollableActionsAlignment] argument specifies the horizontal
  /// alignment of the [scrollableActions] relative to it's container and
  /// defaults to [ScrollableActionsAlignment.end].
  ///
  /// ## Performance considerations for width calculation
  /// If you can provide parent width, please do so. This will prevent the
  /// widget from rebuilding on every parent width change.
  const AppWindowMenuFooter({
    super.key,
    this.width,
    this.breakpointWidth = UiConstants.elbCardMenuFooterBreakpointWidth,
    this.scrollableActionsAlignment = ScrollableActionsAlignment.end,
    this.padding = const EdgeInsets.all(UiConstants.defaultPadding),
    this.leadingActions = const [],
    this.scrollableActions = const [],
    this.trailingActions = const [],
  });

  /// The width of the widget.
  ///
  /// If the width is less than the [breakpointWidth]
  /// the [scrollableActions] will be wrapped into a three dot menu.
  ///
  /// If the width is null the width of the parent widget will be used.
  ///
  /// If the width is not null the width of the parent widget will be ignored.
  ///
  /// __Performance Note:__
  /// For performance reasons it's best to provide the [width].
  /// If the [width] is not provided, the widget will fall back to using a
  /// [LayoutBuilder] to calculate the constraints on its own.
  final double? width;

  /// The width at which the [scrollableActions] should be wrapped into a three
  /// dot menu.
  final double breakpointWidth;

  /// The alignment of the [scrollableActions] relative to it's container.
  final ScrollableActionsAlignment scrollableActionsAlignment;

  /// The actions that are always fixed to the left and don't get wrapped on a
  /// smaller width.
  final List<Widget> leadingActions;

  /// The actions that are wrapped into a three dot menu if the widget width is
  /// smaller than the [breakpointWidth].
  /// The alignment of the scrollableActions can be defined with the property
  /// [scrollableActionsAlignment].
  final List<Widget> scrollableActions;

  /// The actions that are always fixed to the right and don't get wrapped on a
  /// smaller width.
  final List<Widget> trailingActions;

  /// The padding of the widget.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return Padding(
        padding: padding,
        child: width! < breakpointWidth
            ? _buildButtonMenu(context)
            : _buildButtonRow(context),
      );
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        return Padding(
          padding: padding,
          child: maxWidth < breakpointWidth
              ? _buildButtonMenu(context)
              : _buildButtonRow(context),
        );
      },
    );
  }

  Widget _buildButtonRow(BuildContext context) {
    final scrollableActionsAligned =
        scrollableActionsAlignment == ScrollableActionsAlignment.end
            ? scrollableActions.reversed.toList()
            : scrollableActions;

    return SizedBox(
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...leadingActions,
          if (scrollableActions.isNotEmpty) ...[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiConstants.defaultPadding,
                ),
                child: ListView.separated(
                  reverse: scrollableActionsAlignment ==
                      ScrollableActionsAlignment.end,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: UiConstants.defaultPadding / 2,
                  ),
                  itemCount: scrollableActions.length,
                  itemBuilder: (context, index) {
                    return scrollableActionsAligned[index];
                  },
                  // children: [
                  //   ...scrollableActions,
                  // ],
                ),
              ),
            ),
          ],
          if (scrollableActions.isEmpty) ...[const Spacer()],
          ...trailingActions,
        ],
      ),
    );
  }

  Widget _buildButtonMenu(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingActions.isNotEmpty) ...[
            Expanded(
              child: ListView(
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  ...leadingActions,
                  if (scrollableActions.isNotEmpty &&
                      scrollableActionsAlignment ==
                          ScrollableActionsAlignment.start) ...[
                    // AppCompositedOverlay(
                    //   isDismissible: true,
                    //   showBarrier: false,
                    //   targetAnchor: Alignment.bottomLeft,
                    //   followerAnchor: Alignment.bottomLeft,
                    //   offset: const Offset(0, -40),
                    //   overlayBuilder: (controller) {
                    //     return AppWindow(
                    //       showShadow: true,
                    //       child: SpacedColumn(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         spacing: UiConstants.defaultPadding / 2,
                    //         children: [
                    //           ...scrollableActions,
                    //         ],
                    //       ),
                    //     );
                    //   },
                    //   childBuilder: (controller) {
                    //     return AppButton.text(
                    //       iconData: Icons.more_vert,
                    //       onPressed: () {
                    //         controller.show();
                    //       },
                    //       // label: 'show more',
                    //     );
                    //   },
                    // ),
                  ],
                ],
              ),
            ),
          ],
          if (scrollableActions.isNotEmpty &&
              scrollableActionsAlignment == ScrollableActionsAlignment.end) ...[
            // AppCompositedOverlay(
            //   isDismissible: true,
            //   showBarrier: false,
            //   targetAnchor: Alignment.bottomLeft,
            //   followerAnchor: Alignment.bottomLeft,
            //   offset: const Offset(0, -40),
            //   overlayBuilder: (controller) {
            //     return AppWindow(
            //       showShadow: true,
            //       child: SpacedColumn(
            //         mainAxisSize: MainAxisSize.min,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         spacing: UiConstants.defaultPadding / 2,
            //         children: [
            //           ...scrollableActions,
            //         ],
            //       ),
            //     );
            //   },
            //   childBuilder: (controller) {
            //     return AppButton.text(
            //       iconData: Icons.more_vert,
            //       onPressed: () {
            //         controller.show();
            //       },
            //       // label: 'show more',
            //     );
            //   },
            // ),
          ],
          ...trailingActions,
        ],
      ),
    );
  }
}
