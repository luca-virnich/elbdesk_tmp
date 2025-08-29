part of 'quick_search_filter.dart';

class _Field<T> extends HookConsumerWidget {
  const _Field({
    required this.fieldController,
    required this.availableFilterFields,
    required this.componentIdentifier,
    required this.sessionId,
    required this.width,
    required this.valueController,
    required this.quickSearchFilterField,
    required this.valueFocus,
    super.key,
  });

  final TextEditingController fieldController;

  final TextEditingController valueController;

  final Map<T, TableFieldData> availableFilterFields;
  final String componentIdentifier;
  final String sessionId;
  final FocusNode valueFocus;
  final double width;
  final ValueNotifier<FilterField?> quickSearchFilterField;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final field = availableFilterFields.entries.firstWhere(
      (entry) => entry.key.toString() == quickSearchFilterField.value!.fieldKey,
    );

    final l10n = context.l10n;
    final focusNode = useFocusNode();
    return SizedBox(
      width: width,
      child: ElbFocusOrderWrapper(
        focusOrderId: 1,
        child: NextDropdownMenu<TableFieldData>(
          readOnly: false,
          focusNode: focusNode,
          initialValue: field.value.readable,
          width: width,
          controller: fieldController,
          hintText: l10n.table_filter_field,
          isMandatory: true,
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
            if (value == null) return;

            final selectedKey = availableFilterFields.entries
                .firstWhere((entry) => entry.value == value)
                .key;
            final currentKey = quickSearchFilterField.value!.fieldKey;
            if (currentKey == selectedKey.toString()) return;

            quickSearchFilterField.value = FilterField(
              uuid: const Uuid().v4(),
              fieldKey: selectedKey.toString(),
              value: '',
              type: FilterType.iLike,
              filterOperator: FilterOperator.and,
              fieldType: value.fieldType,
            );
            final currentValue = valueController.text;
            if (currentValue == '') {
              return;
            }
            valueController.clear();
            ref
                .read(
                  appTableFilterStateProvider(componentIdentifier, sessionId)
                      .notifier,
                )
                .clearFilter();
            FocusScope.of(context).requestFocus(valueFocus);
          },
        ),
      ),
    );
  }
}
