import 'package:elbdesk_ui/elbdesk_ui.dart';
// ignore: no_flutter_material_import
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// Filter Value Text Field
///
/// A text field that is used for filtering values
class FilterValueTextField extends StatefulHookWidget {
  /// Constructor
  const FilterValueTextField({
    required this.controller,
    required this.focusNode,
    super.key,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.initialValue,
    this.suffix,
    this.obscure = false,
    this.prefix,
    this.onSubmitted,
    this.validator,
    this.autofocus = false,
    this.prefixText,
    this.hintText,
    this.onChanged,
    this.maxLines = 1,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.borderRadius,
    this.obscurable = false,
    this.filled = false,
    this.fillColor,
    this.readOnly = false,
    this.fixedValidationErrorWidget = false,
  });

  /// Whether the text field is read only
  final bool readOnly;

  /// The floating label behavior
  final FloatingLabelBehavior floatingLabelBehavior;

  /// Whether the error widget is fixed
  final bool fixedValidationErrorWidget;

  /// The controller of the text field
  final TextEditingController controller;

  /// The initial value of the text field
  final String? initialValue;

  /// Whether the text field is obscure
  final bool obscure;

  /// The suffix widget
  final Widget? suffix;

  /// The prefix widget
  final Widget? prefix;

  /// The prefix text
  final String? prefixText;

  /// The max lines of the text field
  final int? maxLines;

  /// The on submitted function
  final void Function(String)? onSubmitted;

  /// The focus node of the text field
  final FocusNode focusNode;

  /// The onChanged function
  final void Function(String)? onChanged;

  /// The validator function
  final String? Function(String?)? validator;

  /// The text input action
  final TextInputAction textInputAction;

  /// Whether the text field is autofocus
  final bool autofocus;

  /// The hint text
  final String? hintText;

  /// The keyboard type
  final TextInputType? keyboardType;

  /// The input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// The border radius
  final BorderRadius? borderRadius;

  /// Whether the text field is filled
  final bool filled;

  /// Whether the text field is obscurable
  final bool obscurable;

  /// The fill color
  final Color? fillColor;

  @override
  State<FilterValueTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<FilterValueTextField> {
  @override
  Widget build(BuildContext context) {
    // the validation mode is disabled by default, so that when we have e.g.
    // a validator of minLength 5, the error message is not shown immediately
    // and while typing the first letters

    final validateMode = useState<AutovalidateMode>(AutovalidateMode.disabled);

    // this only works if the text field is obscurable - it's a build in feature
    final obscurableObscure = useState<bool>(true);

    return FormField<String>(
      initialValue: widget.initialValue,
      validator: widget.validator,
      autovalidateMode: validateMode.value,
      builder: (fieldState) {
        if (fieldState.hasError) {
          // we are settings the validation mode to always as soon the
          // validation was triggerd and we got an error
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            validateMode.value = AutovalidateMode.always;
          });
        }

        final textFieldProperties = context.appTheme.textFieldProperties;
        final statusColors = context.appTheme.statusColors;
        final border = OutlineInputBorder(
          borderRadius: widget.borderRadius ??
              BorderRadius.all(
                Radius.circular(context.appTheme.borderRadiuses.xl),
              ),
          // border red
          borderSide: BorderSide(
            color: fieldState.hasError
                ? statusColors.error
                : textFieldProperties.borderColor,
          ),
        );

        return HookBuilder(
          builder: (context) {
            // we are using the focus node to determine if the user has left the
            // text field. If so, we want to validate the field and show the
            // error message if necessary
            // if the field has an error, we set the validation mode to always
            // so that the error message removed when the user enters a valid
            // text

            useEffect(
              () {
                void focusListener() {
                  if (!widget.focusNode.hasFocus) {
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

                widget.focusNode.addListener(focusListener);

                return () {
                  widget.focusNode.removeListener(focusListener);
                };
              },
              [],
            );
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 6,
                ),
                TextField(
                  readOnly: widget.readOnly,
                  inputFormatters: widget.inputFormatters,
                  autofocus: widget.autofocus,
                  keyboardType: widget.keyboardType,
                  textInputAction: widget.textInputAction,
                  focusNode: widget.focusNode,
                  controller: widget.controller,
                  obscureText: widget.obscurable
                      ? obscurableObscure.value
                      : widget.obscure,
                  maxLines: widget.maxLines,
                  onSubmitted: widget.onSubmitted,
                  onChanged: (v) {
                    fieldState.didChange(v);
                    widget.onChanged?.call(v);
                  },
                  decoration: InputDecoration(
                    constraints:
                        BoxConstraints.tight(const Size.fromHeight(40)),
                    border: border,
                    errorBorder: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    disabledBorder: border,
                    focusedErrorBorder: border,

                    contentPadding: const EdgeInsets.all(
                      AppSpace.m,
                    ),
                    filled: widget.filled,

                    fillColor: widget.fillColor,

                    hintText: widget.hintText,
                    floatingLabelBehavior: widget.floatingLabelBehavior,

                    alignLabelWithHint: true,
                    prefixText: widget.prefixText,
                    prefixStyle:
                        context.appTheme.textStyles.prefixTextTextFieldStyle,
                    prefixIcon: widget.prefix != null
                        ? Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: widget.prefix,
                          )
                        : null,
                    // suffix: suffix,
                    suffixIcon: widget.obscurable
                        ? Padding(
                            padding: const EdgeInsets.only(right: 6),
                            child: IconButton(
                              icon: obscurableObscure.value
                                  ? const Icon(AppIcons.visibility_off)
                                  : const Icon(AppIcons.visibility),
                              onPressed: () {
                                obscurableObscure.value =
                                    !obscurableObscure.value;
                              },
                            ),
                          )
                        : widget.suffix != null
                            ? Padding(
                                padding: const EdgeInsets.only(right: 6),
                                child: widget.suffix,
                              )
                            : null,
                  ),
                ),
                AutoAnimatedSize(
                  expanded:
                      widget.fixedValidationErrorWidget || fieldState.hasError,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 10),
                    child: AppText(
                      maxLines: 1,
                      fieldState.errorText ?? '',
                      color: statusColors.error,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
