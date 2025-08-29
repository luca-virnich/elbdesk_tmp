part of 'floating_card_body.dart';

/// A widget that prevents unnecessary layout updates to its child when not
/// visible.
///
/// This widget is particularly useful in multi-page or tabbed interfaces where
/// content that is not currently visible should not respond to constraint
/// changes.
///
/// ## How it works
///
/// When [isVisible] is `false`, the widget caches the last known constraints
/// and continues to use them for layout, preventing the child widget from
/// receiving new constraint updates. This is especially beneficial for widgets
/// like [LayoutBuilder] that rebuild whenever constraints change.
///
/// When [isVisible] becomes `true` again, the widget immediately performs a new
/// layout with the current constraints to ensure the child is properly sized.
///
/// ## Benefits
///
/// - **Performance**: Prevents unnecessary rebuilds of complex widget trees
/// - **State preservation**: Helps maintain scroll positions and other state
/// - **Resource efficiency**: Reduces CPU usage for hidden content
///
/// ## Example usage
///
/// ```dart
/// ConstraintBlocker(
///   isVisible: currentTabIndex == myTabIndex,
///   child: LayoutBuilder(
///     builder: (context, constraints) {
///       // This builder won't be called when the tab is not visible
///       return MyResponsiveWidget(constraints: constraints);
///     },
///   ),
/// )
/// ```
class ConstraintBlocker extends SingleChildRenderObjectWidget {
  const ConstraintBlocker({
    required this.isVisible,
    required super.child,
    super.key,
  });

  final bool isVisible;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderConstraintBlocker(isVisible: isVisible);
  }

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderConstraintBlocker renderObject,
  ) {
    renderObject.isVisible = isVisible;
  }
}

class _RenderConstraintBlocker extends RenderProxyBox {
  _RenderConstraintBlocker({required bool isVisible}) : _isVisible = isVisible;

  bool _isVisible;
  BoxConstraints? _lastConstraints;

  bool get isVisible => _isVisible;
  set isVisible(bool value) {
    if (_isVisible != value) {
      _isVisible = value;
      if (_isVisible) {
        // When becoming visible, force a layout with current constraints
        markNeedsLayout();
      }
    }
  }

  @override
  void performLayout() {
    if (child != null) {
      if (_isVisible || _lastConstraints == null) {
        // If visible or first time, use actual constraints
        _lastConstraints = constraints;
        child!.layout(_lastConstraints!, parentUsesSize: true);
        size = child!.size;
      } else {
        // If not visible, use cached constraints to prevent updates
        child!.layout(_lastConstraints!, parentUsesSize: true);
        size = child!.size;
      }
    } else {
      size = constraints.smallest;
    }
  }
}
