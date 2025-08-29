import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/components/buttons/app_calendar_picker_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextCardDateField extends HookWidget {
  const NextCardDateField({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroupId,
    required this.onChanged,
    this.controller,
    this.initialDate,
    this.showLabel = true,
    this.focusNode,
    super.key,
    this.validator,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
    this.hideDatePicker = false,
  });
  // : assert(
  //         (controller != null && initialDate == null) ||
  //             (controller == null && initialDate != null),
  //         'Either controller or initialValue must be provided, but not both',
  //       );

  final String? Function(DateTime?)? validator;
  final TextEditingController? controller;
  final void Function(DateTime?) onChanged;
  final NextTextFormFieldErrorPosition errorPosition;
  final String? label;
  final NextCardFormFieldLabelPosition labelPosition;
  final void Function(String?)? onClear;
  final FocusNode? focusNode;
  final double? focusOrder;
  final bool readOnly;
  final DateTime? initialDate;
  final bool hideDatePicker;

  final String? validationGroupId;

  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final localName = context.l10n.localeName;
    final containerKey = useMemoized(GlobalKey.new, []);

    return _Field(
      key: containerKey,
      labelPosition: labelPosition,
      readOnly: readOnly,
      label: label,
      showLabel: showLabel,
      containerKey: containerKey,
      validationGroup: validationGroupId,
      localName: localName,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onChanged: onChanged,
      onClear: onClear,
      focusOrder: focusOrder,
      errorPosition: errorPosition,
      initialDate: initialDate,
      hideDatePicker: hideDatePicker,
    );
  }
}

class _Field extends StatefulWidget {
  const _Field({
    required this.labelPosition,
    required this.readOnly,
    required this.label,
    required this.validationGroup,
    required this.localName,
    required this.showLabel,
    required this.onChanged,
    required this.containerKey,
    super.key,
    this.initialDate,
    this.controller,
    this.focusNode,
    this.validator,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
    this.hideDatePicker = false,
  });
  final String? Function(DateTime?)? validator;
  final TextEditingController? controller;
  final void Function(DateTime?) onChanged;
  final NextTextFormFieldErrorPosition errorPosition;
  final String? label;
  final NextCardFormFieldLabelPosition labelPosition;
  final void Function(String?)? onClear;
  final FocusNode? focusNode;
  final double? focusOrder;
  final bool readOnly;
  final bool hideDatePicker;

  final String? validationGroup;

  final String localName;
  final DateTime? initialDate;

  final bool showLabel;
  final GlobalKey containerKey;
  @override
  State<_Field> createState() => _FieldState();
}

DateTime? localDate;

class _FieldState extends State<_Field> {
  late final TextEditingController localController;

  // late final GlobalKey containerKey;

  @override
  void initState() {
    super.initState();
    localDate = widget.initialDate;

    localController = widget.controller ??
        TextEditingController(
          text: widget.initialDate != null
              ? widget.initialDate!.toDate(widget.localName)
              : '',
        );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      localController.dispose();
    }
    super.dispose();
  }

  void _onDateChanged(DateTime? date) {
    // return;

    if (date == null) {
      widget.onChanged(date);
      localDate = date;
    } else {
      final cleaned = DateTime(date.year, date.month, date.day);

      widget.onChanged(cleaned);
      localDate = cleaned;
    }
  }

  void _onDateChangedAndUpdateText(DateTime date) {
    final cleaned = DateTime(date.year, date.month, date.day);
    widget.onChanged(cleaned);
    localDate = cleaned;
    final stringDate = cleaned.toDate(context.l10n.localeName);
    localController.text = stringDate;
  }

  @override
  Widget build(BuildContext context) {
    final textField = Padding(
      padding: UiConstants.cardFieldPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.labelPosition == NextCardFormFieldLabelPosition.top)
            AppText(widget.label ?? ''),
          SizedBox(
            height: UiConstants.buttonHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.labelPosition ==
                        NextCardFormFieldLabelPosition.left &&
                    widget.showLabel)
                  SizedBox(
                    width: UiConstants.leftLabelWidth,
                    child: widget.label == null
                        ? const SizedBox.shrink()
                        : NextAppFieldLeftLabel(
                            label: widget.label!,
                            maxLines: 1,
                          ),
                  ),
                Expanded(
                  child: _TextFormField(
                    containerKey: widget.containerKey,
                    onDateChanged: _onDateChanged,
                    onDateChangedAndUpdateText: _onDateChangedAndUpdateText,
                    label: widget.labelPosition ==
                            NextCardFormFieldLabelPosition.top
                        ? widget.label
                        : null,
                    controller: localController,
                    validator: widget.validator,
                    errorPosition: widget.errorPosition,
                    validationGroup: widget.validationGroup,
                    onClear: widget.onClear,
                    focusNode: widget.focusNode,
                    readOnly: widget.readOnly,
                    labelPosition: widget.labelPosition,
                    initialDate: widget.initialDate,
                    hideDatePicker: widget.hideDatePicker,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    if (widget.focusOrder != null) {
      return ElbFocusOrderWrapper(
        focusOrderId: widget.focusOrder,
        child: textField,
      );
    }
    return textField;
  }
}

class _DatePicker extends HookWidget {
  const _DatePicker({
    required this.controller,
    required this.labelPosition,
    required this.readOnly,
    required this.initialDate,
    required this.onDateChanged,
    required this.containerKey,
    required this.onPickerOpenChanged,
  });

  final TextEditingController controller;
  final NextCardFormFieldLabelPosition labelPosition;
  final bool readOnly;
  final DateTime? initialDate;
  final void Function(DateTime) onDateChanged;
  final GlobalKey containerKey;

  final void Function(bool) onPickerOpenChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
      ),
      child: AppCalendarPickerButton(
        readOnly: readOnly,
        onPickerOpenChanged: onPickerOpenChanged,
        initialDate: initialDate,
        onDateChanged: onDateChanged,
        containerKey: containerKey,
      ),
    );
  }
}

class _TextFormField extends StatefulWidget {
  const _TextFormField({
    required this.controller,
    required this.validator,
    required this.onDateChanged,
    required this.onDateChangedAndUpdateText,
    required this.containerKey,
    required this.labelPosition,
    required this.initialDate,
    this.focusNode,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.label,
    this.readOnly = false,
    this.onClear,
    this.validationGroup,
    this.hideDatePicker = false,
  });

  final String? Function(DateTime?)? validator;
  final TextEditingController controller;

  final NextTextFormFieldErrorPosition errorPosition;
  final String? label;
  final bool readOnly;
  final void Function(String)? onClear;
  final FocusNode? focusNode;
  final String? validationGroup;
  final GlobalKey containerKey;
  final NextCardFormFieldLabelPosition labelPosition;
  final DateTime? initialDate;
  final void Function(DateTime?) onDateChanged;
  final void Function(DateTime) onDateChangedAndUpdateText;
  final bool hideDatePicker;

  @override
  State<_TextFormField> createState() => _TextFormFieldState();
}

class _TextFormFieldState extends State<_TextFormField> {
  final isHovered = ValueNotifier<bool>(false);
  final hasFocus = ValueNotifier<bool>(false);
  late final ValueNotifier<bool> isEmpty;

  late final FocusNode localFocusNode;

  late final String fieldId;
  bool hadErrorOnce = false;
  bool isPickerOpen = false;

  void _onPickerOpenChanged(bool value) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        isPickerOpen = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fieldId = const Uuid().v4();
    isEmpty = ValueNotifier<bool>(widget.controller.text.trim().isEmpty);
    localFocusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void dispose() {
    // localFocusNode.removeListener(focusListener);
    if (widget.focusNode == null) {
      localFocusNode.dispose();
    }
    isHovered.dispose();
    hasFocus.dispose();
    isEmpty.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final onClearFn = widget.onClear == null
        ? null
        : () {
            isEmpty.value = true;
            final value = widget.controller.text;
            widget.onClear?.call(value);
            widget.controller.clear();
          };

    final copyAndClear = _ValueListenableBuilder3<bool, bool, bool>(
      valueListenable1: isHovered,
      valueListenable2: hasFocus,
      valueListenable3: isEmpty,
      builder: (
        context,
        isHoveredValue,
        hasFocusValue,
        isEmptyValue,
        child,
      ) {
        return _DefaultSuffix(
          isInTableCell: false,
          hideCopyButton: false,
          hideClearButton: false,
          isEmpty: isEmptyValue,
          hasFocus: hasFocusValue,
          isHovered: isHoveredValue,
          readOnly: widget.readOnly,
          onCopyPressed: () async {
            await Clipboard.setData(
              ClipboardData(
                text: widget.controller.text,
              ),
            );
          },
          onClear: onClearFn,
        );
      },
    );

    return Consumer(
      builder: (context, ref, child) {
        return FormField<DateTime?>(
          validator: (value) {
            final result = widget.validator?.call(value);

            if (widget.validationGroup != null) {
              if (result != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!context.mounted) return;
                  ref
                      .read(
                        validationGroupProvider(widget.validationGroup!)
                            .notifier,
                      )
                      .add(fieldId);
                });
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (!context.mounted) return;
                  ref
                      .read(
                        validationGroupProvider(widget.validationGroup!)
                            .notifier,
                      )
                      .remove(fieldId);
                });
              }
            }
            return result;
          },
          initialValue: widget.initialDate,
          autovalidateMode: hadErrorOnce
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.onUnfocus,
          builder: (fieldState) {
            if (fieldState.hasError && !hadErrorOnce) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  if (context.mounted) {
                    hadErrorOnce = true;
                  }
                });
              });
            }
            return HookBuilder(
              builder: (context) {
                useEffect(
                  () {
                    void focusListener() {
                      final v = widget.controller.text;
                      DateTime? date;
                      date = Parser.parseDateFullInput(v);
                      date ??= Parser.parseDateShortcutInput(v);
                      if (date != null) {
                        widget.onDateChangedAndUpdateText(date);
                      } else {
                        widget.onDateChanged(null);
                        widget.controller.clear();
                      }

                      Future.delayed(const Duration(milliseconds: 1), () {
                        if (!context.mounted) return;
                        fieldState.didChange(date);
                      });
                    }

                    localFocusNode.addListener(focusListener);
                    return () {
                      localFocusNode.removeListener(focusListener);
                    };
                  },
                  [],
                );
                return MouseRegion(
                  onEnter: (_) => isHovered.value = true,
                  onExit: (_) => isHovered.value = false,
                  child: Row(
                    children: [
                      Expanded(
                        child: NextTextField(
                          enabled: !widget.readOnly,
                          maxLines: 1,
                          onSubmitted: (v) {
                            DateTime? date;
                            date = Parser.parseDateFullInput(v);
                            date ??= Parser.parseDateShortcutInput(v);
                            if (date != null) {
                              widget.onDateChangedAndUpdateText(date);
                              FocusScope.of(context).nextFocus();
                            } else {
                              widget.onDateChanged(null);
                            }

                            fieldState.didChange(date);
                          },
                          isInTableCell: false,
                          onChanged: (v) {
                            // we dont want to change the text, just check if
                            // its a valid date
                            final date = Parser.parseDateFullInput(v);

                            // widget.onDateChanged(date);

                            fieldState.didChange(date);

                            if (v.trim().isEmpty) {
                              isEmpty.value = true;
                            } else {
                              isEmpty.value = false;
                            }
                          },
                          focusNode: localFocusNode,
                          keyboardType: TextInputType.datetime,
                          readOnly: widget.readOnly || isPickerOpen,
                          controller: widget.controller,
                          inputFormatters: [AppInputFormatters.noStartingSpace],
                          hasError: fieldState.hasError,
                          suffix: fieldState.hasError
                              ? NextTextFormFieldErrorTooltip(
                                  errorText: fieldState.errorText,
                                  onClearFn: onClearFn,
                                )
                              : copyAndClear,
                        ),
                      ),
                      if (!widget.hideDatePicker)
                        _DatePicker(
                          onPickerOpenChanged: _onPickerOpenChanged,
                          containerKey: widget.containerKey,
                          controller: widget.controller,
                          labelPosition: widget.labelPosition,
                          readOnly: widget.readOnly,
                          initialDate: localDate,
                          onDateChanged: (date) {
                            widget.onDateChangedAndUpdateText(date);
                            fieldState.didChange(date);
                          },
                        ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class _ValueListenableBuilder3<A, B, C> extends StatelessWidget {
  const _ValueListenableBuilder3({
    required this.valueListenable1,
    required this.valueListenable2,
    required this.valueListenable3,
    required this.builder,
    super.key,
    this.child,
  });

  final ValueListenable<A> valueListenable1;
  final ValueListenable<B> valueListenable2;
  final ValueListenable<C> valueListenable3;
  final Widget? child;
  final Widget Function(
    BuildContext context,
    A value1,
    B value2,
    C value3,
    Widget? child,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
      valueListenable: valueListenable1,
      builder: (_, value1, __) {
        return ValueListenableBuilder<B>(
          valueListenable: valueListenable2,
          builder: (_, value2, __) {
            return ValueListenableBuilder<C>(
              valueListenable: valueListenable3,
              builder: (context, value3, __) {
                return builder(context, value1, value2, value3, child);
              },
            );
          },
        );
      },
    );
  }
}

class _DefaultSuffix extends StatelessWidget {
  const _DefaultSuffix({
    required this.isEmpty,
    required this.hasFocus,
    required this.isHovered,
    required this.readOnly,
    required this.onCopyPressed,
    required this.onClear,
    required this.hideCopyButton,
    required this.hideClearButton,
    required this.isInTableCell,
  });

  final bool isEmpty;
  final bool hasFocus;
  final bool isHovered;
  final bool readOnly;
  final bool hideCopyButton;
  final bool hideClearButton;
  final bool isInTableCell;

  final VoidCallback onCopyPressed;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    if (readOnly) {
      return AppTextFieldSuffixCopyButton(
        visible: !isEmpty && isHovered && !hideCopyButton,
        onPressed: onCopyPressed,
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFieldSuffixCopyButton(
            visible: !isEmpty && isHovered && !hideCopyButton,
            onPressed: onCopyPressed,
          ),
          if (hasFocus && onClear != null)
            AppTextFieldSuffixClearButton(
              visible: !isEmpty &&
                  hasFocus &&
                  !readOnly &&
                  !hideClearButton &&
                  !isInTableCell,
              onPressed: onClear,
            ),
        ],
      );
    }
  }
}
