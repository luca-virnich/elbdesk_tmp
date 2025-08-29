import 'package:elbdesk_window_manager/src/localization/elbdesk_window_maanger_localizations_extension.dart';
import 'package:flutter/material.dart';

/// Base minimize button widget
abstract class MinimizeButton extends StatefulWidget {
  const MinimizeButton({
    super.key,
    required this.onPressed,
    this.tooltip,
    this.color,
  });

  final VoidCallback onPressed;
  final String? tooltip;
  final Color? color;
}

/// Windows-style minimize button with immediate visual feedback
class WindowsMinimizeButton extends MinimizeButton {
  const WindowsMinimizeButton({
    super.key,
    required super.onPressed,
    super.tooltip,
    super.color,
  });

  @override
  State<WindowsMinimizeButton> createState() => _WindowsMinimizeButtonState();
}

class _WindowsMinimizeButtonState extends State<WindowsMinimizeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.minimize,
        color: widget.color,
        size: 18,
      ),
      onPressed: widget.onPressed,
      tooltip: widget.tooltip ?? context.windowManagerL10n.minimizeTooltip,
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(
        minWidth: 40,
        minHeight: 40,
      ),
    );
  }
}

/// macOS style minimize button with immediate visual feedback
