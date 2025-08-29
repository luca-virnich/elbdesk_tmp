import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A widget that represents the title bar of a window.
///
/// The [AppWindowTitlebar] widget is used to display a title bar at the top of
/// a window. It includes a title, optional actions, and a close button. The
/// title can be provided as a widget or a string.
///
/// {@tool snippet}
/// This example shows how to create an [AppWindowTitlebar] with a title and
/// actions:
///
/// ```dart
/// AppWindowTitlebar(
///   titleText: 'Window Title',
///   actions: [
///     IconButton(
///       icon: Icon(Icons.settings),
///       onPressed: () {},
///     ),
///   ],
///   onClose: () {
///     // Handle close action
///   },
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppText], which is used to display the title text.
///  * [AppIconButton], which is used for the close button.
class AppWindowTitlebar extends StatelessWidget {
  /// Creates an [AppWindowTitlebar].
  ///
  /// The [actions] parameter defaults to an empty list if not provided.
  ///
  /// Either a ([titleText] and [titleIconData]) must be provided.
  const AppWindowTitlebar({
    super.key,
    this.onClose,
    this.titleText,
    this.titleIconData,
    this.actions = const [],
    this.onPanEnd,
    this.onPanStart,
    this.onPanUpdate,
    this.absorbActions = false,
    this.isLoading = false,
    this.hideCloseButton = false,
    this.skipCloseButtonFocus = false,
  });

  final bool hideCloseButton;

  final bool skipCloseButtonFocus;

  final bool isLoading;

  /// The callback to invoke when the close button is pressed.
  final VoidCallback? onClose;

  /// The widget to display as the title.

  /// The text to display as the title.
  final String? titleText;

  /// The icon data to display as the title.
  final IconData? titleIconData;

  /// The list of action widgets to display in the title bar.
  final List<Widget> actions;

  /// A pointer has contacted the screen with an [AppWindowTitlebar] and has
  /// begun to move.
  final void Function(DragStartDetails)? onPanStart;

  /// A pointer that is in contact with the screen with an [AppWindowTitlebar]
  /// and moving has moved again.
  final void Function(DragUpdateDetails)? onPanUpdate;

  /// @nodoc
  final void Function(DragEndDetails)? onPanEnd;

  /// @nodoc
  final bool absorbActions;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final shadowColors = context.appTheme.shadows;
    final l10n = context.l10n;

    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: UiConstants.windowTitleBarHeight,
            decoration: BoxDecoration(
              color: generalColors.windowTitleBarBackground,
              boxShadow: [shadowColors.windowTitleBarShadow],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadiuses.m),
                topRight: Radius.circular(borderRadiuses.m),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                // left: 14,
                right: 8,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: AppSpace.s),
                  if (titleIconData != null) ...[
                    Icon(
                      titleIconData,
                      size: 24,
                    ),
                    const SizedBox(width: AppSpace.s),
                  ],
                  if (!isLoading)
                    Expanded(
                      child: AppText(
                        titleText ?? '',
                        style: context.appTheme.textStyles.h3,
                        maxLines: 1,
                      ),
                    ),
                  if (isLoading) ...[
                    AppShimmer.fromColors(
                      baseColor: generalColors.onBackground,
                      highlightColor: generalColors.primary,
                      child: AppText('${l10n.gen_loading} ...'),
                    ),
                    const Spacer(),
                  ],
                  AbsorbPointer(
                    absorbing: absorbActions,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...actions,
                        if (!hideCloseButton)
                          AppIconButton.secondary(
                            skipTraversal: skipCloseButtonFocus,
                            iconData: AppIcons.close,
                            onPressed: onClose,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
