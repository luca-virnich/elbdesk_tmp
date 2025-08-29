import 'package:elbdesk_core/l10n/l10n_extension.dart';
import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/features/color_picker/color_picker.dart';
import 'package:flutter/material.dart';

class AppColorPicker extends StatelessWidget {
  const AppColorPicker({
    required this.navigatorKey,
    required this.initialColor,
    required this.onChanged,
    required this.readOnly,
    this.enableAlpha = true,
    this.child,
    this.width = 300,
    this.selectButtonLabel = 'Select Color',
    super.key,
  });
  final GlobalKey<NavigatorState>? navigatorKey;
  final Color initialColor;
  final ValueChanged<Color> onChanged;
  final Widget? child;
  final double width;
  final String selectButtonLabel;
  final bool readOnly;
  final bool enableAlpha;
  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    return InkWell(
      onTap: readOnly
          ? null
          : () async {
              final c = await showElbDialog<Color?>(
                navigatorKey: navigatorKey,
                context: context,
                isDismissible: true,
                child: AppColorPickerDialog(
                  initialColor: initialColor,
                  width: width,
                  enableAlpha: enableAlpha,
                ),
              );
              if (c != null) {
                onChanged(c);
              }
            },
      child: child ??
          Container(
            width: 100,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadiuses.s)),
              border: Border.all(color: const Color(0xffdddddd)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(borderRadiuses.s)),
              child: CustomPaint(
                painter: _SelectedColorPainter(initialColor, context),
              ),
            ),
          ),
    );
  }
}

class AppColorPickerDialog extends StatefulWidget {
  const AppColorPickerDialog({
    required this.initialColor,
    required this.width,
    required this.enableAlpha,
    super.key,
  });
  final Color initialColor;
  final double width;
  final bool enableAlpha;
  @override
  State<AppColorPickerDialog> createState() => _AppColorPickerDialogState();
}

class _AppColorPickerDialogState extends State<AppColorPickerDialog> {
  Color? _color;

  @override
  void initState() {
    super.initState();
    _color = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    final borderRadiuses = context.appTheme.borderRadiuses;
    final l10n = context.l10n;
    return ElbAlertDialog(
      titleText: '',
      minWidth: widget.width,
      maxWidth: widget.width,
      onSaveAndCloseShortcut: () {
        Navigator.of(context).pop(_color);
      },
      actions: [
        AppButton.primary(
          onPressed: () {
            Navigator.of(context).pop(_color);
          },
          label: l10n.gen_apply,
        ),
      ],
      child: ColorPicker(
        pickerAreaBorderRadius: BorderRadius.circular(borderRadiuses.s),
        enableAlpha: widget.enableAlpha,
        initialColor: widget.initialColor,
        colorPickerWidth: widget.width,
        pickerAreaHeightPercent: 0.6,
        onColorChanged: (color) {
          _color = color;
        },
      ),
    );
  }
}

class _SelectedColorPainter extends CustomPainter {
  const _SelectedColorPainter(this.color, this.context);

  final Color color;
  final BuildContext context;
  @override
  void paint(Canvas canvas, Size size) {
    final generalColors = context.appTheme.generalColors;

    final chessSize = Size(size.width / 10, size.height / 3);
    final chessPaintB = Paint()..color = generalColors.chessBoardDarkColor;
    final chessPaintW = Paint()..color = generalColors.chessBoardLightColor;
    List.generate((size.height / chessSize.height).round(), (int y) {
      List.generate((size.width / chessSize.width).round(), (int x) {
        canvas.drawRect(
          Offset(chessSize.width * x, chessSize.height * y) & chessSize,
          (x + y) % 2 != 0 ? chessPaintW : chessPaintB,
        );
      });
    });

    canvas.drawRect(
      const Rect.fromLTWH(0, 0, 100, 30),
      Paint()
        ..color = color
        ..style = PaintingStyle.fill,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
