import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppPhoneButton extends StatelessWidget {
  const AppPhoneButton({required this.phoneNumber, super.key});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ElbIcon(AppIcons.phone),
        const SizedBox(width: 5),
        AppUnderlinedTextButton(
          text: phoneNumber,
          fontSize: UiConstants.defaultFontSize,
          onPressed: () {
            UriLauncher.launchPhoneNumber(phoneNumber);
          },
        ),
      ],
    );
  }
}
