import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppMobilePhoneButton extends StatelessWidget {
  const AppMobilePhoneButton({required this.mobileNumber, super.key});
  final String mobileNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ElbIcon(AppIcons.mobile),
        const SizedBox(width: 5),
        AppUnderlinedTextButton(
          text: mobileNumber,
          fontSize: UiConstants.defaultFontSize,
          onPressed: () {
            UriLauncher.launchPhoneNumber(mobileNumber);
          },
        ),
      ],
    );
  }
}
