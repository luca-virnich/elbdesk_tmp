import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Generic history viewer for entities
///
/// Shows a list of historical entries on the left and details on the right.
/// Supports viewing both the master entity and its related entries.
class EntityHistory<T> extends HookConsumerWidget {
  const EntityHistory({
    required this.masterEntityId,
    required this.historyProvider,
    required this.getEntityTitle,
    required this.masterEntityTitle,
    required this.masterEntityIcon,
    required this.entityIcon,
    required this.historyCardBuilder,
    required this.masterHistoryBuilder,
    super.key,
  });

  /// The current entity being viewed
  // final T currentEntity;

  /// ID of the master entity (e.g. ArtworkMasterId)
  final int masterEntityId;

  /// Provider that fetches the history entries
  final AutoDisposeFutureProvider<List<T>> historyProvider;

  /// Function to get the display title for an entity
  final String Function(T entity) getEntityTitle;

  /// Title to show for the master entity view
  final String masterEntityTitle;

  /// Icon to show for the master entity
  final IconData masterEntityIcon;

  /// Icon to show for history entries
  final IconData entityIcon;

  /// Builder for the history card when an entry is selected
  final Widget Function(T entity) historyCardBuilder;

  /// Builder for the master history view
  final Widget Function(int masterEntityId) masterHistoryBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyProvider);

    final selectedEntity = useState<T?>(null);

    return history.fastWhen(
      data: (data) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left sidebar with history entries
            Padding(
              padding: const EdgeInsets.all(UiConstants.defaultPadding),
              child: SizedBox(
                width: 200,
                child: Column(
                  children: [
                    // Master entity button
                    _HistoryButton(
                      title: masterEntityTitle,
                      icon: masterEntityIcon,
                      isSelected: selectedEntity.value == null,
                      onTap: () => selectedEntity.value = null,
                    ),
                    // List of history entries
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final entity = data[index];
                          return _HistoryButton(
                            title: getEntityTitle(entity),
                            icon: entityIcon,
                            isSelected: selectedEntity.value == entity,
                            onTap: () => selectedEntity.value = entity,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const AppDivider.vertical(),
            // Right side content
            Expanded(
              child: selectedEntity.value == null
                  ? masterHistoryBuilder(masterEntityId)
                  : historyCardBuilder(selectedEntity.value as T),
            ),
          ],
        );
      },
    );
  }
}

/// Button used in the history sidebar
class _HistoryButton extends StatelessWidget {
  const _HistoryButton({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appTheme.generalColors;
    final navigationProperties = context.appTheme.navigationProperties;

    return InkWell(
      splashColor: appColors.transparent,
      splashFactory: NoSplash.splashFactory,
      highlightColor: navigationProperties.overlayColor,
      enableFeedback: false,
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return navigationProperties.overlayColor;
          }
          return null;
        },
      ),
      onTap: onTap,
      borderRadius: BorderRadius.circular(navigationProperties.borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? navigationProperties.overlayColor
              : appColors.transparent,
          borderRadius:
              BorderRadius.circular(navigationProperties.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppSpace.xs,
            bottom: AppSpace.s,
            top: AppSpace.s,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElbIcon(
                icon,
                size: AppIconSize.xl,
                color: isSelected
                    ? navigationProperties.foregroundActiveIconColor
                    : navigationProperties.foregroundIconColor,
              ),
              Flexible(
                child: AnimatedContainer(
                  duration: AnimationConstants.defaultDuration,
                  width: 130,
                  curve: AnimationConstants.defaultCurve,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: AppSpace.m),
                        child: AppText(
                          title,
                          maxLines: 1,
                          autoSize: false,
                          style: context.appTheme.textStyles.h3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
