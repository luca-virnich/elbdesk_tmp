import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../theme/window_manager_theme.dart';
import 'macos_control_button.dart';

class WindowsCloseButtonWidget extends StatefulWidget {
  const WindowsCloseButtonWidget({
    super.key,
    required this.onPressed,
    required this.tooltip,
    required this.color,
    required this.height,
  });

  final VoidCallback onPressed;
  final String tooltip;
  final Color color;
  final double height;

  @override
  State<WindowsCloseButtonWidget> createState() =>
      _WindowsCloseButtonWidgetState();
}

class _WindowsCloseButtonWidgetState extends State<WindowsCloseButtonWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final titleBarTheme = WindowManagerTheme.of(context).windowTitleBar;

    return Semantics(
      button: true,
      label: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTapDown: (_) {
            // Call immediately on tap down for instant response
            widget.onPressed();
          },
          behavior: HitTestBehavior.opaque,
          child: Container(
            width: 46,
            height: widget.height,
            decoration: BoxDecoration(
              color: _isHovered
                  ? titleBarTheme.windowsCloseButtonHoverBackgroundColor
                  : Colors.transparent,
            ),
            child: Center(
              child: Icon(
                Icons.close,
                color: _isHovered
                    ? titleBarTheme.windowsCloseButtonHoverIconColor
                    : widget.color,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// macOS-style traffic light control button
class MacOSCloseButton extends ConsumerWidget {
  const MacOSCloseButton({
    super.key,
    required this.windowId,
    required this.onClose,
  });

  final String windowId;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MacOSControlButton(
      icon: Icons.close,
      onPressed: onClose,
      tooltip: context.windowManagerL10n.closeTooltip,
    );
  }
}
