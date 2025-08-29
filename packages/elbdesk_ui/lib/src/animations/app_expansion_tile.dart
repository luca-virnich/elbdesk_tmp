import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A customizable expansion tile widget that can be used to show/hide content.
///
/// This widget provides a header (title) that can be tapped to expand or
/// collapse the child content below it. It supports various customization
/// options like initial expansion state, divider visibility, and custom
/// actions.
///
/// The [AppExpansionTile] uses the [HookWidget] for state management.
class AppExpansionTile extends HookWidget {
  /// Creates an [AppExpansionTile].
  ///
  /// The [child] argument must not be null.
  const AppExpansionTile({
    required this.child,
    super.key,
    this.title,
    this.titleText,
    this.initialIsExpanded = false,
    this.showDivider = true,
    this.showLeadingChevron = false,
    this.hoverColor,
    this.titleTextStyle,
    this.actions = const [],
    this.formKey,
    this.keepAliveChildren = false,
  });

  /// The primary content of the expansion tile.
  ///
  /// Typically a [Widget] that's displayed when the tile is expanded.
  final Widget child;

  /// A widget to display before the title.
  ///
  /// Typically a [Widget] like [Text].
  final Widget? title;

  /// The text to display as the tile's title.
  ///
  /// This is used if [title] is null.
  final String? titleText;

  /// Whether the tile is initially expanded.
  final bool initialIsExpanded;

  /// Whether to show a divider below the tile's title.
  final bool showDivider;

  /// Whether to show a leading chevron icon.
  final bool showLeadingChevron;

  /// The color to use when the tile is being hovered over.
  final Color? hoverColor;

  /// The text style to use for the tile's title.
  final TextStyle? titleTextStyle;

  /// A list of widgets to display after the title.
  ///
  /// Typically these are [IconButton]s representing operations to perform on
  /// the tile or its contents.
  final List<Widget> actions;

  /// Formkey that's used to validate the children if the tile is minimized
  final GlobalKey<FormState>? formKey;

  /// Whether to keep the child in the tree when collapsed.
  ///
  /// If true, the child remains in the tree but is sized to zero and
  /// transparent
  /// If false, the child is removed from the tree when collapsed.
  final bool keepAliveChildren;

  @override
  Widget build(BuildContext context) {
    final isExpand = useState<bool>(initialIsExpanded);
    final statusColors = context.appTheme.statusColors;
    final isFormValid = useState<bool>(true);

    final l10n = context.l10n;

    // This is needed to reset the validation state if a child is updated.
    // Otherwise the validation flag would not disappear.
    // `TODO`(all): If possible refactor this to not run on every rebuild
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (formKey?.currentState != null) {
        isFormValid.value = formKey!.currentState!.validate();
      }
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElbListTile(
          titleTextStyle: titleTextStyle,
          hoverColor: hoverColor,
          contentPadding: const EdgeInsets.symmetric(
            vertical: UiConstants.defaultPadding,
          ),
          onPressed: () {
            // if (formKey != null) {
            //   isFormValid.value = formKey!.currentState?.validate() ?? true;
            // }
            isExpand.value = !isExpand.value;
          },
          leading: showLeadingChevron
              ? Row(
                  children: [
                    _AnimatedRotatingIcon(isExpand: isExpand),
                    const SizedBox(
                      width: AppSpace.s,
                    ),
                  ],
                )
              : null,
          trailing: Row(
            children: [
              if (isFormValid.value == false)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.warning,
                      color: statusColors.pending,
                      size: AppIconSize.l.value,
                    ),
                    const SizedBox(
                      width: AppSpace.xs,
                    ),
                    AppText(l10n.validation_children_not_valid),
                  ],
                ),
              ...actions,
              if (!showLeadingChevron)
                _AnimatedRotatingIcon(isExpand: isExpand),
              const SizedBox(
                width: AppSpace.s,
              ),
            ],
          ),
          titleText: titleText,
          child: title,
        ),
        if (showDivider) ...[
          AppDivider(
            thickness: 1.5,
            color: statusColors.pending,
          ),
          const SizedBox(
            height: UiConstants.defaultPadding,
          ),
        ],
        AutoAnimatedSize(
          expanded: isExpand.value,
          keepAliveChildren: keepAliveChildren,
          child: child,
        ),
      ],
    );
  }
}

/// A widget that displays an animated rotating icon based on the expansion
/// state.
class _AnimatedRotatingIcon extends StatelessWidget {
  /// Creates an [_AnimatedRotatingIcon].
  ///
  /// The [isExpand] argument must not be null.
  const _AnimatedRotatingIcon({
    required this.isExpand,
  });

  /// Controls the rotation of the icon based on the expansion state.
  final ValueNotifier<bool> isExpand;

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      duration: AnimationConstants.shortDuration,
      // Rotate icon 180 degrees when expanded
      turns: !isExpand.value ? 0 : 0.5,

      child: const ElbIcon(
        Icons.expand_more,
      ),
    );
  }
}
