import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterValueInputField extends ConsumerWidget {
  const FilterValueInputField({
    required this.filterFieldNotifier,
    required this.formKey,
    required this.valueController,
    // required this.valueFocus,
    required this.tableType,
    required this.sessionId,
    required this.availableFilterFields,
    super.key,
  });
  final ValueNotifier<FilterField> filterFieldNotifier;
  final GlobalKey<FormState> formKey;
  final TextEditingController valueController;
  // final FocusNode valueFocus;
  final String tableType;
  final String sessionId;
  final Map<dynamic, TableFieldData> availableFilterFields;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentFilterIsEmpty = ref.watch(
    //   appTableFilterStateProvider(tableType, sessionId)
    //       .select((value) => value?.filterGroups.isEmpty ?? true),
    // );

    final l10n = context.l10n;
    // final disabledColor = context.appColors.textFields.disabledBorderColor;
    // final removeFilterColor = context.appTheme.tableProperties.error;
    // final searchColor = context.appColors.primary;

    final filterFieldType = filterFieldNotifier.value.fieldType;
    return NextTextFormField(
      // suffixIcon: Row(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     AppIconButton(
      //       icon: const Icon(AppIcons.search),
      //       color: searchColor,
      //       onPressed: () {
      //         final isValid = formKey.currentState?.validate() ?? false;

      //         if (!isValid) return;
      //         final currentValue = filterFieldNotifier.value;
      //         final newValue =
      //             currentValue.copyWith(value: valueController.text.trim());
      //         filterFieldNotifier.value = newValue;
      //         ref
      //             .read(
      //        appTableFilterStateProvider(tableType, sessionId).notifier,
      //             )
      //             .updateQuickSearchFilter(
      //               newValue,
      //             );
      //       },
      //     ),
      //     AppIconButton(
      //       icon: Icon(
      //         AppIcons.close,
      //    color: currentFilterIsEmpty ? disabledColor : removeFilterColor,
      //       ),
      //       onPressed: () {
      //         ref
      //             .read(
      //          appTableFilterStateProvider(tableType, sessionId).notifier,
      //             )
      //             .clearFilter();
      //         valueController.text = '';
      //       },
      //     ),
      //   ],
      // ),
      // labelPosition: AppTextFieldLabelPosition.top,

      // hintText: l10n.table_filter_value,
      // errorMessagePosition: TextFieldErrorMessagePosition.none,
      inputFormatters: [
        if (filterFieldType == FilterFieldType.number)
          AppInputFormatters.onlyDigitsAndSingleDecimal(
            maxDecimalPlaces: null,
          ),
        if (filterFieldType == FilterFieldType.text)
          AppInputFormatters.noStartingSpace,
      ],
      validator: (p0) {
        final field = filterFieldNotifier.value.fieldKey;

        if (field.isEmpty) {
          return l10n.table_filter_validator_field;
        }

        final currentField = availableFilterFields.entries
            .firstWhere(
              (entry) =>
                  entry.key.toString() == filterFieldNotifier.value.fieldKey,
            )
            .key;

        final fieldType = availableFilterFields[currentField]!.fieldType;
        if (fieldType == FilterFieldType.number) {
          return AppValidator.isValidDouble(valueController.text)
              ? null
              : l10n.gen_invalid_number;
        }
        if (fieldType == FilterFieldType.date) {
          final isoString = filterFieldNotifier.value.value;

          return AppValidator.isValidDate(isoString)
              ? null
              : l10n.validation_invalid_date;
        }
        return null;

        // TODO(tk): Fix this
        // ! FIXME removed the validation so like works

        // final validationString = availableFilterFields[currentField]!
        //     .validator!(valueController.text);

        // return validationString;
      },
      onFieldSubmitted: (v) {
        if (filterFieldType == FilterFieldType.date) {
          final parsedDate = AppValidator.parseDateInput(v);
          if (parsedDate != null) {
            valueController.text = parsedDate.toDate(context.l10n.localeName);
          } else {
            return;
          }
        }

        final isValid = formKey.currentState?.validate() ?? false;

        if (!isValid) return;
        final currentValue = filterFieldNotifier.value;
        final newValue = currentValue.copyWith(value: v.trim());
        filterFieldNotifier.value = newValue;
        ref
            .read(
              appTableFilterStateProvider(tableType, sessionId).notifier,
            )
            .updateQuickSearchFilter(
              newValue,
            );
      },
      // validator: selectedField.value != null ? field.value.validator
      controller: valueController,
      // focusNode: valueFocus,
    );
  }
}
