import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapTextDropdownItem<T, L>
    extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapTextDropdownItem({
    required this.dropdownMenuEntries,
    required this.onSelected,
    required this.initialValue,
    required this.field,
    this.isMandatory,
    this.showLabel = true,
    String? label,
    super.readOnly,
  })  : _explicitLabel = label,
        assert(
          label != null || field != null,
          'Either label or field must be provided',
        ),
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );

  final List<NextDropdownMenuEntry<T>> dropdownMenuEntries;
  final void Function(T?) onSelected;
  final String? initialValue;
  final bool? isMandatory;
  final ExtendedField<Enum, L>? field;
  final String? _explicitLabel;
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
    final textFieldWidth = labelPosition == NextCardFormFieldLabelPosition.left
        ? childWidth - UiConstants.leftLabelWidth
        : childWidth;

    final effectiveLabel =
        _explicitLabel ?? field?.readable(l10n, customL10n) ?? super.label;
    final effectiveMandatory = isMandatory ?? (field?.isMandatory ?? false);
    return NextCardDropdownMenu<T>(
      width: textFieldWidth,
      label: effectiveLabel,
      showLabel: showLabel,
      labelPosition: labelPosition,
      dropdownMenuEntries: dropdownMenuEntries,
      isMandatory: effectiveMandatory,
      onSelected: onSelected,
      initialValue: initialValue,
      readOnly: readOnly ?? parentReadOnly,
      validationGroupId: validationGroupId,
    );
  }
}
