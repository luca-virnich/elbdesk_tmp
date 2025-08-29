import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class NextCardDateTimeField extends HookWidget {
  const NextCardDateTimeField({
    required this.currentDateTime,
    required this.labelPosition,
    required this.label,
    required this.readOnly,
    required this.onChanged,
    required this.focusOrder,
    required this.isMandatory,
    this.showLabel = true,
    super.key,
  });
  final DateTime? currentDateTime;
  final NextCardFormFieldLabelPosition labelPosition;
  final String? label;
  final bool readOnly;
  final void Function(DateTime?) onChanged;
  final double? focusOrder;
  final bool showLabel;
  final bool isMandatory;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final localeTime = useRef<TimeOfDay>(
      TimeOfDay(
        hour: currentDateTime?.hour ?? 0,
        minute: currentDateTime?.minute ?? 0,
      ),
    );

    return Padding(
      padding: UiConstants.cardFieldPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelPosition == NextCardFormFieldLabelPosition.top && showLabel)
            AppText(label ?? ''),
          Row(
            children: [
              if (labelPosition == NextCardFormFieldLabelPosition.left &&
                  showLabel)
                SizedBox(
                  width: UiConstants.leftLabelWidth,
                  child: label == null
                      ? const SizedBox.shrink()
                      : NextAppFieldLeftLabel(
                          label: label!,
                          maxLines: 1,
                        ),
                ),
              Expanded(
                flex: 2,
                child: NextDateField(
                  focusOrder: focusOrder,
                  validator: (v) {
                    if (isMandatory && v == null) {
                      return l10n.date_time_please_choose;
                    }
                    return null;
                  },
                  readOnly: readOnly,
                  initialDate: currentDateTime != null
                      ? DateTime(
                          currentDateTime!.year,
                          currentDateTime!.month,
                          currentDateTime!.day,
                        )
                      : null,
                  validationGroupId: null,
                  onChanged: (v) {
                    if (v == null) {
                      onChanged(null);
                    } else {
                      final date = DateTime(
                        v.year,
                        v.month,
                        v.day,
                        localeTime.value.hour,
                        localeTime.value.minute,
                      );
                      onChanged(date);
                    }
                  },
                ),
              ),
              const SizedBox(width: UiConstants.defaultPadding),
              Expanded(
                flex: 1,
                child: ExcludeFocus(
                  excluding: readOnly || currentDateTime == null,
                  child: NextTimeField(
                    focusOrder:
                        focusOrder != null ? focusOrder! + 0.00001 : null,
                    initialTime: currentDateTime != null
                        ? TimeOfDay(
                            hour: currentDateTime!.hour,
                            minute: currentDateTime!.minute,
                          )
                        : null,
                    validationGroupId: null,
                    validator: (v) {
                      if (isMandatory && v == null) {
                        return l10n.time_please_choose;
                      }
                      return null;
                    },
                    onChanged: (v) {
                      if (v == null) {
                        if (currentDateTime == null) return;
                        onChanged(
                          DateTime(
                            currentDateTime!.year,
                            currentDateTime!.month,
                            currentDateTime!.day,
                          ),
                        );
                        localeTime.value = const TimeOfDay(hour: 0, minute: 0);
                      } else {
                        localeTime.value = v;
                        if (currentDateTime == null) return;
                        final date = DateTime(
                          currentDateTime!.year,
                          currentDateTime!.month,
                          currentDateTime!.day,
                          v.hour,
                          v.minute,
                        );
                        onChanged(date);
                      }
                    },
                    readOnly: readOnly || currentDateTime == null,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
