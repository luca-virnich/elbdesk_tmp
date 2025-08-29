import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapDateTimeItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapDateTimeItem({
    required this.onChanged,
    required this.field,
    String? label,
    this.initialDate,
    this.validator,
    this.showLabel = true,
    super.readOnly,
    this.isMandatory,
  })  : _explicitLabel = label,
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );

  final String? _explicitLabel;
  final DateTime? initialDate;
  final void Function(DateTime?) onChanged;
  final String? Function(DateTime?)? validator;
  final bool? isMandatory;
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
    // final effectiveValidator = validator ?? field?.validator(l10n, customL10n);
    final effectiveMandatory = isMandatory ?? (field?.isMandatory ?? false);
    return NextCardDateTimeField(
      label: effectiveLabel,
      showLabel: showLabel,
      labelPosition: labelPosition,
      currentDateTime: initialDate,
      onChanged: onChanged,
      readOnly: readOnly ?? parentReadOnly,
      focusOrder: null,
      isMandatory: effectiveMandatory,
    );
  }
}
