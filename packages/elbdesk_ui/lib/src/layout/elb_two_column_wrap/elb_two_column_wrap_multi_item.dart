import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ElbTwoColumnWrapMultiItem<L> extends ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapMultiItem({
    required super.label,
    required this.fields,
  });
  final List<Widget> fields;

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelPosition == NextCardFormFieldLabelPosition.top) AppText(label),
        Row(
          children: [
            if (labelPosition == NextCardFormFieldLabelPosition.left)
              SizedBox(
                width: UiConstants.leftLabelWidth,
                child: NextAppFieldLeftLabel(
                  label: label,
                  maxLines: 1,
                ),
              ),
            Expanded(
              child: Row(
                spacing: UiConstants.defaultPadding,
                children: fields.map((e) => Expanded(child: e)).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
