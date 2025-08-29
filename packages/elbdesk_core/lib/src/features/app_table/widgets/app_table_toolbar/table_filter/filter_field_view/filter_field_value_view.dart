import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_value_fields/filter_value_dropdown_assign_user.dart';
// CRM and Sales imports removed - now using generic DropdownFilter
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class FilterFieldValueView<T> extends HookConsumerWidget {
  const FilterFieldValueView({
    required this.dateValueController,
    required this.fieldValue,
    required this.valueFocus,
    required this.sessionId,
    required this.groupIndex,
    required this.filterIndex,
    required this.componentIdentifier,
    required this.availableFilterFields,
    required this.valueController,
    required this.typeValue,
    required this.typeFocus,
    required this.operatorValue,
    required this.filterLength,
    required this.formKey,
    required this.close,
    required this.filterField,
    required this.width,
    this.dropdownFilterItems,
    super.key,
  });
  final ValueNotifier<T?> fieldValue;
  final FocusNode valueFocus;
  final String sessionId;
  final int filterLength;
  final Map<T, TableFieldData> availableFilterFields;
  final TextEditingController valueController;
  final ValueNotifier<FilterType?> typeValue;
  final FocusNode typeFocus;
  final int groupIndex;
  final int filterIndex;
  final String componentIdentifier;
  final FilterOperator? operatorValue;
  final TextEditingController dateValueController;
  final GlobalKey<FormState> formKey;
  final VoidCallback close;
  final FilterField filterField;
  final double width;
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final fieldType = availableFilterFields[fieldValue.value]?.fieldType;

    if (fieldType == null ||
        fieldValue.value == null ||
        typeValue.value == null) {
      return const NextLoadingTextField();
    }

    // Check if dropdown items exist for this field
    if (dropdownFilterItems != null) {
      final items = dropdownFilterItems?[fieldValue.value];
      if (items != null && items.isNotEmpty) {
        // Use a generic dropdown since we can't constrain to Enum at runtime
        return _GenericDropdownField(
          sessionId: sessionId,
          controller: valueController,
          groupIndex: groupIndex,
          filterIndex: filterIndex,
          componentIdentifier: componentIdentifier,
          width: width,
          items: items,
        );
      }
    }

    return switch (fieldType) {
      FilterFieldType.date => _DateTimeValueView<T>(
          fieldValue: fieldValue,
          valueFocus: valueFocus,
          sessionId: sessionId,
          groupIndex: groupIndex,
          filterIndex: filterIndex,
          filterLength: filterLength,
          componentIdentifier: componentIdentifier,
          availableFilterFields: availableFilterFields,
          valueController: valueController,
          operatorValue: operatorValue,
          typeValue: typeValue,
          dateValueController: dateValueController,
        ),
      FilterFieldType.boolean => _BoolValueView<T>(
          fieldValue: fieldValue,
          valueFocus: valueFocus,
          sessionId: sessionId,
          availableFilterFields: availableFilterFields,
          valueController: valueController,
          groupIndex: groupIndex,
          filterIndex: filterIndex,
          filterLength: filterLength,
          componentIdentifier: componentIdentifier,
          operatorValue: operatorValue,
          typeValue: typeValue,
          typeFocus: typeFocus,
          width: width,
          filterField: filterField,
        ),

      // FilterFieldType.languageCode =>

      // FilterFieldType.languageCode =>
      //   FilterValueDropdownField<LanguageCode>.filter(
      //     itemsProvider: ref.watch(fetchAllLanguageCodesProvider(sessionId)),
      //     itemLabel: (item) => item.name,
      //     itemValue: (item) => item.name,
      //     valueFocus: valueFocus,
      //     sessionId: sessionId,
      //     availableFilterFields: availableFilterFields,
      //     controller: valueController,
      //     groupIndex: groupIndex,
      //     filterIndex: filterIndex,
      //     filterLength: filterLength,
      //     tableType: tableType,
      //     operatorValue: operatorValue,
      //     typeFocus: typeFocus,
      //     width: width,
      //   ),
      FilterFieldType.assignedUser => FilterValueDropdownAssignUser.filter(
          valueFocus: valueFocus,
          sessionId: sessionId,
          availableFilterFields: availableFilterFields,
          controller: valueController,
          groupIndex: groupIndex,
          filterIndex: filterIndex,
          filterLength: filterLength,
          componentIdentifier: componentIdentifier,
          operatorValue: operatorValue,
          typeFocus: typeFocus,
          width: width,
        ),
      FilterFieldType.text || FilterFieldType.number => ElbFocusOrderWrapper(
          focusOrderId: groupIndex + filterIndex + 4,
          child: NextTextFormField(
            readOnly: fieldValue.value == null,

            // hintText: l10n.table_filter_value,
            onChanged: (p0) {
              ref
                  .read(
                    appTableFilterTempStateProvider(
                      componentIdentifier,
                      sessionId,
                    ).notifier,
                  )
                  .updateFilterFieldValue(groupIndex, filterIndex, p0);
            },
            onFieldSubmitted: (v) {
              final isLastFilter = filterIndex == filterLength - 1;
              if (isLastFilter) {
                final isValid = formKey.currentState?.validate() ?? false;
                if (!isValid) {
                  valueFocus.requestFocus();
                  return;
                }
// adds a new filter after pressed return
                final firstField = availableFilterFields.values.first;
                final fieldEnum = availableFilterFields.keys.first;

                ref
                    .read(
                      appTableFilterTempStateProvider(
                        componentIdentifier,
                        sessionId,
                      ).notifier,
                    )
                    .addFilterField(
                      0,
                      fieldEnum.toString(),
                      firstField.filterTypes.first,
                      firstField.fieldType,
                    );
              }
            },
            validator: (p0) {
              // If the operator is not selected (AND, OR)
              if (operatorValue == null) {
                return l10n.table_filter_validator_operator;
              }

              // If the field is not selected (id, name, etc)
              if (fieldValue.value == null) {
                return l10n.table_filter_validator_field;
              }

              // If the type is not selected (=, !=, like, etc)
              if (typeValue.value == null) {
                return l10n.table_filter_validator_condition;
              }

              // If the value is empty
              if (valueController.text.isEmpty) {
                return l10n.table_filter_validator_value;
              }
              return null;
              // TODO(tk): Fix this
              // ! FIXME removed the validation so like works
              // final validationString = fieldValue.value != null
              //     ? availableFilterFields[fieldValue.value]!
              //         .validator!(valueController.text)
              //     : null;

              // return validationString;
            },
            // validator: selectedField.value != null ? field.value.validator
            controller: valueController,
            focusNode: valueFocus,
          ),
        ),
    };

    // if (fieldType == FilterFieldType.date) {
    //   return _DateTimeValueView<T>(
    //     fieldValue: fieldValue,
    //     valueFocus: valueFocus,
    //     sessionId: sessionId,
    //     groupIndex: groupIndex,
    //     filterIndex: filterIndex,
    //     filterLength: filterLength,
    //     tableType: tableType,
    //     availableFilterFields: availableFilterFields,
    //     valueController: valueController,
    //     operatorValue: operatorValue,
    //     typeValue: typeValue,
    //     dateValueController: dateValueController,
    //   );
    // }
    // if (fieldType == FilterFieldType.languageCode) {
    //   final itemsProvider = ref.watch(findLanguageCodesProvider(sessionId));
    //   return FilterValueDropdownField<LanguageCode>.filter(
    //     tableType: tableType,
    //     sessionId: sessionId,
    //     valueFocus: valueFocus,
    //     operatorValue: operatorValue,
    //     itemsProvider: itemsProvider,
    //     itemLabel: (item) => item.name,
    //     itemValue: (item) => item.name,
    //     controller: valueController,
    //     typeFocus: typeFocus,
    //     groupIndex: groupIndex,
    //     filterIndex: filterIndex,
    //     filterLength: filterLength,
    //     availableFilterFields: availableFilterFields,
    //     width: width,
    //   );
    // }

    // if (fieldType == FilterFieldType.assignedUsers) {
    //   final itemsProvider = ref.watch(fetchAllAppUsersProvider(sessionId));
    //   return FilterValueDropdownField<AppUser>.filter(
    //     itemsProvider: itemsProvider,
    //     controller: valueController,
    //     typeFocus: typeFocus,
    //     width: width,
    //     groupIndex: groupIndex,
    //     filterIndex: filterIndex,
    //     filterLength: filterLength,
    //     availableFilterFields: availableFilterFields,
    //     tableType: tableType,
    //     sessionId: sessionId,
    //     valueFocus: valueFocus,
    //     operatorValue: operatorValue,
    //     itemLabel: (item) => item.userInfo.fullName!,
    //     itemValue: (item) => item.userInfo.fullName!,
    //     leadingIcon: (item) => AppUserAvatar(
    //       user: item,
    //       isActive: false,
    //       size: 24,
    //     ),
    //   );
    // }

    // if (fieldType == FilterFieldType.boolean) {
    //   return _BoolValueView<T>(
    //     fieldValue: fieldValue,
    //     valueFocus: valueFocus,
    //     sessionId: sessionId,
    //     availableFilterFields: availableFilterFields,
    //     valueController: valueController,
    //     groupIndex: groupIndex,
    //     filterIndex: filterIndex,
    //     filterLength: filterLength,
    //     tableType: tableType,
    //     operatorValue: operatorValue,
    //     typeValue: typeValue,
    //     typeFocus: typeFocus,
    //     width: width,
    //     filterField: filterField,
    //   );
    // }
  }
}

class _DateTimeValueView<T> extends ConsumerWidget {
  const _DateTimeValueView({
    required this.fieldValue,
    required this.valueFocus,
    required this.sessionId,
    required this.groupIndex,
    required this.filterIndex,
    required this.filterLength,
    required this.componentIdentifier,
    required this.availableFilterFields,
    required this.valueController,
    required this.operatorValue,
    required this.typeValue,
    required this.dateValueController,
    super.key,
  });
  final ValueNotifier<T?> fieldValue;
  final FocusNode valueFocus;
  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final TextEditingController valueController;
  final int groupIndex;
  final int filterIndex;
  final int filterLength;
  final String componentIdentifier;
  final FilterOperator? operatorValue;
  final ValueNotifier<FilterType?> typeValue;
  final TextEditingController dateValueController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return ElbFocusOrderWrapper(
      focusOrderId: groupIndex + filterIndex + 4,
      child: NextTextFormField(
        onFieldSubmitted: (v) {
          final parsedDate = AppValidator.parseDateInput(v);

          dateValueController.text = parsedDate?.toDate(l10n.localeName) ?? '';

          // check if v is an date
          final isAlreadyDate = AppValidator.isStringDateInput(v);
          if (isAlreadyDate && filterIndex == filterLength - 1) {
            final firstField = availableFilterFields.values.first;
            final fieldEnum = availableFilterFields.keys.first;

            ref
                .read(
                  appTableFilterTempStateProvider(
                    componentIdentifier,
                    sessionId,
                  ).notifier,
                )
                .addFilterField(
                  0,
                  fieldEnum.toString(),
                  firstField.filterTypes.first,
                  firstField.fieldType,
                );
          } else {
            valueFocus.requestFocus();
          }
        },

        onChanged: (v) {
          final parsedDate = AppValidator.parseDateInput(v);
          final utcDate = parsedDate?.toUtc();
          ref
              .read(
                appTableFilterTempStateProvider(componentIdentifier, sessionId)
                    .notifier,
              )
              .updateFilterFieldValue(
                groupIndex,
                filterIndex,
                utcDate?.toIso8601String() ?? '',
              );
        },
        validator: (p0) {
          // If the operator is not selected (AND, OR)
          if (operatorValue == null) {
            return l10n.table_filter_validator_operator;
          }

          // If the field is not selected (id, name, etc)
          if (fieldValue.value == null) {
            return l10n.table_filter_validator_field;
          }

          // If the type is not selected (=, !=, like, etc)
          if (typeValue.value == null) {
            return l10n.table_filter_validator_condition;
          }

          // If the value is empty
          if (dateValueController.text.isEmpty) {
            return l10n.table_filter_validator_value;
          }
          return null;

          // TODO(tk): Fix this
          // ! FIXME removed the validation so like works
          // final validationString = fieldValue.value != null
          //     ? availableFilterFields[fieldValue.value]!
          //         .validator!(valueController.text)
          //     : null;

          // return validationString;
        },
        // validator: selectedField.value != null ? field.value.validator
        controller: dateValueController,
        focusNode: valueFocus,
      ),
    );
  }
}

class _GenericDropdownField extends HookConsumerWidget {
  const _GenericDropdownField({
    required this.sessionId,
    required this.controller,
    required this.groupIndex,
    required this.filterIndex,
    required this.componentIdentifier,
    required this.width,
    required this.items,
  });

  final String sessionId;
  final TextEditingController controller;
  final int groupIndex;
  final int filterIndex;
  final String componentIdentifier;
  final double width;
  final List<DropdownItem<dynamic>> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialValue = useMemoized(
      () {
        final text = controller.text;
        if (text.isEmpty) {
          return null;
        }
        // Try to find the item by its string representation
        final item = items.firstWhereOrNull(
          (item) {
            // Handle enum values
            if (item.value is Enum) {
              return (item.value as Enum).name == text;
            }
            return item.value.toString() == text;
          },
        );
        return item?.label;
      },
      [controller.text],
    );

    return NextDropdownMenu<String>(
      width: width,
      readOnly: false,
      isMandatory: true,
      initialValue: initialValue,
      onSelected: (selectedLabel) {
        if (selectedLabel == null) return;

        // Find the item by label to get its value
        final item = items.firstWhereOrNull((i) => i.label == selectedLabel);
        if (item != null) {
          // Store the enum name or string representation
          final valueToStore = item.value is Enum
              ? (item.value as Enum).name
              : item.value.toString();

          controller.text = valueToStore;

          ref
              .read(
                appTableFilterTempStateProvider(componentIdentifier, sessionId)
                    .notifier,
              )
              .updateFilterFieldValue(
                groupIndex,
                filterIndex,
                valueToStore,
              );
        }
      },
      dropdownMenuEntries: items
          .map(
            (item) => NextDropdownMenuEntry<String>(
              label: item.label,
              value: item.label, // Use label as the value for the dropdown
            ),
          )
          .toList(),
    );
  }
}

class _BoolValueView<T> extends HookConsumerWidget {
  const _BoolValueView({
    required this.fieldValue,
    required this.valueFocus,
    required this.sessionId,
    required this.availableFilterFields,
    required this.valueController,
    required this.groupIndex,
    required this.filterIndex,
    required this.filterLength,
    required this.componentIdentifier,
    required this.operatorValue,
    required this.typeValue,
    required this.typeFocus,
    required this.width,
    required this.filterField,
    super.key,
  });
  final ValueNotifier<T?> fieldValue;
  final FocusNode valueFocus;
  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final TextEditingController valueController;
  final int groupIndex;
  final int filterIndex;
  final int filterLength;
  final String componentIdentifier;
  final FilterOperator? operatorValue;
  final ValueNotifier<FilterType?> typeValue;
  final FocusNode typeFocus;
  final double width;
  final FilterField filterField;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return NextDropdownMenu<bool>(
      initialValue:
          filterField.value == 'true' ? l10n.gen_true : l10n.gen_false,
      isMandatory: true,
      focusNode: valueFocus,
      onSelected: (value) {
        if (value == null) return;

        ref
            .read(
              appTableFilterTempStateProvider(componentIdentifier, sessionId)
                  .notifier,
            )
            .updateFilterFieldValue(
              groupIndex,
              filterIndex,
              value.toString(),
            );

        // final currentValue = filterFieldNotifier.value;
        // final newValue = currentValue.copyWith(value: value.toString());
        // filterFieldNotifier.value = newValue;
        // ref
        //     .read(
        //       appTableFilterStateProvider(tableType, sessionId).notifier,
        //     )
        //     .updateQuickSearchFilter(
        //       newValue,
        //     );
      },
      // onSubmittedNotOpenWithValue: () {
      //   final isLast = filterIndex == filterLength - 1;
      //   if (isLast) {
      //     final firstField = availableFilterFields.values.first;
      //     final fieldEnum = availableFilterFields.keys.first;
      //     ref
      //         .read(
      //           appTableFilterTempStateProvider(
      //             tableType,
      //             sessionId,
      //           ).notifier,
      //         )
      //         .addFilterField(
      //           0,
      //           fieldEnum.toString(),
      //           firstField.filterTypes.first,
      //           firstField.fieldType,
      //         );
      //   }
      // },
      readOnly: false,

      focusOrderId: 10,
      width: width,

      hintText: l10n.table_filter_condition,
      dropdownMenuEntries: [
        NextDropdownMenuEntry<bool>(
          label: l10n.gen_true,
          value: true,
        ),
        NextDropdownMenuEntry<bool>(
          label: l10n.gen_false,
          value: false,
        ),
      ],
    );
  }
}
