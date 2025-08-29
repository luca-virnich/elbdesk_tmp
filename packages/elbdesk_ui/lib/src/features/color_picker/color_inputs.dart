import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:elbdesk_ui/src/features/color_picker/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum InputType {
  hex,
  rgb,
  hsl,
}

class ColorInputs extends HookWidget {
  const ColorInputs({
    required this.color,
    required this.onColorChanged,
    required this.enableAlpha,
    super.key,
  });

  final Color color;

  final void Function(HSVColor) onColorChanged;
  final bool enableAlpha;

  @override
  Widget build(BuildContext context) {
    final inputType = useState(InputType.hex);
    final hexInputController = useTextEditingController();
    final rgbRedInputController = useTextEditingController();
    final rgbGreenInputController = useTextEditingController();
    final rgbBlueInputController = useTextEditingController();
    final rgbAlphaInputController = useTextEditingController();
    final hslHueInputController = useTextEditingController();
    final hslSaturationInputController = useTextEditingController();
    final hslLightnessInputController = useTextEditingController();
    final hslAlphaInputController = useTextEditingController();
    final hexFocus = useFocusNode();
    final rgbRedFocus = useFocusNode();
    final rgbGreenFocus = useFocusNode();
    final rgbBlueFocus = useFocusNode();
    final rgbAlphaFocus = useFocusNode();
    final hslHueFocus = useFocusNode();
    final hslSaturationFocus = useFocusNode();
    final hslLightnessFocus = useFocusNode();
    final hslAlphaFocus = useFocusNode();
    useEffect(
      () {
        if (!hexFocus.hasFocus) {
          hexInputController.text = colorToHex(
            color,
            includeHashSign: true,
            enableAlpha: enableAlpha,
          );
        }
        if (!rgbRedFocus.hasFocus &&
            !rgbGreenFocus.hasFocus &&
            !rgbBlueFocus.hasFocus) {
          final (red, green, blue, alpha) = colorToRgb(color);
          rgbRedInputController.text = red;
          rgbGreenInputController.text = green;
          rgbBlueInputController.text = blue;
          rgbAlphaInputController.text = alpha;
        }
        if (!hslHueFocus.hasFocus &&
            !hslSaturationFocus.hasFocus &&
            !hslLightnessFocus.hasFocus) {
          final hsvC = HSVColor.fromColor(color);
          final hslColor = hsvToHsl(hsvC);
          hslHueInputController.text = hslColor.hue.round().toString();
          hslSaturationInputController.text =
              (hslColor.saturation * 100).round().toString();
          hslLightnessInputController.text =
              (hslColor.lightness * 100).round().toString();
          hslAlphaInputController.text = (hsvC.alpha * 100).round().toString();
        }
        return null;
      },
      [color],
    );

    late Widget input;

    if (inputType.value == InputType.hex) {
      input = SizedBox(
        child: AppRawTextField(
          labelText: 'HEX',
          focusNode: hexFocus,
          controller: hexInputController,
          onChanged: (value) {
            final color = colorFromHex(value, enableAlpha: false);
            if (color != null) {
              final hsvColor = HSVColor.fromColor(color);
              onColorChanged.call(hsvColor);
            }
          },
        ),
      );
    }
    if (inputType.value == InputType.rgb) {
      input = SizedBox(
        child: Row(
          children: [
            Expanded(
              child: AppRawTextField(
                labelText: 'R',
                focusNode: rgbRedFocus,
                controller: rgbRedInputController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RgbRedInputFormatter(),
                ],
                onChanged: (value) {
                  final red = int.tryParse(rgbRedInputController.text);
                  final green = int.tryParse(rgbGreenInputController.text);
                  final blue = int.tryParse(rgbBlueInputController.text);
                  final alpha = int.tryParse(rgbAlphaInputController.text);
                  if (red == null ||
                      green == null ||
                      blue == null ||
                      alpha == null) {
                    return;
                  }
                  final color = colorFromRgb(red, green, blue, alpha);

                  final hsvColor = HSVColor.fromColor(color);
                  onColorChanged.call(hsvColor);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppRawTextField(
                labelText: 'G',
                focusNode: rgbGreenFocus,
                controller: rgbGreenInputController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RgbGreenInputFormatter(),
                ],
                onChanged: (value) {
                  final red = int.tryParse(rgbRedInputController.text);
                  final green = int.tryParse(rgbGreenInputController.text);
                  final blue = int.tryParse(rgbBlueInputController.text);
                  final alpha = int.tryParse(rgbAlphaInputController.text);
                  if (red == null ||
                      green == null ||
                      blue == null ||
                      alpha == null) {
                    return;
                  }
                  final color = colorFromRgb(red, green, blue, alpha);

                  final hsvColor = HSVColor.fromColor(color);
                  onColorChanged.call(hsvColor);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppRawTextField(
                labelText: 'B',
                focusNode: rgbBlueFocus,
                controller: rgbBlueInputController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RgbBlueInputFormatter(),
                ],
                onChanged: (value) {
                  final red = int.tryParse(rgbRedInputController.text);
                  final green = int.tryParse(rgbGreenInputController.text);
                  final blue = int.tryParse(rgbBlueInputController.text);
                  final alpha = int.tryParse(rgbAlphaInputController.text);
                  if (red == null ||
                      green == null ||
                      blue == null ||
                      alpha == null) {
                    return;
                  }
                  final color = colorFromRgb(red, green, blue, alpha);

                  final hsvColor = HSVColor.fromColor(color);
                  onColorChanged.call(hsvColor);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AbsorbPointer(
                absorbing: !enableAlpha,
                child: AppRawTextField(
                  readOnly: !enableAlpha,
                  labelText: '%',
                  focusNode: rgbAlphaFocus,
                  controller: rgbAlphaInputController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    AlphaInputFormatter(),
                  ],
                  onChanged: (value) {
                    final red = int.tryParse(rgbRedInputController.text);
                    final green = int.tryParse(rgbGreenInputController.text);
                    final blue = int.tryParse(rgbBlueInputController.text);
                    final alpha = int.tryParse(rgbAlphaInputController.text);
                    if (red == null ||
                        green == null ||
                        blue == null ||
                        alpha == null) {
                      return;
                    }
                    final color = colorFromRgb(red, green, blue, alpha);

                    final hsvColor = HSVColor.fromColor(color);
                    onColorChanged.call(hsvColor);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
    if (inputType.value == InputType.hsl) {
      input = SizedBox(
        child: Row(
          children: [
            Expanded(
              child: AppRawTextField(
                labelText: 'H',
                focusNode: hslHueFocus,
                controller: hslHueInputController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  HslInputFormatter(min: 0, max: 360),
                ],
                onChanged: (value) {
                  final hue = int.tryParse(hslHueInputController.text);
                  final saturation =
                      int.tryParse(hslSaturationInputController.text);
                  final lightness =
                      int.tryParse(hslLightnessInputController.text);
                  final alpha = int.tryParse(hslAlphaInputController.text);
                  if (hue == null ||
                      saturation == null ||
                      lightness == null ||
                      alpha == null) {
                    return;
                  }
                  final color = colorFromHsl(hue, saturation, lightness, alpha);
                  final hsvColor = HSVColor.fromColor(color);
                  onColorChanged.call(hsvColor);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppRawTextField(
                labelText: 'S',
                focusNode: hslSaturationFocus,
                controller: hslSaturationInputController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  HslSaturationInputFormatter(),
                ],
                onChanged: (value) {
                  final hue = int.tryParse(hslHueInputController.text);
                  final saturation =
                      int.tryParse(hslSaturationInputController.text);
                  final lightness =
                      int.tryParse(hslLightnessInputController.text);
                  final alpha = int.tryParse(hslAlphaInputController.text);
                  if (hue == null ||
                      saturation == null ||
                      lightness == null ||
                      alpha == null) {
                    return;
                  }
                  final color = colorFromHsl(hue, saturation, lightness, alpha);
                  final hsvColor = HSVColor.fromColor(color);
                  onColorChanged.call(hsvColor);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppRawTextField(
                labelText: 'L',
                focusNode: hslLightnessFocus,
                controller: hslLightnessInputController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  HslLightnessInputFormatter(),
                ],
                onChanged: (value) {
                  final hue = int.tryParse(hslHueInputController.text);
                  final saturation =
                      int.tryParse(hslSaturationInputController.text);
                  final lightness =
                      int.tryParse(hslLightnessInputController.text);
                  final alpha = int.tryParse(hslAlphaInputController.text);
                  if (hue == null ||
                      saturation == null ||
                      lightness == null ||
                      alpha == null) {
                    return;
                  }
                  final color = colorFromHsl(hue, saturation, lightness, alpha);
                  final hsvColor = HSVColor.fromColor(color);
                  onColorChanged.call(hsvColor);
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AbsorbPointer(
                absorbing: !enableAlpha,
                child: AppRawTextField(
                  readOnly: !enableAlpha,
                  labelText: '%',
                  focusNode: hslAlphaFocus,
                  controller: hslAlphaInputController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    AlphaInputFormatter(),
                  ],
                  onChanged: (value) {
                    final hue = int.tryParse(hslHueInputController.text);
                    final saturation =
                        int.tryParse(hslSaturationInputController.text);
                    final lightness =
                        int.tryParse(hslLightnessInputController.text);
                    final alpha = int.tryParse(hslAlphaInputController.text);
                    if (hue == null ||
                        saturation == null ||
                        lightness == null ||
                        alpha == null) {
                      return;
                    }
                    final color =
                        colorFromHsl(hue, saturation, lightness, alpha);
                    final hsvColor = HSVColor.fromColor(color);
                    onColorChanged.call(hsvColor);
                  },
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Row(
      children: [
        Expanded(
          child: input,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 4),
          child: AppIconButton.secondary(
            color: context.appTheme.generalColors.primary,
            iconData: Icons.swap_horiz,
            onPressed: () {
              final newValue = switch (inputType.value) {
                InputType.hex => InputType.hsl,
                InputType.hsl => InputType.rgb,
                InputType.rgb => InputType.hex,
              };
              inputType.value = newValue;
            },
          ),
        ),
      ],
    );
  }
}

class HslInputFormatter extends TextInputFormatter {
  HslInputFormatter({this.min = 0.0, this.max = 360.0});
  final double min;
  final double max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newText = newValue.text;

    // Entfernt alle nicht-numerischen Zeichen
    newText = newText.replaceAll(RegExp('[^0-9.]'), '');

    // Wenn der Text leer ist, zurückgeben
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Wenn der Text eine Zahl ist, validieren
    var value = double.tryParse(newText);
    if (value == null) {
      return newValue;
    }

    // Überprüfen, ob der Wert im erlaubten Bereich liegt
    if (value < min) {
      value = min;
    } else if (value > max) {
      value = max;
    }

    // Formatierte Zahl als Text zurückgeben
    return newValue.copyWith(
      text: value.toStringAsFixed(0),
      selection:
          TextSelection.collapsed(offset: value.toStringAsFixed(0).length),
    );
  }
}

class HslSaturationInputFormatter extends HslInputFormatter {
  HslSaturationInputFormatter() : super(min: 0, max: 100);
}

class HslLightnessInputFormatter extends HslInputFormatter {
  HslLightnessInputFormatter() : super(min: 0, max: 100);
}

class RgbInputFormatter extends TextInputFormatter {
  RgbInputFormatter({this.min = 0, this.max = 255});
  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var newText = newValue.text;

    // Entfernt alle nicht-numerischen Zeichen
    newText = newText.replaceAll(RegExp('[^0-9]'), '');

    // Wenn der Text leer ist, zurückgeben
    if (newText.isEmpty) {
      return newValue.copyWith(text: '');
    }

    // Wenn der Text eine Zahl ist, validieren
    var value = int.tryParse(newText);
    if (value == null) {
      return newValue;
    }

    // Überprüfen, ob der Wert im erlaubten Bereich liegt
    if (value < min) {
      value = min;
    } else if (value > max) {
      value = max;
    }

    // Formatierte Zahl als Text zurückgeben
    return newValue.copyWith(
      text: value.toString(),
      selection: TextSelection.collapsed(offset: value.toString().length),
    );
  }
}

class RgbRedInputFormatter extends RgbInputFormatter {
  RgbRedInputFormatter() : super(min: 0, max: 255);
}

class RgbGreenInputFormatter extends RgbInputFormatter {
  RgbGreenInputFormatter() : super(min: 0, max: 255);
}

class RgbBlueInputFormatter extends RgbInputFormatter {
  RgbBlueInputFormatter() : super(min: 0, max: 255);
}

class AlphaInputFormatter extends RgbInputFormatter {
  AlphaInputFormatter() : super(min: 0, max: 100);
}
