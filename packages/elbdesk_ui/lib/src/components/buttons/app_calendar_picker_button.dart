import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A custom calendar picker widget that shows a calendar overlay when the
/// button is pressed.
///
/// The [AppCalendarPickerButton] widget is a stateless widget that displays a
/// calendar icon button. When the button is pressed, it shows a calendar
/// overlay. The user can select a date from the calendar, and the
/// [onDateChanged] callback is triggered with the selected date.
///
/// {@tool snippet}
/// This example shows how to use [AppCalendarPickerButton] in a Flutter application:
///
/// ```dart
/// AppCalendarPicker(
///   initialDate: DateTime.now(),
///   onDateChanged: (date) {
///     print('Selected date: $date');
///   },
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [AppIconButton], which is the underlying button widget used.
///  * `AppCompositedOverlay`, which is used to show the calendar overlay.
///  * [AppCalendar], which is the calendar widget used in the overlay.
class AppCalendarPickerButton extends HookWidget {
  /// Creates an [AppCalendarPickerButton] widget.
  ///
  /// The [initialDate] and [onDateChanged] parameters must not be null.
  const AppCalendarPickerButton({
    required this.initialDate,
    required this.onDateChanged,
    required this.containerKey,
    required this.readOnly,
    required this.onPickerOpenChanged,
    super.key,
  });

  /// The initial date to be selected when the calendar is first displayed.
  final DateTime? initialDate;

  /// Callback function that is called when the date is changed.
  final void Function(DateTime) onDateChanged;

  final GlobalKey containerKey;
  final bool readOnly;

  final void Function(bool) onPickerOpenChanged;
  @override
  Widget build(BuildContext context) {
    final buttonKey = useMemoized(GlobalKey.new);

    return TableOverlay(
      yOffset: UiConstants.buttonHeight,
      preferredMinWidth: 300,
      alignRight: true,
      containerKey: containerKey,
      builder: (showOverlay, hideOverlay, isOpen) {
        // onPickerOpenChanged(isOpen);
        return AppIconButton.secondary(
          skipTraversal: true,
          key: buttonKey,
          fixedSize: const Size(
            UiConstants.buttonHeight,
            UiConstants.buttonHeight,
          ),
          iconData: isOpen ? AppIcons.close : AppIcons.calendar_today,
          onPressed: readOnly
              ? null
              : isOpen
                  ? hideOverlay
                  : showOverlay,
        );
      },
      overlayContent: (closeOverlay) {
        return _Overlay(
          onDateChanged: onDateChanged,
          onPickerOpenChanged: onPickerOpenChanged,
          initialDate: initialDate,
          closeOverlay: closeOverlay,
        );
      },
    );
  }
}

class _Overlay extends HookWidget {
  const _Overlay({
    required this.onDateChanged,
    required this.onPickerOpenChanged,
    required this.initialDate,
    required this.closeOverlay,
  });

  final void Function(DateTime p1) onDateChanged;
  final void Function(bool p1) onPickerOpenChanged;
  final DateTime? initialDate;
  final void Function() closeOverlay;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        onPickerOpenChanged(true);
        return null;
      },
      [],
    );

    return SizedBox(
      width: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: AppSpace.xs,
          ),
          AppWindow.fixed(
            contentPadding: EdgeInsets.zero,
            child: AppCalendar(
              onApply: (date) {
                onDateChanged(date);
                closeOverlay();
                onPickerOpenChanged(false);
              },
              initialDate: initialDate,
            ),
          ),
        ],
      ),
    );
  }
}
