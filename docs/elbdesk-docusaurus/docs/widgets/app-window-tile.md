# AppWindowTile

A responsive layout widget used for displaying a title, subtitle, and configurable content area.
`AppWindowTile` provides a consistent layout pattern for AppWindow pages, with support for both normal (wide) and small (narrow) screen layouts. It automatically adjusts its layout based on the available width. It can be used inside an `AppWindow`.

## Features

- Responsive layout that adapts to screen width
- Title and subtitle support
- Configurable content area
- Built-in spacing and divider
- Special handling for text field inputs

## Properties

| Property | Type | Description |
|----------|------|-------------|
| `title` | `String` | The main heading text |
| `subTitle` | `String` | The descriptive text below the title |
| `content` | `Widget Function(double width)` | Builder function for the content area that returns the width for example for `AppDropdownMenu` |
| `isTextField` | `bool` | Adjusts spacing when content contains textfields or dropdowns because of the label position |

## Layout Behavior

- **Normal Layout** (> 600px):
  - Title and subtitle on the left (1/3 width)
  - Content area on the right (2/3 width)
  - Subtitle visible

- **Small Layout** (≤ 600px):
  - Title on top
  - Content area below
  - Subtitle hidden

## Usage

```dart
AppWindowTile(
  isTextField: true,
  title: 'Title',
  subTitle: 'Subtitle',
  content: (width) => AppDropdownMenu<T>(
    labelPosition: AppTextFieldLabelPosition.top,
    labelText: '',
    dropdownMenuEntries: allValues.map((value) {
      return AppDropdownMenuEntry(
            value: value,
            label: value.displayName,
        );
    }).toList(),
    focusNode: focusNode,
    isMandatory: true,
    onSelected: (value) {
        if (value != null) {
            // handle onSelected
        }
    },
    readOnly: false,
    initialSelection: initialValue,
    previousFocusNode: null,
    focusOrderId: 1,
    width: width,
  ),
);
```