import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class FilterFieldOperatorView extends HookConsumerWidget {
  const FilterFieldOperatorView({
    required this.focusNode,
    required this.operatorController,
    required this.operatorValue,
    required this.filterIndex,
    required this.filterLength,
    required this.sessionId,
    required this.componentIdentifier,
    required this.groupIndex,
    required this.filterField,
    required this.fieldFocus,
    required this.width,
    this.isMobile = false,
    super.key,
  });
  final FocusNode focusNode;
  final TextEditingController operatorController;
  final ValueNotifier<FilterOperator?> operatorValue;
  final int filterIndex;
  final double width;
  final int filterLength;
  final String sessionId;
  final String componentIdentifier;
  final int groupIndex;
  final FilterField filterField;
  final FocusNode fieldFocus;
  final bool isMobile;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    // we are storing the initial index
    final initialIndex = useRef<int>(filterIndex);

    // when the index changes to 0 we are setting the
    // operator to and
    useEffect(
      () {
        if (initialIndex.value != 0 && filterIndex == 0) {
          operatorController.text = FilterOperator.and.readable(l10n);
          operatorValue.value = FilterOperator.and;
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ref
                .read(
                  appTableFilterTempStateProvider(
                    componentIdentifier,
                    sessionId,
                  ).notifier,
                )
                .updateFilterFieldOperator(
                  groupIndex,
                  filterIndex,
                  FilterOperator.and,
                );
          });
        }
        return null;
      },
      [filterIndex],
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _RemoveButton(
          filterIndex: filterIndex,
          filterLength: filterLength,
          sessionId: sessionId,
          componentIdentifier: componentIdentifier,
          groupIndex: groupIndex,
        ),
        const SizedBox(
          width: 6,
        ),

        // * Operator
        // And / Or

        SizedBox(
          width: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //  The Operator Widget, can be AND or OR

              AbsorbPointer(
                absorbing: filterIndex == 0,
                child: ElbFocusOrderWrapper(
                  focusOrderId: groupIndex + filterIndex + 0,
                  child: NextDropdownMenu<FilterOperator>(
                    readOnly: filterIndex == 0,
                    focusNode: focusNode,
                    width: 120,
                    initialValue: filterField.filterOperator.readable(l10n),
                    controller: operatorController,
                    hintText: l10n.table_filter_operator,
                    dropdownMenuEntries: [
                      FilterOperator.and,
                      FilterOperator.or,
                    ].map<NextDropdownMenuEntry<FilterOperator>>(
                      (FilterOperator operator) {
                        return NextDropdownMenuEntry<FilterOperator>(
                          label: operator.readable(l10n),
                          value: operator,
                        );
                      },
                    ).toList(),
                    // we are setting the oparator manually to and if the index
                    // is 0 and the field it then in readOnly mode. We are
                    // removing the isMandatory flag so that the error
                    // disappears when the field was empty before
                    isMandatory: filterIndex != 0,
                    onSelected: (value) {
                      if (value == null) {
                        return;
                      }
                      if (value == operatorValue.value) {
                        return;
                      }

                      operatorValue.value = value;

                      ref
                          .read(
                            appTableFilterTempStateProvider(
                              componentIdentifier,
                              sessionId,
                            ).notifier,
                          )
                          .updateFilterFieldOperator(
                            groupIndex,
                            filterIndex,
                            value,
                          );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RemoveButton extends HookConsumerWidget {
  const _RemoveButton({
    required this.filterIndex,
    required this.filterLength,
    required this.sessionId,
    required this.componentIdentifier,
    required this.groupIndex,
  });
  final int filterIndex;
  final int filterLength;
  final String sessionId;
  final String componentIdentifier;
  final int groupIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalColors = context.appTheme.generalColors;
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: IgnorePointer(
        // If we have only one filter we are ignoring the option to
        // remove it
        ignoring: filterIndex == 0 && filterLength == 1,
        child: AppIconButton.secondary(
          // we are skipping the traversal if we have only one filter
          // skipTraversal: filterIndex == 0 && filterLength == 1,
          skipTraversal: true,
          onPressed: () {
            ref
                .read(
                  appTableFilterTempStateProvider(
                          componentIdentifier, sessionId)
                      .notifier,
                )
                .removeFilter(groupIndex, filterIndex);
          },
          // if we have only one filter we are showing the icon in a
          // disabled state (simple opacity change)
          color: filterIndex == 0 && filterLength == 1
              ? generalColors.danger.withAppOpacity(UiConstants.disabledOpacity)
              : generalColors.danger,
          iconData: AppIcons.close,
        ),
      ),
    );
  }
}

/// Mobile version of FilterFieldOperatorView that uses ElbPopup
class MobileFilterFieldOperatorView extends HookConsumerWidget {
  const MobileFilterFieldOperatorView({
    required this.operatorValue,
    required this.filterIndex,
    required this.sessionId,
    required this.tableType,
    required this.groupIndex,
    required this.width,
    super.key,
  });

  final ValueNotifier<FilterOperator?> operatorValue;
  final int filterIndex;
  final double width;
  final String sessionId;
  final String tableType;
  final int groupIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = context.appTheme;

    // For the first filter, always show AND and disable interaction
    if (filterIndex == 0) {
      return Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: theme.generalColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: theme.generalColors.background.withAppOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              FilterOperator.and.readable(l10n),
              style: const TextStyle(),
            ),
            const Icon(
              AppIcons.expand_more,
              size: 20,
            ),
          ],
        ),
      );
    }

    // For subsequent filters, show ElbPopup
    return ElbPopup(
      buttonBuilder: (showOverlay, hideOverlay, isOpen) {
        return SizedBox(
          width: width,
          child: ElbListTile(
            onPressed: showOverlay,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            titleText: operatorValue.value?.readable(l10n) ??
                l10n.table_filter_operator,
            trailing: Icon(
              isOpen ? AppIcons.expand_less : AppIcons.expand_more,
              size: 20,
            ),
          ),
        );
      },
      items: [
        ElbPopupItem(
          icon: null,
          label: FilterOperator.and.readable(l10n),
          onTap: () {
            operatorValue.value = FilterOperator.and;
            ref
                .read(
                  appTableFilterTempStateProvider(
                    tableType,
                    sessionId,
                  ).notifier,
                )
                .updateFilterFieldOperator(
                  groupIndex,
                  filterIndex,
                  FilterOperator.and,
                );
          },
        ),
        ElbPopupItem(
          icon: null,
          label: FilterOperator.or.readable(l10n),
          onTap: () {
            operatorValue.value = FilterOperator.or;
            ref
                .read(
                  appTableFilterTempStateProvider(
                    tableType,
                    sessionId,
                  ).notifier,
                )
                .updateFilterFieldOperator(
                  groupIndex,
                  filterIndex,
                  FilterOperator.or,
                );
          },
        ),
      ],
      position: ElbPopupPosition.bottomLeft,
      animationType: ElbPopupAnimationType.slideVertical,
      style: ElbPopupStyle(
        backgroundColor: theme.generalColors.primarySurface,
        borderColor: theme.generalColors.background.withAppOpacity(0.5),
      ),
    );
  }
}
