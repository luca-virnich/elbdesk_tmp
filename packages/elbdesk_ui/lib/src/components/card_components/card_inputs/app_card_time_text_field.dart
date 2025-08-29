import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A specialized text field widget for time input that displays the entered
/// value converted to minutes.
///
/// This widget uses [NextCardFormField.int] as its base input field and
/// shows the converted time value in minutes next to the input. The input only
/// accepts numeric values and automatically converts them to minutes based on
/// the [minutesMultiplier].

class AppCardTimeTextField extends HookConsumerWidget {
  /// Constructor
  const AppCardTimeTextField({
    required this.validator,
    required this.onChanged,
    required this.label,
    required this.focusOrder,
    required this.value,
    required this.onEmptyValue,
    this.initialValue,
    this.labelPosition = NextCardFormFieldLabelPosition.top,
    this.focusNode,
    this.onClear,
    this.validationGroup,
    this.readOnly = false,
    this.minutesMultiplier = 6, // Default multiplier (1 unit = 6 minutes)
    super.key,
  });

  final bool readOnly;
  final NextCardFormFieldLabelPosition labelPosition;
  final FocusNode? focusNode;
  final int? initialValue;
  final int? value;
  final void Function(int?) onChanged;
  final void Function(String?)? onClear;
  final String label;
  final double? focusOrder;
  final int minutesMultiplier;
  final String? validationGroup;
  final String? Function(String?)? validator;
  final VoidCallback? onEmptyValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NextCardFormField.int(
      outsideTrailingWidgets: [
        Padding(
          padding: const EdgeInsets.only(left: UiConstants.elementMargin),
          child: _TimeDisplay(
            value: value,
            minutesMultiplier: minutesMultiplier,
          ),
        ),
      ],
      focusOrder: focusOrder,
      readOnly: readOnly,
      // onEmptyValue: onEmptyValue,
      onClear: onClear?.call,
      label: label,
      labelPosition: labelPosition,
      focusNode: focusNode,
      initialInt: initialValue,
      // initialValue: initialValue,
      validationGroup: validationGroup,
      validator: validator,
      onChanged: (value) {
        final parsedValue = int.tryParse(value);
        if (parsedValue == null) {
          onEmptyValue?.call();
        } else {
          onChanged(parsedValue);
        }
      },
    );
  }
}

class _TimeDisplay extends StatelessWidget {
  const _TimeDisplay({
    required this.value,
    required this.minutesMultiplier,
  });

  final int? value;
  final int minutesMultiplier;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: 60,
      child: AppText(
        l10n.gen_minutes_abbreviation((value ?? 0) * minutesMultiplier),
        fontWeight: FontWeight.bold,
        maxLines: 1,
      ),
    );
  }
}
