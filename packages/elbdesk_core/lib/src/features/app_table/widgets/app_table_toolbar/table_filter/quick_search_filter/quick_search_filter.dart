import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

part 'quick_search_filter_field.dart';
part 'quick_search_filter_value.dart';

/// Quick Search Filter for Table Views
///
/// We want only show/enable this when:
/// 1. We have a no or a single filter active
/// 2. The single filter is a iLike filter
class QuickSearchFilter<T> extends HookConsumerWidget {
  /// @nodoc
  const QuickSearchFilter({
    required this.componentIdentifier,
    required this.sessionId,
    required this.availableFilterFields,
    required this.tableDensity,
    this.enableAutofocus = true,
    super.key,
  });
  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final AppTableDensity tableDensity;
  final bool enableAutofocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final invalidField = useState<bool>(false);

    // enable area:
    final enableArea = ref.watch(
      appTableFilterStateProvider(componentIdentifier, sessionId).select(
        (filter) {
          // filter is null, no filter active, area is active
          if (filter == null) return true;
          // filter is not null, filter is empty, area is active
          if (filter.filterGroups.isEmpty) return true;
          // filter is not null, filter is not empty, filter is empty,
          //area is active
          if (filter.filterGroups.first.filters.isEmpty) return true;
          // multipe filters?
          if (filter.filterGroups.first.filters.length > 1) return false;
          // filter is not null, filter is not empty, filter is not empty,
          // filter is not a iLike filter, area is not active
          if (filter.filterGroups.first.filters.first.type ==
              FilterType.iLike) {
            return true;
          }
          return false;
        },
      ),
    );

    // hiding the area
    if (availableFilterFields.isEmpty || !enableArea) {
      return const SizedBox.shrink();
    }

    final formKey = useMemoized(GlobalKey<FormState>.new, []);

    // we are getting the first filter field, this can be null/empt
    final firstFilterField = ref.watch(
      appTableFilterStateProvider(componentIdentifier, sessionId).select(
        (filter) {
          if (filter == null) return null;
          if (filter.filterGroups.isEmpty) return null;
          if (filter.filterGroups.first.filters.isEmpty) return null;
          return filter.filterGroups.first.filters.first;
        },
      ),
    );
    final valueController = useTextEditingController();
    final fieldController = useTextEditingController();

// we dont want to update the main state of the filter directly,
// only when submitting the filter, so we have to use a value notifier
// for local state
    final quickSearchFilterField = useState<FilterField?>(
      null,
    );

    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (firstFilterField == null) {
            quickSearchFilterField.value = FilterField(
              uuid: const Uuid().v4(),
              fieldKey: availableFilterFields.keys.first.toString(),
              value: '',
              type: FilterType.iLike,
              filterOperator: FilterOperator.and,
              fieldType: FilterFieldType.text,
            );
            // get first readable field name
            final firstField = availableFilterFields.entries.first.value;
            fieldController.text = firstField.readable;

            valueController.text = '';
            invalidField.value = false;
          } else {
            quickSearchFilterField.value = firstFilterField;
            // get readable field name
            final selectedField = availableFilterFields.entries
                .firstWhereOrNull(
                  (entry) => entry.key.toString() == firstFilterField.fieldKey,
                )
                ?.value;
            if (selectedField == null) {
              invalidField.value = true;
              return;
            } else {
              invalidField.value = false;
            }
            fieldController.text = selectedField.readable;
            valueController.text = firstFilterField.value;
          }
        });
        return null;
      },
      [firstFilterField],
    );
    // return Container(
    //   width: 100,
    //   height: 20,
    //   color: Colors.red,
    // );

    if (quickSearchFilterField.value == null || invalidField.value) {
      return const SizedBox.shrink();
    }

    final valueFocus = useFocusNode();

    return Form(
      key: formKey,
      child: Align(
        alignment: Alignment.centerRight,
        child: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 200,
                child: _Field<T>(
                  valueFocus: valueFocus,
                  quickSearchFilterField: quickSearchFilterField,
                  valueController: valueController,
                  width: 200,
                  fieldController: fieldController,
                  availableFilterFields: availableFilterFields,
                  componentIdentifier: componentIdentifier,
                  sessionId: sessionId,
                ),
              ),
              const SizedBox(
                width: UiConstants.defaultPadding / 2,
              ),
              SizedBox(
                width: 200,
                child: _Value<T>(
                  valueFocus: valueFocus,
                  width: 200,
                  componentIdentifier: componentIdentifier,
                  sessionId: sessionId,
                  availableFilterFields: availableFilterFields,
                  quickSearchFilterFieldValue: quickSearchFilterField,
                  valueController: valueController,
                  formKey: formKey,
                  enableAutofocus: enableAutofocus,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Date Filter for Table Views
class FilterDateSelector<T> extends HookConsumerWidget {
  /// @nodoc
  const FilterDateSelector({
    required this.focusNode,
    required this.width,
    required this.filterFieldNotifier,
    required this.tableType,
    required this.sessionId,
    required this.typeFocus,
    required this.formKey,
    required this.valueController,
    required this.dateValueController,
    required this.availableFilterFields,
    super.key,
  });
  final FocusNode focusNode;
  final double width;
  final ValueNotifier<FilterField> filterFieldNotifier;
  final String tableType;
  final String sessionId;
  final FocusNode typeFocus;
  final GlobalKey<FormState> formKey;
  final TextEditingController valueController;
  final TextEditingController dateValueController;
  final Map<T, TableFieldData> availableFilterFields;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilterIsEmpty = ref.watch(
      appTableFilterStateProvider(tableType, sessionId)
          .select((value) => value?.filterGroups.isEmpty ?? true),
    );

    final l10n = context.l10n;
    final disabledColor =
        context.appTheme.textFieldProperties.disabledBorderColor;
    final removeFilterColor = context.appTheme.generalColors.danger;
    final searchColor = context.appTheme.generalColors.primary;
    final selectedDate = useRef<DateTime?>(null);
    return AppTextFormField(
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIconButton(
            icon: const Icon(AppIcons.search),
            color: searchColor,
            onPressed: () {
              final isValid = formKey.currentState?.validate() ?? false;

              if (!isValid) return;
              final currentValue = filterFieldNotifier.value;
              final newValue =
                  currentValue.copyWith(value: valueController.text.trim());
              filterFieldNotifier.value = newValue;
              ref
                  .read(
                    appTableFilterStateProvider(tableType, sessionId).notifier,
                  )
                  .updateQuickSearchFilter(
                    newValue,
                  );
            },
          ),
          AppIconButton(
            icon: Icon(
              AppIcons.close,
              color: currentFilterIsEmpty ? disabledColor : removeFilterColor,
            ),
            onPressed: () {
              ref
                  .read(
                    appTableFilterStateProvider(tableType, sessionId).notifier,
                  )
                  .clearFilter();
              valueController.text = '';
            },
          ),
        ],
      ),
      labelPosition: NextCardFormFieldLabelPosition.top,

      hintText: l10n.table_filter_value,
      errorMessagePosition: TextFieldErrorMessagePosition.none,
      inputFormatters: const [],
      validator: (p0) {
        final field = filterFieldNotifier.value.fieldKey;

        if (field.isEmpty) {
          return l10n.table_filter_validator_field;
        }

        if (selectedDate.value == null) {
          return l10n.validation_invalid_date;
        }
        return null;
      },
      onFieldSubmitted: (v) {
        final parsedDate = AppValidator.parseDateInput(v);

        selectedDate.value = parsedDate;
        if (parsedDate != null) {
          final readableDate = parsedDate.toDate(context.l10n.localeName);
          valueController.text = readableDate;
          dateValueController.text = readableDate;
        }

        final isValid = formKey.currentState?.validate() ?? false;

        if (!isValid || parsedDate == null) return;
        final currentValue = filterFieldNotifier.value;
        final newValue =
            currentValue.copyWith(value: parsedDate.toIso8601String());
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
      controller: dateValueController,
      focusNode: focusNode,
    );
  }
}

/// Boolean Filter for Table Views
class FilterBoolSelector extends HookConsumerWidget {
  /// @nodoc
  const FilterBoolSelector({
    required this.focusNode,
    required this.width,
    required this.filterFieldNotifier,
    required this.tableType,
    required this.sessionId,
    required this.typeFocus,
    required this.formKey,
    super.key,
  });
  final FocusNode focusNode;
  final double width;
  final ValueNotifier<FilterField> filterFieldNotifier;
  final String tableType;
  final String sessionId;
  final FocusNode typeFocus;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = useRef<bool?>(null);
    final l10n = context.l10n;
    final currentFilter =
        ref.watch(appTableFilterStateProvider(tableType, sessionId));
    final searchColor = context.appTheme.generalColors.primary;
    final disabledColor =
        context.appTheme.textFieldProperties.disabledBorderColor;
    final removeFilterColor = context.appTheme.generalColors.danger;
    return AppDropdownMenu<bool>(
      suffixIcon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppIconButton(
            icon: const Icon(AppIcons.search),
            color: searchColor,
            onPressed: () {
              final isValid = formKey.currentState?.validate() ?? false;

              if (!isValid) return;
              final currentValue = filterFieldNotifier.value;
              final newValue =
                  currentValue.copyWith(value: selection.value.toString());
              filterFieldNotifier.value = newValue;
              ref
                  .read(
                    appTableFilterStateProvider(tableType, sessionId).notifier,
                  )
                  .updateQuickSearchFilter(
                    newValue,
                  );
            },
          ),
          AppIconButton(
            icon: Icon(
              AppIcons.close,
              color: currentFilter?.filterGroups.isEmpty ?? true
                  ? disabledColor
                  : removeFilterColor,
            ),
            onPressed: () {
              ref
                  .read(
                    appTableFilterStateProvider(tableType, sessionId).notifier,
                  )
                  .clearFilter();
              selection.value = null;
            },
          ),
        ],
      ),
      showCopyButton: false,
      isMandatory: true,
      focusNode: focusNode,
      onSelected: (value) {
        selection.value = value;
        final currentValue = filterFieldNotifier.value;
        final newValue = currentValue.copyWith(value: value.toString());
        filterFieldNotifier.value = newValue;
        ref
            .read(
              appTableFilterStateProvider(tableType, sessionId).notifier,
            )
            .updateQuickSearchFilter(
              newValue,
            );
      },
      readOnly: false,
      previousFocusNode: typeFocus,
      focusOrderId: 10,
      width: width,
      labelPosition: NextCardFormFieldLabelPosition.top,
      errorMessagePosition: TextFieldErrorMessagePosition.none,
      initialSelection: filterFieldNotifier.value.value == 'true',
      hintText: l10n.table_filter_condition,
      dropdownMenuEntries: [
        AppDropdownMenuEntry<bool>(
          label: l10n.gen_true,
          value: true,
        ),
        AppDropdownMenuEntry<bool>(
          label: l10n.gen_false,
          value: false,
        ),
      ],
    );
  }
}
