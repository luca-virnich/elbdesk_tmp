import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapAssignUserItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapAssignUserItem({
    required this.onSelected,
    required this.initialUser,
    required this.field,
    String? label,
    super.readOnly,
    this.isMandatory = false,
  })  : _explicitLabel = label,
        assert(
          label != null || field != null,
          'Either label or field must be provided',
        ),
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );
  final String? _explicitLabel;
  final LightUser? initialUser;
  final void Function(LightUser?) onSelected;

  final bool isMandatory;
  final ExtendedField<Enum, L>? field;

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
    final effectiveMandatory = isMandatory || (field?.isMandatory ?? false);
    return NextCardAssignUser(
      isMandatory: effectiveMandatory,
      label: effectiveLabel,
      labelPosition: labelPosition,
      onSelected: onSelected,
      readOnly: readOnly ?? parentReadOnly,
      validationGroupId: validationGroupId ?? '',
      initialUser: initialUser,
    );
  }
}
