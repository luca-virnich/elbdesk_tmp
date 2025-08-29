# Keyboard Shortcuts

This module implements keyboard shortcuts for the ElbDesk Window Manager.

## Available Shortcuts

### Window Overview
- **Alt + Tab**: Toggle window overview
- **Ctrl + Tab**: Toggle window overview

Both shortcuts perform the same action - they toggle the visibility of the window overview, which shows all open windows in a grid layout.

## Implementation Details

The keyboard shortcuts are implemented using Flutter's `Shortcuts` and `Actions` system:

1. **Intent**: `ToggleWindowOverviewIntent` - Represents the user's intention to toggle the window overview
2. **Shortcuts**: Map keyboard combinations to the intent
3. **Actions**: Handle the intent by toggling the `windowOverviewVisibleProvider` state

The shortcuts are integrated directly into the `ElbDeskWindowManager` widget, making them available throughout the window manager.

## Adding New Shortcuts

To add new keyboard shortcuts:

1. Create a new Intent class in `intents/window_manager_intent.dart`
2. Add the keyboard combination to the `shortcuts` map in `ElbDeskWindowManager`
3. Add the corresponding action to the `actions` map
4. Implement the action's behavior in the `onInvoke` callback