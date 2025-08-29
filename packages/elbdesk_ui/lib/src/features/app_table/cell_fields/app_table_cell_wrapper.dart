import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

class AppTableCellWrapper extends StatelessWidget {
  const AppTableCellWrapper({
    required this.child,
    super.key,
    this.leadingIconData,
    this.leadingIconColor,
    this.tooltip,
    this.alignment = Alignment.centerLeft,
  });

  final IconData? leadingIconData;
  final Color? leadingIconColor;
  final Widget child;
  final String? tooltip;
  final Alignment alignment;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: AppTooltip(
        message: tooltip,
        child: Padding(
          padding: const EdgeInsets.only(right: 6, left: 4),
          child: leadingIconData == null
              ? child
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (leadingIconData != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 4, top: 2),
                        child: ElbIcon(
                          leadingIconData!,
                          color: leadingIconColor,
                        ),
                      ),
                    Flexible(
                      child: child,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
