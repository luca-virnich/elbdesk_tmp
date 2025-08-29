import 'package:elbdesk_client/elbdesk_client.dart';
import 'package:elbdesk_core/elbdesk_core.dart';
import 'package:elbdesk_prepress/src/artwork_color/config/artwork_color_fields.dart';
import 'package:elbdesk_prepress/src/artwork_color/extensions/artwork_color_type_extension.dart';
import 'package:elbdesk_prepress/src/artwork_shared/config/artwork_color_table_default_columns.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_core/project_core.dart';

/// Customer Color Spec Table
///
/// The Table View for the Customer Color Spec Table
class ArtworkQuarantineColorViewTable extends HookConsumerWidget {
  const ArtworkQuarantineColorViewTable({
    required this.title,
    required this.componentIdentifier,
    required this.colors,
    super.key,
  });

  final List<ArtworkColor>? colors;
  final ComponentIdentifier componentIdentifier;
  final String title;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ppL10n = context.prepressL10n;

    // TODO(tobi): This throws an error
    return AppTableViewWithItems<ArtworkColor, ArtworkColorField>(
      tableDefaultNamePlural: ppL10n.color_plural,
      componentIdentifier: componentIdentifier.name,
      defaultTableConfig: artworkColorTableConfigQuarantineView,
      items: colors!,
      fieldFromKey: (fieldKey) =>
          ArtworkColorFields.fromFieldKey(fieldKey).value,
      buildCell: (field, item) {
        return switch (field) {
          ArtworkColorField.colorSpecType => AppTableCellText(
              item.colorSpecType?.readable(ppL10n) ?? '',
            ),
          ArtworkColorField.colorType => AppTableCellText(
              item.colorType?.readable(ppL10n) ?? '',
            ),
          ArtworkColorField.verarbeitungsEbene => AppTableCellText(
              item.verarbeitungsEbene?.readable(ppL10n) ?? '',
            ),
          ArtworkColorField.printProcess => AppTableCellText(
              item.printProcess?.readable(ppL10n) ?? '',
            ),
          ArtworkColorField.colorName => _ColorNameCell(
              color: item,
            ),
          ArtworkColorField.screenLineature => AppTableCellNum(
              item.screenLineature,
            ),
          ArtworkColorField.screenAngle => AppTableCellNum(
              item.screenAngle,
            ),
          ArtworkColorField.screenPointForm => AppTableCellText(
              item.screenPointForm,
            ),
          _ => const SizedBox.shrink(),
        };
      },
      buildCellTitle: (field) =>
          ArtworkColorFields.fromEnum(field).readable(l10n, ppL10n),
      getTitleAlignment: (field) =>
          ArtworkColorFields.fromEnum(field).cellAlignment,
      availableTableColumnsWithLabels: null,
      toolbarTrailingActions: null,
      showLoadingIndicatorOnRefresh: false,
      isHighlightable: false,
      fixedTableTitle: title,
      isSortable: false,
      showToolbarDivider: true,
      isResizable: false,
      showTableViews: false,
      selfGrowable: true,
    );
  }
}

class _ColorNameCell extends StatelessWidget {
  const _ColorNameCell({required this.color});
  final ArtworkColor color;

  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadiuses.s)),
              border: Border.all(color: const Color(0xffdddddd)),
            ),
            height: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(borderRadiuses.s)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: AppTooltip(
                      message: _buildTooltipMessage(
                        color,
                      ),
                      child: CustomPaint(
                        painter: _SelectedColorPainter(
                          color.color ??
                              context.appTheme.generalColors.transparent,
                          context,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: AppTableCellText(
              color.colorName,
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectedColorPainter extends CustomPainter {
  const _SelectedColorPainter(
    this.color,
    this.context,
  );

  final Color color;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    // Feste Werte für das Schachbrettmuster
    const width = 20.0;
    const height = 20.0;
    final generalColors = context.appTheme.generalColors;

    const chessSizeWidth = width / 2; // 15 Felder in der Breite
    const chessSizeHeight = height / 2; // 2 Felder in der Höhe

    final chessPaintB = Paint()..color = generalColors.chessBoardDarkColor;
    final chessPaintW = Paint()..color = generalColors.chessBoardLightColor;

    // Schachbrettmuster zeichnen
    List.generate((height / chessSizeHeight).round(), (int y) {
      List.generate((width / chessSizeWidth).round(), (int x) {
        canvas.drawRect(
          Offset(chessSizeWidth * x, chessSizeHeight * y) &
              const Size(chessSizeWidth, chessSizeHeight),
          (x + y) % 2 != 0 ? chessPaintW : chessPaintB,
        );
      });
    });

    // Rechteck mit übergebener Farbe füllen
    canvas.drawRect(
      const Rect.fromLTWH(
        0,
        0,
        width,
        height,
      ), // Rechteck in der Größe 200x32 px
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(covariant _SelectedColorPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}

String _buildTooltipMessage(ArtworkColor? color) {
  if (color == null) {
    return '';
  }
  if (color.colorPalette?.paletteName == null) {
    return color.colorName;
  }
  return '${color.colorPalette!.paletteName}\n${color.colorName}';
}
