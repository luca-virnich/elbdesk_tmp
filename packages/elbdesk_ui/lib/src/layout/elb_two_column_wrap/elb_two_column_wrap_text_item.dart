import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTwoColumnWrapTextItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapTextItem({
    required this.field,
    String? label,
    this.validator,
    this.initialText,
    this.onChanged,
    super.readOnly,
    this.canClear = true,
    this.customErrorMessageNotifier,
    this.controller,
    this.keyboardType,
    this.maxLines,
    this.minLines,
    this.outsideTrailingWidgets,
    this.onClear,
    this.maxLength,
    this.hintText,
    this.showLabel = true,
  })  : _explicitLabel = label,
        assert(
          label != null || field != null,
          'Either label or field must be provided',
        ),
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );

  final String? _explicitLabel;
  final ExtendedField<Enum, L>? field;

  final String? initialText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool canClear;
  final ValueNotifier<String?>? customErrorMessageNotifier;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final void Function(String?)? onClear;
  final int? maxLength;
  final String? hintText;
  final List<Widget>? outsideTrailingWidgets;
  final bool showLabel;

  @override
  Widget buildWidget({
    required NextCardFormFieldLabelPosition labelPosition,
    required bool parentReadOnly,
    required String? validationGroupId,
    required ElbCoreLocalizations l10n,
    required String? tableType,
    required L customL10n,
    required double childWidth,
  }) {
    // Use explicit values if provided, otherwise fall back to field values
    final effectiveValidator = validator ?? field?.validator(l10n, customL10n);
    final effectiveKeyboardType =
        keyboardType ?? field?.keyboardType ?? TextInputType.text;
    final effectiveMaxLines = maxLines ?? field?.maxLines ?? 1;
    final effectiveMinLines = minLines ?? field?.minLines ?? 1;

    // Compute label here where we have access to effective l10n
    final effectiveLabel =
        _explicitLabel ?? field?.readable(l10n, customL10n) ?? super.label;

    final fieldSuggestion = (tableType == null || field == null)
        ? null
        : FieldSuggestion(
            tableType: tableType,
            fieldKey: field!.value.name,
            fieldType: FilterFieldType.text,
          );

    return NextCardFormField.text(
      customErrorMessageNotifier: customErrorMessageNotifier,
      label: effectiveLabel,
      showLabel: showLabel,
      labelPosition: labelPosition,
      maxLength: maxLength,
      initialText: initialText,
      onChanged: onChanged,
      validator: effectiveValidator,
      readOnly: readOnly ?? parentReadOnly,
      validationGroup: validationGroupId,
      onClear: onClear ?? (canClear ? (value) => onChanged?.call('') : null),
      controller: controller,
      keyboardType: effectiveKeyboardType,
      maxLines: effectiveMaxLines,
      minLines: effectiveMinLines,
      fieldSuggestion: fieldSuggestion,
      hint: hintText,
      outsideTrailingWidgets:
          outsideTrailingWidgets != null && outsideTrailingWidgets!.isNotEmpty
              ? [const SizedBox(width: 1), ...outsideTrailingWidgets!]
              : null,
    );
  }
}
