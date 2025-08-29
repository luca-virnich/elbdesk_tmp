import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/artwork_color/service/prepress_color_import/color_transformer/lab_calulcation.dart';
import 'package:elbdesk_prepress/src/artwork_quarantine/models/artwork_color_specification.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Was used like:
//                     // Color swatches
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Color swatches
//                           if (colors.isNotEmpty ||
//                               (colorSpecifications?.isNotEmpty ?? false))
//                             _ColorSwatches(
//                               colors: colors,
//                               colorSpecifications: colorSpecifications,
//                               maxVisible: 8,
//                             )
//                           else
//                             AppText(
//                               l10n.validation_entity_not_found(
//                                 l10n.prepress_color_plural,
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),

/// Color swatches
class ColorSwatches extends HookWidget {
  const ColorSwatches({
    required this.colors,
    required this.colorSpecifications,
    required this.maxVisible,
    super.key,
  });

  final List<ArtworkColor> colors;
  final List<ArtworkColorSpecification>? colorSpecifications;
  final int maxVisible;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = context.appTheme;

    // Memoize color swatches computation to avoid recreating on every build
    final colorSwatches = useMemoized(
      () {
        final swatches = <Widget>[];

        // Create color swatches from actual colors
        for (final color in colors.take(maxVisible)) {
          swatches.add(
            _ColorSwatch(
              color: labToColor(color.l, color.a, color.b),
              tooltip: color.colorName,
              borderColor: theme.generalColors.onPrimary,
            ),
          );
        }

        // Create color swatches from color specifications
        final remainingSlots = maxVisible - swatches.length;
        if (colorSpecifications != null && remainingSlots > 0) {
          for (final colorSpec in colorSpecifications!.take(remainingSlots)) {
            swatches.add(
              _ColorSwatch(
                color: Colors.black,
                tooltip: '${l10n.gen_not_in_db}: '
                    '${colorSpec.name ?? l10n.data_import_unknown_color}',
                borderColor: theme.statusColors.disabled,
              ),
            );
          }
        }

        return swatches;
      },
      [colors, colorSpecifications, maxVisible, theme, l10n],
    );

    // Calculate remaining count
    final totalItems = colors.length + (colorSpecifications?.length ?? 0);
    final remainingCount = totalItems - maxVisible;

    return Wrap(
      spacing: 3,
      runSpacing: 3,
      children: [
        ...colorSwatches.take(maxVisible),

        // Remaining count
        if (remainingCount > 0)
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.generalColors.primary.withAppOpacity(0.08),
                  theme.generalColors.primary.withAppOpacity(0.04),
                ],
              ),
              borderRadius: BorderRadius.circular(theme.borderRadiuses.xs),
              border: Border.all(
                color: theme.generalColors.primary.withAppOpacity(0.2),
                width: 1,
              ),
            ),
            child: Center(
              child: AppText(
                '+$remainingCount',
                style: theme.textStyles.defaultText.copyWith(
                  fontSize: 7,
                  fontWeight: FontWeight.w600,
                  color: theme.generalColors.primary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// Individual color swatch widget
class _ColorSwatch extends StatelessWidget {
  const _ColorSwatch({
    required this.color,
    required this.tooltip,
    required this.borderColor,
  });

  final Color color;
  final String tooltip;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;

    return TweenAnimationBuilder<double>(
      duration: AnimationConstants.defaultDuration,
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Tooltip(
            message: tooltip,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(theme.borderRadiuses.xs),
                border: Border.all(
                  color: borderColor,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withAppOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
