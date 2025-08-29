import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppEmailButton extends StatelessWidget {
  const AppEmailButton({required this.email, super.key});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ElbIcon(AppIcons.email),
        const SizedBox(width: 5),
        AppUnderlinedTextButton(
          text: email,
          fontSize: UiConstants.defaultFontSize,
          onPressed: () {
            UriLauncher.launchEmail(email);
          },
        ),
      ],
    );
  }
}
