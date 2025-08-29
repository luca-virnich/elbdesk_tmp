import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_field_view.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_operator_view.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_type_view.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_value_view.dart';
import 'package:flutter/widgets.dart';

class FilterFieldView<T> extends HookConsumerWidget {
  /// FilterFieldView constructor
  const FilterFieldView({
    required this.filterField,
    required this.availableFilterFields,
    required this.groupIndex,
    required this.filterIndex,
    required this.sessionId,
    required this.componentIdentifier,
    required this.filterLength,
    required this.formKey,
    required this.close,
    this.dropdownFilterItems,
    super.key,
  });

  /// FilterField
  /// The filter field which we want to show
  final FilterField filterField;

  /// Available Filter Fields
  final Map<T, TableFieldData> availableFilterFields;

  /// Dropdown filter items for fields that use dropdowns
  final Map<T, List<DropdownItem<dynamic>>>? dropdownFilterItems;

  /// @nodoc

  /// @nodoc
  final int groupIndex;

  /// @nodoc
  final int filterIndex;

  /// @nodoc
  final String sessionId;

  /// The type of the table
  final String componentIdentifier;

  /// @nodoc
  final int filterLength;

  /// @nodoc
  final GlobalKey<FormState> formKey;

  /// @nodoc
  final VoidCallback close;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    final initialField = useMemoized(
      () => availableFilterFields.entries.firstWhere(
        (entry) => entry.key.toString() == filterField.fieldKey,
      ),
      [],
    );

    final dateValueController = useTextEditingController(
      text: filterField.fieldType == FilterFieldType.date
          ? Parser.parseIsoDateToReadable(
                filterField.value,
                l10n.localeName,
              ) ??
              ''
          : '',
    );

    final fieldFocus = useFocusNode();
    final fieldValue = useState<T?>(initialField.key);
    final fieldController =
        useTextEditingController(text: initialField.value.readable);
    final typeFocus = useFocusNode();
    final typeValue = useState<FilterType?>(filterField.type);
    final typeController =
        useTextEditingController(text: filterField.type.readable(l10n));

    // Value, the text input what the users is looking for
    final valueFocus = useFocusNode();
    final valueController = useTextEditingController(text: filterField.value);

    final operatorFocous = useFocusNode();
    final operatorValue = useState<FilterOperator?>(filterField.filterOperator);
    final operatorController =
        useTextEditingController(text: filterField.filterOperator.toString());

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;
        const operatorWidth = 154.0;
        const conditionTypeWidth = 154.0;
        const spacing = 8.0;
        final remainingWidth =
            maxWidth - operatorWidth - conditionTypeWidth - spacing * 3;
        const minFieldWidth = 100.0;
        const minValueWidth = 100.0;

        // Check if we need to wrap
        final isWrapped = maxWidth <
            (operatorWidth +
                conditionTypeWidth +
                minFieldWidth +
                minValueWidth +
                spacing * 3);

        // Adjust field and value widths based on wrapping
        final fieldWidth = isWrapped
            ? (maxWidth - spacing) / 2
            : (remainingWidth / 2).clamp(minFieldWidth, double.infinity);
        final valueWidth = isWrapped
            ? (maxWidth - spacing) / 2
            : (remainingWidth / 2).clamp(minValueWidth, double.infinity);

        return FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Wrap(
              spacing: spacing,
              runSpacing: 8,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: operatorWidth,
                    maxWidth: operatorWidth,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FilterFieldOperatorView(
                      filterField: filterField,
                      width: operatorWidth,
                      fieldFocus: fieldFocus,
                      operatorController: operatorController,
                      focusNode: operatorFocous,
                      operatorValue: operatorValue,
                      filterIndex: filterIndex,
                      filterLength: filterLength,
                      sessionId: sessionId,
                      componentIdentifier: componentIdentifier,
                      groupIndex: groupIndex,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: minFieldWidth,
                    maxWidth: fieldWidth,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FilterFieldFieldView(
                      typeController: typeController,
                      width: fieldWidth,
                      valueController: valueController,
                      dateValueController: dateValueController,
                      fieldValue: fieldValue,
                      typeValue: typeValue,
                      typeFocus: typeFocus,
                      fieldController: fieldController,
                      fieldFocus: fieldFocus,
                      sessionId: sessionId,
                      groupIndex: groupIndex,
                      availableFilterFields: availableFilterFields,
                      componentIdentifier: componentIdentifier,
                      filterIndex: filterIndex,
                      operatorFocus: operatorFocous,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: conditionTypeWidth,
                    maxWidth: conditionTypeWidth,
                    // minHeight: lineHeight,
                    // maxHeight: lineHeight,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FilterFieldTypeView(
                      width: conditionTypeWidth,
                      fieldFocus: fieldFocus,
                      filterField: filterField,
                      fieldValue: fieldValue,
                      typeController: typeController,
                      typeValue: typeValue,
                      valueController: valueController,
                      valueFocus: valueFocus,
                      focusNode: typeFocus,
                      sessionId: sessionId,
                      groupIndex: groupIndex,
                      filterIndex: filterIndex,
                      componentIdentifier: componentIdentifier,
                      availableFilterFields: availableFilterFields,
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: minValueWidth,
                    maxWidth: valueWidth,
                    // minHeight: lineHeight,
                    // maxHeight: lineHeight,
                  ),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: FilterFieldValueView(
                      width: valueWidth,
                      filterField: filterField,
                      formKey: formKey,
                      close: close,
                      dateValueController: dateValueController,
                      fieldValue: fieldValue,
                      sessionId: sessionId,
                      groupIndex: groupIndex,
                      filterIndex: filterIndex,
                      filterLength: filterLength,
                      componentIdentifier: componentIdentifier,
                      availableFilterFields: availableFilterFields,
                      dropdownFilterItems: dropdownFilterItems,
                      typeFocus: typeFocus,
                      operatorValue: operatorValue.value,
                      typeValue: typeValue,
                      valueController: valueController,
                      valueFocus: valueFocus,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
