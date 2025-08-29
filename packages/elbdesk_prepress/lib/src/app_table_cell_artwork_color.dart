import 'package:elbdesk_prepress/elbdesk_prepress.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/cupertino.dart';

class AppTableCellArtworkColor extends StatelessWidget {
  const AppTableCellArtworkColor({
    required this.color,
    required this.isLoading,
    super.key,
  });
  final ArtworkColor? color;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final generalColors = context.appTheme.generalColors;
    final borderRadiuses = context.appTheme.borderRadiuses;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadiuses.s),
        ),
        border: Border.all(color: generalColors.primarySurfaceBorder),
      ),
      height: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadiuses.s),
        ),
        child: AppTooltip(
          message: color?.colorName,
          child: SizedBox(
            width: 20,
            height: 20,
            child: isLoading
                ? const CupertinoActivityIndicator()
                : CustomPaint(
                    painter: _SelectedColorPainter(
                      color?.color ?? generalColors.transparent,
                      generalColors,
                    ),
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
    this.generalColors,
  );

  final Color color;

  final AppGeneralColors generalColors;

  @override
  void paint(Canvas canvas, Size size) {
    // Feste Werte für das Schachbrettmuster
    const width = 20.0;
    const height = 20.0;

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
