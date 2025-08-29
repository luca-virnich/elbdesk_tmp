import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppKeyboardKeySymbol extends StatelessWidget {
  const AppKeyboardKeySymbol(
      {required this.keySign, this.description, super.key});
  final String keySign;
  final String? description;

  @override
  Widget build(BuildContext context) {
    if (description == null) {
      return _Button(keySign: keySign);
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _Button(keySign: keySign),
        AppText(description!),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({required this.keySign});
  final String keySign;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;

    final secondaryBorder = context.appTheme.buttonStyles.secondary.borderColor;
    return SizedBox(
      height: 24,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 28),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          margin: const EdgeInsets.only(right: 4),
          decoration: BoxDecoration(
            color: generalColors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: secondaryBorder,
            ),
          ),
          child: AppText(
            keySign,
            textAlign: TextAlign.center,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
