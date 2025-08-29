import 'package:flutter/material.dart';

/// InheritedWidget to provide mobile state down the widget tree
class MobileState extends InheritedWidget {
  const MobileState({
    super.key,
    required this.isMobile,
    required this.mobileBreakpoint,
    required super.child,
  });

  final bool isMobile;
  final double mobileBreakpoint;

  static MobileState? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MobileState>();
  }

  static MobileState of(BuildContext context) {
    final MobileState? result = maybeOf(context);
    assert(result != null, 'No MobileState found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(MobileState oldWidget) {
    return isMobile != oldWidget.isMobile || 
           mobileBreakpoint != oldWidget.mobileBreakpoint;
  }
}