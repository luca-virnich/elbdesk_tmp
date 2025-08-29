import 'package:elbdesk_ui/src/core/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class CardTablePadding extends StatelessWidget {
  const CardTablePadding({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: UiConstants.defaultPadding,
        top: UiConstants.defaultPadding,
        right: UiConstants.defaultPadding / 2,
      ),
      child: child,
    );
  }
}
