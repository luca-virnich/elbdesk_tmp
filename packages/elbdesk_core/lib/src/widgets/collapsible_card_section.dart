import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/widgets/card_section_collapse_button.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class CollapsibleCardSection extends HookConsumerWidget {
  const CollapsibleCardSection({
    required this.title,
    required this.child,
    required this.identifier,
    super.key,
    this.trailingWidgets,
    this.leadingWidgets,
    this.leadingIcon,
  });

  final String title;
  final Widget child;
  final List<Widget>? trailingWidgets;
  final List<Widget>? leadingWidgets;
  final IconData? leadingIcon;
  final String identifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dividerColor = context.appTheme.generalColors.titleDivider;
    final defaultCollapseCardSection =
        ref.watch(defaultCollapseCardSectionsStateProvider);

    final collapseCardSection = ref
        .watch(collapseCardSectionStateProvider)
        .findIsCollapsedByIdentifier(identifier);

    final isCollapsedNotifier = useState<bool>(
      collapseCardSection ?? defaultCollapseCardSection,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ConstrainedBox(
          constraints:
              const BoxConstraints(minHeight: UiConstants.buttonHeight),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (leadingIcon != null) ...[
                      ElbIcon(
                        leadingIcon!,
                        size: AppIconSize.l,
                        color: context.appTheme.generalColors.onBackground,
                      ),
                      const SizedBox(width: AppSpace.s),
                    ],
                    Flexible(
                      child: AppText(
                        title,
                        style: context.appTheme.textStyles.h1,
                        maxLines: 1,
                      ),
                    ),
                    if (leadingWidgets != null) ...[
                      ...leadingWidgets!,
                    ],
                  ],
                ),
              ),
              if (trailingWidgets != null) ...[
                const SizedBox(width: UiConstants.defaultPadding),
                AutoAnimatedSize(
                  animationDuration: AnimationConstants.shortDuration,
                  keepAliveChildren: true,
                  expanded: !isCollapsedNotifier.value,
                  child: Row(
                    children: trailingWidgets!,
                  ),
                ),
              ],
              const SizedBox(width: UiConstants.elementMargin),
              CardSectionCollapseButton(
                onPressed: () {
                  isCollapsedNotifier.value = !isCollapsedNotifier.value;
                  ref
                      .read(userSettingsStateProvider.notifier)
                      .updateCollapseCardSection(
                        identifier,
                        isCollapsedNotifier.value,
                      );
                },
                isCollapsed: isCollapsedNotifier.value,
              ),
            ],
          ),
        ),
        AppDivider(height: 16, color: dividerColor),
        AutoAnimatedSize(
          animationDuration: AnimationConstants.shortDuration,
          keepAliveChildren: true,
          expanded: !isCollapsedNotifier.value,
          child: child,
        ),
      ],
    );
  }
}
