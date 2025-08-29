import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// A toggle button widget that switches between primary and secondary styles.
///
/// This widget uses hooks to manage its state. It displays a primary button
/// when selected and a secondary button when not selected. The button label
/// and icon change based on the selection state.
class AppToggleButton extends HookWidget {
  /// Creates an [AppToggleButton].
  ///
  /// The [label] is required.
  /// The [onChanged] callback is required.
  /// The [icon] is optional and if not provided, no icon will be shown.
  /// The [initialValue] determines the initial state of the toggle.
  /// The [selectedLabel] is displayed when the button is selected (defaults
  /// to [label] if not provided).
  /// The [selectedIcon] is displayed when the button is selected (defaults to
  /// [icon] if not provided).
  /// The [tooltip] is optional and provides additional information when
  /// hovering.
  const AppToggleButton({
    required this.onChanged,
    this.label,
    super.key,
    this.icon,
    this.initialValue = false,
    this.selectedLabel,
    this.selectedIcon,
    this.tooltip,
  });

  /// The default label to display when the button is not selected.
  final String? label;

  /// The optional default icon to display when the button is not selected.
  final IconData? icon;

  /// Callback function that is called when the toggle state changes.
  final ValueChanged<bool> onChanged;

  /// The initial state of the toggle button.
  final bool initialValue;

  /// The optional label to display when the button is selected.
  /// If not provided, [label] will be used instead.
  final String? selectedLabel;

  /// The optional icon to display when the button is selected.
  /// If not provided, [icon] will be used instead.
  final IconData? selectedIcon;

  /// Optional tooltip to show on hover.
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final isSelected = useState<bool>(initialValue);

    return isSelected.value
        ? AppButton.primary(
            iconData: selectedIcon ?? icon,
            label: selectedLabel ?? label,
            tooltip: tooltip,
            onPressed: () {
              isSelected.value = !isSelected.value;
              onChanged(isSelected.value);
            },
          )
        : AppButton.secondary(
            iconData: icon,
            label: label,
            tooltip: tooltip,
            onPressed: () {
              isSelected.value = !isSelected.value;
              onChanged(isSelected.value);
            },
          );
  }
}
