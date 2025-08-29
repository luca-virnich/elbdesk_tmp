import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class FilterFieldFieldView<T> extends HookConsumerWidget {
  const FilterFieldFieldView({
    required this.fieldController,
    required this.fieldFocus,
    required this.sessionId,
    required this.groupIndex,
    required this.availableFilterFields,
    required this.componentIdentifier,
    required this.filterIndex,
    required this.fieldValue,
    required this.typeFocus,
    required this.typeValue,
    required this.width,
    required this.operatorFocus,
    required this.valueController,
    required this.dateValueController,
    required this.typeController,
    super.key,
  });
  final TextEditingController fieldController;
  final FocusNode fieldFocus;
  final String sessionId;
  final int groupIndex;
  final Map<T, TableFieldData> availableFilterFields;
  final String componentIdentifier;
  final int filterIndex;

  final ValueNotifier<T?> fieldValue;
  final FocusNode typeFocus;
  final ValueNotifier<FilterType?> typeValue;
  final double width;
  final FocusNode operatorFocus;
  final TextEditingController valueController;
  final TextEditingController dateValueController;
  final TextEditingController typeController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (context.mounted) {
            fieldFocus.requestFocus();
          }
        });
        return null;
      },
      [],
    );

    final l10n = context.l10n;
    return ElbFocusOrderWrapper(
      focusOrderId: groupIndex + filterIndex + 2,
      child: NextDropdownMenu<TableFieldData>(
        readOnly: false,
        focusNode: fieldFocus,
        initialValue: availableFilterFields[fieldValue.value]?.readable,
        width: width,
        controller: fieldController,
        hintText: l10n.table_filter_field,
        dropdownMenuEntries: availableFilterFields.entries
            .map<NextDropdownMenuEntry<TableFieldData>>(
          (MapEntry<T, TableFieldData> entry) {
            return NextDropdownMenuEntry<TableFieldData>(
              label: entry.value.readable,
              value: entry.value,
            );
          },
        ).toList(),
        onSelected: (value) {
          if (value == null) {
            fieldValue.value = null;
            return;
          }
          final selectedKey = availableFilterFields.entries
              .firstWhere((entry) => entry.value == value)
              .key;

          if (selectedKey == fieldValue.value) {
            // typeFocus.requestFocus();
            return;
          }

          // Update the fieldValue
          fieldValue.value = selectedKey;
          final fieldType = availableFilterFields[selectedKey]!.fieldType;

          ref
              .read(
                appTableFilterTempStateProvider(
                  componentIdentifier,
                  sessionId,
                ).notifier,
              )
              .updateFilterFieldFieldKey(
                groupIndex,
                filterIndex,
                selectedKey.toString(),
                fieldType,
                availableFilterFields[selectedKey]!.filterTypes.first,
              );

          typeController.text = availableFilterFields[selectedKey]!
              .filterTypes
              .first
              .readable(l10n);
          typeValue.value =
              availableFilterFields[selectedKey]!.filterTypes.first;
          valueController.text = '';
          dateValueController.text = '';
          // typeFocus.requestFocus();
        },
      ),
    );
  }
}

/// Mobile version of FilterFieldFieldView that uses a dialog
class MobileFilterFieldFieldView<T> extends HookConsumerWidget {
  const MobileFilterFieldFieldView({
    required this.sessionId,
    required this.groupIndex,
    required this.availableFilterFields,
    required this.tableType,
    required this.filterIndex,
    required this.fieldValue,
    required this.typeValue,
    required this.width,
    required this.valueController,
    required this.dateValueController,
    required this.typeController,
    super.key,
  });

  final String sessionId;
  final int groupIndex;
  final Map<T, TableFieldData> availableFilterFields;
  final String tableType;
  final int filterIndex;
  final ValueNotifier<T?> fieldValue;
  final ValueNotifier<FilterType?> typeValue;
  final double width;
  final TextEditingController valueController;
  final TextEditingController dateValueController;
  final TextEditingController typeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    // Get current selected field
    final currentField = fieldValue.value != null
        ? availableFilterFields[fieldValue.value]
        : null;

    return SizedBox(
      width: width,
      child: ElbListTile(
        onPressed: () async {
          FocusScope.of(context).unfocus();

          final selectedField = await showDialog<T>(
            context: context,
            builder: (context) => _FieldSelectionDialog(
              availableFilterFields: availableFilterFields,
              currentValue: fieldValue.value,
              title: l10n.table_filter_field,
            ),
          );

          if (selectedField != null && selectedField != fieldValue.value) {
            // Update the fieldValue
            fieldValue.value = selectedField;
            final fieldType = availableFilterFields[selectedField]!.fieldType;

            // Update the filter state
            ref
                .read(
                  appTableFilterTempStateProvider(
                    tableType,
                    sessionId,
                  ).notifier,
                )
                .updateFilterFieldFieldKey(
                  groupIndex,
                  filterIndex,
                  selectedField.toString(),
                  fieldType,
                  availableFilterFields[selectedField]!.filterTypes.first,
                );

            // Update related controllers
            typeController.text = availableFilterFields[selectedField]!
                .filterTypes
                .first
                .readable(l10n);
            typeValue.value =
                availableFilterFields[selectedField]!.filterTypes.first;
            valueController.text = '';
            dateValueController.text = '';
          }
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        titleText: currentField?.readable ?? l10n.table_filter_field,
        trailing: const Icon(
          AppIcons.expand_more,
          size: 20,
        ),
      ),
    );
  }
}

/// Dialog for selecting a filter field
class _FieldSelectionDialog<T> extends StatelessWidget {
  const _FieldSelectionDialog({
    required this.availableFilterFields,
    required this.currentValue,
    required this.title,
  });

  final Map<T, TableFieldData> availableFilterFields;
  final T? currentValue;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    final l10n = context.l10n;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(theme.borderRadiuses.m),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: theme.generalColors.background.withAppOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: theme.textStyles.h3,
                  ),
                ),
              ],
            ),
          ),
          // Content
          Flexible(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: availableFilterFields.entries.length,
                separatorBuilder: (context, index) => const AppDivider(),
                itemBuilder: (context, index) {
                  final entry = availableFilterFields.entries.elementAt(index);
                  final isSelected = entry.key == currentValue;

                  return ElbListTile(
                    onPressed: () => Navigator.of(context).pop(entry.key),
                    titleText: entry.value.readable,
                    trailing: isSelected
                        ? Icon(
                            AppIcons.check,
                            color: theme.generalColors.primary,
                            size: 20,
                          )
                        : null,
                  );
                },
              ),
            ),
          ),
          // Actions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: theme.generalColors.background.withAppOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppButton.secondary(
                  onPressed: () => Navigator.of(context).pop(),
                  label: l10n.gen_cancel,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
