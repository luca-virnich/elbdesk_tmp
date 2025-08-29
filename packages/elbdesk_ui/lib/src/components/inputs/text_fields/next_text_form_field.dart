import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'next_text_form_field.g.dart';

enum NextTextFormFieldErrorPosition {
  above,
  insideIcon,
}

class NextTextFormField extends StatefulWidget {
  const NextTextFormField({
    required this.controller,
    required this.validator,
    this.focusNode,
    super.key,
    this.onChanged,
    this.errorPosition = NextTextFormFieldErrorPosition.insideIcon,
    this.readOnly = false,
    this.onClear,
    this.validationGroup,
    this.hideCopyButton = false,
    this.hideClearButton = false,
    this.isInTableCell = false,
    this.onFieldSubmitted,
    this.enabled,
    this.autofocus = false,
    this.onEditingComplete,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.enableInteractiveSelection,
    this.customErrorMessageNotifier,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.style,
    this.hint,
    this.onTap,
    this.inputFormatters,
    this.isInDropdownMenu = false,
    this.suffixPadding,
    this.validationFieldId,
    this.maxLines = 1,
    this.minLines,
    this.suffix,
    this.textInputAction,
    this.borderColor,
    this.textColor,
    this.autovalidateMode,
    this.maxLength,
  });

  final String? hint;

  final String? Function(String?)? validator;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final NextTextFormFieldErrorPosition errorPosition;

  final bool readOnly;
  final void Function(String)? onClear;
  final FocusNode? focusNode;
  final String? validationGroup;
  final bool hideCopyButton;
  final String? validationFieldId;
  final bool hideClearButton;
  final bool isInTableCell;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final bool? enabled;
  final MouseCursor? mouseCursor;
  final bool canRequestFocus;
  final bool? enableInteractiveSelection;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? style;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool isInDropdownMenu;
  final int? maxLines;
  final int? minLines;
  final Widget? suffix;
  final bool autofocus;
  final ValueNotifier<String?>? customErrorMessageNotifier;
  final AutovalidateMode? autovalidateMode;

  final TextInputAction? textInputAction;
  final Color? borderColor;
  final Color? textColor;
  final int? maxLength;
  final EdgeInsets? suffixPadding;
  @override
  State<NextTextFormField> createState() => _NextTextFormFieldState();
}

class _NextTextFormFieldState extends State<NextTextFormField> {
  final isHovered = ValueNotifier<bool>(false);
  final hasFocus = ValueNotifier<bool>(false);
  late final ValueNotifier<bool> isEmpty;

  late final FocusNode localFocusNode;
  late final VoidCallback focusListener;
  late final String fieldId;
  bool hadErrorOnce = false;
  final customErrorMessage = ValueNotifier<String?>(null);

  void errorListener() {
    if (widget.customErrorMessageNotifier?.value != null) {
      customErrorMessage.value = widget.customErrorMessageNotifier?.value;
    } else {
      customErrorMessage.value = null;
    }
  }

  @override
  void initState() {
    super.initState();

    fieldId = widget.validationFieldId ?? const Uuid().v4();
    isEmpty = ValueNotifier<bool>(widget.controller.text.trim().isEmpty);
    localFocusNode = widget.focusNode ?? FocusNode();
    focusListener = () {
      hasFocus.value = localFocusNode.hasFocus;
    };
    localFocusNode.addListener(focusListener);
    widget.customErrorMessageNotifier?.addListener(errorListener);
  }

  @override
  void dispose() {
    localFocusNode.removeListener(focusListener);
    if (widget.focusNode == null) {
      localFocusNode.dispose();
    }
    isHovered.dispose();
    hasFocus.dispose();
    isEmpty.dispose();
    widget.customErrorMessageNotifier?.removeListener(errorListener);
    customErrorMessage.dispose();
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

    return Consumer(
      builder: (context, ref, child) {
        return FormField<String>(
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
          initialValue: widget.controller.text,
          autovalidateMode: widget.autovalidateMode ??
              (hadErrorOnce
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.onUnfocus),
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
            return MouseRegion(
              onEnter: (_) => isHovered.value = true,
              onExit: (_) => isHovered.value = false,
              child: ValueListenableBuilder<String?>(
                valueListenable: customErrorMessage,
                builder: (context, value, child) {
                  return HookBuilder(
                    builder: (context) {
                      void validate() {
                        final v = widget.controller.text;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) {
                            fieldState.didChange(v);
                          }
                        });
                      }

                      useEffect(
                        () {
                          widget.controller.addListener(validate);
                          return () {
                            widget.controller.removeListener(validate);
                          };
                        },
                        [],
                      );
                      return NextTextField(
                        maxLength: widget.maxLength,
                        textColor: widget.textColor,
                        borderColor: widget.borderColor,
                        autofocus: widget.autofocus,
                        hintText: widget.hint,
                        maxLines: widget.maxLines,
                        minLines: widget.minLines,
                        onSubmitted: widget.onFieldSubmitted,
                        textInputAction: widget.textInputAction,
                        onEditingComplete: () {
                          widget.onEditingComplete?.call();
                          fieldState.didChange(widget.controller.text);
                        },
                        isInTableCell: widget.isInTableCell,
                        onChanged: (v) {
                          widget.onChanged?.call(v);
                          widget.customErrorMessageNotifier?.value = null;
                          if (v.trim().isEmpty) {
                            isEmpty.value = true;
                          } else {
                            isEmpty.value = false;
                          }
                        },
                        focusNode: localFocusNode,
                        canRequestFocus: widget.canRequestFocus,
                        enableInteractiveSelection:
                            widget.enableInteractiveSelection,
                        keyboardType: widget.keyboardType,
                        mouseCursor: widget.mouseCursor,
                        enabled: widget.enabled,
                        readOnly: widget.readOnly,
                        textAlign: widget.textAlign,
                        controller: widget.controller,
                        style: widget.style,
                        onTap: widget.onTap,
                        inputFormatters: widget.inputFormatters,
                        hasError: fieldState.hasError ||
                            customErrorMessage.value != null,
                        textAlignVertical: widget.textAlignVertical,
                        suffix: fieldState.hasError ||
                                customErrorMessage.value != null
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (widget.suffix != null)
                                    Padding(
                                      padding: widget.suffixPadding ??
                                          const EdgeInsets.only(right: 4),
                                      child: widget.suffix,
                                    ),
                                  NextTextFormFieldErrorTooltip(
                                    errorText: fieldState.errorText ??
                                        customErrorMessage.value,
                                    onClearFn: onClearFn == null
                                        ? null
                                        : () {
                                            widget.customErrorMessageNotifier
                                                ?.value = null;
                                            onClearFn.call();
                                            fieldState.didChange('');
                                          },
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _ValueListenableBuilder3<bool, bool, bool>(
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
                                        isInTableCell: widget.isInTableCell,
                                        hideCopyButton: widget.hideCopyButton,
                                        hideClearButton: widget.hideClearButton,
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
                                        onClear: onClearFn == null
                                            ? null
                                            : () {
                                                widget
                                                    .customErrorMessageNotifier
                                                    ?.value = null;
                                                onClearFn.call();
                                                fieldState.didChange('');
                                              },
                                      );
                                    },
                                  ),
                                  if (widget.suffix != null)
                                    Padding(
                                      padding: widget.suffixPadding ??
                                          const EdgeInsets.only(right: 4),
                                      child: widget.suffix,
                                    ),
                                ],
                              ),
                      );
                    },
                  );
                },
              ),
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

/// Validation group for the entire App
@riverpod
class ValidationGroup extends _$ValidationGroup {
  @override
  List<String> build(String groupId) {
    return [];
  }

  void add(String id) {
    state = [...state, id];
  }

  void remove(String id) {
    state = state.where((e) => e != id).toList();
  }

  void clear() {
    state = [];
  }
}
