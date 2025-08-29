import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapIntItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapIntItem({
    required this.field,
    String? label,
    this.value,
    this.onChanged,
    this.onClear,
    this.validator,
    this.showLabel = true,
    super.readOnly,
    this.returnEmptyAs0 = false,
    this.showInitialEmptyOrNullValueAs0 = false,
  })  : _explicitLabel = label,
        assert(
          label != null || field != null,
          'Either label or field must be provided',
        ),
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );

  final String? _explicitLabel;
  final int? value;
  final void Function(int?)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onClear;
  final bool returnEmptyAs0;
  final bool showInitialEmptyOrNullValueAs0;
  final ExtendedField<Enum, L>? field;
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
    final effectiveValidator = validator ?? field?.validator(l10n, customL10n);
    final effectiveLabel =
        _explicitLabel ?? field?.readable(l10n, customL10n) ?? super.label;

    return NextCardFormField.int(
      label: effectiveLabel,
      showLabel: showLabel,
      labelPosition: labelPosition,
      initialInt: showInitialEmptyOrNullValueAs0 && value == null ? 0 : value,
      onClear: onClear,
      onChanged: onChanged != null
          ? (v) {
              if (returnEmptyAs0 && v.isEmpty) {
                onChanged?.call(0);
              } else {
                onChanged?.call(int.tryParse(v));
              }
            }
          : null,
      validator: effectiveValidator,
      readOnly: readOnly ?? parentReadOnly,
      validationGroup: validationGroupId ?? '',
    );
  }
}
