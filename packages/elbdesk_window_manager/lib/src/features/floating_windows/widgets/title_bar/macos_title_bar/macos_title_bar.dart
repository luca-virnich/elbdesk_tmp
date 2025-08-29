import 'package:elbdesk_window_manager/elbdesk_window_manager.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/providers/state/floating_window_is_maximized_state.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/title_bar/macos_control_button.dart';
import 'package:elbdesk_window_manager/src/features/floating_windows/widgets/title_bar/title_bar.dart';
import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Provider to track if any macOS control button is hovered
final _macOSControlsHoveredProvider = StateProvider.autoDispose<bool>(
  (ref) => false,
);

class MacOSTitleBar extends ConsumerWidget {
  const MacOSTitleBar({
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
    return GestureDetector(
      behavior: HitTestBehavior.translucent, // Allow taps on empty space
      onPanDown: windowId == null
          ? null
          : (_) {
              // Bring window to front immediately when touching title bar
              ref.read(windowManagerProvider).bringToFront(windowId!);
            },
      onDoubleTap: windowId == null
          ? null
          : () {
              // Bring to front first, then toggle maximize
              ref.read(windowManagerProvider).bringToFront(windowId!);
              ref
                  .read(
                    floatingWindowIsMaximizedStateProvider(windowId!).notifier,
                  )
                  .toggleMaximized();
            },
      child: Row(
        children: [
          const SizedBox(width: 8),
          // macOS-style traffic light buttons on the left
          if (!isMobile)
            Consumer(
              builder: (context, ref, child) {
                final isAnyHovered = ref.watch(_macOSControlsHoveredProvider);
                return MouseRegion(
                  onEnter: (_) =>
                      ref.read(_macOSControlsHoveredProvider.notifier).state =
                          true,
                  onExit: (_) =>
                      ref.read(_macOSControlsHoveredProvider.notifier).state =
                          false,
                  child: Row(
                    children: [
                      if (showClose)
                        _CloseButton(
                          windowId: windowId!,
                          onClose: onClose,
                          showIcon: isAnyHovered,
                        ),
                      if (showMinimize) const SizedBox(width: 8),
                      if (showMinimize)
                        _MinimizeButton(
                          windowId: windowId!,
                          showIcon: isAnyHovered,
                        ),
                      if (showMaximize) const SizedBox(width: 8),
                      if (showMaximize)
                        _MaximizeButton(
                          windowId: windowId!,
                          forceShowIcon: isAnyHovered,
                        ),
                    ],
                  ),
                );
              },
            ),

          // Leading widget
          if (leading != null) ...[
            leading!,
            const SizedBox(width: 8),
          ],

          // Centered title and icon
          Expanded(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  title != null
                      ? title!
                      : windowId == null
                      ? Text('')
                      : TitleBarTitle(
                          color: fgColor,
                          windowId: windowId!,
                        ),
                ],
              ),
            ),
          ),

          // Custom actions
          ...actions,

          // Spacing to balance the left controls
          if (!isMobile) const SizedBox(width: 8),
        ],
      ),
    );
  }
}

class _MinimizeButton extends ConsumerWidget {
  const _MinimizeButton({
    required this.windowId,
    required this.showIcon,
  });

  final String windowId;
  final bool showIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;
    return MacOSControlButton(
      color: titleBarTheme.macOSMinimizeButtonColor,
      hoverColor: titleBarTheme.macOSMinimizeButtonHoverColor,
      iconColor: titleBarTheme.macOSMinimizeButtonIconColor,
      hoverIconColor: titleBarTheme.macOSMinimizeButtonHoverIconColor,
      icon: Icons.remove,
      onPressed: () => ref.read(windowManagerProvider).minimizeWindow(windowId),
      tooltip: context.windowManagerL10n.minimizeTooltip,
      forceShowIcon: showIcon,
    );
  }
}

class _MaximizeButton extends ConsumerStatefulWidget {
  const _MaximizeButton({
    required this.windowId,
    required this.forceShowIcon,
  });

  final String windowId;
  final bool forceShowIcon;

  @override
  ConsumerState<_MaximizeButton> createState() => _MaximizeButtonState();
}

class _MaximizeButtonState extends ConsumerState<_MaximizeButton> {
  OverlayEntry? _overlayEntry;

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
          MacOSSnapOverlay(
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
    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;
    final isMaximized = ref.watch(
      floatingWindowIsMaximizedStateProvider(widget.windowId),
    );

    return GestureDetector(
      onSecondaryTap: () {
        // Show snap overlay on right-click
        if (!isMaximized) {
          _showSnapOverlay();
        }
      },
      child: _MacOSMaximizeButton(
        color: titleBarTheme.macOSMaximizeButtonColor,
        hoverColor: titleBarTheme.macOSMaximizeButtonHoverColor,
        iconColor: titleBarTheme.macOSMaximizeButtonIconColor,
        hoverIconColor: titleBarTheme.macOSMaximizeButtonHoverIconColor,
        isMaximized: isMaximized,
        forceShowIcon: widget.forceShowIcon,
        onPressed: () {
          ref
              .read(
                floatingWindowIsMaximizedStateProvider(
                  widget.windowId,
                ).notifier,
              )
              .toggleMaximized();
        },
        tooltip: isMaximized
            ? context.windowManagerL10n.restoreTooltip
            : context.windowManagerL10n.maximizeTooltip,
      ),
    );
  }
}

class _CloseButton extends ConsumerWidget {
  const _CloseButton({
    required this.windowId,
    required this.onClose,
    required this.showIcon,
  });

  final String windowId;
  final VoidCallback? onClose;
  final bool showIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;
    return MacOSControlButton(
      color: titleBarTheme.macOSCloseButtonColor,
      hoverColor: titleBarTheme.macOSCloseButtonHoverColor,
      iconColor: titleBarTheme.macOSCloseButtonIconColor,
      hoverIconColor: titleBarTheme.macOSCloseButtonHoverIconColor,
      icon: Icons.close,
      onPressed:
          onClose ??
          () {
            // Default close action
          },
      tooltip: context.windowManagerL10n.closeTooltip,
      forceShowIcon: showIcon,
    );
  }
}

// Custom macOS maximize button with proper icon
class _MacOSMaximizeButton extends StatefulWidget {
  const _MacOSMaximizeButton({
    required this.color,
    required this.hoverColor,
    required this.iconColor,
    required this.hoverIconColor,
    required this.isMaximized,
    required this.forceShowIcon,
    required this.onPressed,
    required this.tooltip,
  });

  final Color color;
  final Color hoverColor;
  final Color iconColor;
  final Color hoverIconColor;
  final bool isMaximized;
  final bool forceShowIcon;
  final VoidCallback onPressed;
  final String tooltip;

  @override
  State<_MacOSMaximizeButton> createState() => _MacOSMaximizeButtonState();
}

class _MacOSMaximizeButtonState extends State<_MacOSMaximizeButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Semantics(
        button: true,
        label: widget.tooltip,
        child: Tooltip(
          message: widget.tooltip,
          child: InkWell(
            onTap: widget.onPressed,
            customBorder: const CircleBorder(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isHovered ? widget.hoverColor : widget.color,
                border: Border.all(
                  color: widget.color.withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: (_isHovered || widget.forceShowIcon) ? 1.0 : 0.0,
                  child: CustomPaint(
                    size: const Size(8, 8),
                    painter: _MacOSMaximizeIconPainter(
                      color: _isHovered
                          ? widget.hoverIconColor
                          : widget.iconColor,
                      isMaximized: widget.isMaximized,
                    ),
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

// Custom painter for macOS maximize/restore icon
class _MacOSMaximizeIconPainter extends CustomPainter {
  final Color color;
  final bool isMaximized;

  _MacOSMaximizeIconPainter({
    required this.color,
    required this.isMaximized,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..isAntiAlias = true;

    final double w = size.width;
    final double h = size.height;

    if (!isMaximized) {
      // KORREKTUR: "Maximieren"-Symbol (größer und kräftiger)
      // Die Dreiecke füllen den Raum jetzt viel besser aus.
      paint.style = PaintingStyle.fill;

      final double padding = w * 0.2; // Ein kleiner Rand von 20%

      // Pfeil nach oben links
      final Path topLeftTriangle = Path()
        ..moveTo(padding, h * 0.5)
        ..lineTo(padding, padding)
        ..lineTo(w * 0.5, padding)
        ..close();

      // Pfeil nach unten rechts
      final Path bottomRightTriangle = Path()
        ..moveTo(w * 0.5, h - padding)
        ..lineTo(w - padding, h - padding)
        ..lineTo(w - padding, h * 0.5)
        ..close();

      canvas.drawPath(topLeftTriangle, paint);
      canvas.drawPath(bottomRightTriangle, paint);
    } else {
      // KORREKTUR: "Wiederherstellen"-Symbol im echten macOS-Stil
      // Zwei sich überlappende Rechtecke mit Umrandung.
      paint.style = PaintingStyle.stroke; // Wichtig: Nur die Umrandung zeichnen
      paint.strokeWidth = w * 0.12; // Dicke der Linien

      // Hinteres Fenster
      canvas.drawRect(
        Rect.fromLTWH(w * 0.2, h * 0.3, w * 0.5, h * 0.5),
        paint,
      );

      // Vorderes Fenster (leicht versetzt)
      canvas.drawRect(
        Rect.fromLTWH(w * 0.3, h * 0.2, w * 0.5, h * 0.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_MacOSMaximizeIconPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.isMaximized != isMaximized;
  }
}
