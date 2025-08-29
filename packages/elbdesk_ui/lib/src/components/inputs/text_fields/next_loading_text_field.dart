import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class NextLoadingTextField extends StatelessWidget {
  const NextLoadingTextField({super.key, this.suffix});
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return NextTextField(
      readOnly: true,
      suffix: suffix,
    );
  }
}
