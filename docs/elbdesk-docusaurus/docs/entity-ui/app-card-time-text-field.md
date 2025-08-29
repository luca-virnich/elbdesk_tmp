---
sidebar_position: 6
---

# AppCardTimeTextField

The `AppCardTimeTextField` is a specialized text field widget designed for time input that automatically converts entered numeric values into minutes. It combines a numeric input field `NextCardFormField.integer` with a minutes display.

## Key Features

- Numeric input field with automatic minutes conversion
- Real-time display of converted minutes value
- Built on top of `NextCardFormField.int`
- Form validation support
- Configurable time conversion multiplier
- Read-only mode support
- Flexible label positioning (top or left)
- Focus management and traversal support

## Properties

| Property | Type | Description |
|----------|------|-------------|
| `label` | `String` | The label text displayed for the field |
| `value` | `int?` | Current numeric value. |
| `minutesMultiplier` | `int` | Conversion factor for minutes (default: 6) |
| `onChanged` | `Function(int?)` | Callback when value changes |
| `validator` | `String? Function(String?)?` | Validation function. Ideally taken from the corresponding FieldWrapper |
| `focusOrder` | `double?` | Order in focus traversal sequence |
| `readOnly` | `bool` | Controls whether the field is editable |
| `labelPosition` | `AppTextFieldLabelPosition` | Position of the label |
| `initialValue` | `int?` | Initial value when field is first created |
| `validationGroup` | `String?` | Group identifier for form validation to display an error Icon on the corresponding `CardNavigationItem` |
| `focusNode` | `FocusNode?` | For custom focus management |
| `onClear` | `Function(String?)?` | Callback when field is cleared |

## Basic Usage

The field will display both the entered numeric value and its equivalent in minutes. For example, if `minutesMultiplier` is 6 and the user enters "10", the widget will show "60m" next to the input field.

```dart
AppCardTimeTextField(
  label: 'Working Hours',
  value: workingHoursController.text,
  minutesMultiplier: 6, // Each unit represents 6 minutes
  onChanged: (value) {
    // write to state...
  },
  validator: (value) => WorkingHoursFieldWrapper(
    WorkingHoursField.workingHours,
    ).validator(context.l10n)?.call(value),
  focusOrder: 1,
);
```
