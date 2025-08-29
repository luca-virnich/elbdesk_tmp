import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class ElbTwoColumnWrap<L> extends ConsumerWidget {
  const ElbTwoColumnWrap({
    required this.columnLeft,
    required this.columnRight,
    required this.width,
    required this.readOnly,
    required this.validationGroupId,
    required this.customL10n,
    this.tableType,
    this.breakpoint = UiConstants.twoColumnWrapBreakpointWidth,
    this.runSpacing,
    super.key,
  });

  final List<ElbTwoColumnWrapItemBase<L>> columnLeft;
  final List<ElbTwoColumnWrapItemBase<L>> columnRight;
  final double width;
  final double breakpoint;
  final double? runSpacing;
  final bool? readOnly;
  final String? validationGroupId;

  final String? tableType;
  final L customL10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final isTwoColumns = width > breakpoint;
    final labelPosition = width > 300
        ? NextCardFormFieldLabelPosition.left
        : NextCardFormFieldLabelPosition.top;
    final childWidth = isTwoColumns
        ? (width - UiConstants.twoColumnWrapHorizontalSpacing) / 2
        : width;

    // Build the column widgets
    final leftColumnWidget = SizedBox(
      width: childWidth,
      child: FocusTraversalGroup(
        child: Column(
          children: columnLeft.map((item) {
            return item.buildWidget(
              labelPosition: labelPosition,
              parentReadOnly: readOnly ?? false,
              validationGroupId: validationGroupId,
              l10n: l10n,
              tableType: tableType,
              customL10n: customL10n,
              childWidth: childWidth,
            );
          }).toList(),
        ),
      ),
    );

    final rightColumnWidget = SizedBox(
      width: childWidth,
      child: FocusTraversalGroup(
        child: Column(
          children: columnRight.map((item) {
            return item.buildWidget(
              labelPosition: labelPosition,
              parentReadOnly: readOnly ?? false,
              validationGroupId: validationGroupId,
              l10n: l10n,
              tableType: tableType,
              customL10n: customL10n,
              childWidth: childWidth,
            );
          }).toList(),
        ),
      ),
    );

    // Use single Wrap for both layouts to preserve state
    return Wrap(
      spacing: UiConstants.twoColumnWrapHorizontalSpacing,
      runSpacing: runSpacing ?? 0,
      children: [leftColumnWidget, rightColumnWidget],
    );
  }
}

// Base class for all items
abstract class ElbTwoColumnWrapItemBase<L> {
  ElbTwoColumnWrapItemBase({
    required this.label,
    this.readOnly,
    this.validationGroupId,
  });

  final String label;
  final bool? readOnly;
  final String? validationGroupId;

  Widget buildWidget({
    required NextCardFormFieldLabelPosition labelPosition,
    required bool parentReadOnly,
    required String? validationGroupId,
    required ElbCoreLocalizations l10n,
    required String? tableType,
    required L customL10n,
    required double childWidth,
  });
}
