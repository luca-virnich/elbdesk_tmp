import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uuid/uuid.dart';

/// The root TextField widget for the ELBRP UI library.
/// All text field widgets should extend this widget.
class AppCellTextField extends HookWidget {
  /// Creates an [AppRawTextField].
  ///
  /// The [focusNode] and [controller] parameters are required.
  /// The [readOnly] parameter defaults to `false`.
  /// The [obscureText] parameter defaults to `false`.
  /// The [textCapitalization] parameter defaults to [TextCapitalization.none].
  /// The [maxLines] parameter defaults to `1`.
  /// The [autofocus] parameter defaults to `false`.
  /// The [canRequestFocus] parameter defaults to `true`.
  /// The [ignorePointers] parameter defaults to `false`.
  /// The [hideValidator] parameter defaults to `false`.
  const AppCellTextField({
    required this.focusNode,
    required this.controller,
    super.key,
    this.readOnly = false,
    this.canRequestFocus = true,
    this.enableInteractiveSelection,
    this.inputFormatters,
    this.autofocus = false,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.onSubmitted,
    this.onChanged,
    this.border,
    this.activeBorder,
    this.floatingLabelBehavior,
    this.textAlignVertical,
    this.onTap,
    this.onEditingComplete,
    this.hintText,
    this.enabled,
    this.suffixIcon,
    this.leadingIcon,
    this.ignorePointers = false,
    this.mouseCursor,
    this.disableValidation = false,
    this.validator,
    this.hideValidator = false,
    this.onValidateSuccess,
    this.onValidateError,
    this.onFieldSubmitted,
  });

  /// Whether the input field is read-only.
  final bool readOnly;

  /// Whether the input field can request focus.
  final bool canRequestFocus;

  /// Whether interactive selection is enabled.
  final bool? enableInteractiveSelection;

  /// List of input formatters to apply to the input field.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the input field should autofocus.
  final bool autofocus;

  /// The type of keyboard to use for the input field.
  final TextInputType? keyboardType;

  /// The action button to display on the keyboard.
  final TextInputAction? textInputAction;

  /// The focus node for managing focus state.
  final FocusNode focusNode;

  /// The controller for managing the input text.
  final TextEditingController controller;

  /// Whether to obscure the text (e.g., for passwords).
  final bool obscureText;

  /// The capitalization behavior for the input text.
  final TextCapitalization textCapitalization;

  /// The maximum number of lines for the input field.
  final int? maxLines;

  /// Callback function to handle submission of the input text.
  final void Function(String)? onSubmitted;

  /// Callback function to handle changes to the input text.
  final void Function(String)? onChanged;

  /// The border to display when the input field is not focused.
  final OutlineInputBorder? border;

  /// The border to display when the input field is focused.
  final OutlineInputBorder? activeBorder;

  /// The behavior of the floating label.
  final FloatingLabelBehavior? floatingLabelBehavior;

  /// The vertical alignment of the input text.
  final TextAlignVertical? textAlignVertical;

  /// Callback function to handle tap events on the input field.
  final void Function()? onTap;

  /// Callback function to handle completion of editing.
  final void Function()? onEditingComplete;

  /// The hint text to display in the input field.
  final String? hintText;

  /// Whether the input field is enabled.
  final bool? enabled;

  /// The suffix icon to display in the input field.
  final Widget? suffixIcon;

  /// Leading Icon
  final Widget? leadingIcon;

  /// Whether to ignore pointer events.
  final bool ignorePointers;

  /// The validator function to validate the input text.
  final String? Function(String?)? validator;

  /// Whether to hide the validator.
  final bool hideValidator;

  /// Callback function to handle successful validation
  final void Function(String?)? onValidateSuccess;

  /// Callback function to handle error validation
  final void Function(String?)? onValidateError;

  /// Callback function to handle field submission.
  final void Function(String)? onFieldSubmitted;

  final bool disableValidation;

  final MouseCursor? mouseCursor;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final textFieldProperties = context.appTheme.textFieldProperties;
    final statusColors = context.appTheme.statusColors;

    final fieldId = useMemoized(
      () => const Uuid().v4(),
      [],
    );

    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);
    return FormField<String>(
      validator: validator,
      autovalidateMode:
          disableValidation ? AutovalidateMode.disabled : validateMode.value,
      initialValue: controller.text,
      builder: (fieldState) {
        return HookBuilder(
          builder: (context) {
            useEffect(
              () {
                if (fieldState.hasError) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    onValidateError?.call(fieldId);
                  });
                } else {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    onValidateSuccess?.call(fieldId);
                  });
                }
                return null;
              },
              [fieldState.hasError],
            );

            useEffect(
              () {
                void focusListener() {
                  if (!focusNode.hasFocus && !disableValidation) {
                    Future.delayed(const Duration(milliseconds: 50), () {
                      if (context.mounted) {
                        final isValid = fieldState.validate();
                        if (!isValid) {
                          validateMode.value = AutovalidateMode.always;
                        }
                      }
                    });
                  }
                }

                focusNode.addListener(focusListener);

                return () {
                  focusNode.removeListener(focusListener);
                };
              },
              [],
            );

            final border = OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: fieldState.hasError
                    ? statusColors.error
                    : generalColors.transparent,
              ),
            );

            const disabledBorder = OutlineInputBorder(
              borderRadius: BorderRadius.zero,
            );

            final activeBorder = OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(
                color: fieldState.hasError
                    ? statusColors.error
                    : generalColors.primary,
                width: 2,
              ),
            );

            final textField =

                // TODO(all): fix, old code:
                // Theme(
                //   data: context.theme.copyWith(
                //     textSelectionTheme: TextSelectionThemeData(
                //       selectionColor: appColors.textSelection,
                //       selectionHandleColor: appColors.textSelection,
                //       cursorColor: appColors.primary,
                //     ),
                //   ),
                //   child:

                CupertinoTheme(
              data: CupertinoThemeData(
                primaryColor: generalColors.primary,
                primaryContrastingColor: generalColors.primarySurface,
              ),
              child: SizedBox(
                height: 30,
                child: TextField(
                  mouseCursor: mouseCursor,
                  // textAlign: TextAlign.end,
                  enabled: enabled,
                  readOnly: readOnly,
                  onTap: onTap,
                  ignorePointers: ignorePointers,
                  textAlignVertical: textAlignVertical,
                  enableInteractiveSelection: enableInteractiveSelection,
                  canRequestFocus: canRequestFocus,
                  cursorHeight: UiConstants.textFieldCursorHeight,
                  style: context.appTheme.textStyles.textFieldStyle.copyWith(
                    color: !ignorePointers
                        ? null
                        : textFieldProperties.disabledForegroundColor,
                  ),
                  inputFormatters: inputFormatters,
                  autofocus: autofocus,
                  keyboardType: keyboardType,
                  textInputAction: textInputAction,
                  focusNode: focusNode,
                  controller: controller,
                  obscureText: obscureText,
                  textCapitalization: textCapitalization,
                  maxLines: maxLines,
                  onSubmitted: (v) {
                    onSubmitted?.call(v);
                    final next = controller.text;

                    fieldState.didChange(next);
                  },
                  onEditingComplete: onEditingComplete,
                  onChanged: (v) {
                    fieldState.didChange(v);

                    onChanged?.call(v);
                  },
                  decoration: InputDecoration(
                    enabled: !ignorePointers,
                    isDense: true,
                    border: readOnly ? disabledBorder : border,
                    errorBorder: readOnly ? disabledBorder : border,
                    enabledBorder: readOnly ? disabledBorder : border,
                    focusedBorder: readOnly ? disabledBorder : activeBorder,
                    focusedErrorBorder: readOnly ? disabledBorder : border,
                    disabledBorder: disabledBorder,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 8,
                    ),
                    hintText: hintText,
                    hintStyle:
                        context.appTheme.textStyles.textFieldStyle.copyWith(
                      color: textFieldProperties.hintTextColor,
                    ),
                    prefixIcon: fieldState.hasError
                        ? Icon(
                            AppIcons.cancel_outlined,
                            color: statusColors.error,
                          )
                        : null,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 32,
                    ),
                    alignLabelWithHint: true,
                    suffixIcon: suffixIcon == null
                        ? null
                        : Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: suffixIcon,
                          ),
                    suffixIconConstraints: const BoxConstraints(),
                  ),
                ),
              ),
            );
            return textField;
          },
        );
      },
    );
  }
}
