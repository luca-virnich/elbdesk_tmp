import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapDateItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapDateItem({
    required this.onChanged,
    required this.initialDate,
    required this.field,
    String? label,
    this.validator,
    this.showLabel = true,
    super.readOnly,
    this.onClear,
  })  : _explicitLabel = label,
        assert(
          label != null || field != null,
          'Either label or field must be provided',
        ),
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );
  final String? _explicitLabel;
  final DateTime? initialDate;
  final void Function(DateTime?) onChanged;
  final String? Function(DateTime?)? validator;
  final void Function(String?)? onClear;
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

    // Use dateValidator from field if available, otherwise use provided validator
    final effectiveValidator =
        validator ?? field?.dateValidator(l10n, customL10n);

    return NextCardDateField(
      label: effectiveLabel,
      showLabel: showLabel,
      labelPosition: labelPosition,
      initialDate: initialDate,
      onChanged: onChanged,
      validator: effectiveValidator,
      readOnly: readOnly ?? parentReadOnly,
      validationGroupId: validationGroupId ?? '',
      onClear: onClear,
    );
  }
}
