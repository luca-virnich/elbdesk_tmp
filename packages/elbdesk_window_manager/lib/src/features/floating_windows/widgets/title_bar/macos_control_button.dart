import 'package:flutter/material.dart';

/// Shared macOS-style control button used by close, minimize, and maximize buttons
class MacOSControlButton extends StatefulWidget {
  const MacOSControlButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.tooltip,
    this.color,
    this.hoverColor,
    this.iconColor,
    this.hoverIconColor,
    this.useThemeColor = true,
    this.forceShowIcon = false,
  });

  final Color? color;
  final Color? hoverColor;
  final Color? iconColor;
  final Color? hoverIconColor;
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final bool useThemeColor;
  final bool forceShowIcon;

  @override
  State<MacOSControlButton> createState() => _MacOSControlButtonState();
}

class _MacOSControlButtonState extends State<MacOSControlButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = widget.color ?? Colors.grey;
    final effectiveHoverColor = widget.hoverColor ?? effectiveColor;
    
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
                color: _isHovered ? effectiveHoverColor : effectiveColor,
                border: Border.all(
                  color: effectiveColor.withValues(alpha: 0.2),
                  width: 0.5,
                ),
              ),
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: (_isHovered || widget.forceShowIcon) ? 1.0 : 0.0,
                  child: Icon(
                    widget.icon,
                    color: _isHovered 
                        ? (widget.hoverIconColor ?? Colors.white.withValues(alpha: 0.9))
                        : (widget.iconColor ?? (effectiveColor.computeLuminance() > 0.5
                            ? Colors.black.withValues(alpha: 0.6)
                            : Colors.white.withValues(alpha: 0.6))),
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