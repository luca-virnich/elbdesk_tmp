import 'package:flutter/material.dart';

/// A widget that represents the footer of a window.
///
/// The [AppWindowFooter] widget is used to display a footer section in a
/// window. It includes a divider and a child widget, which can be customized
/// to display any content.
///
/// {@tool snippet}
/// This example shows how to create an [AppWindowFooter] with a custom child
/// widget:
///
/// ```dart
/// AppWindowFooter(
///   child: Text('Footer content'),
/// )
/// ```
/// {@end-tool}
class AppWindowFooter extends StatelessWidget {
  /// Creates an [AppWindowFooter].
  ///
  /// The [child] parameter must not be null.
  const AppWindowFooter({required this.child, super.key});

  /// The widget to display as the content of the footer.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
