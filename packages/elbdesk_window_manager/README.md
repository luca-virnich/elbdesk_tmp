# ElbDesk Window Manager

A comprehensive Flutter window management system that provides floating windows, window snapping, taskbar, and multi-platform support with a native feel.

## Features

- 🪟 **Floating Windows** - Draggable, resizable windows with minimize/maximize support
- 🧲 **Window Snapping** - Snap windows to screen edges and corners
- 📱 **Responsive Design** - Automatic mobile/desktop adaptation
- 🎨 **Comprehensive Theming** - Fully customizable appearance for all components
- 💾 **Persistent Window State** - Save and restore window positions/sizes
- 🚫 **Duplicate Prevention** - Smart duplicate window detection
- ⌨️ **Keyboard Shortcuts** - Alt+Tab / Ctrl+Tab window overview
- 🎯 **Platform-Specific UI** - Native Windows and macOS title bar styles

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  elbdesk_window_manager: ^1.0.0
```

## Quick Start

### 1. Initialize the Window Manager

```dart
import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  
  // Initialize Window Manager
  await initializeElbDeskWindowManager(
    windowRegistrations: [
      WindowRegistryEntry<ContactWindowData>(
        (context, data) => ContactWindow(data: data),
        duplicateCheck: (existing, newWindow) {
          // Prevent duplicate windows with same ID
          return existing.contactId == newWindow.contactId;
        },
      ),
    ],
    sharedPreferences: prefs,
  );
  
  runApp(MyApp());
}
```

### 2. Define Window Data Models

```dart
class ContactWindowData extends FloatingWindowData {
  ContactWindowData({
    required this.contactId,
  }) : super(
    icon: Icons.person,
    preview: FloatingWindowPreview.card,
    minSize: const Size(400, 300),
    defaultSize: const Size(800, 600),
  );
  
  final int? contactId;
  
  @override
  String getTitle() => contactId != null 
    ? 'Contact #$contactId' 
    : 'New Contact';
}
```

### 3. Create Window Content

```dart
class ContactWindow extends ConsumerWidget {
  const ContactWindow({
    super.key,
    required this.data,
  });
  
  final ContactWindowData data;
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        // Title bar with native controls
        FloatingWindowTitleBar(
          windowId: data.floatingWindowId,
          style: FloatingWindowTitleBarStyle.windows, // or .macOS
          icon: data.icon,
        ),
        // Your content here
        Expanded(
          child: ContactForm(contactId: data.contactId),
        ),
      ],
    );
  }
}
```

### 4. Set Up the Main App

```dart
class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: ElbDeskWindowManager(
        userId: 1,
        environment: 'production',
        theme: _buildTheme(),
        mobileBreakpoint: 600,
        allowWindowsOutsideView: true,
        sideNavigation: _buildSideNav(),
        child: YourMainContent(),
      ),
    );
  }
  
  WindowManagerThemeData _buildTheme() {
    return WindowManagerThemeData(
      taskbar: TaskbarThemeData(
        backgroundColor: const Color(0xFF0F172A),
        height: 48.0,
        iconColor: const Color(0xFF94A3B8),
        iconActiveColor: const Color(0xFF60A5FA),
        // ... more theme properties
      ),
      windows: WindowsThemeData(
        backgroundColor: const Color(0xFF334155),
        titleBarHeight: 40.0,
        minWidth: 200,
        minHeight: 100,
        // ... more theme properties
      ),
      // ... other component themes
    );
  }
}
```

### 5. Open Windows

```dart
// Open a window programmatically
ref.read(windowManagerProvider.notifier).openWindow(
  ContactWindowData(contactId: 123),
);

// Close a window
ref.read(windowManagerProvider.notifier).closeWindow(windowId);

// Bring window to front
ref.read(windowManagerProvider.notifier).bringToFront(windowId);
```

## Advanced Features

### Window Snapping

Windows can be snapped by:
- Dragging to screen edges/corners
- Right-clicking the maximize button for snap menu
- Programmatically via `windowSyncProvider`

```dart
ref.read(windowSyncProvider.notifier).snapWindow(
  windowId,
  SnapPosition.left,
  screenSize,
);
```

### Custom Duplicate Detection

Prevent duplicate windows with custom logic:

```dart
WindowRegistryEntry<OrderWindowData>(
  (context, data) => OrderWindow(data: data),
  duplicateCheck: (existing, newWindow) {
    // Allow multiple draft orders
    if (existing.status == 'draft' || newWindow.status == 'draft') {
      return false;
    }
    // Prevent duplicate windows for same order
    return existing.orderId == newWindow.orderId;
  },
),
```

### Persistent Window State

Window positions and sizes are automatically saved per window type:

```dart
// Windows remember their last position/size
ContactWindowData(contactId: 123) // Opens at last saved position

// Clear saved preferences
WindowPreferences.clearWindowConfig('ContactWindowData');
```

### Mobile Responsiveness

Windows automatically adapt to mobile:
- Full-screen on mobile devices
- Respects safe areas and navigation bars
- Touch-friendly controls
- Bottom navigation bar instead of taskbar

### Keyboard Shortcuts

Built-in shortcuts:
- `Alt+Tab` / `Ctrl+Tab` - Window overview
- `Esc` - Close window overview

Custom shortcuts can be added via Flutter's Shortcuts widget.

## Theming

### Complete Theme Example

```dart
WindowManagerThemeData(
  taskbar: TaskbarThemeData(
    backgroundColor: Colors.grey[900]!,
    height: 48.0,
    iconColor: Colors.white70,
    iconActiveColor: Colors.blue,
    tileBackgroundColor: Colors.transparent,
    tileActiveBackgroundColor: Colors.blue.withOpacity(0.2),
  ),
  windows: WindowsThemeData(
    backgroundColor: Colors.white,
    titleBarBackgroundColor: Colors.grey[100]!,
    titleBarHeight: 32.0,
    borderRadius: 8.0,
    shadowColor: Colors.black26,
    // Platform-specific colors
    macOSCloseButtonColor: const Color(0xFFFF5F57),
    macOSMinimizeButtonColor: const Color(0xFFFFBD2E),
    macOSMaximizeButtonColor: const Color(0xFF28CA42),
  ),
  sideNavigation: SideNavigationThemeData(
    backgroundColor: Colors.grey[900]!,
    selectedBackgroundColor: Colors.blue,
    iconColor: Colors.white70,
    selectedIconColor: Colors.white,
  ),
  // ... more component themes
)
```

## Performance Considerations

### Current Limitations
- Rendering 50+ windows may impact performance
- All windows maintain full widget trees even when minimized
- No virtualization for off-screen windows

### Optimization Tips
1. Use `RepaintBoundary` for complex window content
2. Implement `AutomaticKeepAliveClientMixin` for expensive widgets
3. Consider lazy loading window content
4. Limit concurrent open windows in your app logic

### Recommended Limits
- Desktop: 20-30 concurrent windows
- Mobile: 5-10 concurrent windows

## Platform Support

- ✅ Windows
- ✅ macOS  
- ✅ Linux
- ✅ Web
- ✅ iOS
- ✅ Android

## API Reference

### Core Providers

```dart
// Window management
windowManagerProvider         // Open, close, manage windows
windowsListProvider          // List of all open windows
windowZOrderProvider         // Window stacking order

// Window state
floatingWindowIsMinimizedStateProvider(windowId)
floatingWindowIsMaximizedStateProvider(windowId)
windowPositionProvider(windowId)

// UI state
windowOverviewVisibleProvider // Window overview visibility
draggingWindowIdProvider      // Currently dragging window
```

### Window Lifecycle

1. **Creation**: `WindowRegistry` creates widget from data
2. **State Init**: Position/size from saved preferences or defaults
3. **Interaction**: Drag, resize, minimize, maximize
4. **Persistence**: Position/size saved on change
5. **Cleanup**: State providers disposed on close

## Troubleshooting

### Common Issues

**Windows not appearing:**
- Ensure `ElbDeskWindowManager` wraps your app
- Check window registration in initialization
- Verify window data model extends `FloatingWindowData`

**Theme not applying:**
- All theme properties are required
- Check theme is passed to `ElbDeskWindowManager`
- Use `WindowManagerTheme.of(context)` to access theme

**Performance issues:**
- Limit concurrent windows
- Use `RepaintBoundary` for complex content
- Consider implementing pagination for window lists

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for development setup and guidelines.

## License

MIT License - see [LICENSE](LICENSE) for details.