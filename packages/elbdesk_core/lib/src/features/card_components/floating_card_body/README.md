# FloatingCardBody Widget

## Overview

The `FloatingCardBody` widget is a responsive container that provides the main layout structure for card-based UI components in ElbDesk. It handles responsive breakpoints, navigation, notes panel, and automatic width distribution for its children.

## Key Features

- **Responsive Design**: Automatically adapts between mobile and desktop layouts
- **Smart Navigation**: Collapsible side navigation on desktop, tab bar on mobile
- **Integrated Notes**: Side panel on desktop, bottom sheet on mobile
- **Automatic Width Distribution**: Uses Flutter's layout system for accurate constraint calculation
- **Performance Optimized**: Single LayoutBuilder, selective rebuilds with ValueNotifier

## Architecture

### Widget Hierarchy

```text
FloatingCardBody
├── LayoutBuilder (viewport detection)
│   └── Form
│       ├── MobileTabBar (mobile only)
│       └── Row
│           ├── Expanded (main content)
│           │   ├── Header (optional)
│           │   ├── LayoutBuilder
│           │   │   └── UnifiedContent
│           │   │       └── CardBodyItem.build()
│           │   └── Footer (optional)
│           ├── EntityNotesView (desktop only)
│           └── CardNavigation (desktop only)
```

### Responsive Breakpoints

- **Mobile**: < 768px
  - Tab navigation at top
  - Notes open in modal bottom sheet
  - Full width for content
  
- **Desktop**: ≥ 768px  
  - Side navigation (collapsible)
  - Notes panel slides from right
  - Dynamic width distribution

## Layout System

### How Width Distribution Works

The widget uses a single LayoutBuilder at the top level to detect viewport size, then calculates available width for content:

1. **Single LayoutBuilder**: Wraps the entire widget to get viewport dimensions
2. **Manual Calculation**: Calculates content width based on visible elements:

   ```dart
   var contentWidth = constraints.maxWidth;
   
   if (isDesktopView) {
     // Subtract notes panel width if open
     if (notesOpen) {
       contentWidth -= 450; // notesPanelWidth
     }
     
     // Subtract navigation width if visible
     if (hasNavigation) {
       contentWidth -= isExpanded ? 200 : 70; // nav width
       contentWidth -= 12; // divider padding
     }
   }
   ```

3. **Constraint Distribution**: Passes calculated constraints to UnifiedContent:

   ```dart
   UnifiedContent(
     constraints: BoxConstraints(
       maxWidth: contentWidth,
       maxHeight: constraints.maxHeight,
     ),
   )
   ```

### Why Manual Calculation?

While Flutter's layout system with Expanded widgets would normally handle this automatically, we need manual calculation because:

- The content needs to know its exact width for responsive layouts (like TwoColumnWrap)
- We want to avoid multiple LayoutBuilders for performance
- The calculation is straightforward and predictable

### Performance Benefits

- ✅ Single LayoutBuilder at top level
- ✅ No nested layout calculations
- ✅ Predictable constraint flow
- ✅ Efficient rebuilds with ValueNotifier

## Component Details

### CardBodyItem

Wrapper for each content page with two modes:

```dart
// With constraints (responsive content)
CardBodyItem(
  builder: (context, constraints) {
    return MyWidget(width: constraints.maxWidth);
  },
)

// Without constraints (simple content)
CardBodyItem(
  child: MySimpleWidget(),
)
```

Properties:

- `keepAlive`: Preserve state when switching tabs (default: true)
- `loadLazy`: Delay building until first shown (default: true)

### Navigation State

Navigation expansion is managed by a Riverpod provider:

```dart
ref.watch(cardNavigationExpandedStateProvider(windowId))
```

- Starts collapsed (70px)
- User can toggle to expanded (200px)
- State persists per window

### Notes Integration

Desktop mode integrates notes as a side panel:

- Opens/closes via provider: `showEntityNotesProvider`
- Fixed width: 450px
- Reduces available content width when open

## Usage Example

```dart
FloatingCardBody(
  floatingWindowId: 'contact_123',
  floatingWindowType: FloatingWindowType.contact,
  navigatorKey: navigatorKey,
  isFirstRun: true,
  
  // Optional components
  header: MyHeaderWidget(),
  footer: SaveCancelFooter(),
  
  // Navigation setup
  navigationGroups: [
    CardNavigationGroup(
      items: [
        CardNavigationItem(
          icon: Icons.person,
          label: 'Contact',
        ),
        CardNavigationItem(
          icon: Icons.business,
          label: 'Company',
        ),
      ],
    ),
  ],
  
  // Content pages
  children: [
    // Responsive content
    CardBodyItem(
      builder: (context, constraints) {
        final width = constraints.maxWidth - 32; // Account for padding
        return ContactForm(width: width);
      },
    ),
    // Simple content
    CardBodyItem(
      child: CompanyList(),
    ),
  ],
  
  // Notes configuration
  showNotes: true,
  noteEntityId: contactId,
  noteEntity: TableType.contact,
)
```

## Common Patterns

### Working with ScrollableCardItem

When using ScrollableCardItem, account for its internal padding:

```dart
CardBodyItem(
  builder: (context, constraints) {
    // ScrollableCardItem adds 16px padding on each side
    final contentWidth = constraints.maxWidth - 32;
    
    return ScrollableCardItem.unconstrained(
      child: MyContent(width: contentWidth),
    );
  },
)
```

### Responsive Form Layouts

Use TwoColumnWrap for responsive forms:

```dart
CardBodyItem(
  builder: (context, constraints) {
    final width = constraints.maxWidth - 32; // ScrollableCardItem padding
    
    return ScrollableCardItem.unconstrained(
      child: TwoColumnWrap(
        width: width,
        breakpoint: 600, // Shows 2 columns when width > 600
        builder: (labelPosition, childWidth) {
          return [
            TextField(width: childWidth),
            TextField(width: childWidth),
          ];
        },
      ),
    );
  },
)
```

## Constants Reference

All layout constants are defined in `FloatingCardBodyConstants`:

```dart
class FloatingCardBodyConstants {
  static const double mobileBreakpoint = 768;
  static const double notesPanelWidth = 450;
  static const double navigationExpandedWidth = 200;
  static const double navigationCollapsedWidth = 70;
  static const double navigationDividerPadding = 12;
}
```

## Performance Considerations

1. **Single LayoutBuilder**: Only one at the top level, avoiding nested rebuilds
2. **ValueNotifier**: Navigation index uses ValueNotifier for selective updates
3. **RepaintBoundary**: Each content page is wrapped for isolation
4. **Lazy Loading**: Pages can be built only when first shown

## Troubleshooting

### Content appears too narrow

- Check if you're accounting for ScrollableCardItem padding (32px total)
- Verify TwoColumnWrap breakpoint matches your content needs

### Navigation state issues

- Ensure floatingWindowId is unique per window
- Check if initialExpanded is set correctly

### Notes panel not showing

- Verify noteEntityId and noteEntity are provided
- Check showNotes is true
- Ensure entity is not in draft state