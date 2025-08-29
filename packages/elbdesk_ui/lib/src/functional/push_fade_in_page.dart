import 'package:flutter/material.dart';

Future<T?> pushFadeInPage<T>({
  required BuildContext context,
  required Widget page,
  Duration duration = Duration.zero,
}) {
  return Navigator.of(context).push<T>(
    PageRouteBuilder<T>(
      transitionDuration: duration,
      reverseTransitionDuration: duration,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}
