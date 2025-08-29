import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ElbCardSelectionDropdown extends HookWidget {
  const ElbCardSelectionDropdown({
    required this.label,
    required this.buttonLabel,
    required this.statusColor,
    required this.items,
    required this.labelPosition,
    required this.readOnly,
    required this.isMandatory,
    required this.hasValue,
    this.focusOrderId,
    this.maxWidth = 300,
    this.alignment = Alignment.centerRight,
    super.key,
  });
  final String label;
  final String buttonLabel;
  final Color statusColor;
  final List<ElbSelectionDropdownItem> items;
  final NextCardFormFieldLabelPosition labelPosition;
  final bool readOnly;
  final double? focusOrderId;
  final double maxWidth;
  final Alignment alignment;
  final bool isMandatory;
  final bool hasValue;
  @override
  Widget build(BuildContext context) {
    final errorMessage = useState<String?>(null);
    return FormField<bool>(
      initialValue: hasValue,
      validator: (value) {
        if (!isMandatory) return null;
        if (isMandatory && !hasValue) {
          errorMessage.value = 'Bitte wählen'.hc;
          return errorMessage.value;
        }
        errorMessage.value = null;
        return null;
      },
      builder: (context) {
        return Padding(
          padding: UiConstants.cardFieldPadding,
          child: labelPosition == NextCardFormFieldLabelPosition.left
              ? Row(
                  children: [
                    SizedBox(
                      width: UiConstants.leftLabelWidth,
                      child: AppText(label),
                    ),
                    Expanded(
                      child: ElbSelectionDropdown(
                        focusOrderId: focusOrderId,
                        errorMessageNotifier: errorMessage,
                        readOnly: readOnly,
                        buttonLabel: buttonLabel,
                        buttonStatusColor: statusColor,
                        items: items,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppText(label),
                    ElbSelectionDropdown(
                      focusOrderId: focusOrderId,
                      errorMessageNotifier: errorMessage,
                      readOnly: readOnly,
                      buttonLabel: buttonLabel,
                      buttonStatusColor: statusColor,
                      items: items,
                    ),
                  ],
                ),
        );
      },
    );
  }
}
