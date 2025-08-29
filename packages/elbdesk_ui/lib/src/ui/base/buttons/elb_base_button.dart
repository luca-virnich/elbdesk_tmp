import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Constants
const int _kButtonAnimationDuration = 120;
const int _kPressedAnimationDelay = 50;
const double _kDefaultHorizontalPadding = 12;
const double _kBorderWidth = 1;

/// Represents the visual state of a button.
enum ElbButtonState { normal, hovered, pressed, focused, disabled }

/// A function that resolves a value based on button states.
typedef StateResolver<T> = T Function(Set<ElbButtonState> states);

/// A property that can have different values based on button states.
class StateProperty<T> {
  const StateProperty(this._resolver);
  final StateResolver<T> _resolver;

  T resolve(Set<ElbButtonState> states) => _resolver(states);

  static StateProperty<T> all<T>(T value) => StateProperty<T>((_) => value);
}

/// Base button widget that provides core button functionality.
///
/// This widget handles:
/// - State management (hover, pressed, focused, disabled)
/// - Animations and visual feedback
/// - Accessibility features
/// - Tooltip support
class ElbBaseButton extends StatefulWidget {
  const ElbBaseButton({
    required this.child,
    required this.backgroundColor,
    required this.backgroundColorDisabled,
    required this.backgroundColorOnHover,
    required this.foregroundColorDisabled,
    required this.foregroundColorOnHover,
    required this.borderColorDisabled,
    required this.borderColorOnHover,
    required this.foregroundColor,
    required this.borderColor,
    required this.overlayColor,
    required this.overlayColorPressed,
    this.onPressed,
    this.isLoading = false,
    this.focusNode,
    this.tooltip,
    this.padding = const EdgeInsets.symmetric(
      horizontal: _kDefaultHorizontalPadding,
    ),
    this.borderRadius,
    this.showLeftBorder = true,
    this.showRightBorder = true,
    this.buttonHeight,
    this.expand = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final FocusNode? focusNode;
  final String? tooltip;
  final EdgeInsetsGeometry padding;
  final double? borderRadius;
  final bool showLeftBorder;
  final bool showRightBorder;
  final double? buttonHeight;
  final Color foregroundColor;
  final Color borderColor;
  final Color borderColorOnHover;
  final Color overlayColor;
  final Color backgroundColor;
  final Color backgroundColorDisabled;
  final Color backgroundColorOnHover;
  final Color foregroundColorDisabled;
  final Color foregroundColorOnHover;
  final Color borderColorDisabled;
  final Color overlayColorPressed;
  final bool expand;

  @override
  State<ElbBaseButton> createState() => _ElbBaseButtonState();
}

class _ElbBaseButtonState extends State<ElbBaseButton>
    with SingleTickerProviderStateMixin {
  final Set<ElbButtonState> _states = {ElbButtonState.normal};
  late FocusNode _focusNode;
  late AnimationController _pressController;

  // Cache resolved colors to avoid recalculating on every build
  late Color _currentBackgroundColor;
  late Color _currentBorderColor;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();

    _pressController = AnimationController(
      duration: const Duration(milliseconds: _kPressedAnimationDelay),
      vsync: this,
    );

    if (_isDisabled) {
      _states.add(ElbButtonState.disabled);
    }

    _updateResolvedColors();
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    _pressController.dispose();
    super.dispose();
  }

  void _updateState(ElbButtonState state, bool add) {
    if (add && !_states.contains(state)) {
      setState(() {
        _states.add(state);
        _updateResolvedColors();
      });
    } else if (!add && _states.contains(state)) {
      setState(() {
        _states.remove(state);
        _updateResolvedColors();
      });
    }
  }

  void _updateResolvedColors() {
    _currentBackgroundColor = _resolveBackgroundColor();
    _currentBorderColor = _resolveBorderColor();
  }

  Color _resolveBackgroundColor() {
    if (_states.contains(ElbButtonState.disabled)) {
      return widget.backgroundColorDisabled;
    }
    if (_states.contains(ElbButtonState.pressed)) {
      return widget.overlayColorPressed;
    }
    if (_states.contains(ElbButtonState.hovered) ||
        _states.contains(ElbButtonState.focused)) {
      return widget.overlayColor;
    }
    return widget.backgroundColor;
  }

  Color _resolveBorderColor() {
    if (_states.contains(ElbButtonState.disabled)) {
      return widget.borderColorDisabled;
    }
    if (_states.contains(ElbButtonState.hovered) ||
        _states.contains(ElbButtonState.focused)) {
      return widget.borderColorOnHover;
    }
    return widget.borderColor;
  }

  bool get _isDisabled => widget.onPressed == null || widget.isLoading;

  @override
  void didUpdateWidget(covariant ElbBaseButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update disabled state if needed
    final disabled = _isDisabled;
    final wasDisabled = _states.contains(ElbButtonState.disabled);

    if (disabled != wasDisabled) {
      setState(() {
        if (disabled) {
          _states.add(ElbButtonState.disabled);
        } else {
          _states.remove(ElbButtonState.disabled);
        }
        _updateResolvedColors();
      });
    } else if (oldWidget.backgroundColor != widget.backgroundColor ||
        oldWidget.foregroundColor != widget.foregroundColor ||
        oldWidget.borderColor != widget.borderColor) {
      // Update colors if they changed
      setState(_updateResolvedColors);
    }
  }

  void _handleTap() {
    if (_isDisabled) return;
    widget.onPressed!();
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorderRadius = widget.borderRadius ?? 0;

    // Build button content with animation
    Widget buttonContent = AnimatedContainer(
      duration: const Duration(milliseconds: _kButtonAnimationDuration),
      height: widget.buttonHeight,
      padding: widget.padding,
      decoration: BoxDecoration(
        color: _currentBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: widget.showLeftBorder
              ? Radius.circular(effectiveBorderRadius)
              : Radius.zero,
          bottomLeft: widget.showLeftBorder
              ? Radius.circular(effectiveBorderRadius)
              : Radius.zero,
          topRight: widget.showRightBorder
              ? Radius.circular(effectiveBorderRadius)
              : Radius.zero,
          bottomRight: widget.showRightBorder
              ? Radius.circular(effectiveBorderRadius)
              : Radius.zero,
        ),
        border: Border.all(
          color: _currentBorderColor,
          width: _kBorderWidth,
        ),
      ),
      child: widget.child,
    );

    // Add semantics
    buttonContent = Semantics(
      button: true,
      enabled: !_isDisabled,
      label: widget.tooltip,
      child: buttonContent,
    );

    // Add interactivity
    final interactiveButton = RepaintBoundary(
      child: FocusableActionDetector(
        focusNode: _focusNode,
        enabled: !_isDisabled,
        mouseCursor: _isDisabled
            ? SystemMouseCursors.forbidden
            : SystemMouseCursors.click,
        onShowHoverHighlight: (hovering) =>
            _updateState(ElbButtonState.hovered, hovering),
        onShowFocusHighlight: (focusing) =>
            _updateState(ElbButtonState.focused, focusing),
        shortcuts: _isDisabled
            ? null
            : {
                LogicalKeySet(LogicalKeyboardKey.enter): const _ActivateIntent(),
                LogicalKeySet(LogicalKeyboardKey.space): const _ActivateIntent(),
              },
        actions: _isDisabled
            ? null
            : {
                _ActivateIntent: CallbackAction<_ActivateIntent>(
                  onInvoke: (_) {
                    _handleTap();
                    return null;
                  },
                ),
              },
        child: GestureDetector(
          onTapDown: _isDisabled
              ? null
              : (_) {
                  _updateState(ElbButtonState.pressed, true);
                  _pressController.forward();
                },
          onTapUp: _isDisabled
              ? null
              : (_) {
                  // Keep pressed state visible briefly
                  _pressController.reverse().then((_) {
                    if (mounted) {
                      _updateState(ElbButtonState.pressed, false);
                    }
                  });
                },
          onTapCancel: _isDisabled
              ? null
              : () {
                  _pressController.reverse();
                  _updateState(ElbButtonState.pressed, false);
                },
          onTap: _isDisabled ? null : _handleTap,
          child: buttonContent,
        ),
      ),
    );

    // Wrap in UnconstrainedBox to prevent expanding in parent widgets
    final result = widget.expand
        ? interactiveButton
        : UnconstrainedBox(child: interactiveButton);

    // Add tooltip if provided
    if (widget.tooltip != null && widget.tooltip!.isNotEmpty) {
      return AppTooltip(
        message: widget.tooltip,
        preferBelow: false,
        child: result,
      );
    }

    return result;
  }
}

class _ActivateIntent extends Intent {
  const _ActivateIntent();
}
