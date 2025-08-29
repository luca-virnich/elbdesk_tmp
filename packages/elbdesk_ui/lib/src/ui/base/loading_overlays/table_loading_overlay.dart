import 'dart:async';

import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const int showDelayMs = 200;

/// Minimum time the spinner must be visible once shown (in milliseconds)
/// Prevents jarring quick flashes
const int minDisplayTimeMs = 500;

class TableLoadingOverlay extends StatefulHookWidget {
  const TableLoadingOverlay({
    required this.isLoading,
    required this.child,
    super.key,
  });

  /// Delay before showing the spinner (in milliseconds)
  /// Prevents flashing for quick operations

  final bool isLoading;
  final Widget child;

  @override
  State<TableLoadingOverlay> createState() => _TableLoadingOverlayState();
}

class _TableLoadingOverlayState extends State<TableLoadingOverlay> {
  Timer? _showTimer;
  Timer? _hideTimer;
  DateTime? _spinnerShownAt;
  bool _showSpinner = false;

  @override
  void initState() {
    super.initState();
    _handleLoadingChange();
  }

  @override
  void didUpdateWidget(TableLoadingOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLoading != widget.isLoading) {
      _handleLoadingChange();
    }
  }

  void _handleLoadingChange() {
    if (widget.isLoading) {
      // Cancel hide timer if running
      _hideTimer?.cancel();
      _hideTimer = null;

      if (!_showSpinner && _showTimer == null) {
        _showTimer = Timer(const Duration(milliseconds: showDelayMs), () {
          if (mounted) {
            setState(() {
              _showSpinner = true;
              _spinnerShownAt = DateTime.now();
            });
            _showTimer = null;

            // If loading already stopped, schedule hide
            if (!widget.isLoading) {
              _scheduleHide();
            }
          }
        });
      }
    } else {
      // Loading stopped
      if (_showSpinner) {
        _scheduleHide();
      } else {
        // Cancel show timer if it hasn't fired yet
        _showTimer?.cancel();
        _showTimer = null;
      }
    }
  }

  void _scheduleHide() {
    if (_hideTimer != null) return; // Already scheduled

    final elapsed = _spinnerShownAt != null
        ? DateTime.now().difference(_spinnerShownAt!).inMilliseconds
        : 0;
    final remaining = minDisplayTimeMs - elapsed;

    if (remaining > 0) {
      _hideTimer = Timer(Duration(milliseconds: remaining), () {
        if (mounted) {
          setState(() {
            _showSpinner = false;
            _spinnerShownAt = null;
          });
          _hideTimer = null;
        }
      });
    } else {
      setState(() {
        _showSpinner = false;
        _spinnerShownAt = null;
      });
    }
  }

  @override
  void dispose() {
    _showTimer?.cancel();
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (_showSpinner)
          Positioned.fill(
            child: _LoadingSpinnerOverlay(),
          ),
      ],
    );
  }
}

class _LoadingSpinnerOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppLoadingIndicator(
        showBackground: true,
      ),
    );
  }
}
