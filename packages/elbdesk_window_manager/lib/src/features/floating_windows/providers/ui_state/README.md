# UI State Providers

This directory contains providers that manage UI-specific state for the window system.

## Providers

### DraggingWindowIdProvider
- Tracks which window is currently being dragged
- Used for drag-and-drop operations
- Helps coordinate drag state across the system

### EdgeSnapPreviewProvider
- Manages edge snap preview visualization
- Shows snap zones when dragging windows near edges
- Coordinates with snap functionality

### WindowHighlightProvider
- Manages window highlighting for visual feedback
- Used in window overview and selection
- Tracks highlighted window state

### WindowOverviewVisibleProvider
- Controls visibility of window overview/expose mode
- Manages overview animation state
- Coordinates with window selection

### MinimizeRequestsProvider
- Handles minimize animation requests
- Coordinates minimize operations across windows
- Manages animation timing

### AllowWindowsOutsideViewProvider
- Controls whether windows can be positioned outside viewport
- Used for different window management modes
- Affects window constraint behavior

### StatusBarHeightProvider
- Provides the height of the status bar
- Used for proper window positioning
- Accounts for system UI elements