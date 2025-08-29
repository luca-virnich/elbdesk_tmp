import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class InWindowBody extends StatelessWidget {
  const InWindowBody({
    required this.child,
    required this.footer,
    super.key,
  });
  final Widget child;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(child: child),
        const AppDivider(),
        footer,
      ],
    );
  }
}
