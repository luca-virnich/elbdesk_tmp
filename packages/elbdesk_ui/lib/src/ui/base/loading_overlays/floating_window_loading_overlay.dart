import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FloatingWindowLoadingOverlay extends HookWidget {
  const FloatingWindowLoadingOverlay({
    required this.isLoading,
    required this.child,
    super.key,
  });
  final bool isLoading;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        if (isLoading) {
          // Remove focus from any currently focused widget
          FocusManager.instance.primaryFocus?.unfocus();
        }
        return null;
      },
      [isLoading],
    );

    // Wrap child in AbsorbPointer and FocusScope when loading
    if (isLoading) {
      return FocusScope(
        canRequestFocus: false,
        child: AbsorbPointer(
          absorbing: true,
          child: child,
        ),
      );
    }

    return child;
  }
}
