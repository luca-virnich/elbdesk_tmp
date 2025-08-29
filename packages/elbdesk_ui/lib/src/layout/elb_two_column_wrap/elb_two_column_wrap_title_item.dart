import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTwoColumnWrapTitleItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapTitleItem({
    required super.label,
    super.readOnly,
  });

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
    return Padding(
      padding: UiConstants.cardFieldPadding,
      child: Align(
        alignment: Alignment.centerLeft,
        child: AppText(
          label,
          textAlign: TextAlign.left,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
