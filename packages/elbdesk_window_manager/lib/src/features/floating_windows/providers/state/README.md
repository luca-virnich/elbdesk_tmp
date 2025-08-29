# State Providers

This directory contains providers that manage individual window state.

## Providers

### FloatingWindowIsMaximizedState
- Tracks whether a window is maximized
- Handles maximize/restore transitions
- Per-window state management

### FloatingWindowIsMinimizedState
- Tracks whether a window is minimized
- Handles minimize/restore transitions
- Per-window state management

### FloatingWindowTitleState
- Manages dynamic window title data
- Stores icon and title information
- Supports title updates during runtime

### WindowPositionProvider
- Manages window position updates
- Used for animated position changes
- Handles snap positioning

### WindowStateProvider
- Provides computed window states
- Combines multiple state providers
- Offers convenience methods for state checks