import 'package:elbdesk_ui/src/core/theme/extensions/build_context_extension.dart';
import 'package:elbdesk_ui/src/features/app_table/cell_fields/app_table_cell_wrapper.dart';
import 'package:flutter/material.dart';

class AppTableCellColor extends StatelessWidget {
  /// Creates an [AppTableCellColor].
  ///
  const AppTableCellColor(
    this.color, {
    this.alignment = Alignment.centerLeft,
    this.tooltip,
    super.key,
  });

  /// The text to display in the table cell.
  final Color color;

  /// The alignment of the text within the widget.
  final Alignment alignment;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    return AppTableCellWrapper(
      alignment: alignment,
      tooltip: tooltip,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiuses.s),
          ),
          border: Border.all(color: const Color(0xffdddddd)),
        ),
        height: 20,
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadiuses.s),
          ),
          child: SizedBox(
            width: 150,
            height: 20,
            child: CustomPaint(
              painter: _SelectedColorPainter(color, context),
            ),
          ),
        ),
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
    const width = 150.0;
    const height = 20.0;

    const chessSizeWidth = width / 15; // 15 Felder in der Breite
    const chessSizeHeight = height / 2; // 2 Felder in der Höhe

    final generalColors = context.appTheme.generalColors;
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
