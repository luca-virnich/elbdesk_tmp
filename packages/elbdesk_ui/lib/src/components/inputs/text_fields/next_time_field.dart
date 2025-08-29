import 'dart:math' as math;

import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

class NextTimeField extends HookWidget {
  const NextTimeField({
    required this.readOnly,
    required this.validationGroupId,
    required this.onChanged,
    this.controller,
    this.initialTime,
    this.showLabel = true,
    this.focusNode,
    super.key,
    this.validator,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
  });
  // : assert(
  //         (controller != null && initialDate == null) ||
  //             (controller == null && initialDate != null),
  //         'Either controller or initialValue must be provided, but not both',
  //       );

  final String? Function(TimeOfDay?)? validator;
  final TextEditingController? controller;
  final void Function(TimeOfDay?) onChanged;
  final NextTextFormFieldErrorPosition errorPosition;

  final void Function(String?)? onClear;
  final FocusNode? focusNode;
  final double? focusOrder;
  final bool readOnly;
  final TimeOfDay? initialTime;

  final String? validationGroupId;

  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    final localName = context.l10n.localeName;
    final containerKey = useMemoized(GlobalKey.new, []);

    return _Field(
      key: containerKey,
      readOnly: readOnly,
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
      initialTime: initialTime,
    );
  }
}

class _Field extends StatefulWidget {
  const _Field({
    required this.readOnly,
    required this.validationGroup,
    required this.localName,
    required this.showLabel,
    required this.onChanged,
    required this.containerKey,
    super.key,
    this.initialTime,
    this.controller,
    this.focusNode,
    this.validator,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.onClear,
    this.focusOrder,
  });
  final String? Function(TimeOfDay?)? validator;
  final TextEditingController? controller;
  final void Function(TimeOfDay?) onChanged;
  final NextTextFormFieldErrorPosition errorPosition;

  final void Function(String?)? onClear;
  final FocusNode? focusNode;
  final double? focusOrder;
  final bool readOnly;

  final String? validationGroup;

  final String localName;
  final TimeOfDay? initialTime;

  final bool showLabel;
  final GlobalKey containerKey;
  @override
  State<_Field> createState() => _FieldState();
}

TimeOfDay? localTime;

class _FieldState extends State<_Field> {
  late final TextEditingController localController;

  // late final GlobalKey containerKey;

  @override
  void initState() {
    super.initState();
    localTime = widget.initialTime;
    localController = widget.controller ??
        TextEditingController(
          text: widget.initialTime != null
              ? '${widget.initialTime!.hour.toString().padLeft(2, '0')}:${widget.initialTime!.minute.toString().padLeft(2, '0')}'
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

  void _onTimeChangedAndUpdateText(TimeOfDay? time, bool manipulateController) {
    if (time == null) {
      widget.onChanged(null);
      localTime = null;
      if (manipulateController) {
        localController.clear();
      }
      return;
    }
    // return;
    widget.onChanged(time);
    localTime = time;
    if (manipulateController) {
      final stringTime = time.format(context);
      localController.text = stringTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textField = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: UiConstants.buttonHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _TextFormField(
                  containerKey: widget.containerKey,
                  onTimeChangedAndUpdateText: _onTimeChangedAndUpdateText,
                  controller: localController,
                  validator: widget.validator,
                  errorPosition: widget.errorPosition,
                  validationGroup: widget.validationGroup,
                  onClear: widget.onClear,
                  focusNode: widget.focusNode,
                  readOnly: widget.readOnly,
                  initialTime: widget.initialTime,
                ),
              ),
            ],
          ),
        ),
      ],
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

class _TextFormField extends StatefulWidget {
  const _TextFormField({
    required this.controller,
    required this.validator,
    required this.onTimeChangedAndUpdateText,
    required this.containerKey,
    required this.initialTime,
    this.focusNode,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.readOnly = false,
    this.onClear,
    this.validationGroup,
  });

  final String? Function(TimeOfDay?)? validator;
  final TextEditingController controller;

  final NextTextFormFieldErrorPosition errorPosition;

  final bool readOnly;
  final void Function(String)? onClear;
  final FocusNode? focusNode;
  final String? validationGroup;
  final GlobalKey containerKey;

  final TimeOfDay? initialTime;

  final void Function(TimeOfDay?, bool) onTimeChangedAndUpdateText;

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

  // void _onPickerOpenChanged(bool value) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     setState(() {
  //       isPickerOpen = value;
  //     });
  //   });
  // }

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
        return FormField<TimeOfDay?>(
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
          initialValue: widget.initialTime,
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
                      if (!localFocusNode.hasFocus) {
                        final v = widget.controller.text;
                        TimeOfDay? time;
                        time = Parser.parseTimeOfDayInput(v);
                        widget.onTimeChangedAndUpdateText(time, true);

                        Future.delayed(const Duration(milliseconds: 1), () {
                          fieldState.didChange(time);
                        });
                      }
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
                          maxLines: 1,
                          inputFormatters: [TimeInputFormatter()],
                          onSubmitted: (v) {
                            TimeOfDay? time;
                            time = Parser.parseTimeOfDayInput(v);
                            if (time != null) {
                              widget.onTimeChangedAndUpdateText(time, true);
                              FocusScope.of(context).nextFocus();
                            } else {
                              widget.onTimeChangedAndUpdateText(null, true);
                            }

                            fieldState.didChange(time);
                          },
                          hintText: 'HH:MM',
                          isInTableCell: false,
                          onChanged: (v) {
                            final v = widget.controller.text;
                            TimeOfDay? time;
                            time = Parser.parseTimeOfDayInput(v);

                            widget.onTimeChangedAndUpdateText(time, false);
                          },
                          focusNode: localFocusNode,
                          keyboardType: TextInputType.datetime,
                          readOnly: widget.readOnly || isPickerOpen,
                          controller: widget.controller,
                          hasError: fieldState.hasError,
                          suffix: fieldState.hasError
                              ? NextTextFormFieldErrorTooltip(
                                  errorText: fieldState.errorText,
                                  onClearFn: onClearFn,
                                )
                              : copyAndClear,
                        ),
                      ),
                      // _DatePicker(
                      //   onPickerOpenChanged: _onPickerOpenChanged,
                      //   containerKey: widget.containerKey,
                      //   controller: widget.controller,
                      //   labelPosition: widget.labelPosition,
                      //   readOnly: widget.readOnly,
                      //   initialDate: localDate,
                      //   onDateChanged: (date) {
                      //     widget.onDateChangedAndUpdateText(date);
                      //     fieldState.didChange(date);
                      //   },
                      // ),
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

/// A text input formatter that only allows numbers and a single colon character.
/// This is used for time input fields to ensure the format is valid.
class TimeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Handle deletion case - allow user to delete characters
    if (newValue.text.length < oldValue.text.length) {
      return newValue;
    }

    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Only allow numbers and colon
    final regExp = RegExp(r'^[0-9:]*$');
    if (!regExp.hasMatch(newValue.text)) {
      return oldValue;
    }

    // First character can only be 0, 1, or 2
    if (newValue.text.isNotEmpty &&
        !RegExp('^[0-2]').hasMatch(newValue.text[0])) {
      return oldValue;
    }

    // If first character is 2, second character can only be 0-3
    if (newValue.text.isNotEmpty &&
        newValue.text[0] == '2' &&
        newValue.text.length >= 2 &&
        !RegExp('^[0-3]').hasMatch(newValue.text[1])) {
      return oldValue;
    }

    // Only allow one colon
    final colonCount = ':'.allMatches(newValue.text).length;
    if (colonCount > 1) {
      return oldValue;
    }

    // Don't allow starting with colon
    if (newValue.text.startsWith(':')) {
      return oldValue;
    }

    // If we already have a valid time format (HH:MM) and user tries to add more digits,
    // prevent adding more characters
    if (RegExp(r'^\d{2}:\d{2}$').hasMatch(oldValue.text) &&
        newValue.text.length > oldValue.text.length) {
      return oldValue;
    }

    // Handle insertion in the middle of the text
    // If inserting after the hour part but before the minute part, replace the minute part
    if (oldValue.text.contains(':') &&
        newValue.text.contains(':') &&
        oldValue.selection.baseOffset == 3 &&
        newValue.text.length > oldValue.text.length) {
      final parts = oldValue.text.split(':');
      final newDigit = newValue.text[3];
      final newText =
          '${parts[0]}:$newDigit${parts[1].length > 1 ? parts[1][1] : ''}';
      return TextEditingValue(
        text: newText,
        selection: const TextSelection.collapsed(offset: 4),
      );
    }

    // Handle insertion in the middle of the hour part
    if (oldValue.text.contains(':') &&
        newValue.text.contains(':') &&
        oldValue.selection.baseOffset < 2 &&
        newValue.text.length > oldValue.text.length) {
      final parts = oldValue.text.split(':');
      final hourPart = parts[0];
      final minutePart = parts[1];

      // Calculate new hour part based on insertion position
      String newHourPart;
      if (oldValue.selection.baseOffset == 0) {
        // Inserting at the beginning
        newHourPart = newValue.text[0] + hourPart.substring(0, 1);
      } else {
        // Inserting in the middle
        newHourPart = hourPart[0] + newValue.text[1];
      }

      // Validate hour (must be 00-23)
      final hourValue = int.tryParse(newHourPart);
      if (hourValue == null || hourValue > 23) {
        return oldValue;
      }

      final newText = '$newHourPart:$minutePart';
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(
          offset: oldValue.selection.baseOffset + 1,
        ),
      );
    }

    // Handle insertion in the middle of the minute part
    if (oldValue.text.contains(':') &&
        newValue.text.contains(':') &&
        oldValue.selection.baseOffset > 2 &&
        oldValue.selection.baseOffset <= 5 &&
        newValue.text.length > oldValue.text.length) {
      final parts = oldValue.text.split(':');
      final hourPart = parts[0];
      final minutePart = parts[1];

      // Calculate new minute part based on insertion position
      String newMinutePart;
      if (oldValue.selection.baseOffset == 3) {
        // Inserting at first minute position
        final newDigit = newValue.text[3];
        // First digit of minutes must be 0-5
        if (int.parse(newDigit) > 5) {
          return oldValue;
        }
        newMinutePart = newDigit + (minutePart.length > 1 ? minutePart[1] : '');
      } else {
        // Inserting at second minute position
        newMinutePart = minutePart[0] + newValue.text[4];
      }

      final newText = '$hourPart:$newMinutePart';
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(
          offset: oldValue.selection.baseOffset + 1,
        ),
      );
    }

    // If we're typing and there's no colon yet, insert it after the first 2 digits
    if (colonCount == 0 && newValue.text.length > 2) {
      final beforeColon = newValue.text.substring(0, 2);
      final afterColon = newValue.text.substring(2);

      // Validate hour (must be 00-23)
      final hourValue = int.tryParse(beforeColon);
      if (hourValue == null || hourValue > 23) {
        return oldValue;
      }

      final newText = '$beforeColon:$afterColon';
      return TextEditingValue(
        text: newText,
        selection:
            TextSelection.collapsed(offset: newValue.selection.baseOffset + 1),
      );
    }

    // Validate minutes (first digit after colon can only be 0-5)
    if (newValue.text.contains(':')) {
      final parts = newValue.text.split(':');
      if (parts.length > 1 && parts[1].isNotEmpty) {
        if (!RegExp('^[0-5]').hasMatch(parts[1][0])) {
          return oldValue;
        }
      }
    }

    // Limit to max 5 characters total (HH:MM)
    if (newValue.text.length > 5) {
      return TextEditingValue(
        text: newValue.text.substring(0, 5),
        selection: const TextSelection.collapsed(offset: 5),
      );
    }

    // Limit to max 2 characters after the colon
    if (newValue.text.contains(':')) {
      final parts = newValue.text.split(':');
      if (parts.length > 1 && parts[1].length > 2) {
        final minutes = parts[1].substring(0, 2);
        return TextEditingValue(
          text: '${parts[0]}:$minutes',
          selection: TextSelection.collapsed(
            offset:
                math.min(newValue.selection.baseOffset, parts[0].length + 3),
          ),
        );
      }
    }

    // Validate hour part (must be 00-23)
    if (!newValue.text.contains(':') && newValue.text.length >= 2) {
      final hourValue = int.tryParse(newValue.text.substring(0, 2));
      if (hourValue == null || hourValue > 23) {
        return oldValue;
      }
    }

    return newValue;
  }
}
