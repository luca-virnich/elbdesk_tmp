import 'package:flutter/widgets.dart';

class ElbFocusOrderWrapper extends StatelessWidget {
  const ElbFocusOrderWrapper({
    required this.focusOrderId,
    required this.child,
    super.key,
  });
  final double? focusOrderId;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (focusOrderId == null) {
      return child;
    }
    return FocusTraversalOrder(
      order: NumericFocusOrder(focusOrderId!),
      child: child,
    );
  }
}
