import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapCustomItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapCustomItem({
    required super.label,
    required this.childBuilder,
    super.readOnly,
  });

  final Widget Function(NextCardFormFieldLabelPosition labelPosition)
      childBuilder;

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
    return childBuilder(labelPosition);
  }
}
