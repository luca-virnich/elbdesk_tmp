import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

class FilterFieldTypeView<T> extends HookConsumerWidget {
  const FilterFieldTypeView({
    required this.filterField,
    required this.fieldValue,
    required this.focusNode,
    required this.sessionId,
    required this.groupIndex,
    required this.filterIndex,
    required this.componentIdentifier,
    required this.availableFilterFields,
    required this.typeController,
    required this.typeValue,
    required this.fieldFocus,
    required this.valueController,
    required this.valueFocus,
    required this.width,
    super.key,
  });
  final FilterField filterField;
  final ValueNotifier<T?> fieldValue;
  final FocusNode focusNode;
  final String sessionId;
  final int groupIndex;
  final int filterIndex;
  final String componentIdentifier;
  final Map<T, TableFieldData> availableFilterFields;
  final TextEditingController typeController;
  final ValueNotifier<FilterType?> typeValue;
  final FocusNode fieldFocus;
  final FocusNode valueFocus;
  final TextEditingController valueController;
  final double width;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return Row(
      children: [
        Flexible(
          child: ElbFocusOrderWrapper(
            focusOrderId: groupIndex + filterIndex + 3,
            child: NextDropdownMenu<FilterType>(
              readOnly: fieldValue.value == null,
              width: width,
              isMandatory: typeValue.value == null,
              focusNode: focusNode,
              initialValue: filterField.type.readable(l10n),
              controller: typeController,
              hintText: l10n.table_filter_condition,
              dropdownMenuEntries: (fieldValue.value != null
                      ? availableFilterFields[fieldValue.value]!.filterTypes
                      : <FilterType>[])
                  .map<NextDropdownMenuEntry<FilterType>>(
                (FilterType filterType) {
                  return NextDropdownMenuEntry<FilterType>(
                    label: filterType.readable(l10n),
                    value: filterType,
                  );
                },
              ).toList(),
              onSelected: (value) {
                if (value == typeValue.value) return;

                typeValue.value = value;
                if (value == null) return;

                ref
                    .read(
                      appTableFilterTempStateProvider(
                              componentIdentifier, sessionId)
                          .notifier,
                    )
                    .updateFilterFieldType(groupIndex, filterIndex, value);

                // Automatically selects all text
                // I implemented this instead of deleting the full text
                // That way the user has the option to keep it
                valueController.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: valueController.text.length,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// Mobile version of FilterFieldTypeView that uses ElbPopup
class MobileFilterFieldTypeView<T> extends HookConsumerWidget {
  const MobileFilterFieldTypeView({
    required this.filterField,
    required this.fieldValue,
    required this.sessionId,
    required this.groupIndex,
    required this.filterIndex,
    required this.tableType,
    required this.availableFilterFields,
    required this.typeController,
    required this.typeValue,
    required this.valueController,
    required this.width,
    super.key,
  });

  final FilterField filterField;
  final ValueNotifier<T?> fieldValue;
  final String sessionId;
  final int groupIndex;
  final int filterIndex;
  final String tableType;
  final Map<T, TableFieldData> availableFilterFields;
  final TextEditingController typeController;
  final ValueNotifier<FilterType?> typeValue;
  final TextEditingController valueController;
  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = context.appTheme;

    // Get available filter types for the selected field
    final availableTypes = fieldValue.value != null
        ? availableFilterFields[fieldValue.value]!.filterTypes
        : <FilterType>[];

    // Disable if no field is selected
    final isDisabled = fieldValue.value == null;

    return ElbPopup(
      buttonBuilder: (showOverlay, hideOverlay, isOpen) {
        return SizedBox(
          width: width,
          child: ElbListTile(
            onPressed: isDisabled
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    showOverlay();
                  },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            titleText:
                typeValue.value?.readable(l10n) ?? l10n.table_filter_condition,
            titleTextStyle: isDisabled
                ? TextStyle(
                    color: theme.generalColors.background.withAppOpacity(0.5),
                  )
                : null,
            trailing: Icon(
              isOpen ? AppIcons.expand_less : AppIcons.expand_more,
              size: 20,
              color: isDisabled
                  ? theme.generalColors.background.withAppOpacity(0.3)
                  : null,
            ),
          ),
        );
      },
      items: availableTypes.map((filterType) {
        return ElbPopupItem(
          icon: null,
          label: filterType.readable(l10n),
          onTap: () {
            // Don't do anything if same type is selected
            if (filterType == typeValue.value) return;

            // Update the type value
            typeValue.value = filterType;
            typeController.text = filterType.readable(l10n);

            // Update the filter state
            ref
                .read(
                  appTableFilterTempStateProvider(tableType, sessionId)
                      .notifier,
                )
                .updateFilterFieldType(groupIndex, filterIndex, filterType);

            // Clear and select all text in value field
            valueController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: valueController.text.length,
            );
          },
        );
      }).toList(),
      position: ElbPopupPosition.bottomLeft,
      animationType: ElbPopupAnimationType.slideVertical,
      style: ElbPopupStyle(
        backgroundColor: theme.generalColors.primarySurface,
        borderColor: theme.generalColors.background.withAppOpacity(0.5),
      ),
    );
  }
}
