import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';

/// A tile widget for displaying sub-entities within a card.
///
/// Provides a consistent layout with a clickable title, content area,
/// and optional delete action.
class AppCardTile extends StatelessWidget {
  const AppCardTile({
    required this.title,
    required this.onTitleTap,
    required this.content,
    this.leadingIcon,
    this.onDelete,
    this.trailing,
    this.onTitleShiftPressed,
    super.key,
  });

  /// The title text to display in the underlined button
  final String title;

  /// Callback when the title is tapped
  /// If null, the title will be displayed as regular text instead of a button
  final VoidCallback? onTitleTap;

  /// The main content widget below the title
  final Widget content;

  /// Optional icon to display before the title
  final Widget? leadingIcon;

  /// Optional callback to enable delete functionality
  final VoidCallback? onDelete;

  /// Optional trailing widgets to display after the delete button
  final List<Widget>? trailing;

  /// Optional callback to enable shift functionality
  final VoidCallback? onTitleShiftPressed;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;
    final buttonStyles = context.appTheme.buttonStyles;
    final textStyles = context.appTheme.textStyles;

    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        color: generalColors.background,
        // Light border for subtle card-like appearance
        border: Border.all(
          color: generalColors.primarySurfaceBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadiuses.m),
      ),
      padding: const EdgeInsets.all(AppSpace.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Leading icon if provided
              if (leadingIcon != null) ...[
                leadingIcon!,
                const SizedBox(width: UiConstants.elementMargin),
              ],

              // Title in Expanded widget with overflow handling
              Expanded(
                child: onTitleTap != null
                    ? AppUnderlinedTextButton(
                        text: title,
                        onPressed: onTitleTap,
                        onShiftPressed: onTitleShiftPressed,
                        maxLines: 1,
                      )
                    : AppText(
                        title,
                        style: textStyles.h2,
                        color: generalColors.onBackground,
                        maxLines: 1,
                      ),
              ),

              // Trailing widgets in fixed position
              if (trailing != null) ...[
                const SizedBox(width: AppSpace.s),
                ...trailing!,
              ],

              // Delete button in fixed position
              if (onDelete != null) ...[
                const SizedBox(width: AppSpace.s),
                AppIconButton.danger(
                  tooltip: l10n.gen_remove,
                  iconData: AppIcons.delete,
                  skipTraversal: true,
                  color: buttonStyles.secondary.foregroundColor,
                  onPressed: onDelete,
                  colorOnHover: buttonStyles.danger.foregroundColor,
                  overlayColor: buttonStyles.secondary.overlayColor,
                ),
              ],
            ],
          ),
          content,
        ],
      ),
    );
  }
}
