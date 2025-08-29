import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapSelectionDropdownItem<L>
    extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapSelectionDropdownItem({
    required super.label,
    required this.items,
    required this.statusColor,
    required this.isMandatory,
    super.readOnly,
    this.hasValue = false,
    this.initialValue,
  });
  final List<ElbSelectionDropdownItem> items;

  final String? initialValue;
  final bool isMandatory;
  final Color statusColor;
  final bool hasValue;

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
    return ElbCardSelectionDropdown(
      buttonLabel: initialValue ?? label,
      labelPosition: labelPosition,
      items: items,
      isMandatory: isMandatory,
      readOnly: readOnly ?? parentReadOnly,
      label: label,
      statusColor: statusColor,
      hasValue: hasValue,
    );
  }
}
