import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AppTextField extends HookWidget {
  const AppTextField({
    required this.label,
    super.key,
    this.onChanged,
    this.onTap,
    this.onTapAlwaysCalled,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.controller,
    this.focusNode,
    this.readOnly = false,
    this.ignorePointers = false,
    this.hintText,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction,
    this.autofocus = false,
    this.obscureText = false,
    this.maxLines,
    this.minLines,
    this.expands = false,
    this.maxLength,
  });

  final String? label;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool ignorePointers;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function()? onTapAlwaysCalled;
  final void Function()? onTapOutside;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final controller = this.controller ?? useTextEditingController();
    final focusNode = this.focusNode ?? useFocusNode();
    final appColors = context.appTheme.generalColors;
    final textFieldProperties = context.appTheme.textFieldProperties;
    final styles = context.appTheme.textStyles.textFieldStyle;
    final borderRadiuses = context.appTheme.borderRadiuses;

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadiuses.xs),
      ),
      borderSide: BorderSide(
        color: textFieldProperties.borderColor,
      ),
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadiuses.xs),
      ),
      borderSide: BorderSide(
        color: textFieldProperties.disabledBorderColor,
      ),
    );

    final activeBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(borderRadiuses.xs),
      ),
      borderSide: BorderSide(
        color: appColors.primary,
        width: 2,
      ),
    );
    return
        // TODO(all): fix, old code:
        // Theme(
        //   data: context.theme.copyWith(
        //     textSelectionTheme: TextSelectionThemeData(
        //       cursorColor: appColors.primary,
        //     ),
        //   ),
        //   child:

        Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) AppText(label!, autoSize: false),
        TextField(
          controller: controller,
          focusNode: focusNode,
          style: context.appTheme.textStyles.textFieldStyle.copyWith(
            color: readOnly || ignorePointers
                ? textFieldProperties.disabledForegroundColor
                : null,
          ),
          decoration: InputDecoration(
            enabled: !ignorePointers,
            isDense: true,
            border: readOnly ? disabledBorder : border,
            errorBorder: readOnly ? disabledBorder : border,
            enabledBorder: readOnly ? disabledBorder : border,
            focusedBorder: readOnly ? disabledBorder : activeBorder,
            focusedErrorBorder: readOnly ? disabledBorder : border,
            disabledBorder: disabledBorder,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 32,
            ),
            alignLabelWithHint: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            hintText: hintText,
            hintStyle: styles.copyWith(
              color: textFieldProperties.hintTextColor,
            ),
            suffixIconConstraints: const BoxConstraints(),
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          autofocus: autofocus,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: maxLines,
          minLines: minLines,
          expands: expands,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          enabled: !ignorePointers,
          ignorePointers: ignorePointers,
          cursorHeight: UiConstants.textFieldCursorHeight,
        ),
      ],
    );
  }
}
