import 'package:flutter/widgets.dart';

class NextExcludeFocus extends StatelessWidget {
  const NextExcludeFocus({
    required this.excluding,
    required this.child,
    super.key,
  });
  final bool excluding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ExcludeFocusTraversal(
      excluding: excluding,
      child: ExcludeFocus(child: child),
    );
  }
}
