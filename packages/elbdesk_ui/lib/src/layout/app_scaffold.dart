import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A scaffold widget that provides a consistent layout structure for the app.
///
/// The [AppScaffold] widget is used to create a standard layout for the app,
/// including a body and an optional floating action button (FAB). It also
/// applies a background color based on the app's theme.
///
/// {@tool snippet}
/// This example shows how to create an [AppScaffold] with a body and a FAB:
///
/// ```dart
/// AppScaffold(
///   body: Center(child: Text('Hello, world!')),
///   fab: FloatingActionButton(
///     onPressed: () {},
///     child: Icon(Icons.add),
///   ),
/// )
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [Scaffold], which is the underlying widget used to create the layout.
///  * [FloatingActionButton], which is used for the FAB.
class AppScaffold extends StatelessWidget {
  /// Creates an [AppScaffold].
  ///
  /// The [body] parameter must not be null.
  const AppScaffold({
    required this.body,
    required this.resizeToAvoidBottomInset,
    this.fab,
    super.key,
    this.color,
  });

  /// The primary content of the scaffold.
  final Widget body;

  /// An optional floating action button to display.
  final Widget? fab;
  final Color? color;
  final bool resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    final backgroundColor = color ?? context.appTheme.generalColors.background;
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor,
      floatingActionButton: fab,
      body: body,
    );
  }
}
