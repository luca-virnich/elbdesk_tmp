import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class CardSectionTitle extends StatelessWidget {
  const CardSectionTitle({
    required this.title,
    this.trailingWidgets,
    this.setTrailingPadding = false,
    this.leadingIcon,
    super.key,
  });
  final Widget? leadingIcon;

  final String title;
  final List<Widget>? trailingWidgets;
  final bool setTrailingPadding;

  @override
  Widget build(BuildContext context) {
    final dividerColor = context.appTheme.generalColors.titleDivider;
    return Padding(
      padding: EdgeInsets.only(
        right: setTrailingPadding ? UiConstants.defaultPadding : 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(minHeight: UiConstants.buttonHeight),
            child: Row(
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon!,
                  const SizedBox(width: UiConstants.elementMargin),
                ],
                Expanded(
                  child: AppText(
                    title,
                    style: context.appTheme.textStyles.h1,
                    maxLines: 1,
                  ),
                ),
                if (trailingWidgets != null) ...[
                  const SizedBox(width: UiConstants.defaultPadding),
                  ...trailingWidgets!,
                ],
              ],
            ),
          ),
          AppDivider(height: 16, color: dividerColor),
        ],
      ),
    );
  }
}
