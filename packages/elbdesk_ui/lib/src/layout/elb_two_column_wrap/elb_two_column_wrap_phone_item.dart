import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapPhoneItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapPhoneItem({
    required this.field,
    String? label,
    this.initialPhone,
    this.onChanged,
    this.validator,
    this.showLabel = true,
    super.readOnly,
  })  : _explicitLabel = label,
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );

  final String? _explicitLabel;
  final String? initialPhone;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
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
    final effectiveLabel =
        _explicitLabel ?? field?.readable(l10n, customL10n) ?? super.label;
    final effectiveValidator = validator ?? field?.validator(l10n, customL10n);
    return NextCardFormField.phone(
      label: effectiveLabel,
      labelPosition: labelPosition,
      initialText: initialPhone,
      showLabel: showLabel,
      onChanged: onChanged,
      validator: effectiveValidator,
      readOnly: readOnly ?? parentReadOnly,
      validationGroup: validationGroupId,
    );
  }
}
