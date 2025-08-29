import 'dart:async';

import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/floating_window_is_maximized_state.dart';
import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../theme/window_manager_theme.dart';
import 'macos_control_button.dart';
import 'snap_overlay.dart';

/// Windows-style maximize button

/// macOS-style maximize button with snap functionality
class MacOSMaximizeButton extends ConsumerStatefulWidget {
  const MacOSMaximizeButton({
    super.key,
    required this.windowId,
    required this.isMaximized,
    this.onMaximize,
  });

  final String windowId;
  final bool isMaximized;
  final VoidCallback? onMaximize;

  @override
  ConsumerState<MacOSMaximizeButton> createState() =>
      _MacOSMaximizeButtonState();
}

class _MacOSMaximizeButtonState extends ConsumerState<MacOSMaximizeButton> {
  OverlayEntry? _overlayEntry;
  Timer? _hoverTimer;
  bool _isHovered = false;

  void _showSnapMenu() {
    if (_overlayEntry != null) return;

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final buttonSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _hideSnapMenu,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          MacOSSnapOverlay(
            windowId: widget.windowId,
            anchorPosition: Offset(
              position.dx, // Left edge of button
              position.dy + buttonSize.height + 8,
            ),
            onClose: _hideSnapMenu,
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideSnapMenu() {
    _hoverTimer?.cancel();
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _hoverTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hide snap menu if window gets maximized
    if (widget.isMaximized && _overlayEntry != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _hideSnapMenu();
      });
    }

    if (widget.onMaximize != null) {
      // Simple button without snap functionality
      return MacOSControlButton(
        icon: widget.isMaximized ? Icons.fullscreen_exit : Icons.fullscreen,
        onPressed: widget.onMaximize!,
        tooltip: widget.isMaximized
            ? context.windowManagerL10n.restoreTooltip
            : context.windowManagerL10n.maximizeTooltip,
      );
    }

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        // Only show snap menu if not maximized
        if (!widget.isMaximized) {
          _hoverTimer?.cancel();
          _hoverTimer = Timer(const Duration(milliseconds: 700), () {
            if (mounted && !widget.isMaximized) {
              _showSnapMenu();
            }
          });
        }
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _hoverTimer?.cancel();
      },
      child: GestureDetector(
        onSecondaryTap: () {
          _hoverTimer?.cancel();
          // Only show snap menu if not maximized
          if (!widget.isMaximized) {
            _showSnapMenu();
          }
        },
        child: Tooltip(
          message: widget.isMaximized
              ? context.windowManagerL10n.restoreTooltip
              : context.windowManagerL10n.maximizeTooltip,
          child: InkWell(
            onTap: () {
              // Hide any open snap menu and cancel timer
              _hideSnapMenu();

              ref
                  .read(
                    floatingWindowIsMaximizedStateProvider(
                      widget.windowId,
                    ).notifier,
                  )
                  .setMaximized(true);
            },
            customBorder: const CircleBorder(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: WindowManagerTheme.of(
                  context,
                ).windowTitleBar.windowsControlButtonIconColor,
                border: Border.all(
                  color: WindowManagerTheme.of(context)
                      .windowTitleBar
                      .windowsControlButtonIconColor
                      .withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: _isHovered ? 1.0 : 0.0,
                  child: Icon(
                    widget.isMaximized
                        ? Icons.fullscreen_exit
                        : Icons.fullscreen,
                    color: Colors.white.withValues(alpha: 0.6),
                    size: 8,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
