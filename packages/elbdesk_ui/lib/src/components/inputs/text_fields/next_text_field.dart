import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NextTextField extends StatelessWidget {
  const NextTextField({
    super.key,
    this.readOnly = false,
    this.hasError = false,
    this.hintText,
    this.leadingIcon,
    this.controller,
    this.onChanged,
    this.suffix,
    this.keyboardType,
    this.enabled,
    this.isInTableCell = false,
    this.mouseCursor,
    this.canRequestFocus = true,
    this.enableInteractiveSelection,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.style,
    this.onEditingComplete,
    this.onTap,
    this.inputFormatters,
    this.onSubmitted,
    this.maxLines = 1,
    this.contentPadding,
    this.textInputAction = TextInputAction.next,
    this.minLines,
    this.obscureText = false,
    this.maxLength,
    this.autofocus = false,
    this.borderColor,
    this.textColor,
  });
  final bool readOnly;
  final bool hasError;
  final String? hintText;
  final Widget? leadingIcon;

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final bool? enabled;
  final MouseCursor? mouseCursor;
  final bool canRequestFocus;
  final bool? enableInteractiveSelection;

  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? style;
  final bool isInTableCell;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final int? maxLines;
  final void Function(String)? onSubmitted;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final int? minLines;
  final bool obscureText;
  final bool autofocus;
  final Color? borderColor;
  final Color? textColor;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    final textFieldProperties = context.appTheme.textFieldProperties;
    final statusColors = context.appTheme.statusColors;
    final textFieldStyle = context.appTheme.textStyles.textFieldStyle;
    final borderRadiuses = context.appTheme.borderRadiuses;

    final borderRadius = BorderRadius.all(Radius.circular(borderRadiuses.s));
    final border = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: hasError
            ? statusColors.error
            : isInTableCell
                ? context.appTheme.generalColors.transparent
                : borderColor ?? textFieldProperties.borderColor,
      ),
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: isInTableCell
            ? context.appTheme.generalColors.transparent
            : hasError
                ? statusColors.error
                : textFieldProperties.disabledBorderColor,
      ),
    );

    final activeBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide(
        color: hasError
            ? statusColors.error
            : borderColor ?? context.appTheme.generalColors.primary,
        width: 2,
      ),
    );
    return TextField(
      obscureText: obscureText,
      autofocus: autofocus,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      focusNode: focusNode,
      maxLength: maxLength,
      minLines: minLines,
      onSubmitted: (v) {
        onSubmitted?.call(v);
      },
      readOnly: readOnly,
      style: textFieldStyle.copyWith(
        color:
            readOnly ? textFieldProperties.disabledForegroundColor : textColor,
        // height: 0.8,
      ),
      inputFormatters: inputFormatters,
      canRequestFocus: canRequestFocus,
      enableInteractiveSelection: enableInteractiveSelection,
      keyboardType: textInputAction == TextInputAction.newline
          ? TextInputType.multiline
          : keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      mouseCursor: mouseCursor,
      textAlign: textAlign,
      textAlignVertical: TextAlignVertical.center,
      cursorHeight: UiConstants.textFieldCursorHeight,
      onEditingComplete: () {
        onEditingComplete?.call();
      },
      onTap: onTap,
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        border: readOnly ? disabledBorder : border,
        errorBorder: readOnly ? disabledBorder : border,
        enabledBorder: readOnly ? disabledBorder : border,
        focusedBorder: readOnly ? disabledBorder : activeBorder,
        focusedErrorBorder: readOnly ? disabledBorder : border,
        disabledBorder: disabledBorder,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 6,
            ),
        // hintText: 'cool',
        hintText: hintText,
        hintStyle: textFieldStyle.copyWith(
          color: textFieldProperties.hintTextColor,
        ),
        prefixIcon: leadingIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UiConstants.elementMargin,
                ),
                child: leadingIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
            // minWidth: 32,
            ),
        alignLabelWithHint: true,
        suffixIcon: suffix != null
            ? Padding(
                padding: const EdgeInsets.only(right: 4),
                child: suffix,
              )
            : null,
        suffixIconConstraints: const BoxConstraints(),
      ),
    );
  }
}
