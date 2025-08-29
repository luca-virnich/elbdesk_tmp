import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class RichTextTooltip extends StatefulWidget {
  const RichTextTooltip({
    required this.labelText,
    required this.richMessage,
    super.key,
  });
  final String labelText;
  final Widget richMessage;

  @override
  _RichTextTooltipState createState() => _RichTextTooltipState();
}

class _RichTextTooltipState extends State<RichTextTooltip> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isHovering = false;
  bool _isTooltipVisible = false;

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null || _isTooltipVisible) {
      return;
    }

    final overlay = Overlay.of(context);
    final bg = context.appTheme.generalColors.primarySurface;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, 20),
          showWhenUnlinked: false,
          child: MouseRegion(
            onEnter: (_) => _onTooltipEnter(),
            onExit: (_) => _onTooltipExit(),
            child: Container(
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: context.appTheme.generalColors.primarySurfaceBorder,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: widget.richMessage,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
    _isTooltipVisible = true;
  }

  void _removeOverlay() {
    if (_overlayEntry != null && !_isHovering) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isTooltipVisible = false;
    }
  }

  void _onTextEnter() {
    _isHovering = true;
    Future.delayed(const Duration(seconds: 1), () {
      if (_isHovering && context.mounted) {
        // ignore: use_build_context_synchronously
        _showOverlay(context);
      }
    });
  }

  void _onTextExit() {
    _isHovering = false;
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!_isHovering && context.mounted) {
        _removeOverlay();
      }
    });
  }

  void _onTooltipEnter() {
    _isHovering = true;
  }

  void _onTooltipExit() {
    _isHovering = false;
    Future.delayed(const Duration(milliseconds: 200), () {
      if (!_isHovering && context.mounted) {
        _removeOverlay();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: MouseRegion(
        cursor: SystemMouseCursors.help,
        onEnter: (_) => _onTextEnter(),
        onExit: (_) => _onTextExit(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: AppText(
                widget.labelText,
                autoSize: false,
              ),
            ),
            const Positioned(
              top: -0,
              right: 2,
              child: IgnorePointer(
                child: Icon(
                  Icons.question_mark_rounded,
                  size: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
