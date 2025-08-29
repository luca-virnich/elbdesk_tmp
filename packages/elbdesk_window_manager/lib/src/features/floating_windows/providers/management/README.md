# Management Providers

This directory contains providers responsible for core window management functionality.

## Providers

### WindowManagerProvider
- Main service for managing floating windows
- Handles opening, closing, and coordinating windows
- Manages duplicate window detection

### WindowSyncProvider
- Compatibility layer for window synchronization
- Handles window state transitions (minimize, maximize, restore)
- Manages window snapping functionality

### WindowZOrderProvider
- Manages the z-order (stacking order) of windows
- Handles bringing windows to front
- Maintains the order in which windows are displayed

### OpenWindowsProvider
- Stores and manages all currently open windows
- Provides access to window data by ID
- Handles window lifecycle (add/remove)

### WindowFocusProvider
- Manages focus nodes for all floating windows
- Ensures proper keyboard focus handling
- Cleans up focus nodes when windows close