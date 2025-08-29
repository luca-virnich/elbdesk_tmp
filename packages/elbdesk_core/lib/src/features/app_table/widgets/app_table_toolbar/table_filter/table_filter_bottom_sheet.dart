import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_field_view.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_operator_view.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_type_view.dart';
import 'package:elbdesk_core/src/features/app_table/widgets/app_table_toolbar/table_filter/filter_field_view/filter_field_value_view.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';

class TableFilterBottomSheetContent<T> extends HookConsumerWidget {
  const TableFilterBottomSheetContent({
    required this.sessionId,
    required this.availableFilterFields,
    required this.componentIdentifier,
    super.key,
  });

  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final String componentIdentifier;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Calculate keyboard height by subtracting safe area from total bottom inset

    final filter = ref
        .watch(appTableFilterTempStateProvider(componentIdentifier, sessionId));

    final isInitialized = useState(false);
    useEffect(
      () {
        if (filter.filterGroups.isEmpty ||
            filter.filterGroups[0].filters.isEmpty) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            final firstField = availableFilterFields.values.first;
            final fieldEnum = availableFilterFields.keys.first;
            ref
                .read(
                  appTableFilterTempStateProvider(
                    componentIdentifier,
                    sessionId,
                  ).notifier,
                )
                .initEmptyFilter(
                  fieldEnum.toString(),
                  firstField.filterTypes.first,
                  firstField.fieldType,
                );
            isInitialized.value = true;
          });
        } else {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            isInitialized.value = true;
          });
        }
        return null;
      },
      [],
    );

    final formKey = useMemoized(GlobalKey<FormState>.new, []);
    final scrollController = useScrollController();

    return !isInitialized.value
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: AppScrollbar(
                    controller: scrollController,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final (groupIndex, group)
                              in filter.filterGroups.indexed)
                            _FilterGroupView(
                              filterGroup: group,
                              availableFilterFields: availableFilterFields,
                              sessionId: sessionId,
                              formKey: formKey,
                              groupIndex: groupIndex,
                              componentIdentifier: componentIdentifier,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                const AppDivider(),
                _FilterActions(
                  componentIdentifier: componentIdentifier,
                  sessionId: sessionId,
                  formKey: formKey,
                  availableFilterFields: availableFilterFields,
                  scrollController: scrollController,
                ),
              ],
            ),
          );
  }
}

class _FilterGroupView<T> extends ConsumerWidget {
  const _FilterGroupView({
    required this.filterGroup,
    required this.availableFilterFields,
    required this.sessionId,
    required this.groupIndex,
    required this.formKey,
    required this.componentIdentifier,
  });

  final FilterGroup filterGroup;
  final Map<T, TableFieldData> availableFilterFields;
  final String componentIdentifier;
  final String sessionId;
  final int groupIndex;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (filterIndex, filter) in filterGroup.filters.indexed)
          _MobileFilterFieldView<T>(
            key: ValueKey(filter.uuid),
            groupIndex: groupIndex,
            formKey: formKey,
            filterField: filter,
            filterLength: filterGroup.filters.length,
            componentIdentifier: componentIdentifier,
            sessionId: sessionId,
            filterIndex: filterIndex,
            availableFilterFields: availableFilterFields,
          ),
      ],
    );
  }
}

class _MobileFilterFieldView<T> extends HookConsumerWidget {
  const _MobileFilterFieldView({
    required this.filterField,
    required this.availableFilterFields,
    required this.groupIndex,
    required this.filterIndex,
    required this.sessionId,
    required this.componentIdentifier,
    required this.filterLength,
    required this.formKey,
    super.key,
  });

  final FilterField filterField;
  final Map<T, TableFieldData> availableFilterFields;
  final int groupIndex;
  final int filterIndex;
  final String sessionId;
  final String componentIdentifier;
  final int filterLength;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: context.appTheme.generalColors.background
                .withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(AppSpace.m),
          ),
          padding: const EdgeInsets.all(UiConstants.defaultPadding),
          child: _MobileOptimizedFilterFieldView<T>(
            filterField: filterField,
            availableFilterFields: availableFilterFields,
            groupIndex: groupIndex,
            filterIndex: filterIndex,
            sessionId: sessionId,
            componentIdentifier: componentIdentifier,
            filterLength: filterLength,
            formKey: formKey,
            close: () => Navigator.of(context).pop(),
          ),
        ),
        const SizedBox(height: AppSpace.m),
      ],
    );
  }
}

class _FilterActions<T> extends ConsumerWidget {
  const _FilterActions({
    required this.componentIdentifier,
    required this.sessionId,
    required this.formKey,
    required this.availableFilterFields,
    required this.scrollController,
  });

  final String componentIdentifier;
  final String sessionId;
  final GlobalKey<FormState> formKey;
  final Map<T, TableFieldData> availableFilterFields;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.all(UiConstants.defaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add new filter button
          SizedBox(
            child: AppButton.secondary(
              onPressed: () {
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

                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                });
              },
              iconData: AppIcons.add,
              label: l10n.table_filter_add,
            ),
          ),
          const SizedBox(height: AppSpace.m),
          // Action buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Delete all filters
              AppButton.danger(
                iconData: AppIcons.delete_sweep,
                onPressed: () {
                  ref
                      .read(
                        appTableFilterStateProvider(
                          componentIdentifier,
                          sessionId,
                        ).notifier,
                      )
                      .updateFilter(
                        Filter(filterGroups: []),
                      );
                  Navigator.of(context).pop();
                },
                label: l10n.gen_delete_all,
              ),
              const SizedBox(width: AppSpace.m),
              // Apply filter
              Expanded(
                child: AppButton.primary(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();

                    if (isValid ?? false) {
                      final tempFilter = ref.read(
                        appTableFilterTempStateProvider(
                          componentIdentifier,
                          sessionId,
                        ),
                      );

                      ref
                          .read(
                            appTableFilterStateProvider(
                              componentIdentifier,
                              sessionId,
                            ).notifier,
                          )
                          .updateFilter(
                            tempFilter,
                          );
                      Navigator.of(context).pop();
                    }
                  },
                  label: l10n.gen_apply,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Mobile-optimized filter field view with vertical layout
class _MobileOptimizedFilterFieldView<T> extends HookConsumerWidget {
  const _MobileOptimizedFilterFieldView({
    required this.filterField,
    required this.availableFilterFields,
    required this.groupIndex,
    required this.filterIndex,
    required this.sessionId,
    required this.componentIdentifier,
    required this.filterLength,
    required this.formKey,
    required this.close,
    super.key,
  });

  final FilterField filterField;
  final Map<T, TableFieldData> availableFilterFields;
  final int groupIndex;
  final int filterIndex;
  final String sessionId;
  final String componentIdentifier;
  final int filterLength;
  final GlobalKey<FormState> formKey;
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

    final valueFocus = useFocusNode();
    final valueController = useTextEditingController(text: filterField.value);

    final operatorFocus = useFocusNode();
    final operatorValue = useState<FilterOperator?>(filterField.filterOperator);
    final operatorController =
        useTextEditingController(text: filterField.filterOperator.toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Operator (AND/OR) - full width for mobile
        if (filterIndex > 0) ...[
          FilterFieldOperatorView(
            filterField: filterField,
            width: double.infinity,
            fieldFocus: fieldFocus,
            operatorController: operatorController,
            focusNode: operatorFocus,
            operatorValue: operatorValue,
            filterIndex: filterIndex,
            filterLength: filterLength,
            sessionId: sessionId,
            componentIdentifier: componentIdentifier,
            groupIndex: groupIndex,
          ),
          const SizedBox(height: AppSpace.m),
        ],
        // Field selection - full width
        FilterFieldFieldView(
          typeController: typeController,
          width: double.infinity,
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
          operatorFocus: operatorFocus,
        ),
        const SizedBox(height: AppSpace.m),
        // Condition Type - full width
        FilterFieldTypeView(
          width: double.infinity,
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
        const SizedBox(height: AppSpace.m),
        // Value field - full width
        FilterFieldValueView(
          width: double.infinity,
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
          typeFocus: typeFocus,
          operatorValue:
              filterIndex > 0 ? operatorValue.value : FilterOperator.and,
          typeValue: typeValue,
          valueController: valueController,
          valueFocus: valueFocus,
        ),
      ],
    );
  }
}
