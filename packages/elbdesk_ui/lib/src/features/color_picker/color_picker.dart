import 'package:elbdesk_ui/src/features/color_picker/color_inputs.dart';
import 'package:elbdesk_ui/src/features/color_picker/palette.dart';
import 'package:flutter/material.dart';

/// The default layout of Color Picker.
class ColorPicker extends StatefulWidget {
  const ColorPicker({
    required this.initialColor,
    this.onColorChanged,
    super.key,
    this.enableAlpha = true,
    this.colorPickerWidth = 300.0,
    this.pickerAreaHeightPercent = 1.0,
    this.pickerAreaBorderRadius = BorderRadius.zero,
    this.colorHistory,
    this.onHistoryChanged,
  });

  final Color initialColor;
  final ValueChanged<Color>? onColorChanged;

  final bool enableAlpha;

  final double colorPickerWidth;
  final double pickerAreaHeightPercent;
  final BorderRadius pickerAreaBorderRadius;

  final List<Color>? colorHistory;
  final ValueChanged<List<Color>>? onHistoryChanged;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  HSVColor currentHsvColor = const HSVColor.fromAHSV(0, 0, 0, 0);

  List<Color> colorHistory = [];

  InputType inputType = InputType.hex;
  @override
  void initState() {
    super.initState();
    currentHsvColor = HSVColor.fromColor(widget.initialColor);
    if (widget.colorHistory != null && widget.onHistoryChanged != null) {
      colorHistory = widget.colorHistory ?? [];
    }
  }

  @override
  void didUpdateWidget(ColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    currentHsvColor = HSVColor.fromColor(widget.initialColor);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget colorPickerSlider(TrackType trackType) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ColorPickerSlider(
        trackType,
        currentHsvColor,
        (HSVColor color) {
          setState(() => currentHsvColor = color);
          widget.onColorChanged?.call(currentHsvColor.toColor());
        },
        displayThumbColor: true,
      ),
    );
  }

  void onColorChanging(HSVColor color) {
    setState(() => currentHsvColor = color);
    widget.onColorChanged?.call(currentHsvColor.toColor());
  }

  Widget colorPicker() {
    return ClipRRect(
      borderRadius: widget.pickerAreaBorderRadius,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ColorPickerArea(
          currentHsvColor,
          onColorChanging,
          PaletteType.hsv,
        ),
      ),
    );
  }

  Widget sliderByPaletteType() {
    return colorPickerSlider(TrackType.hue);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: widget.colorPickerWidth - 32,
          height:
              (widget.colorPickerWidth - 32) * widget.pickerAreaHeightPercent,
          child: colorPicker(),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: widget.colorPickerWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                      width: widget.colorPickerWidth,
                      child: sliderByPaletteType(),
                    ),
                    if (widget.enableAlpha)
                      SizedBox(
                        height: 40,
                        width: widget.colorPickerWidth,
                        child: colorPickerSlider(TrackType.alpha),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GestureDetector(
                  onTap: () => setState(() {
                    if (widget.onHistoryChanged != null &&
                        !colorHistory.contains(currentHsvColor.toColor())) {
                      colorHistory.add(currentHsvColor.toColor());
                      widget.onHistoryChanged!(colorHistory);
                    }
                  }),
                  child: ColorIndicator(currentHsvColor, width: 30, height: 30),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: widget.colorPickerWidth,
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 14),
            child: ColorInputs(
              color: currentHsvColor.toColor(),
              onColorChanged: onColorChanging,
              enableAlpha: widget.enableAlpha,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (colorHistory.isNotEmpty)
          SizedBox(
            width: widget.colorPickerWidth,
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (final Color color in colorHistory)
                  Padding(
                    key: Key(color.hashCode.toString()),
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                    child: Center(
                      child: GestureDetector(
                        onTap: () => onColorChanging(HSVColor.fromColor(color)),
                        child: ColorIndicator(
                          HSVColor.fromColor(color),
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }
}
