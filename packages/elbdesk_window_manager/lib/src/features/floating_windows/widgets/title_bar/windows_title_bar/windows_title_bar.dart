import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/floating_window_is_maximized_state.dart';
import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../snap_overlay.dart';
import '../title_bar.dart';

/// Windows-style title bar layout with controls on the right
class WindowsTitleBar extends ConsumerWidget {
  const WindowsTitleBar({
    super.key,
    this.windowId,

    required this.fgColor,
    required this.isMobile,
    required this.height,
    this.leading,
    required this.actions,
    required this.title,
    required this.icon,
    required this.showMinimize,
    required this.showMaximize,
    required this.showClose,

    required this.onClose,
  });

  final String? windowId;

  final Color fgColor;
  final bool isMobile;
  final double height;
  final Widget? leading;
  final List<Widget> actions;
  final Widget? title;
  final IconData? icon;
  final bool showMinimize;
  final bool showMaximize;
  final bool showClose;

  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        // Leading widget or spacing
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 8),
        ] else
          const SizedBox(width: 12),

        // Icon

        // Title
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onPanDown: windowId == null
                ? null
                : (_) {
                    // Bring window to front immediately when touching title bar
                    ref.read(windowManagerProvider).bringToFront(windowId!);
                  },
            onDoubleTap: () {
              ref.read(windowManagerProvider).bringToFront(windowId!);
              ref
                  .read(
                    floatingWindowIsMaximizedStateProvider(
                      windowId!,
                    ).notifier,
                  )
                  .toggleMaximized();
            },
            child:
                title ??
                TitleBarTitle(
                  windowId: windowId!,
                  color: fgColor,
                ),
          ),
        ),

        // Custom actions
        if (actions.isNotEmpty) ...[
          ...actions,
          const SizedBox(width: 8),
          VerticalDivider(
            color: fgColor,
            thickness: 1,
            width: 1,
          ),
        ],

        // Window control buttons
        RepaintBoundary(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Only hide maximize on mobile, keep minimize and close
              if (showMinimize && windowId != null)
                _MinimizeButton(
                  windowId: windowId!,
                  color: fgColor,
                ),
              if (showMaximize && !isMobile && windowId != null)
                MaximizeButtonWithSnap(
                  windowId: windowId!,
                  foregroundColor: fgColor,
                ),
              if (showClose && onClose != null)
                WindowsCloseButtonWidget(
                  onPressed: onClose!,
                  tooltip: context.windowManagerL10n.closeTooltip,
                  color: fgColor,
                  height: height,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MinimizeButton extends ConsumerStatefulWidget {
  const _MinimizeButton({
    required this.color,
    required this.windowId,
  });

  final Color color;
  final String windowId;

  @override
  ConsumerState<_MinimizeButton> createState() => _MinimizeButtonState();
}

class _MinimizeButtonState extends ConsumerState<_MinimizeButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          ref.read(windowManagerProvider).minimizeWindow(widget.windowId);
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _isHovered
                ? titleBarTheme.windowsControlButtonHoverBackgroundColor
                : titleBarTheme.windowsControlButtonBackgroundColor,
          ),
          child: Center(
            child: Icon(
              Icons.remove,
              color: _isHovered
                  ? titleBarTheme.windowsControlButtonIconColor
                  : widget.color,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

// Maximize button with snap overlay on right-click
class MaximizeButtonWithSnap extends ConsumerStatefulWidget {
  const MaximizeButtonWithSnap({
    super.key,
    required this.windowId,
    required this.foregroundColor,
  });

  final String windowId;
  final Color foregroundColor;

  @override
  ConsumerState<MaximizeButtonWithSnap> createState() =>
      _MaximizeButtonWithSnapState();
}

class _MaximizeButtonWithSnapState
    extends ConsumerState<MaximizeButtonWithSnap> {
  OverlayEntry? _overlayEntry;
  bool _isHovered = false;

  void _showSnapOverlay() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final buttonSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) => Stack(
        children: [
          // Invisible full-screen barrier
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideSnapOverlay,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          // The snap overlay
          SnapOverlay(
            windowId: widget.windowId,
            anchorPosition: Offset(
              position.dx + buttonSize.width / 2, // Center of button
              position.dy + buttonSize.height,
            ),
            onClose: _hideSnapOverlay,
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideSnapOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMaximized = ref.watch(
      floatingWindowIsMaximizedStateProvider(widget.windowId),
    );

    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onSecondaryTap: () {
          // Show snap overlay on right-click
          if (!isMaximized) {
            _showSnapOverlay();
          }
        },
        onTap: () {
          ref
              .read(
                floatingWindowIsMaximizedStateProvider(
                  widget.windowId,
                ).notifier,
              )
              .toggleMaximized();
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: _isHovered
                ? titleBarTheme.windowsControlButtonHoverBackgroundColor
                : titleBarTheme.windowsControlButtonBackgroundColor,
          ),
          child: Center(
            child: Tooltip(
              message: isMaximized
                  ? context.windowManagerL10n.restoreTooltip
                  : context.windowManagerL10n.maximizeTooltip,
              child: isMaximized
                  ? _buildRestoreIcon(
                      _isHovered
                          ? titleBarTheme.windowsControlButtonIconColor
                          : widget.foregroundColor,
                    )
                  : Icon(
                      Icons.crop_square,
                      color: _isHovered
                          ? titleBarTheme.windowsControlButtonIconColor
                          : widget.foregroundColor,
                      size: 18,
                    ),
            ),
          ),
        ),
      ),
    );
  }

  // Build Windows-style restore icon (two overlapping squares)
  Widget _buildRestoreIcon(Color color) {
    return SizedBox(
      width: 18,
      height: 18,
      child: Stack(
        children: [
          // Back square
          Positioned(
            left: 3,
            top: 0,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                border: Border.all(color: color, width: 1.5),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
          // Front square
          Positioned(
            left: 0,
            top: 3,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: color, width: 1.5),
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
