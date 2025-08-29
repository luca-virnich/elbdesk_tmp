import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_prepress/src/app_table_cell_artwork_color.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/cupertino.dart';

class AppTableCellArtworkColors extends StatelessWidget {
  const AppTableCellArtworkColors({
    required this.colors,
    super.key,
  });
  final List<ArtworkColor> colors;

  @override
  Widget build(BuildContext context) {
    return AppTableCellWrapper(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          const colorSize = 20.0;
          const spacing = 4.0;
          const ellipsisWidth = 12.0; // Approximate width of '...'
          final maxColors =
              ((maxWidth - ellipsisWidth + spacing) / (colorSize + spacing))
                  .floor();

          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                colors.length > maxColors ? maxColors - 1 : colors.length,
                (i) => Padding(
                  padding: const EdgeInsets.only(right: spacing),
                  child: AppTableCellArtworkColor(
                    color: colors[i],
                    isLoading: false,
                  ),
                ),
              ),
              if (colors.length > maxColors)
                const Text(
                  '...',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
