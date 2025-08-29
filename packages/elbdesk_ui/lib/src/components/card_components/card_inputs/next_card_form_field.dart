import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/components/dialogs/suggestion_intent_dialog.dart';
import 'package:elbdesk_ui/src/components/inputs/next_exclude_focus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum _FieldType {
  text,
  int,
  double,
  phone,
  email,
  website,
}

enum NextCardFormFieldLabelPosition {
  top,
  left,
}

class NextCardFormField extends StatelessWidget {
  const NextCardFormField.text({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.autovalidateMode,
    this.customErrorMessageNotifier,
    this.validationFieldId,
    this.hint,
    this.selectAllOnFocus = false,
    this.showLabel = true,
    super.key,
    this.outsideTrailingWidgets,
    this.validator,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.autofocus = false,
    this.hideCopyButton = false,
    this.maxLength,
    this.hideClearButton = false,
    this.suffix,
    this.focusOrder,
    this.textColor,
    this.initialText,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.suffixPadding,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.borderColor,
    this.excludeFocusTraversal = false,
  })  : initialDouble = null,
        initialInt = null,
        emptyWhenZero = true,
        allowZero = false,
        allowNegative = false,
        fractionsWhenDoubleDouble = 0,
        _fieldType = _FieldType.text,
        assert(
          (controller != null && initialText == null) ||
              (controller == null && initialText != null),
          'Either controller or initialValue must be provided, but not both',
        );

  NextCardFormField.int({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.onChanged,
    this.showLabel = true,
    this.controller,
    this.selectAllOnFocus = false,
    this.borderColor,
    this.hint,
    this.focusNode,
    this.validationFieldId,
    this.customErrorMessageNotifier,
    this.hideCopyButton = false,
    this.hideClearButton = false,
    super.key,
    this.outsideTrailingWidgets,
    this.suffix,
    this.emptyWhenZero = true,
    this.autofocus = false,
    this.textColor,
    this.validator,
    this.autovalidateMode,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
    this.initialInt,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.maxLength,
    this.floatingWindowFocus,
    this.textInputAction,
    this.allowNegative = false,
    this.allowZero = false,
    this.excludeFocusTraversal = false,
  })  : initialText = null,
        initialDouble = null,
        suffixPadding = null,
        fractionsWhenDoubleDouble = 0,
        maxLines = 1,
        minLines = null,
        inputFormatters = [
          if (!allowZero)
            AppInputFormatters.onlyDigitsNoLeadingZero(
              allowNegative: allowNegative,
            )
          else
            AppInputFormatters.onlyDigits(allowNegative: allowNegative),
        ],
        keyboardType = TextInputType.number,
        _fieldType = _FieldType.int;

  NextCardFormField.double({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.onChanged,
    this.emptyWhenZero = true,
    this.controller,
    this.focusNode,
    this.allowNegative = false,
    this.outsideTrailingWidgets,
    this.suffix,
    super.key,
    this.customErrorMessageNotifier,
    this.showLabel = true,
    this.fractionsWhenDoubleDouble = 2,
    this.hint,
    this.validationFieldId,
    this.borderColor,
    this.selectAllOnFocus = false,
    this.autofocus = false,
    this.validator,
    this.hideCopyButton = false,
    this.hideClearButton = false,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
    this.autovalidateMode,
    this.textInputAction,
    this.textColor,
    this.initialDouble,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.excludeFocusTraversal = false,
  })  : initialText = null,
        inputFormatters = [
          AppInputFormatters.onlyDigitsAndSingleDecimal(
            maxDecimalPlaces: fractionsWhenDoubleDouble,
            allowNegative: allowNegative,
          ),
        ],
        initialInt = null,
        suffixPadding = null,
        minLines = null,
        maxLength = null,
        maxLines = 1,
        keyboardType = null,
        _fieldType = _FieldType.double,
        allowZero = false,
        assert(
          (controller != null && initialDouble == null) ||
              (controller == null && initialDouble != null),
          'Either controller or initialValue must be provided, but not both',
        );

  const NextCardFormField.phone({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.outsideTrailingWidgets,
    super.key,
    this.customErrorMessageNotifier,
    this.hint,
    this.validationFieldId,
    this.showLabel = true,
    this.validator,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.autofocus = false,
    this.hideCopyButton = false,
    this.hideClearButton = false,
    this.suffix,
    this.selectAllOnFocus = false,
    this.borderColor,
    this.focusOrder,
    this.autovalidateMode,
    this.initialText,
    this.maxLines = 1,
    this.textInputAction,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.excludeFocusTraversal = false,
  })  : initialDouble = null,
        initialInt = null,
        emptyWhenZero = true,
        fractionsWhenDoubleDouble = 0,
        minLines = null,
        maxLength = null,
        suffixPadding = null,
        inputFormatters = null,
        keyboardType = null,
        textColor = null,
        _fieldType = _FieldType.phone,
        allowZero = false,
        allowNegative = false,
        assert(
          (controller != null && initialText == null) ||
              (controller == null && initialText != null),
          'Either controller or initialValue must be provided, but not both',
        );

  const NextCardFormField.website({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.borderColor,
    super.key,
    this.showLabel = true,
    this.validator,
    this.validationFieldId,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.outsideTrailingWidgets,
    this.selectAllOnFocus = false,
    this.autofocus = false,
    this.onClear,
    this.hideCopyButton = false,
    this.autovalidateMode,
    this.hideClearButton = false,
    this.focusOrder,
    this.customErrorMessageNotifier,
    this.initialText,
    this.hint,
    this.suffix,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.excludeFocusTraversal = false,
  })  : initialDouble = null,
        initialInt = null,
        emptyWhenZero = true,
        fractionsWhenDoubleDouble = 0,
        inputFormatters = null,
        allowNegative = false,
        suffixPadding = null,
        keyboardType = null,
        maxLength = null,
        textColor = null,
        _fieldType = _FieldType.website,
        allowZero = false,
        assert(
          (controller != null && initialText == null) ||
              (controller == null && initialText != null),
          'Either controller or initialValue must be provided, but not both',
        );

  const NextCardFormField.email({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.onChanged,
    this.controller,
    this.borderColor,
    this.hideCopyButton = false,
    this.hideClearButton = false,
    this.suffix,
    this.showLabel = true,
    this.focusNode,
    super.key,
    this.validationFieldId,
    this.outsideTrailingWidgets,
    this.validator,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
    this.initialText,
    this.textInputAction,
    this.selectAllOnFocus = false,
    this.autofocus = false,
    this.customErrorMessageNotifier,
    this.autovalidateMode,
    this.hint,
    this.maxLines = 1,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.floatingWindowFocus,
    this.excludeFocusTraversal = false,
  })  : initialDouble = null,
        initialInt = null,
        maxLength = null,
        textColor = null,
        minLines = null,
        suffixPadding = null,
        emptyWhenZero = true,
        fractionsWhenDoubleDouble = 0,
        allowNegative = false,
        inputFormatters = null,
        keyboardType = null,
        _fieldType = _FieldType.email,
        allowZero = false,
        assert(
          (controller != null && initialText == null) ||
              (controller == null && initialText != null),
          'Either controller or initialValue must be provided, but not both',
        );

  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final NextTextFormFieldErrorPosition errorPosition;
  final String? label;
  final NextCardFormFieldLabelPosition labelPosition;
  final void Function(String?)? onClear;
  final FocusNode? focusNode;
  final double? focusOrder;
  final bool readOnly;
  final String? initialText;
  final int? initialInt;
  final double? initialDouble;
  final String? validationGroup;
  final _FieldType _fieldType;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool emptyWhenZero;
  final int? maxLines;
  final List<Widget>? outsideTrailingWidgets;
  final bool showLabel;
  final String? hint;
  final Widget? suffix;
  final ValueNotifier<String?>? customErrorMessageNotifier;
  final String? validationFieldId;
  final int? minLines;
  final int fractionsWhenDoubleDouble;
  final bool selectAllOnFocus;
  final bool autofocus;
  final FieldSuggestion? fieldSuggestion;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;

  final bool hideCopyButton;
  final bool hideClearButton;
  final Color? borderColor;
  final Color? textColor;
  final AutovalidateMode? autovalidateMode;
  final bool allowZero;
  final int? maxLength;
  final bool allowNegative;
  final bool excludeFocusTraversal;
  final EdgeInsets? suffixPadding;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    final localName = context.l10n.localeName;

    final localInputFormatters = inputFormatters ??
        switch (_fieldType) {
          _FieldType.phone => [AppInputFormatters.noStartingSpace],
          _FieldType.email => [AppInputFormatters.noStartingSpace],
          _FieldType.website => [AppInputFormatters.noStartingSpace],
          _ => null,
        };

    return _Field(
      controller: controller,
      hideCopyButton: hideCopyButton,
      hideClearButton: hideClearButton,
      borderColor: borderColor,
      maxLines: maxLines,
      labelPosition: labelPosition,
      autofocus: autofocus,
      textColor: textColor,
      readOnly: readOnly,
      label: label,
      showLabel: showLabel,
      fractionsWhenDoubleDouble: fractionsWhenDoubleDouble,
      validationGroup: validationGroup,
      fieldType: _fieldType,
      localName: localName,
      selectAllOnFocus: selectAllOnFocus,
      focusNode: focusNode,
      validator: validator,
      inputFormatters: localInputFormatters,
      keyboardType: keyboardType,
      hint: hint,
      customErrorMessageNotifier: customErrorMessageNotifier,
      onChanged: onChanged,
      onClear: onClear,
      focusOrder: focusOrder,
      initialText: initialText,
      initialInt: initialInt,
      initialDouble: initialDouble,
      autovalidateMode: autovalidateMode,
      errorPosition: errorPosition,
      validationFieldId: validationFieldId,
      outsideTrailingWidgets: outsideTrailingWidgets ?? const [],
      emptyWhenZero: emptyWhenZero,
      suffix: suffix,
      minLines: minLines,
      fieldSuggestion: fieldSuggestion,
      floatingWindowId: floatingWindowId,
      navigatorKey: navigatorKey,
      floatingWindowFocus: floatingWindowFocus,
      excludeFocusTraversal: excludeFocusTraversal,
      maxLength: maxLength,
      suffixPadding: suffixPadding,
      textInputAction: textInputAction,
    );
  }
}

class _Field extends StatefulWidget {
  const _Field({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.fieldType,
    required this.localName,
    required this.emptyWhenZero,
    required this.maxLines,
    required this.showLabel,
    required this.fractionsWhenDoubleDouble,
    required this.selectAllOnFocus,
    required this.autofocus,
    required this.hideCopyButton,
    required this.hideClearButton,
    this.borderColor,
    this.textColor,
    this.controller,
    this.focusNode,
    this.validator,
    this.hint,
    this.inputFormatters,
    this.keyboardType,
    this.suffix,
    this.onChanged,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
    this.customErrorMessageNotifier,
    this.initialText,
    this.initialInt,
    this.initialDouble,
    this.validationFieldId,
    this.outsideTrailingWidgets = const [],
    this.minLines,
    this.fieldSuggestion,
    this.floatingWindowId,
    this.navigatorKey,
    this.maxLength,
    this.floatingWindowFocus,
    this.autovalidateMode,
    this.excludeFocusTraversal = false,
    this.suffixPadding,
    this.textInputAction,
  });
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final NextTextFormFieldErrorPosition errorPosition;
  final String? label;
  final NextCardFormFieldLabelPosition labelPosition;
  final void Function(String?)? onClear;
  final FocusNode? focusNode;
  final double? focusOrder;
  final bool readOnly;
  final String? initialText;
  final int? initialInt;
  final double? initialDouble;
  final String? validationGroup;
  final _FieldType fieldType;
  final String localName;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool emptyWhenZero;
  final int? maxLines;
  final List<Widget> outsideTrailingWidgets;
  final bool showLabel;
  final String? hint;
  final Widget? suffix;
  final ValueNotifier<String?>? customErrorMessageNotifier;
  final String? validationFieldId;
  final int? minLines;
  final int fractionsWhenDoubleDouble;
  final bool selectAllOnFocus;
  final bool autofocus;
  final FieldSuggestion? fieldSuggestion;
  final String? floatingWindowId;
  final GlobalKey<NavigatorState>? navigatorKey;
  final FocusNode? floatingWindowFocus;

  final bool hideCopyButton;
  final bool hideClearButton;
  final Color? borderColor;
  final Color? textColor;
  final AutovalidateMode? autovalidateMode;
  final bool excludeFocusTraversal;
  final int? maxLength;
  final EdgeInsets? suffixPadding;
  final TextInputAction? textInputAction;
  @override
  State<_Field> createState() => _FieldState();
}

class _FieldState extends State<_Field> {
  late final TextEditingController localController;

  @override
  void initState() {
    super.initState();
    switch (widget.fieldType) {
      case _FieldType.phone:
        localController = widget.controller ??
            TextEditingController(text: widget.initialText ?? '');
      case _FieldType.email:
        localController = widget.controller ??
            TextEditingController(text: widget.initialText ?? '');
      case _FieldType.website:
        localController = widget.controller ??
            TextEditingController(text: widget.initialText ?? '');
      case _FieldType.text:
        localController = widget.controller ??
            TextEditingController(text: widget.initialText ?? '');
      case _FieldType.int:
        localController = widget.controller ??
            TextEditingController(
              text: widget.initialInt != null
                  ? widget.initialInt == 0 && widget.emptyWhenZero
                      ? ''
                      : widget.initialInt!.formatted(widget.localName)
                  : '',
            );
      case _FieldType.double:
        localController = widget.controller ??
            TextEditingController(
              text: widget.initialDouble != null
                  ? widget.initialDouble == 0 && widget.emptyWhenZero
                      ? ''
                      : widget.initialDouble!.formatted(
                          widget.localName,
                          fractionsWhenDoubleDouble:
                              widget.fractionsWhenDoubleDouble,
                        )
                  : '',
            );
    }
    // if (widget.selectAllOnFocus) {
    //   localController.selection = TextSelection(
    //     baseOffset: 0,
    //     extentOffset: localController.text.length,
    //   );
    // }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      localController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textField = Padding(
      padding: UiConstants.cardFieldPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelPosition == NextCardFormFieldLabelPosition.top &&
              widget.showLabel)
            AppText(widget.label ?? ''),
          Row(
            crossAxisAlignment: widget.keyboardType == TextInputType.multiline
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              if (widget.labelPosition == NextCardFormFieldLabelPosition.left &&
                  widget.showLabel)
                SizedBox(
                  width: UiConstants.leftLabelWidth,
                  child: widget.label == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(
                            top: widget.keyboardType == TextInputType.multiline
                                ? 6
                                : 0,
                          ),
                          child: NextAppFieldLeftLabel(
                            label: widget.label!,
                            maxLines: 1,
                          ),
                        ),
                ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: NextTextFormField(
                        maxLength: widget.maxLength,
                        autovalidateMode: widget.autovalidateMode,
                        borderColor: widget.borderColor,
                        hideCopyButton: widget.hideCopyButton,
                        hideClearButton: widget.hideClearButton,
                        autofocus: widget.autofocus,
                        validationFieldId: widget.validationFieldId,
                        customErrorMessageNotifier:
                            widget.customErrorMessageNotifier,
                        hint: widget.hint,
                        maxLines: widget.maxLines,
                        textInputAction: widget.textInputAction ??
                            (widget.maxLines != 1 ||
                                    (widget.minLines != null ||
                                        widget.minLines != 1)
                                ? TextInputAction.newline
                                : TextInputAction.next),
                        controller: localController,
                        minLines: widget.minLines,
                        textColor: widget.textColor,
                        validator: widget.validator,
                        errorPosition: widget.errorPosition,
                        validationGroup: widget.validationGroup,
                        onChanged: widget.readOnly ? null : widget.onChanged,
                        onClear: widget.onClear,
                        focusNode: widget.focusNode,
                        inputFormatters: widget.inputFormatters,
                        keyboardType: widget.keyboardType,
                        readOnly: widget.readOnly,
                        suffix: widget.suffix,
                        suffixPadding: widget.suffixPadding,
                      ),
                    ),
                  ],
                ),
              ),
              ...widget.outsideTrailingWidgets.map(
                (child) => _OutsideTrailingWrapper(
                  labelPosition: widget.labelPosition,
                  child: child,
                ),
              ),
              if (widget.fieldType == _FieldType.phone)
                _CallPhoneButton(
                  controller: localController,
                  labelPosition: widget.labelPosition,
                ),
              if (widget.fieldType == _FieldType.email)
                _SendEmailButton(
                  controller: localController,
                  labelPosition: widget.labelPosition,
                ),
              if (widget.fieldType == _FieldType.website)
                _OpenWebsiteButton(
                  controller: localController,
                  labelPosition: widget.labelPosition,
                ),
            ],
          ),
        ],
      ),
    );

    final textFieldWithSuggestions = Shortcuts(
      shortcuts: {
        suggestShortcutMeta: const SuggestIntent(),
        suggestShortcutControl: const SuggestIntent(),
      },
      child: Actions(
        actions: {
          SuggestIntent: CallbackAction(
            onInvoke: (intent) {
              if (widget.fieldSuggestion == null) {
                return null;
              }

              _showSuggestionDialog(
                context: context,
                fieldSuggestion: widget.fieldSuggestion!,
                controller: localController,
                onChanged: widget.onChanged,
                initialValue: localController.text,
              );
              return null;
            },
          ),
        },
        child: textField,
      ),
    );

    Widget finalWidget = textFieldWithSuggestions;

    if (widget.focusOrder != null) {
      finalWidget = ElbFocusOrderWrapper(
        focusOrderId: widget.focusOrder,
        child: finalWidget,
      );
    }

    if (widget.excludeFocusTraversal) {
      finalWidget = NextExcludeFocus(
        excluding: true,
        child: finalWidget,
      );
    }

    return finalWidget;
  }
}

class NextAppFieldLeftLabel extends StatelessWidget {
  const NextAppFieldLeftLabel({
    required this.label,
    required this.maxLines,
    super.key,
  });

  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 8,
        top: maxLines == 1 ? 0 : 5,
      ),
      child: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: AppText(
          label,
          textAlign: TextAlign.left,
          autoSize: false,
          height: 1.2,
          maxLines: 2,
        ),
      ),
    );
  }
}

class _CallPhoneButton extends HookWidget {
  const _CallPhoneButton({
    required this.controller,
    required this.labelPosition,
  });

  final TextEditingController controller;
  final NextCardFormFieldLabelPosition labelPosition;

  @override
  Widget build(BuildContext context) {
    final currentNumber =
        useListenableSelector(controller, () => controller.text);

    return _ActionButton(
      labelPosition: labelPosition,
      icon: AppIcons.phone,
      onPressed: !AppValidator.isValidPhoneNumber(currentNumber)
          ? null
          : () {
              UriLauncher.launchPhoneNumber(currentNumber);
            },
    );
  }
}

class _SendEmailButton extends HookWidget {
  const _SendEmailButton({
    required this.controller,
    required this.labelPosition,
  });

  final TextEditingController controller;
  final NextCardFormFieldLabelPosition labelPosition;

  @override
  Widget build(BuildContext context) {
    final currentInput =
        useListenableSelector(controller, () => controller.text);

    return _ActionButton(
      labelPosition: labelPosition,
      icon: AppIcons.send,
      onPressed: !AppValidator.isValidEmail(currentInput)
          ? null
          : () {
              UriLauncher.launchEmail(currentInput);
            },
    );
  }
}

class _OpenWebsiteButton extends HookWidget {
  const _OpenWebsiteButton({
    required this.controller,
    required this.labelPosition,
  });

  final TextEditingController controller;
  final NextCardFormFieldLabelPosition labelPosition;

  @override
  Widget build(BuildContext context) {
    final currentInput =
        useListenableSelector(controller, () => controller.text.trim());

    return _ActionButton(
      labelPosition: labelPosition,
      icon: AppIcons.website,
      onPressed: currentInput.isEmpty
          ? null
          : () {
              UriLauncher.launchInBrowser(currentInput);
            },
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.onPressed,
    required this.labelPosition,
  });
  final IconData icon;
  final VoidCallback? onPressed;
  final NextCardFormFieldLabelPosition labelPosition;
  @override
  Widget build(BuildContext context) {
    return _OutsideTrailingWrapper(
      labelPosition: labelPosition,
      child: AppIconButton.secondary(
        skipTraversal: true,
        fixedSize: const Size(
          UiConstants.buttonHeight,
          UiConstants.buttonHeight,
        ),
        onPressed: onPressed,
        iconData: icon,
      ),
    );
  }
}

class _OutsideTrailingWrapper extends StatelessWidget {
  const _OutsideTrailingWrapper({
    required this.child,
    required this.labelPosition,
  });
  final Widget child;
  final NextCardFormFieldLabelPosition labelPosition;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
      ),
      child: child,
    );
  }
}

Future<void> _showSuggestionDialog({
  required BuildContext context,
  required FieldSuggestion fieldSuggestion,
  required TextEditingController controller,
  required void Function(String)? onChanged,
  required String initialValue,
}) async {
  if (context.mounted) {
    await showElbDialog<void>(
      isDismissible: true,
      context: context,
      useRootNavigator: false,
      child: SuggestionIntentDialog(
        fieldSuggestion: fieldSuggestion,
        initialValue: initialValue,
        onSuggestionSelected: (suggestion) {
          controller.text = suggestion;
          onChanged?.call(suggestion);
        },
      ),
    );
  }
}
