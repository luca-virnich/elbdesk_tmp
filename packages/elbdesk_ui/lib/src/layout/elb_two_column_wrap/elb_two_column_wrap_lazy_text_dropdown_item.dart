import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTwoColumnWrapLazyTextDropdownItem<T, L>
    extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapLazyTextDropdownItem({
    required this.dataProvider,
    required this.onSelected,
    required this.itemLabelBuilder,
    required this.initialValue,
    required this.field,
    String? label,
    this.controller,
    this.isMandatory,
    this.outsideTrailing,
    this.focusNode,
    super.readOnly,
  })  : _explicitLabel = label,
        assert(
          label != null || field != null,
          'Either label or field must be provided',
        ),
        super(
          label: label ?? 'placeholder', // Will be computed in buildWidget
        );

  final ProviderListenable<AsyncValue<List<T>>> dataProvider;
  final void Function(T?) onSelected;
  final String Function(T) itemLabelBuilder;
  final String? initialValue;
  final bool? isMandatory;
  final Widget? outsideTrailing;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? _explicitLabel;
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
    final label =
        _explicitLabel ?? field?.readable(l10n, customL10n) ?? super.label;
    final effectiveMandatory = isMandatory ?? (field?.isMandatory ?? false);
    final textFieldWidth = labelPosition == NextCardFormFieldLabelPosition.left
        ? childWidth - UiConstants.leftLabelWidth
        : childWidth;
    return NextCardLazyDropdownMenu<T>(
      width: textFieldWidth,
      controller: controller,
      label: label,
      labelPosition: labelPosition,
      dataProvider: dataProvider,
      focusNode: focusNode,
      onSelected: onSelected,
      labelBuilder: itemLabelBuilder,
      initialValue: controller == null ? (initialValue ?? '') : null,
      readOnly: readOnly ?? parentReadOnly,
      validationGroupId: validationGroupId,
      isMandatory: effectiveMandatory,
      outsideTrailing: outsideTrailing,
    );
  }
}
