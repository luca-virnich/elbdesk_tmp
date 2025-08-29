part of 'quick_search_filter.dart';

class _Value<T> extends HookConsumerWidget {
  const _Value({
    required this.width,
    required this.componentIdentifier,
    required this.sessionId,
    required this.availableFilterFields,
    required this.quickSearchFilterFieldValue,
    required this.valueController,
    required this.valueFocus,
    required this.formKey,
    required this.enableAutofocus,
    // required this.typeFocus,

    super.key,
  });
  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;
  final ValueNotifier<FilterField?> quickSearchFilterFieldValue;

  final TextEditingController valueController;
  final FocusNode valueFocus;
  final GlobalKey<FormState> formKey;
  final double width;
  final bool enableAutofocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      child: _FilterValueInputField(
        formKey: formKey,
        valueController: valueController,
        componentIdentifier: componentIdentifier,
        sessionId: sessionId,
        availableFilterFields: availableFilterFields,
        quickSearchFilterFieldValue: quickSearchFilterFieldValue,
        valueFocus: valueFocus,
        enableAutofocus: enableAutofocus,
      ),
    );
  }
}

class _FilterValueInputField<T> extends HookConsumerWidget {
  const _FilterValueInputField({
    required this.formKey,
    required this.valueController,
    required this.valueFocus,
    required this.componentIdentifier,
    required this.sessionId,
    required this.availableFilterFields,
    required this.quickSearchFilterFieldValue,
    required this.enableAutofocus,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController valueController;
  final FocusNode valueFocus;
  final String componentIdentifier;
  final String sessionId;
  final Map<T, TableFieldData> availableFilterFields;

  final ValueNotifier<FilterField?> quickSearchFilterFieldValue;
  final bool enableAutofocus;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorColor = context.appTheme.buttonStyles.danger.foregroundColor;
    final disabledColor =
        context.appTheme.buttonStyles.secondary.foregroundColorDisabled;

    useEffect(
      () {
        if (enableAutofocus) {
          valueFocus.requestFocus();
        }
        return null;
      },
      [],
    );

    return NextTextFormField(
      hideClearButton: true,
      hideCopyButton: true,
      suffix: ValueListenableBuilder(
        valueListenable: valueController,
        builder: (context, value, child) {
          final isEmpty = value.text.trim().isEmpty;
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIconButton(
                skipTraversal: true,
                iconData: AppIcons.search,
                onPressed: isEmpty
                    ? null
                    : () {
                        final currentFilter =
                            quickSearchFilterFieldValue.value!;

                        final newFilter = currentFilter.copyWith(
                          value: valueController.text.trim(),
                        );
                        quickSearchFilterFieldValue.value = newFilter;

                        ref
                            .read(
                              appTableFilterStateProvider(
                                      componentIdentifier, sessionId)
                                  .notifier,
                            )
                            .updateQuickSearchFilter(
                              newFilter,
                            );
                      },
              ),
              AnimatedContainer(
                width: isEmpty ? 0 : 20,
                duration: AnimationConstants.defaultDuration,
                child: Offstage(
                  offstage: isEmpty,
                  child: AppIconButton(
                    skipTraversal: true,
                    iconData: AppIcons.cancel,
                    color: disabledColor,
                    colorOnHover: errorColor,
                    onPressed: () {
                      valueController.clear();
                      ref
                          .read(
                            appTableFilterStateProvider(
                                    componentIdentifier, sessionId)
                                .notifier,
                          )
                          .clearFilter();
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: AppSpace.xs,
              ),
            ],
          );
        },
      ),
      validator: (p0) {
        return null;
      },
      onFieldSubmitted: (v) {
        final isEmpty = v.trim().isEmpty;
        if (isEmpty) {
          ref
              .read(
                appTableFilterStateProvider(componentIdentifier, sessionId)
                    .notifier,
              )
              .clearFilter();
          return;
        }
        final currentFilter = quickSearchFilterFieldValue.value!;

        final newFilter = currentFilter.copyWith(value: v.trim());
        quickSearchFilterFieldValue.value = newFilter;

        ref
            .read(
              appTableFilterStateProvider(componentIdentifier, sessionId)
                  .notifier,
            )
            .updateQuickSearchFilter(
              newFilter,
            );
      },
      controller: valueController,
      focusNode: valueFocus,
    );
  }
}
