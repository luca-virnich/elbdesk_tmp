import 'package:elbdesk_ui/elbdesk_ui.dart';
import 'package:flutter/widgets.dart';

class AppCardColorPicker extends StatefulWidget {
  const AppCardColorPicker({
    required this.navigatorKey,
    required this.onChanged,
    required this.initialColor,
    required this.readOnly,
    required this.label,
    this.enableAlpha = true,
    super.key,
  });
  final GlobalKey<NavigatorState> navigatorKey;
  final void Function(Color color) onChanged;
  final Color initialColor;
  final bool readOnly;
  final bool enableAlpha;
  final String label;
  @override
  State<AppCardColorPicker> createState() => _AppCardColorPickerState();
}

class _AppCardColorPickerState extends State<AppCardColorPicker> {
  late Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: AppText(widget.label, maxLines: 1),
          ),
          const SizedBox(width: UiConstants.defaultPadding),
          AppColorPicker(
            enableAlpha: widget.enableAlpha,
            readOnly: widget.readOnly,
            navigatorKey: widget.navigatorKey,
            initialColor: widget.initialColor,
            onChanged: (color) {
              setState(() {
                currentColor = color;
              });
              widget.onChanged(color);
            },
          ),
        ],
      ),
    );
  }
}
